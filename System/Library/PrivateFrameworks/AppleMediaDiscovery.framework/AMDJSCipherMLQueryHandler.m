@interface AMDJSCipherMLQueryHandler
+ (id)triggerPECCall:(id)a3 withError:(id *)a4;
+ (id)triggerPIRKVFetch:(id)a3 withError:(id *)a4;
@end

@implementation AMDJSCipherMLQueryHandler

+ (id)triggerPIRKVFetch:(id)a3 withError:(id *)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v40 = a4;
  if (location[0])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v36 = location[0];
      id v35 = (id)[v36 objectForKey:@"keywords"];
      if (v35)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v32 = (id)[v36 objectForKey:@"usecase"];
          if (v32)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v29 = v32;
              id v28 = v35;
              id v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v28, "count"));
              memset(__b, 0, sizeof(__b));
              id obj = v28;
              uint64_t v15 = [obj countByEnumeratingWithState:__b objects:v47 count:16];
              if (v15)
              {
                uint64_t v11 = *(void *)__b[2];
                uint64_t v12 = 0;
                unint64_t v13 = v15;
                while (1)
                {
                  uint64_t v10 = v12;
                  if (*(void *)__b[2] != v11) {
                    objc_enumerationMutation(obj);
                  }
                  id v26 = *(id *)(__b[1] + 8 * v12);
                  id v24 = (id)[v26 dataUsingEncoding:4];
                  [v27 addObject:v24];
                  objc_storeStrong(&v24, 0);
                  ++v12;
                  if (v10 + 1 >= v13)
                  {
                    uint64_t v12 = 0;
                    unint64_t v13 = [obj countByEnumeratingWithState:__b objects:v47 count:16];
                    if (!v13) {
                      break;
                    }
                  }
                }
              }

              id v23 = (id)[objc_alloc(MEMORY[0x263F32008]) initWithUseCase:v29];
              id v22 = (id)[objc_alloc(MEMORY[0x263F32018]) initWithClientConfig:v23];
              id *v40 = 0;
              id v21 = (id)[v22 asyncResponseDataByKeywords:v27 error:v40];
              if (*v40)
              {
                os_log_t oslog = (os_log_t)&_os_log_internal;
                os_log_type_t type = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
                {
                  log = oslog;
                  os_log_type_t v8 = type;
                  id v6 = v29;
                  id v9 = (id)[*v40 localizedDescription];
                  id v18 = v9;
                  __os_log_helper_16_2_2_8_64_8_64((uint64_t)v46, (uint64_t)v6, (uint64_t)v18);
                  _os_log_error_impl(&dword_20ABD4000, log, v8, "PIR use case %@ error: %@", v46, 0x16u);

                  objc_storeStrong(&v18, 0);
                }
                objc_storeStrong((id *)&oslog, 0);
                id v42 = 0;
                int v38 = 1;
              }
              else
              {
                os_log_t v17 = (os_log_t)&_os_log_internal;
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
                {
                  __os_log_helper_16_2_2_8_64_8_64((uint64_t)v45, (uint64_t)v29, (uint64_t)v21);
                  _os_log_debug_impl(&dword_20ABD4000, v17, OS_LOG_TYPE_DEBUG, "PIR call handle, usecase %@: %@", v45, 0x16u);
                }
                objc_storeStrong((id *)&v17, 0);
                v43 = @"callHandle";
                id v44 = v21;
                id v42 = (id)[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
                int v38 = 1;
              }
              objc_storeStrong(&v21, 0);
              objc_storeStrong(&v22, 0);
              objc_storeStrong(&v23, 0);
              objc_storeStrong(&v27, 0);
              objc_storeStrong(&v28, 0);
              objc_storeStrong(&v29, 0);
            }
            else
            {
              v30 = @"usecase is not a string";
              id *v40 = +[AMDMiscHelpers logAndCreateError:18 errorMessage:v30];
              id v42 = 0;
              int v38 = 1;
              objc_storeStrong((id *)&v30, 0);
            }
          }
          else
          {
            v31 = @"usecase absent in PIR query payload";
            id *v40 = +[AMDMiscHelpers logAndCreateError:18 errorMessage:v31];
            id v42 = 0;
            int v38 = 1;
            objc_storeStrong((id *)&v31, 0);
          }
          objc_storeStrong(&v32, 0);
        }
        else
        {
          v33 = @"Keywords are not an array";
          id *v40 = +[AMDMiscHelpers logAndCreateError:18 errorMessage:v33];
          id v42 = 0;
          int v38 = 1;
          objc_storeStrong((id *)&v33, 0);
        }
      }
      else
      {
        v34 = @"Keywords absent in PIR query payload";
        id *v40 = +[AMDMiscHelpers logAndCreateError:18 errorMessage:v34];
        id v42 = 0;
        int v38 = 1;
        objc_storeStrong((id *)&v34, 0);
      }
      objc_storeStrong(&v35, 0);
      objc_storeStrong(&v36, 0);
    }
    else
    {
      v37 = @"PIRQueryPayload is not a dictionary";
      id *v40 = +[AMDMiscHelpers logAndCreateError:18 errorMessage:v37];
      id v42 = 0;
      int v38 = 1;
      objc_storeStrong((id *)&v37, 0);
    }
  }
  else
  {
    v39 = @"PIRQueryPayload is nil";
    id *v40 = +[AMDMiscHelpers logAndCreateError:18 errorMessage:v39];
    id v42 = 0;
    int v38 = 1;
    objc_storeStrong((id *)&v39, 0);
  }
  objc_storeStrong(location, 0);
  v4 = v42;

  return v4;
}

+ (id)triggerPECCall:(id)a3 withError:(id *)a4
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v72 = a4;
  if (location[0])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v68 = location[0];
      id v67 = (id)[v68 objectForKey:@"usecase"];
      if (v67)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v64 = v67;
          id v63 = (id)[v68 objectForKey:@"shardIndices"];
          if (v63)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v60 = v63;
              id v59 = (id)[v68 objectForKey:@"queryData"];
              if (v59)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  memset(__b, 0, sizeof(__b));
                  id obj = v59;
                  uint64_t v35 = [obj countByEnumeratingWithState:__b objects:v82 count:16];
                  if (v35)
                  {
                    uint64_t v31 = *(void *)__b[2];
                    uint64_t v32 = 0;
                    unint64_t v33 = v35;
                    while (1)
                    {
                      uint64_t v30 = v32;
                      if (*(void *)__b[2] != v31) {
                        objc_enumerationMutation(obj);
                      }
                      id v56 = *(id *)(__b[1] + 8 * v32);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0) {
                        break;
                      }
                      memset(v53, 0, 0x40uLL);
                      id v28 = v56;
                      uint64_t v29 = [v28 countByEnumeratingWithState:v53 objects:v81 count:16];
                      if (v29)
                      {
                        uint64_t v25 = *(void *)v53[2];
                        uint64_t v26 = 0;
                        unint64_t v27 = v29;
                        while (1)
                        {
                          uint64_t v24 = v26;
                          if (*(void *)v53[2] != v25) {
                            objc_enumerationMutation(v28);
                          }
                          v53[8] = *(void *)(v53[1] + 8 * v26);
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0) {
                            break;
                          }
                          ++v26;
                          if (v24 + 1 >= v27)
                          {
                            uint64_t v26 = 0;
                            unint64_t v27 = [v28 countByEnumeratingWithState:v53 objects:v81 count:16];
                            if (!v27) {
                              goto LABEL_31;
                            }
                          }
                        }
                        v52 = @"an embedding element is not a number";
                        id *v72 = +[AMDMiscHelpers logAndCreateError:18 errorMessage:v52];
                        id v74 = 0;
                        int v70 = 1;
                        objc_storeStrong((id *)&v52, 0);
                      }
                      else
                      {
LABEL_31:
                        int v70 = 0;
                      }

                      if (v70) {
                        goto LABEL_36;
                      }
                      ++v32;
                      if (v30 + 1 >= v33)
                      {
                        uint64_t v32 = 0;
                        unint64_t v33 = [obj countByEnumeratingWithState:__b objects:v82 count:16];
                        if (!v33) {
                          goto LABEL_35;
                        }
                      }
                    }
                    v54 = @"an embedding is not an array";
                    id *v72 = +[AMDMiscHelpers logAndCreateError:18 errorMessage:v54];
                    id v74 = 0;
                    int v70 = 1;
                    objc_storeStrong((id *)&v54, 0);
                  }
                  else
                  {
LABEL_35:
                    int v70 = 0;
                  }
LABEL_36:

                  if (!v70)
                  {
                    id v51 = v59;
                    id v50 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v51, "count"));
                    memset(v48, 0, sizeof(v48));
                    id v22 = v51;
                    uint64_t v23 = [v22 countByEnumeratingWithState:v48 objects:v80 count:16];
                    if (v23)
                    {
                      uint64_t v19 = *(void *)v48[2];
                      uint64_t v20 = 0;
                      unint64_t v21 = v23;
                      while (1)
                      {
                        uint64_t v18 = v20;
                        if (*(void *)v48[2] != v19) {
                          objc_enumerationMutation(v22);
                        }
                        id v49 = *(id *)(v48[1] + 8 * v20);
                        id v47 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF990]), "initWithLength:", 4 * objc_msgSend(v49, "count"));
                        uint64_t v46 = 0;
                        uint64_t v46 = [v47 mutableBytes];
                        memset(v44, 0, sizeof(v44));
                        id v16 = v49;
                        uint64_t v17 = [v16 countByEnumeratingWithState:v44 objects:v79 count:16];
                        if (v17)
                        {
                          uint64_t v13 = *(void *)v44[2];
                          uint64_t v14 = 0;
                          unint64_t v15 = v17;
                          while (1)
                          {
                            uint64_t v12 = v14;
                            if (*(void *)v44[2] != v13) {
                              objc_enumerationMutation(v16);
                            }
                            id v45 = *(id *)(v44[1] + 8 * v14);
                            [v45 floatValue];
                            v4 = (_DWORD *)v46;
                            v46 += 4;
                            _DWORD *v4 = v5;
                            ++v14;
                            if (v12 + 1 >= v15)
                            {
                              uint64_t v14 = 0;
                              unint64_t v15 = [v16 countByEnumeratingWithState:v44 objects:v79 count:16];
                              if (!v15) {
                                break;
                              }
                            }
                          }
                        }

                        [v50 addObject:v47];
                        objc_storeStrong(&v47, 0);
                        ++v20;
                        if (v18 + 1 >= v21)
                        {
                          uint64_t v20 = 0;
                          unint64_t v21 = [v22 countByEnumeratingWithState:v48 objects:v80 count:16];
                          if (!v21) {
                            break;
                          }
                        }
                      }
                    }

                    id v43 = (id)[objc_alloc(MEMORY[0x263F32008]) initWithUseCase:v64];
                    id v42 = (id)[objc_alloc(MEMORY[0x263F32020]) initWithClientConfig:v43];
                    id v41 = (id)[v42 asyncResponseSimilarityScoresForElements:v50 shardIndices:v60 error:v72];
                    if (*v72)
                    {
                      os_log_t oslog = (os_log_t)&_os_log_internal;
                      os_log_type_t type = OS_LOG_TYPE_ERROR;
                      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
                      {
                        log = oslog;
                        os_log_type_t v10 = type;
                        id v8 = v64;
                        id v11 = (id)[*v72 localizedDescription];
                        id v38 = v11;
                        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v78, (uint64_t)v8, (uint64_t)v38);
                        _os_log_error_impl(&dword_20ABD4000, log, v10, "PEC use case %@ error: %@", v78, 0x16u);

                        objc_storeStrong(&v38, 0);
                      }
                      objc_storeStrong((id *)&oslog, 0);
                      id v74 = 0;
                      int v70 = 1;
                    }
                    else
                    {
                      os_log_t v37 = (os_log_t)&_os_log_internal;
                      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                      {
                        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v77, (uint64_t)v64, (uint64_t)v41);
                        _os_log_debug_impl(&dword_20ABD4000, v37, OS_LOG_TYPE_DEBUG, "PEC call handle, usecase %@: %@", v77, 0x16u);
                      }
                      objc_storeStrong((id *)&v37, 0);
                      v75 = @"callHandle";
                      id v76 = v41;
                      id v74 = (id)[NSDictionary dictionaryWithObjects:&v76 forKeys:&v75 count:1];
                      int v70 = 1;
                    }
                    objc_storeStrong(&v41, 0);
                    objc_storeStrong(&v42, 0);
                    objc_storeStrong(&v43, 0);
                    objc_storeStrong(&v50, 0);
                    objc_storeStrong(&v51, 0);
                  }
                }
                else
                {
                  v57 = @"data is not an array";
                  id *v72 = +[AMDMiscHelpers logAndCreateError:18 errorMessage:v57];
                  id v74 = 0;
                  int v70 = 1;
                  objc_storeStrong((id *)&v57, 0);
                }
              }
              else
              {
                v58 = @"data absent in PEC query payload";
                id *v72 = +[AMDMiscHelpers logAndCreateError:18 errorMessage:v58];
                id v74 = 0;
                int v70 = 1;
                objc_storeStrong((id *)&v58, 0);
              }
              objc_storeStrong(&v59, 0);
              objc_storeStrong(&v60, 0);
            }
            else
            {
              v61 = @"shardIndices are not an array";
              id *v72 = +[AMDMiscHelpers logAndCreateError:18 errorMessage:v61];
              id v74 = 0;
              int v70 = 1;
              objc_storeStrong((id *)&v61, 0);
            }
          }
          else
          {
            v62 = @"shardIndices absent in PEC query payload";
            id *v72 = +[AMDMiscHelpers logAndCreateError:18 errorMessage:v62];
            id v74 = 0;
            int v70 = 1;
            objc_storeStrong((id *)&v62, 0);
          }
          objc_storeStrong(&v63, 0);
          objc_storeStrong(&v64, 0);
        }
        else
        {
          v65 = @"usecase is not a string";
          id *v72 = +[AMDMiscHelpers logAndCreateError:18 errorMessage:v65];
          id v74 = 0;
          int v70 = 1;
          objc_storeStrong((id *)&v65, 0);
        }
      }
      else
      {
        v66 = @"usecase absent in PEC query payload";
        id *v72 = +[AMDMiscHelpers logAndCreateError:18 errorMessage:v66];
        id v74 = 0;
        int v70 = 1;
        objc_storeStrong((id *)&v66, 0);
      }
      objc_storeStrong(&v67, 0);
      objc_storeStrong(&v68, 0);
    }
    else
    {
      v69 = @"PECQueryPayload is not a dictionary";
      id *v72 = +[AMDMiscHelpers logAndCreateError:18 errorMessage:v69];
      id v74 = 0;
      int v70 = 1;
      objc_storeStrong((id *)&v69, 0);
    }
  }
  else
  {
    v71 = @"PECQueryPayload is nil";
    id *v72 = +[AMDMiscHelpers logAndCreateError:18 errorMessage:v71];
    id v74 = 0;
    int v70 = 1;
    objc_storeStrong((id *)&v71, 0);
  }
  objc_storeStrong(location, 0);
  id v6 = v74;

  return v6;
}

@end