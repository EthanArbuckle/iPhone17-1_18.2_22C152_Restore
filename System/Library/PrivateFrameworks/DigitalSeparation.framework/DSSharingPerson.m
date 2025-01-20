@interface DSSharingPerson
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMe:(id)a3;
- (CNContact)contact;
- (DSSharingPerson)initWithSource:(id)a3 sharedResource:(id)a4 participant:(id)a5 deviceOwnerRole:(int64_t)a6;
- (NSArray)allSources;
- (NSArray)sortedSourceNames;
- (NSArray)termsOfAddress;
- (NSString)displayGivenName;
- (NSString)displayName;
- (NSString)localizedDetail;
- (id)contactMatchingPredicates:(id)a3;
- (id)participationForSourceName:(id)a3;
- (id)sharedResourcesForSourceName:(id)a3;
- (id)valueForKey:(id)a3;
- (int64_t)score;
- (uint64_t)emailAddresses;
- (uint64_t)identifier;
- (uint64_t)names;
- (uint64_t)phoneNumbers;
- (uint64_t)shareDirectionByResource;
- (uint64_t)shareDirectionBySourceName;
- (uint64_t)sharedResourcesBySource;
- (unint64_t)hash;
- (unint64_t)shareDirectionForSharedResource:(id)a3;
- (unint64_t)shareDirectionForSourceName:(id)a3;
- (void)addSource:(id)a3 sharedResource:(id)a4 participant:(id)a5 deviceOwnerRole:(int64_t)a6;
- (void)removeParticipant:(id)a3 fromSource:(id)a4;
- (void)removeSource:(id)a3;
- (void)score;
- (void)setEmailAddresses:(uint64_t)a1;
- (void)setIdentifier:(uint64_t)a1;
- (void)setNames:(uint64_t)a1;
- (void)setPhoneNumbers:(uint64_t)a1;
- (void)setShareDirectionByResource:(uint64_t)a1;
- (void)setShareDirectionBySourceName:(uint64_t)a1;
- (void)setSharedResourcesBySource:(uint64_t)a1;
- (void)stopAllSharingOnQueue:(id)a3 completion:(id)a4;
- (void)stopSharingSourceNames:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)stopSharingSources:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)updateContactFromParticipant:(id)a3;
- (void)updateKnownEmailAddressesForParticipant:(id)a3;
- (void)updateKnownNameForParticipant:(id)a3;
- (void)updateKnownPhoneNumbersForParticipant:(id)a3;
- (void)updateShareDirectionForParticipant:(id)a3 source:(id)a4 sharedResource:(id)a5 deviceOwnerRole:(int64_t)a6;
@end

@implementation DSSharingPerson

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    DSLogSharingPerson = (uint64_t)os_log_create("com.apple.DigitalSeparation", "DSSharingPerson");
    MEMORY[0x270F9A758]();
  }
}

- (DSSharingPerson)initWithSource:(id)a3 sharedResource:(id)a4 participant:(id)a5 deviceOwnerRole:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v31.receiver = self;
  v31.super_class = (Class)DSSharingPerson;
  v13 = [(DSSharingPerson *)&v31 init];
  if (v13)
  {
    uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
    sources = v13->_sources;
    v13->_sources = (NSMutableDictionary *)v14;

    uint64_t v16 = [MEMORY[0x263EFF9A0] dictionary];
    participantsBySource = v13->_participantsBySource;
    v13->_participantsBySource = (NSMutableDictionary *)v16;

    uint64_t v18 = [MEMORY[0x263EFF9A0] dictionary];
    sharedResourcesBySource = v13->_sharedResourcesBySource;
    v13->_sharedResourcesBySource = (NSMutableDictionary *)v18;

    uint64_t v20 = [MEMORY[0x263EFF9C0] set];
    emailAddresses = v13->_emailAddresses;
    v13->_emailAddresses = (NSMutableSet *)v20;

    uint64_t v22 = [MEMORY[0x263EFF9C0] set];
    names = v13->_names;
    v13->_names = (NSMutableSet *)v22;

    uint64_t v24 = [MEMORY[0x263EFF9A0] dictionary];
    shareDirectionBySourceName = v13->_shareDirectionBySourceName;
    v13->_shareDirectionBySourceName = (NSMutableDictionary *)v24;

    uint64_t v26 = [MEMORY[0x263F08968] mapTableWithKeyOptions:0 valueOptions:1282];
    shareDirectionByResource = v13->_shareDirectionByResource;
    v13->_shareDirectionByResource = (NSMapTable *)v26;

    uint64_t v28 = [MEMORY[0x263EFF9C0] set];
    phoneNumbers = v13->_phoneNumbers;
    v13->_phoneNumbers = (NSMutableSet *)v28;

    [(DSSharingPerson *)v13 updateContactFromParticipant:v12];
    [(DSSharingPerson *)v13 addSource:v10 sharedResource:v11 participant:v12 deviceOwnerRole:a6];
  }

  return v13;
}

- (void)setSharedResourcesBySource:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)setEmailAddresses:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (void)setNames:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (void)setShareDirectionBySourceName:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 72), a2);
  }
}

- (void)setShareDirectionByResource:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 80), a2);
  }
}

- (void)setPhoneNumbers:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

- (void)updateContactFromParticipant:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  v4 = (DSSharingPerson *)a3;
  v5 = [(DSSharingPerson *)self contact];

  if (!v5)
  {
    v7 = [MEMORY[0x263EFF980] array];
    v8 = [(DSSharingPerson *)v4 identity];
    v9 = [(DSSharingPerson *)v8 unifiedContactIdentifier];
    uint64_t v10 = [v9 length];

    if (v10)
    {
      id v11 = (void *)MEMORY[0x263EFE9F8];
      id v12 = [(DSSharingPerson *)v8 unifiedContactIdentifier];
      v50 = v12;
      v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v50 count:1];
      uint64_t v14 = [v11 predicateForContactsWithIdentifiers:v13];
      [v7 addObject:v14];
    }
    v15 = [(DSSharingPerson *)v8 nameComponents];

    if (v15)
    {
      uint64_t v16 = (void *)MEMORY[0x263F08A78];
      v17 = [(DSSharingPerson *)v8 nameComponents];
      uint64_t v18 = [v16 localizedStringFromPersonNameComponents:v17 style:3 options:0];

      if ([v18 length])
      {
        v19 = [MEMORY[0x263EFE9F8] predicateForContactsMatchingName:v18];
        [v7 addObject:v19];
      }
    }
    uint64_t v20 = [(DSSharingPerson *)v8 emailAddress];
    uint64_t v21 = [v20 length];

    if (v21)
    {
      uint64_t v22 = (void *)MEMORY[0x263EFE9F8];
      v23 = [(DSSharingPerson *)v8 emailAddress];
      uint64_t v24 = [v22 predicateForContactsMatchingEmailAddress:v23];
      [v7 addObject:v24];
    }
    v25 = [(DSSharingPerson *)v8 phoneNumber];
    uint64_t v26 = [v25 length];

    if (v26)
    {
      v27 = (void *)MEMORY[0x263EFEB28];
      uint64_t v28 = [(DSSharingPerson *)v8 phoneNumber];
      v29 = [v27 phoneNumberWithStringValue:v28];

      if (v29)
      {
        v30 = [MEMORY[0x263EFE9F8] predicateForContactsMatchingPhoneNumber:v29];
        [v7 addObject:v30];
      }
    }
    objc_super v31 = [(DSSharingPerson *)self contactMatchingPredicates:v7];
    v32 = DSLogSharingPerson;
    if (v31)
    {
      if (os_log_type_enabled((os_log_t)DSLogSharingPerson, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138478339;
        v52 = v31;
        __int16 v53 = 2114;
        v54 = self;
        __int16 v55 = 2113;
        v56 = v8;
        _os_log_impl(&dword_236090000, v32, OS_LOG_TYPE_INFO, "Found contact %{private}@ for %{public}@ source: %{private}@", buf, 0x20u);
      }
      v33 = [(DSSharingPerson *)v31 identifier];
      -[DSSharingPerson setIdentifier:]((uint64_t)self, v33);

      -[DSSourceDescriptor setSourceName:]((uint64_t)self, v31);
      goto LABEL_37;
    }
    if (os_log_type_enabled((os_log_t)DSLogSharingPerson, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138478083;
      v52 = v8;
      __int16 v53 = 2114;
      v54 = self;
      _os_log_impl(&dword_236090000, v32, OS_LOG_TYPE_DEFAULT, "No contact found for identity: %{private}@, person: %{public}@ . Trying other fallbacks...", buf, 0x16u);
    }
    v34 = [(DSSharingPerson *)v8 nameComponents];

    if (v34)
    {
      v35 = (void *)MEMORY[0x263F08A78];
      v36 = [(DSSharingPerson *)v8 nameComponents];
      v37 = [v35 localizedStringFromPersonNameComponents:v36 style:3 options:0];

      if ([(DSSharingPerson *)v37 length])
      {
        v38 = DSLogSharingPerson;
        if (os_log_type_enabled((os_log_t)DSLogSharingPerson, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138478083;
          v52 = v37;
          __int16 v53 = 2114;
          v54 = self;
          _os_log_impl(&dword_236090000, v38, OS_LOG_TYPE_INFO, "Falling back to name component %{private}@ for %{public}@", buf, 0x16u);
        }
        goto LABEL_36;
      }
    }
    v39 = [(DSSharingPerson *)v8 emailAddress];
    uint64_t v40 = [v39 length];

    if (v40)
    {
      v41 = (void *)DSLogSharingPerson;
      if (os_log_type_enabled((os_log_t)DSLogSharingPerson, OS_LOG_TYPE_INFO))
      {
        v42 = v41;
        v43 = [(DSSharingPerson *)v8 emailAddress];
        *(_DWORD *)buf = 138478083;
        v52 = v43;
        __int16 v53 = 2114;
        v54 = self;
        _os_log_impl(&dword_236090000, v42, OS_LOG_TYPE_INFO, "Falling back to email %{private}@ for %{public}@", buf, 0x16u);
      }
      uint64_t v44 = [(DSSharingPerson *)v8 emailAddress];
    }
    else
    {
      v45 = [(DSSharingPerson *)v8 phoneNumber];
      uint64_t v46 = [v45 length];

      if (!v46)
      {
LABEL_37:

        goto LABEL_38;
      }
      v47 = (void *)DSLogSharingPerson;
      if (os_log_type_enabled((os_log_t)DSLogSharingPerson, OS_LOG_TYPE_INFO))
      {
        v48 = v47;
        v49 = [(DSSharingPerson *)v8 phoneNumber];
        *(_DWORD *)buf = 138478083;
        v52 = v49;
        __int16 v53 = 2114;
        v54 = self;
        _os_log_impl(&dword_236090000, v48, OS_LOG_TYPE_INFO, "Falling back to phone number %{private}@ for %{public}@", buf, 0x16u);
      }
      uint64_t v44 = [(DSSharingPerson *)v8 phoneNumber];
    }
    v37 = (DSSharingPerson *)v44;
LABEL_36:
    -[DSSharingPerson setIdentifier:]((uint64_t)self, v37);

    goto LABEL_37;
  }
  v6 = (void *)DSLogSharingPerson;
  if (os_log_type_enabled((os_log_t)DSLogSharingPerson, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    v8 = [(DSSharingPerson *)self contact];
    *(_DWORD *)buf = 138478339;
    v52 = v8;
    __int16 v53 = 2113;
    v54 = v4;
    __int16 v55 = 2114;
    v56 = self;
    _os_log_impl(&dword_236090000, v7, OS_LOG_TYPE_INFO, "Using cached contact %{private}@ for participant %{private}@, person %{public}@", buf, 0x20u);
LABEL_38:
  }
}

- (void)setIdentifier:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (id)contactMatchingPredicates:(id)a3
{
  v68[18] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x263EFDFC8];
  v68[0] = *MEMORY[0x263EFE040];
  v68[1] = v4;
  uint64_t v5 = *MEMORY[0x263EFDFB8];
  v68[2] = *MEMORY[0x263EFE038];
  v68[3] = v5;
  uint64_t v6 = *MEMORY[0x263EFE088];
  v68[4] = *MEMORY[0x263EFE0B8];
  v68[5] = v6;
  uint64_t v7 = *MEMORY[0x263EFE090];
  v68[6] = *MEMORY[0x263EFE080];
  v68[7] = v7;
  uint64_t v8 = *MEMORY[0x263EFE050];
  v68[8] = *MEMORY[0x263EFE048];
  v68[9] = v8;
  uint64_t v9 = *MEMORY[0x263EFDFF8];
  v68[10] = *MEMORY[0x263EFE148];
  v68[11] = v9;
  uint64_t v10 = *MEMORY[0x263EFDFF0];
  v68[12] = *MEMORY[0x263EFE140];
  v68[13] = v10;
  uint64_t v11 = *MEMORY[0x263EFDF80];
  v68[14] = *MEMORY[0x263EFE068];
  v68[15] = v11;
  uint64_t v12 = *MEMORY[0x263EFDF40];
  v68[16] = *MEMORY[0x263EFE070];
  v68[17] = v12;
  v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:v68 count:18];
  id v44 = objc_alloc_init(MEMORY[0x263EFEA58]);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v3;
  uint64_t v46 = [obj countByEnumeratingWithState:&v56 objects:v67 count:16];
  id v14 = 0;
  if (v46)
  {
    uint64_t v43 = *(void *)v57;
    v15 = &OBJC_IVAR___DSSharingPermissions__sharingTypes;
    *(void *)&long long v13 = 138478339;
    long long v41 = v13;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v57 != v43) {
          objc_enumerationMutation(obj);
        }
        uint64_t v48 = v16;
        v17 = *(void **)(*((void *)&v56 + 1) + 8 * v16);
        id v55 = 0;
        uint64_t v18 = objc_msgSend(v44, "unifiedContactsMatchingPredicate:keysToFetch:error:", v17, v45, &v55, v41);
        id v47 = v55;
        v19 = *((void *)v15 + 110);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          uint64_t v20 = v19;
          uint64_t v21 = [v18 count];
          *(_DWORD *)buf = v41;
          v61 = v17;
          __int16 v62 = 2113;
          uint64_t v63 = (uint64_t)v18;
          __int16 v64 = 2050;
          v65[0] = v21;
          _os_log_impl(&dword_236090000, v20, OS_LOG_TYPE_INFO, "Searching contacts with predicate %{private}@ and got %{private}@ (%{public}lu)", buf, 0x20u);
        }
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v49 = v18;
        uint64_t v22 = [v49 countByEnumeratingWithState:&v51 objects:v66 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v52;
          while (2)
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v52 != v24) {
                objc_enumerationMutation(v49);
              }
              uint64_t v26 = *(void **)(*((void *)&v51 + 1) + 8 * i);
              v27 = [MEMORY[0x263EFEA20] stringFromContact:v26 style:0];
              uint64_t v28 = *((void *)v15 + 110);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                log = v28;
                uint64_t v29 = v23;
                v30 = v15;
                uint64_t v31 = [v27 length];
                [v26 imageData];
                v33 = v32 = v27;
                int v34 = [v26 isSuggested];
                *(_DWORD *)buf = 138478595;
                v61 = v32;
                __int16 v62 = 2050;
                uint64_t v63 = v31;
                v15 = v30;
                uint64_t v23 = v29;
                __int16 v64 = 1024;
                LODWORD(v65[0]) = v33 != 0;
                WORD2(v65[0]) = 1026;
                *(_DWORD *)((char *)v65 + 6) = v34;
                _os_log_impl(&dword_236090000, log, OS_LOG_TYPE_INFO, "Found potential contact match with name: %{private}@ (%{public}lu) and contains-thumbnail: %{BOOL}d, suggested: %{public}d", buf, 0x22u);

                v27 = v32;
              }
              if ([v27 length])
              {
                v35 = [v26 imageData];

                if (v35)
                {
                  v38 = *((void *)v15 + 110);
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138477827;
                    v61 = v26;
                    _os_log_impl(&dword_236090000, v38, OS_LOG_TYPE_INFO, "Choosing contact %{private}@ because it has a name and image data", buf, 0xCu);
                  }
                  id v39 = v26;

                  id v14 = v39;
                  goto LABEL_31;
                }
              }
              if ([v14 isSuggested]
                && ([v26 isSuggested] & 1) == 0
                && [v27 length])
              {
                v36 = *((void *)v15 + 110);
                if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138477827;
                  v61 = v26;
                  _os_log_impl(&dword_236090000, v36, OS_LOG_TYPE_INFO, "Making contact %{private}@ the current best choice", buf, 0xCu);
                }
                id v37 = v26;

                id v14 = v37;
              }
              else if (!v14)
              {
                id v14 = v26;
              }
            }
            uint64_t v23 = [v49 countByEnumeratingWithState:&v51 objects:v66 count:16];
            if (v23) {
              continue;
            }
            break;
          }
        }
LABEL_31:

        uint64_t v16 = v48 + 1;
      }
      while (v48 + 1 != v46);
      uint64_t v46 = [obj countByEnumeratingWithState:&v56 objects:v67 count:16];
    }
    while (v46);
  }

  return v14;
}

- (void)updateKnownEmailAddressesForParticipant:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(DSSharingPerson *)self contact];
  uint64_t v6 = [v5 emailAddresses];

  if (v6)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * v11);
          if (self) {
            emailAddresses = self->_emailAddresses;
          }
          else {
            emailAddresses = 0;
          }
          id v14 = emailAddresses;
          v15 = objc_msgSend(v12, "value", (void)v20);
          [(NSMutableSet *)v14 addObject:v15];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v16 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
        uint64_t v9 = v16;
      }
      while (v16);
    }
  }
  v17 = objc_msgSend(v4, "identity", (void)v20);
  uint64_t v18 = [v17 emailAddress];

  if ([v18 length])
  {
    if (self) {
      v19 = self->_emailAddresses;
    }
    else {
      v19 = 0;
    }
    [(NSMutableSet *)v19 addObject:v18];
  }
}

- (uint64_t)emailAddresses
{
  if (result) {
    return *(void *)(result + 48);
  }
  return result;
}

- (void)updateKnownNameForParticipant:(id)a3
{
  id v12 = a3;
  id v4 = (void *)MEMORY[0x263EFEA20];
  uint64_t v5 = [(DSSharingPerson *)self contact];
  uint64_t v6 = [v4 stringFromContact:v5 style:0];

  if ([v6 length])
  {
    if (self) {
      names = self->_names;
    }
    else {
      names = 0;
    }
    [(NSMutableSet *)names addObject:v6];
  }
  uint64_t v8 = [v12 identity];
  uint64_t v9 = [v8 nameComponents];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x263F08A78] localizedStringFromPersonNameComponents:v9 style:0 options:0];

    if (([MEMORY[0x263F335C0] isStringEmailAddress:v10] & 1) == 0
      && ([MEMORY[0x263F33620] isStringPhoneNumber:v10] & 1) == 0
      && [v10 length])
    {
      if (self) {
        uint64_t v11 = self->_names;
      }
      else {
        uint64_t v11 = 0;
      }
      [(NSMutableSet *)v11 addObject:v10];
    }
  }
  else
  {
    uint64_t v10 = v6;
  }
}

- (uint64_t)names
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

- (void)updateKnownPhoneNumbersForParticipant:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(DSSharingPerson *)self contact];
  uint64_t v6 = [v5 phoneNumbers];

  if (v6)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v21 + 1) + 8 * v11);
          if (self) {
            phoneNumbers = self->_phoneNumbers;
          }
          else {
            phoneNumbers = 0;
          }
          id v14 = phoneNumbers;
          v15 = objc_msgSend(v12, "value", (void)v21);
          uint64_t v16 = [v15 stringValue];
          [(NSMutableSet *)v14 addObject:v16];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v17 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
        uint64_t v9 = v17;
      }
      while (v17);
    }
  }
  uint64_t v18 = objc_msgSend(v4, "identity", (void)v21);
  v19 = [v18 phoneNumber];

  if ([v19 length])
  {
    if (self) {
      long long v20 = self->_phoneNumbers;
    }
    else {
      long long v20 = 0;
    }
    [(NSMutableSet *)v20 addObject:v19];
  }
}

- (uint64_t)phoneNumbers
{
  if (result) {
    return *(void *)(result + 64);
  }
  return result;
}

- (void)updateShareDirectionForParticipant:(id)a3 source:(id)a4 sharedResource:(id)a5 deviceOwnerRole:(int64_t)a6
{
  id v24 = a3;
  id v10 = a4;
  id v11 = a5;
  if (a6 == 2)
  {
    uint64_t v22 = [v24 role];
    if (v22 == 1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = 4 * (v22 == 2);
    }
    if (self) {
      goto LABEL_6;
    }
  }
  else
  {
    if (a6 == 1) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 0;
    }
    if (self)
    {
LABEL_6:
      shareDirectionBySourceName = self->_shareDirectionBySourceName;
      goto LABEL_7;
    }
  }
  shareDirectionBySourceName = 0;
LABEL_7:
  id v14 = shareDirectionBySourceName;
  v15 = [v10 name];
  uint64_t v16 = [(NSMutableDictionary *)v14 objectForKeyedSubscript:v15];

  uint64_t v17 = [v16 unsignedIntegerValue];
  uint64_t v18 = [NSNumber numberWithUnsignedInteger:v17 | v12];
  if (self)
  {
    v19 = self->_shareDirectionBySourceName;
    long long v20 = [v10 name];
    [(NSMutableDictionary *)v19 setObject:v18 forKeyedSubscript:v20];

    shareDirectionByResource = self->_shareDirectionByResource;
  }
  else
  {
    long long v23 = [v10 name];
    [0 setObject:v18 forKeyedSubscript:v23];

    shareDirectionByResource = 0;
  }
  NSMapInsert(shareDirectionByResource, v11, (const void *)v12);
}

- (uint64_t)shareDirectionBySourceName
{
  if (result) {
    return *(void *)(result + 72);
  }
  return result;
}

- (uint64_t)shareDirectionByResource
{
  if (result) {
    return *(void *)(result + 80);
  }
  return result;
}

- (unint64_t)shareDirectionForSourceName:(id)a3
{
  if (self) {
    self = (DSSharingPerson *)self->_shareDirectionBySourceName;
  }
  id v3 = [(DSSharingPerson *)self objectForKeyedSubscript:a3];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (unint64_t)shareDirectionForSharedResource:(id)a3
{
  if (self) {
    shareDirectionByResource = self->_shareDirectionByResource;
  }
  else {
    shareDirectionByResource = 0;
  }
  uint64_t v5 = shareDirectionByResource;
  uint64_t v6 = NSMapGet(v5, a3);

  return (unint64_t)v6;
}

- (void)addSource:(id)a3 sharedResource:(id)a4 participant:(id)a5 deviceOwnerRole:(int64_t)a6
{
  id v29 = a3;
  id v10 = a4;
  id v11 = a5;
  if (self)
  {
    uint64_t v12 = self->_sources;
    long long v13 = [v29 name];
    [(NSMutableDictionary *)v12 setObject:v29 forKeyedSubscript:v13];

    participantsBySource = self->_participantsBySource;
  }
  else
  {
    v27 = [v29 name];
    [0 setObject:v29 forKeyedSubscript:v27];

    participantsBySource = 0;
  }
  v15 = participantsBySource;
  uint64_t v16 = [v29 name];
  uint64_t v17 = [(NSMutableDictionary *)v15 objectForKeyedSubscript:v16];

  if (!v17)
  {
    uint64_t v17 = [MEMORY[0x263EFF980] array];
  }
  [v17 addObject:v11];
  if (self)
  {
    uint64_t v18 = self->_participantsBySource;
    v19 = [v29 name];
    [(NSMutableDictionary *)v18 setObject:v17 forKeyedSubscript:v19];

    sharedResourcesBySource = self->_sharedResourcesBySource;
  }
  else
  {
    uint64_t v28 = [v29 name];
    [0 setObject:v17 forKeyedSubscript:v28];

    sharedResourcesBySource = 0;
  }
  long long v21 = sharedResourcesBySource;
  uint64_t v22 = [v29 name];
  long long v23 = [(NSMutableDictionary *)v21 objectForKeyedSubscript:v22];

  if (!v23)
  {
    long long v23 = [MEMORY[0x263EFF9C0] set];
  }
  [v23 addObject:v10];
  if (self) {
    id v24 = self->_sharedResourcesBySource;
  }
  else {
    id v24 = 0;
  }
  uint64_t v25 = v24;
  uint64_t v26 = [v29 name];
  [(NSMutableDictionary *)v25 setObject:v23 forKeyedSubscript:v26];

  [(DSSharingPerson *)self updateKnownEmailAddressesForParticipant:v11];
  [(DSSharingPerson *)self updateKnownNameForParticipant:v11];
  [(DSSharingPerson *)self updateShareDirectionForParticipant:v11 source:v29 sharedResource:v10 deviceOwnerRole:a6];
  [(DSSharingPerson *)self updateKnownPhoneNumbersForParticipant:v11];
}

- (uint64_t)sharedResourcesBySource
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (void)removeSource:(id)a3
{
  if (self)
  {
    uint64_t v5 = self->_participantsBySource;
    uint64_t v6 = [a3 name];
    id v7 = [(NSMutableDictionary *)v5 objectForKeyedSubscript:v6];

    [v7 removeAllObjects];
    sources = self->_sources;
  }
  else
  {
    id v10 = [a3 name];
    id v11 = [0 objectForKeyedSubscript:v10];
    [v11 removeAllObjects];

    sources = 0;
  }
  uint64_t v9 = sources;
  id v12 = [a3 name];

  [(NSMutableDictionary *)v9 setObject:0 forKeyedSubscript:v12];
}

- (void)removeParticipant:(id)a3 fromSource:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  id v7 = v6;
  if (self)
  {
    uint64_t v8 = self->_participantsBySource;
    uint64_t v9 = [v7 name];
    id v10 = [(NSMutableDictionary *)v8 objectForKeyedSubscript:v9];

    [v10 removeObject:v21];
    participantsBySource = self->_participantsBySource;
  }
  else
  {
    v19 = [v6 name];
    long long v20 = [0 objectForKeyedSubscript:v19];
    [v20 removeObject:v21];

    participantsBySource = 0;
  }
  id v12 = participantsBySource;
  long long v13 = [v7 name];
  id v14 = [(NSMutableDictionary *)v12 objectForKeyedSubscript:v13];

  uint64_t v15 = [v14 count];
  if (!v15)
  {
    if (self) {
      sources = self->_sources;
    }
    else {
      sources = 0;
    }
    uint64_t v17 = sources;
    uint64_t v18 = [v7 name];
    [(NSMutableDictionary *)v17 setObject:0 forKeyedSubscript:v18];
  }
}

- (int64_t)score
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  if (self) {
    sources = self->_sources;
  }
  else {
    sources = 0;
  }
  unint64_t v4 = sources;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = +[DSSourceDescriptor sourceDescriptorForSource:](DSSourceDescriptor, "sourceDescriptorForSource:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        uint64_t v11 = [v10 priority];
        BOOL v12 = __OFADD__(v7, v11);
        v7 += v11;
        if (v12)
        {
          long long v13 = (void *)DSLogSharingPerson;
          if (os_log_type_enabled((os_log_t)DSLogSharingPerson, OS_LOG_TYPE_FAULT)) {
            [(DSSharingPerson *)self == 0 score];
          }

          return 0x7FFFFFFFFFFFFFFFLL;
        }
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v7 = 0;
  }

  if (self) {
    names = self->_names;
  }
  else {
    names = 0;
  }
  return (__PAIR128__(v7, [(NSMutableSet *)names count]) - 1) >> 64;
}

- (id)sharedResourcesForSourceName:(id)a3
{
  if (self) {
    self = (DSSharingPerson *)self->_sharedResourcesBySource;
  }
  id v3 = [(DSSharingPerson *)self objectForKeyedSubscript:a3];
  unint64_t v4 = (void *)[v3 copy];

  return v4;
}

- (id)participationForSourceName:(id)a3
{
  if (self) {
    self = (DSSharingPerson *)self->_participantsBySource;
  }
  id v3 = [(DSSharingPerson *)self objectForKeyedSubscript:a3];
  unint64_t v4 = (void *)[v3 copy];

  return v4;
}

- (unint64_t)hash
{
  if (self) {
    self = (DSSharingPerson *)self->_identifier;
  }
  return [(DSSharingPerson *)self hash];
}

- (uint64_t)identifier
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (DSSharingPerson *)a3;
  if (v4 == self)
  {
    char v8 = 1;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v8 = 0;
    goto LABEL_9;
  }
  if (!self)
  {
    identifier = 0;
    if (v4) {
      goto LABEL_5;
    }
LABEL_11:
    uint64_t v6 = 0;
    goto LABEL_6;
  }
  identifier = self->_identifier;
  if (!v4) {
    goto LABEL_11;
  }
LABEL_5:
  uint64_t v6 = v4->_identifier;
LABEL_6:
  unint64_t v7 = identifier;
  char v8 = [(NSString *)v7 isEqualToString:v6];

LABEL_9:
  return v8;
}

- (BOOL)isMe:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 meCardIdentifier];
  uint64_t v6 = v5;
  if (self) {
    identifier = self->_identifier;
  }
  else {
    identifier = 0;
  }
  int v8 = [v5 isEqualToString:identifier];

  if (!v8)
  {
    BOOL v12 = [v4 emails];
    if (self) {
      emailAddresses = self->_emailAddresses;
    }
    else {
      emailAddresses = 0;
    }
    if ([(NSMutableSet *)emailAddresses intersectsSet:v12])
    {
      id v14 = (void *)DSLogSharingPerson;
      LOBYTE(v10) = 1;
      if (os_log_type_enabled((os_log_t)DSLogSharingPerson, OS_LOG_TYPE_INFO))
      {
        if (self) {
          uint64_t v15 = self->_emailAddresses;
        }
        else {
          uint64_t v15 = 0;
        }
        int v23 = 138478083;
        id v24 = v15;
        __int16 v25 = 2113;
        uint64_t v26 = v12;
        long long v16 = v14;
        _os_log_impl(&dword_236090000, v16, OS_LOG_TYPE_INFO, "%{private}@ is one of the email addresses in the Apple ID primary account: %{private}@", (uint8_t *)&v23, 0x16u);
      }
    }
    else
    {
      long long v17 = [v4 phoneNumbers];
      if (self) {
        phoneNumbers = self->_phoneNumbers;
      }
      else {
        phoneNumbers = 0;
      }
      int v10 = [(NSMutableSet *)phoneNumbers intersectsSet:v17];
      if (v10)
      {
        long long v19 = (void *)DSLogSharingPerson;
        if (os_log_type_enabled((os_log_t)DSLogSharingPerson, OS_LOG_TYPE_INFO))
        {
          if (self) {
            long long v20 = self->_phoneNumbers;
          }
          else {
            long long v20 = 0;
          }
          int v23 = 138478083;
          id v24 = v20;
          __int16 v25 = 2113;
          uint64_t v26 = v17;
          uint64_t v21 = v19;
          _os_log_impl(&dword_236090000, v21, OS_LOG_TYPE_INFO, "%{private}@ is one of the phone numbers in the Apple ID primary account: %{private}@", (uint8_t *)&v23, 0x16u);
        }
      }
    }
    goto LABEL_23;
  }
  uint64_t v9 = (void *)DSLogSharingPerson;
  LOBYTE(v10) = 1;
  if (os_log_type_enabled((os_log_t)DSLogSharingPerson, OS_LOG_TYPE_INFO))
  {
    if (self) {
      uint64_t v11 = self->_identifier;
    }
    else {
      uint64_t v11 = 0;
    }
    int v23 = 138477827;
    id v24 = (NSMutableSet *)v11;
    BOOL v12 = v9;
    _os_log_impl(&dword_236090000, v12, OS_LOG_TYPE_INFO, "%{private}@ is the me card", (uint8_t *)&v23, 0xCu);
LABEL_23:
  }
  return v10;
}

- (NSString)displayName
{
  id v3 = [(DSSharingPerson *)self contact];

  if (!v3)
  {
    if (self) {
      names = self->_names;
    }
    else {
      names = 0;
    }
    uint64_t v15 = [(NSMutableSet *)names anyObject];
    if (!v15)
    {
      if (self) {
        identifier = self->_identifier;
      }
      else {
        identifier = 0;
      }
      long long v13 = identifier;
      goto LABEL_17;
    }
    uint64_t v6 = (void *)v15;
    goto LABEL_9;
  }
  id v4 = (void *)MEMORY[0x263EFEA20];
  uint64_t v5 = [(DSSharingPerson *)self contact];
  uint64_t v6 = [v4 stringFromContact:v5 style:0];

  if (v6)
  {
LABEL_9:
    long long v16 = NSString;
    uint64_t v11 = DSLocStringForKey(@"SHARING_PERSON_DISPLAY_NAME");
    objc_msgSend(v16, "stringWithFormat:", v11, v6);
    long long v13 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_16:

    goto LABEL_17;
  }
  unint64_t v7 = [(DSSharingPerson *)self contact];
  int v8 = [v7 emailAddresses];
  uint64_t v9 = [v8 count];

  int v10 = [(DSSharingPerson *)self contact];
  uint64_t v6 = v10;
  if (v9)
  {
    uint64_t v11 = [v10 emailAddresses];
    BOOL v12 = [v11 firstObject];
    long long v13 = [v12 value];
LABEL_15:

    goto LABEL_16;
  }
  long long v18 = [v10 phoneNumbers];
  uint64_t v19 = [v18 count];

  if (v19)
  {
    uint64_t v6 = [(DSSharingPerson *)self contact];
    uint64_t v11 = [v6 phoneNumbers];
    BOOL v12 = [v11 firstObject];
    long long v20 = [v12 value];
    long long v13 = [v20 stringValue];

    goto LABEL_15;
  }
  long long v13 = 0;
LABEL_17:
  return v13;
}

- (NSString)displayGivenName
{
  id v3 = objc_alloc_init(MEMORY[0x263F08A68]);
  id v4 = [(DSSharingPerson *)self contact];
  uint64_t v5 = [v4 givenName];
  [v3 setGivenName:v5];

  uint64_t v6 = [(DSSharingPerson *)self contact];
  unint64_t v7 = [v6 familyName];
  [v3 setFamilyName:v7];

  int v8 = [MEMORY[0x263F08A78] localizedStringFromPersonNameComponents:v3 style:1 options:0];
  if ([v8 length])
  {
    id v9 = v8;
  }
  else
  {
    id v9 = [(DSSharingPerson *)self displayName];
  }
  int v10 = v9;

  return (NSString *)v10;
}

- (NSArray)termsOfAddress
{
  id v3 = [(DSSharingPerson *)self contact];

  if (v3)
  {
    id v4 = [(DSSharingPerson *)self contact];
    uint64_t v5 = [v4 termsOfAddress];
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x263EFFA68];
  }
  return (NSArray *)v5;
}

- (NSArray)sortedSourceNames
{
  if (self) {
    self = (DSSharingPerson *)self->_sources;
  }
  v2 = [(DSSharingPerson *)self allKeys];
  id v3 = [v2 sortedArrayUsingComparator:&__block_literal_global_6];

  return (NSArray *)v3;
}

uint64_t __36__DSSharingPerson_sortedSourceNames__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = +[DSSourceDescriptor sourceDescriptorForSource:a2];
  uint64_t v6 = +[DSSourceDescriptor sourceDescriptorForSource:v4];

  uint64_t v7 = [v5 priority];
  if (v7 >= [v6 priority])
  {
    uint64_t v9 = [v5 priority];
    if (v9 <= [v6 priority])
    {
      int v10 = [v5 localizedName];
      uint64_t v11 = [v6 localizedName];
      uint64_t v8 = [v10 localizedStandardCompare:v11];
    }
    else
    {
      uint64_t v8 = -1;
    }
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

- (NSArray)allSources
{
  if (self) {
    self = (DSSharingPerson *)self->_sources;
  }
  return (NSArray *)[(DSSharingPerson *)self allValues];
}

- (NSString)localizedDetail
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [(DSSharingPerson *)self sortedSourceNames];
  id v3 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = +[DSSourceDescriptor sourceDescriptorForSource:](DSSourceDescriptor, "sourceDescriptorForSource:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        int v10 = [v9 localizedName];
        [v3 addObject:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  uint64_t v11 = +[DSUtilities localizedDetailStringWithTruncationFromArray:v3 withType:@"com.apple.DigitalSeparation.Resources"];

  return (NSString *)v11;
}

- (void)stopSharingSources:(id)a3 queue:(id)a4 completion:(id)a5
{
  uint64_t v161 = *MEMORY[0x263EF8340];
  id v7 = a3;
  queue = a4;
  id v118 = a5;
  v128 = [MEMORY[0x263EFF980] array];
  uint64_t v8 = dispatch_group_create();
  os_signpost_id_t v9 = os_signpost_id_generate((os_log_t)DSLogSharingPerson);
  int v10 = (id)DSLogSharingPerson;
  uint64_t v11 = v10;
  os_signpost_id_t spid = v9;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_236090000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "stop", " enableTelemetry=YES ", buf, 2u);
  }

  long long v149 = 0u;
  long long v150 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  id obj = v7;
  uint64_t v124 = [obj countByEnumeratingWithState:&v147 objects:v160 count:16];
  if (v124)
  {
    v117 = &v159;
    uint64_t v122 = *(void *)v148;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v148 != v122)
        {
          uint64_t v13 = v12;
          objc_enumerationMutation(obj);
          uint64_t v12 = v13;
        }
        uint64_t v125 = v12;
        long long v14 = *(void **)(*((void *)&v147 + 1) + 8 * v12);
        long long v15 = objc_msgSend(v14, "name", v117);
        BOOL v16 = +[DSRestrictionStore isSourceRestricted:v15];

        if (v16)
        {
          long long v17 = (void *)DSLogSharingPerson;
          if (os_log_type_enabled((os_log_t)DSLogSharingPerson, OS_LOG_TYPE_INFO))
          {
            uint64_t v18 = v17;
            uint64_t v19 = [v14 name];
            *(_DWORD *)buf = 138412290;
            v155 = v19;
            _os_log_impl(&dword_236090000, v18, OS_LOG_TYPE_INFO, "Cannot reset %@ due to restrictions", buf, 0xCu);
          }
          long long v20 = [v14 name];
          uint64_t v21 = +[DSError errorWithCode:6 sourceName:v20];
          [v128 addObject:v21];

          goto LABEL_127;
        }
        objc_initWeak(&location, self);
        if (self) {
          participantsBySource = self->_participantsBySource;
        }
        else {
          participantsBySource = 0;
        }
        int v23 = participantsBySource;
        id v24 = [v14 name];
        __int16 v25 = [(NSMutableDictionary *)v23 objectForKeyedSubscript:v24];
        v126 = (void *)[v25 copy];

        if ((unint64_t)[v126 count] < 2 || (objc_opt_respondsToSelector() & 1) == 0)
        {
          long long v139 = 0u;
          long long v140 = 0u;
          long long v137 = 0u;
          long long v138 = 0u;
          id v127 = v126;
          uint64_t v34 = [v127 countByEnumeratingWithState:&v137 objects:v153 count:16];
          if (!v34) {
            goto LABEL_81;
          }
          uint64_t v35 = *(void *)v138;
          while (1)
          {
            uint64_t v36 = 0;
            do
            {
              if (*(void *)v138 != v35) {
                objc_enumerationMutation(v127);
              }
              id v37 = *(void **)(*((void *)&v137 + 1) + 8 * v36);
              dispatch_group_enter(v8);
              v38 = (char *)os_signpost_id_generate((os_log_t)DSLogSharingPerson);
              id v39 = [v14 name];
              int v40 = [v39 isEqualToString:@"com.apple.DigitalSeparation.Calendars"];

              if (v40)
              {
                long long v41 = (id)DSLogSharingPerson;
                v42 = v41;
                if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
                {
                  *(_WORD *)buf = 0;
                  uint64_t v43 = v42;
                  os_signpost_id_t v44 = (os_signpost_id_t)v38;
                  v45 = "stop.Calendars";
LABEL_70:
                  _os_signpost_emit_with_name_impl(&dword_236090000, v43, OS_SIGNPOST_INTERVAL_BEGIN, v44, v45, " enableTelemetry=YES ", buf, 2u);
                }
              }
              else
              {
                uint64_t v46 = [v14 name];
                int v47 = [v46 isEqualToString:@"com.apple.DigitalSeparation.FindMy"];

                if (v47)
                {
                  uint64_t v48 = (id)DSLogSharingPerson;
                  v42 = v48;
                  if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
                  {
                    *(_WORD *)buf = 0;
                    uint64_t v43 = v42;
                    os_signpost_id_t v44 = (os_signpost_id_t)v38;
                    v45 = "stop.FindMy";
                    goto LABEL_70;
                  }
                }
                else
                {
                  id v49 = [v14 name];
                  int v50 = [v49 isEqualToString:@"com.apple.DigitalSeparation.Photos"];

                  if (v50)
                  {
                    long long v51 = (id)DSLogSharingPerson;
                    v42 = v51;
                    if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
                    {
                      *(_WORD *)buf = 0;
                      uint64_t v43 = v42;
                      os_signpost_id_t v44 = (os_signpost_id_t)v38;
                      v45 = "stop.Photos";
                      goto LABEL_70;
                    }
                  }
                  else
                  {
                    long long v52 = [v14 name];
                    int v53 = [v52 isEqualToString:@"com.apple.DigitalSeparation.HomeKit.HomeSharing"];

                    if (v53)
                    {
                      long long v54 = (id)DSLogSharingPerson;
                      v42 = v54;
                      if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
                      {
                        *(_WORD *)buf = 0;
                        uint64_t v43 = v42;
                        os_signpost_id_t v44 = (os_signpost_id_t)v38;
                        v45 = "stop.Home";
                        goto LABEL_70;
                      }
                    }
                    else
                    {
                      id v55 = [v14 name];
                      int v56 = [v55 isEqualToString:@"com.apple.DigitalSeparation.HealthKit.HealthSharing"];

                      if (v56)
                      {
                        long long v57 = (id)DSLogSharingPerson;
                        v42 = v57;
                        if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
                        {
                          *(_WORD *)buf = 0;
                          uint64_t v43 = v42;
                          os_signpost_id_t v44 = (os_signpost_id_t)v38;
                          v45 = "stop.Health";
                          goto LABEL_70;
                        }
                      }
                      else
                      {
                        long long v58 = [v14 name];
                        int v59 = [v58 isEqualToString:@"com.apple.DigitalSeparation.Notes"];

                        if (v59)
                        {
                          v60 = (id)DSLogSharingPerson;
                          v42 = v60;
                          if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v60))
                          {
                            *(_WORD *)buf = 0;
                            uint64_t v43 = v42;
                            os_signpost_id_t v44 = (os_signpost_id_t)v38;
                            v45 = "stop.Notes";
                            goto LABEL_70;
                          }
                        }
                        else
                        {
                          v61 = [v14 name];
                          int v62 = [v61 isEqualToString:@"com.apple.DigitalSeparation.Zelkova"];

                          if (v62)
                          {
                            uint64_t v63 = (id)DSLogSharingPerson;
                            v42 = v63;
                            if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
                            {
                              *(_WORD *)buf = 0;
                              uint64_t v43 = v42;
                              os_signpost_id_t v44 = (os_signpost_id_t)v38;
                              v45 = "stop.Zelkova";
                              goto LABEL_70;
                            }
                          }
                          else
                          {
                            __int16 v64 = [v14 name];
                            int v65 = [v64 isEqualToString:@"com.apple.DigitalSeparation.Fitness"];

                            if (v65)
                            {
                              v66 = (id)DSLogSharingPerson;
                              v42 = v66;
                              if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v66))
                              {
                                *(_WORD *)buf = 0;
                                uint64_t v43 = v42;
                                os_signpost_id_t v44 = (os_signpost_id_t)v38;
                                v45 = "stop.Activity";
                                goto LABEL_70;
                              }
                            }
                            else
                            {
                              v67 = [v14 name];
                              int v68 = [v67 isEqualToString:@"com.apple.DigitalSeparation.PassKeys"];

                              if (v68)
                              {
                                v69 = (id)DSLogSharingPerson;
                                v42 = v69;
                                if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v69))
                                {
                                  *(_WORD *)buf = 0;
                                  uint64_t v43 = v42;
                                  os_signpost_id_t v44 = (os_signpost_id_t)v38;
                                  v45 = "stop.Passkeys";
                                  goto LABEL_70;
                                }
                              }
                              else
                              {
                                v70 = [v14 name];
                                int v71 = [v70 isEqualToString:@"com.apple.DigitalSeparation.ItemSharing"];

                                if (v71)
                                {
                                  v72 = (id)DSLogSharingPerson;
                                  v42 = v72;
                                  if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v72))
                                  {
                                    *(_WORD *)buf = 0;
                                    uint64_t v43 = v42;
                                    os_signpost_id_t v44 = (os_signpost_id_t)v38;
                                    v45 = "stop.ItemSharing";
                                    goto LABEL_70;
                                  }
                                }
                                else
                                {
                                  v73 = [v14 name];
                                  int v74 = [v73 isEqualToString:@"com.apple.DigitalSeparation.Maps"];

                                  v75 = (id)DSLogSharingPerson;
                                  v42 = v75;
                                  if (v74)
                                  {
                                    if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v75))
                                    {
                                      *(_WORD *)buf = 0;
                                      uint64_t v43 = v42;
                                      os_signpost_id_t v44 = (os_signpost_id_t)v38;
                                      v45 = "stop.Maps";
                                      goto LABEL_70;
                                    }
                                  }
                                  else
                                  {
                                    if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v75))
                                    {
                                      *(_WORD *)buf = 0;
                                      _os_signpost_emit_with_name_impl(&dword_236090000, v42, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v38, "stop.Notes", " enableTelemetry=YES ", buf, 2u);
                                    }

                                    v42 = (id)DSLogSharingPerson;
                                    if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
                                    {
                                      v78 = [v14 name];
                                      -[DSSharingPerson stopSharingSources:queue:completion:](v78, v151, &v152, v42);
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }

              v76 = (id)DSLogSharingPerson;
              if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
              {
                v77 = [v14 name];
                *(_DWORD *)buf = 138478083;
                v155 = v37;
                __int16 v156 = 2114;
                v157 = v77;
                _os_log_impl(&dword_236090000, v76, OS_LOG_TYPE_INFO, "Stopping sharing of %{private}@ from source %{public}@", buf, 0x16u);
              }
              v133[0] = MEMORY[0x263EF8330];
              v133[1] = 3221225472;
              v133[2] = __55__DSSharingPerson_stopSharingSources_queue_completion___block_invoke_315;
              v133[3] = &unk_264C9ED08;
              v133[4] = v14;
              v133[5] = v37;
              id v134 = v128;
              objc_copyWeak(v136, &location);
              v136[1] = v38;
              v135 = v8;
              [v14 stopSharingWithParticipant:v37 completion:v133];

              objc_destroyWeak(v136);
              ++v36;
            }
            while (v34 != v36);
            uint64_t v79 = [v127 countByEnumeratingWithState:&v137 objects:v153 count:16];
            uint64_t v34 = v79;
            if (!v79)
            {
LABEL_81:

              goto LABEL_126;
            }
          }
        }
        dispatch_group_enter(v8);
        uint64_t v26 = (char *)os_signpost_id_generate((os_log_t)DSLogSharingPerson);
        uint64_t v27 = [v14 name];
        int v28 = [v27 isEqualToString:@"com.apple.DigitalSeparation.Calendars"];

        if (v28)
        {
          id v29 = (id)DSLogSharingPerson;
          v30 = v29;
          if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
          {
            *(_WORD *)buf = 0;
            uint64_t v31 = v30;
            os_signpost_id_t v32 = (os_signpost_id_t)v26;
            v33 = "stopParticipants.Calendars";
LABEL_122:
            _os_signpost_emit_with_name_impl(&dword_236090000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v32, v33, " enableTelemetry=YES ", buf, 2u);
          }
        }
        else
        {
          v80 = [v14 name];
          int v81 = [v80 isEqualToString:@"com.apple.DigitalSeparation.FindMy"];

          if (v81)
          {
            v82 = (id)DSLogSharingPerson;
            v30 = v82;
            if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v82))
            {
              *(_WORD *)buf = 0;
              uint64_t v31 = v30;
              os_signpost_id_t v32 = (os_signpost_id_t)v26;
              v33 = "stopParticipants.FindMy";
              goto LABEL_122;
            }
          }
          else
          {
            v83 = [v14 name];
            int v84 = [v83 isEqualToString:@"com.apple.DigitalSeparation.Photos"];

            if (v84)
            {
              v85 = (id)DSLogSharingPerson;
              v30 = v85;
              if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v85))
              {
                *(_WORD *)buf = 0;
                uint64_t v31 = v30;
                os_signpost_id_t v32 = (os_signpost_id_t)v26;
                v33 = "stopParticipants.Photos";
                goto LABEL_122;
              }
            }
            else
            {
              v86 = [v14 name];
              int v87 = [v86 isEqualToString:@"com.apple.DigitalSeparation.HomeKit.HomeSharing"];

              if (v87)
              {
                v88 = (id)DSLogSharingPerson;
                v30 = v88;
                if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v88))
                {
                  *(_WORD *)buf = 0;
                  uint64_t v31 = v30;
                  os_signpost_id_t v32 = (os_signpost_id_t)v26;
                  v33 = "stopParticipants.Home";
                  goto LABEL_122;
                }
              }
              else
              {
                v89 = [v14 name];
                int v90 = [v89 isEqualToString:@"com.apple.DigitalSeparation.HealthKit.HealthSharing"];

                if (v90)
                {
                  v91 = (id)DSLogSharingPerson;
                  v30 = v91;
                  if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v91))
                  {
                    *(_WORD *)buf = 0;
                    uint64_t v31 = v30;
                    os_signpost_id_t v32 = (os_signpost_id_t)v26;
                    v33 = "stopParticipants.Health";
                    goto LABEL_122;
                  }
                }
                else
                {
                  v92 = [v14 name];
                  int v93 = [v92 isEqualToString:@"com.apple.DigitalSeparation.Notes"];

                  if (v93)
                  {
                    v94 = (id)DSLogSharingPerson;
                    v30 = v94;
                    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v94))
                    {
                      *(_WORD *)buf = 0;
                      uint64_t v31 = v30;
                      os_signpost_id_t v32 = (os_signpost_id_t)v26;
                      v33 = "stopParticipants.Notes";
                      goto LABEL_122;
                    }
                  }
                  else
                  {
                    v95 = [v14 name];
                    int v96 = [v95 isEqualToString:@"com.apple.DigitalSeparation.Zelkova"];

                    if (v96)
                    {
                      v97 = (id)DSLogSharingPerson;
                      v30 = v97;
                      if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v97))
                      {
                        *(_WORD *)buf = 0;
                        uint64_t v31 = v30;
                        os_signpost_id_t v32 = (os_signpost_id_t)v26;
                        v33 = "stopParticipants.Zelkova";
                        goto LABEL_122;
                      }
                    }
                    else
                    {
                      v98 = [v14 name];
                      int v99 = [v98 isEqualToString:@"com.apple.DigitalSeparation.Fitness"];

                      if (v99)
                      {
                        v100 = (id)DSLogSharingPerson;
                        v30 = v100;
                        if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v100))
                        {
                          *(_WORD *)buf = 0;
                          uint64_t v31 = v30;
                          os_signpost_id_t v32 = (os_signpost_id_t)v26;
                          v33 = "stopParticipants.Activity";
                          goto LABEL_122;
                        }
                      }
                      else
                      {
                        v101 = [v14 name];
                        int v102 = [v101 isEqualToString:@"com.apple.DigitalSeparation.PassKeys"];

                        if (v102)
                        {
                          v103 = (id)DSLogSharingPerson;
                          v30 = v103;
                          if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v103))
                          {
                            *(_WORD *)buf = 0;
                            uint64_t v31 = v30;
                            os_signpost_id_t v32 = (os_signpost_id_t)v26;
                            v33 = "stopParticipants.Passkeys";
                            goto LABEL_122;
                          }
                        }
                        else
                        {
                          v104 = [v14 name];
                          int v105 = [v104 isEqualToString:@"com.apple.DigitalSeparation.ItemSharing"];

                          if (v105)
                          {
                            v106 = (id)DSLogSharingPerson;
                            v30 = v106;
                            if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v106))
                            {
                              *(_WORD *)buf = 0;
                              uint64_t v31 = v30;
                              os_signpost_id_t v32 = (os_signpost_id_t)v26;
                              v33 = "stopParticipants.ItemSharing";
                              goto LABEL_122;
                            }
                          }
                          else
                          {
                            v107 = [v14 name];
                            int v108 = [v107 isEqualToString:@"com.apple.DigitalSeparation.Maps"];

                            v109 = (id)DSLogSharingPerson;
                            v30 = v109;
                            if (v108)
                            {
                              if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v109))
                              {
                                *(_WORD *)buf = 0;
                                uint64_t v31 = v30;
                                os_signpost_id_t v32 = (os_signpost_id_t)v26;
                                v33 = "stopParticipants.Maps";
                                goto LABEL_122;
                              }
                            }
                            else
                            {
                              if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v109))
                              {
                                *(_WORD *)buf = 0;
                                _os_signpost_emit_with_name_impl(&dword_236090000, v30, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v26, "stopParticipants.Notes", " enableTelemetry=YES ", buf, 2u);
                              }

                              v30 = (id)DSLogSharingPerson;
                              if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
                              {
                                v113 = [v14 name];
                                -[DSSharingPerson stopSharingSources:queue:completion:](v113, v158, v117, v30);
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }

        v110 = (id)DSLogSharingPerson;
        if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
        {
          v111 = [v14 name];
          *(_DWORD *)buf = 138478083;
          v155 = v126;
          __int16 v156 = 2114;
          v157 = v111;
          _os_log_impl(&dword_236090000, v110, OS_LOG_TYPE_INFO, "Stopping sharing of participants %{private}@ from source %{public}@", buf, 0x16u);
        }
        v141[0] = MEMORY[0x263EF8330];
        v141[1] = 3221225472;
        v141[2] = __55__DSSharingPerson_stopSharingSources_queue_completion___block_invoke;
        v141[3] = &unk_264C9ED08;
        v141[4] = v14;
        id v112 = v126;
        id v142 = v112;
        id v143 = v128;
        objc_copyWeak(v145, &location);
        v145[1] = v26;
        v144 = v8;
        [v14 stopSharingWithParticipants:v112 completion:v141];

        objc_destroyWeak(v145);
LABEL_126:

        objc_destroyWeak(&location);
LABEL_127:
        uint64_t v12 = v125 + 1;
      }
      while (v125 + 1 != v124);
      uint64_t v114 = [obj countByEnumeratingWithState:&v147 objects:v160 count:16];
      uint64_t v124 = v114;
    }
    while (v114);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__DSSharingPerson_stopSharingSources_queue_completion___block_invoke_316;
  block[3] = &unk_264C9E9A0;
  id v130 = v128;
  id v131 = v118;
  os_signpost_id_t v132 = spid;
  id v115 = v118;
  id v116 = v128;
  dispatch_group_notify(v8, queue, block);
}

void __55__DSSharingPerson_stopSharingSources_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)DSLogSharingPerson;
  if (os_log_type_enabled((os_log_t)DSLogSharingPerson, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = v4;
    id v7 = [v5 name];
    *(_DWORD *)buf = 138543362;
    v72 = v7;
    _os_log_impl(&dword_236090000, v6, OS_LOG_TYPE_INFO, "Stopping sharing with %{public}@ for participants complete", buf, 0xCu);
  }
  uint64_t v8 = (void *)MEMORY[0x263F087E8];
  os_signpost_id_t v9 = (id *)(a1 + 32);
  int v10 = [*(id *)(a1 + 32) name];
  uint64_t v11 = objc_msgSend(v8, "ds_errorFromIgnorableError:sourceName:", v3, v10);

  if (v11)
  {
    uint64_t v12 = (void *)DSLogSharingPerson;
    if (os_log_type_enabled((os_log_t)DSLogSharingPerson, OS_LOG_TYPE_ERROR))
    {
      int v40 = *(void **)(a1 + 32);
      long long v41 = v12;
      v42 = [v40 name];
      uint64_t v43 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543875;
      v72 = v42;
      __int16 v73 = 2113;
      uint64_t v74 = v43;
      __int16 v75 = 2114;
      v76 = v11;
      _os_log_error_impl(&dword_236090000, v41, OS_LOG_TYPE_ERROR, "Failed to stop sharing on source %{public}@ for participants %{private}@ because %{public}@", buf, 0x20u);
    }
    uint64_t v13 = [*(id *)(a1 + 32) name];
    v70 = v11;
    long long v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v70 count:1];
    id v15 = +[DSError errorWithCode:2 sourceName:v13 underlyingErrors:v14];

    [*(id *)(a1 + 48) addObject:v15];
  }
  else
  {
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v15 = *(id *)(a1 + 40);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v65 objects:v69 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v66 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v65 + 1) + 8 * i);
          id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
          objc_msgSend(WeakRetained, "removeParticipant:fromSource:", v20, *v9, (void)v65);
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v65 objects:v69 count:16];
      }
      while (v17);
    }
  }

  uint64_t v22 = [*v9 name];
  int v23 = [v22 isEqualToString:@"com.apple.DigitalSeparation.Calendars"];

  if (v23)
  {
    id v24 = (id)DSLogSharingPerson;
    __int16 v25 = v24;
    os_signpost_id_t v26 = *(void *)(a1 + 72);
    if (v26 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v24)) {
      goto LABEL_55;
    }
    *(_WORD *)buf = 0;
    uint64_t v27 = "stopParticipants.Calendars";
LABEL_54:
    _os_signpost_emit_with_name_impl(&dword_236090000, v25, OS_SIGNPOST_INTERVAL_END, v26, v27, " enableTelemetry=YES ", buf, 2u);
LABEL_55:

    goto LABEL_56;
  }
  int v28 = [*v9 name];
  int v29 = [v28 isEqualToString:@"com.apple.DigitalSeparation.FindMy"];

  if (v29)
  {
    v30 = (id)DSLogSharingPerson;
    __int16 v25 = v30;
    os_signpost_id_t v26 = *(void *)(a1 + 72);
    if (v26 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v30)) {
      goto LABEL_55;
    }
    *(_WORD *)buf = 0;
    uint64_t v27 = "stopParticipants.FindMy";
    goto LABEL_54;
  }
  uint64_t v31 = [*v9 name];
  int v32 = [v31 isEqualToString:@"com.apple.DigitalSeparation.Photos"];

  if (v32)
  {
    v33 = (id)DSLogSharingPerson;
    __int16 v25 = v33;
    os_signpost_id_t v26 = *(void *)(a1 + 72);
    if (v26 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v33)) {
      goto LABEL_55;
    }
    *(_WORD *)buf = 0;
    uint64_t v27 = "stopParticipants.Photos";
    goto LABEL_54;
  }
  uint64_t v34 = [*v9 name];
  int v35 = [v34 isEqualToString:@"com.apple.DigitalSeparation.HomeKit.HomeSharing"];

  if (v35)
  {
    uint64_t v36 = (id)DSLogSharingPerson;
    __int16 v25 = v36;
    os_signpost_id_t v26 = *(void *)(a1 + 72);
    if (v26 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v36)) {
      goto LABEL_55;
    }
    *(_WORD *)buf = 0;
    uint64_t v27 = "stopParticipants.Home";
    goto LABEL_54;
  }
  id v37 = [*v9 name];
  int v38 = [v37 isEqualToString:@"com.apple.DigitalSeparation.HealthKit.HealthSharing"];

  if (v38)
  {
    id v39 = (id)DSLogSharingPerson;
    __int16 v25 = v39;
    os_signpost_id_t v26 = *(void *)(a1 + 72);
    if (v26 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v39)) {
      goto LABEL_55;
    }
    *(_WORD *)buf = 0;
    uint64_t v27 = "stopParticipants.Health";
    goto LABEL_54;
  }
  os_signpost_id_t v44 = [*v9 name];
  int v45 = [v44 isEqualToString:@"com.apple.DigitalSeparation.Notes"];

  if (v45)
  {
    uint64_t v46 = (id)DSLogSharingPerson;
    __int16 v25 = v46;
    os_signpost_id_t v26 = *(void *)(a1 + 72);
    if (v26 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v46)) {
      goto LABEL_55;
    }
    *(_WORD *)buf = 0;
    uint64_t v27 = "stopParticipants.Notes";
    goto LABEL_54;
  }
  int v47 = [*v9 name];
  int v48 = [v47 isEqualToString:@"com.apple.DigitalSeparation.Zelkova"];

  if (v48)
  {
    id v49 = (id)DSLogSharingPerson;
    __int16 v25 = v49;
    os_signpost_id_t v26 = *(void *)(a1 + 72);
    if (v26 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v49)) {
      goto LABEL_55;
    }
    *(_WORD *)buf = 0;
    uint64_t v27 = "stopParticipants.Zelkova";
    goto LABEL_54;
  }
  int v50 = [*v9 name];
  int v51 = [v50 isEqualToString:@"com.apple.DigitalSeparation.Fitness"];

  if (v51)
  {
    long long v52 = (id)DSLogSharingPerson;
    __int16 v25 = v52;
    os_signpost_id_t v26 = *(void *)(a1 + 72);
    if (v26 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v52)) {
      goto LABEL_55;
    }
    *(_WORD *)buf = 0;
    uint64_t v27 = "stopParticipants.Activity";
    goto LABEL_54;
  }
  int v53 = [*v9 name];
  int v54 = [v53 isEqualToString:@"com.apple.DigitalSeparation.PassKeys"];

  if (v54)
  {
    id v55 = (id)DSLogSharingPerson;
    __int16 v25 = v55;
    os_signpost_id_t v26 = *(void *)(a1 + 72);
    if (v26 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v55)) {
      goto LABEL_55;
    }
    *(_WORD *)buf = 0;
    uint64_t v27 = "stopParticipants.Passkeys";
    goto LABEL_54;
  }
  int v56 = [*v9 name];
  int v57 = [v56 isEqualToString:@"com.apple.DigitalSeparation.ItemSharing"];

  if (v57)
  {
    long long v58 = (id)DSLogSharingPerson;
    __int16 v25 = v58;
    os_signpost_id_t v26 = *(void *)(a1 + 72);
    if (v26 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v58)) {
      goto LABEL_55;
    }
    *(_WORD *)buf = 0;
    uint64_t v27 = "stopParticipants.ItemSharing";
    goto LABEL_54;
  }
  int v59 = [*(id *)(a1 + 32) name];
  int v60 = [v59 isEqualToString:@"com.apple.DigitalSeparation.Maps"];

  v61 = (id)DSLogSharingPerson;
  int v62 = v61;
  os_signpost_id_t v63 = *(void *)(a1 + 72);
  if (v60)
  {
    if (v63 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_236090000, v62, OS_SIGNPOST_INTERVAL_END, v63, "stopParticipants.Maps", " enableTelemetry=YES ", buf, 2u);
    }
  }
  else
  {
    if (v63 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_236090000, v62, OS_SIGNPOST_INTERVAL_END, v63, "stopParticipants.Notes", " enableTelemetry=YES ", buf, 2u);
    }

    __int16 v64 = (void *)DSLogSharingPerson;
    if (os_log_type_enabled((os_log_t)DSLogSharingPerson, OS_LOG_TYPE_FAULT)) {
      __55__DSSharingPerson_stopSharingSources_queue_completion___block_invoke_cold_1((void **)(a1 + 32), v64);
    }
  }
LABEL_56:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __55__DSSharingPerson_stopSharingSources_queue_completion___block_invoke_315(uint64_t a1, void *a2)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)DSLogSharingPerson;
  if (os_log_type_enabled((os_log_t)DSLogSharingPerson, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = v4;
    id v7 = [v5 name];
    *(_DWORD *)buf = 138543362;
    v61 = v7;
    _os_log_impl(&dword_236090000, v6, OS_LOG_TYPE_INFO, "Stopping sharing with %{public}@ complete", buf, 0xCu);
  }
  uint64_t v8 = (void *)MEMORY[0x263F087E8];
  os_signpost_id_t v9 = (id *)(a1 + 32);
  int v10 = [*(id *)(a1 + 32) name];
  uint64_t v11 = objc_msgSend(v8, "ds_errorFromIgnorableError:sourceName:", v3, v10);

  if (v11)
  {
    uint64_t v12 = (void *)DSLogSharingPerson;
    if (os_log_type_enabled((os_log_t)DSLogSharingPerson, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = *(void **)(a1 + 32);
      int v35 = v12;
      uint64_t v36 = [v34 name];
      uint64_t v37 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v61 = v36;
      __int16 v62 = 2114;
      uint64_t v63 = v37;
      __int16 v64 = 2114;
      long long v65 = v11;
      _os_log_error_impl(&dword_236090000, v35, OS_LOG_TYPE_ERROR, "Failed to stop sharing on source %{public}@ for %{public}@ because %{public}@", buf, 0x20u);
    }
    uint64_t v13 = [*(id *)(a1 + 32) name];
    int v59 = v11;
    long long v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v59 count:1];
    id WeakRetained = +[DSError errorWithCode:2 sourceName:v13 underlyingErrors:v14];

    [*(id *)(a1 + 48) addObject:WeakRetained];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    [WeakRetained removeParticipant:*(void *)(a1 + 40) fromSource:*(void *)(a1 + 32)];
  }

  uint64_t v16 = [*v9 name];
  int v17 = [v16 isEqualToString:@"com.apple.DigitalSeparation.Calendars"];

  if (v17)
  {
    uint64_t v18 = (id)DSLogSharingPerson;
    uint64_t v19 = v18;
    os_signpost_id_t v20 = *(void *)(a1 + 72);
    if (v20 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v18)) {
      goto LABEL_49;
    }
    *(_WORD *)buf = 0;
    uint64_t v21 = "stop.Calendars";
LABEL_48:
    _os_signpost_emit_with_name_impl(&dword_236090000, v19, OS_SIGNPOST_INTERVAL_END, v20, v21, " enableTelemetry=YES ", buf, 2u);
LABEL_49:

    goto LABEL_50;
  }
  uint64_t v22 = [*v9 name];
  int v23 = [v22 isEqualToString:@"com.apple.DigitalSeparation.FindMy"];

  if (v23)
  {
    id v24 = (id)DSLogSharingPerson;
    uint64_t v19 = v24;
    os_signpost_id_t v20 = *(void *)(a1 + 72);
    if (v20 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v24)) {
      goto LABEL_49;
    }
    *(_WORD *)buf = 0;
    uint64_t v21 = "stop.FindMy";
    goto LABEL_48;
  }
  __int16 v25 = [*v9 name];
  int v26 = [v25 isEqualToString:@"com.apple.DigitalSeparation.Photos"];

  if (v26)
  {
    uint64_t v27 = (id)DSLogSharingPerson;
    uint64_t v19 = v27;
    os_signpost_id_t v20 = *(void *)(a1 + 72);
    if (v20 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v27)) {
      goto LABEL_49;
    }
    *(_WORD *)buf = 0;
    uint64_t v21 = "stop.Photos";
    goto LABEL_48;
  }
  int v28 = [*v9 name];
  int v29 = [v28 isEqualToString:@"com.apple.DigitalSeparation.HomeKit.HomeSharing"];

  if (v29)
  {
    v30 = (id)DSLogSharingPerson;
    uint64_t v19 = v30;
    os_signpost_id_t v20 = *(void *)(a1 + 72);
    if (v20 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v30)) {
      goto LABEL_49;
    }
    *(_WORD *)buf = 0;
    uint64_t v21 = "stop.Home";
    goto LABEL_48;
  }
  uint64_t v31 = [*v9 name];
  int v32 = [v31 isEqualToString:@"com.apple.DigitalSeparation.HealthKit.HealthSharing"];

  if (v32)
  {
    v33 = (id)DSLogSharingPerson;
    uint64_t v19 = v33;
    os_signpost_id_t v20 = *(void *)(a1 + 72);
    if (v20 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v33)) {
      goto LABEL_49;
    }
    *(_WORD *)buf = 0;
    uint64_t v21 = "stop.Health";
    goto LABEL_48;
  }
  int v38 = [*v9 name];
  int v39 = [v38 isEqualToString:@"com.apple.DigitalSeparation.Notes"];

  if (v39)
  {
    int v40 = (id)DSLogSharingPerson;
    uint64_t v19 = v40;
    os_signpost_id_t v20 = *(void *)(a1 + 72);
    if (v20 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v40)) {
      goto LABEL_49;
    }
    *(_WORD *)buf = 0;
    uint64_t v21 = "stop.Notes";
    goto LABEL_48;
  }
  long long v41 = [*v9 name];
  int v42 = [v41 isEqualToString:@"com.apple.DigitalSeparation.Zelkova"];

  if (v42)
  {
    uint64_t v43 = (id)DSLogSharingPerson;
    uint64_t v19 = v43;
    os_signpost_id_t v20 = *(void *)(a1 + 72);
    if (v20 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v43)) {
      goto LABEL_49;
    }
    *(_WORD *)buf = 0;
    uint64_t v21 = "stop.Zelkova";
    goto LABEL_48;
  }
  os_signpost_id_t v44 = [*v9 name];
  int v45 = [v44 isEqualToString:@"com.apple.DigitalSeparation.Fitness"];

  if (v45)
  {
    uint64_t v46 = (id)DSLogSharingPerson;
    uint64_t v19 = v46;
    os_signpost_id_t v20 = *(void *)(a1 + 72);
    if (v20 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v46)) {
      goto LABEL_49;
    }
    *(_WORD *)buf = 0;
    uint64_t v21 = "stop.Activity";
    goto LABEL_48;
  }
  int v47 = [*v9 name];
  int v48 = [v47 isEqualToString:@"com.apple.DigitalSeparation.PassKeys"];

  if (v48)
  {
    id v49 = (id)DSLogSharingPerson;
    uint64_t v19 = v49;
    os_signpost_id_t v20 = *(void *)(a1 + 72);
    if (v20 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v49)) {
      goto LABEL_49;
    }
    *(_WORD *)buf = 0;
    uint64_t v21 = "stop.Passkeys";
    goto LABEL_48;
  }
  int v50 = [*v9 name];
  int v51 = [v50 isEqualToString:@"com.apple.DigitalSeparation.ItemSharing"];

  if (v51)
  {
    long long v52 = (id)DSLogSharingPerson;
    uint64_t v19 = v52;
    os_signpost_id_t v20 = *(void *)(a1 + 72);
    if (v20 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v52)) {
      goto LABEL_49;
    }
    *(_WORD *)buf = 0;
    uint64_t v21 = "stop.ItemSharing";
    goto LABEL_48;
  }
  int v53 = [*(id *)(a1 + 32) name];
  int v54 = [v53 isEqualToString:@"com.apple.DigitalSeparation.Maps"];

  id v55 = (id)DSLogSharingPerson;
  int v56 = v55;
  os_signpost_id_t v57 = *(void *)(a1 + 72);
  if (v54)
  {
    if (v57 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_236090000, v56, OS_SIGNPOST_INTERVAL_END, v57, "stop.Maps", " enableTelemetry=YES ", buf, 2u);
    }
  }
  else
  {
    if (v57 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_236090000, v56, OS_SIGNPOST_INTERVAL_END, v57, "stop.Notes", " enableTelemetry=YES ", buf, 2u);
    }

    long long v58 = (void *)DSLogSharingPerson;
    if (os_log_type_enabled((os_log_t)DSLogSharingPerson, OS_LOG_TYPE_FAULT)) {
      __55__DSSharingPerson_stopSharingSources_queue_completion___block_invoke_cold_1((void **)(a1 + 32), v58);
    }
  }
LABEL_50:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __55__DSSharingPerson_stopSharingSources_queue_completion___block_invoke_316(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    v2 = +[DSError errorWithCode:2 underlyingErrors:*(void *)(a1 + 32)];
  }
  else
  {
    v2 = 0;
  }
  id v3 = (id)DSLogSharingPerson;
  id v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 48);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_236090000, v4, OS_SIGNPOST_INTERVAL_END, v5, "stop", " enableTelemetry=YES ", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)stopSharingSourceNames:(id)a3 queue:(id)a4 completion:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x263EFF980] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        if (self) {
          sources = self->_sources;
        }
        else {
          sources = 0;
        }
        uint64_t v18 = -[NSMutableDictionary objectForKeyedSubscript:](sources, "objectForKeyedSubscript:", *(void *)(*((void *)&v20 + 1) + 8 * v16), (void)v20);
        if (v18) {
          [v11 addObject:v18];
        }

        ++v16;
      }
      while (v14 != v16);
      uint64_t v19 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      uint64_t v14 = v19;
    }
    while (v19);
  }

  [(DSSharingPerson *)self stopSharingSources:v11 queue:v9 completion:v10];
}

- (void)stopAllSharingOnQueue:(id)a3 completion:(id)a4
{
  if (self) {
    sources = self->_sources;
  }
  else {
    sources = 0;
  }
  id v7 = a4;
  id v8 = a3;
  id v9 = [(NSMutableDictionary *)sources allValues];
  [(DSSharingPerson *)self stopSharingSources:v9 queue:v8 completion:v7];
}

- (id)valueForKey:(id)a3
{
  if ([a3 isEqualToString:@"displayName"])
  {
    id v4 = [(DSSharingPerson *)self displayName];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareDirectionByResource, 0);
  objc_storeStrong((id *)&self->_shareDirectionBySourceName, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_names, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_sharedResourcesBySource, 0);
  objc_storeStrong((id *)&self->_participantsBySource, 0);
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

- (void)score
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a1) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = *(void *)(a2 + 16);
  }
  int v6 = 138412290;
  uint64_t v7 = v3;
  id v4 = a3;
  OUTLINED_FUNCTION_0_2(&dword_236090000, v4, v5, "Counting any more priorities in %@ will overflow", (uint8_t *)&v6);
}

- (void)stopSharingSources:(void *)a3 queue:(NSObject *)a4 completion:.cold.1(void *a1, uint8_t *a2, void *a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138543362;
  *a3 = a1;
  OUTLINED_FUNCTION_0_2(&dword_236090000, a4, (uint64_t)a3, "Signpost for unsupported source name %{public}@", a2);
}

void __55__DSSharingPerson_stopSharingSources_queue_completion___block_invoke_cold_1(void **a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = *a1;
  uint64_t v3 = a2;
  id v4 = [v2 name];
  int v6 = 138543362;
  uint64_t v7 = v4;
  OUTLINED_FUNCTION_0_2(&dword_236090000, v3, v5, "Signpost for unsupported source name %{public}@", (uint8_t *)&v6);
}

@end