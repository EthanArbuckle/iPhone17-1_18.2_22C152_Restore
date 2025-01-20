@interface FlexSongMetadataReaderUtils
+ (id)addAnalysisMetadataToDictionary:(id)a3 pathToRoot:(id)a4;
@end

@implementation FlexSongMetadataReaderUtils

+ (id)addAnalysisMetadataToDictionary:(id)a3 pathToRoot:(id)a4
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v74 = a3;
  id v5 = a4;
  v72 = objc_opt_new();
  v73 = v5;
  v71 = objc_msgSend_stringByAppendingPathComponent_(v5, v6, @"ANALYSIS", v7, v8);
  v12 = objc_msgSend_stringByAppendingPathComponent_(v71, v9, @"ONSET", v10, v11);
  v17 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v13, v14, v15, v16);
  v20 = objc_msgSend_contentsOfDirectoryAtPath_error_(v17, v18, (uint64_t)v12, 0, v19);

  v75 = objc_opt_new();
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id obj = v20;
  uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v80, (uint64_t)v84, 16);
  if (v22)
  {
    uint64_t v26 = v22;
    uint64_t v27 = *(void *)v81;
    uint64_t v76 = *(void *)v81;
    do
    {
      uint64_t v28 = 0;
      uint64_t v77 = v26;
      do
      {
        if (*(void *)v81 != v27) {
          objc_enumerationMutation(obj);
        }
        v29 = *(void **)(*((void *)&v80 + 1) + 8 * v28);
        v30 = objc_msgSend_stringByAppendingPathComponent_(v12, v23, (uint64_t)v29, v24, v25);
        id v79 = 0;
        v32 = objc_msgSend_stringWithContentsOfFile_encoding_error_(NSString, v31, (uint64_t)v30, 4, (uint64_t)&v79);
        id v36 = v79;
        if (!v36)
        {
          v37 = v12;
          v38 = objc_msgSend_componentsSeparatedByString_(v32, v33, @"\n", v34, v35);
          v43 = objc_msgSend_mutableCopy(v38, v39, v40, v41, v42);

          v47 = objc_msgSend_indexesOfObjectsPassingTest_(v43, v44, (uint64_t)&unk_26C7FE788, v45, v46);
          objc_msgSend_removeObjectsAtIndexes_(v43, v48, (uint64_t)v47, v49, v50);
          v55 = objc_msgSend_stringByDeletingPathExtension(v29, v51, v52, v53, v54);
          v58 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v55, v56, @"_onset", (uint64_t)&stru_26C7FED08, v57);

          if (v43) {
            BOOL v61 = v58 == 0;
          }
          else {
            BOOL v61 = 1;
          }
          if (!v61) {
            objc_msgSend_setObject_forKey_(v75, v59, (uint64_t)v43, (uint64_t)v58, v60);
          }

          v12 = v37;
          uint64_t v27 = v76;
          uint64_t v26 = v77;
        }

        ++v28;
      }
      while (v26 != v28);
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v80, (uint64_t)v84, 16);
    }
    while (v26);
  }

  objc_msgSend_setObject_forKey_(v72, v62, (uint64_t)v75, @"onsets", v63);
  v67 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x263EFF9A0], v64, (uint64_t)v74, v65, v66);
  objc_msgSend_setObject_forKey_(v67, v68, (uint64_t)v72, @"analysis", v69);

  return v67;
}

@end