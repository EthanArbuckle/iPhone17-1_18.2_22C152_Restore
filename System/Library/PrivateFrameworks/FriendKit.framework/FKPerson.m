@interface FKPerson
+ (BOOL)supportsSecureCoding;
+ (id)_allEmailValuesForRecord:(void *)a3;
+ (id)_allEmailValuesInSet:(id)a3;
+ (id)_allPhoneValuesForRecord:(void *)a3;
+ (id)_allPhoneValuesInSet:(id)a3;
+ (id)allValuesForPerson:(void *)a3;
+ (id)preferredNameForPerson:(void *)a3;
+ (id)sharedMetadataQueue;
+ (int)addValue:(void *)a3 withLabel:(__CFString *)a4 toPerson:(void *)a5 property:(int)a6;
- (BOOL)_updateFromDictionaryRepresentation:(id)a3 shouldLogUpdates:(BOOL)a4;
- (BOOL)hasName;
- (BOOL)hasUnreadMessages;
- (BOOL)isEqualToDictionaryRepresentation:(id)a3;
- (BOOL)isLikePerson:(id)a3;
- (BOOL)needsSave;
- (BOOL)updateFromDictionaryRepresentation:(id)a3;
- (FKPerson)init;
- (FKPerson)initWithABRecordGUID:(id)a3 addressBook:(void *)a4;
- (FKPerson)initWithCoder:(id)a3;
- (FKPerson)initWithDestinations:(id)a3 addressBook:(void *)a4;
- (FKPerson)initWithDictionaryRepresentation:(id)a3 addressBook:(void *)a4;
- (FKPerson)initWithFavorite:(id)a3 addressBook:(void *)a4;
- (NSDictionary)metadata;
- (NSString)preferredReplyAs;
- (float)_allValuesMatchScore:(id)a3;
- (id)_metadataDictionary;
- (id)_recordMatchDictionaryFromCFArray:(__CFArray *)a3 followLinks:(BOOL)a4 addressBook:(void *)a5;
- (id)abDatabaseUID;
- (id)abRecordGUID;
- (id)allValues;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayName;
- (id)initials;
- (id)metadataValueForKey:(id)a3;
- (id)primaryDestination;
- (unint64_t)allValuesCount;
- (void)_bestRecordMatchFromDictionary:(id)a3 addressBook:(void *)a4;
- (void)_postChangeNotification;
- (void)_reconcile:(void *)a3 canPostChangeNotification:(BOOL)a4 shouldLogUpdates:(BOOL)a5;
- (void)_setABRecordGUID:(id)a3;
- (void)addMetadataEntriesFromDictionary:(id)a3;
- (void)copyABPersonWithAddressBook:(void *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)refreshWithAddressBook:(void *)a3;
- (void)removeAllMetadataValues;
- (void)setMetadataValue:(id)a3 forKey:(id)a4;
- (void)setNeedsSave:(BOOL)a3;
- (void)setPreferredReplyAs:(id)a3;
@end

@implementation FKPerson

+ (id)sharedMetadataQueue
{
  if (sharedMetadataQueue_onceToken != -1) {
    dispatch_once(&sharedMetadataQueue_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)sharedMetadataQueue_metadataQueue;

  return v2;
}

uint64_t __31__FKPerson_sharedMetadataQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.FriendKit.FKPerson.metadata", MEMORY[0x263EF83A8]);
  uint64_t v1 = sharedMetadataQueue_metadataQueue;
  sharedMetadataQueue_metadataQueue = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (FKPerson)init
{
  v7.receiver = self;
  v7.super_class = (Class)FKPerson;
  v2 = [(FKPerson *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_abRecordID = -1;
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    metadata = v3->_metadata;
    v3->_metadata = (NSMutableDictionary *)v4;
  }
  return v3;
}

- (FKPerson)initWithDictionaryRepresentation:(id)a3 addressBook:(void *)a4
{
  id v5 = a3;
  v6 = [(FKPerson *)self init];
  objc_super v7 = v6;
  if (v6) {
    [(FKPerson *)v6 _updateFromDictionaryRepresentation:v5 shouldLogUpdates:0];
  }

  return v7;
}

- (FKPerson)initWithDestinations:(id)a3 addressBook:(void *)a4
{
  id v6 = a3;
  objc_super v7 = [(FKPerson *)self init];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263EFFA08] setWithArray:v6];
    allValues = v7->_allValues;
    v7->_allValues = (NSSet *)v8;

    [(FKPerson *)v7 _reconcile:a4 canPostChangeNotification:0 shouldLogUpdates:0];
  }

  return v7;
}

- (FKPerson)initWithABRecordGUID:(id)a3 addressBook:(void *)a4
{
  id v7 = a3;
  uint64_t v8 = [(FKPerson *)self init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_abRecordGUID, a3);
    [(FKPerson *)v9 _reconcile:a4 canPostChangeNotification:0 shouldLogUpdates:0];
  }

  return v9;
}

- (FKPerson)initWithFavorite:(id)a3 addressBook:(void *)a4
{
  id v6 = a3;
  id v7 = [(FKPerson *)self init];
  if (v7)
  {
    ABRecordID v8 = [v6 _abUid];
    ABRecordRef PersonWithRecordID = ABAddressBookGetPersonWithRecordID(a4, v8);
    if (PersonWithRecordID)
    {
      v7->_abRecordID = v8;
      v10 = (NSString *)ABRecordCopyValue(PersonWithRecordID, *MEMORY[0x263F24498]);
      abRecordGUID = v7->_abRecordGUID;
      v7->_abRecordGUID = v10;

      uint64_t v12 = ABAddressBookCopyUniqueIdentifier();
      abDatabaseUID = v7->_abDatabaseUID;
      v7->_abDatabaseUID = (NSString *)v12;

      [(FKPerson *)v7 _reconcile:a4 canPostChangeNotification:0 shouldLogUpdates:0];
    }
    else
    {
      uint64_t v14 = [v6 displayName];
      name = v7->_name;
      v7->_name = (NSString *)v14;

      v16 = [v6 value];
      v17 = [v16 fkMessageCanonicalRawAddress];

      uint64_t v18 = [MEMORY[0x263EFFA08] setWithObject:v17];
      allValues = v7->_allValues;
      v7->_allValues = (NSSet *)v18;
    }
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  primaryDestination = self->_primaryDestination;
  id v5 = a3;
  [v5 encodeObject:primaryDestination forKey:@"pd"];
  [v5 encodeObject:self->_initials forKey:@"i"];
  [v5 encodeObject:self->_phoneNumberCount forKey:@"pnc"];
  [v5 encodeObject:self->_emailAddressCount forKey:@"eac"];
  [v5 encodeInt64:self->_abRecordID forKey:@"abid"];
  [v5 encodeObject:self->_abRecordGUID forKey:@"abguid"];
  [v5 encodeObject:self->_abDatabaseUID forKey:@"abdbuid"];
  [v5 encodeObject:self->_name forKey:@"n"];
  [v5 encodeObject:self->_allValues forKey:@"av"];
  [v5 encodeObject:self->_metadata forKey:@"m"];
}

- (FKPerson)initWithCoder:(id)a3
{
  v34[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(FKPerson *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pd"];
    primaryDestination = v5->_primaryDestination;
    v5->_primaryDestination = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"i"];
    initials = v5->_initials;
    v5->_initials = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pnc"];
    phoneNumberCount = v5->_phoneNumberCount;
    v5->_phoneNumberCount = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eac"];
    emailAddressCount = v5->_emailAddressCount;
    v5->_emailAddressCount = (NSNumber *)v12;

    v5->_abRecordID = [v4 decodeInt64ForKey:@"abid"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"abguid"];
    abRecordGUID = v5->_abRecordGUID;
    v5->_abRecordGUID = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"abdbuid"];
    abDatabaseUID = v5->_abDatabaseUID;
    v5->_abDatabaseUID = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"n"];
    name = v5->_name;
    v5->_name = (NSString *)v18;

    v20 = (void *)MEMORY[0x263EFFA08];
    v34[0] = objc_opt_class();
    v34[1] = objc_opt_class();
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];
    v22 = [v20 setWithArray:v21];
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"av"];
    allValues = v5->_allValues;
    v5->_allValues = (NSSet *)v23;

    v25 = (void *)MEMORY[0x263EFF9A0];
    v26 = (void *)MEMORY[0x263EFFA08];
    v33[0] = objc_opt_class();
    v33[1] = objc_opt_class();
    v33[2] = objc_opt_class();
    v33[3] = objc_opt_class();
    v33[4] = objc_opt_class();
    v33[5] = objc_opt_class();
    v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:6];
    v28 = [v26 setWithArray:v27];
    v29 = [v4 decodeObjectOfClasses:v28 forKey:@"m"];
    uint64_t v30 = [v25 dictionaryWithDictionary:v29];
    metadata = v5->_metadata;
    v5->_metadata = (NSMutableDictionary *)v30;
  }
  return v5;
}

- (BOOL)_updateFromDictionaryRepresentation:(id)a3 shouldLogUpdates:(BOOL)a4
{
  BOOL v43 = a4;
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKey:@"ABRecordID"];
  int v7 = [v6 intValue];

  uint64_t v44 = [v5 objectForKey:@"ABRecordGUID"];
  uint64_t v8 = [v5 objectForKey:@"ABDatabaseUID"];
  uint64_t v9 = [v5 objectForKey:@"Name"];
  uint64_t v10 = (void *)MEMORY[0x263EFFA08];
  v11 = [v5 objectForKey:@"AllValues"];
  v42 = [v10 setWithArray:v11];

  uint64_t v12 = [v5 objectForKey:@"ReplyAs"];
  uint64_t v13 = [v5 objectForKey:@"Monogram"];
  uint64_t v14 = (void *)MEMORY[0x263EFF9A0];
  v15 = [v5 objectForKey:@"Metadata"];
  uint64_t v40 = [v14 dictionaryWithDictionary:v15];

  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2020000000;
  char v52 = 0;
  if (self->_abRecordID != v7)
  {
    self->_abRecordID = v7;
    char v52 = 1;
  }
  abRecordGUID = self->_abRecordGUID;
  if ((unint64_t)abRecordGUID | v44 && ![(NSString *)abRecordGUID isEqualToString:v44])
  {
    if (v43)
    {
      v17 = _FKGetLogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = self->_abRecordGUID;
        *(_DWORD *)buf = 136316162;
        v54 = "-[FKPerson _updateFromDictionaryRepresentation:shouldLogUpdates:]";
        __int16 v55 = 1024;
        int v56 = 195;
        __int16 v57 = 2112;
        v58 = self;
        __int16 v59 = 2112;
        v60 = (NSSet *)v18;
        __int16 v61 = 2112;
        uint64_t v62 = v44;
        _os_log_impl(&dword_21CBC2000, v17, OS_LOG_TYPE_DEFAULT, "%s (%d) \"%@ is being marked as updated due to abRecordGUID: %@ -> %@\"", buf, 0x30u);
      }
    }
    -[FKPerson _setABRecordGUID:](self, "_setABRecordGUID:", v44, v40);
    *((unsigned char *)v50 + 24) = 1;
  }
  abDatabaseUID = self->_abDatabaseUID;
  if ((unint64_t)abDatabaseUID | v8 && ![(NSString *)abDatabaseUID isEqualToString:v8])
  {
    if (v43)
    {
      v20 = _FKGetLogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = self->_abDatabaseUID;
        *(_DWORD *)buf = 136316162;
        v54 = "-[FKPerson _updateFromDictionaryRepresentation:shouldLogUpdates:]";
        __int16 v55 = 1024;
        int v56 = 201;
        __int16 v57 = 2112;
        v58 = self;
        __int16 v59 = 2112;
        v60 = (NSSet *)v21;
        __int16 v61 = 2112;
        uint64_t v62 = v8;
        _os_log_impl(&dword_21CBC2000, v20, OS_LOG_TYPE_DEFAULT, "%s (%d) \"%@ is being marked as updated due to abDatabaseUID: %@ -> %@\"", buf, 0x30u);
      }
    }
    objc_storeStrong((id *)&self->_abDatabaseUID, (id)v8);
    *((unsigned char *)v50 + 24) = 1;
  }
  name = self->_name;
  if ((unint64_t)name | v9 && ![(NSString *)name isEqualToString:v9])
  {
    if (v43)
    {
      uint64_t v23 = _FKGetLogSystem();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = self->_name;
        *(_DWORD *)buf = 136316162;
        v54 = "-[FKPerson _updateFromDictionaryRepresentation:shouldLogUpdates:]";
        __int16 v55 = 1024;
        int v56 = 207;
        __int16 v57 = 2112;
        v58 = self;
        __int16 v59 = 2112;
        v60 = (NSSet *)v24;
        __int16 v61 = 2112;
        uint64_t v62 = v9;
        _os_log_impl(&dword_21CBC2000, v23, OS_LOG_TYPE_DEFAULT, "%s (%d) \"%@ is being marked as updated due to name: '%@' -> '%@'\"", buf, 0x30u);
      }
    }
    objc_storeStrong((id *)&self->_name, (id)v9);
    *((unsigned char *)v50 + 24) = 1;
  }
  uint64_t v25 = objc_msgSend(v42, "fkSanitizedDestinationSet", v40);
  allValues = self->_allValues;
  if ((unint64_t)allValues | v25 && ![(NSSet *)allValues isEqualToSet:v25])
  {
    if (v43)
    {
      v27 = _FKGetLogSystem();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = self->_allValues;
        *(_DWORD *)buf = 136316162;
        v54 = "-[FKPerson _updateFromDictionaryRepresentation:shouldLogUpdates:]";
        __int16 v55 = 1024;
        int v56 = 216;
        __int16 v57 = 2112;
        v58 = self;
        __int16 v59 = 2112;
        v60 = v28;
        __int16 v61 = 2112;
        uint64_t v62 = v25;
        _os_log_impl(&dword_21CBC2000, v27, OS_LOG_TYPE_DEFAULT, "%s (%d) \"%@ is being marked as updated due to allValues: %@ -> %@\"", buf, 0x30u);
      }
    }
    objc_storeStrong((id *)&self->_allValues, (id)v25);
    *((unsigned char *)v50 + 24) = 1;
    self->_needsSave = [v42 isEqualToSet:v25] ^ 1;
  }
  preferredReplyAs = self->_preferredReplyAs;
  if ((unint64_t)preferredReplyAs | v12
    && ![(NSString *)preferredReplyAs isEqualToString:v12])
  {
    if (v43)
    {
      uint64_t v30 = _FKGetLogSystem();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = self->_preferredReplyAs;
        *(_DWORD *)buf = 136316162;
        v54 = "-[FKPerson _updateFromDictionaryRepresentation:shouldLogUpdates:]";
        __int16 v55 = 1024;
        int v56 = 225;
        __int16 v57 = 2112;
        v58 = self;
        __int16 v59 = 2112;
        v60 = (NSSet *)v31;
        __int16 v61 = 2112;
        uint64_t v62 = v12;
        _os_log_impl(&dword_21CBC2000, v30, OS_LOG_TYPE_DEFAULT, "%s (%d) \"%@ is being marked as updated due to _preferredReplyAs: '%@' -> '%@'\"", buf, 0x30u);
      }
    }
    objc_storeStrong((id *)&self->_preferredReplyAs, (id)v12);
    *((unsigned char *)v50 + 24) = 1;
  }
  if (!v13)
  {
    uint64_t v13 = +[FKUtility initialForString:self->_name];
  }
  if ([(id)v13 length]) {
    BOOL v32 = 0;
  }
  else {
    BOOL v32 = [(NSString *)self->_initials length] == 0;
  }
  initials = self->_initials;
  if (v13 | (unint64_t)initials && !v32 && ![(NSString *)initials isEqualToString:v13])
  {
    if (v43)
    {
      v34 = _FKGetLogSystem();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = self->_initials;
        *(_DWORD *)buf = 136316162;
        v54 = "-[FKPerson _updateFromDictionaryRepresentation:shouldLogUpdates:]";
        __int16 v55 = 1024;
        int v56 = 234;
        __int16 v57 = 2112;
        v58 = self;
        __int16 v59 = 2112;
        v60 = (NSSet *)v35;
        __int16 v61 = 2112;
        uint64_t v62 = v13;
        _os_log_impl(&dword_21CBC2000, v34, OS_LOG_TYPE_DEFAULT, "%s (%d) \"%@ is being marked as updated due to initials: [%@] -> [%@]\"", buf, 0x30u);
      }
    }
    objc_storeStrong((id *)&self->_initials, (id)v13);
    *((unsigned char *)v50 + 24) = 1;
  }
  v36 = +[FKPerson sharedMetadataQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__FKPerson__updateFromDictionaryRepresentation_shouldLogUpdates___block_invoke;
  block[3] = &unk_2644380B0;
  block[4] = self;
  id v46 = v41;
  BOOL v48 = v43;
  v47 = &v49;
  id v37 = v41;
  dispatch_sync(v36, block);

  BOOL v38 = *((unsigned char *)v50 + 24) != 0;
  _Block_object_dispose(&v49, 8);

  return v38;
}

void __65__FKPerson__updateFromDictionaryRepresentation_shouldLogUpdates___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  unint64_t v2 = *(void *)(a1 + 40);
  if (*(void *)(v3 + 80) | v2 && (objc_msgSend((id)v2, "isEqualToDictionary:") & 1) == 0)
  {
    if (*(unsigned char *)(a1 + 56))
    {
      id v4 = _FKGetLogSystem();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        uint64_t v6 = *(void *)(a1 + 40);
        uint64_t v7 = *(void *)(v5 + 80);
        *(_DWORD *)buf = 136316162;
        uint64_t v13 = "-[FKPerson _updateFromDictionaryRepresentation:shouldLogUpdates:]_block_invoke";
        __int16 v14 = 1024;
        int v15 = 241;
        __int16 v16 = 2112;
        uint64_t v17 = v5;
        __int16 v18 = 2112;
        uint64_t v19 = v7;
        __int16 v20 = 2112;
        uint64_t v21 = v6;
        _os_log_impl(&dword_21CBC2000, v4, OS_LOG_TYPE_DEFAULT, "%s (%d) \"%@ is being marked as updated due to metadata: %@ -> %@\"", buf, 0x30u);
      }
    }
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    uint64_t v8 = +[FKPerson sharedMetadataQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __65__FKPerson__updateFromDictionaryRepresentation_shouldLogUpdates___block_invoke_72;
    v9[3] = &unk_264437CD8;
    objc_copyWeak(&v11, (id *)buf);
    id v10 = *(id *)(a1 + 40);
    dispatch_barrier_async(v8, v9);

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
}

void __65__FKPerson__updateFromDictionaryRepresentation_shouldLogUpdates___block_invoke_72(uint64_t a1)
{
  unint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained _metadataDictionary];
  [v4 removeAllObjects];

  id v6 = objc_loadWeakRetained(v2);
  uint64_t v5 = [v6 _metadataDictionary];
  [v5 addEntriesFromDictionary:*(void *)(a1 + 32)];
}

- (BOOL)updateFromDictionaryRepresentation:(id)a3
{
  return [(FKPerson *)self _updateFromDictionaryRepresentation:a3 shouldLogUpdates:1];
}

- (void)refreshWithAddressBook:(void *)a3
{
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = [NSNumber numberWithInt:self->_abRecordID];
  uint64_t v5 = objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v4, @"ABRecordID", 0);

  abRecordGUID = self->_abRecordGUID;
  if (abRecordGUID) {
    [v5 setObject:abRecordGUID forKey:@"ABRecordGUID"];
  }
  abDatabaseUID = self->_abDatabaseUID;
  if (abDatabaseUID) {
    [v5 setObject:abDatabaseUID forKey:@"ABDatabaseUID"];
  }
  name = self->_name;
  if (name) {
    [v5 setObject:name forKey:@"Name"];
  }
  allValues = self->_allValues;
  if (allValues)
  {
    id v10 = [(NSSet *)allValues allObjects];
    [v5 setObject:v10 forKey:@"AllValues"];
  }
  preferredReplyAs = self->_preferredReplyAs;
  if (preferredReplyAs) {
    [v5 setObject:preferredReplyAs forKey:@"ReplyAs"];
  }
  if (self->_initials) {
    initials = (__CFString *)self->_initials;
  }
  else {
    initials = &stru_26CD80ED0;
  }
  [v5 setObject:initials forKey:@"Monogram"];
  uint64_t v13 = +[FKPerson sharedMetadataQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__FKPerson_dictionaryRepresentation__block_invoke;
  block[3] = &unk_264437FA0;
  block[4] = self;
  id v14 = v5;
  id v19 = v14;
  dispatch_sync(v13, block);

  int v15 = v19;
  id v16 = v14;

  return v16;
}

void __36__FKPerson_dictionaryRepresentation__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 80) count])
  {
    unint64_t v2 = *(void **)(a1 + 40);
    id v3 = [NSDictionary dictionaryWithDictionary:*(void *)(*(void *)(a1 + 32) + 80)];
    [v2 setObject:v3 forKey:@"Metadata"];
  }
}

- (id)displayName
{
  if ([(NSString *)self->_name length])
  {
    id v3 = (void *)[(NSString *)self->_name copy];
  }
  else
  {
    id v3 = [(FKPerson *)self primaryDestination];
    if ([v3 fkMessageDestinationType] == 1)
    {
      uint64_t v4 = +[FKUtility compressPhoneNumberString:v3];

      id v3 = (void *)v4;
    }
  }

  return v3;
}

- (id)primaryDestination
{
  primaryDestination = self->_primaryDestination;
  if (!primaryDestination)
  {
    uint64_t v4 = +[FKPerson _allPhoneValuesInSet:self->_allValues];
    if ([v4 count])
    {
      uint64_t v5 = [v4 objectAtIndex:0];
    }
    else
    {
      id v6 = +[FKPerson _allEmailValuesInSet:self->_allValues];
      if ([v6 count])
      {
        uint64_t v5 = [v6 objectAtIndex:0];
      }
      else
      {
        uint64_t v5 = 0;
      }
    }
    uint64_t v7 = self->_primaryDestination;
    self->_primaryDestination = v5;

    primaryDestination = self->_primaryDestination;
  }

  return primaryDestination;
}

- (id)allValues
{
  unint64_t v2 = (void *)[(NSSet *)self->_allValues copy];

  return v2;
}

- (unint64_t)allValuesCount
{
  return [(NSSet *)self->_allValues count];
}

- (void)setPreferredReplyAs:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  unint64_t v5 = (unint64_t)a3;
  preferredReplyAs = self->_preferredReplyAs;
  if (v5 | (unint64_t)preferredReplyAs
    && ![(NSString *)preferredReplyAs isEqualToString:v5])
  {
    uint64_t v7 = _FKGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      name = self->_name;
      abRecordGUID = self->_abRecordGUID;
      id v10 = self->_preferredReplyAs;
      int v11 = 136316418;
      uint64_t v12 = "-[FKPerson setPreferredReplyAs:]";
      __int16 v13 = 1024;
      int v14 = 348;
      __int16 v15 = 2112;
      id v16 = name;
      __int16 v17 = 2112;
      __int16 v18 = abRecordGUID;
      __int16 v19 = 2112;
      __int16 v20 = v10;
      __int16 v21 = 2112;
      unint64_t v22 = v5;
      _os_log_impl(&dword_21CBC2000, v7, OS_LOG_TYPE_DEFAULT, "%s (%d) \"updating preferredReplyAs for [%@] (GUID %@): %@ -> %@\"", (uint8_t *)&v11, 0x3Au);
    }

    objc_storeStrong((id *)&self->_preferredReplyAs, a3);
    self->_needsSave = 1;
    [(FKPerson *)self _postChangeNotification];
  }
}

- (id)_metadataDictionary
{
  return self->_metadata;
}

- (id)metadataValueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  __int16 v13 = &v12;
  uint64_t v14 = 0x3032000000;
  __int16 v15 = __Block_byref_object_copy__0;
  id v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  unint64_t v5 = +[FKPerson sharedMetadataQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__FKPerson_metadataValueForKey___block_invoke;
  block[3] = &unk_2644380D8;
  id v10 = v4;
  int v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __32__FKPerson_metadataValueForKey___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 80) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x270F9A758](v2, v4);
}

- (void)setMetadataValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = +[FKPerson sharedMetadataQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __36__FKPerson_setMetadataValue_forKey___block_invoke;
  v11[3] = &unk_264437EB8;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __36__FKPerson_setMetadataValue_forKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = [WeakRetained _metadataDictionary];
  [v4 setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];

  id v5 = objc_loadWeakRetained(v2);
  [v5 setNeedsSave:1];

  id v6 = objc_loadWeakRetained(v2);
  [v6 _postChangeNotification];
}

- (void)addMetadataEntriesFromDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [NSDictionary dictionaryWithDictionary:v4];
  objc_initWeak(&location, self);
  id v6 = +[FKPerson sharedMetadataQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__FKPerson_addMetadataEntriesFromDictionary___block_invoke;
  block[3] = &unk_264437CD8;
  objc_copyWeak(&v10, &location);
  id v9 = v5;
  id v7 = v5;
  dispatch_barrier_async(v6, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __45__FKPerson_addMetadataEntriesFromDictionary___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained _metadataDictionary];
  [v4 addEntriesFromDictionary:*(void *)(a1 + 32)];

  id v5 = objc_loadWeakRetained(v2);
  [v5 setNeedsSave:1];

  id v6 = objc_loadWeakRetained(v2);
  [v6 _postChangeNotification];
}

- (void)removeAllMetadataValues
{
  objc_initWeak(&location, self);
  uint64_t v2 = +[FKPerson sharedMetadataQueue];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __35__FKPerson_removeAllMetadataValues__block_invoke;
  v3[3] = &unk_264437CB0;
  objc_copyWeak(&v4, &location);
  dispatch_barrier_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __35__FKPerson_removeAllMetadataValues__block_invoke(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained _metadataDictionary];
  [v3 removeAllObjects];

  id v4 = objc_loadWeakRetained(v1);
  [v4 setNeedsSave:1];

  id v5 = objc_loadWeakRetained(v1);
  [v5 _postChangeNotification];
}

- (NSDictionary)metadata
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__0;
  int v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  uint64_t v3 = +[FKPerson sharedMetadataQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __20__FKPerson_metadata__block_invoke;
  v6[3] = &unk_264438040;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

uint64_t __20__FKPerson_metadata__block_invoke(uint64_t a1)
{
  uint64_t v2 = [NSDictionary dictionaryWithDictionary:*(void *)(*(void *)(a1 + 32) + 80)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x270F9A758](v2, v4);
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(FKPerson *)self displayName];
  uint64_t v7 = [(FKPerson *)self primaryDestination];
  uint64_t v8 = [v3 stringWithFormat:@"<%@: %p [%@]:%@>", v5, self, v6, v7];

  return v8;
}

- (void)copyABPersonWithAddressBook:(void *)a3
{
  result = [(NSString *)self->_abRecordGUID length];
  if (result)
  {
    return (void *)ABAddressBookCopyPersonMatchingInternalUUID();
  }
  return result;
}

- (id)abRecordGUID
{
  return self->_abRecordGUID;
}

- (void)_setABRecordGUID:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = (NSString *)a3;
  id v5 = v4;
  abRecordGUID = self->_abRecordGUID;
  if (abRecordGUID)
  {
    if ([(NSString *)v4 length]) {
      uint64_t v7 = (__CFString *)v5;
    }
    else {
      uint64_t v7 = &stru_26CD80ED0;
    }
    if (![(NSString *)abRecordGUID isEqualToString:v7])
    {
      objc_initWeak(&location, self);
      __int16 v15 = @"UnlinkedABGUID";
      v16[0] = self->_abRecordGUID;
      uint64_t v8 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __29__FKPerson__setABRecordGUID___block_invoke;
      v11[3] = &unk_264437CD8;
      objc_copyWeak(&v13, &location);
      id v12 = v8;
      id v9 = v8;
      dispatch_async(MEMORY[0x263EF83A0], v11);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
  id v10 = self->_abRecordGUID;
  self->_abRecordGUID = v5;
}

void __29__FKPerson__setABRecordGUID___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v3 postNotificationName:@"FKPersonUnlinkedFromAddressBookNotification" object:WeakRetained userInfo:*(void *)(a1 + 32)];
}

- (id)abDatabaseUID
{
  return self->_abDatabaseUID;
}

- (id)initials
{
  uint64_t v2 = (void *)[(NSString *)self->_initials copy];

  return v2;
}

- (BOOL)hasName
{
  return [(NSString *)self->_name length] != 0;
}

- (BOOL)isEqualToDictionaryRepresentation:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 objectForKey:@"ABRecordGUID"];
  abRecordGUID = self->_abRecordGUID;
  if ((v5 == 0) == (abRecordGUID != 0))
  {
    char v7 = 0;
  }
  else if (abRecordGUID)
  {
    char v7 = [(NSString *)abRecordGUID isEqualToString:v5];
  }
  else
  {
    uint64_t v8 = [v4 objectForKey:@"AllValues"];
    if ([v8 count])
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v16;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v16 != v12) {
              objc_enumerationMutation(v9);
            }
            if (-[NSSet containsObject:](self->_allValues, "containsObject:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15))
            {
              char v7 = 1;
              goto LABEL_16;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
      char v7 = 0;
LABEL_16:
    }
    else
    {
      char v7 = 0;
    }
  }
  return v7;
}

- (BOOL)isLikePerson:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 abRecordGUID];
    abRecordGUID = self->_abRecordGUID;
    if (abRecordGUID) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8 || ![(NSString *)abRecordGUID isEqualToString:v6])
    {
      uint64_t v10 = [v5 allValues];
      allValues = self->_allValues;
      BOOL v9 = allValues && v10 && [(NSSet *)allValues intersectsSet:v10];
    }
    else
    {
      BOOL v9 = 1;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)_postChangeNotification
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __35__FKPerson__postChangeNotification__block_invoke;
  v2[3] = &unk_264437CB0;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x263EF83A0], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __35__FKPerson__postChangeNotification__block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 postNotificationName:@"FKPersonValuesChangedNotification" object:WeakRetained];
}

- (void)_reconcile:(void *)a3 canPostChangeNotification:(BOOL)a4 shouldLogUpdates:(BOOL)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  if (!a3) {
    return;
  }
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v8 = (void *)ABAddressBookCopyUniqueIdentifier();
  if (v8 && ![(NSString *)self->_abDatabaseUID isEqualToString:v8])
  {
    objc_storeStrong((id *)&self->_abDatabaseUID, v8);
    int v9 = 1;
    self->_needsSave = 1;
  }
  else
  {
    int v9 = 0;
  }
  if (self->_abRecordGUID && (uint64_t v10 = (const void *)ABAddressBookCopyPersonMatchingInternalUUID()) != 0)
  {
    uint64_t v11 = v10;
    ABRecordID RecordID = ABRecordGetRecordID(v10);
    if (self->_abRecordID != RecordID)
    {
      int v13 = RecordID;
      if (v5)
      {
        id v14 = _FKGetLogSystem();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          abRecordGUID = self->_abRecordGUID;
          abABRecordID RecordID = self->_abRecordID;
          *(_DWORD *)buf = 136316162;
          uint64_t v40 = "-[FKPerson _reconcile:canPostChangeNotification:shouldLogUpdates:]";
          __int16 v41 = 1024;
          int v42 = 536;
          __int16 v43 = 2112;
          uint64_t v44 = abRecordGUID;
          __int16 v45 = 1024;
          *(_DWORD *)id v46 = abRecordID;
          *(_WORD *)&v46[4] = 1024;
          *(_DWORD *)&v46[6] = v13;
          _os_log_impl(&dword_21CBC2000, v14, OS_LOG_TYPE_DEFAULT, "%s (%d) \"updating AB record ID for friend with GUID %@: %d -> %d\"", buf, 0x28u);
        }
      }
      self->_abABRecordID RecordID = v13;
      int v9 = 1;
      self->_needsSave = 1;
    }
    uint64_t v17 = +[FKPerson preferredNameForPerson:v11];
    name = self->_name;
    if ((unint64_t)name | v17 && ![(NSString *)name isEqualToString:v17])
    {
      if (v5)
      {
        __int16 v19 = _FKGetLogSystem();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = self->_abRecordGUID;
          __int16 v21 = self->_name;
          *(_DWORD *)buf = 136316162;
          uint64_t v40 = "-[FKPerson _reconcile:canPostChangeNotification:shouldLogUpdates:]";
          __int16 v41 = 1024;
          int v42 = 546;
          __int16 v43 = 2112;
          uint64_t v44 = v20;
          __int16 v45 = 2112;
          *(void *)id v46 = v21;
          *(_WORD *)&v46[8] = 2112;
          uint64_t v47 = v17;
          _os_log_impl(&dword_21CBC2000, v19, OS_LOG_TYPE_DEFAULT, "%s (%d) \"updating name for friend with GUID %@: [%@] -> [%@]\"", buf, 0x30u);
        }
      }
      objc_storeStrong((id *)&self->_name, (id)v17);
      int v9 = 1;
      self->_needsSave = 1;
    }
    uint64_t v22 = +[FKPerson allValuesForPerson:v11];
    allValues = self->_allValues;
    if ((unint64_t)allValues | v22 && ![(NSSet *)allValues isEqualToSet:v22])
    {
      if (v5)
      {
        v24 = _FKGetLogSystem();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v25 = self->_abRecordGUID;
          v26 = self->_allValues;
          *(_DWORD *)buf = 136316162;
          uint64_t v40 = "-[FKPerson _reconcile:canPostChangeNotification:shouldLogUpdates:]";
          __int16 v41 = 1024;
          int v42 = 556;
          __int16 v43 = 2112;
          uint64_t v44 = v25;
          __int16 v45 = 2112;
          *(void *)id v46 = v26;
          *(_WORD *)&v46[8] = 2112;
          uint64_t v47 = v22;
          _os_log_impl(&dword_21CBC2000, v24, OS_LOG_TYPE_DEFAULT, "%s (%d) \"updated destinations for friend with GUID %@: %@ -> %@\"", buf, 0x30u);
        }
      }
      objc_storeStrong((id *)&self->_allValues, (id)v22);
      primaryDestination = self->_primaryDestination;
      self->_primaryDestination = 0;

      phoneNumberCount = self->_phoneNumberCount;
      self->_phoneNumberCount = 0;

      emailAddressCount = self->_emailAddressCount;
      self->_emailAddressCount = 0;

      int v9 = 1;
      self->_needsSave = 1;
    }

    uint64_t v30 = +[FKUtility initialsForPerson:v11];
  }
  else
  {
    if ([(NSSet *)self->_allValues count] && [(NSString *)self->_name length])
    {
      v31 = _FKGetLogSystem();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v32 = self->_name;
        *(_DWORD *)buf = 136315650;
        uint64_t v40 = "-[FKPerson _reconcile:canPostChangeNotification:shouldLogUpdates:]";
        __int16 v41 = 1024;
        int v42 = 571;
        __int16 v43 = 2112;
        uint64_t v44 = v32;
        _os_log_impl(&dword_21CBC2000, v31, OS_LOG_TYPE_DEFAULT, "%s (%d) \"friend needs a full AB lookup, searching with name: %@\"", buf, 0x1Cu);
      }

      ABAddressBookCopyPeopleAndIdentifiersMatchingName();
    }
    v33 = _FKGetLogSystem();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v40 = "-[FKPerson _reconcile:canPostChangeNotification:shouldLogUpdates:]";
      __int16 v41 = 1024;
      int v42 = 600;
      _os_log_impl(&dword_21CBC2000, v33, OS_LOG_TYPE_DEFAULT, "%s (%d) \"unable to find matching record using name\"", buf, 0x12u);
    }

    if (self->_abRecordID != -1)
    {
      self->_abABRecordID RecordID = -1;
      [(FKPerson *)self _setABRecordGUID:0];
      int v9 = 1;
      self->_needsSave = 1;
    }
    uint64_t v30 = +[FKUtility initialForString:self->_name];
    uint64_t v11 = 0;
  }
  if ([v30 length])
  {
    if (v30) {
      goto LABEL_47;
    }
    BOOL v34 = 0;
  }
  else
  {
    NSUInteger v35 = [(NSString *)self->_initials length];
    BOOL v34 = v35 == 0;
    if (v30)
    {
      if (v35) {
        goto LABEL_47;
      }
      goto LABEL_53;
    }
  }
  if (self->_initials && !v34)
  {
LABEL_47:
    if (([v30 isEqualToString:self->_initials] & 1) == 0)
    {
      if (v5)
      {
        v36 = _FKGetLogSystem();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          id v37 = self->_abRecordGUID;
          initials = self->_initials;
          *(_DWORD *)buf = 136316162;
          uint64_t v40 = "-[FKPerson _reconcile:canPostChangeNotification:shouldLogUpdates:]";
          __int16 v41 = 1024;
          int v42 = 615;
          __int16 v43 = 2112;
          uint64_t v44 = v37;
          __int16 v45 = 2112;
          *(void *)id v46 = initials;
          *(_WORD *)&v46[8] = 2112;
          uint64_t v47 = (uint64_t)v30;
          _os_log_impl(&dword_21CBC2000, v36, OS_LOG_TYPE_DEFAULT, "%s (%d) \"updating monogram for friend with GUID %@: [%@] -> [%@]\"", buf, 0x30u);
        }
      }
      objc_storeStrong((id *)&self->_initials, v30);
      int v9 = 1;
      self->_needsSave = 1;
    }
  }
LABEL_53:
  if (v11) {
    CFRelease(v11);
  }
  if ((v9 & v6) == 1) {
    [(FKPerson *)self _postChangeNotification];
  }
}

+ (id)preferredNameForPerson:(void *)a3
{
  if (a3)
  {
    uint64_t v4 = ABPersonCopyPreferredLinkedPersonForName();
    BOOL v5 = (const void *)v4;
    if (v4) {
      BOOL v6 = (void *)v4;
    }
    else {
      BOOL v6 = a3;
    }
    if (ABPersonGetShortNameFormatEnabled()) {
      char v7 = (void *)ABPersonCopyShortName();
    }
    else {
      char v7 = 0;
    }
    if (ABPersonGetShortNamePreferNicknames()) {
      int v9 = (void *)ABRecordCopyValue(v6, *MEMORY[0x263F24508]);
    }
    else {
      int v9 = 0;
    }
    uint64_t v10 = (void *)ABPersonCopyCompositeName();
    if (v5) {
      CFRelease(v5);
    }
    if (v7) {
      uint64_t v11 = v7;
    }
    else {
      uint64_t v11 = v10;
    }
    if (v9) {
      uint64_t v11 = v9;
    }
    id v8 = v11;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)allValuesForPerson:(void *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v4 = [MEMORY[0x263EFF9C0] set];
    BOOL v5 = +[FKPerson _allEmailValuesForRecord:a3];
    BOOL v6 = +[FKPerson _allPhoneValuesForRecord:a3];
    [v4 addObjectsFromArray:v5];
    [v4 addObjectsFromArray:v6];
    if (+[FKUtility personHasLinkages:a3])
    {
      long long v16 = v5;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      CFArrayRef v7 = ABPersonCopyArrayOfAllLinkedPeople(a3);
      uint64_t v8 = [(__CFArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v18 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            if (v12 != a3)
            {
              int v13 = +[FKPerson _allEmailValuesForRecord:*(void *)(*((void *)&v17 + 1) + 8 * i)];
              id v14 = +[FKPerson _allPhoneValuesForRecord:v12];
              [v4 addObjectsFromArray:v13];
              [v4 addObjectsFromArray:v14];
            }
          }
          uint64_t v9 = [(__CFArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v9);
      }

      BOOL v5 = v16;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_recordMatchDictionaryFromCFArray:(__CFArray *)a3 followLinks:(BOOL)a4 addressBook:(void *)a5
{
  BOOL v6 = a4;
  uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
  CFIndex Count = CFArrayGetCount(a3);
  if (Count >= 1)
  {
    CFIndex v10 = Count;
    for (CFIndex i = 0; i != v10; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a3, i);
      if (ValueAtIndex)
      {
        ABRecordRef PersonWithRecordID = ValueAtIndex;
        uint64_t RecordID = ABRecordGetRecordID(ValueAtIndex);
        if (v6)
        {
          uint64_t IntValue = ABRecordGetIntValue();
          if (IntValue != -1)
          {
            uint64_t v16 = IntValue;
            ABRecordRef PersonWithRecordID = ABAddressBookGetPersonWithRecordID(a5, IntValue);
            uint64_t RecordID = v16;
          }
        }
        long long v17 = [NSNumber numberWithInt:RecordID];
        if (PersonWithRecordID)
        {
          long long v18 = [v8 objectForKey:v17];

          if (!v18)
          {
            long long v19 = +[FKPerson allValuesForPerson:PersonWithRecordID];
            [v8 setObject:v19 forKey:v17];
          }
        }
      }
    }
  }

  return v8;
}

- (float)_allValuesMatchScore:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)[(NSSet *)self->_allValues mutableCopy];
  [v5 intersectSet:v4];
  unint64_t v6 = [v5 count];
  unint64_t v7 = [(NSSet *)self->_allValues count];
  float v8 = (float)v6 / (float)v7;
  if (v6 == v7) {
    float v8 = v8 + (float)((float)([v4 count] - v6) * (float)(1.0 / (float)v7));
  }

  return v8;
}

- (void)_bestRecordMatchFromDictionary:(id)a3 addressBook:(void *)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = -1;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  int v12 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __55__FKPerson__bestRecordMatchFromDictionary_addressBook___block_invoke;
  v10[3] = &unk_264438100;
  v10[4] = self;
  v10[5] = v11;
  v10[6] = &v13;
  [v6 enumerateKeysAndObjectsUsingBlock:v10];
  ABRecordID v7 = *((_DWORD *)v14 + 6);
  if (v7 == -1) {
    ABRecordRef PersonWithRecordID = 0;
  }
  else {
    ABRecordRef PersonWithRecordID = ABAddressBookGetPersonWithRecordID(a4, v7);
  }
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v13, 8);

  return (void *)PersonWithRecordID;
}

void __55__FKPerson__bestRecordMatchFromDictionary_addressBook___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  [*(id *)(a1 + 32) _allValuesMatchScore:a3];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  if (v5 > *(float *)(v6 + 24))
  {
    *(float *)(v6 + 24) = v5;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v7 intValue];
  }
}

+ (id)_allPhoneValuesForRecord:(void *)a3
{
  if (a3)
  {
    CFTypeRef v3 = ABRecordCopyValue(a3, *MEMORY[0x263F24570]);
    id v4 = v3;
    if (v3)
    {
      uint64_t v5 = (uint64_t)ABMultiValueCopyArrayOfAllValues(v3);
    }
    else
    {
      uint64_t v5 = [MEMORY[0x263EFF8C0] array];
    }
    id v7 = (void *)v5;
    float v8 = [MEMORY[0x263EFFA08] setWithArray:v5];
    uint64_t v9 = [v8 fkSanitizedDestinationSet];
    uint64_t v6 = [v9 allObjects];

    if (v4) {
      CFRelease(v4);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)_allPhoneValuesInSet:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          CFIndex v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v10, "fkMessageDestinationType", (void)v12) == 1) {
            [v4 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)_allEmailValuesForRecord:(void *)a3
{
  if (a3)
  {
    CFTypeRef v3 = ABRecordCopyValue(a3, *MEMORY[0x263F243C8]);
    id v4 = v3;
    if (v3)
    {
      uint64_t v5 = (uint64_t)ABMultiValueCopyArrayOfAllValues(v3);
    }
    else
    {
      uint64_t v5 = [MEMORY[0x263EFF8C0] array];
    }
    uint64_t v7 = (void *)v5;
    uint64_t v8 = [MEMORY[0x263EFFA08] setWithArray:v5];
    uint64_t v9 = [v8 fkSanitizedDestinationSet];
    uint64_t v6 = [v9 allObjects];

    if (v4) {
      CFRelease(v4);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)_allEmailValuesInSet:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          CFIndex v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v10, "fkMessageDestinationType", (void)v12) == 2) {
            [v4 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (int)addValue:(void *)a3 withLabel:(__CFString *)a4 toPerson:(void *)a5 property:(int)a6
{
  ABMultiValueIdentifier outIdentifier = -1;
  if ((ABPersonGetTypeOfProperty(a6) & 0x100) != 0)
  {
    CFTypeRef v11 = ABRecordCopyValue(a5, a6);
    if (v11)
    {
      long long v12 = v11;
      ABMutableMultiValueRef MutableCopy = ABMultiValueCreateMutableCopy(v11);
      CFRelease(v12);
    }
    else
    {
      ABPropertyType TypeOfProperty = ABPersonGetTypeOfProperty(a6);
      ABMutableMultiValueRef MutableCopy = ABMultiValueCreateMutable(TypeOfProperty);
    }
    ABMultiValueAddValueAndLabel(MutableCopy, a3, a4, &outIdentifier);
    ABRecordSetValue(a5, a6, MutableCopy, 0);
    CFRelease(MutableCopy);
    return outIdentifier;
  }
  else
  {
    ABRecordSetValue(a5, a6, a3, 0);
    return -1;
  }
}

- (BOOL)hasUnreadMessages
{
  return self->_hasUnreadMessages;
}

- (NSString)preferredReplyAs
{
  return self->_preferredReplyAs;
}

- (BOOL)needsSave
{
  return self->_needsSave;
}

- (void)setNeedsSave:(BOOL)a3
{
  self->_needsSave = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredReplyAs, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_allValues, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_abDatabaseUID, 0);
  objc_storeStrong((id *)&self->_abRecordGUID, 0);
  objc_storeStrong((id *)&self->_emailAddressCount, 0);
  objc_storeStrong((id *)&self->_phoneNumberCount, 0);
  objc_storeStrong((id *)&self->_initials, 0);

  objc_storeStrong((id *)&self->_primaryDestination, 0);
}

@end