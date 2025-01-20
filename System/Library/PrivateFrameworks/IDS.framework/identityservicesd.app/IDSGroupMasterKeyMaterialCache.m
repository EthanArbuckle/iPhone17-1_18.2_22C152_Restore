@interface IDSGroupMasterKeyMaterialCache
- (BOOL)hasCachedMasterKeyIdentifier:(id)a3;
- (BOOL)hasClientReceivedMasterKeyIdentifier:(id)a3;
- (IDSGroupMasterKeyMaterialCache)initWithIdentifier:(id)a3 initialMembershipURIs:(id)a4 automaticResetBlock:(id)a5 queue:(id)a6;
- (IDSGroupMasterKeyMaterialCache)initWithIdentifier:(id)a3 initialMembershipURIs:(id)a4 automaticResetInterval:(double)a5 automaticResetBlock:(id)a6 queue:(id)a7;
- (NSMutableDictionary)remoteParticipantIDToKeyMaterial;
- (NSSet)masterKeyIdentifiersReceivedByClient;
- (NSSet)masterKeyMaterials;
- (NSSet)membershipURIs;
- (NSString)identifier;
- (OS_dispatch_queue)queue;
- (double)automaticResetInterval;
- (id)_groupMasterKeyCollectionToBroadcastForDestinationURI:(id)a3 shouldIncludePeerKeys:(BOOL)a4;
- (id)automaticResetBlock;
- (id)cachedMasterKeyMaterialCollection;
- (id)currentLocalMasterKeyMaterial;
- (id)debugDescription;
- (id)description;
- (id)firstLocalMasterKeyMaterial;
- (id)groupMasterKeyCollectionToBroadcastForDestinationURI:(id)a3;
- (id)inFlightResetBlock;
- (id)localMasterKeyCollectionToBroadcastForDestinationURI:(id)a3;
- (id)nextLocalMasterKeyMaterial;
- (id)remoteMasterKeyMaterialCollectionToSend;
- (id)sampleMkMCollectionToBroadcast:(id)a3;
- (unsigned)numberOfBroadcastCacheMKM;
- (void)_startAutomaticCacheResetTimerIfNeeded;
- (void)cleanUpMasterKeyMaterialUsingPredicate:(id)a3;
- (void)noteClientReceiptOfMasterKeyIdentifier:(id)a3;
- (void)noteReceivedFirstKeyMaterial:(id)a3 forRemoteParticipant:(unint64_t)a4;
- (void)noteReceivedGroupMasterKeyMaterialCollection:(id)a3;
- (void)resetCacheWithNewMembershipURIs:(id)a3;
- (void)resetClientMasterKeyIdentifierReceipts;
- (void)resetRemoteMasterKeyMaterialCacheAndCancelResetInterval;
- (void)setAutomaticResetBlock:(id)a3;
- (void)setAutomaticResetInterval:(double)a3;
- (void)setCurrentLocalMasterKeyMaterial:(id)a3;
- (void)setFirstLocalMasterKeyMaterial:(id)a3;
- (void)setInFlightResetBlock:(id)a3;
- (void)setMasterKeyIdentifiersReceivedByClient:(id)a3;
- (void)setMasterKeyMaterials:(id)a3;
- (void)setMembershipURIs:(id)a3;
- (void)setNextLocalMasterKeyMaterial:(id)a3;
- (void)setRemoteParticipantIDToKeyMaterial:(id)a3;
- (void)updateLastRatchetedKeyMaterial:(id)a3 forRemoteParticipant:(unint64_t)a4;
@end

@implementation IDSGroupMasterKeyMaterialCache

- (IDSGroupMasterKeyMaterialCache)initWithIdentifier:(id)a3 initialMembershipURIs:(id)a4 automaticResetBlock:(id)a5 queue:(id)a6
{
  return [(IDSGroupMasterKeyMaterialCache *)self initWithIdentifier:a3 initialMembershipURIs:a4 automaticResetInterval:a5 automaticResetBlock:a6 queue:600.0];
}

- (IDSGroupMasterKeyMaterialCache)initWithIdentifier:(id)a3 initialMembershipURIs:(id)a4 automaticResetInterval:(double)a5 automaticResetBlock:(id)a6 queue:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v42.receiver = self;
  v42.super_class = (Class)IDSGroupMasterKeyMaterialCache;
  v17 = [(IDSGroupMasterKeyMaterialCache *)&v42 init];
  v18 = v17;
  if (!v17) {
    goto LABEL_20;
  }
  objc_storeStrong((id *)&v17->_identifier, a3);
  objc_storeStrong((id *)&v18->_queue, a7);
  v18->_automaticResetInterval = a5;
  id v19 = objc_retainBlock(v15);
  id automaticResetBlock = v18->_automaticResetBlock;
  v18->_id automaticResetBlock = v19;

  v21 = (NSSet *)objc_alloc_init((Class)NSSet);
  masterKeyMaterials = v18->_masterKeyMaterials;
  v18->_masterKeyMaterials = v21;

  if (v14) {
    v23 = (NSSet *)v14;
  }
  else {
    v23 = (NSSet *)objc_alloc_init((Class)NSSet);
  }
  membershipURIs = v18->_membershipURIs;
  v18->_membershipURIs = v23;

  v25 = (NSSet *)objc_alloc_init((Class)NSSet);
  masterKeyIdentifiersReceivedByClient = v18->_masterKeyIdentifiersReceivedByClient;
  v18->_masterKeyIdentifiersReceivedByClient = v25;

  v27 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  remoteParticipantIDToKeyMaterial = v18->_remoteParticipantIDToKeyMaterial;
  v18->_remoteParticipantIDToKeyMaterial = v27;

  v29 = +[FTDeviceSupport sharedInstance];
  unsigned int v30 = [v29 slowCPUDevice];

  v31 = @"ids-groupMKMCache-number-of-broadcast-cache-mkm";
  if (v30) {
    v31 = @"ids-groupMKMCache-number-of-broadcast-cache-mkm-slow-cpu";
  }
  v32 = v31;
  v33 = +[IDSServerBag sharedInstance];
  v34 = [v33 objectForKey:v32];

  if (v34 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v18->_unsigned int numberOfBroadcastCacheMKM = [v34 unsignedIntValue];
    v35 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int numberOfBroadcastCacheMKM = v18->_numberOfBroadcastCacheMKM;
      *(_DWORD *)buf = 138412546;
      v44 = (IDSGroupMasterKeyMaterialCache *)v32;
      __int16 v45 = 1024;
      unsigned int v46 = numberOfBroadcastCacheMKM;
      v37 = "Got number of broadcast cache MKM bag value {key: %@, value: %u}";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, v37, buf, 0x12u);
    }
  }
  else
  {
    if (v30) {
      int v38 = 10;
    }
    else {
      int v38 = 64;
    }
    v18->_unsigned int numberOfBroadcastCacheMKM = v38;
    v35 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v39 = v18->_numberOfBroadcastCacheMKM;
      *(_DWORD *)buf = 138412546;
      v44 = (IDSGroupMasterKeyMaterialCache *)v32;
      __int16 v45 = 1024;
      unsigned int v46 = v39;
      v37 = "Couldn't get broadcast cache MKM bag value, using default value {key used: %@, value: %u}";
      goto LABEL_16;
    }
  }

  v40 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v44 = v18;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Created group MkM cache { self: %@ }", buf, 0xCu);
  }

LABEL_20:
  return v18;
}

- (void)resetCacheWithNewMembershipURIs:(id)a3
{
  id v4 = a3;
  v5 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Resetting group MkM cache { self: %@ }", (uint8_t *)&v8, 0xCu);
  }

  [(IDSGroupMasterKeyMaterialCache *)self setCurrentLocalMasterKeyMaterial:0];
  if (v4)
  {
    [(IDSGroupMasterKeyMaterialCache *)self setMembershipURIs:v4];
  }
  else
  {
    id v6 = objc_alloc_init((Class)NSSet);
    [(IDSGroupMasterKeyMaterialCache *)self setMembershipURIs:v6];
  }
  id v7 = objc_alloc_init((Class)NSSet);
  [(IDSGroupMasterKeyMaterialCache *)self setMasterKeyMaterials:v7];
}

- (void)resetRemoteMasterKeyMaterialCacheAndCancelResetInterval
{
  v3 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Resetting remote MkM cache { self: %@ }", (uint8_t *)&v5, 0xCu);
  }

  id v4 = objc_alloc_init((Class)NSSet);
  [(IDSGroupMasterKeyMaterialCache *)self setMasterKeyMaterials:v4];

  [(IDSGroupMasterKeyMaterialCache *)self setInFlightResetBlock:0];
}

- (void)cleanUpMasterKeyMaterialUsingPredicate:(id)a3
{
  id v4 = a3;
  id v6 = [(IDSGroupMasterKeyMaterialCache *)self masterKeyMaterials];
  int v5 = [v6 filteredSetUsingPredicate:v4];

  [(IDSGroupMasterKeyMaterialCache *)self setMasterKeyMaterials:v5];
}

- (void)noteReceivedGroupMasterKeyMaterialCollection:(id)a3
{
  id v41 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v43 = objc_alloc_init((Class)NSMutableSet);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v40 = self;
  int v5 = [(IDSGroupMasterKeyMaterialCache *)self masterKeyMaterials];
  id v6 = [v5 countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v53;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v53 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        if ([v10 participantID])
        {
          v11 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v10 participantID]);
          id v12 = [v4 objectForKeyedSubscript:v11];

          if (v12)
          {
            [v12 addObject:v10];
          }
          else
          {
            id v12 = objc_alloc_init((Class)NSMutableArray);
            [v12 addObject:v10];
            id v13 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v10 participantID]);
            [v4 setObject:v12 forKey:v13];
          }
        }
        else
        {
          [v43 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v52 objects:v60 count:16];
    }
    while (v7);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v14 = [v41 masterKeyMaterials];
  id v15 = [v14 countByEnumeratingWithState:&v48 objects:v59 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v49;
    objc_super v42 = v14;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v49 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v48 + 1) + 8 * (void)j);
        if (![v19 participantID])
        {
          [v43 addObject:v19];
          continue;
        }
        v20 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v19 participantID]);
        id v21 = [v4 objectForKeyedSubscript:v20];

        if (!v21)
        {
          id v21 = objc_alloc_init((Class)NSMutableArray);
          [v21 addObject:v19];
          v23 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v19 participantID]);
          [v4 setObject:v21 forKey:v23];
          goto LABEL_25;
        }
        id v22 = [v21 count];
        [v21 addObject:v19];
        if (v22 != (id)1)
        {
          v23 = [v21 sortedArrayUsingSelector:"compare:"];
          id v24 = objc_alloc_init((Class)NSMutableArray);
          v25 = objc_msgSend(v23, "objectAtIndexedSubscript:", (char *)objc_msgSend(v23, "count") - 2);
          [v24 addObject:v25];

          v26 = objc_msgSend(v23, "objectAtIndexedSubscript:", (char *)objc_msgSend(v23, "count") - 1);
          [v24 addObject:v26];

          v27 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v19 participantID]);
          [v4 setObject:v24 forKey:v27];

          id v14 = v42;
LABEL_25:
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v48 objects:v59 count:16];
    }
    while (v16);
  }

  id v28 = objc_alloc_init((Class)NSMutableArray);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v29 = [v4 allValues];
  id v30 = [v29 countByEnumeratingWithState:&v44 objects:v58 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v45;
    do
    {
      for (k = 0; k != v31; k = (char *)k + 1)
      {
        if (*(void *)v45 != v32) {
          objc_enumerationMutation(v29);
        }
        [v28 addObjectsFromArray:*(void *)(*((void *)&v44 + 1) + 8 * (void)k)];
      }
      id v31 = [v29 countByEnumeratingWithState:&v44 objects:v58 count:16];
    }
    while (v31);
  }

  v34 = [v43 setByAddingObjectsFromArray:v28];
  [(IDSGroupMasterKeyMaterialCache *)v40 setMasterKeyMaterials:v34];

  v35 = [(IDSGroupMasterKeyMaterialCache *)v40 membershipURIs];
  v36 = [v41 membershipURIs];
  unsigned int v37 = [v35 isSubsetOfSet:v36];

  if (v37)
  {
    int v38 = [v41 membershipURIs];
    [(IDSGroupMasterKeyMaterialCache *)v40 setMembershipURIs:v38];
  }
  unsigned int v39 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v57 = v40;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Noted received MkM collection in MkM cache { self: %@ }", buf, 0xCu);
  }

  [(IDSGroupMasterKeyMaterialCache *)v40 _startAutomaticCacheResetTimerIfNeeded];
}

- (id)sampleMkMCollectionToBroadcast:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if ((unint64_t)[v4 count] > self->_numberOfBroadcastCacheMKM)
  {
    id v6 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v4 count];
      unsigned int numberOfBroadcastCacheMKM = self->_numberOfBroadcastCacheMKM;
      int v11 = 134218240;
      id v12 = v7;
      __int16 v13 = 1024;
      unsigned int v14 = numberOfBroadcastCacheMKM;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Number of peer MkM to broadcast is over maximum permitted value -- introducing sampling { cachedCount: %lu, maximumCountToBroadcast: %u }", (uint8_t *)&v11, 0x12u);
    }

    id v9 = [v4 mutableCopy];
    objc_msgSend(v9, "__imRandomizeArray");
    int v5 = objc_msgSend(v9, "subarrayWithRange:", 0, self->_numberOfBroadcastCacheMKM);
  }

  return v5;
}

- (id)groupMasterKeyCollectionToBroadcastForDestinationURI:(id)a3
{
  return [(IDSGroupMasterKeyMaterialCache *)self _groupMasterKeyCollectionToBroadcastForDestinationURI:a3 shouldIncludePeerKeys:1];
}

- (id)localMasterKeyCollectionToBroadcastForDestinationURI:(id)a3
{
  return [(IDSGroupMasterKeyMaterialCache *)self _groupMasterKeyCollectionToBroadcastForDestinationURI:a3 shouldIncludePeerKeys:0];
}

- (id)_groupMasterKeyCollectionToBroadcastForDestinationURI:(id)a3 shouldIncludePeerKeys:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableSet);
  uint64_t v8 = [(IDSGroupMasterKeyMaterialCache *)self nextLocalMasterKeyMaterial];

  if (v8)
  {
    id v9 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100712E30(self);
    }

    v10 = [(IDSGroupMasterKeyMaterialCache *)self nextLocalMasterKeyMaterial];
    [v7 addObject:v10];
  }
  int v11 = [v6 tokenFreeURI];
  if (v4)
  {
    id v12 = [(IDSGroupMasterKeyMaterialCache *)self masterKeyMaterials];
    if ([v12 count])
    {
      __int16 v13 = [(IDSGroupMasterKeyMaterialCache *)self membershipURIs];
      if ([v13 containsObject:v6])
      {
      }
      else
      {
        unsigned int v14 = [(IDSGroupMasterKeyMaterialCache *)self membershipURIs];
        unsigned int v15 = [v14 containsObject:v11];

        if (!v15) {
          goto LABEL_14;
        }
      }
      id v16 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_100712DA0(self);
      }

      uint64_t v17 = [(IDSGroupMasterKeyMaterialCache *)self masterKeyMaterials];
      v18 = [v17 allObjects];
      id v12 = [(IDSGroupMasterKeyMaterialCache *)self sampleMkMCollectionToBroadcast:v18];

      [v7 addObjectsFromArray:v12];
    }
  }
LABEL_14:
  id v19 = [IDSGroupMasterKeyMaterialCollection alloc];
  v20 = [v7 allObjects];
  id v21 = [(IDSGroupMasterKeyMaterialCache *)self membershipURIs];
  id v22 = [(IDSGroupMasterKeyMaterialCollection *)v19 initWithMasterKeyMaterials:v20 membershipURIs:v21];

  [(IDSGroupMasterKeyMaterialCollection *)v22 description];
  v27 = v26 = v6;
  id v23 = v27;
  id v24 = v6;
  cut_dispatch_log_queue();

  return v22;
}

- (id)cachedMasterKeyMaterialCollection
{
  v3 = [(IDSGroupMasterKeyMaterialCache *)self masterKeyMaterials];
  BOOL v4 = +[NSMutableSet setWithSet:v3];

  int v5 = [(IDSGroupMasterKeyMaterialCache *)self currentLocalMasterKeyMaterial];

  if (v5)
  {
    id v6 = [(IDSGroupMasterKeyMaterialCache *)self currentLocalMasterKeyMaterial];
    [v4 addObject:v6];
  }
  id v7 = [(IDSGroupMasterKeyMaterialCache *)self nextLocalMasterKeyMaterial];

  if (v7)
  {
    uint64_t v8 = [(IDSGroupMasterKeyMaterialCache *)self nextLocalMasterKeyMaterial];
    [v4 addObject:v8];
  }
  id v9 = [IDSGroupMasterKeyMaterialCollection alloc];
  v10 = [v4 allObjects];
  int v11 = [(IDSGroupMasterKeyMaterialCache *)self membershipURIs];
  id v12 = [(IDSGroupMasterKeyMaterialCollection *)v9 initWithMasterKeyMaterials:v10 membershipURIs:v11];

  return v12;
}

- (id)remoteMasterKeyMaterialCollectionToSend
{
  v3 = [(IDSGroupMasterKeyMaterialCache *)self remoteParticipantIDToKeyMaterial];
  BOOL v4 = [v3 allValues];
  int v5 = +[NSMutableSet setWithArray:v4];

  id v6 = [IDSGroupMasterKeyMaterialCollection alloc];
  id v7 = [v5 allObjects];
  uint64_t v8 = [(IDSGroupMasterKeyMaterialCache *)self membershipURIs];
  id v9 = [(IDSGroupMasterKeyMaterialCollection *)v6 initWithMasterKeyMaterials:v7 membershipURIs:v8];

  return v9;
}

- (BOOL)hasCachedMasterKeyIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = [(IDSGroupMasterKeyMaterialCache *)self currentLocalMasterKeyMaterial];
  id v6 = [v5 keyIndex];
  id v7 = [v6 UUIDString];
  unsigned __int8 v8 = [v4 isEqualToString:v7];

  if (v8) {
    goto LABEL_3;
  }
  id v9 = [(IDSGroupMasterKeyMaterialCache *)self nextLocalMasterKeyMaterial];
  v10 = [v9 keyIndex];
  int v11 = [v10 UUIDString];
  unsigned __int8 v12 = [v4 isEqualToString:v11];

  if (v12)
  {
LABEL_3:
    BOOL v13 = 1;
  }
  else
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    unsigned int v14 = [(IDSGroupMasterKeyMaterialCache *)self masterKeyMaterials];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10014C8C4;
    v16[3] = &unk_100983B60;
    id v17 = v4;
    v18 = &v19;
    [v14 enumerateObjectsUsingBlock:v16];

    BOOL v13 = *((unsigned char *)v20 + 24) != 0;
    _Block_object_dispose(&v19, 8);
  }

  return v13;
}

- (void)_startAutomaticCacheResetTimerIfNeeded
{
  v3 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    [(IDSGroupMasterKeyMaterialCache *)self automaticResetInterval];
    uint64_t v5 = v4;
    id v6 = [(IDSGroupMasterKeyMaterialCache *)self inFlightResetBlock];
    id v7 = objc_retainBlock(v6);
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    __int16 v17 = 2048;
    uint64_t v18 = v5;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting automatic cache reset timer if needed { self: %@, resetInterval: %f, inFlightResetBlock: %@ }", buf, 0x20u);
  }
  unsigned __int8 v8 = [(IDSGroupMasterKeyMaterialCache *)self inFlightResetBlock];
  if (v8)
  {
  }
  else
  {
    [(IDSGroupMasterKeyMaterialCache *)self automaticResetInterval];
    if (v9 > 0.0)
    {
      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      [(IDSGroupMasterKeyMaterialCache *)self automaticResetInterval];
      dispatch_time_t v11 = dispatch_walltime(0, (uint64_t)(v10 * 1000000000.0));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10014CB7C;
      block[3] = &unk_100981000;
      objc_copyWeak(&v15, (id *)buf);
      dispatch_block_t v12 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
      [(IDSGroupMasterKeyMaterialCache *)self setInFlightResetBlock:v12];
      BOOL v13 = [(IDSGroupMasterKeyMaterialCache *)self queue];
      dispatch_after(v11, v13, v12);

      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (void)noteClientReceiptOfMasterKeyIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = [(IDSGroupMasterKeyMaterialCache *)self masterKeyIdentifiersReceivedByClient];
    uint64_t v5 = [v6 setByAddingObject:v4];

    [(IDSGroupMasterKeyMaterialCache *)self setMasterKeyIdentifiersReceivedByClient:v5];
  }
}

- (BOOL)hasClientReceivedMasterKeyIdentifier:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  uint64_t v5 = [(IDSGroupMasterKeyMaterialCache *)self masterKeyIdentifiersReceivedByClient];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (void)resetClientMasterKeyIdentifierReceipts
{
  id v3 = objc_alloc_init((Class)NSSet);
  [(IDSGroupMasterKeyMaterialCache *)self setMasterKeyIdentifiersReceivedByClient:v3];
}

- (void)noteReceivedFirstKeyMaterial:(id)a3 forRemoteParticipant:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(IDSGroupMasterKeyMaterialCache *)self remoteParticipantIDToKeyMaterial];
  unsigned __int8 v8 = +[NSNumber numberWithUnsignedLongLong:a4];
  double v9 = [v7 objectForKey:v8];

  if (v9 || ([v6 isGeneratedLocally] & 1) != 0)
  {
    double v10 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Already noted first key material for remote participant: %@ - ignoring", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    dispatch_time_t v11 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Noting first key material for remote participant: %@", (uint8_t *)&v13, 0xCu);
    }

    double v10 = [(IDSGroupMasterKeyMaterialCache *)self remoteParticipantIDToKeyMaterial];
    dispatch_block_t v12 = +[NSNumber numberWithUnsignedLongLong:a4];
    [v10 setObject:v6 forKey:v12];
  }
}

- (void)updateLastRatchetedKeyMaterial:(id)a3 forRemoteParticipant:(unint64_t)a4
{
  id v6 = a3;
  id v8 = [(IDSGroupMasterKeyMaterialCache *)self remoteParticipantIDToKeyMaterial];
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [v8 setObject:v6 forKey:v7];
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(IDSGroupMasterKeyMaterialCache *)self identifier];
  uint64_t v5 = [(IDSGroupMasterKeyMaterialCache *)self currentLocalMasterKeyMaterial];
  id v6 = [(IDSGroupMasterKeyMaterialCache *)self nextLocalMasterKeyMaterial];
  id v7 = [(IDSGroupMasterKeyMaterialCache *)self membershipURIs];
  id v8 = [(IDSGroupMasterKeyMaterialCache *)self masterKeyMaterials];
  double v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p identifier: %@, currentLocalMkM: %@, nextLocalMkM: %@, URIs: %@, MkMsCount: %lu>", v3, self, v4, v5, v6, v7, [v8 count]);

  return v9;
}

- (id)debugDescription
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(IDSGroupMasterKeyMaterialCache *)self identifier];
  uint64_t v5 = [(IDSGroupMasterKeyMaterialCache *)self currentLocalMasterKeyMaterial];
  id v6 = [(IDSGroupMasterKeyMaterialCache *)self nextLocalMasterKeyMaterial];
  id v7 = [(IDSGroupMasterKeyMaterialCache *)self membershipURIs];
  id v8 = [(IDSGroupMasterKeyMaterialCache *)self masterKeyMaterials];
  double v9 = +[NSString stringWithFormat:@"<%@: %p identifier: %@, currentLocalMkM: %@, nextLocalMkM: %@, URIs: %@, MkMs: %@>", v3, self, v4, v5, v6, v7, v8];

  return v9;
}

- (id)firstLocalMasterKeyMaterial
{
  return self->_firstLocalMasterKeyMaterial;
}

- (void)setFirstLocalMasterKeyMaterial:(id)a3
{
}

- (id)currentLocalMasterKeyMaterial
{
  return self->_currentLocalMasterKeyMaterial;
}

- (void)setCurrentLocalMasterKeyMaterial:(id)a3
{
}

- (id)nextLocalMasterKeyMaterial
{
  return self->_nextLocalMasterKeyMaterial;
}

- (void)setNextLocalMasterKeyMaterial:(id)a3
{
}

- (double)automaticResetInterval
{
  return self->_automaticResetInterval;
}

- (void)setAutomaticResetInterval:(double)a3
{
  self->_automaticResetInterval = a3;
}

- (unsigned)numberOfBroadcastCacheMKM
{
  return self->_numberOfBroadcastCacheMKM;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)automaticResetBlock
{
  return self->_automaticResetBlock;
}

- (void)setAutomaticResetBlock:(id)a3
{
}

- (id)inFlightResetBlock
{
  return self->_inFlightResetBlock;
}

- (void)setInFlightResetBlock:(id)a3
{
}

- (NSSet)masterKeyMaterials
{
  return self->_masterKeyMaterials;
}

- (void)setMasterKeyMaterials:(id)a3
{
}

- (NSSet)membershipURIs
{
  return self->_membershipURIs;
}

- (void)setMembershipURIs:(id)a3
{
}

- (NSSet)masterKeyIdentifiersReceivedByClient
{
  return self->_masterKeyIdentifiersReceivedByClient;
}

- (void)setMasterKeyIdentifiersReceivedByClient:(id)a3
{
}

- (NSMutableDictionary)remoteParticipantIDToKeyMaterial
{
  return self->_remoteParticipantIDToKeyMaterial;
}

- (void)setRemoteParticipantIDToKeyMaterial:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteParticipantIDToKeyMaterial, 0);
  objc_storeStrong((id *)&self->_masterKeyIdentifiersReceivedByClient, 0);
  objc_storeStrong((id *)&self->_membershipURIs, 0);
  objc_storeStrong((id *)&self->_masterKeyMaterials, 0);
  objc_storeStrong(&self->_inFlightResetBlock, 0);
  objc_storeStrong(&self->_automaticResetBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_nextLocalMasterKeyMaterial, 0);
  objc_storeStrong(&self->_currentLocalMasterKeyMaterial, 0);

  objc_storeStrong(&self->_firstLocalMasterKeyMaterial, 0);
}

@end