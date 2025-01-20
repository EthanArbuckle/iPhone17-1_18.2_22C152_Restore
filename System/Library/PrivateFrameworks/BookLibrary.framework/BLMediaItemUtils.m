@interface BLMediaItemUtils
+ (id)hlsOfflinePlaybackKeysForItem:(id)a3;
+ (unint64_t)bitrateForItem:(id)a3;
+ (void)addPersistHLSOfflinePlaybackKey:(id)a3 forUri:(id)a4 toItem:(id)a5;
+ (void)clearPersistHLSOfflinePlaybackKeysFromItem:(id)a3;
+ (void)removePersistHLSOfflinePlaybackKeyForUri:(id)a3 fromItem:(id)a4;
+ (void)setBitrate:(unint64_t)a3 forItem:(id)a4;
@end

@implementation BLMediaItemUtils

+ (id)hlsOfflinePlaybackKeysForItem:(id)a3
{
  v27[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_opt_class();
  v4 = sub_21E61B5E8();
  v7 = objc_msgSend_valueForProperty_(v3, v5, (uint64_t)v4, v6);

  v8 = BUDynamicCast();

  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  v27[2] = objc_opt_class();
  v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v9, (uint64_t)v27, 3);
  objc_opt_class();
  v11 = (void *)MEMORY[0x263F08928];
  v14 = objc_msgSend_setWithArray_(MEMORY[0x263EFFA08], v12, (uint64_t)v10, v13);
  id v24 = 0;
  v16 = objc_msgSend_unarchivedObjectOfClasses_fromData_error_(v11, v15, (uint64_t)v14, (uint64_t)v8, &v24);
  id v17 = v24;
  v18 = BUDynamicCast();

  if (objc_msgSend_length(v8, v19, v20, v21) && v17)
  {
    v22 = BLHLSKeyFetchingLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v17;
      _os_log_impl(&dword_21E616000, v22, OS_LOG_TYPE_ERROR, "Key Unarchive Error:  %@", buf, 0xCu);
    }
  }
  return v18;
}

+ (unint64_t)bitrateForItem:(id)a3
{
  id v3 = a3;
  v4 = sub_21E61B474();
  v7 = objc_msgSend_valueForProperty_(v3, v5, (uint64_t)v4, v6);

  unint64_t v11 = objc_msgSend_unsignedIntegerValue(v7, v8, v9, v10);
  return v11;
}

+ (void)setBitrate:(unint64_t)a3 forItem:(id)a4
{
  v5 = NSNumber;
  id v6 = a4;
  objc_msgSend_numberWithUnsignedInteger_(v5, v7, a3, v8);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = sub_21E61B474();
  objc_msgSend_setValue_forProperty_(v6, v10, (uint64_t)v11, (uint64_t)v9);
}

+ (void)addPersistHLSOfflinePlaybackKey:(id)a3 forUri:(id)a4 toItem:(id)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v13 = objc_msgSend_hlsOfflinePlaybackKeysForItem_(a1, v11, (uint64_t)v10, v12);
  id v17 = objc_msgSend_mutableCopy(v13, v14, v15, v16);

  if (!v17)
  {
    id v17 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v18, v19, v20);
  }
  objc_msgSend_setObject_forKey_(v17, v18, (uint64_t)v8, (uint64_t)v9);
  id v38 = 0;
  v22 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x263F08910], v21, (uint64_t)v17, 1, &v38);
  id v23 = v38;
  id v24 = BLHLSKeyFetchingLog();
  v25 = v24;
  if (v23)
  {
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v26 = sub_21E61BA44();
      v29 = objc_msgSend_valueForProperty_(v10, v27, (uint64_t)v26, v28);
      *(_DWORD *)buf = 138543618;
      v40 = v29;
      __int16 v41 = 2112;
      id v42 = v23;
      v30 = "Failed to archive keys for %{public}@. Key Archive Error:  %@";
      v31 = v25;
      os_log_type_t v32 = OS_LOG_TYPE_ERROR;
      uint32_t v33 = 22;
LABEL_8:
      _os_log_impl(&dword_21E616000, v31, v32, v30, buf, v33);
    }
  }
  else if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    id v26 = sub_21E61BA44();
    v29 = objc_msgSend_valueForProperty_(v10, v34, (uint64_t)v26, v35);
    *(_DWORD *)buf = 138543362;
    v40 = v29;
    v30 = "Archived keys for %{public}@";
    v31 = v25;
    os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
    uint32_t v33 = 12;
    goto LABEL_8;
  }

  v36 = sub_21E61B5E8();
  objc_msgSend_setValue_forProperty_(v10, v37, (uint64_t)v22, (uint64_t)v36);
}

+ (void)removePersistHLSOfflinePlaybackKeyForUri:(id)a3 fromItem:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v10 = objc_msgSend_hlsOfflinePlaybackKeysForItem_(a1, v8, (uint64_t)v7, v9);
  v14 = objc_msgSend_mutableCopy(v10, v11, v12, v13);

  if (v14)
  {
    objc_msgSend_removeObjectForKey_(v14, v15, (uint64_t)v6, v16);
    id v23 = 0;
    v18 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x263F08910], v17, (uint64_t)v14, 1, &v23);
    id v19 = v23;
    if (v19)
    {
      uint64_t v20 = BLHLSKeyFetchingLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v19;
        _os_log_impl(&dword_21E616000, v20, OS_LOG_TYPE_ERROR, "Key Archive Error:  %@", buf, 0xCu);
      }
    }
    uint64_t v21 = sub_21E61B5E8();
    objc_msgSend_setValue_forProperty_(v7, v22, (uint64_t)v18, (uint64_t)v21);
  }
}

+ (void)clearPersistHLSOfflinePlaybackKeysFromItem:(id)a3
{
  id v3 = a3;
  sub_21E61B5E8();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forProperty_(v3, v4, 0, (uint64_t)v5);
}

@end