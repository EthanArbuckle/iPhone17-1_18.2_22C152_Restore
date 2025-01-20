@interface CKRecord
+ (Class)cpl_recordChangeClassForRecordType:(id)a3;
+ (id)cpl_expungedRecordFromCPLRecordChange:(id)a3 inZone:(id)a4 target:(id)a5;
+ (id)cpl_expungedSharedRecordFromCPLRecordChange:(id)a3 inZone:(id)a4 target:(id)a5;
+ (id)cpl_recordFromCPLRecordChange:(id)a3 scopeProvider:(id)a4 currentUserRecordID:(id)a5 inZone:(id)a6 resourceCountAndSize:(id)a7 error:(id *)a8;
- (BOOL)cpl_inExpunged;
- (BOOL)cpl_isSharedWithScopeWithIdentifier:(id)a3 scopeProvider:(id)a4 currentUserRecordID:(id)a5 isSparseRecord:(BOOL *)a6;
- (BOOL)cpl_isSparseRecord;
- (BOOL)cpl_supportsSharingScopeIdentifier;
- (CKRecord)initWithCPLArchiver:(id)a3;
- (Class)cpl_recordChangeClass;
- (id)cplChangedKeys;
- (id)cplFullDescription;
- (id)cplResourceWithType:(unint64_t)a3 scopedIdentifier:(id)a4 forRecord:(id)a5 isCoherent:(BOOL *)a6 scopeProvider:(id)a7;
- (id)cplResourcesWithScopedIdentifier:(id)a3 coherent:(BOOL *)a4 forRecord:(id)a5 scopeProvider:(id)a6;
- (id)cpl_decryptedObjectForKey:(id)a3 validateClass:(Class)a4;
- (id)cpl_destinationRecordIDInPrivateScopeWithCurrentUserRecordID:(id)a3 proposedDestinationRecordID:(id)a4;
- (id)cpl_legacyDecryptedObjectForKey:(id)a3 validateClass:(Class)a4;
- (id)cpl_objectForKey:(id)a3 validateClass:(Class)a4;
- (id)cpl_recordChangeMissingResourceProperties:(id *)a3 scopeIdentifier:(id)a4 scopeProvider:(id)a5 currentUserRecordID:(id)a6;
- (id)cpl_sharingRecordScopedIdentifierWithScopeProvider:(id)a3 currentUserRecordID:(id)a4 isSparseRecord:(BOOL *)a5;
- (id)plistArchiveWithCPLArchiver:(id)a3;
- selfIfMatchesRecordName:(id)a3;
- (void)cplValidateAndWarnIntegrityOfResourceData:(id)a3 withFingerPrintKey:(id)a4 andFileSizeKey:(id)a5 fingerprintScheme:(id)a6;
- (void)cpl_setEncryptedObject:(id)a3 forKey:(id)a4 validateClass:(Class)a5;
- (void)cpl_setLegacyEncryptedObject:(id)a3 forKey:(id)a4;
- (void)cpl_updateContributorsOnSharedRecord:(id)a3;
- (void)cpl_updatePrivateRecordSharedToRecordWithID:(id)a3 currentUserRecordID:(id)a4 setSparseRecordFlag:(BOOL)a5 force:(BOOL)a6;
@end

@implementation CKRecord

- (id)cplFullDescription
{
  id v3 = objc_alloc((Class)NSMutableString);
  uint64_t v4 = objc_opt_class();
  v5 = [(CKRecord *)self recordType];
  v6 = [(CKRecord *)self recordID];
  v7 = [v6 cplFullDescription];
  uint64_t v8 = [(CKRecord *)self recordChangeTag];
  v9 = (void *)v8;
  CFStringRef v10 = @"<no etag>";
  if (v8) {
    CFStringRef v10 = (const __CFString *)v8;
  }
  id v11 = [v3 initWithFormat:@"[%@ (%@) %@ recordChangeTag=%@", v4, v5, v7, v10];

  v12 = [(CKRecord *)self valueStore];
  v13 = [(CKRecord *)self encryptedValueStore];
  id v14 = objc_alloc((Class)NSSet);
  v35 = v13;
  v15 = [v13 allKeys];
  id v16 = [v14 initWithArray:v15];

  id v17 = objc_alloc((Class)NSMutableSet);
  v36 = v12;
  v18 = [v12 allKeys];
  id v19 = [v17 initWithArray:v18];

  [v19 unionSet:v16];
  v20 = [(CKRecord *)self changedKeys];
  [v19 addObjectsFromArray:v20];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v34 = v19;
  v21 = [v19 allObjects];
  v22 = [v21 sortedArrayUsingSelector:"compare:"];

  id obj = v22;
  id v23 = [v22 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v39;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v39 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        if ([v16 containsObject:v27])
        {
          uint64_t v28 = [v35 objectForKeyedSubscript:v27];
          if (v28) {
            v29 = (__CFString *)v28;
          }
          else {
            v29 = @"<failed to decrypt>";
          }
          CFStringRef v30 = @" (encrypted)";
        }
        else
        {
          v29 = [v36 objectForKeyedSubscript:v27];
          CFStringRef v30 = &stru_10027FEB8;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v31 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"<%lu bytes>", -[__CFString length](v29, "length"));
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v31 = [objc_alloc((Class)NSString) initWithFormat:@"\"%@\"", v29];
          }
          else
          {
            id v31 = [(__CFString *)v29 description];
          }
        }
        v32 = v31;
        [v11 appendFormat:@"\n%@%@%@ = %@", @"  ", v27, v30, v31];
      }
      id v24 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v24);
  }

  [v11 appendString:@"]"];
  return v11;
}

+ (Class)cpl_recordChangeClassForRecordType:(id)a3
{
  return (Class)CPLRecordChangeClassForCKRecordType(a3);
}

- (Class)cpl_recordChangeClass
{
  v2 = [(CKRecord *)self recordType];
  id v3 = CPLRecordChangeClassForCKRecordType(v2);

  return (Class)v3;
}

- (id)cpl_objectForKey:(id)a3 validateClass:(Class)a4
{
  id v5 = a3;
  v6 = [(CKRecord *)self objectForKey:v5];
  if (v6 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      v7 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = [(CKRecord *)self recordType];
        int v10 = 138412802;
        id v11 = v5;
        __int16 v12 = 2112;
        v13 = v8;
        __int16 v14 = 2112;
        v15 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Unexpected object for key %@ in record of type %@: %@", (uint8_t *)&v10, 0x20u);
      }
    }

    v6 = 0;
  }

  return v6;
}

- (void)cplValidateAndWarnIntegrityOfResourceData:(id)a3 withFingerPrintKey:(id)a4 andFileSizeKey:(id)a5 fingerprintScheme:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v22 = 0;
  v13 = [a6 fingerPrintForData:v10 error:&v22];
  __int16 v14 = v22;
  if (v13)
  {
    v15 = [(CKRecord *)self objectForKey:v11];
    id v16 = v15;
    if ((!v15 || ([v15 isEqual:v13] & 1) == 0) && !_CPLSilentLogging)
    {
      id v17 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v24 = v13;
        __int16 v25 = 2112;
        v26 = v16;
        __int16 v27 = 2112;
        uint64_t v28 = self;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Mismatching fingerprint (fetched %@ vs. expected %@) for resourceData for %@", buf, 0x20u);
      }
    }
LABEL_11:

    goto LABEL_12;
  }
  if (!_CPLSilentLogging)
  {
    id v16 = __CPLGenericOSLogDomain();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = self;
      __int16 v25 = 2112;
      v26 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Unable to fingerprint resource data for %@: %@", buf, 0x16u);
    }
    goto LABEL_11;
  }
LABEL_12:
  v18 = [(CKRecord *)self objectForKey:v12];
  id v19 = [v10 length];
  if (v19 != [v18 unsignedIntegerValue] && !_CPLSilentLogging)
  {
    v20 = __CPLGenericOSLogDomain();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = (CKRecord *)[v10 length];
      *(_DWORD *)buf = 134218498;
      id v24 = v21;
      __int16 v25 = 2112;
      v26 = v18;
      __int16 v27 = 2112;
      uint64_t v28 = self;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Mismatching filesize (fetched %lu vs. expected %@) for resourceData for %@", buf, 0x20u);
    }
  }
}

- (id)cplChangedKeys
{
  id v3 = [(CKRecord *)self valueStore];
  uint64_t v4 = [v3 changedKeysSet];
  id v5 = [v4 allObjects];
  id v6 = [v5 mutableCopy];

  v7 = [(CKRecord *)self encryptedValueStore];
  uint64_t v8 = [v7 changedKeysSet];
  v9 = [v8 allObjects];
  [v6 addObjectsFromArray:v9];

  return v6;
}

- (BOOL)cpl_inExpunged
{
  v2 = [(CKRecord *)self objectForKeyedSubscript:@"isExpunged"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)cpl_isSparseRecord
{
  v2 = [(CKRecord *)self objectForKey:@"isSparsePrivateRecord"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (id)cpl_sharingRecordScopedIdentifierWithScopeProvider:(id)a3 currentUserRecordID:(id)a4 isSparseRecord:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(CKRecord *)self objectForKey:@"isSparsePrivateRecord"];
  *a5 = [v10 BOOLValue];

  if (!*a5)
  {
    self = 0;
    goto LABEL_26;
  }
  id v11 = [(CKRecord *)self objectForKey:@"linkedShareZoneName"];
  id v12 = [(CKRecord *)self objectForKey:@"linkedShareZoneOwner"];
  if (!v11) {
    goto LABEL_24;
  }
  v13 = CKCurrentUserDefaultName;
  if (v12)
  {
    __int16 v14 = [v12 recordID];
    uint64_t v15 = [v14 recordName];

    id v16 = [v9 recordName];
    unint64_t v17 = (unint64_t)v16;
    if (v15 && v16)
    {
      unsigned __int8 v18 = [(id)v15 isEqual:v16];

      if (v18) {
        goto LABEL_11;
      }
    }
    else
    {

      if (!(v15 | v17)) {
        goto LABEL_11;
      }
    }
    id v19 = [v12 recordID];
    uint64_t v20 = [v19 recordName];

    v13 = (NSString *)v20;
  }
LABEL_11:
  id v21 = [objc_alloc((Class)CKRecordZoneID) initWithZoneName:v11 ownerName:v13];
  id v22 = [v8 scopeIdentifierFromZoneID:v21];
  id v23 = [v8 cloudKitScopeForScopeIdentifier:v22];
  BOOL v24 = v23 == 0;
  if (!v23)
  {
    if (_CPLSilentLogging) {
      goto LABEL_21;
    }
    BOOL v29 = v23 == 0;
    __int16 v27 = sub_1000769CC();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      self = [(CKRecord *)self recordID];
      *(_DWORD *)buf = 138412546;
      id v31 = self;
      __int16 v32 = 2112;
      id v33 = v21;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%@ record points to unknown zone %@", buf, 0x16u);
    }
LABEL_20:
    BOOL v24 = v29;
LABEL_21:

    goto LABEL_23;
  }
  if (v22)
  {
    BOOL v29 = v23 == 0;
    __int16 v25 = [(CKRecord *)self objectForKey:@"linkedShareRecordName"];
    if (!v25)
    {
      v26 = [(CKRecord *)self recordID];
      __int16 v25 = [v26 recordName];
    }
    self = (CKRecord *)[objc_alloc((Class)CPLScopedIdentifier) initWithScopeIdentifier:v22 identifier:v25];

    goto LABEL_20;
  }
  BOOL v24 = 1;
LABEL_23:

  if (v24) {
LABEL_24:
  }
    self = 0;

LABEL_26:
  return self;
}

- (BOOL)cpl_supportsSharingScopeIdentifier
{
  v2 = [(CKRecord *)self recordType];
  id v3 = CPLRecordChangeClassForCKRecordType(v2);

  if (!v3) {
    return 0;
  }
  return [v3 supportsSharingScopedIdentifier];
}

- (BOOL)cpl_isSharedWithScopeWithIdentifier:(id)a3 scopeProvider:(id)a4 currentUserRecordID:(id)a5 isSparseRecord:(BOOL *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [(CKRecord *)self objectForKey:@"isSparsePrivateRecord"];
  *a6 = [v13 BOOLValue];

  __int16 v14 = [(CKRecord *)self objectForKey:@"linkedShareZoneName"];
  uint64_t v15 = [(CKRecord *)self objectForKey:@"linkedShareZoneOwner"];
  if (v14)
  {
    id v16 = CKCurrentUserDefaultName;
    id v31 = v10;
    if (!v15) {
      goto LABEL_10;
    }
    unint64_t v17 = [v15 recordID];
    uint64_t v18 = [v17 recordName];

    id v19 = [v12 recordName];
    unint64_t v20 = (unint64_t)v19;
    if (v18 && v19)
    {
      unsigned __int8 v21 = [(id)v18 isEqual:v19];

      if (v21)
      {
LABEL_10:
        id v25 = [objc_alloc((Class)CKRecordZoneID) initWithZoneName:v14 ownerName:v16];
        v26 = [v11 scopeIdentifierFromZoneID:v25];
        __int16 v27 = [v11 cloudKitScopeForScopeIdentifier:v26];
        if (v27)
        {
          if (v26 && ([v26 isEqualToString:v31] & 1) != 0)
          {

            BOOL v22 = 1;
LABEL_20:
            id v10 = v31;
            goto LABEL_21;
          }
        }
        else
        {
          if (!_CPLSilentLogging)
          {
            uint64_t v28 = sub_1000769CC();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              BOOL v29 = [(CKRecord *)self recordID];
              *(_DWORD *)buf = 138412546;
              id v33 = v29;
              __int16 v34 = 2112;
              id v35 = v25;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%@ record points to unknown zone %@", buf, 0x16u);
            }
          }

          v26 = 0;
        }

        BOOL v22 = 0;
        goto LABEL_20;
      }
    }
    else
    {

      if (!(v18 | v20)) {
        goto LABEL_10;
      }
    }
    id v23 = [v15 recordID];
    uint64_t v24 = [v23 recordName];

    id v16 = (NSString *)v24;
    goto LABEL_10;
  }
  BOOL v22 = 0;
LABEL_21:

  return v22;
}

- (void)cpl_updatePrivateRecordSharedToRecordWithID:(id)a3 currentUserRecordID:(id)a4 setSparseRecordFlag:(BOOL)a5 force:(BOOL)a6
{
  BOOL v7 = a5;
  id v19 = a3;
  id v10 = a4;
  if (a6
    || ([(CKRecord *)self recordType],
        id v11 = objc_claimAutoreleasedReturnValue(),
        unsigned int v12 = [CPLRecordChangeClassForCKRecordType(v11) supportsSharingScopedIdentifier],
        v11,
        v12))
  {
    v13 = [v19 zoneID];
    __int16 v14 = [v13 ownerName];
    uint64_t v15 = CPLCKReferenceToUser(v14, v10);

    [(CKRecord *)self setObject:v15 forKey:@"linkedShareZoneOwner"];
    id v16 = [v19 zoneID];
    unint64_t v17 = [v16 zoneName];
    [(CKRecord *)self setObject:v17 forKey:@"linkedShareZoneName"];

    uint64_t v18 = [v19 recordName];
    [(CKRecord *)self setObject:v18 forKey:@"linkedShareRecordName"];

    if (v7) {
      [(CKRecord *)self setObject:&__kCFBooleanTrue forKey:@"isSparsePrivateRecord"];
    }
  }
}

- (void)cpl_updateContributorsOnSharedRecord:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    BOOL v22 = self;
    id v5 = [(CKRecord *)self recordID];
    id v6 = [v5 zoneID];

    id v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v23 = v4;
    id v8 = v4;
    id v9 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v25;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = [objc_alloc((Class)CKRecordID) initWithRecordName:*(void *)(*((void *)&v24 + 1) + 8 * i) zoneID:v6];
          id v14 = [objc_alloc((Class)CKReference) initWithRecordID:v13 action:0];
          [v7 addObject:v14];
        }
        id v10 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v10);
    }

    if (!_CPLSilentLogging)
    {
      uint64_t v15 = sub_1000769CC();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [(CKRecord *)v22 recordID];
        *(_DWORD *)buf = 138412546;
        id v29 = v7;
        __int16 v30 = 2114;
        id v31 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Setting proposed contributors to %@ for record %{public}@", buf, 0x16u);
      }
    }
    unint64_t v17 = [(CKRecord *)v22 pluginFields];
    id v18 = [v17 mutableCopy];

    if (!v18) {
      id v18 = objc_alloc_init((Class)NSMutableDictionary);
    }
    [v18 setValue:v7 forKey:@"proposedContributors"];
    [(CKRecord *)v22 setPluginFields:v18];
    id v4 = v23;
    if (!_CPLSilentLogging)
    {
      id v19 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v20 = [(CKRecord *)v22 recordID];
        unsigned __int8 v21 = [v20 recordName];
        *(_DWORD *)buf = 138412546;
        id v29 = v18;
        __int16 v30 = 2112;
        id v31 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Setting plugin fields to %@ for %@", buf, 0x16u);
      }
    }
  }
}

- (id)cpl_destinationRecordIDInPrivateScopeWithCurrentUserRecordID:(id)a3 proposedDestinationRecordID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CKRecord *)self objectForKeyedSubscript:@"remappedBy"];
  if (v8)
  {
    id v24 = v6;
    id v9 = [v6 recordName];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v23 = [[CPLRemappedBy alloc] initWithData:v8];
    id v10 = sub_10004E6A4((uint64_t)v23);
    id v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v26;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          id v16 = sub_100047C40(v15);
          unsigned __int8 v17 = [v16 isEqualToString:v9];

          if (v17)
          {
            id v19 = objc_alloc((Class)CKRecordID);
            unint64_t v20 = sub_100047C54(v15);
            unsigned __int8 v21 = [v7 zoneID];
            id v18 = [v19 initWithRecordName:v20 zoneID:v21];

            id v6 = v24;
            goto LABEL_13;
          }
        }
        id v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16, v23);
        if (v12) {
          continue;
        }
        break;
      }
    }

    id v6 = v24;
  }
  id v18 = v7;
LABEL_13:

  return v18;
}

- (id)cpl_decryptedObjectForKey:(id)a3 validateClass:(Class)a4
{
  id v6 = a3;
  id v7 = [(CKRecord *)self encryptedValues];
  id v8 = [v7 objectForKeyedSubscript:v6];

  if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = [(CKRecord *)self cpl_legacyDecryptedObjectForKey:v6 validateClass:a4];
  }
  else
  {
    id v9 = v8;
  }
  id v10 = v9;

  return v10;
}

- (void)cpl_setEncryptedObject:(id)a3 forKey:(id)a4 validateClass:(Class)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(CKRecord *)self encryptedValues];
  [v9 setObject:v8 forKeyedSubscript:v7];
}

- (id)cpl_legacyDecryptedObjectForKey:(id)a3 validateClass:(Class)a4
{
  id v6 = a3;
  if (([(objc_class *)a4 isSubclassOfClass:objc_opt_class()] & 1) == 0
    && ([(objc_class *)a4 isSubclassOfClass:objc_opt_class()] & 1) == 0
    && ([(objc_class *)a4 isSubclassOfClass:objc_opt_class()] & 1) == 0
    && ([(objc_class *)a4 isSubclassOfClass:objc_opt_class()] & 1) == 0
    && ([(objc_class *)a4 isSubclassOfClass:objc_opt_class()] & 1) == 0
    && ([(objc_class *)a4 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    sub_1001CBEDC((uint64_t)a4);
  }
  id v7 = [(CKRecord *)self encryptedValues];
  id v8 = [v7 objectForKeyedSubscript:v6];

  if (!v8
    && ([(CKRecord *)self objectForKeyedSubscript:v6],
        (id v8 = objc_claimAutoreleasedReturnValue()) == 0)
    || (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v9 = v8;
    id v8 = v9;
LABEL_11:
    id v10 = v9;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      id v11 = sub_100077AB0();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = [(CKRecord *)self recordType];
        uint64_t v13 = [(CKRecord *)self recordID];
        id v14 = [v13 recordName];
        *(_DWORD *)buf = 138543874;
        id v33 = v12;
        __int16 v34 = 2114;
        id v35 = v14;
        __int16 v36 = 2114;
        id v37 = (id)objc_opt_class();
        id v15 = v37;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Unexpected object instead of encrypted data for %{public}@.%{public}@: %{public}@", buf, 0x20u);
      }
    }
    goto LABEL_19;
  }
  if ([(objc_class *)a4 isSubclassOfClass:objc_opt_class()])
  {
    id v9 = [objc_alloc((Class)NSString) initWithData:v8 encoding:4];
    goto LABEL_11;
  }
  id v31 = 0;
  unsigned __int8 v17 = +[NSPropertyListSerialization propertyListWithData:v8 options:0 format:0 error:&v31];
  id v18 = v31;
  id v19 = v17;
  id v10 = v19;
  if (!v19 && !_CPLSilentLogging)
  {
    unint64_t v20 = sub_100077AB0();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = [(CKRecord *)self recordType];
      BOOL v22 = [(CKRecord *)self recordID];
      id v23 = [v22 recordName];
      *(_DWORD *)buf = 138543874;
      id v33 = v21;
      __int16 v34 = 2114;
      id v35 = v23;
      __int16 v36 = 2112;
      id v37 = v18;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Unable to decode property list for %{public}@.%{public}@: %@", buf, 0x20u);
    }
    goto LABEL_19;
  }
  BOOL v24 = v19 == 0;

  if (v24)
  {
LABEL_19:
    id v10 = 0;
    goto LABEL_20;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      long long v25 = sub_100077AB0();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        long long v26 = [(CKRecord *)self recordType];
        long long v27 = [(CKRecord *)self recordID];
        long long v28 = [v27 recordName];
        id v29 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        id v33 = v26;
        __int16 v34 = 2114;
        id v35 = v28;
        __int16 v36 = 2114;
        id v37 = v29;
        id v30 = v29;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Unexpected object for %{public}@.%{public}@: %{public}@", buf, 0x20u);
      }
    }

    goto LABEL_19;
  }
LABEL_20:

  return v10;
}

- (void)cpl_setLegacyEncryptedObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [v6 dataUsingEncoding:4];
    }
    else
    {
      id v15 = 0;
      id v8 = +[NSPropertyListSerialization dataWithPropertyList:v6 format:200 options:0 error:&v15];
      id v9 = v15;
      if (!v8 && !_CPLSilentLogging)
      {
        id v10 = sub_100077AB0();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          id v11 = [(CKRecord *)self recordType];
          id v12 = [(CKRecord *)self recordID];
          uint64_t v13 = [v12 recordName];
          *(_DWORD *)buf = 138543874;
          id v17 = v11;
          __int16 v18 = 2114;
          id v19 = v13;
          __int16 v20 = 2112;
          id v21 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Unable to convert property list for %{public}@.%{public}@: %@", buf, 0x20u);
        }
      }
    }
    if (v8) {
      goto LABEL_13;
    }
LABEL_14:
    [(CKRecord *)self setObject:0 forKeyedSubscript:v7];
    goto LABEL_15;
  }
  id v8 = v6;
LABEL_13:
  id v14 = [(CKRecord *)self encryptedValues];
  [v14 setObject:v8 forKeyedSubscript:v7];

LABEL_15:
}

+ (id)cpl_expungedRecordFromCPLRecordChange:(id)a3 inZone:(id)a4 target:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (([v7 supportsDeletion] & 1) == 0) {
    sub_1001CC0A8();
  }
  if ([v7 supportsDirectDeletion]) {
    sub_1001CBFC0();
  }
  id v10 = CPLBaseCKRecordFromCPLRecordChange(v7, v8, v9);
  id v11 = +[NSDate date];
  [v10 setObject:v11 forKey:@"recordModificationDate"];

  [v10 setObject:&__kCFBooleanTrue forKey:@"isDeleted"];
  [v10 setObject:&__kCFBooleanTrue forKey:@"isExpunged"];

  return v10;
}

+ (id)cpl_expungedSharedRecordFromCPLRecordChange:(id)a3 inZone:(id)a4 target:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (([v7 supportsDeletion] & 1) == 0) {
    sub_1001CC278();
  }
  if ([v7 supportsDirectDeletion]) {
    sub_1001CC190();
  }
  id v10 = CPLBaseSharedCKRecordFromCPLRecordChange(v7, v8, v9);
  id v11 = +[NSDate date];
  [v10 setObject:v11 forKey:@"recordModificationDate"];

  [v10 setObject:&__kCFBooleanTrue forKey:@"isDeleted"];
  [v10 setObject:&__kCFBooleanTrue forKey:@"isExpunged"];

  return v10;
}

+ (id)cpl_recordFromCPLRecordChange:(id)a3 scopeProvider:(id)a4 currentUserRecordID:(id)a5 inZone:(id)a6 resourceCountAndSize:(id)a7 error:(id *)a8
{
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = objc_alloc_init((Class)CPLSimpleRecordTargetMapping);
  id v19 = [v17 scopedIdentifier];
  __int16 v20 = [v18 targetForRecordWithScopedIdentifier:v19];
  id v21 = CPLBaseCKRecordFromCPLRecordChange(v17, v14, v20);

  BOOL v22 = [[CPLSimpleCKRecordBuilder alloc] initWithBaseCKRecord:v21 scopeProvider:v16 currentUserRecordID:v15 targetMapping:v18];
  LODWORD(a8) = [v17 prepareWithCKRecordBuilder:v22 resourceCountAndSize:v13 scopeProvider:v16 error:a8];

  if (a8) {
    id v23 = v21;
  }
  else {
    id v23 = 0;
  }

  return v23;
}

- (id)cpl_recordChangeMissingResourceProperties:(id *)a3 scopeIdentifier:(id)a4 scopeProvider:(id)a5 currentUserRecordID:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(CKRecord *)self recordType];
  id v14 = (objc_class *)CPLRecordChangeClassForCKRecordType(v13);
  if (v14)
  {
    id v15 = objc_alloc_init(v14);
    [v15 prepareWithCKRecord:self scopeIdentifier:v10 scopeProvider:v11 currentUserRecordID:v12];
    if (([v15 isDelete] & 1) == 0)
    {
      id v16 = [(CKRecord *)self objectForKeyedSubscript:@"dateExpunged"];
      id v17 = [v16 dateByAddingTimeInterval:-2592000.0];
      [v15 setDateDeleted:v17];

      [v15 fillWithCKRecord:self missingResourceProperties:a3 scopeProvider:v11];
    }
    id v18 = v15;
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (id)cplResourceWithType:(unint64_t)a3 scopedIdentifier:(id)a4 forRecord:(id)a5 isCoherent:(BOOL *)a6 scopeProvider:(id)a7
{
  v95 = (CKRecord *)a4;
  id v12 = a5;
  id v13 = a7;
  id v14 = sub_1000961D8((uint64_t)CPLCloudKitResourceKeys, a3);
  if (v14)
  {
    id v15 = v12;
    double v99 = 0.0;
    id v100 = 0;
    double v98 = 0.0;
    id v16 = [(CKRecord *)self pluginFields];
    id v17 = sub_1000967B0((uint64_t)v14);
    id v18 = [v16 objectForKeyedSubscript:v17];
    unsigned int v19 = [v18 BOOLValue];

    *a6 = 1;
    unsigned int v88 = v19;
    unint64_t v92 = a3;
    v89 = a6;
    v87 = self;
    if (v19)
    {
      __int16 v20 = sub_1000379D4((uint64_t)v14);
      id v21 = [v16 objectForKey:v20];
      id v100 = [v21 unsignedIntegerValue];

      BOOL v22 = sub_100096744((uint64_t)v14);
      id v94 = [v16 objectForKey:v22];

      id v23 = sub_100096750((uint64_t)v14);
      BOOL v24 = [v16 objectForKey:v23];

      long long v25 = sub_10009675C((uint64_t)v14);
      long long v26 = [v16 objectForKey:v25];

      double v98 = (double)(uint64_t)[v24 integerValue];
      double v99 = (double)(uint64_t)[v26 integerValue];
      long long v27 = sub_100096768((uint64_t)v14);
      long long v28 = [v16 objectForKey:v27];
      id v29 = CPLDynamicFingerPrintFromCloudKitFingerPrint(v28);

      id v30 = 0;
      id v31 = 0;
      id v93 = 0;
      BOOL v32 = 0;
      uint64_t v33 = 1;
    }
    else
    {
      __int16 v34 = sub_100096768((uint64_t)v14);
      [(CKRecord *)self objectForKey:v34];
      id v29 = v35 = self;

      __int16 v36 = sub_1000967A4((uint64_t)v14);
      v85 = [(CKRecord *)v35 objectForKey:v36];

      if (v29)
      {
        id v37 = [v13 fingerprintContext];
        long long v38 = [v37 fingerprintSchemeForFingerprint:v29];

        id v12 = v15;
        if (v38 && [v38 isValid])
        {
          id v96 = 0;
          id v97 = 0;
          v83 = sub_1000B5ACC((id *)[CPLCloudKitResourceRecordProperties alloc], v14, [v15 recordClass], v38);
          sub_1000B651C((uint64_t)v83, &v97, &v100, &v98, &v96, v87);
          id v93 = v97;
          id v94 = v96;
          uint64_t v39 = [v85 signature];
          long long v40 = v38;
          v90 = (void *)v39;
          if (v39)
          {
            uint64_t v41 = v39;
            v42 = v40;
            v43 = [v13 fingerprintContext];
            uint64_t v44 = [v43 fingerprintSchemeForSignature:v41];

            v45 = (void *)v44;
            BOOL v46 = v44 == (void)v42;
            long long v38 = v42;
            v82 = v45;
            if (v46)
            {
              if ([v42 isForStableHash]) {
                unsigned int v76 = 0;
              }
              else {
                unsigned int v76 = [v12 requiresStableHashForResourceType:a3];
              }
              uint64_t v56 = (uint64_t)[v42 canMatchSignatureToFingerprint];
            }
            else
            {
              v81 = v42;
              if (!_CPLSilentLogging)
              {
                v47 = __CPLGenericOSLogDomain();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                {
                  v80 = [(CKRecord *)v87 recordID];
                  v79 = +[CPLResource shortDescriptionForResourceType:a3];
                  [v45 fingerprintSchemeDescription];
                  v49 = v48 = v47;
                  uint64_t v50 = [v42 fingerprintSchemeDescription];
                  *(_DWORD *)buf = 138544386;
                  uint64_t v102 = (uint64_t)v80;
                  __int16 v103 = 2112;
                  v104 = v95;
                  __int16 v105 = 2112;
                  uint64_t v106 = (uint64_t)v79;
                  __int16 v107 = 2114;
                  v108 = v49;
                  __int16 v109 = 2114;
                  uint64_t v110 = v50;
                  v51 = (void *)v50;
                  _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "CKRecord %{public}@ (for %@) has a CKAsset for %@ with a fingerprint of a different scheme %{public}@ (vs. %{public}@)", buf, 0x34u);

                  v47 = v48;
                  v45 = v82;
                }
              }
              *a6 = 0;
              if (!v93)
              {
                if ([v81 isForStableHash]
                  && ([v45 isForStableHash] & 1) == 0)
                {
                  id v93 = v29;
                }
                else
                {
                  id v93 = 0;
                }
              }
              uint64_t v77 = +[CKAsset cplFingerPrintForSignature:v90];

              unsigned int v76 = 0;
              uint64_t v56 = 0;
              id v29 = (void *)v77;
              long long v38 = v81;
            }
          }
          else
          {
            unsigned int v76 = 0;
            uint64_t v56 = 1;
          }

          BOOL v32 = v76 != 0;
          id v30 = v90;
        }
        else
        {
          if (!_CPLSilentLogging)
          {
            v52 = v38;
            v53 = __CPLGenericOSLogDomain();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
            {
              v54 = [(CKRecord *)v87 recordID];
              v55 = +[CPLResource shortDescriptionForResourceType:a3];
              *(_DWORD *)buf = 138544130;
              uint64_t v102 = (uint64_t)v54;
              __int16 v103 = 2112;
              v104 = v95;
              __int16 v105 = 2112;
              uint64_t v106 = (uint64_t)v55;
              __int16 v107 = 2112;
              v108 = v29;
              _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "CKRecord %{public}@ (for %@) has a CKAsset for %@ with an invalid fingerprint (%@) attached", buf, 0x2Au);
            }
            long long v38 = v52;
          }

          id v30 = 0;
          id v93 = 0;
          id v94 = 0;
          BOOL v32 = 0;
          id v29 = 0;
          uint64_t v56 = 1;
        }

        id v31 = v85;
        uint64_t v33 = v56;
        if (v29)
        {
LABEL_24:
          v91 = v30;
          v84 = v16;
          v57 = v31;
          id v58 = objc_alloc_init((Class)CPLResourceIdentity);
          [v58 setFingerPrint:v29];
          v59 = v93;
          if (v93) {
            BOOL v60 = 0;
          }
          else {
            BOOL v60 = v32;
          }
          id v86 = v13;
          if (v60 && !_CPLSilentLogging)
          {
            v61 = __CPLGenericOSLogDomain();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
            {
              v62 = [(CKRecord *)v87 recordID];
              +[CPLResource shortDescriptionForResourceType:v92];
              uint64_t v33 = v63 = v33;
              *(_DWORD *)buf = 138543874;
              uint64_t v102 = (uint64_t)v62;
              __int16 v103 = 2112;
              v104 = v95;
              __int16 v105 = 2112;
              uint64_t v106 = v33;
              _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "CKRecord %{public}@ (for %@) has no stable hash for %@", buf, 0x20u);

              v59 = v93;
              LODWORD(v33) = v63;
            }
          }
          [v58 setStableHash:v59];
          [v58 setFileSize:v100];
          [v58 setFileUTI:v94];
          objc_msgSend(v58, "setImageDimensions:", v98, v99);
          if (v31) {
            int v64 = 1;
          }
          else {
            int v64 = v88;
          }
          if (v64 == 1)
          {
            [v58 setAvailable:1];
            v65 = v89;
          }
          else
          {
            v65 = v89;
            if (!_CPLSilentLogging)
            {
              v66 = __CPLGenericOSLogDomain();
              if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
              {
                sub_1000967A4((uint64_t)v14);
                uint64_t v33 = v67 = v33;
                *(_DWORD *)buf = 138412546;
                uint64_t v102 = v33;
                __int16 v103 = 2112;
                v104 = v87;
                _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "Did not find %@ in %@", buf, 0x16u);

                LODWORD(v33) = v67;
              }
            }
          }
          if (!*v65) {
            goto LABEL_51;
          }
          if (!v33)
          {
            unsigned char *v65 = 1;
LABEL_51:
            uint64_t v33 = (uint64_t)[objc_alloc((Class)CPLResource) initWithResourceIdentity:v58 itemScopedIdentifier:v95 resourceType:v92];
            id v31 = v57;
            v73 = [v57 fileURL];

            if (v73)
            {
              v74 = [v57 fileURL];
              v75 = [(id)v33 identity];
              [v75 setFileURL:v74];

              v59 = v93;
            }

            id v16 = v84;
            id v13 = v86;
            id v30 = v91;
LABEL_65:

            if (v29) {
              goto LABEL_67;
            }
            goto LABEL_66;
          }
          if (v91)
          {
            v68 = +[CKAsset cplFingerPrintForSignature:](CKAsset, "cplFingerPrintForSignature:");
            id v69 = v29;
            id v70 = v68;
            if (v70 && ([v69 isEqual:v70] & 1) != 0)
            {
              char v71 = 1;
LABEL_50:

              unsigned char *v65 = v71;
              goto LABEL_51;
            }
          }
          else
          {
            id v72 = v29;
            id v70 = 0;
          }
          char v71 = 0;
          goto LABEL_50;
        }
LABEL_64:
        v59 = v93;
        goto LABEL_65;
      }
      id v30 = 0;
      id v93 = 0;
      id v94 = 0;
      BOOL v32 = 0;
      uint64_t v33 = 1;
      id v31 = v85;
    }
    id v12 = v15;
    if (v29) {
      goto LABEL_24;
    }
    goto LABEL_64;
  }
LABEL_66:
  uint64_t v33 = 0;
LABEL_67:

  return (id)v33;
}

- (id)cplResourcesWithScopedIdentifier:(id)a3 coherent:(BOOL *)a4 forRecord:(id)a5 scopeProvider:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = sub_100078F60;
  __int16 v36 = sub_100078F70;
  id v37 = 0;
  BOOL v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  BOOL v24 = sub_100078F78;
  long long v25 = &unk_100279160;
  id v13 = v11;
  id v26 = v13;
  long long v27 = self;
  id v14 = v10;
  id v28 = v14;
  id v15 = v12;
  id v29 = v15;
  id v30 = &v32;
  id v31 = a4;
  +[CPLResource enumerateResourceTypesWithBlock:&v22];
  id v16 = (id)v33[5];
  id v17 = v16;
  if (*a4 && objc_msgSend(v16, "count", v22, v23, v24, v25, v26, v27, v28))
  {
    uint64_t v18 = +[CPLCloudKitFakeDynamicDerivatives overriddenResourcesFromResources:v17];

    id v17 = (void *)v18;
  }
  unsigned int v19 = v29;
  id v20 = v17;

  _Block_object_dispose(&v32, 8);
  return v20;
}

- (id)plistArchiveWithCPLArchiver:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  id v6 = [v4 archiveCursor];
  [v4 setArchiveCursor:v5];
  [(CKRecord *)self encodeWithCoder:v4];
  [v4 setArchiveCursor:v6];

  return v5;
}

- (CKRecord)initWithCPLArchiver:(id)a3
{
  return [(CKRecord *)self initWithCoder:a3];
}

- selfIfMatchesRecordName:(id)a3
{
  id v4 = a3;
  id v5 = [(CKRecord *)self recordID];
  id v6 = [v5 recordName];
  unsigned int v7 = [v6 isEqualToString:v4];

  if (v7) {
    id v8 = self;
  }
  else {
    id v8 = 0;
  }
  return v8;
}

@end