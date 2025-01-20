@interface DESAggregatableMetadata
+ (id)encodeMetadata:(id)a3 recipe:(id)a4 error:(id *)a5;
@end

@implementation DESAggregatableMetadata

+ (id)encodeMetadata:(id)a3 recipe:(id)a4 error:(id *)a5
{
  v87[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v86[0] = @"encodedCategoricalMetadata";
  v86[1] = @"encodedNumericMetadata";
  id v70 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  id v71 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  v87[0] = v70;
  v87[1] = v71;
  v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:v86 count:2];
  if (![v6 count])
  {
    v61 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
    {
      v62 = [v7 recipeID];
      *(_DWORD *)buf = 138412290;
      v80 = v62;
      _os_log_impl(&dword_1BECCB000, v61, OS_LOG_TYPE_INFO, "No metadata for recipe %@", buf, 0xCu);
    }
    goto LABEL_56;
  }
  if (([v7 useAggregatableMetadata] & 1) == 0)
  {
    v61 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
    {
      v63 = [v7 recipeID];
      *(_DWORD *)buf = 138412290;
      v80 = v63;
      _os_log_impl(&dword_1BECCB000, v61, OS_LOG_TYPE_INFO, "Recipe %@ is not configured to use aggregatable metadata.", buf, 0xCu);
    }
LABEL_56:

    v64 = v67;
    id v60 = v67;
    goto LABEL_61;
  }
  v8 = [v7 recipeUserInfo];
  v73 = [v8 objectForKeyedSubscript:@"MetadataEncoding"];

  v9 = [v73 allKeys];
  v10 = [v9 sortedArrayUsingSelector:sel_compare_];

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id obj = v10;
  uint64_t v11 = [obj countByEnumeratingWithState:&v75 objects:v85 count:16];
  if (v11)
  {
    uint64_t v72 = *(void *)v76;
    while (2)
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v76 != v72) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v75 + 1) + 8 * v12);
        v14 = [DESMetadataSchema alloc];
        v15 = [v7 attachments];
        id v74 = 0;
        v16 = [(DESMetadataSchema *)v14 initWith:v73 key:v13 attachments:v15 error:&v74];
        id v17 = v74;

        if (v16)
        {
          v18 = [v6 valueForKeyPath:v13];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            v20 = [v6 valueForKeyPath:v13];
            v21 = +[DESLogging coreChannel];
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              v50 = [v7 recipeID];
              *(_DWORD *)buf = 138412802;
              v80 = v20;
              __int16 v81 = 2112;
              v82 = v13;
              __int16 v83 = 2112;
              v84 = v50;
              _os_log_debug_impl(&dword_1BECCB000, v21, OS_LOG_TYPE_DEBUG, "Encoding string value %@ for metadata entry %@, recipe %@", buf, 0x20u);
            }
            v22 = [(DESMetadataSchema *)v16 encoder];
            v23 = objc_msgSend(v22, "encodeString:toLength:", v20, -[DESMetadataSchema buckets](v16, "buckets"));
          }
          else
          {
            v24 = [v6 valueForKeyPath:v13];
            objc_opt_class();
            char v25 = objc_opt_isKindOfClass();

            if (v25)
            {
              v26 = [v6 valueForKeyPath:v13];
              v27 = +[DESLogging coreChannel];
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                v55 = [v7 recipeID];
                *(_DWORD *)buf = 138412802;
                v80 = v26;
                __int16 v81 = 2112;
                v82 = v13;
                __int16 v83 = 2112;
                v84 = v55;
                _os_log_debug_impl(&dword_1BECCB000, v27, OS_LOG_TYPE_DEBUG, "Encoding numeric value %@ for metadata entry %@, recipe %@", buf, 0x20u);
              }
              v28 = [(DESMetadataSchema *)v16 encoder];
              v23 = objc_msgSend(v28, "encodeNumber:toLength:", v26, -[DESMetadataSchema buckets](v16, "buckets"));
            }
            else
            {
              v29 = [v6 valueForKeyPath:v13];
              objc_opt_class();
              char v30 = objc_opt_isKindOfClass();

              if (v30)
              {
                v68 = [v6 valueForKeyPath:v13];
                if ([v68 count])
                {
                  v31 = [v68 firstObject];
                  objc_opt_class();
                  char v32 = objc_opt_isKindOfClass();

                  if (v32)
                  {
                    v33 = [v6 valueForKeyPath:v13];
                    v34 = +[DESLogging coreChannel];
                    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
                    {
                      v58 = [v7 recipeID];
                      *(_DWORD *)buf = 138412802;
                      v80 = v33;
                      __int16 v81 = 2112;
                      v82 = v13;
                      __int16 v83 = 2112;
                      v84 = v58;
                      _os_log_debug_impl(&dword_1BECCB000, v34, OS_LOG_TYPE_DEBUG, "Encoding string vector %@ for metadata entry %@, recipe %@", buf, 0x20u);
                    }
                    v35 = [(DESMetadataSchema *)v16 encoder];
                    uint64_t v36 = objc_msgSend(v35, "encodeStringVector:toLength:", v33, -[DESMetadataSchema buckets](v16, "buckets"));
                  }
                  else
                  {
                    v47 = [v68 firstObject];
                    objc_opt_class();
                    char v48 = objc_opt_isKindOfClass();

                    if (v48)
                    {
                      v33 = [v6 valueForKeyPath:v13];
                      v49 = +[DESLogging coreChannel];
                      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
                      {
                        v59 = [v7 recipeID];
                        *(_DWORD *)buf = 138412802;
                        v80 = v33;
                        __int16 v81 = 2112;
                        v82 = v13;
                        __int16 v83 = 2112;
                        v84 = v59;
                        _os_log_debug_impl(&dword_1BECCB000, v49, OS_LOG_TYPE_DEBUG, "Encoding numeric vector %@ for metadata entry %@, recipe %@", buf, 0x20u);
                      }
                      v35 = [(DESMetadataSchema *)v16 encoder];
                      uint64_t v36 = objc_msgSend(v35, "encodeNumberVector:toLength:", v33, -[DESMetadataSchema buckets](v16, "buckets"));
                    }
                    else
                    {
                      v51 = NSString;
                      v52 = [v7 recipeID];
                      v33 = [v51 stringWithFormat:@"Array data type of %@ is not supported by schema for recipe %@, must be either string or number.", v13, v52];

                      v53 = +[DESLogging coreChannel];
                      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        v80 = v33;
                        _os_log_error_impl(&dword_1BECCB000, v53, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
                      }

                      v35 = [(DESMetadataSchema *)v16 encoder];
                      uint64_t v36 = objc_msgSend(v35, "zeroWithLength:", -[DESMetadataSchema buckets](v16, "buckets"));
                    }
                  }
                  v23 = (void *)v36;
                }
                else
                {
                  v44 = +[DESLogging coreChannel];
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
                  {
                    v56 = [v7 recipeID];
                    *(_DWORD *)buf = 138412546;
                    v80 = v13;
                    __int16 v81 = 2112;
                    v82 = v56;
                    _os_log_debug_impl(&dword_1BECCB000, v44, OS_LOG_TYPE_DEBUG, "Zero encode empty vector for metadata entry %@, recipe %@", buf, 0x16u);
                  }
                  v33 = [(DESMetadataSchema *)v16 encoder];
                  v23 = objc_msgSend(v33, "zeroWithLength:", -[DESMetadataSchema buckets](v16, "buckets"));
                }
              }
              else
              {
                v37 = [v6 valueForKeyPath:v13];
                BOOL v38 = v37 == 0;

                if (v38)
                {
                  v45 = +[DESLogging coreChannel];
                  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
                  {
                    v57 = [v7 recipeID];
                    *(_DWORD *)buf = 138412546;
                    v80 = v13;
                    __int16 v81 = 2112;
                    v82 = v57;
                    _os_log_debug_impl(&dword_1BECCB000, v45, OS_LOG_TYPE_DEBUG, "Metadata %@ is specified in schema but missing from user data for recipe %@", buf, 0x16u);
                  }
                  v46 = [(DESMetadataSchema *)v16 encoder];
                  v23 = objc_msgSend(v46, "zeroWithLength:", -[DESMetadataSchema buckets](v16, "buckets"));
                }
                else
                {
                  v39 = NSString;
                  v40 = [v7 recipeID];
                  v41 = [v39 stringWithFormat:@"Data type of %@ is not supported by schema for recipe %@, must be either string or number.", v13, v40];

                  v42 = +[DESLogging coreChannel];
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v80 = v41;
                    _os_log_error_impl(&dword_1BECCB000, v42, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
                  }

                  v43 = [(DESMetadataSchema *)v16 encoder];
                  v23 = objc_msgSend(v43, "zeroWithLength:", -[DESMetadataSchema buckets](v16, "buckets"));
                }
              }
            }
          }
          if ([(DESMetadataSchema *)v16 outputType] == 1) {
            v54 = v70;
          }
          else {
            v54 = v71;
          }
          [v54 appendData:v23];
        }
        else if (v17)
        {
          if (a5) {
            *a5 = v17;
          }

          id v60 = 0;
          goto LABEL_60;
        }

        ++v12;
      }
      while (v11 != v12);
      uint64_t v11 = [obj countByEnumeratingWithState:&v75 objects:v85 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  id v60 = v67;
LABEL_60:

  v64 = v67;
LABEL_61:

  return v60;
}

@end