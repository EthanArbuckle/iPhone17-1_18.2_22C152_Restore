@interface ASRelationshipStorage
+ (ASRelationshipStorage)relationshipStorageWithCodableRelationshipStorage:(id)a3;
- (ASRelationship)legacyRelationship;
- (ASRelationship)legacyRemoteRelationship;
- (ASRelationship)primaryRelationship;
- (ASRelationship)primaryRemoteRelationship;
- (ASRelationship)secureCloudRelationship;
- (ASRelationship)secureCloudRemoteRelationship;
- (ASRelationshipStorage)init;
- (ASRelationshipStorage)initWithRelationship:(id)a3 remoteRelationship:(id)a4;
- (ASRelationshipStorage)storageWithSynchronizedRelationshipIdentifiers;
- (BOOL)isEqualToRelationshipStorage:(id)a3;
- (id)_chosePrimaryRelationshipWithSecureCloudRelationship:(id)a3 legacyRelationship:(id)a4;
- (id)codableRelationshipStorageIncludingCloudKitFields:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)fullDescription;
- (id)relationshipForCloudType:(unint64_t)a3;
- (id)remoteRelationshipForCloudType:(unint64_t)a3;
- (void)setLegacyRelationship:(id)a3;
- (void)setLegacyRemoteRelationship:(id)a3;
- (void)setSecureCloudRelationship:(id)a3;
- (void)setSecureCloudRemoteRelationship:(id)a3;
- (void)updateRelationship:(id)a3 cloudType:(unint64_t)a4;
- (void)updateRemoteRelationship:(id)a3 cloudType:(unint64_t)a4;
@end

@implementation ASRelationshipStorage

- (id)codableRelationshipStorageIncludingCloudKitFields:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = objc_alloc_init(ASCodableRelationshipStorage);
  v6 = [(ASRelationshipStorage *)self legacyRelationship];
  v7 = [v6 codableRelationshipContainerIncludingCloudKitFields:v3];
  [(ASCodableRelationshipStorage *)v5 setLegacyRelationshipContainer:v7];

  v8 = [(ASRelationshipStorage *)self legacyRemoteRelationship];
  v9 = [v8 codableRelationshipContainerIncludingCloudKitFields:v3];
  [(ASCodableRelationshipStorage *)v5 setLegacyRemoteRelationshipContainer:v9];

  v10 = [(ASRelationshipStorage *)self secureCloudRelationship];
  v11 = [v10 codableRelationshipContainerIncludingCloudKitFields:v3];
  [(ASCodableRelationshipStorage *)v5 setSecureCloudRelationshipContainer:v11];

  v12 = [(ASRelationshipStorage *)self secureCloudRemoteRelationship];
  v13 = [v12 codableRelationshipContainerIncludingCloudKitFields:v3];
  [(ASCodableRelationshipStorage *)v5 setSecureCloudRemoteRelationshipContainer:v13];

  return v5;
}

+ (ASRelationshipStorage)relationshipStorageWithCodableRelationshipStorage:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(ASRelationshipStorage);
  v5 = [v3 legacyRelationshipContainer];
  v6 = +[ASRelationship relationshipWithCodableRelationshipContainer:v5];
  [(ASRelationshipStorage *)v4 setLegacyRelationship:v6];

  v7 = [v3 legacyRemoteRelationshipContainer];
  v8 = +[ASRelationship relationshipWithCodableRelationshipContainer:v7];
  [(ASRelationshipStorage *)v4 setLegacyRemoteRelationship:v8];

  v9 = [v3 secureCloudRelationshipContainer];
  v10 = +[ASRelationship relationshipWithCodableRelationshipContainer:v9];
  [(ASRelationshipStorage *)v4 setSecureCloudRelationship:v10];

  v11 = [v3 secureCloudRemoteRelationshipContainer];

  v12 = +[ASRelationship relationshipWithCodableRelationshipContainer:v11];
  [(ASRelationshipStorage *)v4 setSecureCloudRemoteRelationship:v12];

  return v4;
}

- (ASRelationshipStorage)init
{
  id v3 = objc_alloc_init(ASRelationship);
  v4 = objc_alloc_init(ASRelationship);
  v5 = [(ASRelationshipStorage *)self initWithRelationship:v3 remoteRelationship:v4];

  return v5;
}

- (ASRelationshipStorage)initWithRelationship:(id)a3 remoteRelationship:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ASRelationshipStorage;
  v9 = [(ASRelationshipStorage *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_legacyRelationship, a3);
    objc_storeStrong((id *)&v10->_legacyRemoteRelationship, a4);
    v11 = (ASRelationship *)[v7 copy];
    v12 = (ASRelationship *)[v8 copy];
    [(ASRelationship *)v11 setCloudType:1];
    [(ASRelationship *)v12 setCloudType:1];
    secureCloudRelationship = v10->_secureCloudRelationship;
    v10->_secureCloudRelationship = v11;
    v14 = v11;

    secureCloudRemoteRelationship = v10->_secureCloudRemoteRelationship;
    v10->_secureCloudRemoteRelationship = v12;
  }
  return v10;
}

- (id)description
{
  id v3 = [(ASRelationshipStorage *)self primaryRelationship];
  uint64_t v4 = [v3 cloudType];

  v5 = [(ASRelationshipStorage *)self primaryRemoteRelationship];
  uint64_t v6 = [v5 cloudType];

  if (v4) {
    id v7 = &stru_26D045AA8;
  }
  else {
    id v7 = @" (PRIMARY)";
  }
  if (v4) {
    id v8 = @" (PRIMARY)";
  }
  else {
    id v8 = &stru_26D045AA8;
  }
  if (v6) {
    v9 = &stru_26D045AA8;
  }
  else {
    v9 = @" (PRIMARY)";
  }
  if (v6) {
    v10 = @" (PRIMARY)";
  }
  else {
    v10 = &stru_26D045AA8;
  }
  v11 = NSString;
  legacyRelationship = self->_legacyRelationship;
  legacyRemoteRelationship = self->_legacyRemoteRelationship;
  secureCloudRelationship = self->_secureCloudRelationship;
  secureCloudRemoteRelationship = self->_secureCloudRemoteRelationship;
  v16 = v8;
  objc_super v17 = v9;
  v18 = v7;
  v19 = [v11 stringWithFormat:@"ASRelationshipStorage:\nLEGACY LOCAL%@: %@\nLEGACY REMOTE%@: %@\nSECURE CLOUD LOCAL%@: %@\nSECURE CLOUD REMOTE%@: %@", v18, legacyRelationship, v17, legacyRemoteRelationship, v16, secureCloudRelationship, v10, secureCloudRemoteRelationship];

  return v19;
}

- (id)fullDescription
{
  id v3 = [(ASRelationshipStorage *)self primaryRelationship];
  uint64_t v4 = [v3 cloudType];

  v5 = [(ASRelationshipStorage *)self primaryRemoteRelationship];
  uint64_t v6 = [v5 cloudType];

  id v7 = &stru_26D045AA8;
  if (v4) {
    id v8 = &stru_26D045AA8;
  }
  else {
    id v8 = @" (PRIMARY)";
  }
  if (v4) {
    v9 = @" (PRIMARY)";
  }
  else {
    v9 = &stru_26D045AA8;
  }
  if (v6) {
    v10 = &stru_26D045AA8;
  }
  else {
    v10 = @" (PRIMARY)";
  }
  if (v6) {
    id v7 = @" (PRIMARY)";
  }
  v11 = (objc_class *)MEMORY[0x263F089D8];
  v12 = v7;
  v13 = v9;
  v14 = v10;
  v15 = v8;
  id v16 = objc_alloc_init(v11);
  [v16 appendFormat:@"-------- Relationship Storage --------\n"];
  objc_super v17 = [(ASRelationship *)self->_legacyRelationship fullDescription];
  [v16 appendFormat:@"LEGACY LOCAL%@: \n%@\n", v15, v17];

  v18 = [(ASRelationship *)self->_legacyRemoteRelationship fullDescription];
  [v16 appendFormat:@"LEGACY REMOTE%@: \n%@\n", v14, v18];

  v19 = [(ASRelationship *)self->_secureCloudRelationship fullDescription];
  [v16 appendFormat:@"SECURE CLOUD LOCAL%@: \n%@\n", v13, v19];

  v20 = [(ASRelationship *)self->_secureCloudRemoteRelationship fullDescription];
  [v16 appendFormat:@"SECURE CLOUD REMOTE%@: \n%@\n", v12, v20];

  v21 = (void *)[v16 copy];

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(ASRelationship *)self->_legacyRelationship copyWithZone:a3];
  id v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(ASRelationship *)self->_legacyRemoteRelationship copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(ASRelationship *)self->_secureCloudRelationship copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  id v12 = [(ASRelationship *)self->_secureCloudRemoteRelationship copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (BOOL)isEqualToRelationshipStorage:(id)a3
{
  id v4 = a3;
  legacyRelationship = self->_legacyRelationship;
  id v6 = [v4 legacyRelationship];
  if ([(ASRelationship *)legacyRelationship isEqualToRelationship:v6])
  {
    legacyRemoteRelationship = self->_legacyRemoteRelationship;
    id v8 = [v4 legacyRemoteRelationship];
    if ([(ASRelationship *)legacyRemoteRelationship isEqualToRelationship:v8])
    {
      secureCloudRelationship = self->_secureCloudRelationship;
      id v10 = [v4 secureCloudRelationship];
      if ([(ASRelationship *)secureCloudRelationship isEqualToRelationship:v10])
      {
        secureCloudRemoteRelationship = self->_secureCloudRemoteRelationship;
        id v12 = [v4 secureCloudRemoteRelationship];
        BOOL v13 = [(ASRelationship *)secureCloudRemoteRelationship isEqualToRelationship:v12];
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (ASRelationship)primaryRelationship
{
  id v3 = [(ASRelationshipStorage *)self secureCloudRelationship];
  id v4 = [(ASRelationshipStorage *)self legacyRelationship];
  v5 = [(ASRelationshipStorage *)self _chosePrimaryRelationshipWithSecureCloudRelationship:v3 legacyRelationship:v4];

  return (ASRelationship *)v5;
}

- (ASRelationship)primaryRemoteRelationship
{
  id v3 = [(ASRelationshipStorage *)self secureCloudRemoteRelationship];
  id v4 = [(ASRelationshipStorage *)self legacyRemoteRelationship];
  v5 = [(ASRelationshipStorage *)self _chosePrimaryRelationshipWithSecureCloudRelationship:v3 legacyRelationship:v4];

  return (ASRelationship *)v5;
}

- (id)_chosePrimaryRelationshipWithSecureCloudRelationship:(id)a3 legacyRelationship:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 dateForLatestRelationshipStart];
  id v8 = [v6 dateForLatestRelationshipEnd];
  v9 = [v5 dateForLatestRelationshipStart];
  id v10 = [v5 dateForLatestRelationshipEnd];
  if (([v5 isFriendshipActive] & 1) == 0
    && ([v5 hasInviteRequestEvent] & 1) == 0
    && [v6 isFriendshipActive]
    && objc_msgSend(v10, "hk_isAfterOrEqualToDate:", v7))
  {
    v11 = v5;
LABEL_11:
    id v12 = (void *)[v11 copy];
    goto LABEL_37;
  }
  if (([v6 isFriendshipActive] & 1) == 0
    && ([v6 hasInviteRequestEvent] & 1) == 0
    && [v5 isFriendshipActive]
    && objc_msgSend(v8, "hk_isAfterOrEqualToDate:", v9))
  {
    v11 = v6;
    goto LABEL_11;
  }
  BOOL v13 = [v6 dateForLatestDowngradeCompleted];
  v14 = [v5 dateForLatestMigrationCompleted];
  if ([v5 isFriendshipActive]
    && [v5 secureCloudMigrationCompleted]
    && (!v8 || objc_msgSend(v9, "hk_isAfterOrEqualToDate:", v8))
    && (!v13 || objc_msgSend(v14, "hk_isAfterOrEqualToDate:", v13)))
  {
    v15 = v5;
  }
  else
  {
    if (![v6 isFriendshipActive])
    {
      v27 = v7;
      id v16 = [v5 dateForLatestInviteRequestEvent];
      objc_super v17 = v16;
      if (v16)
      {
        id v18 = v16;
      }
      else
      {
        id v18 = [MEMORY[0x263EFF910] distantPast];
      }
      v19 = v18;

      v20 = [v6 dateForLatestInviteRequestEvent];
      v21 = v20;
      if (v20)
      {
        id v22 = v20;
      }
      else
      {
        id v22 = [MEMORY[0x263EFF910] distantPast];
      }
      v23 = v22;

      if ([v5 hasInviteRequestEvent]
        && [v6 hasInviteRequestEvent])
      {
        if (objc_msgSend(v19, "hk_isAfterOrEqualToDate:", v23)) {
          v24 = v5;
        }
        else {
          v24 = v6;
        }
      }
      else
      {
        char v25 = [v5 hasInviteRequestEvent];
        v24 = v5;
        if ((v25 & 1) == 0)
        {
          [v6 hasInviteRequestEvent];
          v24 = v6;
        }
      }
      id v12 = (void *)[v24 copy];

      id v7 = v27;
      goto LABEL_36;
    }
    v15 = v6;
  }
  id v12 = (void *)[v15 copy];
LABEL_36:

LABEL_37:

  return v12;
}

- (id)relationshipForCloudType:(unint64_t)a3
{
  uint64_t v3 = 8;
  if (a3 == 1) {
    uint64_t v3 = 24;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

- (void)updateRelationship:(id)a3 cloudType:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 cloudType];
  uint64_t v7 = 8;
  if (v6 == 1) {
    uint64_t v7 = 24;
  }
  id v8 = *(Class *)((char *)&self->super.isa + v7);
  *(Class *)((char *)&self->super.isa + v7) = (Class)v5;
}

- (id)remoteRelationshipForCloudType:(unint64_t)a3
{
  uint64_t v3 = 16;
  if (a3 == 1) {
    uint64_t v3 = 32;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

- (void)updateRemoteRelationship:(id)a3 cloudType:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 cloudType];
  uint64_t v7 = 16;
  if (v6 == 1) {
    uint64_t v7 = 32;
  }
  id v8 = *(Class *)((char *)&self->super.isa + v7);
  *(Class *)((char *)&self->super.isa + v7) = (Class)v5;
}

- (ASRelationshipStorage)storageWithSynchronizedRelationshipIdentifiers
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = (void *)[(ASRelationshipStorage *)self copy];
  uint64_t v3 = [v2 primaryRelationship];
  if ([v3 cloudType])
  {
LABEL_2:

    goto LABEL_3;
  }
  uint64_t v6 = [v2 legacyRelationship];
  uint64_t v7 = [v6 UUID];
  id v8 = [v2 secureCloudRelationship];
  v9 = [v8 UUID];
  char v10 = [v7 isEqual:v9];

  if ((v10 & 1) == 0)
  {
    uint64_t v3 = [v2 secureCloudRelationship];
    v11 = [v2 legacyRelationship];
    id v12 = [v11 UUID];
    [v3 setUUID:v12];

    [v2 setSecureCloudRelationship:v3];
    ASLoggingInitialize();
    BOOL v13 = ASLogRelationships;
    if (os_log_type_enabled((os_log_t)ASLogRelationships, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      v23 = v2;
      _os_log_impl(&dword_21EC60000, v13, OS_LOG_TYPE_DEFAULT, "Synchronized relationship identifiers: %@", (uint8_t *)&v22, 0xCu);
    }
    goto LABEL_2;
  }
LABEL_3:
  id v4 = [v2 primaryRemoteRelationship];
  if ([v4 cloudType])
  {
LABEL_4:

    goto LABEL_5;
  }
  v14 = [v2 legacyRemoteRelationship];
  v15 = [v14 UUID];
  id v16 = [v2 secureCloudRemoteRelationship];
  objc_super v17 = [v16 UUID];
  char v18 = [v15 isEqual:v17];

  if ((v18 & 1) == 0)
  {
    id v4 = [v2 secureCloudRemoteRelationship];
    v19 = [v2 legacyRemoteRelationship];
    v20 = [v19 UUID];
    [v4 setUUID:v20];

    [v2 setSecureCloudRemoteRelationship:v4];
    ASLoggingInitialize();
    v21 = ASLogRelationships;
    if (os_log_type_enabled((os_log_t)ASLogRelationships, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      v23 = v2;
      _os_log_impl(&dword_21EC60000, v21, OS_LOG_TYPE_DEFAULT, "Synchronized remote relationship identifiers: %@", (uint8_t *)&v22, 0xCu);
    }
    goto LABEL_4;
  }
LABEL_5:

  return (ASRelationshipStorage *)v2;
}

- (ASRelationship)legacyRelationship
{
  return self->_legacyRelationship;
}

- (void)setLegacyRelationship:(id)a3
{
}

- (ASRelationship)legacyRemoteRelationship
{
  return self->_legacyRemoteRelationship;
}

- (void)setLegacyRemoteRelationship:(id)a3
{
}

- (ASRelationship)secureCloudRelationship
{
  return self->_secureCloudRelationship;
}

- (void)setSecureCloudRelationship:(id)a3
{
}

- (ASRelationship)secureCloudRemoteRelationship
{
  return self->_secureCloudRemoteRelationship;
}

- (void)setSecureCloudRemoteRelationship:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureCloudRemoteRelationship, 0);
  objc_storeStrong((id *)&self->_secureCloudRelationship, 0);
  objc_storeStrong((id *)&self->_legacyRemoteRelationship, 0);

  objc_storeStrong((id *)&self->_legacyRelationship, 0);
}

@end