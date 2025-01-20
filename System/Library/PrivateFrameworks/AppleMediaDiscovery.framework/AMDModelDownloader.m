@interface AMDModelDownloader
+ (id)ensureNewVersionDirURLForModel:(id)a3 withVersion:(unint64_t)a4 andCreationTime:(int64_t)a5;
+ (id)parseModel:(id)a3 atLocation:(id)a4 withVersion:(id)a5 withStorefrontId:(id)a6 error:(id *)a7;
+ (id)parseModelWithId:(id)a3 withStorefrontId:(id)a4 fromArchive:(id)a5 withBaseRecoModel:(id)a6;
+ (id)performModelCleanup;
+ (id)processColdstartBinaryDownload:(id)a3 error:(id *)a4;
+ (id)processModelDownload:(id)a3 withStorefrontID:(id)a4 error:(id *)a5;
+ (id)removeOldColdstartBinaries:(id)a3;
+ (id)removeOldModels:(id)a3;
+ (id)saveMapFile:(id)a3 ofSize:(int)a4 isCompressed:(BOOL)a5 inDirURL:(id)a6 fromBuffer:(id)a7;
+ (id)unzipAndValidateCompiledModelBundle:(id)a3 atLocation:(id)a4 withVersion:(id)a5 error:(id *)a6;
+ (id)unzipDownloadedModelBundle:(id)a3 atLocation:(id)a4 withVersion:(id)a5 error:(id *)a6;
+ (id)unzipModel:(id)a3 atLocation:(id)a4 withVersion:(id)a5 error:(id *)a6;
+ (id)updateAppTabInfoForWorkflows:(id)a3;
+ (void)cleanupDiskForModelDirectory:(id)a3 withSavedVersionURL:(id)a4;
+ (void)deleteColdstartBinaryFromStorage:(id)a3 forModel:(id)a4 isVersionChange:(BOOL)a5 error:(id *)a6;
+ (void)deleteModelFromStorage:(id)a3 isVersionChange:(BOOL)a4 error:(id *)a5;
+ (void)saveMinimalContentToLogicalMapForModelId:(id)a3 fromMapData:(id)a4;
+ (void)unzipModelFile:(id)a3 copyToDestination:(id)a4 error:(id *)a5;
+ (void)validateDownloadAtLocation:(id)a3 withModelId:(id)a4 andVersion:(id)a5 error:(id *)a6;
- (id)downloadModel:(id)a3 forVersion:(id)a4 usingUrl:(id)a5 withStorefrontId:(id)a6 andSkipDecision:(BOOL *)a7 error:(id *)a8;
- (int)getVersionForModel:(id)a3;
- (void)printJson:(id)a3;
@end

@implementation AMDModelDownloader

- (int)getVersionForModel:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  id obj = 0;
  id v4 = +[AMDModel getModelInfo:location[0] error:&obj];
  objc_storeStrong(&v9, obj);
  id v8 = v4;
  if (!v9 && v8)
  {
    id v5 = (id)[v8 objectForKey:0x26BEACCB8];
    int v11 = [v5 intValue];
    int v6 = 1;
    objc_storeStrong(&v5, 0);
  }
  else
  {
    int v11 = -1;
    int v6 = 1;
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v11;
}

- (id)downloadModel:(id)a3 forVersion:(id)a4 usingUrl:(id)a5 withStorefrontId:(id)a6 andSkipDecision:(BOOL *)a7 error:(id *)a8
{
  v56 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v54 = 0;
  objc_storeStrong(&v54, a4);
  id v53 = 0;
  objc_storeStrong(&v53, a5);
  id v52 = 0;
  objc_storeStrong(&v52, a6);
  v51 = a7;
  v50 = a8;
  *a7 = 0;
  int v20 = [(AMDModelDownloader *)v56 getVersionForModel:location[0]];
  if (v20 == [v54 intValue])
  {
    BOOL *v51 = 1;
    id v57 = 0;
    int v49 = 1;
  }
  else
  {
    uint64_t v42 = 0;
    v43 = &v42;
    int v44 = 838860800;
    int v45 = 48;
    v46 = __Block_byref_object_copy__6;
    v47 = __Block_byref_object_dispose__6;
    uint64_t v48 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:3];
    uint64_t v35 = 0;
    v36 = &v35;
    int v37 = 838860800;
    int v38 = 48;
    v39 = __Block_byref_object_copy__6;
    v40 = __Block_byref_object_dispose__6;
    id v41 = 0;
    id v34 = dispatch_group_create();
    id v33 = (id)[MEMORY[0x263F08C00] defaultSessionConfiguration];
    id v32 = (id)objc_msgSend(MEMORY[0x263F08BF8], "sessionWithConfiguration:delegate:delegateQueue:", v33, 0);
    id v14 = v32;
    id v13 = v53;
    uint64_t v22 = MEMORY[0x263EF8330];
    int v23 = -1073741824;
    int v24 = 0;
    v25 = __95__AMDModelDownloader_downloadModel_forVersion_usingUrl_withStorefrontId_andSkipDecision_error___block_invoke;
    v26 = &unk_263FE2280;
    v30[1] = &v35;
    id v27 = location[0];
    id v28 = v54;
    id v29 = v52;
    v30[2] = &v42;
    v30[0] = v34;
    id v31 = (id)[v14 downloadTaskWithURL:v13 completionHandler:&v22];
    id v21 = (id)[NSString stringWithFormat:@"model_download_%@", location[0]];
    +[AMDPerf sampleForKey:v21];
    dispatch_group_enter((dispatch_group_t)v34);
    [v31 resume];
    group = v34;
    dispatch_time_t v8 = dispatch_time(0, 120000000000);
    dispatch_group_wait(group, v8);
    +[AMDPerf sampleForKey:v21];
    if (v36[5])
    {
      id v9 = (id) v36[5];
      id *v50 = v9;
      id v57 = 0;
    }
    else
    {
      id v57 = (id)v43[5];
    }
    int v49 = 1;
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v31, 0);
    objc_storeStrong(v30, 0);
    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v28, 0);
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v32, 0);
    objc_storeStrong(&v33, 0);
    objc_storeStrong(&v34, 0);
    _Block_object_dispose(&v35, 8);
    objc_storeStrong(&v41, 0);
    _Block_object_dispose(&v42, 8);
    objc_storeStrong((id *)&v48, 0);
  }
  objc_storeStrong(&v52, 0);
  objc_storeStrong(&v53, 0);
  objc_storeStrong(&v54, 0);
  objc_storeStrong(location, 0);
  v10 = v57;

  return v10;
}

void __95__AMDModelDownloader_downloadModel_forVersion_usingUrl_withStorefrontId_andSkipDecision_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v30 = 0;
  objc_storeStrong(&v30, a3);
  id v29 = 0;
  objc_storeStrong(&v29, a4);
  uint64_t v28 = a1;
  char v27 = 0;
  if (v29)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v29);
    int v26 = 1;
  }
  else if (location[0])
  {
    id v25 = (id)[NSString stringWithFormat:@"download_callback_%@", *(void *)(a1 + 32)];
    +[AMDPerf sampleForKey:v25];
    id v24 = -[AMDBaseRecoModel initWithId:andVersion:]([AMDBaseRecoModel alloc], "initWithId:andVersion:", *(void *)(a1 + 32), [*(id *)(a1 + 40) longLongValue]);
    id v23 = +[AMDModelDownloader parseModelWithId:*(void *)(a1 + 32) withStorefrontId:*(void *)(a1 + 48) fromArchive:location[0] withBaseRecoModel:v24];
    +[AMDPerf sampleForKey:v25];
    memset(__b, 0, sizeof(__b));
    id v13 = v23;
    uint64_t v14 = [v13 countByEnumeratingWithState:__b objects:v33 count:16];
    if (v14)
    {
      uint64_t v10 = *(void *)__b[2];
      uint64_t v11 = 0;
      unint64_t v12 = v14;
      while (1)
      {
        uint64_t v9 = v11;
        if (*(void *)__b[2] != v10) {
          objc_enumerationMutation(v13);
        }
        uint64_t v22 = *(void *)(__b[1] + 8 * v11);
        dispatch_time_t v8 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        id v7 = (id)[v23 objectForKey:v22];
        objc_msgSend(v8, "setObject:forKey:");

        ++v11;
        if (v9 + 1 >= v12)
        {
          uint64_t v11 = 0;
          unint64_t v12 = [v13 countByEnumeratingWithState:__b objects:v33 count:16];
          if (!v12) {
            break;
          }
        }
      }
    }

    os_log_t oslog = (os_log_t)&_os_log_internal;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v32, *(void *)(a1 + 32));
      _os_log_impl(&dword_20ABD4000, oslog, OS_LOG_TYPE_DEFAULT, "successfully downloaded and parsed model %@", v32, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setObject:*(void *)(a1 + 32) forKey:@"modelId"];
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v25, 0);
    int v26 = 0;
  }
  else
  {
    id v15 = (id)[NSString stringWithFormat:@"failed to download data for model %@", *(void *)(a1 + 32)];
    id v16 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16);
    uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v16;

    int v26 = 1;
  }
  int v6 = v26;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  if (v27) {
    objc_exception_rethrow();
  }
  int v26 = v6;
  if (!v6) {
    int v26 = 0;
  }
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
}

- (void)printJson:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = (id)[MEMORY[0x263F08C00] defaultSessionConfiguration];
  id v4 = (id)[MEMORY[0x263F08BF8] sessionWithConfiguration:v5];
  id v3 = (id)[v4 dataTaskWithURL:location[0] completionHandler:&__block_literal_global_5];
  [v3 resume];
  while (![v3 state])
    NSLog(&cfstr_Ld.isa, [v3 state]);
  objc_storeStrong(&v3, 0);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

void __32__AMDModelDownloader_printJson___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v7 = 0;
  objc_storeStrong(&v7, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  NSLog(&stru_26BEADD78.isa, location[0]);
  NSLog(&cfstr_TaskDone.isa);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

+ (id)parseModelWithId:(id)a3 withStorefrontId:(id)a4 fromArchive:(id)a5 withBaseRecoModel:(id)a6
{
  uint64_t v190 = *MEMORY[0x263EF8340];
  id v172 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v170 = 0;
  objc_storeStrong(&v170, a4);
  id v169 = 0;
  objc_storeStrong(&v169, a5);
  id v168 = 0;
  objc_storeStrong(&v168, a6);
  char v167 = 0;
  id v166 = 0;
  id v165 = 0;
  id v164 = (id)[MEMORY[0x263F08850] defaultManager];
  id v163 = 0;
  char v162 = 0;
  +[AMDPerf sampleForKey:@"parseModelStart"];
  id v79 = (id)[v169 path];
  id v160 = 0;
  id v78 = (id)objc_msgSend(v164, "attributesOfItemAtPath:error:");
  objc_storeStrong(&v165, 0);
  id v161 = v78;

  unint64_t v159 = 0;
  id v76 = (id)[v78 objectForKey:*MEMORY[0x263F080B8]];
  uint64_t v77 = [v76 unsignedLongLongValue];

  unint64_t v159 = v77;
  os_log_t oslog = (os_log_t)&_os_log_internal;
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_64_8_0((uint64_t)v189, (uint64_t)v169, COERCE__INT64((float)((float)v159 / 1048600.0)));
    _os_log_debug_impl(&dword_20ABD4000, oslog, type, "Reading model archive from %@, %.3fMB", v189, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v75 = objc_alloc(MEMORY[0x263EFF950]);
  id v73 = (id)[v169 path];
  v74 = objc_msgSend(v75, "initWithFileAtPath:");
  id v6 = v163;
  id v163 = v74;

  [v163 open];
  v72 = [AMDByteBuffer alloc];
  id v156 = [(AMDByteBuffer *)v72 initWithInputStream:v163 withFileSize:v159];
  char v155 = 0;
  id v154 = v165;
  char v71 = [v156 getByteWithError:&v154];
  objc_storeStrong(&v165, v154);
  char v155 = v71;
  if (!v165 && v155 == 1)
  {
    id v150 = v165;
    char v68 = [v168 parseModelInfoFromBuffer:v156 error:&v150];
    objc_storeStrong(&v165, v150);
    if (v68)
    {
      +[AMDPerf sampleForKey:@"ParseModelPostModelParse"];
      __int16 v149 = 0;
      id v148 = v165;
      __int16 v67 = [v156 getShortWithError:&v148];
      objc_storeStrong(&v165, v148);
      __int16 v149 = v67;
      if (v165)
      {
        id v173 = 0;
        int v151 = 1;
      }
      else
      {
        id v146 = 0;
        id v66 = (id)[v156 getDataOfLength:v149 error:&v146];
        objc_storeStrong(&v165, v146);
        id v147 = v66;
        if (v165)
        {
          id v173 = 0;
          int v151 = 1;
        }
        else
        {
          os_log_t v145 = (os_log_t)&_os_log_internal;
          os_log_type_t v144 = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled(v145, OS_LOG_TYPE_DEBUG))
          {
            id v65 = [NSString alloc];
            id v64 = (id)[v65 initWithData:v147 encoding:4];
            id v143 = v64;
            __os_log_helper_16_2_1_8_64((uint64_t)v187, (uint64_t)v143);
            _os_log_debug_impl(&dword_20ABD4000, v145, v144, "Checksum algorithm: %@", v187, 0xCu);

            objc_storeStrong(&v143, 0);
          }
          objc_storeStrong((id *)&v145, 0);
          id v141 = v165;
          id v63 = (id)[v156 getDataOfLength:32 error:&v141];
          objc_storeStrong(&v165, v141);
          id v142 = v63;
          if (!v165 && v142)
          {
            id v61 = location[0];
            uint64_t v62 = [v168 getVersion];
            id v140 = +[AMDModelDownloader ensureNewVersionDirURLForModel:withVersion:andCreationTime:](AMDModelDownloader, "ensureNewVersionDirURLForModel:withVersion:andCreationTime:", v61, v62, [v168 getAssetCreationTimestamp]);
            if (v140)
            {
              id v137 = (id)[v140 first];
              id v7 = (id)[v140 second];
              id v8 = v166;
              id v166 = v7;

              id v136 = 0;
              __int16 v135 = 0;
              id v134 = v165;
              __int16 v60 = [v156 getShortWithError:&v134];
              objc_storeStrong(&v165, v134);
              __int16 v135 = v60;
              if (v165)
              {
                char v167 = 1;
                id v173 = 0;
                int v151 = 1;
              }
              else
              {
                __int16 v133 = 0;
                while (1)
                {
                  char v59 = 0;
                  if (v135 != v133)
                  {
                    char v59 = 0;
                    if ([v156 hasRemaining]) {
                      char v59 = v167 ^ 1;
                    }
                  }
                  if ((v59 & 1) == 0) {
                    break;
                  }
                  __int16 v132 = 0;
                  id v131 = v165;
                  __int16 v58 = [v156 getShortWithError:&v131];
                  objc_storeStrong(&v165, v131);
                  __int16 v132 = v58;
                  if (v165)
                  {
                    char v167 = 1;
                    break;
                  }
                  BOOL v130 = 0;
                  id v129 = 0;
                  char v57 = [v156 getByteWithError:&v129];
                  objc_storeStrong(&v165, v129);
                  BOOL v130 = v57 == 1;
                  if (v165)
                  {
                    char v167 = 1;
                    break;
                  }
                  unsigned int v128 = 0;
                  id v127 = 0;
                  unsigned int v56 = [v156 getIntWithError:&v127];
                  objc_storeStrong(&v165, v127);
                  unsigned int v128 = v56;
                  if (v165)
                  {
                    char v167 = 1;
                    break;
                  }
                  if (v132 <= 1)
                  {
                    uint64_t v10 = (v132 - 1);
                    char v9 = 0;
                  }
                  else
                  {
                    uint64_t v10 = (v132 - 1);
                    char v9 = 1;
                  }
                  if (v9)
                  {
                    os_log_t v91 = (os_log_t)&_os_log_internal;
                    os_log_type_t v90 = OS_LOG_TYPE_ERROR;
                    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
                    {
                      v19 = v91;
                      __os_log_helper_16_0_1_4_0((uint64_t)v176, v132);
                      _os_log_error_impl(&dword_20ABD4000, v19, v90, "unknown asset type %d", v176, 8u);
                    }
                    objc_storeStrong((id *)&v91, 0);
                    char v167 = 1;
                  }
                  else
                  {
                    switch(v10)
                    {
                      case 0:
                        id v55 = (id)[v166 URLByAppendingPathComponent:location[0]];
                        id v126 = (id)[v55 URLByAppendingPathExtension:@"mlmodel"];

                        id v125 = v165;
                        [v156 copyDataOfLength:(int)v128 toFile:v126 isCompressed:v130 error:&v125];
                        objc_storeStrong(&v165, v125);
                        if (v165)
                        {
                          char v167 = 1;
                          int v151 = 6;
                        }
                        else
                        {
                          os_log_t v124 = (os_log_t)&_os_log_internal;
                          os_log_type_t v123 = OS_LOG_TYPE_DEBUG;
                          if (os_log_type_enabled(v124, OS_LOG_TYPE_DEBUG))
                          {
                            id v53 = v124;
                            os_log_type_t v54 = v123;
                            __os_log_helper_16_2_1_8_64((uint64_t)v185, (uint64_t)v126);
                            _os_log_debug_impl(&dword_20ABD4000, v53, v54, "Saved the model to %@", v185, 0xCu);
                          }
                          objc_storeStrong((id *)&v124, 0);
                          +[AMDPerf sampleForKey:@"ParseModelPostModelSave"];
                          id v121 = v165;
                          id v52 = (id)[MEMORY[0x263F00D80] compileModelAtURL:v126 error:&v121];
                          objc_storeStrong(&v165, v121);
                          id v122 = v52;
                          if (v52 && !v165)
                          {
                            os_log_t v118 = (os_log_t)&_os_log_internal;
                            os_log_type_t v117 = OS_LOG_TYPE_DEBUG;
                            if (os_log_type_enabled(v118, OS_LOG_TYPE_DEBUG))
                            {
                              uint64_t v48 = v118;
                              os_log_type_t v49 = v117;
                              __os_log_helper_16_2_2_8_64_8_64((uint64_t)v183, (uint64_t)location[0], (uint64_t)v122);
                              _os_log_debug_impl(&dword_20ABD4000, v48, v49, "Compiled model '%@', destinationL %@", v183, 0x16u);
                            }
                            objc_storeStrong((id *)&v118, 0);
                            +[AMDPerf sampleForKey:@"parseModelPostModelCompile"];
                            id v116 = v165;
                            [v164 removeItemAtURL:v126 error:&v116];
                            objc_storeStrong(&v165, v116);
                            id v47 = v166;
                            id v46 = (id)[v122 lastPathComponent];
                            id v115 = (id)objc_msgSend(v47, "URLByAppendingPathComponent:");

                            id v114 = v165;
                            char v45 = [v164 copyItemAtURL:v122 toURL:v115 error:&v114];
                            objc_storeStrong(&v165, v114);
                            if ((v45 & 1) != 0 && !v165)
                            {
                              id v11 = (id)[v115 lastPathComponent];
                              id v12 = v136;
                              id v136 = v11;

                              os_log_t v111 = (os_log_t)&_os_log_internal;
                              os_log_type_t v110 = OS_LOG_TYPE_DEBUG;
                              if (os_log_type_enabled(v111, OS_LOG_TYPE_DEBUG))
                              {
                                int v38 = v111;
                                os_log_type_t v39 = v110;
                                __os_log_helper_16_2_2_8_64_8_64((uint64_t)v181, (uint64_t)v122, (uint64_t)v115);
                                _os_log_debug_impl(&dword_20ABD4000, v38, v39, "Copied the compiled model from %@ to %@", v181, 0x16u);
                              }
                              objc_storeStrong((id *)&v111, 0);
                              id v109 = v165;
                              [v164 removeItemAtURL:v122 error:&v109];
                              objc_storeStrong(&v165, v109);
                              ++v133;
                              int v151 = 0;
                            }
                            else
                            {
                              os_log_t v113 = (os_log_t)&_os_log_internal;
                              os_log_type_t v112 = OS_LOG_TYPE_ERROR;
                              if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
                              {
                                id v41 = v113;
                                os_log_type_t v42 = v112;
                                id v43 = v122;
                                id v44 = v115;
                                id v40 = (id)[v165 localizedDescription];
                                __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v182, (uint64_t)v43, (uint64_t)v44, (uint64_t)v40);
                                _os_log_error_impl(&dword_20ABD4000, v41, v42, "Error copying compiled model from %@ to %@: %@", v182, 0x20u);
                              }
                              objc_storeStrong((id *)&v113, 0);
                              char v167 = 1;
                              int v151 = 6;
                            }
                            objc_storeStrong(&v115, 0);
                          }
                          else
                          {
                            os_log_t v120 = (os_log_t)&_os_log_internal;
                            os_log_type_t v119 = OS_LOG_TYPE_ERROR;
                            if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
                            {
                              v50 = v120;
                              os_log_type_t v51 = v119;
                              __os_log_helper_16_2_2_8_64_8_64((uint64_t)v184, (uint64_t)v126, (uint64_t)v165);
                              _os_log_error_impl(&dword_20ABD4000, v50, v51, "Could not compile the model %@, %@", v184, 0x16u);
                            }
                            objc_storeStrong((id *)&v120, 0);
                            char v167 = 1;
                            int v151 = 6;
                          }
                          objc_storeStrong(&v122, 0);
                        }
                        objc_storeStrong(&v126, 0);
                        break;
                      case 1:
                        id v27 = (id)[v166 URLByAppendingPathComponent:@"model_metadata"];
                        id v100 = (id)[v27 URLByAppendingPathExtension:@"json"];

                        id v99 = v165;
                        [v156 copyDataOfLength:(int)v128 toFile:v100 isCompressed:v130 error:&v99];
                        objc_storeStrong(&v165, v99);
                        if (v165)
                        {
                          os_log_t v98 = (os_log_t)&_os_log_internal;
                          os_log_type_t v97 = OS_LOG_TYPE_ERROR;
                          if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
                          {
                            id v25 = v98;
                            os_log_type_t v26 = v97;
                            id v24 = (id)[v100 path];
                            id v23 = (id)[v165 localizedDescription];
                            __os_log_helper_16_2_2_8_64_8_64((uint64_t)v178, (uint64_t)v24, (uint64_t)v23);
                            _os_log_error_impl(&dword_20ABD4000, v25, v26, "Error  loading metadata from %@: %@", v178, 0x16u);
                          }
                          objc_storeStrong((id *)&v98, 0);
                          char v167 = 1;
                          int v151 = 6;
                        }
                        else
                        {
                          id v96 = 0;
                          id v95 = 0;
                          [v168 loadModelMetadataFromDir:v166 error:&v95];
                          objc_storeStrong(&v96, v95);
                          if (v96)
                          {
                            char v167 = 1;
                            int v151 = 6;
                          }
                          else
                          {
                            ++v133;
                            os_log_t v94 = (os_log_t)&_os_log_internal;
                            os_log_type_t v93 = OS_LOG_TYPE_DEBUG;
                            if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
                            {
                              id v21 = v94;
                              os_log_type_t v22 = v93;
                              __os_log_helper_16_2_1_8_64((uint64_t)v177, (uint64_t)v100);
                              _os_log_debug_impl(&dword_20ABD4000, v21, v22, "saved the model metadata to %@", v177, 0xCu);
                            }
                            objc_storeStrong((id *)&v94, 0);
                            int v151 = 0;
                          }
                          objc_storeStrong(&v96, 0);
                        }
                        objc_storeStrong(&v100, 0);
                        break;
                      case 2:
                        id v37 = (id)[v166 URLByAppendingPathComponent:@"model_assets"];
                        id v108 = (id)[v37 URLByAppendingPathExtension:@"json"];

                        id v107 = v165;
                        [v156 copyDataOfLength:(int)v128 toFile:v108 isCompressed:v130 error:&v107];
                        objc_storeStrong(&v165, v107);
                        if (v165)
                        {
                          char v167 = 1;
                          int v151 = 6;
                        }
                        else
                        {
                          +[AMDPerf sampleForKey:@"parseModelPostModelAssetsSaved"];
                          v36 = [AMDModelAssets alloc];
                          id v34 = (id)[v166 path];
                          id v105 = v165;
                          id v35 = -[AMDModelAssets initFromDir:andMetadata:useBinaryInputMap:useBinaryOutputMap:withModelId:isInference:error:](v36, "initFromDir:andMetadata:useBinaryInputMap:useBinaryOutputMap:withModelId:isInference:error:", &v105);
                          objc_storeStrong(&v165, v105);
                          id v106 = v35;

                          if (v165)
                          {
                            os_log_t v104 = (os_log_t)&_os_log_internal;
                            os_log_type_t v103 = OS_LOG_TYPE_ERROR;
                            if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
                            {
                              id v32 = v104;
                              os_log_type_t v33 = v103;
                              id v31 = (id)[v166 path];
                              id v30 = (id)[v165 localizedDescription];
                              __os_log_helper_16_2_2_8_64_8_64((uint64_t)v180, (uint64_t)v31, (uint64_t)v30);
                              _os_log_error_impl(&dword_20ABD4000, v32, v33, "Error  loading assets from %@: %@", v180, 0x16u);
                            }
                            objc_storeStrong((id *)&v104, 0);
                            char v167 = 1;
                            int v151 = 6;
                          }
                          else
                          {
                            ++v133;
                            os_log_t v102 = (os_log_t)&_os_log_internal;
                            os_log_type_t v101 = OS_LOG_TYPE_DEBUG;
                            if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
                            {
                              uint64_t v28 = v102;
                              os_log_type_t v29 = v101;
                              __os_log_helper_16_2_2_8_64_4_0((uint64_t)v179, (uint64_t)v108, [v106 isValid] & 1);
                              _os_log_debug_impl(&dword_20ABD4000, v28, v29, "Saved the model assets to %@, isValid: %d", v179, 0x12u);
                            }
                            objc_storeStrong((id *)&v102, 0);
                            +[AMDPerf sampleForKey:@"parseModelPostModelAssetsSaveVerified"];
                            int v151 = 0;
                          }
                          objc_storeStrong(&v106, 0);
                        }
                        objc_storeStrong(&v108, 0);
                        break;
                      case 3:
                        +[AMDPerf startMonitoringEvent:@"SaveCToLMap"];
                        id v92 = (id)[v172 saveMapFile:0x26BEB2DF8 ofSize:v128 isCompressed:v130 inDirURL:v166 fromBuffer:v156];
                        if (v92)
                        {
                          [v172 saveMinimalContentToLogicalMapForModelId:location[0] fromMapData:v92];
                          ++v133;
                          +[AMDPerf endMonitoringEvent:@"SaveCToLMap"];
                        }
                        else
                        {
                          char v167 = 1;
                        }
                        objc_storeStrong(&v92, 0);
                        break;
                      case 4:
                        id v20 = (id)[v172 saveMapFile:0x26BEB2E18 ofSize:v128 isCompressed:v130 inDirURL:v166 fromBuffer:v156];

                        if (v20) {
                          ++v133;
                        }
                        else {
                          char v167 = 1;
                        }
                        break;
                      default:
                        JUMPOUT(0);
                    }
                  }
                }
                if ((v167 & 1) == 0 && v133 == v135)
                {
                  id v87 = objc_alloc_init(MEMORY[0x263EFF9A0]);
                  [v87 setValue:v137 forKey:@"modelSubdirURL"];
                  [v87 setValue:v166 forKey:@"newVersionDirURL"];
                  [v87 setValue:v136 forKey:@"compiledModelDir"];
                  id v18 = (id)[v168 modelMetadata];
                  id v17 = (id)[v18 getModelUid];
                  +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:");

                  [v172 cleanupDiskForModelDirectory:v137 withSavedVersionURL:v166];
                  id v173 = v87;
                  int v151 = 1;
                  objc_storeStrong(&v87, 0);
                }
                else
                {
                  os_log_t v89 = (os_log_t)&_os_log_internal;
                  os_log_type_t v88 = OS_LOG_TYPE_ERROR;
                  if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
                  {
                    __os_log_helper_16_0_2_4_0_4_0((uint64_t)v175, v135, v133);
                    _os_log_error_impl(&dword_20ABD4000, v89, v88, "Expecting to save %d assets, found %d", v175, 0xEu);
                  }
                  objc_storeStrong((id *)&v89, 0);
                  char v167 = 1;
                  id v173 = 0;
                  int v151 = 1;
                }
              }
              objc_storeStrong(&v136, 0);
              objc_storeStrong(&v137, 0);
            }
            else
            {
              os_log_t v139 = (os_log_t)&_os_log_internal;
              os_log_type_t v138 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
              {
                __os_log_helper_16_2_2_8_64_8_0((uint64_t)v186, (uint64_t)location[0], [v168 getVersion]);
                _os_log_error_impl(&dword_20ABD4000, v139, v138, "Could not create new subdir for model %@, version %llu", v186, 0x16u);
              }
              objc_storeStrong((id *)&v139, 0);
              id v173 = 0;
              int v151 = 1;
            }
            objc_storeStrong(&v140, 0);
          }
          else
          {
            id v173 = 0;
            int v151 = 1;
          }
          objc_storeStrong(&v142, 0);
        }
        objc_storeStrong(&v147, 0);
      }
    }
    else
    {
      id v173 = 0;
      int v151 = 1;
    }
  }
  else
  {
    os_log_t v153 = (os_log_t)&_os_log_internal;
    os_log_type_t v152 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
    {
      int v70 = v155;
      id v69 = (id)[v165 localizedDescription];
      __os_log_helper_16_2_3_4_0_4_0_8_64((uint64_t)v188, v70, 1, (uint64_t)v69);
      _os_log_error_impl(&dword_20ABD4000, v153, v152, "Archive format version (%d) != ARCHIVE_FORMAT_VERSION (%d), error: %@", v188, 0x18u);
    }
    objc_storeStrong((id *)&v153, 0);
    id v173 = 0;
    int v151 = 1;
  }
  objc_storeStrong(&v156, 0);
  objc_storeStrong(&v161, 0);
  int v16 = v151;
  if (v165)
  {
    os_log_t v86 = (os_log_t)&_os_log_internal;
    os_log_type_t v85 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
    {
      id v15 = (id)[v165 localizedDescription];
      id v84 = v15;
      __os_log_helper_16_2_1_8_64((uint64_t)v174, (uint64_t)v84);
      _os_log_error_impl(&dword_20ABD4000, v86, v85, "%@", v174, 0xCu);

      objc_storeStrong(&v84, 0);
    }
    objc_storeStrong((id *)&v86, 0);
  }
  if (v163) {
    [v163 close];
  }
  if ((v167 & 1) != 0 && v166)
  {
    id v83 = v165;
    [v164 removeItemAtURL:v166 error:&v83];
    objc_storeStrong(&v165, v83);
  }
  if (v162) {
    objc_exception_rethrow();
  }
  int v151 = v16;
  if (v16 == 3)
  {
    __break(1u);
    JUMPOUT(0x20AC535E8);
  }
  objc_storeStrong(&v163, 0);
  objc_storeStrong(&v164, 0);
  objc_storeStrong(&v165, 0);
  objc_storeStrong(&v166, 0);
  objc_storeStrong(&v168, 0);
  objc_storeStrong(&v169, 0);
  objc_storeStrong(&v170, 0);
  objc_storeStrong(location, 0);
  id v13 = v173;

  return v13;
}

+ (id)saveMapFile:(id)a3 ofSize:(int)a4 isCompressed:(BOOL)a5 inDirURL:(id)a6 fromBuffer:(id)a7
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int v48 = a4;
  BOOL v47 = a5;
  id v46 = 0;
  objc_storeStrong(&v46, a6);
  id v45 = 0;
  objc_storeStrong(&v45, a7);
  id v26 = (id)[v46 URLByAppendingPathComponent:location[0]];
  id v44 = (id)[v26 URLByAppendingPathExtension:@"bin"];

  id v43 = 0;
  id v42 = 0;
  [v45 copyDataOfLength:v48 toFile:v44 isCompressed:v47 error:&v42];
  objc_storeStrong(&v43, v42);
  if (v43)
  {
    v19 = NSString;
    id v21 = (id)[v44 path];
    id v20 = (id)[v43 localizedDescription];
    id v41 = (id)[v19 stringWithFormat:@"Error saving map file %@: %@", v21, v20];

    id v40 = &_os_log_internal;
    os_log_type_t v39 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v54, (uint64_t)v41);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)v40, v39, "%@", v54, 0xCu);
    }
    objc_storeStrong(&v40, 0);
    +[AMDFrameworkMetrics log:v41 withKey:@"saveMapFileFail" atVerbosity:0];
    id v50 = 0;
    int v38 = 1;
    objc_storeStrong(&v41, 0);
  }
  else
  {
    id v18 = (id)[v46 path];
    id v36 = v43;
    id v17 = +[AMDModelAssets loadMapFromDir:andFile:error:](AMDModelAssets, "loadMapFromDir:andFile:error:");
    objc_storeStrong(&v43, v36);
    id v37 = v17;

    if (v43)
    {
      uint64_t v14 = NSString;
      id v16 = (id)[v44 path];
      id v15 = (id)[v43 localizedDescription];
      id v35 = (id)[v14 stringWithFormat:@"Error reading back map data from file %@: %@", v16, v15];

      id v34 = &_os_log_internal;
      os_log_type_t v33 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v53, (uint64_t)v35);
        _os_log_error_impl(&dword_20ABD4000, (os_log_t)v34, v33, "%@", v53, 0xCu);
      }
      objc_storeStrong(&v34, 0);
      +[AMDFrameworkMetrics log:v35 withKey:@"verifyMapFileFail" atVerbosity:0];
      objc_storeStrong(&v43, 0);
      id v12 = (id)[MEMORY[0x263F08850] defaultManager];
      id v32 = v43;
      char v13 = [v12 removeItemAtURL:v44 error:&v32];
      objc_storeStrong(&v43, v32);

      if ((v13 & 1) == 0)
      {
        os_log_t oslog = (os_log_t)&_os_log_internal;
        os_log_type_t v30 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          id v11 = (id)[v44 path];
          char v28 = 0;
          if (v43)
          {
            id v29 = (id)[v43 localizedDescription];
            char v28 = 1;
            uint64_t v10 = (__CFString *)v29;
          }
          else
          {
            uint64_t v10 = @"dont know why";
          }
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v52, (uint64_t)v11, (uint64_t)v10);
          _os_log_error_impl(&dword_20ABD4000, oslog, v30, "Error deleting file (for cleamup) %@: %@", v52, 0x16u);
          if (v28) {
        }
          }
        objc_storeStrong((id *)&oslog, 0);
      }
      id v50 = 0;
      int v38 = 1;
      objc_storeStrong(&v35, 0);
    }
    else
    {
      if (v37)
      {
        os_log_t v27 = (os_log_t)&_os_log_internal;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          id v9 = (id)[v44 path];
          __os_log_helper_16_2_1_8_64((uint64_t)v51, (uint64_t)v9);
          _os_log_debug_impl(&dword_20ABD4000, v27, OS_LOG_TYPE_DEBUG, "Saved the map file %@", v51, 0xCu);
        }
        objc_storeStrong((id *)&v27, 0);
      }
      id v50 = v37;
      int v38 = 1;
    }
    objc_storeStrong(&v37, 0);
  }
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(location, 0);
  id v7 = v50;

  return v7;
}

+ (id)ensureNewVersionDirURLForModel:(id)a3 withVersion:(unint64_t)a4 andCreationTime:(int64_t)a5
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v23 = a4;
  int64_t v22 = a5;
  id v21 = (id)[MEMORY[0x263F08850] defaultManager];
  id v12 = (id)[v21 URLsForDirectory:14 inDomains:1];
  id v20 = (id)[v12 lastObject];

  id v19 = (id)[v20 URLByAppendingPathComponent:@"reco"];
  id v18 = (id)[v19 URLByAppendingPathComponent:@"models"];
  id v17 = (id)[v18 URLByAppendingPathComponent:location[0]];
  if (+[AMDMiscHelpers ensureDir:v17 removeIfExists:0])
  {
    id v7 = (id)[NSNumber numberWithLongLong:v23];
    id v15 = (id)[v7 stringValue];

    id v8 = (id)[NSNumber numberWithLong:v22];
    id v14 = (id)[v8 stringValue];

    id v9 = (id)[v17 URLByAppendingPathComponent:v15];
    id v13 = (id)[v9 URLByAppendingPathComponent:v14];

    if (+[AMDMiscHelpers ensureDir:v13 removeIfExists:1])
    {
      id v25 = [[AMDPair alloc] initWith:v17 and:v13];
    }
    else
    {
      id v25 = 0;
    }
    int v16 = 1;
    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v15, 0);
  }
  else
  {
    id v25 = 0;
    int v16 = 1;
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
  id v5 = v25;

  return v5;
}

+ (void)cleanupDiskForModelDirectory:(id)a3 withSavedVersionURL:(id)a4
{
  v39[1] = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v34 = 0;
  objc_storeStrong(&v34, a4);
  id v33 = (id)[MEMORY[0x263F08850] defaultManager];
  id v16 = (id)[v34 URLByDeletingLastPathComponent];
  id v32 = (id)[v16 lastPathComponent];

  v31[1] = (id)1;
  id v18 = v33;
  id v17 = location[0];
  v39[0] = *MEMORY[0x263EFF6A8];
  id v19 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v39);
  v31[0] = (id)objc_msgSend(v18, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v17);

  memset(__b, 0, sizeof(__b));
  id v20 = v31[0];
  uint64_t v21 = [v20 countByEnumeratingWithState:__b objects:v38 count:16];
  if (v21)
  {
    uint64_t v12 = *(void *)__b[2];
    uint64_t v13 = 0;
    unint64_t v14 = v21;
    while (1)
    {
      uint64_t v11 = v13;
      if (*(void *)__b[2] != v12) {
        objc_enumerationMutation(v20);
      }
      id v30 = *(id *)(__b[1] + 8 * v13);
      id v28 = 0;
      id v27 = (id)[v30 lastPathComponent];
      if ([v32 isEqualToString:v27])
      {
        int v26 = 3;
      }
      else
      {
        id v25 = v28;
        char v10 = [v33 removeItemAtURL:v30 error:&v25];
        objc_storeStrong(&v28, v25);
        if (v10)
        {
          os_log_t oslog = (os_log_t)&_os_log_internal;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            log = oslog;
            os_log_type_t v8 = type;
            id v9 = (id)[v30 lastPathComponent];
            __os_log_helper_16_2_2_8_64_8_64((uint64_t)v37, (uint64_t)v9, (uint64_t)v30);
            _os_log_impl(&dword_20ABD4000, log, v8, "Deleted directory for version: %@ at %@", v37, 0x16u);
          }
          objc_storeStrong((id *)&oslog, 0);
        }
        else
        {
          os_log_t v22 = (os_log_t)&_os_log_internal;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            id v4 = v22;
            id v6 = (id)[v30 lastPathComponent];
            id v5 = (id)[v28 localizedDescription];
            __os_log_helper_16_2_2_8_64_8_64((uint64_t)v36, (uint64_t)v6, (uint64_t)v5);
            _os_log_error_impl(&dword_20ABD4000, v4, OS_LOG_TYPE_ERROR, "Error deleting directory for version: %@: %@", v36, 0x16u);
          }
          objc_storeStrong((id *)&v22, 0);
        }
        int v26 = 0;
      }
      objc_storeStrong(&v27, 0);
      objc_storeStrong(&v28, 0);
      ++v13;
      if (v11 + 1 >= v14)
      {
        uint64_t v13 = 0;
        unint64_t v14 = [v20 countByEnumeratingWithState:__b objects:v38 count:16];
        if (!v14) {
          break;
        }
      }
    }
  }

  objc_storeStrong(v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(location, 0);
}

+ (id)processColdstartBinaryDownload:(id)a3 error:(id *)a4
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v49 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v47 = a4;
  id v46 = (id)[location[0] objectForKey:@"status"];
  id v45 = (id)[location[0] objectForKey:@"modelId"];
  if (v46)
  {
    if (v45)
    {
      if ([v46 isEqualToString:@"Failure"])
      {
        id v37 = &_os_log_internal;
        os_log_type_t v36 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v54, (uint64_t)v45);
          _os_log_error_impl(&dword_20ABD4000, (os_log_t)v37, v36, "Coldstart binary download failed for modelId: %@", v54, 0xCu);
        }
        objc_storeStrong(&v37, 0);
        id v6 = +[AMDError allocError:15 withMessage:@"Coldstart binary download failed in AMS"];
        *BOOL v47 = v6;
        id v50 = 0;
        int v41 = 1;
      }
      else
      {
        id v35 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        id v34 = (id)[location[0] objectForKey:@"modelLocation"];
        id v33 = (id)[location[0] objectForKey:@"version"];
        if (v34)
        {
          if (v33)
          {
            id v26 = +[AMDColdstartOperation saveColdStartBinaryforModel:v45 atLocation:v34 withVersion:v33 error:v47];
            if (*v47)
            {
              id v50 = 0;
              int v41 = 1;
            }
            else
            {
              id v25 = 0;
              id v23 = 0;
              id v15 = +[AMDColdstartURL getColdstartURLForModel:v45 error:&v23];
              objc_storeStrong(&v25, v23);
              id v24 = v15;
              +[AMDColdstartURL saveColdstartURL:v26 error:v47];
              if (*v47)
              {
                os_log_t v22 = (os_log_t)&_os_log_internal;
                os_log_type_t v21 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v12 = v22;
                  os_log_type_t v13 = v21;
                  id v11 = v45;
                  id v14 = (id)[*v47 localizedDescription];
                  id v20 = v14;
                  __os_log_helper_16_2_2_8_64_8_64((uint64_t)v51, (uint64_t)v11, (uint64_t)v20);
                  _os_log_error_impl(&dword_20ABD4000, v12, v13, "Save to the Coldstart binary table failed for modelId: %@ with error: %@", v51, 0x16u);

                  objc_storeStrong(&v20, 0);
                }
                objc_storeStrong((id *)&v22, 0);
                id v50 = 0;
                int v41 = 1;
              }
              else
              {
                if (!v25 && v24)
                {
                  id v19 = v25;
                  [v49 deleteColdstartBinaryFromStorage:v24 forModel:v45 isVersionChange:1 error:&v19];
                  objc_storeStrong(&v25, v19);
                  if (v25)
                  {
                    id v18 = (id)[NSString stringWithFormat:@"Deletion of older version coldstart file failed for model: %@", v45];
                    [v35 setObject:v18 forKey:@"OlderVersionDeletionError"];
                    objc_storeStrong(&v18, 0);
                  }
                  else
                  {
                    id v17 = (id)[NSString stringWithFormat:@"Successfully deleted older version coldstart file for model: %@", v45];
                    [v35 setObject:v17 forKey:@"OlderVersionDeletionSummary"];
                    objc_storeStrong(&v17, 0);
                  }
                }
                [v35 setObject:v45 forKey:@"savedColdstartModelId"];
                [v35 setObject:v33 forKey:@"savedColdstartModelVersion"];
                +[AMDFrameworkMetrics log:v35 withKey:@"coldstartBinaryDownloadSummary" atVerbosity:0];
                id v50 = v35;
                int v41 = 1;
              }
              objc_storeStrong(&v24, 0);
              objc_storeStrong(&v25, 0);
            }
            objc_storeStrong(&v26, 0);
          }
          else
          {
            id v29 = (id)[NSString stringWithFormat:@"No binary version provided in the payload for model: %@", v45];
            os_log_t v28 = (os_log_t)&_os_log_internal;
            os_log_type_t v27 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              __os_log_helper_16_2_1_8_64((uint64_t)v52, (uint64_t)v29);
              _os_log_error_impl(&dword_20ABD4000, v28, v27, "%@", v52, 0xCu);
            }
            objc_storeStrong((id *)&v28, 0);
            id v8 = +[AMDError allocError:15 withMessage:v29];
            *BOOL v47 = v8;
            id v50 = 0;
            int v41 = 1;
            objc_storeStrong(&v29, 0);
          }
        }
        else
        {
          id v32 = (id)[NSString stringWithFormat:@"No binary location provided in the payload for model: %@", v45];
          os_log_t oslog = (os_log_t)&_os_log_internal;
          os_log_type_t v30 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v53, (uint64_t)v32);
            _os_log_error_impl(&dword_20ABD4000, oslog, v30, "%@", v53, 0xCu);
          }
          objc_storeStrong((id *)&oslog, 0);
          id v7 = +[AMDError allocError:15 withMessage:v32];
          *BOOL v47 = v7;
          id v50 = 0;
          int v41 = 1;
          objc_storeStrong(&v32, 0);
        }
        objc_storeStrong(&v33, 0);
        objc_storeStrong(&v34, 0);
        objc_storeStrong(&v35, 0);
      }
    }
    else
    {
      id v40 = (id)[NSString stringWithFormat:@"Invalid input to process coldstart binary download handler: Missing modelId"];
      id v39 = &_os_log_internal;
      os_log_type_t v38 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v55, (uint64_t)v40);
        _os_log_error_impl(&dword_20ABD4000, (os_log_t)v39, v38, "%@", v55, 0xCu);
      }
      objc_storeStrong(&v39, 0);
      id v5 = +[AMDError allocError:15 withMessage:v40];
      *BOOL v47 = v5;
      id v50 = 0;
      int v41 = 1;
      objc_storeStrong(&v40, 0);
    }
  }
  else
  {
    id v44 = (id)[NSString stringWithFormat:@"Invalid Input to process coldstart binary download handler: Missing status"];
    id v43 = &_os_log_internal;
    os_log_type_t v42 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v56, (uint64_t)v44);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)v43, v42, "%@", v56, 0xCu);
    }
    objc_storeStrong(&v43, 0);
    id v4 = +[AMDError allocError:15 withMessage:v44];
    *BOOL v47 = v4;
    id v50 = 0;
    int v41 = 1;
    objc_storeStrong(&v44, 0);
  }
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(location, 0);
  id v9 = v50;

  return v9;
}

+ (id)updateAppTabInfoForWorkflows:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v45 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  uint64_t v24 = [obj countByEnumeratingWithState:__b objects:v51 count:16];
  if (v24)
  {
    uint64_t v20 = *(void *)__b[2];
    uint64_t v21 = 0;
    unint64_t v22 = v24;
    while (1)
    {
      uint64_t v19 = v21;
      if (*(void *)__b[2] != v20) {
        objc_enumerationMutation(obj);
      }
      id v44 = *(id *)(__b[1] + 8 * v21);
      id v42 = 0;
      id v41 = (id)[v44 objectForKey:0x26BEB0618];
      id v39 = v42;
      id v18 = (id)[MEMORY[0x263F08900] JSONObjectWithData:v41 options:4 error:&v39];
      objc_storeStrong(&v42, v39);
      id v40 = v18;
      if (v42)
      {
        id v16 = NSString;
        id v17 = (id)[v44 objectForKey:0x26BEAEA98];
        id v38 = (id)[v16 stringWithFormat:@"Workflow could not be parsed for usecase: %@", v17];

        os_log_t oslog = (os_log_t)&_os_log_internal;
        os_log_type_t type = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          log = oslog;
          os_log_type_t v15 = type;
          __os_log_helper_16_2_1_8_64((uint64_t)v50, (uint64_t)v38);
          _os_log_error_impl(&dword_20ABD4000, log, v15, "%@", v50, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        +[AMDFrameworkMetrics log:v38 withKey:@"TabInfoUpdateError" atVerbosity:0];
        int v35 = 3;
        objc_storeStrong(&v38, 0);
      }
      else
      {
        id v34 = (id)[v40 objectForKey:@"tab_ids"];
        id v33 = (id)[v40 objectForKey:@"use_case_id"];
        if (v34)
        {
          id v29 = v42;
          id v3 = +[AMDAppTabInfo refreshTabsForUseCase:v33 tabs:v34 error:&v29];
          objc_storeStrong(&v42, v29);
          if (v42)
          {
            id v9 = NSString;
            id v11 = (id)[v44 objectForKey:0x26BEAEA98];
            id v10 = (id)[v42 localizedDescription];
            id v28 = (id)[v9 stringWithFormat:@"Tab Id update failed for usecase: %@ with error: %@", v11, v10];

            os_log_t v27 = (os_log_t)&_os_log_internal;
            os_log_type_t v26 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              id v7 = v27;
              os_log_type_t v8 = v26;
              __os_log_helper_16_2_1_8_64((uint64_t)v48, (uint64_t)v28);
              _os_log_error_impl(&dword_20ABD4000, v7, v8, "%@", v48, 0xCu);
            }
            objc_storeStrong((id *)&v27, 0);
            +[AMDFrameworkMetrics log:v28 withKey:@"TabInfoUpdateError" atVerbosity:0];
            int v35 = 3;
            objc_storeStrong(&v28, 0);
          }
          else
          {
            [v45 setObject:v34 forKey:v33];
            os_log_t v25 = (os_log_t)&_os_log_internal;
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              id v6 = v25;
              __os_log_helper_16_2_2_8_64_8_64((uint64_t)v47, (uint64_t)v33, (uint64_t)v34);
              _os_log_impl(&dword_20ABD4000, v6, OS_LOG_TYPE_INFO, "Usecase:%@ mapped to tabs: %@", v47, 0x16u);
            }
            objc_storeStrong((id *)&v25, 0);
            int v35 = 0;
          }
        }
        else
        {
          id v32 = (id)[NSString stringWithFormat:@"TabIds not defined for usecase: %@", v33];
          os_log_t v31 = (os_log_t)&_os_log_internal;
          os_log_type_t v30 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            uint64_t v12 = v31;
            os_log_type_t v13 = v30;
            __os_log_helper_16_2_1_8_64((uint64_t)v49, (uint64_t)v32);
            _os_log_error_impl(&dword_20ABD4000, v12, v13, "%@", v49, 0xCu);
          }
          objc_storeStrong((id *)&v31, 0);
          +[AMDFrameworkMetrics log:v32 withKey:@"NilTabIdError" atVerbosity:0];
          int v35 = 3;
          objc_storeStrong(&v32, 0);
        }
        objc_storeStrong(&v33, 0);
        objc_storeStrong(&v34, 0);
      }
      objc_storeStrong(&v40, 0);
      objc_storeStrong(&v41, 0);
      objc_storeStrong(&v42, 0);
      ++v21;
      if (v19 + 1 >= v22)
      {
        uint64_t v21 = 0;
        unint64_t v22 = [obj countByEnumeratingWithState:__b objects:v51 count:16];
        if (!v22) {
          break;
        }
      }
    }
  }

  id v5 = v45;
  int v35 = 1;
  objc_storeStrong(&v45, 0);
  objc_storeStrong(location, 0);

  return v5;
}

+ (id)performModelCleanup
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v28 = a1;
  v27[1] = (id)a2;
  v27[0] = +[AMDModel getCurrentModelInfoByModelId];
  id v26 = objc_alloc_init(MEMORY[0x263EFF980]);
  memset(__b, 0, sizeof(__b));
  id obj = v27[0];
  uint64_t v14 = [obj countByEnumeratingWithState:__b objects:v30 count:16];
  if (v14)
  {
    uint64_t v10 = *(void *)__b[2];
    uint64_t v11 = 0;
    unint64_t v12 = v14;
    while (1)
    {
      uint64_t v9 = v11;
      if (*(void *)__b[2] != v10) {
        objc_enumerationMutation(obj);
      }
      uint64_t v25 = *(void *)(__b[1] + 8 * v11);
      id v23 = 0;
      id v21 = 0;
      id v8 = +[AMDWorkflow getWorkflowsForModelId:v25 error:&v21];
      objc_storeStrong(&v23, v21);
      id v22 = v8;
      if (v23)
      {
        +[AMDFrameworkMetrics log:@"Workflow fetch failed during model cleanup" withKey:@"WorkflowFetchError" atVerbosity:0];
        int v20 = 3;
      }
      else
      {
        if (v22 && [v22 count]) {
          goto LABEL_18;
        }
        id v18 = v23;
        id v7 = +[AMDWorkflowInFlight getAllWorkflowsWithModelId:v25 error:&v18];
        objc_storeStrong(&v23, v18);
        id v19 = v7;
        if (v23)
        {
          +[AMDFrameworkMetrics log:@"Inflight workflow fetch failed during model cleanup" withKey:@"InfightWorkflowFetchError" atVerbosity:0];
          int v20 = 3;
        }
        else
        {
          if (!v19 || ![v19 count])
          {
            id v5 = v26;
            id v6 = (id)[v27[0] objectForKey:v25];
            objc_msgSend(v5, "addObject:");

            os_log_t oslog = (os_log_t)&_os_log_internal;
            os_log_type_t type = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
            {
              log = oslog;
              __os_log_helper_16_2_1_8_64((uint64_t)v29, v25);
              _os_log_debug_impl(&dword_20ABD4000, log, type, "Model to delete :%@", v29, 0xCu);
            }
            objc_storeStrong((id *)&oslog, 0);
          }
          int v20 = 0;
        }
        objc_storeStrong(&v19, 0);
        if (!v20) {
LABEL_18:
        }
          int v20 = 0;
      }
      objc_storeStrong(&v22, 0);
      objc_storeStrong(&v23, 0);
      ++v11;
      if (v9 + 1 >= v12)
      {
        uint64_t v11 = 0;
        unint64_t v12 = [obj countByEnumeratingWithState:__b objects:v30 count:16];
        if (!v12) {
          break;
        }
      }
    }
  }

  id v15 = (id)[v28 removeOldModels:v26];
  id v3 = v15;
  int v20 = 1;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(v27, 0);

  return v3;
}

+ (id)processModelDownload:(id)a3 withStorefrontID:(id)a4 error:(id *)a5
{
  uint64_t v137 = *MEMORY[0x263EF8340];
  id v120 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v118 = 0;
  objc_storeStrong(&v118, a4);
  os_log_type_t v117 = a5;
  id v116 = (id)[location[0] objectForKey:@"status"];
  id v115 = (id)[location[0] objectForKey:@"modelId"];
  if (!v116)
  {
    id v114 = (id)[NSString stringWithFormat:@"Invalid Input to Process Model Download Handler: Missing status"];
    id v113 = &_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v113, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v136, (uint64_t)v114);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)v113, type, "%@", v136, 0xCu);
    }
    objc_storeStrong(&v113, 0);
    *os_log_type_t v117 = +[AMDError allocError:15 withMessage:v114];
    id v121 = 0;
    int v111 = 1;
    objc_storeStrong(&v114, 0);
    goto LABEL_91;
  }
  if (!v115)
  {
    id v110 = (id)[NSString stringWithFormat:@"Invalid Input to Process Model Download Handler: Missing modelId"];
    id v109 = &_os_log_internal;
    os_log_type_t v108 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v109, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v135, (uint64_t)v110);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)v109, v108, "%@", v135, 0xCu);
    }
    objc_storeStrong(&v109, 0);
    *os_log_type_t v117 = +[AMDError allocError:15 withMessage:v110];
    id v121 = 0;
    int v111 = 1;
    objc_storeStrong(&v110, 0);
    goto LABEL_91;
  }
  if (([v116 isEqualToString:@"Failure"] & 1) == 0)
  {
    id v104 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v103 = (id)[location[0] objectForKey:@"domain"];
    if (!v103)
    {
      id v102 = &_os_log_internal;
      os_log_type_t v101 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v102, OS_LOG_TYPE_ERROR))
      {
        id v39 = v102;
        os_log_type_t v40 = v101;
        __os_log_helper_16_0_0(v100);
        _os_log_error_impl(&dword_20ABD4000, v39, v40, "No domain provided in modelDownloadPayload", v100, 2u);
      }
      objc_storeStrong(&v102, 0);
      *os_log_type_t v117 = +[AMDError allocError:15 withMessage:@"No domain provided in modelDownloadPayload"];
      id v121 = 0;
      int v111 = 1;
      goto LABEL_90;
    }
    int64_t v99 = +[AMDDomains getCodeForDomain:v103];
    id v98 = +[AMDWorkflowInFlight getAllWorkflowsForDomain:v99 withModelId:v115 error:v117];
    if (*v117)
    {
      id v97 = &_os_log_internal;
      os_log_type_t v96 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v97, OS_LOG_TYPE_ERROR))
      {
        os_log_type_t v36 = v97;
        os_log_type_t v37 = v96;
        id v38 = (id)[*v117 localizedDescription];
        id v95 = v38;
        __os_log_helper_16_2_1_8_64((uint64_t)v133, (uint64_t)v95);
        _os_log_error_impl(&dword_20ABD4000, v36, v37, "Error querying In-Flight Workflow table: %@", v133, 0xCu);

        objc_storeStrong(&v95, 0);
      }
      objc_storeStrong(&v97, 0);
      id v121 = 0;
      int v111 = 1;
      goto LABEL_89;
    }
    if (!v98 || ![v98 count])
    {
      id v94 = (id)[NSString stringWithFormat:@"No In-Flight workflows found for modelId: %@", v115];
      id v93 = &_os_log_internal;
      os_log_type_t v92 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v93, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v132, (uint64_t)v94);
        _os_log_error_impl(&dword_20ABD4000, (os_log_t)v93, v92, "%@", v132, 0xCu);
      }
      objc_storeStrong(&v93, 0);
      +[AMDFrameworkMetrics log:v94 withKey:@"modelDownloadError" atVerbosity:0];
      id v121 = 0;
      int v111 = 1;
      objc_storeStrong(&v94, 0);
      goto LABEL_89;
    }
    id v91 = (id)[v98 firstObject];
    id v34 = (void *)MEMORY[0x263F08900];
    id v35 = (id)[v91 objectForKey:0x26BEB0618];
    id v90 = (id)objc_msgSend(v34, "JSONObjectWithData:options:error:");

    if (*v117)
    {
      id v89 = &_os_log_internal;
      os_log_type_t v88 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v89, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = v89;
        os_log_type_t v32 = v88;
        id v33 = (id)[*v117 localizedDescription];
        id v87 = v33;
        __os_log_helper_16_2_1_8_64((uint64_t)v131, (uint64_t)v87);
        _os_log_error_impl(&dword_20ABD4000, v31, v32, "Inflight workflow serialization failed: %@", v131, 0xCu);

        objc_storeStrong(&v87, 0);
      }
      objc_storeStrong(&v89, 0);
      id v121 = 0;
      int v111 = 1;
      goto LABEL_88;
    }
    id v86 = (id)[v90 objectForKey:@"model_format"];
    id v85 = (id)[location[0] objectForKey:@"modelLocation"];
    id v84 = (id)[location[0] objectForKey:@"version"];
    id v83 = (id)[location[0] objectForKey:@"type"];
    if (!v85)
    {
      id v82 = (id)[NSString stringWithFormat:@"No model location provided in the payload for model: %@", v115];
      id v81 = &_os_log_internal;
      os_log_type_t v80 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v81, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v130, (uint64_t)v82);
        _os_log_error_impl(&dword_20ABD4000, (os_log_t)v81, v80, "%@", v130, 0xCu);
      }
      objc_storeStrong(&v81, 0);
      *os_log_type_t v117 = +[AMDError allocError:15 withMessage:v82];
      id v121 = 0;
      int v111 = 1;
      objc_storeStrong(&v82, 0);
      goto LABEL_87;
    }
    if (!v84)
    {
      id v79 = (id)[NSString stringWithFormat:@"No model version provided in the payload for model: %@", v115];
      id v78 = &_os_log_internal;
      os_log_type_t v77 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v78, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v129, (uint64_t)v79);
        _os_log_error_impl(&dword_20ABD4000, (os_log_t)v78, v77, "%@", v129, 0xCu);
      }
      objc_storeStrong(&v78, 0);
      *os_log_type_t v117 = +[AMDError allocError:15 withMessage:v79];
      id v121 = 0;
      int v111 = 1;
      objc_storeStrong(&v79, 0);
      goto LABEL_87;
    }
    id v76 = 0;
    if ([v86 isEqualToString:@"CoreML"])
    {
      if (v83 && ([v83 isEqualToString:@"uncompiled"] & 1) == 0)
      {
        if (([v83 isEqualToString:@"compiled"] & 1) == 0)
        {
          id v75 = (id)[NSString stringWithFormat:@"Unrecognized model type sent to JS Handler: %@", v83];
          id v74 = &_os_log_internal;
          os_log_type_t v73 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled((os_log_t)v74, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v128, (uint64_t)v75);
            _os_log_error_impl(&dword_20ABD4000, (os_log_t)v74, v73, "%@", v128, 0xCu);
          }
          objc_storeStrong(&v74, 0);
          *os_log_type_t v117 = +[AMDError allocError:15 withMessage:v75];
          id v121 = 0;
          int v111 = 1;
          objc_storeStrong(&v75, 0);
          goto LABEL_86;
        }
        id v7 = (id)[v120 unzipAndValidateCompiledModelBundle:v115 atLocation:v85 withVersion:v84 error:v117];
        id v8 = v76;
        id v76 = v7;
      }
      else
      {
        id v5 = (id)[v120 parseModel:v115 atLocation:v85 withVersion:v84 withStorefrontId:v118 error:v117];
        id v6 = v76;
        id v76 = v5;
      }
    }
    else
    {
      if (([v86 isEqualToString:@"Espresso"] & 1) == 0)
      {
        id v72 = (id)[NSString stringWithFormat:@"Unsupported model format present in inflight workflow: %@", v86];
        id v71 = &_os_log_internal;
        os_log_type_t v70 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v71, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v127, (uint64_t)v72);
          _os_log_error_impl(&dword_20ABD4000, (os_log_t)v71, v70, "%@", v127, 0xCu);
        }
        objc_storeStrong(&v71, 0);
        *os_log_type_t v117 = +[AMDError allocError:15 withMessage:v72];
        id v121 = 0;
        int v111 = 1;
        objc_storeStrong(&v72, 0);
        goto LABEL_86;
      }
      id v9 = (id)[v120 unzipDownloadedModelBundle:v115 atLocation:v85 withVersion:v84 error:v117];
      id v10 = v76;
      id v76 = v9;
    }
    if (*v117)
    {
      id v121 = 0;
      int v111 = 1;
    }
    else if (v76)
    {
      id v67 = 0;
      id v65 = 0;
      id v30 = +[AMDModel getModelInfo:v115 error:&v65];
      objc_storeStrong(&v67, v65);
      id v66 = v30;
      +[AMDModel saveModels:v76 error:v117];
      if (*v117)
      {
        id v64 = &_os_log_internal;
        os_log_type_t v63 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v64, OS_LOG_TYPE_ERROR))
        {
          id v28 = v115;
          id v29 = (id)[*v117 localizedDescription];
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v125, (uint64_t)v28, (uint64_t)v29);
          _os_log_error_impl(&dword_20ABD4000, (os_log_t)v64, v63, "Model url save failed, modelId: %@, error: %@", v125, 0x16u);
        }
        objc_storeStrong(&v64, 0);
        id v121 = 0;
        int v111 = 1;
      }
      else
      {
        id v62 = &_os_log_internal;
        os_log_type_t v61 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled((os_log_t)v62, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v124, (uint64_t)v115);
          _os_log_debug_impl(&dword_20ABD4000, (os_log_t)v62, v61, "Added modelUrl for '%@'", v124, 0xCu);
        }
        objc_storeStrong(&v62, 0);
        if (!v67 && v66)
        {
          id v60 = v67;
          [v120 deleteModelFromStorage:v66 isVersionChange:1 error:&v60];
          objc_storeStrong(&v67, v60);
          if (v67)
          {
            id v59 = (id)[NSString stringWithFormat:@"Deletion of older version model file failed for model: %@", v115];
            [v104 setObject:v59 forKey:@"OlderVersionDeletionError"];
            objc_storeStrong(&v59, 0);
          }
          else
          {
            id v58 = (id)[NSString stringWithFormat:@"Successfully deleted older model version for model: %@", v115];
            [v104 setObject:v58 forKey:@"OlderVersionDeletionSummary"];
            objc_storeStrong(&v58, 0);
          }
        }
        [v104 setObject:v115 forKey:@"savedModelId"];
        [v104 setObject:v84 forKey:@"savedModelVersion"];
        id v57 = +[AMDWorkflowInFlight moveInflightWorkflowsToWorkflows:v98 withDomain:v99 error:v117];
        id v56 = (id)[v57 objectForKey:@"savedWorkflows"];
        id v55 = (id)[v57 objectForKey:@"deletionSummary"];
        id v54 = (id)[v120 updateAppTabInfoForWorkflows:v56];
        id v53 = (id)[v120 performModelCleanup];
        id v52 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        uint64_t v51 = 0;
        memset(__b, 0, sizeof(__b));
        id v26 = v98;
        uint64_t v27 = [v26 countByEnumeratingWithState:__b objects:v123 count:16];
        if (v27)
        {
          uint64_t v23 = *(void *)__b[2];
          uint64_t v24 = 0;
          unint64_t v25 = v27;
          while (1)
          {
            uint64_t v22 = v24;
            if (*(void *)__b[2] != v23) {
              objc_enumerationMutation(v26);
            }
            id v50 = *(id *)(__b[1] + 8 * v24);
            id v48 = (id)[v50 objectForKey:0x26BEB0578];
            id v47 = (id)[v50 objectForKey:0x26BEAEC58];
            if (v48) {
              [v52 addObject:v48];
            }
            if (v47) {
              uint64_t v51 = [v47 longLongValue];
            }
            objc_storeStrong(&v47, 0);
            objc_storeStrong(&v48, 0);
            ++v24;
            if (v22 + 1 >= v25)
            {
              uint64_t v24 = 0;
              unint64_t v25 = [v26 countByEnumeratingWithState:__b objects:v123 count:16];
              if (!v25) {
                break;
              }
            }
          }
        }

        id v46 = (id)[v52 allObjects];
        id v20 = (id)[MEMORY[0x263EFF910] date];
        [v20 timeIntervalSince1970];
        unint64_t v21 = (unint64_t)v11;

        unint64_t v45 = v21;
        uint64_t v44 = v21 - v51;
        [v104 setObject:v46 forKey:@"SyncUUIDs"];
        if (v51)
        {
          id v18 = v104;
          id v19 = (id)[NSNumber numberWithUnsignedLongLong:v44];
          objc_msgSend(v18, "setObject:forKey:");
        }
        else
        {
          [v104 setObject:@"SyncTime not found" forKey:@"Error:modelAvailabilityLatency"];
        }
        id v14 = v104;
        id v15 = (id)[NSNumber numberWithUnsignedLongLong:v51];
        objc_msgSend(v14, "setObject:forKey:");

        id v16 = v104;
        id v17 = (id)[NSNumber numberWithUnsignedLongLong:v45];
        objc_msgSend(v16, "setObject:forKey:");

        [v104 setObject:v55 forKey:@"workflowCleanupInformation"];
        [v104 setObject:v53 forKey:@"modelsDeleted"];
        [v104 setObject:v54 forKey:@"updatedTabInfo"];
        os_log_t oslog = (os_log_t)&_os_log_internal;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
        {
          __os_log_helper_16_0_1_8_0((uint64_t)v122, v44);
          _os_log_impl(&dword_20ABD4000, oslog, OS_LOG_TYPE_INFO, "Total model availability latency(seconds) : %lld", v122, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        +[AMDFrameworkMetrics log:v104 withKey:@"downloadProcessSummary" atVerbosity:0];
        id v121 = v104;
        int v111 = 1;
        objc_storeStrong(&v46, 0);
        objc_storeStrong(&v52, 0);
        objc_storeStrong(&v53, 0);
        objc_storeStrong(&v54, 0);
        objc_storeStrong(&v55, 0);
        objc_storeStrong(&v56, 0);
        objc_storeStrong(&v57, 0);
      }
      objc_storeStrong(&v66, 0);
      objc_storeStrong(&v67, 0);
    }
    else
    {
      id v69 = &_os_log_internal;
      os_log_type_t v68 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v69, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v126, (uint64_t)v115);
        _os_log_error_impl(&dword_20ABD4000, (os_log_t)v69, v68, "Parse model information operation failed for modelId: %@", v126, 0xCu);
      }
      objc_storeStrong(&v69, 0);
      *os_log_type_t v117 = +[AMDError allocError:16 withMessage:@"Parse model information operation failed"];
      id v121 = 0;
      int v111 = 1;
    }
LABEL_86:
    objc_storeStrong(&v76, 0);
LABEL_87:
    objc_storeStrong(&v83, 0);
    objc_storeStrong(&v84, 0);
    objc_storeStrong(&v85, 0);
    objc_storeStrong(&v86, 0);
LABEL_88:
    objc_storeStrong(&v90, 0);
    objc_storeStrong(&v91, 0);
LABEL_89:
    objc_storeStrong(&v98, 0);
LABEL_90:
    objc_storeStrong(&v103, 0);
    objc_storeStrong(&v104, 0);
    goto LABEL_91;
  }
  id v107 = (id)[NSString stringWithFormat:@"Model Download Failed for modelId: %@", v115];
  id v106 = &_os_log_internal;
  os_log_type_t v105 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled((os_log_t)v106, OS_LOG_TYPE_ERROR))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v134, (uint64_t)v107);
    _os_log_error_impl(&dword_20ABD4000, (os_log_t)v106, v105, "%@", v134, 0xCu);
  }
  objc_storeStrong(&v106, 0);
  *os_log_type_t v117 = +[AMDError allocError:15 withMessage:v107];
  +[AMDFrameworkMetrics log:v107 withKey:@"modelDownloadFailure" atVerbosity:0];
  id v121 = 0;
  int v111 = 1;
  objc_storeStrong(&v107, 0);
LABEL_91:
  objc_storeStrong(&v115, 0);
  objc_storeStrong(&v116, 0);
  objc_storeStrong(&v118, 0);
  objc_storeStrong(location, 0);
  unint64_t v12 = v121;

  return v12;
}

+ (id)parseModel:(id)a3 atLocation:(id)a4 withVersion:(id)a5 withStorefrontId:(id)a6 error:(id *)a7
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v44 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v42 = 0;
  objc_storeStrong(&v42, a4);
  id v41 = 0;
  objc_storeStrong(&v41, a5);
  id v40 = 0;
  objc_storeStrong(&v40, a6);
  v39[1] = a7;
  v39[0] = @"ModelFilesHandling";
  id v38 = 0;
  context = (void *)MEMORY[0x21052BD40](+[AMDPerf sampleForKey:v39[0]]);
  id v18 = [AMDBaseRecoModel alloc];
  uint64_t v37 = -[AMDBaseRecoModel initWithId:andVersion:](v18, "initWithId:andVersion:", location[0], [v41 longLongValue]);
  unint64_t v21 = v44;
  id v19 = location[0];
  id v20 = v40;
  id v22 = (id)[NSURL URLWithString:v42];
  id v7 = (id)objc_msgSend(v21, "parseModelWithId:withStorefrontId:fromArchive:withBaseRecoModel:", v19, v20);
  id v8 = v38;
  id v38 = v7;

  objc_storeStrong((id *)&v37, 0);
  +[AMDPerf sampleForKey:v39[0]];
  id v36 = (id)[v38 objectForKey:@"newVersionDirURL"];
  if (v36)
  {
    id v32 = (id)objc_msgSend(v38, "objectForKey:");
    id v31 = (id)[v36 absoluteString];
    id v30 = (id)[v31 stringByRemovingPercentEncoding];
    uint64_t v28 = [v30 rangeOfString:@"file://"];
    uint64_t v29 = v9;
    uint64_t v46 = v28;
    uint64_t v47 = v9;
    id v27 = (id)[v30 substringFromIndex:v28 + v9];
    id v26 = (id)[NSURL fileURLWithPath:v27 isDirectory:1];
    id v12 = (id)[v26 URLByDeletingLastPathComponent];
    id v25 = (id)[v12 lastPathComponent];

    id v50 = location[0];
    v48[0] = @"modelId";
    v49[0] = location[0];
    v48[1] = @"url";
    v49[1] = v27;
    v48[2] = @"compiledModelDir";
    v49[2] = v32;
    v48[3] = @"version";
    v49[3] = v25;
    id v13 = (id)[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:4];
    id v51 = v13;
    id v24 = (id)[NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];

    id v45 = v24;
    int v33 = 1;
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v30, 0);
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v32, 0);
  }
  else
  {
    id v35 = &_os_log_internal;
    os_log_type_t v34 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v52, (uint64_t)location[0]);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)v35, v34, "Model file not correctly parsed for modelId: %@", v52, 0xCu);
    }
    objc_storeStrong(&v35, 0);
    id v45 = 0;
    int v33 = 1;
  }
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(location, 0);
  id v10 = v45;

  return v10;
}

+ (void)saveMinimalContentToLogicalMapForModelId:(id)a3 fromMapData:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  id v9 = 0;
  id v7 = 0;
  id v5 = +[AMDTasteProfile getPurchasedAppsSet:&v7];
  objc_storeStrong(&v9, v7);
  id v8 = v5;
  if ([v5 count])
  {
    +[AMDTasteProfile saveMinimalCToLMapForModelId:location[0] usingMapData:v10 andPurchases:v8];
  }
  else
  {
    os_log_t oslog = (os_log_t)&_os_log_internal;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v12, (uint64_t)location[0]);
      _os_log_impl(&dword_20ABD4000, oslog, OS_LOG_TYPE_INFO, "No purchases to map to logicalIds for modelId %@", v12, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

+ (void)unzipModelFile:(id)a3 copyToDestination:(id)a4 error:(id *)a5
{
  v18[3] = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  uint64_t v13 = a5;
  +[AMDPerf startMonitoringEvent:@"ModelUnzip"];
  v12[5] = (id)BOMCopierNew();
  v12[2] = (id) [location[0] fileSystemRepresentation];
  v12[1] = (id) [v14 fileSystemRepresentation];
  v17[0] = @"extractPKZip";
  v18[0] = *MEMORY[0x263EFFB40];
  v17[1] = @"sequesterResources";
  v18[1] = *MEMORY[0x263EFFB40];
  v17[2] = @"copyResources";
  v18[2] = *MEMORY[0x263EFFB40];
  v12[0] = (id)[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];
  int v11 = BOMCopierCopyWithOptions();
  BOMCopierFree();
  if (v11)
  {
    id v10 = (id)[NSString stringWithFormat:@"Model at path %@ could not be unzipped", location[0]];
    id v9 = &_os_log_internal;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v16, (uint64_t)v10);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)v9, OS_LOG_TYPE_ERROR, "%@", v16, 0xCu);
    }
    objc_storeStrong(&v9, 0);
    id v5 = +[AMDError allocError:15 withMessage:v10];
    *uint64_t v13 = v5;
    int v8 = 1;
    objc_storeStrong(&v10, 0);
  }
  else
  {
    int v8 = 0;
  }
  objc_storeStrong(v12, 0);
  if (!v8) {
    +[AMDPerf endMonitoringEvent:@"ModelUnzip"];
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

+ (id)unzipModel:(id)a3 atLocation:(id)a4 withVersion:(id)a5 error:(id *)a6
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v40 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v38 = 0;
  objc_storeStrong(&v38, a4);
  id v37 = 0;
  objc_storeStrong(&v37, a5);
  id v36 = a6;
  id v35 = (id)[MEMORY[0x263F08850] defaultManager];
  if ([v35 fileExistsAtPath:v38])
  {
    id v17 = (id)[MEMORY[0x263EFF910] date];
    [v17 timeIntervalSince1970];
    id v18 = (void *)(uint64_t)v7;

    v30[1] = v18;
    v30[0] = (id)objc_msgSend(v40, "ensureNewVersionDirURLForModel:withVersion:andCreationTime:", location[0], objc_msgSend(v37, "longLongValue"), v18);
    if (v30[0])
    {
      id v26 = (id)[v30[0] second];
      id v15 = v40;
      id v14 = v38;
      id v16 = (id)[v26 path];
      objc_msgSend(v15, "unzipModelFile:copyToDestination:error:", v14);

      if (*v36)
      {
        id v13 = (id)[*v36 localizedDescription];
        +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:");

        id v41 = 0;
        int v31 = 1;
      }
      else
      {
        id v25 = 0;
        id v11 = v35;
        id v12 = (id)[NSURL fileURLWithPath:v38 isDirectory:0];
        id v24 = v25;
        objc_msgSend(v11, "removeItemAtURL:error:");
        objc_storeStrong(&v25, v24);

        if (v25)
        {
          id v23 = (id)[NSString stringWithFormat:@"could not delete downloaded zipped model at location: %@", v38];
          id v22 = &_os_log_internal;
          if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v42, (uint64_t)v23);
            _os_log_error_impl(&dword_20ABD4000, (os_log_t)v22, OS_LOG_TYPE_ERROR, "%@", v42, 0xCu);
          }
          objc_storeStrong(&v22, 0);
          +[AMDFrameworkMetrics log:v23 withKey:@"downloadedModelDeletionError" atVerbosity:0];
          objc_storeStrong(&v23, 0);
        }
        id v41 = v26;
        int v31 = 1;
        objc_storeStrong(&v25, 0);
      }
      objc_storeStrong(&v26, 0);
    }
    else
    {
      id v29 = (id)[NSString stringWithFormat:@"New directory could not be created at path: %@ for model: %@", v38, location[0]];
      id v28 = &_os_log_internal;
      os_log_type_t v27 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v43, (uint64_t)v29);
        _os_log_error_impl(&dword_20ABD4000, (os_log_t)v28, v27, "%@", v43, 0xCu);
      }
      objc_storeStrong(&v28, 0);
      id v8 = +[AMDError allocError:15 withMessage:v29];
      id *v36 = v8;
      id v41 = 0;
      int v31 = 1;
      objc_storeStrong(&v29, 0);
    }
    objc_storeStrong(v30, 0);
  }
  else
  {
    id v34 = (id)[NSString stringWithFormat:@"Downloaded Model unavailable at path: %@ for model: %@", v38, location[0]];
    +[AMDFrameworkMetrics log:v34 withKey:@"parseDownloadedModelError" atVerbosity:0];
    id v33 = &_os_log_internal;
    os_log_type_t v32 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v44, (uint64_t)v34);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)v33, v32, "%@", v44, 0xCu);
    }
    objc_storeStrong(&v33, 0);
    id v6 = +[AMDError allocError:15 withMessage:v34];
    id *v36 = v6;
    id v41 = 0;
    int v31 = 1;
    objc_storeStrong(&v34, 0);
  }
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(location, 0);
  id v9 = v41;

  return v9;
}

+ (id)unzipDownloadedModelBundle:(id)a3 atLocation:(id)a4 withVersion:(id)a5 error:(id *)a6
{
  v25[1] = *MEMORY[0x263EF8340];
  id v20 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  id v17 = 0;
  objc_storeStrong(&v17, a5);
  v16[1] = a6;
  v16[0] = (id)[v20 unzipModel:location[0] atLocation:v18 withVersion:v17 error:a6];
  if (*a6)
  {
    id v21 = 0;
    int v15 = 1;
  }
  else
  {
    id v24 = location[0];
    v22[0] = @"modelId";
    v23[0] = location[0];
    v22[1] = @"url";
    id v10 = (id)[v16[0] path];
    v23[1] = v10;
    v22[2] = @"compiledModelDir";
    v23[2] = &stru_26BEAC9D8;
    v22[3] = @"version";
    id v9 = (id)[v17 stringValue];
    v23[3] = v9;
    id v8 = (id)[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:4];
    v25[0] = v8;
    id v14 = (id)[NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];

    id v21 = v14;
    int v15 = 1;
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong(v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  id v6 = v21;

  return v6;
}

+ (id)unzipAndValidateCompiledModelBundle:(id)a3 atLocation:(id)a4 withVersion:(id)a5 error:(id *)a6
{
  v27[1] = *MEMORY[0x263EF8340];
  id v22 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = 0;
  objc_storeStrong(&v20, a4);
  id v19 = 0;
  objc_storeStrong(&v19, a5);
  id v18 = a6;
  id v17 = (id)[v22 unzipModel:location[0] atLocation:v20 withVersion:v19 error:a6];
  if (*a6)
  {
    id v23 = 0;
    int v16 = 1;
  }
  else
  {
    [v22 validateDownloadAtLocation:v17 withModelId:location[0] andVersion:v19 error:v18];
    if (*v18)
    {
      id v23 = 0;
      int v16 = 1;
    }
    else
    {
      id v15 = (id)[location[0] stringByAppendingString:@".mlmodelc"];
      id v26 = location[0];
      v24[0] = @"modelId";
      v25[0] = location[0];
      v24[1] = @"url";
      id v10 = (id)[v17 path];
      v25[1] = v10;
      v24[2] = @"compiledModelDir";
      void v25[2] = v15;
      v24[3] = @"version";
      id v9 = (id)[v19 stringValue];
      v25[3] = v9;
      id v8 = (id)[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:4];
      v27[0] = v8;
      id v14 = (id)[NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];

      id v23 = v14;
      int v16 = 1;
      objc_storeStrong(&v14, 0);
      objc_storeStrong(&v15, 0);
    }
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  id v6 = v23;

  return v6;
}

+ (void)validateDownloadAtLocation:(id)a3 withModelId:(id)a4 andVersion:(id)a5 error:(id *)a6
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v73 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v71 = 0;
  objc_storeStrong(&v71, a4);
  id v70 = 0;
  objc_storeStrong(&v70, a5);
  id v69 = a6;
  id v41 = [AMDBaseRecoModel alloc];
  id v68 = -[AMDBaseRecoModel initWithId:andVersion:](v41, "initWithId:andVersion:", v71, [v70 longLongValue]);
  [v68 loadModelMetadataFromDir:location[0] error:a6];
  BOOL v6 = *a6 != 0;
  char v66 = 0;
  BOOL v42 = 1;
  if (!v6)
  {
    id v67 = (id)[v68 modelMetadata];
    char v66 = 1;
    BOOL v42 = v67 == 0;
  }
  if (v66) {

  }
  if (v42)
  {
    id v65 = &_os_log_internal;
    char v64 = 16;
    if (os_log_type_enabled((os_log_t)v65, OS_LOG_TYPE_ERROR))
    {
      log = v65;
      os_log_type_t type = v64;
      id v37 = (id)[location[0] path];
      id v36 = (id)[*v69 localizedDescription];
      id v63 = v36;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v79, (uint64_t)v37, (uint64_t)v63);
      _os_log_error_impl(&dword_20ABD4000, log, type, "Error loading model metadata from %@: %@", v79, 0x16u);

      objc_storeStrong(&v63, 0);
    }
    objc_storeStrong(&v65, 0);
    id v33 = (id)[*v69 localizedDescription];
    +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:");

    int v62 = 1;
  }
  else
  {
    id v31 = (id)[v68 modelMetadata];
    char v32 = [v31 isValid];

    if (v32)
    {
      id v26 = [AMDModelAssets alloc];
      id v27 = (id)[location[0] path];
      id v58 = -[AMDModelAssets initFromDir:andMetadata:useBinaryInputMap:useBinaryOutputMap:withModelId:isInference:error:](v26, "initFromDir:andMetadata:useBinaryInputMap:useBinaryOutputMap:withModelId:isInference:error:", v69);

      if (*v69)
      {
        os_log_t oslog = (os_log_t)&_os_log_internal;
        os_log_type_t v56 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          id v22 = oslog;
          os_log_type_t v23 = v56;
          id v25 = (id)[location[0] path];
          id v24 = (id)[*v69 localizedDescription];
          id v55 = v24;
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v77, (uint64_t)v25, (uint64_t)v55);
          _os_log_error_impl(&dword_20ABD4000, v22, v23, "Error  loading assets from %@: %@", v77, 0x16u);

          objc_storeStrong(&v55, 0);
        }
        objc_storeStrong((id *)&oslog, 0);
        id v21 = (id)[*v69 localizedDescription];
        +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:");

        int v62 = 1;
      }
      else
      {
        id v20 = (id)[v68 modelMetadata];
        id v54 = (id)[v20 getMappingFileRequirement];

        if (v54 && ([v54 BOOLValue] & 1) == 1 && (objc_msgSend(v58, "isValid") & 1) == 0)
        {
          id v18 = NSString;
          id v19 = (id)[location[0] path];
          id v53 = (id)[v18 stringWithFormat:@"Invalid assets loaded from filepath: %@", v19];

          os_log_t v52 = (os_log_t)&_os_log_internal;
          os_log_type_t v51 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v76, (uint64_t)v53);
            _os_log_error_impl(&dword_20ABD4000, v52, v51, "%@", v76, 0xCu);
          }
          objc_storeStrong((id *)&v52, 0);
          *id v69 = +[AMDError allocError:16 withMessage:v53];
          id v17 = (id)[*v69 localizedDescription];
          +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:");

          int v62 = 1;
          objc_storeStrong(&v53, 0);
        }
        else
        {
          id v16 = (id)[v58 getContentToLogicalMap];

          if (v16)
          {
            id v14 = v73;
            id v13 = v71;
            id v15 = (id)[v58 getContentToLogicalMap];
            objc_msgSend(v14, "saveMinimalContentToLogicalMapForModelId:fromMapData:", v13);
          }
          id v12 = (id)[location[0] URLByAppendingPathComponent:v71];
          id v50 = (id)[v12 URLByAppendingPathExtension:@"mlmodelc"];

          id v49 = objc_alloc_init(MEMORY[0x263F00D98]);
          [v49 setComputeUnits:0];
          id v48 = (id)[MEMORY[0x263F00D80] modelWithContentsOfURL:v50 configuration:v49 error:v69];
          if (*v69)
          {
            id v9 = NSString;
            id v11 = (id)[v50 path];
            id v10 = (id)[*v69 localizedDescription];
            id v47 = (id)[v9 stringWithFormat:@"Error while loading the model from %@: %@", v11, v10];

            os_log_t v46 = (os_log_t)&_os_log_internal;
            os_log_type_t v45 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            {
              __os_log_helper_16_2_1_8_64((uint64_t)v75, (uint64_t)v47);
              _os_log_error_impl(&dword_20ABD4000, v46, v45, "%@", v75, 0xCu);
            }
            objc_storeStrong((id *)&v46, 0);
            *id v69 = +[AMDError allocError:16 withMessage:v47];
            id v8 = (id)[*v69 localizedDescription];
            +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:");

            int v62 = 1;
            objc_storeStrong(&v47, 0);
          }
          else if (v48)
          {
            int v62 = 0;
          }
          else
          {
            id v44 = (id)[NSString stringWithFormat:@"ML model loaded incorrectly. Nil value returned"];
            os_log_t v43 = (os_log_t)&_os_log_internal;
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              __os_log_helper_16_2_1_8_64((uint64_t)v74, (uint64_t)v44);
              _os_log_error_impl(&dword_20ABD4000, v43, OS_LOG_TYPE_ERROR, "%@", v74, 0xCu);
            }
            objc_storeStrong((id *)&v43, 0);
            *id v69 = +[AMDError allocError:16 withMessage:v44];
            id v7 = (id)[*v69 localizedDescription];
            +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:");

            int v62 = 1;
            objc_storeStrong(&v44, 0);
          }
          objc_storeStrong(&v48, 0);
          objc_storeStrong(&v49, 0);
          objc_storeStrong(&v50, 0);
        }
        objc_storeStrong(&v54, 0);
      }
      objc_storeStrong(&v58, 0);
    }
    else
    {
      id v29 = NSString;
      id v30 = (id)[location[0] path];
      id v61 = (id)[v29 stringWithFormat:@"Invalid model metadata from filepath: %@", v30];

      id v60 = &_os_log_internal;
      os_log_type_t v59 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v60, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v78, (uint64_t)v61);
        _os_log_error_impl(&dword_20ABD4000, (os_log_t)v60, v59, "%@", v78, 0xCu);
      }
      objc_storeStrong(&v60, 0);
      *id v69 = +[AMDError allocError:16 withMessage:v61];
      id v28 = (id)[*v69 localizedDescription];
      +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:");

      int v62 = 1;
      objc_storeStrong(&v61, 0);
    }
  }
  objc_storeStrong(&v68, 0);
  objc_storeStrong(&v70, 0);
  objc_storeStrong(&v71, 0);
  objc_storeStrong(location, 0);
}

+ (void)deleteModelFromStorage:(id)a3 isVersionChange:(BOOL)a4 error:(id *)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v19 = a4;
  id v18 = a5;
  id v17 = (id)[MEMORY[0x263F08850] defaultManager];
  id v8 = NSURL;
  id v9 = (id)[location[0] objectForKey:0x26BEB09F8];
  id v16 = (id)objc_msgSend(v8, "fileURLWithPath:");

  id v15 = (id)[location[0] objectForKey:0x26BEAE8D8];
  if (a4)
  {
    id v14 = (id)[v16 URLByDeletingLastPathComponent];
    if (([v17 removeItemAtURL:v14 error:v18] & 1) != 0 && !*v18)
    {
      os_log_t oslog = (os_log_t)&_os_log_internal;
      os_log_type_t type = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v22, (uint64_t)v15, (uint64_t)v14);
        _os_log_impl(&dword_20ABD4000, oslog, type, "Deleted directory for modelId '%@': %@", v22, 0x16u);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    objc_storeStrong(&v14, 0);
  }
  else
  {
    id v5 = (id)[v16 URLByDeletingLastPathComponent];
    id v11 = (id)[v5 URLByDeletingLastPathComponent];

    if (([v17 removeItemAtURL:v11 error:v18] & 1) != 0 && !*v18)
    {
      os_log_t v10 = (os_log_t)&_os_log_internal;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v21, (uint64_t)v15, (uint64_t)v11);
        _os_log_impl(&dword_20ABD4000, v10, OS_LOG_TYPE_INFO, "Deleted directory for modelId '%@': %@", v21, 0x16u);
      }
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

+ (void)deleteColdstartBinaryFromStorage:(id)a3 forModel:(id)a4 isVersionChange:(BOOL)a5 error:(id *)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v25 = 0;
  objc_storeStrong(&v25, a4);
  BOOL v24 = a5;
  uint64_t v23 = a6;
  id v22 = (id)[MEMORY[0x263F08850] defaultManager];
  id v21 = (id)[NSURL fileURLWithPath:location[0]];
  if (a5)
  {
    id v8 = (id)[v21 URLByDeletingLastPathComponent];
    id v20 = (id)[v8 URLByDeletingLastPathComponent];

    if (([v22 removeItemAtURL:v20 error:v23] & 1) != 0 && !*v23)
    {
      os_log_t oslog = (os_log_t)&_os_log_internal;
      os_log_type_t type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v30, (uint64_t)v25, (uint64_t)v20);
        _os_log_error_impl(&dword_20ABD4000, oslog, type, "Deleted directory for modelId '%@': %@", v30, 0x16u);
      }
      objc_storeStrong((id *)&oslog, 0);
      os_log_t v17 = (os_log_t)&_os_log_internal;
      os_log_type_t v16 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v29, (uint64_t)v25, (uint64_t)v20);
        _os_log_impl(&dword_20ABD4000, v17, v16, "Deleted directory for modelId '%@': %@", v29, 0x16u);
      }
      objc_storeStrong((id *)&v17, 0);
    }
    objc_storeStrong(&v20, 0);
  }
  else
  {
    id v7 = (id)[v21 URLByDeletingLastPathComponent];
    id v6 = (id)[v7 URLByDeletingLastPathComponent];
    id v15 = (id)[v6 URLByDeletingLastPathComponent];

    if (([v22 removeItemAtURL:v15 error:v23] & 1) != 0 && !*v23)
    {
      os_log_t v14 = (os_log_t)&_os_log_internal;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v28, (uint64_t)v25, (uint64_t)v15);
        _os_log_error_impl(&dword_20ABD4000, v14, v13, "Deleted directory for modelId '%@': %@", v28, 0x16u);
      }
      objc_storeStrong((id *)&v14, 0);
      os_log_t v12 = (os_log_t)&_os_log_internal;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v27, (uint64_t)v25, (uint64_t)v15);
        _os_log_impl(&dword_20ABD4000, v12, OS_LOG_TYPE_INFO, "Deleted directory for modelId '%@': %@", v27, 0x16u);
      }
      objc_storeStrong((id *)&v12, 0);
    }
    objc_storeStrong(&v15, 0);
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
}

+ (id)removeOldModels:(id)a3
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v57 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v55 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v29 = objc_alloc(MEMORY[0x263EFF980]);
  id v54 = (id)objc_msgSend(v29, "initWithCapacity:", objc_msgSend(location[0], "count"));
  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  uint64_t v31 = [obj countByEnumeratingWithState:__b objects:v66 count:16];
  if (v31)
  {
    uint64_t v26 = *(void *)__b[2];
    uint64_t v27 = 0;
    unint64_t v28 = v31;
    while (1)
    {
      uint64_t v25 = v27;
      if (*(void *)__b[2] != v26) {
        objc_enumerationMutation(obj);
      }
      id v53 = *(id *)(__b[1] + 8 * v27);
      id v51 = 0;
      id v50 = (id)[v53 objectForKey:0x26BEAE8D8];
      id v49 = v51;
      [v57 deleteModelFromStorage:v53 isVersionChange:0 error:&v49];
      objc_storeStrong(&v51, v49);
      if (v51)
      {
        id v20 = NSURL;
        id v21 = (id)[v53 objectForKey:0x26BEB09F8];
        id v48 = (id)objc_msgSend(v20, "fileURLWithPath:");

        id v47 = (id)[v48 URLByDeletingLastPathComponent];
        uint64_t v23 = NSString;
        id v22 = v47;
        id v24 = (id)[v51 localizedDescription];
        id v46 = (id)[v23 stringWithFormat:@"Error deleting directory '%@': %@", v22, v24];

        os_log_t oslog = (os_log_t)&_os_log_internal;
        os_log_type_t type = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          log = oslog;
          os_log_type_t v19 = type;
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v65, (uint64_t)v50, (uint64_t)v46);
          _os_log_error_impl(&dword_20ABD4000, log, v19, "'%@': %@", v65, 0x16u);
        }
        objc_storeStrong((id *)&oslog, 0);
        [v55 setObject:v46 forKey:v50];
        int v43 = 3;
        objc_storeStrong(&v46, 0);
        objc_storeStrong(&v47, 0);
        objc_storeStrong(&v48, 0);
      }
      else
      {
        id v42 = 0;
        id v3 = +[AMDWorkflow deleteWorkflowsForModelId:v50 error:&v42];
        objc_storeStrong(&v51, v42);
        if (v51)
        {
          os_log_type_t v16 = NSString;
          id v17 = (id)[v51 localizedDescription];
          id v41 = (id)[v16 stringWithFormat:@"Error deleting workflows: %@", v17];

          os_log_t v40 = (os_log_t)&_os_log_internal;
          os_log_type_t v39 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            os_log_t v14 = v40;
            os_log_type_t v15 = v39;
            __os_log_helper_16_2_2_8_64_8_64((uint64_t)v64, (uint64_t)v50, (uint64_t)v41);
            _os_log_error_impl(&dword_20ABD4000, v14, v15, "'%@': %@", v64, 0x16u);
          }
          objc_storeStrong((id *)&v40, 0);
          [v55 setObject:v41 forKey:v50];
          int v43 = 3;
          objc_storeStrong(&v41, 0);
        }
        else
        {
          os_log_t v38 = (os_log_t)&_os_log_internal;
          os_log_type_t v37 = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            os_log_t v12 = v38;
            os_log_type_t v13 = v37;
            __os_log_helper_16_2_1_8_64((uint64_t)v63, (uint64_t)v50);
            _os_log_debug_impl(&dword_20ABD4000, v12, v13, "Deleted workflow for modelId '%@'", v63, 0xCu);
          }
          objc_storeStrong((id *)&v38, 0);
          id v62 = v53;
          id v11 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v62 count:1];
          id v36 = v51;
          +[AMDModel deleteModels:error:](AMDModel, "deleteModels:error:");
          objc_storeStrong(&v51, v36);

          if (v51)
          {
            id v9 = NSString;
            id v10 = (id)[v51 localizedDescription];
            id v35 = (id)[v9 stringWithFormat:@"Error deleting AMDModel: %@", v10];

            os_log_t v34 = (os_log_t)&_os_log_internal;
            os_log_type_t v33 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              id v7 = v34;
              os_log_type_t v8 = v33;
              __os_log_helper_16_2_2_8_64_8_64((uint64_t)v61, (uint64_t)v50, (uint64_t)v35);
              _os_log_error_impl(&dword_20ABD4000, v7, v8, "'%@': %@", v61, 0x16u);
            }
            objc_storeStrong((id *)&v34, 0);
            [v55 setObject:v35 forKey:v50];
            int v43 = 3;
            objc_storeStrong(&v35, 0);
          }
          else
          {
            os_log_t v32 = (os_log_t)&_os_log_internal;
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            {
              id v6 = v32;
              __os_log_helper_16_2_1_8_64((uint64_t)v60, (uint64_t)v50);
              _os_log_debug_impl(&dword_20ABD4000, v6, OS_LOG_TYPE_DEBUG, "Deleted model url for modelId '%@'", v60, 0xCu);
            }
            objc_storeStrong((id *)&v32, 0);
            [v54 addObject:v50];
            int v43 = 0;
          }
        }
      }
      objc_storeStrong(&v50, 0);
      objc_storeStrong(&v51, 0);
      ++v27;
      if (v25 + 1 >= v28)
      {
        uint64_t v27 = 0;
        unint64_t v28 = [obj countByEnumeratingWithState:__b objects:v66 count:16];
        if (!v28) {
          break;
        }
      }
    }
  }

  v58[0] = @"deleted";
  v59[0] = v54;
  v58[1] = @"failures";
  v59[1] = v55;
  id v5 = (id)[NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:2];
  int v43 = 1;
  objc_storeStrong(&v54, 0);
  objc_storeStrong(&v55, 0);
  objc_storeStrong(location, 0);

  return v5;
}

+ (id)removeOldColdstartBinaries:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v37 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v35 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v18 = objc_alloc(MEMORY[0x263EFF980]);
  id v34 = (id)objc_msgSend(v18, "initWithCapacity:", objc_msgSend(location[0], "count"));
  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  uint64_t v20 = [obj countByEnumeratingWithState:__b objects:v43 count:16];
  if (v20)
  {
    uint64_t v15 = *(void *)__b[2];
    uint64_t v16 = 0;
    unint64_t v17 = v20;
    while (1)
    {
      uint64_t v14 = v16;
      if (*(void *)__b[2] != v15) {
        objc_enumerationMutation(obj);
      }
      id v33 = *(id *)(__b[1] + 8 * v16);
      id v31 = 0;
      id v30 = (id)[v33 objectForKey:0x26BEAE8D8];
      id v29 = (id)[v33 objectForKey:0x26BEB09F8];
      id v28 = v31;
      [v37 deleteColdstartBinaryFromStorage:v29 forModel:v30 isVersionChange:0 error:&v28];
      objc_storeStrong(&v31, v28);
      if (v31)
      {
        os_log_t v12 = NSString;
        id v11 = v29;
        id v13 = (id)[v31 localizedDescription];
        id v27 = (id)[v12 stringWithFormat:@"Error deleting directory '%@': %@", v11, v13];

        os_log_t oslog = (os_log_t)&_os_log_internal;
        os_log_type_t type = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          log = oslog;
          os_log_type_t v10 = type;
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v42, (uint64_t)v30, (uint64_t)v27);
          _os_log_error_impl(&dword_20ABD4000, log, v10, "'%@': %@", v42, 0x16u);
        }
        objc_storeStrong((id *)&oslog, 0);
        [v35 setObject:v27 forKey:v30];
        int v24 = 3;
        objc_storeStrong(&v27, 0);
      }
      else
      {
        id v41 = v33;
        id v8 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v41 count:1];
        id v23 = v31;
        +[AMDColdstartURL deleteColdstartURLs:error:](AMDColdstartURL, "deleteColdstartURLs:error:");
        objc_storeStrong(&v31, v23);

        if (v31)
        {
          id v6 = NSString;
          id v7 = (id)[v31 localizedDescription];
          id v22 = (id)[v6 stringWithFormat:@"Error deleting AMDColdstartBinary: %@", v7];

          os_log_t v21 = (os_log_t)&_os_log_internal;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            id v5 = v21;
            __os_log_helper_16_2_2_8_64_8_64((uint64_t)v40, (uint64_t)v30, (uint64_t)v22);
            _os_log_error_impl(&dword_20ABD4000, v5, OS_LOG_TYPE_ERROR, "'%@': %@", v40, 0x16u);
          }
          objc_storeStrong((id *)&v21, 0);
          [v35 setObject:v22 forKey:v30];
          int v24 = 3;
          objc_storeStrong(&v22, 0);
        }
        else
        {
          [v34 addObject:v30];
          int v24 = 0;
        }
      }
      objc_storeStrong(&v29, 0);
      objc_storeStrong(&v30, 0);
      objc_storeStrong(&v31, 0);
      ++v16;
      if (v14 + 1 >= v17)
      {
        uint64_t v16 = 0;
        unint64_t v17 = [obj countByEnumeratingWithState:__b objects:v43 count:16];
        if (!v17) {
          break;
        }
      }
    }
  }

  v38[0] = @"deleted";
  v39[0] = v34;
  v38[1] = @"failures";
  v39[1] = v35;
  id v4 = (id)[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];
  int v24 = 1;
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);

  return v4;
}

@end