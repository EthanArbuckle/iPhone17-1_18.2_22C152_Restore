@interface PFCloudKitArchivingUtilities
- (id)encodeRecord:(void *)a3 error:;
- (id)newArchivedDataForSystemFieldsOfRecord:(uint64_t)a1;
- (id)recordFromEncodedData:(void *)a3 error:;
- (void)shareFromEncodedData:(char *)a3 inZoneWithID:(void *)a4 error:;
@end

@implementation PFCloudKitArchivingUtilities

- (id)newArchivedDataForSystemFieldsOfRecord:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [a2 encodeSystemFieldsWithCoder:v3];
  id v4 = (id)[v3 encodedData];
  [v3 finishEncoding];

  return v4;
}

- (id)encodeRecord:(void *)a3 error:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v20 = 0;
  v5 = (void *)MEMORY[0x18C127630]();
  v6 = (void *)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a2 requiringSecureCoding:1 error:&v20];
  if (!v6 || (id v7 = (id)[v6 compressedDataUsingAlgorithm:0 error:&v20]) == 0)
  {
    id v9 = v20;
    id v10 = v20;
    if (v10)
    {
      if (a3)
      {
        id v8 = 0;
        *a3 = v10;
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v11 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v11, v12, v13, v14, v15, v16, v17, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitArchivingUtilities.m");
      v18 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitArchivingUtilities.m";
        __int16 v23 = 1024;
        int v24 = 55;
        _os_log_fault_impl(&dword_18AB82000, v18, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    id v8 = 0;
    goto LABEL_11;
  }
  id v8 = v7;
LABEL_11:

  return v8;
}

- (id)recordFromEncodedData:(void *)a3 error:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v22 = 0;
  v5 = (void *)MEMORY[0x18C127630]();
  uint64_t v6 = [a2 decompressedDataUsingAlgorithm:0 error:&v22];
  if (!v6
    || (uint64_t v7 = v6,
        id v8 = (void *)MEMORY[0x1E4F28DC0],
        getCloudKitCKRecordClass[0](),
        (id v9 = (id)[v8 unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v22]) == 0))
  {
    id v11 = v22;
    id v12 = v22;
    if (v12)
    {
      if (a3)
      {
        id v10 = 0;
        *a3 = v12;
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v13 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v13, v14, v15, v16, v17, v18, v19, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitArchivingUtilities.m");
      id v20 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        int v24 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitArchivingUtilities.m";
        __int16 v25 = 1024;
        int v26 = 81;
        _os_log_fault_impl(&dword_18AB82000, v20, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    id v10 = 0;
    goto LABEL_11;
  }
  id v10 = v9;
LABEL_11:

  return v10;
}

- (void)shareFromEncodedData:(char *)a3 inZoneWithID:(void *)a4 error:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v4 = a2;
  id v37 = 0;
  if (a2)
  {
    id v8 = (void *)MEMORY[0x18C127630]();
    uint64_t v9 = [v4 decompressedDataUsingAlgorithm:0 error:&v37];
    if (!v9
      || (uint64_t v10 = v9,
          id v11 = (void *)MEMORY[0x1E4F28DC0],
          id v12 = (void *)MEMORY[0x1E4F1CAD0],
          getCloudKitCKShareClass[0](),
          (id v13 = (id)objc_msgSend(v11, "_strictlyUnarchivedObjectOfClasses:fromData:error:", objc_msgSend(v12, "setWithObject:", objc_opt_class()), v10, &v37)) == 0))
    {
      id v25 = v37;
      id v24 = v37;
      goto LABEL_10;
    }
    id v4 = v13;
    if ((objc_msgSend(a3, "isEqual:", objc_msgSend((id)objc_msgSend(v4, "recordID"), "zoneID")) & 1) == 0)
    {
      uint64_t v14 = [NSString stringWithUTF8String:"Decoded share zoneID doesn't match row: %@\n%@\n%@"];
      [v4 recordID];
      _NSCoreDataLog(17, v14, v15, v16, v17, v18, v19, v20, (uint64_t)a3);
      v21 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        uint64_t v36 = [v4 recordID];
        *(_DWORD *)buf = 138412802;
        v41 = a3;
        __int16 v42 = 2112;
        uint64_t v43 = v36;
        __int16 v44 = 2112;
        uint64_t v45 = a1;
        _os_log_fault_impl(&dword_18AB82000, v21, OS_LOG_TYPE_FAULT, "CoreData: Decoded share zoneID doesn't match row: %@\n%@\n%@", buf, 0x20u);
      }

      id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v23 = *MEMORY[0x1E4F281F8];
      uint64_t v38 = *MEMORY[0x1E4F28588];
      v39 = @"A fatal error has occured trying to decode sharing metadata, please file a bug with a sysdiagnose and attach the application store files if possible.";
      id v24 = (id)objc_msgSend(v22, "initWithDomain:code:userInfo:", v23, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
      id v37 = v24;
LABEL_10:
      id v26 = v24;
      if (v26)
      {
        if (a4)
        {
          id v4 = 0;
          *a4 = v26;
          goto LABEL_16;
        }
      }
      else
      {
        uint64_t v27 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog(17, v27, v28, v29, v30, v31, v32, v33, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitArchivingUtilities.m");
        v34 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v41 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitArchivingUtilities.m";
          __int16 v42 = 1024;
          LODWORD(v43) = 130;
          _os_log_fault_impl(&dword_18AB82000, v34, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
      id v4 = 0;
    }
  }
LABEL_16:

  return v4;
}

@end