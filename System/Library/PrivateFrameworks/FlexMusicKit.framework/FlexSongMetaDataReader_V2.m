@interface FlexSongMetaDataReader_V2
+ (BOOL)isSongAtPath:(id)a3;
+ (id)_pathToMetadata:(id)a3;
+ (id)songAtPath:(id)a3;
@end

@implementation FlexSongMetaDataReader_V2

+ (BOOL)isSongAtPath:(id)a3
{
  v5 = objc_msgSend__pathToMetadata_(a1, a2, (uint64_t)a3, v3, v4);
  char v16 = 0;
  v10 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v6, v7, v8, v9);
  char isDirectory = objc_msgSend_fileExistsAtPath_isDirectory_(v10, v11, (uint64_t)v5, (uint64_t)&v16, v12);
  if (v16) {
    BOOL v14 = 0;
  }
  else {
    BOOL v14 = isDirectory;
  }

  return v14;
}

+ (id)_pathToMetadata:(id)a3
{
  return (id)objc_msgSend_stringByAppendingPathComponent_(a3, a2, @"metadata.smm", v3, v4);
}

+ (id)songAtPath:(id)a3
{
  v59[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  if (objc_msgSend_isSongAtPath_(v4, v5, (uint64_t)v3, v6, v7))
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v12 = objc_msgSend__pathToMetadata_(v8, v9, (uint64_t)v3, v10, v11);
    v17 = objc_msgSend_dataWithContentsOfFile_(MEMORY[0x263EFF8F8], v13, (uint64_t)v12, v14, v15);
    if (v17)
    {
      id v58 = 0;
      v18 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x263F08900], v16, (uint64_t)v17, 0, (uint64_t)&v58);
      id v22 = v58;
      if (v18)
      {
        v23 = objc_msgSend_objectForKey_(v18, v19, @"contentVersion", v20, v21);

        if (v23)
        {
          v27 = objc_msgSend_objectForKeyedSubscript_(v18, v24, @"contentVersion", v25, v26);
          uint64_t v32 = objc_msgSend_integerValue(v27, v28, v29, v30, v31);
        }
        else
        {
          uint64_t v32 = 1;
        }
        v34 = objc_msgSend_objectForKey_(v18, v24, @"compatibilityVersion", v25, v26);

        if (v34)
        {
          v38 = objc_msgSend_objectForKeyedSubscript_(v18, v35, @"compatibilityVersion", v36, v37);
          uint64_t v43 = objc_msgSend_integerValue(v38, v39, v40, v41, v42);
        }
        else
        {
          uint64_t v43 = 1;
        }
        v44 = [FMSongAsset alloc];
        v48 = objc_msgSend_fileURLWithPath_(NSURL, v45, (uint64_t)v3, v46, v47);
        v50 = objc_msgSend_initWithAssetID_assetStatus_localURL_contentVersion_compatibilityVersion_(v44, v49, @"FMSongBundleAssetID", 0, (uint64_t)v48, v32, v43);

        v51 = [FlexSong alloc];
        v59[0] = v50;
        v54 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v52, (uint64_t)v59, 1, v53);
        v33 = objc_msgSend_initWithDictionary_assets_(v51, v55, (uint64_t)v18, (uint64_t)v54, v56);
      }
      else
      {
        v33 = 0;
      }
    }
    else
    {
      v33 = 0;
    }
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

@end