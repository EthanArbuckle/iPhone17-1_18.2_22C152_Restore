@interface ASContact
+ (id)contactWithCodableContact:(id)a3;
- (ASCodableShareLocations)pendingLegacyShareLocations;
- (ASContact)contactWithKeys:(id)a3;
- (ASContact)init;
- (ASContact)initWithRelationship:(id)a3 remoteRelationship:(id)a4;
- (ASRelationship)relationship;
- (ASRelationship)remoteRelationship;
- (ASRelationshipStorage)relationshipStorage;
- (ASSecureCloudShareItem)pendingRelationshipShareItem;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContact:(id)a3;
- (NSSet)destinations;
- (NSString)displayName;
- (NSString)fullName;
- (NSString)linkedContactStoreIdentifier;
- (NSString)primaryDestinationForMessaging;
- (NSString)shortName;
- (NSUUID)UUID;
- (id)_bestDestinationForContact:(id)a3;
- (id)_bestDestinationFromKnownDestinations;
- (id)codableContactIncludingCloudKitFields:(BOOL)a3;
- (id)contactStore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)fullDescription;
- (unint64_t)cloudType;
- (void)UUID;
- (void)_bestDestinationFromKnownDestinations;
- (void)primaryDestinationForMessaging;
- (void)setContactStore:(id)a3;
- (void)setDestinations:(id)a3;
- (void)setFullName:(id)a3;
- (void)setLinkedContactStoreIdentifier:(id)a3;
- (void)setPendingLegacyShareLocations:(id)a3;
- (void)setPendingRelationshipShareItem:(id)a3;
- (void)setRelationship:(id)a3;
- (void)setRelationshipStorage:(id)a3;
- (void)setRemoteRelationship:(id)a3;
- (void)setShortName:(id)a3;
@end

@implementation ASContact

- (id)codableContactIncludingCloudKitFields:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = objc_alloc_init(ASCodableContact);
  v6 = [(ASContact *)self linkedContactStoreIdentifier];
  [(ASCodableContact *)v5 setLinkedContactStoreIdentifier:v6];

  v7 = [(ASContact *)self fullName];
  [(ASCodableContact *)v5 setFullName:v7];

  v8 = [(ASContact *)self shortName];
  [(ASCodableContact *)v5 setShortName:v8];

  v9 = [(ASContact *)self destinations];
  v10 = [v9 allObjects];
  v11 = (void *)[v10 mutableCopy];
  [(ASCodableContact *)v5 setDestinations:v11];

  if (ASSecureCloudEnabled())
  {
    v12 = [(ASContact *)self pendingRelationshipShareItem];

    if (v12)
    {
      v13 = (void *)MEMORY[0x263F08910];
      v14 = [(ASContact *)self pendingRelationshipShareItem];
      v15 = [v13 archivedDataWithRootObject:v14 requiringSecureCoding:1 error:0];
      [(ASCodableContact *)v5 setPendingRelationshipShareItem:v15];
    }
    v16 = [(ASContact *)self pendingLegacyShareLocations];

    if (v16)
    {
      v17 = [(ASContact *)self pendingLegacyShareLocations];
      v18 = [v17 data];
      [(ASCodableContact *)v5 setPendingLegacyShareLocations:v18];
    }
  }
  v19 = [(ASContact *)self relationshipStorage];
  v20 = [v19 codableRelationshipStorageIncludingCloudKitFields:v3];
  [(ASCodableContact *)v5 setRelationshipStorage:v20];

  v21 = [(ASContact *)self relationshipStorage];
  v22 = [v21 legacyRelationship];
  v23 = [v22 codableRelationshipContainerIncludingCloudKitFields:v3];
  [(ASCodableContact *)v5 setRelationshipContainer:v23];

  v24 = [(ASContact *)self relationshipStorage];
  v25 = [v24 legacyRemoteRelationship];
  v26 = [v25 codableRelationshipContainerIncludingCloudKitFields:v3];
  [(ASCodableContact *)v5 setRemoteRelationshipContainer:v26];

  return v5;
}

+ (id)contactWithCodableContact:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_alloc_init(ASContact);
  v5 = [v3 linkedContactStoreIdentifier];
  [(ASContact *)v4 setLinkedContactStoreIdentifier:v5];

  v6 = [v3 fullName];
  [(ASContact *)v4 setFullName:v6];

  v7 = [v3 shortName];
  [(ASContact *)v4 setShortName:v7];

  v8 = [v3 destinations];
  v9 = ASConsolidateAddresses(v8);
  [(ASContact *)v4 setDestinations:v9];

  if (ASSecureCloudEnabled())
  {
    v10 = (objc_class *)objc_opt_class();
    v11 = [v3 pendingRelationshipShareItem];
    v12 = ASSecureUnarchiveClassWithDataAndStrictness(v10, v11, 1);
    [(ASContact *)v4 setPendingRelationshipShareItem:v12];

    if ([v3 hasPendingLegacyShareLocations])
    {
      v13 = [ASCodableShareLocations alloc];
      v14 = [v3 pendingLegacyShareLocations];
      v15 = [(ASCodableShareLocations *)v13 initWithData:v14];
      [(ASContact *)v4 setPendingLegacyShareLocations:v15];
    }
    else
    {
      [(ASContact *)v4 setPendingLegacyShareLocations:0];
    }
  }
  if ([v3 hasRelationshipStorage])
  {
    v16 = [v3 relationshipStorage];
    v17 = +[ASRelationshipStorage relationshipStorageWithCodableRelationshipStorage:v16];
    [(ASContact *)v4 setRelationshipStorage:v17];
  }
  else
  {
    v18 = objc_alloc_init(ASRelationshipStorage);
    v19 = [v3 relationshipContainer];

    if (v19)
    {
      v20 = [v3 relationshipContainer];
      v21 = +[ASRelationship relationshipWithCodableRelationshipContainer:v20];
      [(ASRelationshipStorage *)v18 setLegacyRelationship:v21];
    }
    v22 = [v3 remoteRelationshipContainer];

    if (v22)
    {
      v23 = [v3 remoteRelationshipContainer];
      v24 = +[ASRelationship relationshipWithCodableRelationshipContainer:v23];
      [(ASRelationshipStorage *)v18 setLegacyRemoteRelationship:v24];
    }
    v16 = [(ASRelationshipStorage *)v18 storageWithSynchronizedRelationshipIdentifiers];

    [(ASContact *)v4 setRelationshipStorage:v16];
    ASLoggingInitialize();
    v25 = ASLogRelationships;
    if (os_log_type_enabled((os_log_t)ASLogRelationships, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 138412290;
      v28 = v16;
      _os_log_impl(&dword_21EC60000, v25, OS_LOG_TYPE_DEFAULT, "Migrated relationships to storage %@", (uint8_t *)&v27, 0xCu);
    }
  }

  return v4;
}

- (ASContact)initWithRelationship:(id)a3 remoteRelationship:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASContact;
  v8 = [(ASContact *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263EFFA08] set];
    destinations = v8->_destinations;
    v8->_destinations = (NSSet *)v9;

    v11 = [[ASRelationshipStorage alloc] initWithRelationship:v6 remoteRelationship:v7];
    relationshipStorage = v8->_relationshipStorage;
    v8->_relationshipStorage = v11;
  }
  return v8;
}

- (ASContact)init
{
  id v3 = objc_alloc_init(ASRelationship);
  v4 = objc_alloc_init(ASRelationship);
  v5 = [(ASContact *)self initWithRelationship:v3 remoteRelationship:v4];

  return v5;
}

- (id)description
{
  id v3 = NSString;
  v4 = [(ASContact *)self UUID];
  long long v9 = *(_OWORD *)&self->_linkedContactStoreIdentifier;
  shortName = self->_shortName;
  id v6 = [(ASContact *)self displayName];
  id v7 = [v3 stringWithFormat:@"Contact uuid=%@ contactStoreId=%@ fullName=%@ shortName=%@ displayName=%@ destinations=%@", v4, v9, shortName, v6, self->_destinations];

  return v7;
}

- (id)fullDescription
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  fullName = self->_fullName;
  v5 = [(ASContact *)self UUID];
  [v3 appendFormat:@"-------- Contact - %@ (%@) --------\n", fullName, v5];

  [v3 appendFormat:@"Full Name: %@\n", self->_fullName];
  [v3 appendFormat:@"Short Name: %@\n", self->_shortName];
  id v6 = [(ASContact *)self displayName];
  [v3 appendFormat:@"Display Name: %@\n", v6];

  [v3 appendFormat:@"Destinations: %@\n", self->_destinations];
  id v7 = [(ASContact *)self primaryDestinationForMessaging];
  [v3 appendFormat:@"Primary Destination For Messaging: %@\n", v7];

  v8 = NSStringFromASCloudType([(ASContact *)self cloudType]);
  [v3 appendFormat:@"Cloud Type: %@\n", v8];

  long long v9 = [(ASContact *)self pendingRelationshipShareItem];
  [v3 appendFormat:@"Pending Secure Cloud Share Item: %@\n", v9];

  v10 = [(ASContact *)self pendingLegacyShareLocations];
  [v3 appendFormat:@"Pending Legacy Share Locations: %@\n", v10];

  v11 = (void *)[v3 copy];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ASContact *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(ASContact *)self isEqualToContact:v4];
  }

  return v5;
}

- (BOOL)isEqualToContact:(id)a3
{
  id v4 = a3;
  linkedContactStoreIdentifier = self->_linkedContactStoreIdentifier;
  id v6 = [v4 linkedContactStoreIdentifier];
  if (ASStringsAreEqual(linkedContactStoreIdentifier, v6))
  {
    fullName = self->_fullName;
    v8 = [v4 fullName];
    if (ASStringsAreEqual(fullName, v8))
    {
      shortName = self->_shortName;
      v10 = [v4 shortName];
      if (ASStringsAreEqual(shortName, v10))
      {
        destinations = self->_destinations;
        v12 = [v4 destinations];
        if ([(NSSet *)destinations isEqualToSet:v12])
        {
          relationshipStorage = self->_relationshipStorage;
          objc_super v14 = [v4 relationshipStorage];
          if ([(ASRelationshipStorage *)relationshipStorage isEqualToRelationshipStorage:v14])
          {
            pendingRelationshipShareItem = self->_pendingRelationshipShareItem;
            v16 = [v4 pendingRelationshipShareItem];
            if (ASObjectsAreEqualOrNil((unint64_t)pendingRelationshipShareItem, (unint64_t)v16))
            {
              pendingLegacyShareLocations = self->_pendingLegacyShareLocations;
              v18 = [v4 pendingLegacyShareLocations];
              char v19 = ASObjectsAreEqualOrNil((unint64_t)pendingLegacyShareLocations, (unint64_t)v18);
            }
            else
            {
              char v19 = 0;
            }
          }
          else
          {
            char v19 = 0;
          }
        }
        else
        {
          char v19 = 0;
        }
      }
      else
      {
        char v19 = 0;
      }
    }
    else
    {
      char v19 = 0;
    }
  }
  else
  {
    char v19 = 0;
  }

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v5 + 16), self->_linkedContactStoreIdentifier);
  objc_storeStrong((id *)(v5 + 24), self->_fullName);
  objc_storeStrong((id *)(v5 + 32), self->_shortName);
  uint64_t v6 = [(NSSet *)self->_destinations copyWithZone:a3];
  id v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  id v8 = [(ASRelationshipStorage *)self->_relationshipStorage copyWithZone:a3];
  long long v9 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v8;

  objc_storeStrong((id *)(v5 + 48), self->_pendingRelationshipShareItem);
  objc_storeStrong((id *)(v5 + 56), self->_pendingLegacyShareLocations);
  return (id)v5;
}

- (NSUUID)UUID
{
  if (ASSecureCloudEnabled())
  {
    id v3 = [(ASRelationshipStorage *)self->_relationshipStorage legacyRelationship];
    id v4 = [v3 UUID];
    uint64_t v5 = [(ASRelationshipStorage *)self->_relationshipStorage secureCloudRelationship];
    uint64_t v6 = [v5 UUID];
    char v7 = [v4 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      ASLoggingInitialize();
      id v8 = ASLogDefault;
      if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_ERROR)) {
        [(ASContact *)(uint64_t *)&self->_relationshipStorage UUID];
      }
    }
  }
  long long v9 = [(ASRelationshipStorage *)self->_relationshipStorage primaryRelationship];
  v10 = [v9 UUID];

  return (NSUUID *)v10;
}

- (NSString)displayName
{
  if ([(NSString *)self->_shortName length])
  {
    shortName = self->_shortName;
LABEL_5:
    id v4 = shortName;
    goto LABEL_6;
  }
  if ([(NSString *)self->_fullName length])
  {
    shortName = self->_fullName;
    goto LABEL_5;
  }
  uint64_t v6 = [(ASRelationshipStorage *)self->_relationshipStorage primaryRelationship];
  char v7 = [v6 preferredReachableAddress];

  id v8 = [(ASRelationshipStorage *)self->_relationshipStorage primaryRelationship];
  long long v9 = [v8 cloudKitAddress];

  if (!v9)
  {
    if (!v7)
    {
      uint64_t v12 = [(NSSet *)self->_destinations anyObject];
      v13 = (void *)v12;
      objc_super v14 = &stru_26D045AA8;
      if (v12) {
        objc_super v14 = (__CFString *)v12;
      }
      id v4 = v14;

      goto LABEL_16;
    }
    goto LABEL_14;
  }
  if (ASDestinationIsMako(v9, v10) && v7)
  {
LABEL_14:
    v11 = v7;
    goto LABEL_15;
  }
  v11 = v9;
LABEL_15:
  id v4 = v11;
LABEL_16:

LABEL_6:

  return (NSString *)v4;
}

- (void)setContactStore:(id)a3
{
}

- (id)contactStore
{
  return self->_contactStore;
}

- (NSString)primaryDestinationForMessaging
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  id v3 = (void *)ASLogDefault;
  if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    uint64_t v5 = [(ASContact *)self UUID];
    *(_DWORD *)buf = 138543618;
    v17 = v5;
    __int16 v18 = 2112;
    char v19 = self;
    _os_log_impl(&dword_21EC60000, v4, OS_LOG_TYPE_DEFAULT, "Looking for primary destination for messaging for contact %{public}@ - %@", buf, 0x16u);
  }
  uint64_t v6 = *MEMORY[0x263EFE070];
  v15[0] = *MEMORY[0x263EFDF80];
  v15[1] = v6;
  char v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  id v8 = [(ASContact *)self contactWithKeys:v7];

  if (!v8) {
    goto LABEL_12;
  }
  ASLoggingInitialize();
  long long v9 = ASLogDefault;
  if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EC60000, v9, OS_LOG_TYPE_DEFAULT, "Found linked contact, choosing best destination", buf, 2u);
  }
  v10 = [(ASContact *)self _bestDestinationForContact:v8];
  ASLoggingInitialize();
  v11 = ASLogDefault;
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_ERROR)) {
      [(ASContact *)v11 primaryDestinationForMessaging];
    }
LABEL_12:
    uint64_t v12 = [(ASContact *)self _bestDestinationFromKnownDestinations];
    v10 = v12;
    goto LABEL_13;
  }
  if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EC60000, v11, OS_LOG_TYPE_DEFAULT, "Found a destination on linked contact, sanitizing", buf, 2u);
  }
  uint64_t v12 = v10;
LABEL_13:
  v13 = ASContactSanitizedDestination(v12);

  return (NSString *)v13;
}

- (ASContact)contactWithKeys:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ASContact *)self linkedContactStoreIdentifier];

  if (v5)
  {
    id v6 = [(ASContact *)self contactStore];
    if (!v6) {
      id v6 = objc_alloc_init(MEMORY[0x263EFEA58]);
    }
    char v7 = [(ASContact *)self linkedContactStoreIdentifier];
    id v13 = 0;
    id v8 = [v6 unifiedContactWithIdentifier:v7 keysToFetch:v4 error:&v13];
    id v9 = v13;

    if (!v8 || v9)
    {
      ASLoggingInitialize();
      v10 = (void *)ASLogDefault;
      if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_ERROR)) {
        [(ASContact *)v10 contactWithKeys:(uint64_t)v9];
      }
    }
  }
  else
  {
    ASLoggingInitialize();
    v11 = (void *)ASLogDefault;
    if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_ERROR)) {
      -[ASContact contactWithKeys:](v11, self);
    }
    id v8 = 0;
  }

  return (ASContact *)v8;
}

- (id)_bestDestinationFromKnownDestinations
{
  ASLoggingInitialize();
  id v3 = ASLogDefault;
  if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EC60000, v3, OS_LOG_TYPE_DEFAULT, "Choosing the best destination from known relationship destinations", buf, 2u);
  }
  id v4 = [(ASRelationshipStorage *)self->_relationshipStorage primaryRelationship];
  uint64_t v5 = [v4 preferredReachableAddress];
  if (!v5)
  {
    ASLoggingInitialize();
    id v6 = ASLogDefault;
    if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_21EC60000, v6, OS_LOG_TYPE_DEFAULT, "No preferred reachable address, falling back to CloudKit address", v10, 2u);
    }
    uint64_t v5 = [v4 cloudKitAddress];
    if (!v5)
    {
      ASLoggingInitialize();
      char v7 = ASLogDefault;
      if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_ERROR)) {
        -[ASContact _bestDestinationFromKnownDestinations](v7);
      }
      id v8 = [(ASContact *)self destinations];
      uint64_t v5 = [v8 anyObject];
    }
  }

  return v5;
}

- (id)_bestDestinationForContact:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a3;
  ASLoggingInitialize();
  id v6 = (void *)ASLogDefault;
  if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    char v7 = v6;
    id v8 = [(ASContact *)self displayName];
    *(_DWORD *)buf = 138412290;
    v35 = v8;
    _os_log_impl(&dword_21EC60000, v7, OS_LOG_TYPE_DEFAULT, "Looking for best destination for CNContact: %@", buf, 0xCu);
  }
  id v9 = [v5 phoneNumbers];
  v10 = objc_msgSend(v9, "hk_map:", &__block_literal_global_4);

  v11 = [(ASRelationshipStorage *)self->_relationshipStorage primaryRelationship];
  uint64_t v12 = [v11 preferredReachableAddress];
  if (v12)
  {
    id v13 = [v11 preferredReachableAddress];
    v33 = v13;
    id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
    objc_super v14 = _FindIntersectingDestination(v10, v3);
  }
  else
  {
    objc_super v14 = _FindIntersectingDestination(v10, MEMORY[0x263EFFA68]);
  }

  if (v14)
  {
    ASLoggingInitialize();
    v15 = ASLogDefault;
    if (!os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 138412290;
    v35 = v14;
    v16 = "Found a phone number that matches preferredReachableAddress, selecting: %@";
LABEL_15:
    _os_log_impl(&dword_21EC60000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);
    goto LABEL_16;
  }
  v17 = [v11 addresses];
  __int16 v18 = [v17 allObjects];
  objc_super v14 = _FindIntersectingDestination(v10, v18);

  if (v14)
  {
    ASLoggingInitialize();
    v15 = ASLogDefault;
    if (!os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 138412290;
    v35 = v14;
    v16 = "Found a phone number that matches the address set, selecting: %@";
    goto LABEL_15;
  }
  if ([v10 count])
  {
    objc_super v14 = [v10 firstObject];
    ASLoggingInitialize();
    v15 = ASLogDefault;
    if (!os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 138412290;
    v35 = v14;
    v16 = "Has a non-matching phone number, selecting: %@";
    goto LABEL_15;
  }
  ASLoggingInitialize();
  uint64_t v20 = ASLogDefault;
  if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EC60000, v20, OS_LOG_TYPE_DEFAULT, "Contact has no phone numbers, looking for email addresses", buf, 2u);
  }
  v21 = [v5 emailAddresses];
  v22 = objc_msgSend(v21, "hk_map:", &__block_literal_global_322);

  v23 = [v11 preferredReachableAddress];
  if (v23)
  {
    id v3 = [v11 preferredReachableAddress];
    v32 = v3;
    v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
    objc_super v14 = _FindIntersectingDestination(v22, v24);
  }
  else
  {
    objc_super v14 = _FindIntersectingDestination(v22, MEMORY[0x263EFFA68]);
  }

  if (v14)
  {
    ASLoggingInitialize();
    v25 = ASLogDefault;
    if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v14;
      v26 = "Found email that matches preferredReachableAddress, selecting: %@";
LABEL_41:
      _os_log_impl(&dword_21EC60000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, 0xCu);
    }
  }
  else
  {
    int v27 = [v11 cloudKitAddress];
    if (v27)
    {
      id v3 = [v11 cloudKitAddress];
      v31 = v3;
      v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v31 count:1];
    }
    else
    {
      v28 = (void *)MEMORY[0x263EFFA68];
    }
    objc_super v14 = _FindIntersectingDestination(v22, v28);
    if (v27)
    {
    }
    if (v14)
    {
      ASLoggingInitialize();
      v25 = ASLogDefault;
      if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v14;
        v26 = "Found email that matches the CloudKitAddress, selecting: %@";
        goto LABEL_41;
      }
    }
    else
    {
      uint64_t v29 = [v11 addresses];
      v30 = [v29 allObjects];
      objc_super v14 = _FindIntersectingDestination(v22, v30);

      if (v14)
      {
        ASLoggingInitialize();
        v25 = ASLogDefault;
        if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v14;
          v26 = "Found email that matches the address set, selecting: %@";
          goto LABEL_41;
        }
      }
      else
      {
        if (![v22 count])
        {
          objc_super v14 = 0;
          goto LABEL_42;
        }
        objc_super v14 = [v22 firstObject];
        ASLoggingInitialize();
        v25 = ASLogDefault;
        if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v14;
          v26 = "Has a non-matching email, selecting: %@";
          goto LABEL_41;
        }
      }
    }
  }
LABEL_42:

LABEL_16:

  return v14;
}

id __40__ASContact__bestDestinationForContact___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 value];
  id v3 = [v2 stringValue];

  return v3;
}

uint64_t __40__ASContact__bestDestinationForContact___block_invoke_320(uint64_t a1, void *a2)
{
  return [a2 value];
}

- (ASRelationship)relationship
{
  return [(ASRelationshipStorage *)self->_relationshipStorage primaryRelationship];
}

- (ASRelationship)remoteRelationship
{
  return [(ASRelationshipStorage *)self->_relationshipStorage primaryRemoteRelationship];
}

- (unint64_t)cloudType
{
  v2 = [(ASRelationshipStorage *)self->_relationshipStorage primaryRelationship];
  unint64_t v3 = [v2 cloudType];

  return v3;
}

- (void)setRelationshipStorage:(id)a3
{
}

- (NSString)linkedContactStoreIdentifier
{
  return self->_linkedContactStoreIdentifier;
}

- (void)setLinkedContactStoreIdentifier:(id)a3
{
}

- (NSString)fullName
{
  return self->_fullName;
}

- (void)setFullName:(id)a3
{
}

- (NSString)shortName
{
  return self->_shortName;
}

- (void)setShortName:(id)a3
{
}

- (NSSet)destinations
{
  return self->_destinations;
}

- (void)setDestinations:(id)a3
{
}

- (ASSecureCloudShareItem)pendingRelationshipShareItem
{
  return self->_pendingRelationshipShareItem;
}

- (void)setPendingRelationshipShareItem:(id)a3
{
}

- (ASCodableShareLocations)pendingLegacyShareLocations
{
  return self->_pendingLegacyShareLocations;
}

- (void)setPendingLegacyShareLocations:(id)a3
{
}

- (ASRelationshipStorage)relationshipStorage
{
  return self->_relationshipStorage;
}

- (void)setRelationship:(id)a3
{
}

- (void)setRemoteRelationship:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteRelationship, 0);
  objc_storeStrong((id *)&self->_relationship, 0);
  objc_storeStrong((id *)&self->_relationshipStorage, 0);
  objc_storeStrong((id *)&self->_pendingLegacyShareLocations, 0);
  objc_storeStrong((id *)&self->_pendingRelationshipShareItem, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_shortName, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_linkedContactStoreIdentifier, 0);

  objc_storeStrong((id *)&self->_contactStore, 0);
}

- (void)UUID
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_21EC60000, a2, OS_LOG_TYPE_ERROR, "Relationship storage has mismatched UUIDs: %@", (uint8_t *)&v3, 0xCu);
}

- (void)primaryDestinationForMessaging
{
  id v3 = a1;
  uint64_t v4 = [a2 linkedContactStoreIdentifier];
  OUTLINED_FUNCTION_3(&dword_21EC60000, v5, v6, "Found a CNContactStore entry with no known destinations for ID: %@", v7, v8, v9, v10, 2u);
}

- (void)contactWithKeys:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 UUID];
  OUTLINED_FUNCTION_3(&dword_21EC60000, v5, v6, "Cannot fetch contact record for friend with UUID: %@", v7, v8, v9, v10, 2u);
}

- (void)contactWithKeys:(uint64_t)a3 .cold.2(void *a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  uint64_t v6 = [a2 linkedContactStoreIdentifier];
  int v7 = 138412546;
  uint64_t v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a3;
  _os_log_error_impl(&dword_21EC60000, v5, OS_LOG_TYPE_ERROR, "Error fetching contact %@, error: %@", (uint8_t *)&v7, 0x16u);
}

- (void)_bestDestinationFromKnownDestinations
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21EC60000, log, OS_LOG_TYPE_ERROR, "No CloudKit address, falling back to any arbitrary known address", v1, 2u);
}

@end