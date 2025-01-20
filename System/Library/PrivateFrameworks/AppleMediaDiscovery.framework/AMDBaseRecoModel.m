@interface AMDBaseRecoModel
+ (id)getCurrentDirURLForName:(id)a3;
+ (id)getModelforId:(id)a3 useMinimalMap:(id)a4 error:(id *)a5;
- (AMDBaseRecoModel)initWithId:(id)a3;
- (AMDBaseRecoModel)initWithId:(id)a3 andVersion:(unint64_t)a4;
- (AMDModelAssets)modelAssets;
- (AMDModelMetadata)modelMetadata;
- (BOOL)isValid;
- (BOOL)parseModelInfoFromBuffer:(id)a3 error:(id *)a4;
- (MLModel)model;
- (NSString)modelId;
- (id)getId;
- (id)getPredictions:(unint64_t)a3 andInputBuilder:(id)a4 andOutputBuilder:(id)a5 withColdstartModelId:(id)a6 error:(id *)a7;
- (int64_t)assetCreationTimestamp;
- (int64_t)getAssetCreationTimestamp;
- (unint64_t)getVersion;
- (unint64_t)version;
- (void)loadModelMetadataFromDir:(id)a3 error:(id *)a4;
- (void)setAssetCreationTimestamp:(int64_t)a3;
- (void)setModel:(id)a3;
- (void)setModelAssets:(id)a3;
- (void)setModelId:(id)a3;
- (void)setModelMetadata:(id)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation AMDBaseRecoModel

- (AMDBaseRecoModel)initWithId:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)AMDBaseRecoModel;
  v8 = [(AMDBaseRecoModel *)&v6 init];
  objc_storeStrong((id *)&v8, v8);
  [(AMDBaseRecoModel *)v8 setModelId:location[0]];
  [(AMDBaseRecoModel *)v8 setVersion:-1];
  [(AMDBaseRecoModel *)v8 setAssetCreationTimestamp:0];
  v5 = v8;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v8, 0);
  return v5;
}

- (AMDBaseRecoModel)initWithId:(id)a3 andVersion:(unint64_t)a4
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v9 = a4;
  v4 = v11;
  v11 = 0;
  v8.receiver = v4;
  v8.super_class = (Class)AMDBaseRecoModel;
  v11 = [(AMDBaseRecoModel *)&v8 init];
  objc_storeStrong((id *)&v11, v11);
  [(AMDBaseRecoModel *)v11 setModelId:location[0]];
  [(AMDBaseRecoModel *)v11 setVersion:v9];
  [(AMDBaseRecoModel *)v11 setAssetCreationTimestamp:0];
  v7 = v11;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v7;
}

- (BOOL)isValid
{
  objc_super v6 = [(AMDBaseRecoModel *)self modelMetadata];
  char v8 = 0;
  BOOL v7 = 0;
  if (v6)
  {
    unint64_t v9 = [(AMDBaseRecoModel *)self modelMetadata];
    char v8 = 1;
    BOOL v7 = [(AMDModelMetadata *)v9 isValid];
  }
  if (v8) {

  }
  v2 = [(AMDBaseRecoModel *)self model];
  BOOL v4 = v2 != 0;

  BOOL v5 = 0;
  if (v4)
  {
    BOOL v5 = 0;
    if (v7) {
      return [(AMDBaseRecoModel *)self version] != 0;
    }
  }
  return v5;
}

- (id)getId
{
  return [(AMDBaseRecoModel *)self modelId];
}

- (unint64_t)getVersion
{
  return [(AMDBaseRecoModel *)self version];
}

- (int64_t)getAssetCreationTimestamp
{
  return [(AMDBaseRecoModel *)self assetCreationTimestamp];
}

- (id)getPredictions:(unint64_t)a3 andInputBuilder:(id)a4 andOutputBuilder:(id)a5 withColdstartModelId:(id)a6 error:(id *)a7
{
  location[3] = self;
  id location[2] = (id)a2;
  location[1] = (id)a3;
  location[0] = 0;
  objc_storeStrong(location, a4);
  id v12 = 0;
  objc_storeStrong(&v12, a5);
  id v11 = 0;
  objc_storeStrong(&v11, a6);
  *a7 = +[AMDError allocError:24 withMessage:@"Programmer error"];
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return 0;
}

+ (id)getModelforId:(id)a3 useMinimalMap:(id)a4 error:(id *)a5
{
  v76[2] = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v65 = 0;
  objc_storeStrong(&v65, a4);
  v64 = a5;
  id v63 = +[AMDModel getModelInfo:location[0] error:a5];
  id v62 = (id)[v63 objectForKey:0x26BEB83B8];
  id v61 = (id)[v63 objectForKey:0x26BEB3918];
  id v60 = (id)[v63 objectForKey:0x26BEACCB8];
  id v59 = (id)[v63 objectForKey:0x26BEB09F8];
  if (*a5)
  {
    id v67 = 0;
    int v58 = 1;
  }
  else
  {
    v75[0] = 0x26BEACCB8;
    v76[0] = v60;
    v75[1] = 0x26BEAE8D8;
    v76[1] = location[0];
    id v57 = (id)[NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:2];
    +[AMDFrameworkMetrics log:v57 withKey:@"inferenceModelInfo" atVerbosity:0];
    if (v63)
    {
      id v24 = (id)[MEMORY[0x263EFF910] date];
      [v24 timeIntervalSince1970];
      unint64_t v25 = (unint64_t)v5;

      unint64_t v53 = v25;
      uint64_t v52 = [v62 longLongValue];
      v51[1] = (id)(v25 - v52);
      v51[0] = (id)[location[0] stringByAppendingString:@"_modelAge"];
      id v26 = (id)[NSNumber numberWithUnsignedLongLong:v25 - v52];
      +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:");

      +[AMDPerf sampleForKey:@"InferenceLoadModelAndMetadata"];
      id v50 = (id)[v59 stringByAppendingPathComponent:v61];
      id v49 = &_os_log_internal;
      os_log_type_t v48 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled((os_log_t)v49, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v73, (uint64_t)location[0], (uint64_t)v59, (uint64_t)v50);
        _os_log_impl(&dword_20ABD4000, (os_log_t)v49, v48, "Loading model, modelId: %@, dir: %@, path: %@", v73, 0x20u);
      }
      objc_storeStrong(&v49, 0);
      if (v50)
      {
        id v44 = (id)[NSURL fileURLWithPath:v50 isDirectory:1];
        id v43 = objc_alloc_init(MEMORY[0x263F00D98]);
        [v43 setComputeUnits:0];
        id v42 = -[AMDClassifierRecoModel initWithId:andVersion:]([AMDClassifierRecoModel alloc], "initWithId:andVersion:", location[0], [v60 longLongValue]);
        id v23 = (id)[MEMORY[0x263F00D80] modelWithContentsOfURL:v44 configuration:v43 error:v64];
        objc_msgSend(v42, "setModel:");

        if (*v64)
        {
          os_log_t oslog = (os_log_t)&_os_log_internal;
          os_log_type_t v40 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            id v22 = (id)[v44 path];
            id v21 = (id)[*v64 localizedDescription];
            __os_log_helper_16_2_2_8_64_8_64((uint64_t)v71, (uint64_t)v22, (uint64_t)v21);
            _os_log_error_impl(&dword_20ABD4000, oslog, v40, "Error loading model from %@: %@", v71, 0x16u);
          }
          objc_storeStrong((id *)&oslog, 0);
          id v67 = 0;
          int v58 = 1;
        }
        else
        {
          id v20 = (id)[v59 stringByAppendingPathComponent:@"model_metadata"];
          id v39 = (id)[v20 stringByAppendingPathExtension:@"json"];

          id v38 = (id)[MEMORY[0x263EFF8F8] dataWithContentsOfFile:v39];
          if (v38)
          {
            v18 = [[AMDModelMetadata alloc] initWithMetadataJSON:v38 error:v64];
            objc_msgSend(v42, "setModelMetadata:");

            BOOL v6 = *v64 != 0;
            char v33 = 0;
            BOOL v19 = 1;
            if (!v6)
            {
              id v34 = (id)[v42 modelMetadata];
              char v33 = 1;
              BOOL v19 = v34 == 0;
            }
            if (v33) {

            }
            if (v19)
            {
              os_log_t v32 = (os_log_t)&_os_log_internal;
              os_log_type_t v31 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                id v16 = v59;
                id v17 = (id)[*v64 localizedDescription];
                __os_log_helper_16_2_2_8_64_8_64((uint64_t)v69, (uint64_t)v16, (uint64_t)v17);
                _os_log_error_impl(&dword_20ABD4000, v32, v31, "error while loading metadata from %@: %@", v69, 0x16u);
              }
              objc_storeStrong((id *)&v32, 0);
              id v67 = 0;
              int v58 = 1;
            }
            else
            {
              +[AMDPerf sampleForKey:@"InferenceLoadAssets"];
              char v30 = 0;
              if (v65) {
                char v30 = [v65 BOOLValue] & 1;
              }
              id v12 = [AMDModelAssets alloc];
              id v11 = v59;
              id v15 = (id)[v42 modelMetadata];
              id v14 = (id)[v15 getAssetsMetadata];
              id v13 = -[AMDModelAssets initFromDir:andMetadata:useBinaryInputMap:useBinaryOutputMap:withModelId:isInference:error:](v12, "initFromDir:andMetadata:useBinaryInputMap:useBinaryOutputMap:withModelId:isInference:error:", v11, v64);
              objc_msgSend(v42, "setModelAssets:");

              if (*v64)
              {
                os_log_t v29 = (os_log_t)&_os_log_internal;
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  id v9 = v59;
                  id v10 = (id)[*v64 localizedDescription];
                  __os_log_helper_16_2_2_8_64_8_64((uint64_t)v68, (uint64_t)v9, (uint64_t)v10);
                  _os_log_error_impl(&dword_20ABD4000, v29, OS_LOG_TYPE_ERROR, "Error loading assets from %@: %@", v68, 0x16u);
                }
                objc_storeStrong((id *)&v29, 0);
                id v67 = 0;
                int v58 = 1;
              }
              else
              {
                +[AMDPerf sampleForKey:@"InferencLoadedAssets"];
                id v67 = v42;
                int v58 = 1;
              }
            }
          }
          else
          {
            id v37 = (id)[NSString stringWithFormat:@"No metadata for modelId '%@'!", location[0]];
            os_log_t v36 = (os_log_t)&_os_log_internal;
            os_log_type_t v35 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              __os_log_helper_16_2_1_8_64((uint64_t)v70, (uint64_t)v37);
              _os_log_error_impl(&dword_20ABD4000, v36, v35, "%@", v70, 0xCu);
            }
            objc_storeStrong((id *)&v36, 0);
            id *v64 = +[AMDError allocError:16 withMessage:v37];
            id v67 = 0;
            int v58 = 1;
            objc_storeStrong(&v37, 0);
          }
          objc_storeStrong(&v38, 0);
          objc_storeStrong(&v39, 0);
        }
        objc_storeStrong(&v42, 0);
        objc_storeStrong(&v43, 0);
        objc_storeStrong(&v44, 0);
      }
      else
      {
        id v47 = (id)[NSString stringWithFormat:@"Model path for modelId '%@' is nil!", location[0]];
        id v46 = &_os_log_internal;
        os_log_type_t v45 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v72, (uint64_t)v47);
          _os_log_error_impl(&dword_20ABD4000, (os_log_t)v46, v45, "%@", v72, 0xCu);
        }
        objc_storeStrong(&v46, 0);
        id *v64 = +[AMDError allocError:16 withMessage:v47];
        id v67 = 0;
        int v58 = 1;
        objc_storeStrong(&v47, 0);
      }
      objc_storeStrong(&v50, 0);
      objc_storeStrong(v51, 0);
    }
    else
    {
      id v56 = (id)[NSString stringWithFormat:@"No model found for modelId '%@'", location[0]];
      id v55 = &_os_log_internal;
      os_log_type_t type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v55, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v74, (uint64_t)v56);
        _os_log_error_impl(&dword_20ABD4000, (os_log_t)v55, type, "%@", v74, 0xCu);
      }
      objc_storeStrong(&v55, 0);
      id *v64 = +[AMDError allocError:16 withMessage:v56];
      id v67 = 0;
      int v58 = 1;
      objc_storeStrong(&v56, 0);
    }
    objc_storeStrong(&v57, 0);
  }
  objc_storeStrong(&v59, 0);
  objc_storeStrong(&v60, 0);
  objc_storeStrong(&v61, 0);
  objc_storeStrong(&v62, 0);
  objc_storeStrong(&v63, 0);
  objc_storeStrong(&v65, 0);
  objc_storeStrong(location, 0);
  BOOL v7 = v67;

  return v7;
}

+ (id)getCurrentDirURLForName:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = (id)[MEMORY[0x263F08850] defaultManager];
  id v4 = (id)[v11 URLsForDirectory:14 inDomains:1];
  id v10 = (id)[v4 lastObject];

  id v9 = (id)[v10 URLByAppendingPathComponent:0x26BEB2F98];
  id v8 = (id)[v9 URLByAppendingPathComponent:@"models"];
  id v7 = (id)[v8 URLByAppendingPathComponent:location[0]];
  id v6 = (id)[v7 URLByAppendingPathComponent:@"current"];
  id v5 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);

  return v5;
}

- (void)loadModelMetadataFromDir:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = a4;
  id v8 = (id)[location[0] URLByAppendingPathComponent:@"model_metadata"];
  id v7 = (id)[v8 URLByAppendingPathExtension:@"json"];
  id v12 = (id)[v7 path];

  id v11 = (id)[MEMORY[0x263EFF8F8] dataWithContentsOfFile:v12];
  if (v11)
  {
    id v5 = [[AMDModelMetadata alloc] initWithMetadataJSON:v11 error:v13];
    -[AMDBaseRecoModel setModelMetadata:](v15, "setModelMetadata:");
  }
  else
  {
    id v10 = (id)[NSString stringWithFormat:@"Model metadata could not be loaded from directory %@", location[0]];
    id v9 = &_os_log_internal;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v16, (uint64_t)v10);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)v9, OS_LOG_TYPE_ERROR, "%@", v16, 0xCu);
    }
    objc_storeStrong(&v9, 0);
    id v4 = +[AMDError allocError:15 withMessage:v10];
    *id v13 = v4;
    objc_storeStrong(&v10, 0);
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)parseModelInfoFromBuffer:(id)a3 error:(id *)a4
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = a4;
  __int16 v4 = [location[0] getShortWithError:a4];
  [(AMDBaseRecoModel *)v16 setVersion:v4];
  if (a4 && *v14)
  {
    char v17 = 0;
    int v13 = 1;
  }
  else
  {
    uint64_t v5 = [location[0] getLongWithError:v14];
    [(AMDBaseRecoModel *)v16 setAssetCreationTimestamp:v5];
    if (v14 && *v14)
    {
      char v17 = 0;
      int v13 = 1;
    }
    else if ([(AMDBaseRecoModel *)v16 version] {
           && [(AMDBaseRecoModel *)v16 assetCreationTimestamp] > 0)
    }
    {
      char v17 = 1;
      int v13 = 1;
    }
    else
    {
      os_log_t oslog = (os_log_t)&_os_log_internal;
      os_log_type_t type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        log = oslog;
        os_log_type_t v8 = type;
        __os_log_helper_16_0_0(v10);
        _os_log_error_impl(&dword_20ABD4000, log, v8, "invalid value for version/timestamp", v10, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      char v17 = 0;
      int v13 = 1;
    }
  }
  objc_storeStrong(location, 0);
  return v17 & 1;
}

- (MLModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (AMDModelMetadata)modelMetadata
{
  return self->_modelMetadata;
}

- (void)setModelMetadata:(id)a3
{
}

- (AMDModelAssets)modelAssets
{
  return self->_modelAssets;
}

- (void)setModelAssets:(id)a3
{
}

- (NSString)modelId
{
  return self->_modelId;
}

- (void)setModelId:(id)a3
{
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (int64_t)assetCreationTimestamp
{
  return self->_assetCreationTimestamp;
}

- (void)setAssetCreationTimestamp:(int64_t)a3
{
  self->_assetCreationTimestamp = a3;
}

- (void).cxx_destruct
{
}

@end