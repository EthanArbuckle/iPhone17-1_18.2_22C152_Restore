@interface _AXCodeItemDecoder
- (id)decodedCodeItemsFromURL:(id)a3 decodingErrors:(id)a4;
@end

@implementation _AXCodeItemDecoder

- (id)decodedCodeItemsFromURL:(id)a3 decodingErrors:(id)a4
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v72 = 0;
  v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:a3 options:0 error:&v72];
  id v7 = v72;
  if (v7)
  {
    v8 = v7;
    v9 = (void *)MEMORY[0x1E4F28C58];
    v10 = objc_msgSend(v7, "ax_nonRedundantDescription");
    v48 = v10;
    v11 = @"Could not load ax bundle map: %@";
    v12 = v9;
LABEL_3:
    v13 = objc_msgSend(v12, "ax_errorWithDomain:description:", @"AXLoader", v11, v48);
    [v5 addObject:v13];
LABEL_6:
    v17 = 0;
    goto LABEL_7;
  }
  id v71 = 0;
  v10 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v6 options:0 error:&v71];
  id v14 = v71;
  v8 = v14;
  if (v14)
  {
    v15 = (void *)MEMORY[0x1E4F28C58];
    v13 = objc_msgSend(v14, "ax_nonRedundantDescription");
    v16 = objc_msgSend(v15, "ax_errorWithDomain:description:", @"AXLoader", @"Could not decode ax bundle map JSON: %@", v13);
    [v5 addObject:v16];

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1E4F28C58];
    v11 = @"Could not load ax bundle map: Expected rootObject to be NSDictionary";
    goto LABEL_3;
  }
  v13 = [v10 objectForKey:@"items"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17 = [MEMORY[0x1E4F1CA80] set];
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id obj = v13;
    uint64_t v62 = [obj countByEnumeratingWithState:&v67 objects:v74 count:16];
    if (v62)
    {
      v52 = v6;
      v53 = v17;
      v50 = v13;
      v51 = v10;
      uint64_t v19 = *(void *)v68;
      v20 = obj;
      v59 = v5;
      uint64_t v57 = *(void *)v68;
      while (1)
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v68 != v19) {
            objc_enumerationMutation(v20);
          }
          v22 = *(void **)(*((void *)&v67 + 1) + 8 * v21);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v23 = objc_msgSend(MEMORY[0x1E4F28C58], "ax_errorWithDomain:description:", @"AXLoader", @"Could not load bundle map item. expected NSDictionary");
            [v5 addObject:v23];
            goto LABEL_61;
          }
          v23 = [v22 objectForKey:@"name"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v23 length])
          {
            v24 = [v22 objectForKey:@"target"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v58 = v24;
              v25 = [v24 objectForKey:@"name"];
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0 || ![v25 length])
              {
                v26 = objc_msgSend(MEMORY[0x1E4F28C58], "ax_errorWithDomain:description:", @"AXLoader", @"Could not load bundle map item. target name is missing");
                [v5 addObject:v26];
                v44 = v58;
                goto LABEL_58;
              }
              v26 = [v24 objectForKey:@"type"];
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && [v26 length])
              {
                int64_t v27 = +[AXCodeItem codeItemTypeFromString:v26];
                if (v27)
                {
                  uint64_t v55 = v27;
                  v28 = [v22 objectForKey:@"platforms"];
                  objc_opt_class();
                  v56 = v28;
                  if (objc_opt_isKindOfClass())
                  {
                    v29 = [MEMORY[0x1E4F1CA60] dictionary];
                    long long v63 = 0u;
                    long long v64 = 0u;
                    long long v65 = 0u;
                    long long v66 = 0u;
                    id v60 = v28;
                    uint64_t v30 = [v60 countByEnumeratingWithState:&v63 objects:v73 count:16];
                    if (v30)
                    {
                      uint64_t v31 = v30;
                      uint64_t v32 = *(void *)v64;
                      do
                      {
                        for (uint64_t i = 0; i != v31; ++i)
                        {
                          v34 = v26;
                          if (*(void *)v64 != v32) {
                            objc_enumerationMutation(v60);
                          }
                          v35 = *(void **)(*((void *)&v63 + 1) + 8 * i);
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            if ([v35 isEqualToString:_AXBundleMapPlatformKey_iOS]) {
                              [v29 setObject:v25 forKeyedSubscript:_AXBundleMapPlatformKey_iOS];
                            }
                            if ([v35 isEqualToString:_AXBundleMapPlatformKey_tvOS]) {
                              [v29 setObject:v25 forKeyedSubscript:_AXBundleMapPlatformKey_tvOS];
                            }
                            if ([v35 isEqualToString:_AXBundleMapPlatformKey_watchOS]) {
                              [v29 setObject:v25 forKeyedSubscript:_AXBundleMapPlatformKey_watchOS];
                            }
                            if ([v35 isEqualToString:_AXBundleMapPlatformKey_iosmac]) {
                              [v29 setObject:v25 forKeyedSubscript:_AXBundleMapPlatformKey_iosmac];
                            }
                            if ([v35 isEqualToString:_AXBundleMapPlatformKey_macOS]) {
                              [v29 setObject:v25 forKeyedSubscript:_AXBundleMapPlatformKey_macOS];
                            }
                          }
                          else
                          {
                            v36 = objc_msgSend(MEMORY[0x1E4F28C58], "ax_errorWithDomain:description:", @"AXLoader", @"Could not load bundle map item named '%@'. supportedPlatforms item '%@' expected to be a string", v25, v35);
                            [v59 addObject:v36];
                          }
                          v26 = v34;
                        }
                        uint64_t v31 = [v60 countByEnumeratingWithState:&v63 objects:v73 count:16];
                      }
                      while (v31);
                    }

                    v37 = AXAccessibilityBundlesDirectory();
                    v38 = [NSString stringWithFormat:@"%@.axbundle/%@", v23, v23];
                    v39 = [v37 stringByAppendingPathComponent:v38];

                    v40 = [v22 objectForKey:@"loadOrder"];
                    if (v40 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      v42 = objc_msgSend(MEMORY[0x1E4F28C58], "ax_errorWithDomain:description:", @"AXLoader", @"If loadOrder is specified, it must be a number");
                      id v5 = v59;
                      [v59 addObject:v42];
                    }
                    else
                    {
                      id v61 = v26;
                      OrderForInfo = _loadOrderForInfo(v40, v55);
                      v42 = [v22 objectForKey:@"excludedProcesses"];
                      id v5 = v59;
                      if (v42 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                      {
                        objc_msgSend(MEMORY[0x1E4F28C58], "ax_errorWithDomain:description:", @"AXLoader", @"excludedProcesses was not an array");
                        id v43 = (id)objc_claimAutoreleasedReturnValue();
                        [v59 addObject:v43];
                      }
                      else
                      {
                        id v43 = [[AXCodeItem alloc] initAccessibilityCodeItemWithPath:v39 targetType:v55 platformToTarget:v29 loadOrder:OrderForInfo];
                        [v43 setExcludedProcesses:v42];
                        [v53 addObject:v43];
                      }

                      v26 = v61;
                    }

                    v20 = obj;
                  }
                  else
                  {
                    v29 = objc_msgSend(MEMORY[0x1E4F28C58], "ax_errorWithDomain:description:", @"AXLoader", @"Could not load bundle map item named '%@'. supportedPlatforms expected to be an array", v25);
                    [v5 addObject:v29];
                  }

                  v44 = v58;
                  v45 = v56;
LABEL_57:

LABEL_58:
LABEL_59:

                  uint64_t v19 = v57;
                  goto LABEL_60;
                }
                objc_msgSend(MEMORY[0x1E4F28C58], "ax_errorWithDomain:description:", @"AXLoader", @"Could not load bundle map item named '%@'. target type is unknown '%@'", v25, v26);
              }
              else
              {
                objc_msgSend(MEMORY[0x1E4F28C58], "ax_errorWithDomain:description:", @"AXLoader", @"Could not load bundle map item named '%@'. target type is missing", v25, v49);
              v45 = };
              [v5 addObject:v45];
              v44 = v58;
              goto LABEL_57;
            }
            v25 = objc_msgSend(MEMORY[0x1E4F28C58], "ax_errorWithDomain:description:", @"AXLoader", @"Could not load bundle map item. target expected to be NSDictionary");
            [v5 addObject:v25];
            v44 = v24;
            goto LABEL_59;
          }
          v44 = objc_msgSend(MEMORY[0x1E4F28C58], "ax_errorWithDomain:description:", @"AXLoader", @"Could not load bundle map item. name is missing");
          [v5 addObject:v44];
LABEL_60:

LABEL_61:
          ++v21;
        }
        while (v21 != v62);
        uint64_t v46 = [v20 countByEnumeratingWithState:&v67 objects:v74 count:16];
        uint64_t v62 = v46;
        if (!v46)
        {
          v8 = 0;
          v6 = v52;
          v13 = v50;
          v10 = v51;
          v47 = v20;
          v17 = v53;
          goto LABEL_75;
        }
      }
    }
    v47 = obj;
  }
  else
  {
    v47 = objc_msgSend(MEMORY[0x1E4F28C58], "ax_errorWithDomain:description:", @"AXLoader", @"Could not load ax bundle map: Expected rootObject.items to be NSArray");
    [v5 addObject:v47];
    v17 = 0;
  }
LABEL_75:

LABEL_7:
  return v17;
}

@end