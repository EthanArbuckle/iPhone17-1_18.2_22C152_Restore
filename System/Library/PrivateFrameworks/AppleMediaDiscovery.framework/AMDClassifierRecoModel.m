@interface AMDClassifierRecoModel
- (AMDClassifierRecoModel)initWithId:(id)a3 andVersion:(unint64_t)a4;
- (id)getPredictions:(unint64_t)a3 andInputBuilder:(id)a4 andOutputBuilder:(id)a5 withColdstartModelId:(id)a6 error:(id *)a7;
@end

@implementation AMDClassifierRecoModel

- (AMDClassifierRecoModel)initWithId:(id)a3 andVersion:(unint64_t)a4
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v9 = a4;
  v4 = v11;
  v11 = 0;
  v8.receiver = v4;
  v8.super_class = (Class)AMDClassifierRecoModel;
  v11 = [(AMDBaseRecoModel *)&v8 initWithId:location[0] andVersion:a4];
  objc_storeStrong((id *)&v11, v11);
  v7 = v11;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v7;
}

- (id)getPredictions:(unint64_t)a3 andInputBuilder:(id)a4 andOutputBuilder:(id)a5 withColdstartModelId:(id)a6 error:(id *)a7
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  v53 = self;
  SEL v52 = a2;
  unint64_t v51 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v49 = 0;
  objc_storeStrong(&v49, a5);
  id v48 = 0;
  objc_storeStrong(&v48, a6);
  v47 = a7;
  if ([(AMDBaseRecoModel *)v53 isValid])
  {
    id v18 = location;
    v21 = [(AMDBaseRecoModel *)v53 modelMetadata];
    id v20 = [(AMDModelMetadata *)v21 getInputsMetadata];
    v19 = [(AMDBaseRecoModel *)v53 modelAssets];
    id v42 = (id)objc_msgSend(v18, "getInputsWithMetadata:andModelAssets:error:", v20);

    if (*v47)
    {
      id v41 = &_os_log_internal;
      os_log_type_t v40 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_ERROR))
      {
        id v17 = (id)[*v47 localizedDescription];
        __os_log_helper_16_2_1_8_64((uint64_t)v60, (uint64_t)v17);
        _os_log_error_impl(&dword_20ABD4000, (os_log_t)v41, v40, "could not build the inputs provider, %@", v60, 0xCu);
      }
      objc_storeStrong(&v41, 0);
      id v54 = 0;
      int v43 = 1;
    }
    else if (v42)
    {
      v14 = NSString;
      id v15 = [(AMDBaseRecoModel *)v53 getId];
      id v36 = (id)[v14 stringWithFormat:@"CoreMLCall__%@", v15];

      +[AMDPerf startMonitoringEvent:v36];
      v16 = [(AMDBaseRecoModel *)v53 model];
      id v35 = [(MLModel *)v16 predictionFromFeatures:v42 error:v47];

      if (*v47)
      {
        os_log_t v34 = (os_log_t)&_os_log_internal;
        os_log_type_t v33 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          id v13 = (id)[*v47 localizedDescription];
          __os_log_helper_16_2_1_8_64((uint64_t)v58, (uint64_t)v13);
          _os_log_error_impl(&dword_20ABD4000, v34, v33, "error running inference, %@", v58, 0xCu);
        }
        objc_storeStrong((id *)&v34, 0);
        id v54 = 0;
        int v43 = 1;
      }
      else if (v35)
      {
        +[AMDPerf endMonitoringEvent:v36];
        id v11 = v49;
        unint64_t v10 = v51;
        v12 = [(AMDBaseRecoModel *)v53 modelAssets];
        id v29 = (id)objc_msgSend(v11, "getPredictions:fromMLProvider:andModelAssets:withColdstartModelId:error:", v10, v35);

        if (*v47)
        {
          os_log_t v28 = (os_log_t)&_os_log_internal;
          os_log_type_t v27 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            id v9 = (id)[*v47 localizedDescription];
            __os_log_helper_16_2_1_8_64((uint64_t)v56, (uint64_t)v9);
            _os_log_error_impl(&dword_20ABD4000, v28, v27, "error building output, %@", v56, 0xCu);
          }
          objc_storeStrong((id *)&v28, 0);
          id v54 = 0;
          int v43 = 1;
        }
        else if (v29)
        {
          id v54 = v29;
          int v43 = 1;
        }
        else
        {
          v26 = @"nil inference builder result";
          os_log_t v25 = (os_log_t)&_os_log_internal;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v55, (uint64_t)v26);
            _os_log_debug_impl(&dword_20ABD4000, v25, OS_LOG_TYPE_DEBUG, "%@", v55, 0xCu);
          }
          objc_storeStrong((id *)&v25, 0);
          id *v47 = +[AMDError allocError:24 withMessage:v26];
          id v54 = 0;
          int v43 = 1;
          objc_storeStrong((id *)&v26, 0);
        }
        objc_storeStrong(&v29, 0);
      }
      else
      {
        v32 = @"nil inference result";
        os_log_t v31 = (os_log_t)&_os_log_internal;
        os_log_type_t v30 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v57, (uint64_t)v32);
          _os_log_debug_impl(&dword_20ABD4000, v31, v30, "%@", v57, 0xCu);
        }
        objc_storeStrong((id *)&v31, 0);
        id *v47 = +[AMDError allocError:24 withMessage:v32];
        id v54 = 0;
        int v43 = 1;
        objc_storeStrong((id *)&v32, 0);
      }
      objc_storeStrong(&v35, 0);
      objc_storeStrong(&v36, 0);
    }
    else
    {
      v39 = @"nil inputs provider";
      os_log_t oslog = (os_log_t)&_os_log_internal;
      os_log_type_t v37 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v59, (uint64_t)v39);
        _os_log_debug_impl(&dword_20ABD4000, oslog, v37, "%@", v59, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      id *v47 = +[AMDError allocError:24 withMessage:v39];
      id v54 = 0;
      int v43 = 1;
      objc_storeStrong((id *)&v39, 0);
    }
    objc_storeStrong(&v42, 0);
  }
  else
  {
    v46 = @"model is not ready for predictions";
    id v45 = &_os_log_internal;
    os_log_type_t v44 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v45, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v61, (uint64_t)v46);
      _os_log_debug_impl(&dword_20ABD4000, (os_log_t)v45, v44, "%@", v61, 0xCu);
    }
    objc_storeStrong(&v45, 0);
    id *v47 = +[AMDError allocError:24 withMessage:v46];
    id v54 = 0;
    int v43 = 1;
    objc_storeStrong((id *)&v46, 0);
  }
  objc_storeStrong(&v48, 0);
  objc_storeStrong(&v49, 0);
  objc_storeStrong(&location, 0);
  v7 = v54;

  return v7;
}

@end