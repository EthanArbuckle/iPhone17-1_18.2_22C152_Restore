@interface NTKParmesanResourceDirectoryEditor
+ (id)linkParmesanAsset:(id)a3 from:(id)a4 to:(id)a5;
+ (void)transcodeAssetsWithIdentifiers:(id)a3 to:(id)a4 completion:(id)a5;
@end

@implementation NTKParmesanResourceDirectoryEditor

+ (id)linkParmesanAsset:(id)a3 from:(id)a4 to:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v13 = objc_msgSend_logObject(NTKParmesanFaceBundle, v10, v11, v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v38 = v7;
    __int16 v39 = 2112;
    id v40 = v9;
    _os_log_impl(&dword_246B51000, v13, OS_LOG_TYPE_DEFAULT, "linkParmesanAsset: linking existing photo %@ into the new resource directory %@", buf, 0x16u);
  }

  v17 = objc_msgSend_copy(v7, v14, v15, v16);
  v19 = objc_msgSend_fileURLWithPath_isDirectory_(NSURL, v18, (uint64_t)v8, 1);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v23 = objc_msgSend_layouts(v7, v20, v21, v22, 0);
  uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v32, (uint64_t)v36, 16);
  if (v25)
  {
    uint64_t v27 = v25;
    uint64_t v28 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v33 != v28) {
          objc_enumerationMutation(v23);
        }
        if (!objc_msgSend_linkFromSrcDirectory_toDstDirectory_(*(void **)(*((void *)&v32 + 1) + 8 * i), v26, (uint64_t)v8, (uint64_t)v9))
        {

          id v30 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v32, (uint64_t)v36, 16);
      if (v27) {
        continue;
      }
      break;
    }
  }

  id v30 = v17;
LABEL_13:

  return v30;
}

+ (void)transcodeAssetsWithIdentifiers:(id)a3 to:(id)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v13 = objc_msgSend_logObject(NTKParmesanFaceBundle, v10, v11, v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v26 = objc_msgSend_count(v7, v14, v15, v16);
    __int16 v27 = 2112;
    id v28 = v8;
    __int16 v29 = 2112;
    id v30 = v7;
    _os_log_impl(&dword_246B51000, v13, OS_LOG_TYPE_DEFAULT, "transcodeAssetsWithIdentifiers: transcoding %ld new assets to %@\x04\n%@", buf, 0x20u);
  }

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_246B614EC;
  v21[3] = &unk_2651FBC30;
  id v23 = v7;
  id v24 = v9;
  id v22 = v8;
  id v17 = v7;
  id v18 = v9;
  id v19 = v8;
  objc_msgSend_processAssetsWithIdentifiers_dstDir_completion_(NTKParmesanPhotoProcessor, v20, (uint64_t)v17, (uint64_t)v19, v21);
}

@end