@interface AMDClient
- (NSString)dsId;
- (id)appSegmentData:(id)a3 completion:(id)a4;
- (id)callDebugEvent:(id)a3 withPayload:(id)a4;
- (id)callback;
- (id)getFeature:(id)a3;
- (id)getFeatureStub:(id)a3;
- (id)getModelPath:(id)a3 error:(id *)a4;
- (id)getModelPathForUsecase:(id)a3 withTreatmentId:(id)a4 inDomain:(id)a5 error:(id *)a6;
- (id)getMusicModelPathForUsecase:(id)a3 withTreatmentId:(id)a4 error:(id *)a5;
- (id)sendBatchedPECSimilarityScores:(id)a3 withCallHandle:(id)a4 andRequestError:(id)a5 error:(id *)a6;
- (id)sendBatchedPIRData:(id)a3 forKeywords:(id)a4 withCallHandle:(id)a5 andRequestError:(id)a6 error:(id *)a7;
- (id)sendPECSimilarityScores:(id)a3 withCallHandle:(id)a4 andRequestError:(id)a5 error:(id *)a6;
- (id)sendPIRData:(id)a3 forKeyword:(id)a4 withCallHandle:(id)a5 andRequestError:(id)a6 error:(id *)a7;
- (id)sendPIRData:(id)a3 forKeyword:(id)a4 withCallHandle:(id)a5 error:(id *)a6;
- (void)callIAESegmentNotificationHandler;
- (void)clearDataForDSID:(id)a3 completion:(id)a4;
- (void)fetchAppSegments:(id)a3 completion:(id)a4;
- (void)getAppSegmentDataWithRequest:(id)a3 completion:(id)a4;
- (void)iaeSegmentNotificationHandler:(id)a3;
- (void)setCallback:(id)a3;
- (void)setDsId:(id)a3;
- (void)subscribeToSegmentNotificationWithCallback:(id)a3 forAccountDSID:(id)a4;
- (void)unsubscribeFromSegmentNotification;
@end

@implementation AMDClient

- (id)callDebugEvent:(id)a3 withPayload:(id)a4
{
  v23[5] = *MEMORY[0x263EF8340];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  id v16 = objc_alloc_init(AMDAMSEngagementEvent);
  v22[0] = @"action";
  v23[0] = @"amd.debug";
  v22[1] = @"dsid";
  v23[1] = @"1";
  v22[2] = @"storefrontId";
  v23[2] = @"2";
  v22[3] = @"event";
  v23[3] = location[0];
  v22[4] = @"testPayload";
  v23[4] = v17;
  id v9 = (id)[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:5];
  objc_msgSend(v16, "setEngagementData:");

  id v15 = objc_alloc_init(MEMORY[0x263F27C28]);
  id v14 = (id)[v15 enqueueEvent:v16];
  id v13 = 0;
  id v11 = 0;
  id v10 = (id)[v14 resultWithError:&v11];
  objc_storeStrong(&v13, v11);
  id v12 = v10;
  if (v13)
  {
    v20 = @"error";
    id v7 = (id)[v13 localizedDescription];
    id v21 = v7;
    id v19 = (id)[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  }
  else if (v12)
  {
    id v6 = (id)[v12 data];
    id v19 = (id)[v6 objectForKey:@"response"];
  }
  else
  {
    id v19 = &unk_26BEC2620;
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  v4 = v19;

  return v4;
}

- (id)getFeatureStub:(id)a3
{
  v64[2] = *MEMORY[0x263EF8340];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v26 = (id)[location[0] featureName];
  char v27 = [v26 isEqual:@"testFeatureList"];

  if (v27)
  {
    v63[0] = @"status";
    v64[0] = @"OK";
    v63[1] = @"data";
    v64[1] = &unk_26BEC33D8;
    id v38 = (id)[NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:2];
    int v36 = 1;
  }
  else
  {
    id v24 = (id)[location[0] featureName];
    char v25 = [v24 isEqual:@"testFeatureDict"];

    if (v25)
    {
      v61[0] = @"status";
      v62[0] = @"OK";
      v61[1] = @"data";
      v62[1] = &unk_26BEC2648;
      id v38 = (id)[NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:2];
      int v36 = 1;
    }
    else
    {
      id v22 = (id)[location[0] featureName];
      char v23 = [v22 isEqual:@"testFeatureDictLongKey"];

      if (v23)
      {
        v59[0] = @"status";
        v60[0] = @"OK";
        v59[1] = @"data";
        v57[0] = &unk_26BEC1898;
        v58[0] = &unk_26BEC3760;
        v57[1] = &unk_26BEC18B0;
        v58[1] = &unk_26BEC3770;
        id v21 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v58, v57);
        v60[1] = v21;
        id v38 = (id)[NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:2];

        int v36 = 1;
      }
      else
      {
        id v19 = (id)[location[0] featureName];
        char v20 = [v19 isEqual:@"testFeatureDictFloatKey"];

        if (v20)
        {
          v55[0] = @"status";
          v56[0] = @"OK";
          v55[1] = @"data";
          v53[0] = &unk_26BEC3760;
          v54[0] = &unk_26BEC3760;
          v53[1] = &unk_26BEC3770;
          v54[1] = &unk_26BEC3770;
          id v18 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v54, v53);
          v56[1] = v18;
          id v38 = (id)[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:2];

          int v36 = 1;
        }
        else
        {
          id v16 = (id)[location[0] featureName];
          char v17 = [v16 isEqual:@"dictOfArrays"];

          if (v17)
          {
            v51[0] = @"status";
            v52[0] = @"OK";
            v51[1] = @"data";
            v52[1] = &unk_26BEC2670;
            id v38 = (id)[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:2];
            int v36 = 1;
          }
          else
          {
            id v14 = (id)[location[0] featureName];
            char v15 = [v14 isEqual:@"dictOfDicts"];

            if (v15)
            {
              v49[0] = @"status";
              v50[0] = @"OK";
              v49[1] = @"data";
              v50[1] = &unk_26BEC26E8;
              id v38 = (id)[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:2];
              int v36 = 1;
            }
            else
            {
              id v12 = (id)[location[0] featureName];
              char v13 = [v12 isEqual:@"dictOfDictsWithString"];

              if (v13)
              {
                v47[0] = @"status";
                v48[0] = @"OK";
                v47[1] = @"data";
                v48[1] = &unk_26BEC2760;
                id v38 = (id)[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:2];
                int v36 = 1;
              }
              else
              {
                id v10 = (id)[location[0] featureName];
                char v11 = [v10 isEqual:@"98apps"];

                if (v11)
                {
                  id v35 = (id)[MEMORY[0x263EFF980] array];
                  for (int i = 0; i < 50; ++i)
                  {
                    id v9 = (id)[NSNumber numberWithInt:(10 * i)];
                    objc_msgSend(v35, "addObject:");
                  }
                  v45[0] = @"status";
                  v46[0] = @"OK";
                  v45[1] = @"data";
                  v46[1] = v35;
                  id v38 = (id)[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
                  int v36 = 1;
                  objc_storeStrong(&v35, 0);
                }
                else
                {
                  id v7 = (id)[location[0] featureName];
                  char v8 = [v7 hasPrefix:@"purchase_id"];

                  if (v8)
                  {
                    id v33 = objc_alloc_init(MEMORY[0x263EFF980]);
                    for (int j = 0; j < 500; ++j)
                    {
                      id v31 = (id)[NSNumber numberWithInt:arc4random() % 0x9C40];
                      [v33 addObject:v31];
                      objc_storeStrong(&v31, 0);
                    }
                    v43[0] = @"status";
                    v44[0] = @"OK";
                    v43[1] = @"data";
                    v44[1] = v33;
                    id v38 = (id)[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];
                    int v36 = 1;
                    objc_storeStrong(&v33, 0);
                  }
                  else
                  {
                    id v5 = (id)[location[0] featureName];
                    char v6 = [v5 hasPrefix:@"label"];

                    if (v6)
                    {
                      id v30 = objc_alloc_init(MEMORY[0x263EFF980]);
                      for (int k = 0; k < 500; ++k)
                      {
                        id v28 = (id)[NSNumber numberWithInt:arc4random() % 0x78];
                        [v30 addObject:v28];
                        objc_storeStrong(&v28, 0);
                      }
                      v41[0] = @"status";
                      v42[0] = @"OK";
                      v41[1] = @"data";
                      v42[1] = v30;
                      id v38 = (id)[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];
                      int v36 = 1;
                      objc_storeStrong(&v30, 0);
                    }
                    else
                    {
                      v39[0] = @"status";
                      v40[0] = @"executionError";
                      v39[1] = @"error";
                      v40[1] = @"Execution error";
                      id v38 = (id)[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
                      int v36 = 1;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  objc_storeStrong(location, 0);
  v3 = v38;

  return v3;
}

- (id)getFeature:(id)a3
{
  v24[2] = *MEMORY[0x263EF8340];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = objc_alloc_init(MEMORY[0x263F27C28]);
  id v8 = (id)[location[0] getAMSRequest];
  id v15 = (id)objc_msgSend(v16, "enqueueEvent:");

  id v14 = 0;
  obint j = 0;
  id v9 = (id)[v15 resultWithError:&obj];
  objc_storeStrong(&v14, obj);
  id v13 = v9;
  if (v14)
  {
    v23[0] = @"status";
    v24[0] = @"executionError";
    v23[1] = @"error";
    id v7 = (id)[v14 localizedDescription];
    v24[1] = v7;
    id v18 = (id)[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];

    int v11 = 1;
  }
  else
  {
    id v6 = (id)[v13 data];
    id v5 = (id)[v6 objectForKey:@"response"];
    id v10 = (id)[v5 objectForKey:@"featureData"];

    if (v10)
    {
      v19[0] = @"status";
      v20[0] = @"OK";
      v19[1] = @"data";
      v20[1] = v10;
      id v18 = (id)[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
    }
    else
    {
      v21[0] = @"status";
      v22[0] = @"executionError";
      v21[1] = @"error";
      v22[1] = @"Null feature response";
      id v18 = (id)[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    }
    int v11 = 1;
    objc_storeStrong(&v10, 0);
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  v3 = v18;

  return v3;
}

- (void)clearDataForDSID:(id)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v24 = 0;
  objc_storeStrong(&v24, a4);
  id v23 = objc_alloc_init(MEMORY[0x263F27C28]);
  v4 = [AMDClientRequestEvent alloc];
  id v22 = [(AMDClientRequestEvent *)v4 initClearUserDataFor:location[0] inDomain:@"apps"];
  id v10 = (id)[v22 getAMSRequest];
  id v21 = (id)objc_msgSend(v23, "enqueueEvent:");

  id v20 = 0;
  id v18 = 0;
  id v11 = (id)[v21 resultWithError:&v18];
  objc_storeStrong(&v20, v18);
  id v19 = v11;
  if (v20)
  {
    id v17 = &_os_log_internal;
    os_log_type_t v16 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
    {
      id v8 = (id)[v20 localizedDescription];
      __os_log_helper_16_2_1_8_64((uint64_t)v27, (uint64_t)v8);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)v17, v16, "Error clearing user data: %@", v27, 0xCu);
    }
    objc_storeStrong(&v17, 0);
    (*((void (**)(id, void, id))v24 + 2))(v24, 0, v20);
    int v15 = 1;
  }
  else
  {
    id v7 = (id)[v19 data];
    id v14 = (id)[v7 objectForKey:@"response"];

    if (v14)
    {
      NSLog(&cfstr_ClearUserDataS.isa, v14);
      (*((void (**)(id, uint64_t, void))v24 + 2))(v24, 1, 0);
      int v15 = 0;
    }
    else
    {
      id v13 = @"Nil clear user data response";
      id v12 = &_os_log_internal;
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v26, (uint64_t)v13);
        _os_log_error_impl(&dword_20ABD4000, (os_log_t)v12, OS_LOG_TYPE_ERROR, "%@", v26, 0xCu);
      }
      objc_storeStrong(&v12, 0);
      id v5 = (void (**)(id, void))v24;
      id v6 = +[AMDError allocError:16 withMessage:v13];
      v5[2](v5, 0);

      int v15 = 1;
      objc_storeStrong((id *)&v13, 0);
    }
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
}

- (void)getAppSegmentDataWithRequest:(id)a3 completion:(id)a4
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (id)appSegmentData:(id)a3 completion:(id)a4
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return 0;
}

- (void)fetchAppSegments:(id)a3 completion:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v47 = 0;
  objc_storeStrong(&v47, a4);
  id v46 = objc_alloc_init(MEMORY[0x263F27C28]);
  id v27 = (id)[location[0] getAMSRequest];
  id v45 = (id)objc_msgSend(v46, "enqueueEvent:");

  id v44 = 0;
  id v42 = 0;
  id v28 = (id)[v45 resultWithError:&v42];
  objc_storeStrong(&v44, v42);
  id v43 = v28;
  if (v44)
  {
    id v41 = &_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_ERROR))
    {
      log = v41;
      os_log_type_t v24 = type;
      id v25 = (id)[v44 localizedDescription];
      id v39 = v25;
      __os_log_helper_16_2_1_8_64((uint64_t)v50, (uint64_t)v39);
      _os_log_error_impl(&dword_20ABD4000, log, v24, "error retrieving segment data: %@", v50, 0xCu);

      objc_storeStrong(&v39, 0);
    }
    objc_storeStrong(&v41, 0);
    (*((void (**)(id, void, id))v47 + 2))(v47, 0, v44);
    int v38 = 1;
  }
  else
  {
    id v22 = (id)[v43 data];
    id v37 = (id)[v22 objectForKey:@"response"];

    if (v37)
    {
      id v36 = (id)[v37 objectForKey:@"segmentDataType"];
      if (v36 && ![v36 unsignedIntValue])
      {
        id v35 = (id)[v37 objectForKey:@"segmentData"];
        if (v35)
        {
          id v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v35, "count"));
          memset(__b, 0, sizeof(__b));
          id v14 = v35;
          uint64_t v15 = [v14 countByEnumeratingWithState:__b objects:v49 count:16];
          if (v15)
          {
            uint64_t v11 = *(void *)__b[2];
            uint64_t v12 = 0;
            unint64_t v13 = v15;
            while (1)
            {
              uint64_t v10 = v12;
              if (*(void *)__b[2] != v11) {
                objc_enumerationMutation(v14);
              }
              uint64_t v33 = *(void *)(__b[1] + 8 * v12);
              id v6 = (void *)MEMORY[0x263EFFA08];
              id v7 = (id)[v35 objectForKey:v33];
              id v31 = (id)objc_msgSend(v6, "setWithArray:");

              id v8 = v34;
              v4 = [AMDAppSegmentInfo alloc];
              id v9 = [(AMDAppSegmentInfo *)v4 initWithAppIdentifier:v33 andSegments:v31];
              objc_msgSend(v8, "addObject:");

              objc_storeStrong(&v31, 0);
              ++v12;
              if (v10 + 1 >= v13)
              {
                uint64_t v12 = 0;
                unint64_t v13 = [v14 countByEnumeratingWithState:__b objects:v49 count:16];
                if (!v13) {
                  break;
                }
              }
            }
          }

          id v30 = (id)[v37 objectForKey:@"metadata"];
          id v5 = [AMDFetchAppSegmentsResponse alloc];
          uint64_t v29 = [(AMDFetchAppSegmentsResponse *)v5 initWithSegmentInfo:v34 ofType:v36 andMetaData:v30];
          (*((void (**)(id, uint64_t))v47 + 2))(v47, v29);
          objc_storeStrong((id *)&v29, 0);
          objc_storeStrong(&v30, 0);
          objc_storeStrong(&v34, 0);
          int v38 = 0;
        }
        else
        {
          os_log_type_t v16 = (void (**)(id, void))v47;
          id v17 = +[AMDError allocError:16 withMessage:@"Null response data"];
          v16[2](v16, 0);

          int v38 = 1;
        }
        objc_storeStrong(&v35, 0);
      }
      else
      {
        id v18 = (void (**)(id, void))v47;
        id v19 = +[AMDError allocError:16 withMessage:@"Unexpected response type"];
        v18[2](v18, 0);

        int v38 = 1;
      }
      objc_storeStrong(&v36, 0);
    }
    else
    {
      id v20 = (void (**)(id, void))v47;
      id v21 = +[AMDError allocError:16 withMessage:@"Null segment response"];
      v20[2](v20, 0);

      int v38 = 1;
    }
    objc_storeStrong(&v37, 0);
  }
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(location, 0);
}

- (void)iaeSegmentNotificationHandler:(id)a3
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  v59 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v57 = (id)[location[0] name];
  id v56 = (id)[location[0] userInfo];
  os_log_t oslog = (os_log_t)&_os_log_internal;
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v65, (uint64_t)v57, (uint64_t)v56);
    _os_log_debug_impl(&dword_20ABD4000, oslog, type, "IAE segment notification: name: %@ userInfo: %@", v65, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v3 = [(AMDClient *)v59 dsId];
  BOOL v30 = v3 != 0;

  if (!v30)
  {
    v53 = @"Programmer error: no dsId, dropping IAE segments notification";
    os_log_t v52 = (os_log_t)&_os_log_internal;
    os_log_type_t v51 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v64, (uint64_t)v53);
      _os_log_debug_impl(&dword_20ABD4000, v52, v51, "%@", v64, 0xCu);
    }
    objc_storeStrong((id *)&v52, 0);
    uint64_t v29 = (void (**)(id, void))[(AMDClient *)v59 callback];
    id v28 = +[AMDError allocError:28 withMessage:v53];
    v29[2](v29, 0);

    objc_storeStrong((id *)&v53, 0);
  }
  id v4 = [(AMDClient *)v59 callback];
  BOOL v27 = v4 != 0;

  if (!v27)
  {
    v50 = @"Programmer error: no callback, dropping IAE segments notification";
    os_log_t v49 = (os_log_t)&_os_log_internal;
    os_log_type_t v48 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v63, (uint64_t)v50);
      _os_log_debug_impl(&dword_20ABD4000, v49, v48, "%@", v63, 0xCu);
    }
    objc_storeStrong((id *)&v49, 0);
    id v26 = (void (**)(id, void))[(AMDClient *)v59 callback];
    id v25 = +[AMDError allocError:28 withMessage:v50];
    v26[2](v26, 0);

    objc_storeStrong((id *)&v50, 0);
  }
  id v47 = (id)[v56 objectForKey:@"dsId"];
  char v45 = 0;
  LOBYTE(v24) = 1;
  if (v47)
  {
    id v46 = [(AMDClient *)v59 dsId];
    char v45 = 1;
    int v24 = objc_msgSend(v47, "isEqualToString:") ^ 1;
  }
  if (v45) {

  }
  if (v24)
  {
    id v22 = NSString;
    id v23 = [(AMDClient *)v59 dsId];
    id v44 = (id)[v22 stringWithFormat:@"Programmer error: dsId mismatch: payload: %@, expected: %@", v47, v23];

    os_log_t v43 = (os_log_t)&_os_log_internal;
    os_log_type_t v42 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v62, (uint64_t)v44);
      _os_log_debug_impl(&dword_20ABD4000, v43, v42, "%@", v62, 0xCu);
    }
    objc_storeStrong((id *)&v43, 0);
    id v21 = (void (**)(id, void))[(AMDClient *)v59 callback];
    id v20 = +[AMDError allocError:28 withMessage:v44];
    v21[2](v21, 0);

    objc_storeStrong(&v44, 0);
  }
  id v41 = (id)[v56 objectForKey:@"segmentDataType"];
  if (!v41 || [v41 unsignedIntValue])
  {
    id v40 = (id)[NSString stringWithFormat:@"Programmer error: Unexpected response type in IAE segments notification: %@", v41];
    os_log_t v39 = (os_log_t)&_os_log_internal;
    os_log_type_t v38 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v61, (uint64_t)v40);
      _os_log_debug_impl(&dword_20ABD4000, v39, v38, "%@", v61, 0xCu);
    }
    objc_storeStrong((id *)&v39, 0);
    id v19 = (void (**)(id, void))[(AMDClient *)v59 callback];
    id v18 = +[AMDError allocError:28 withMessage:v40];
    v19[2](v19, 0);

    objc_storeStrong(&v40, 0);
  }
  id v37 = (id)[v56 objectForKey:@"segmentData"];
  id v36 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v37, "count"));
  memset(__b, 0, sizeof(__b));
  id v16 = v37;
  uint64_t v17 = [v16 countByEnumeratingWithState:__b objects:v60 count:16];
  if (v17)
  {
    uint64_t v13 = *(void *)__b[2];
    uint64_t v14 = 0;
    unint64_t v15 = v17;
    while (1)
    {
      uint64_t v12 = v14;
      if (*(void *)__b[2] != v13) {
        objc_enumerationMutation(v16);
      }
      uint64_t v35 = *(void *)(__b[1] + 8 * v14);
      id v8 = (void *)MEMORY[0x263EFFA08];
      id v9 = (id)[v37 objectForKey:v35];
      id v33 = (id)objc_msgSend(v8, "setWithArray:");

      id v10 = v36;
      id v5 = [AMDAppSegmentInfo alloc];
      uint64_t v11 = [(AMDAppSegmentInfo *)v5 initWithAppIdentifier:v35 andSegments:v33];
      objc_msgSend(v10, "addObject:");

      objc_storeStrong(&v33, 0);
      ++v14;
      if (v12 + 1 >= v15)
      {
        uint64_t v14 = 0;
        unint64_t v15 = [v16 countByEnumeratingWithState:__b objects:v60 count:16];
        if (!v15) {
          break;
        }
      }
    }
  }

  id v32 = (id)[v56 objectForKey:@"metadata"];
  id v6 = [AMDFetchAppSegmentsResponse alloc];
  uint64_t v31 = [(AMDFetchAppSegmentsResponse *)v6 initWithSegmentInfo:v36 ofType:v41 andMetaData:v32];
  id v7 = (void (**)(id, uint64_t))[(AMDClient *)v59 callback];
  v7[2](v7, v31);

  objc_storeStrong((id *)&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v56, 0);
  objc_storeStrong(&v57, 0);
  objc_storeStrong(location, 0);
}

- (void)subscribeToSegmentNotificationWithCallback:(id)a3 forAccountDSID:(id)a4
{
  uint64_t v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  [(AMDClient *)v17 setDsId:v15];
  [(AMDClient *)v17 setCallback:location[0]];
  id v14 = (id)[MEMORY[0x263F087C8] defaultCenter];
  id v6 = v14;
  id v7 = (id)[MEMORY[0x263F08A48] currentQueue];
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  uint64_t v11 = __71__AMDClient_subscribeToSegmentNotificationWithCallback_forAccountDSID___block_invoke;
  uint64_t v12 = &unk_263FE20F0;
  uint64_t v13 = v17;
  id v4 = (id)objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", @"com.apple.AppleMediaDiscovery.IAESegmentNotification", 0, v7);

  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

void __71__AMDClient_subscribeToSegmentNotificationWithCallback_forAccountDSID___block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [a1[4] iaeSegmentNotificationHandler:location[0]];
  objc_storeStrong(location, 0);
}

- (void)unsubscribeFromSegmentNotification
{
  v3 = self;
  v2[1] = (id)a2;
  v2[0] = (id)[MEMORY[0x263F087C8] defaultCenter];
  objc_msgSend(v2[0], "removeObserver:name:object:", v3, @"com.apple.AppleMediaDiscovery.IAESegmentNotification");
  objc_storeStrong(v2, 0);
}

- (void)callIAESegmentNotificationHandler
{
  v3 = self;
  v2[1] = (id)a2;
  v2[0] = (id)objc_msgSend(objc_alloc(MEMORY[0x263F089F8]), "initWithName:object:userInfo:", @"com.apple.AppleMediaDiscovery.IAESegmentNotification");
  [(AMDClient *)v3 iaeSegmentNotificationHandler:v2[0]];
  objc_storeStrong(v2, 0);
}

- (id)getModelPath:(id)a3 error:(id *)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = a4;
  if (location[0])
  {
    id v13 = objc_alloc_init(MEMORY[0x263F27C28]);
    id v4 = [AMDClientRequestEvent alloc];
    id v12 = -[AMDClientRequestEvent initModelPathRequestForUsecaseId:andModelId:withTreatmentId:inDomain:](v4, "initModelPathRequestForUsecaseId:andModelId:withTreatmentId:inDomain:", 0, location[0], 0);
    id v8 = (id)[v12 getAMSRequest];
    id v11 = (id)objc_msgSend(v13, "enqueueEvent:");

    id v10 = (id)[v11 resultWithError:v15];
    if (!*v15 && v10)
    {
      id v7 = (id)[v10 data];
      id v17 = (id)[v7 objectForKey:@"response"];

      int v14 = 1;
    }
    else
    {
      id v17 = 0;
      int v14 = 1;
    }
    objc_storeStrong(&v10, 0);
    objc_storeStrong(&v11, 0);
    objc_storeStrong(&v12, 0);
    objc_storeStrong(&v13, 0);
  }
  else
  {
    *id v15 = +[AMDError allocError:14 withMessage:@"Nil modelId passed"];
    id v17 = 0;
    int v14 = 1;
  }
  objc_storeStrong(location, 0);
  id v5 = v17;

  return v5;
}

- (id)getModelPathForUsecase:(id)a3 withTreatmentId:(id)a4 inDomain:(id)a5 error:(id *)a6
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v21 = 0;
  objc_storeStrong(&v21, a4);
  id v20 = 0;
  objc_storeStrong(&v20, a5);
  id v19 = a6;
  if (location[0])
  {
    id v17 = objc_alloc_init(MEMORY[0x263F27C28]);
    id v6 = [AMDClientRequestEvent alloc];
    id v16 = [(AMDClientRequestEvent *)v6 initModelPathRequestForUsecaseId:location[0] andModelId:0 withTreatmentId:v21 inDomain:v20];
    id v10 = (id)[v16 getAMSRequest];
    id v15 = (id)objc_msgSend(v17, "enqueueEvent:");

    id v14 = (id)[v15 resultWithError:v19];
    if (!*v19 && v14)
    {
      id v9 = (id)[v14 data];
      id v23 = (id)[v9 objectForKey:@"response"];

      int v18 = 1;
    }
    else
    {
      id v23 = 0;
      int v18 = 1;
    }
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v17, 0);
  }
  else
  {
    *id v19 = +[AMDError allocError:14 withMessage:@"Nil usecaseId passed"];
    id v23 = 0;
    int v18 = 1;
  }
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
  id v7 = v23;

  return v7;
}

- (id)getMusicModelPathForUsecase:(id)a3 withTreatmentId:(id)a4 error:(id *)a5
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  id v8 = [(AMDClient *)v11 getModelPathForUsecase:location[0] withTreatmentId:v9 inDomain:@"music" error:a5];
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);

  return v8;
}

- (id)sendPIRData:(id)a3 forKeyword:(id)a4 withCallHandle:(id)a5 andRequestError:(id)a6 error:(id *)a7
{
  v41[1] = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v36 = 0;
  objc_storeStrong(&v36, a4);
  id v35 = 0;
  objc_storeStrong(&v35, a5);
  id v34 = 0;
  objc_storeStrong(&v34, a6);
  id v33 = a7;
  if (!location[0] || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (v36)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v35)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (!v34 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v31 = objc_alloc_init(MEMORY[0x263F27C28]);
              id v30 = 0;
              if (location[0])
              {
                id v19 = [AMDClientRequestEvent alloc];
                v41[0] = v36;
                id v21 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v41);
                id v40 = location[0];
                id v20 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v40 count:1];
                id v7 = -[AMDClientRequestEvent initPIRResponseForKeywordArray:withDataArray:withMissingKeywords:requestError:andCallHandle:](v19, "initPIRResponseForKeywordArray:withDataArray:withMissingKeywords:requestError:andCallHandle:", v21);
                id v8 = v30;
                id v30 = v7;
              }
              else
              {
                id v17 = [AMDClientRequestEvent alloc];
                id v39 = v36;
                id v18 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v39 count:1];
                id v9 = -[AMDClientRequestEvent initPIRResponseForKeywordArray:withDataArray:withMissingKeywords:requestError:andCallHandle:](v17, "initPIRResponseForKeywordArray:withDataArray:withMissingKeywords:requestError:andCallHandle:", 0);
                id v10 = v30;
                id v30 = v9;
              }
              id v16 = (id)[v30 getAMSRequestForCipherML];
              id v29 = (id)objc_msgSend(v31, "enqueueEvent:");

              id v28 = (id)[v29 resultWithError:v33];
              if (*v33)
              {
                id v38 = 0;
                int v32 = 1;
              }
              else if (v28)
              {
                id v14 = (id)[v28 data];
                id v27 = (id)[v14 objectForKey:@"response"];

                id v15 = (id)[v27 objectForKey:@"frameworkError"];
                if (v15)
                {
                  id v26 = (id)[v27 objectForKey:@"frameworkError"];
                  id v11 = +[AMDError allocError:14 withMessage:v26];
                  *id v33 = v11;
                  id v38 = 0;
                  int v32 = 1;
                  objc_storeStrong(&v26, 0);
                }
                else
                {
                  id v38 = v27;
                  int v32 = 1;
                }
                objc_storeStrong(&v27, 0);
              }
              else
              {
                *id v33 = +[AMDError allocError:14 withMessage:@"Nil result obtained from PIR call to AMD"];
                id v38 = 0;
                int v32 = 1;
              }
              objc_storeStrong(&v28, 0);
              objc_storeStrong(&v29, 0);
              objc_storeStrong(&v30, 0);
              objc_storeStrong(&v31, 0);
            }
            else
            {
              *id v33 = +[AMDError allocError:14 withMessage:@"requestError not an instance of NSError"];
              id v38 = 0;
              int v32 = 1;
            }
          }
          else
          {
            *id v33 = +[AMDError allocError:14 withMessage:@"callHandle not an instance of NSString"];
            id v38 = 0;
            int v32 = 1;
          }
        }
        else
        {
          *id v33 = +[AMDError allocError:14 withMessage:@"callHandle cannot be nil"];
          id v38 = 0;
          int v32 = 1;
        }
      }
      else
      {
        *id v33 = +[AMDError allocError:14 withMessage:@"keyword not an instance of NSData"];
        id v38 = 0;
        int v32 = 1;
      }
    }
    else
    {
      *id v33 = +[AMDError allocError:14 withMessage:@"keyword cannot be nil"];
      id v38 = 0;
      int v32 = 1;
    }
  }
  else
  {
    *id v33 = +[AMDError allocError:14 withMessage:@"PIRData not an instance of NSData"];
    id v38 = 0;
    int v32 = 1;
  }
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(location, 0);
  id v12 = v38;

  return v12;
}

- (id)sendBatchedPIRData:(id)a3 forKeywords:(id)a4 withCallHandle:(id)a5 andRequestError:(id)a6 error:(id *)a7
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v45 = 0;
  objc_storeStrong(&v45, a4);
  id v44 = 0;
  objc_storeStrong(&v44, a5);
  id v43 = 0;
  objc_storeStrong(&v43, a6);
  os_log_type_t v42 = a7;
  if (location[0])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      *os_log_type_t v42 = +[AMDError allocError:14 withMessage:@"PIRDataArray not an instance of NSArray"];
      id v47 = 0;
      int v41 = 1;
      goto LABEL_38;
    }
  }
  if (!v45)
  {
    *os_log_type_t v42 = +[AMDError allocError:14 withMessage:@"keywordArray cannot be nil"];
    id v47 = 0;
    int v41 = 1;
    goto LABEL_38;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    *os_log_type_t v42 = +[AMDError allocError:14 withMessage:@"keywordArray not an instance of NSArray"];
    id v47 = 0;
    int v41 = 1;
    goto LABEL_38;
  }
  if (!v44)
  {
    *os_log_type_t v42 = +[AMDError allocError:14 withMessage:@"callHandle cannot be nil"];
    id v47 = 0;
    int v41 = 1;
    goto LABEL_38;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    *os_log_type_t v42 = +[AMDError allocError:14 withMessage:@"callHandle not an instance of NSString"];
    id v47 = 0;
    int v41 = 1;
    goto LABEL_38;
  }
  if (v43)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      *os_log_type_t v42 = +[AMDError allocError:14 withMessage:@"requestError not an instance of NSError"];
      id v47 = 0;
      int v41 = 1;
      goto LABEL_38;
    }
  }
  id v40 = 0;
  id v39 = 0;
  id v38 = 0;
  if (!location[0]) {
    goto LABEL_28;
  }
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v8 = v40;
  id v40 = v7;

  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v10 = v39;
  id v39 = v9;

  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v12 = v38;
  id v38 = v11;

  uint64_t v23 = [location[0] count];
  if (v23 == [v45 count])
  {
    for (int i = 0; ; ++i)
    {
      unint64_t v22 = i;
      if (v22 >= [location[0] count]) {
        break;
      }
      id v36 = (id)[location[0] objectAtIndex:i];
      id v35 = (id)[v45 objectAtIndex:i];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v40 addObject:v35];
        int v41 = 4;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v34 = v36;
          [v39 addObject:v35];
          [v38 addObject:v34];
          objc_storeStrong(&v34, 0);
          int v41 = 0;
        }
        else
        {
          id v13 = +[AMDError allocError:14 withMessage:@"NSObject enqueued to AMDClient needs to be of type NSNull or NSData"];
          *os_log_type_t v42 = v13;
          id v47 = 0;
          int v41 = 1;
        }
      }
      objc_storeStrong(&v35, 0);
      objc_storeStrong(&v36, 0);
      if (v41 && v41 != 4) {
        goto LABEL_37;
      }
    }
LABEL_28:
    id v33 = objc_alloc_init(MEMORY[0x263F27C28]);
    id v14 = [AMDClientRequestEvent alloc];
    id v32 = [(AMDClientRequestEvent *)v14 initPIRResponseForKeywordArray:v39 withDataArray:v38 withMissingKeywords:v40 requestError:v43 andCallHandle:v44];
    id v21 = (id)[v32 getAMSRequestForCipherML];
    id v31 = (id)objc_msgSend(v33, "enqueueEvent:");

    id v30 = (id)[v31 resultWithError:v42];
    if (*v42)
    {
      id v47 = 0;
      int v41 = 1;
    }
    else if (v30)
    {
      id v19 = (id)[v30 data];
      id v29 = (id)[v19 objectForKey:@"response"];

      id v20 = (id)[v29 objectForKey:@"frameworkError"];
      if (v20)
      {
        id v28 = (id)[v29 objectForKey:@"frameworkError"];
        id v16 = +[AMDError allocError:14 withMessage:v28];
        *os_log_type_t v42 = v16;
        id v47 = 0;
        int v41 = 1;
        objc_storeStrong(&v28, 0);
      }
      else
      {
        id v47 = v29;
        int v41 = 1;
      }
      objc_storeStrong(&v29, 0);
    }
    else
    {
      id v15 = +[AMDError allocError:14 withMessage:@"Nil result obtained from PIR call to AMD"];
      *os_log_type_t v42 = v15;
      id v47 = 0;
      int v41 = 1;
    }
    objc_storeStrong(&v30, 0);
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v32, 0);
    objc_storeStrong(&v33, 0);
    goto LABEL_37;
  }
  *os_log_type_t v42 = +[AMDError allocError:14 withMessage:@"Unequal number of keywords and PIR responses"];
  id v47 = 0;
  int v41 = 1;
LABEL_37:
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
LABEL_38:
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(location, 0);
  id v17 = v47;

  return v17;
}

- (id)sendPECSimilarityScores:(id)a3 withCallHandle:(id)a4 andRequestError:(id)a5 error:(id *)a6
{
  v32[1] = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v29 = 0;
  objc_storeStrong(&v29, a4);
  id v28 = 0;
  objc_storeStrong(&v28, a5);
  id v27 = a6;
  if (v29)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (!v28 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v25 = +[AMDMiscHelpers extractPECSimilarityScores:location[0] error:v27];
        if (*v27)
        {
          id v31 = 0;
          int v26 = 1;
        }
        else
        {
          id v24 = objc_alloc_init(MEMORY[0x263F27C28]);
          id v23 = [AMDClientRequestEvent alloc];
          id v13 = v23;
          v32[0] = v25;
          id v14 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:1];
          id v6 = objc_msgSend(v13, "initPECResponseForSimilarityScores:requestError:andCallHandle:");
          id v7 = v23;
          id v23 = v6;

          id v15 = (id)[v23 getAMSRequestForCipherML];
          id v22 = (id)objc_msgSend(v24, "enqueueEvent:");

          id v21 = (id)[v22 resultWithError:v27];
          if (*v27)
          {
            id v31 = 0;
            int v26 = 1;
          }
          else if (v21)
          {
            id v11 = (id)[v21 data];
            id v20 = (id)[v11 objectForKey:@"response"];

            id v12 = (id)[v20 objectForKey:@"frameworkError"];
            if (v12)
            {
              id v19 = (id)[v20 objectForKey:@"frameworkError"];
              id v8 = +[AMDError allocError:14 withMessage:v19];
              *id v27 = v8;
              id v31 = 0;
              int v26 = 1;
              objc_storeStrong(&v19, 0);
            }
            else
            {
              id v31 = v20;
              int v26 = 1;
            }
            objc_storeStrong(&v20, 0);
          }
          else
          {
            *id v27 = +[AMDError allocError:14 withMessage:@"Nil result obtained from PIR call to AMD"];
            id v31 = 0;
            int v26 = 1;
          }
          objc_storeStrong(&v21, 0);
          objc_storeStrong(&v22, 0);
          objc_storeStrong(&v23, 0);
          objc_storeStrong(&v24, 0);
        }
        objc_storeStrong(&v25, 0);
      }
      else
      {
        *id v27 = +[AMDError allocError:14 withMessage:@"requestError not an instance of NSError"];
        id v31 = 0;
        int v26 = 1;
      }
    }
    else
    {
      *id v27 = +[AMDError allocError:14 withMessage:@"callHandle not an instance of NSString"];
      id v31 = 0;
      int v26 = 1;
    }
  }
  else
  {
    *id v27 = +[AMDError allocError:14 withMessage:@"callHandle cannot be nil"];
    id v31 = 0;
    int v26 = 1;
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
  id v9 = v31;

  return v9;
}

- (id)sendBatchedPECSimilarityScores:(id)a3 withCallHandle:(id)a4 andRequestError:(id)a5 error:(id *)a6
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v38 = 0;
  objc_storeStrong(&v38, a4);
  id v37 = 0;
  objc_storeStrong(&v37, a5);
  id v36 = a6;
  if (!v38)
  {
    *id v36 = +[AMDError allocError:14 withMessage:@"callHandle cannot be nil"];
    id v40 = 0;
    int v35 = 1;
    goto LABEL_33;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    *id v36 = +[AMDError allocError:14 withMessage:@"callHandle not an instance of NSString"];
    id v40 = 0;
    int v35 = 1;
    goto LABEL_33;
  }
  if (v37)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      *id v36 = +[AMDError allocError:14 withMessage:@"requestError not an instance of NSError"];
      id v40 = 0;
      int v35 = 1;
      goto LABEL_33;
    }
  }
  id v34 = 0;
  if (!location[0])
  {
LABEL_23:
    id v30 = objc_alloc_init(MEMORY[0x263F27C28]);
    id v8 = [AMDClientRequestEvent alloc];
    id v29 = [(AMDClientRequestEvent *)v8 initPECResponseForSimilarityScores:v34 requestError:v37 andCallHandle:v38];
    id v15 = (id)[v29 getAMSRequestForCipherML];
    id v28 = (id)objc_msgSend(v30, "enqueueEvent:");

    id v27 = (id)[v28 resultWithError:v36];
    if (*v36)
    {
      id v40 = 0;
      int v35 = 1;
    }
    else if (v27)
    {
      id v13 = (id)[v27 data];
      id v26 = (id)[v13 objectForKey:@"response"];

      id v14 = (id)[v26 objectForKey:@"frameworkError"];
      if (v14)
      {
        id v25 = (id)[v26 objectForKey:@"frameworkError"];
        id v10 = +[AMDError allocError:14 withMessage:v25];
        *id v36 = v10;
        id v40 = 0;
        int v35 = 1;
        objc_storeStrong(&v25, 0);
      }
      else
      {
        id v40 = v26;
        int v35 = 1;
      }
      objc_storeStrong(&v26, 0);
    }
    else
    {
      id v9 = +[AMDError allocError:14 withMessage:@"Nil result obtained from PIR call to AMD"];
      *id v36 = v9;
      id v40 = 0;
      int v35 = 1;
    }
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v28, 0);
    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v30, 0);
    goto LABEL_32;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v7 = v34;
    id v34 = v6;

    memset(__b, 0, sizeof(__b));
    id v20 = location[0];
    uint64_t v21 = [v20 countByEnumeratingWithState:__b objects:v41 count:16];
    if (v21)
    {
      uint64_t v17 = *(void *)__b[2];
      uint64_t v18 = 0;
      unint64_t v19 = v21;
      while (1)
      {
        uint64_t v16 = v18;
        if (*(void *)__b[2] != v17) {
          objc_enumerationMutation(v20);
        }
        uint64_t v33 = *(void *)(__b[1] + 8 * v18);
        id v31 = +[AMDMiscHelpers extractPECSimilarityScores:v33 error:v36];
        if (*v36)
        {
          id v40 = 0;
          int v35 = 1;
        }
        else
        {
          [v34 addObject:v31];
          int v35 = 0;
        }
        objc_storeStrong(&v31, 0);
        if (v35) {
          break;
        }
        ++v18;
        if (v16 + 1 >= v19)
        {
          uint64_t v18 = 0;
          unint64_t v19 = [v20 countByEnumeratingWithState:__b objects:v41 count:16];
          if (!v19) {
            goto LABEL_21;
          }
        }
      }
    }
    else
    {
LABEL_21:
      int v35 = 0;
    }

    if (v35) {
      goto LABEL_32;
    }
    goto LABEL_23;
  }
  *id v36 = +[AMDError allocError:14 withMessage:@"batchedSimilarityScoresArray not an instance of NSArray"];
  id v40 = 0;
  int v35 = 1;
LABEL_32:
  objc_storeStrong(&v34, 0);
LABEL_33:
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(location, 0);
  id v11 = v40;

  return v11;
}

- (id)sendPIRData:(id)a3 forKeyword:(id)a4 withCallHandle:(id)a5 error:(id *)a6
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  id v10 = 0;
  objc_storeStrong(&v10, a5);
  *a6 = +[AMDError allocError:18 withMessage:@"Deprecated method"];
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  return 0;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (NSString)dsId
{
  return self->_dsId;
}

- (void)setDsId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end