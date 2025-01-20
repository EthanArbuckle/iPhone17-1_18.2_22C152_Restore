@interface AMDModelMetadata
- (AMDModelAssetsMetadata)assetsMetadata;
- (AMDModelMetadata)initWithMetadataJSON:(id)a3 error:(id *)a4;
- (BOOL)isValid;
- (NSMutableDictionary)inputsMetadata;
- (NSMutableDictionary)outputsMetadata;
- (NSNumber)mappingFilesRequired;
- (NSString)modelId;
- (NSString)modelUid;
- (char)getModelArchType;
- (char)modelArchType;
- (id)getAssetsMetadata;
- (id)getInputsMetadata;
- (id)getMappingFileRequirement;
- (id)getModelUid;
- (id)getOutputsMetadata;
- (void)setAssetsMetadata:(id)a3;
- (void)setInputsMetadata:(id)a3;
- (void)setMappingFilesRequired:(id)a3;
- (void)setModelArchType:(char)a3;
- (void)setModelId:(id)a3;
- (void)setModelUid:(id)a3;
- (void)setOutputsMetadata:(id)a3;
@end

@implementation AMDModelMetadata

- (AMDModelMetadata)initWithMetadataJSON:(id)a3 error:(id *)a4
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v58 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v56 = a4;
  id v4 = v58;
  id v58 = 0;
  v55.receiver = v4;
  v55.super_class = (Class)AMDModelMetadata;
  id v58 = [(AMDModelMetadata *)&v55 init];
  objc_storeStrong(&v58, v58);
  [v58 setModelArchType:0];
  v54[1] = (id)4;
  v54[0] = (id)[MEMORY[0x263F08900] JSONObjectWithData:location[0] options:4 error:v56];
  if (*v56)
  {
    v59 = 0;
    int v53 = 1;
  }
  else if (v54[0])
  {
    id v29 = (id)[v54[0] objectForKey:@"model_id"];
    objc_msgSend(v58, "setModelId:");

    id v30 = (id)[v54[0] objectForKey:@"model_uid"];
    objc_msgSend(v58, "setModelUid:");

    id v31 = (id)[v54[0] objectForKey:@"arch_type"];
    objc_msgSend(v58, "setModelArchType:", (char)objc_msgSend(v31, "unsignedCharValue"));

    id v32 = (id)[v54[0] objectForKey:@"mapping_files_required"];
    objc_msgSend(v58, "setMappingFilesRequired:");

    id v49 = (id)[v54[0] objectForKey:@"assets"];
    if (v49)
    {
      v28 = [[AMDModelAssetsMetadata alloc] initWithDictionary:v49];
      objc_msgSend(v58, "setAssetsMetadata:");
    }
    id v48 = (id)[v54[0] objectForKey:@"model_inputs"];
    if (v48)
    {
      id v25 = (id)objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v48, "count"));
      objc_msgSend(v58, "setInputsMetadata:");

      memset(__b, 0, sizeof(__b));
      id v26 = v48;
      uint64_t v27 = [v26 countByEnumeratingWithState:__b objects:v64 count:16];
      if (v27)
      {
        uint64_t v22 = *(void *)__b[2];
        uint64_t v23 = 0;
        unint64_t v24 = v27;
        while (1)
        {
          uint64_t v21 = v23;
          if (*(void *)__b[2] != v22) {
            objc_enumerationMutation(v26);
          }
          uint64_t v47 = *(void *)(__b[1] + 8 * v23);
          id v45 = (id)[v48 objectForKey:v47];
          id v44 = [[AMDModelInputMetadata alloc] initWithDictionary:v45];
          if ([v44 isValid])
          {
            id v20 = (id)[v58 inputsMetadata];
            [v20 setObject:v44 forKey:v47];
          }
          else
          {
            id v43 = &_os_log_internal;
            os_log_type_t v42 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_ERROR))
            {
              v19 = v43;
              __os_log_helper_16_2_2_8_64_8_64((uint64_t)v63, (uint64_t)v45, v47);
              _os_log_error_impl(&dword_20ABD4000, v19, v42, "invalid input metadata in %@ for %@", v63, 0x16u);
            }
            objc_storeStrong(&v43, 0);
          }
          objc_storeStrong(&v44, 0);
          objc_storeStrong(&v45, 0);
          ++v23;
          if (v21 + 1 >= v24)
          {
            uint64_t v23 = 0;
            unint64_t v24 = [v26 countByEnumeratingWithState:__b objects:v64 count:16];
            if (!v24) {
              break;
            }
          }
        }
      }
    }
    id v41 = (id)[v54[0] objectForKey:@"model_outputs"];
    if (v41)
    {
      id v16 = (id)objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v41, "count"));
      objc_msgSend(v58, "setOutputsMetadata:");

      memset(v39, 0, sizeof(v39));
      id v17 = v41;
      uint64_t v18 = [v17 countByEnumeratingWithState:v39 objects:v62 count:16];
      if (v18)
      {
        uint64_t v13 = *(void *)v39[2];
        uint64_t v14 = 0;
        unint64_t v15 = v18;
        while (1)
        {
          uint64_t v12 = v14;
          if (*(void *)v39[2] != v13) {
            objc_enumerationMutation(v17);
          }
          uint64_t v40 = *(void *)(v39[1] + 8 * v14);
          id v38 = (id)[v41 objectForKey:v40];
          v5 = [AMDModelOutputMetadata alloc];
          id v37 = [(AMDModelOutputMetadata *)v5 initWithDictionary:v38];
          if ([v37 isValid])
          {
            id v11 = (id)[v58 outputsMetadata];
            [v11 setObject:v37 forKey:v40];
          }
          else
          {
            os_log_t oslog = (os_log_t)&_os_log_internal;
            os_log_type_t v35 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
            {
              v10 = oslog;
              __os_log_helper_16_2_2_8_64_8_64((uint64_t)v61, (uint64_t)v38, v40);
              _os_log_error_impl(&dword_20ABD4000, v10, v35, "invalid output metadata in %@ for %@", v61, 0x16u);
            }
            objc_storeStrong((id *)&oslog, 0);
          }
          objc_storeStrong(&v37, 0);
          objc_storeStrong(&v38, 0);
          ++v14;
          if (v12 + 1 >= v15)
          {
            uint64_t v14 = 0;
            unint64_t v15 = [v17 countByEnumeratingWithState:v39 objects:v62 count:16];
            if (!v15) {
              break;
            }
          }
        }
      }
    }
    os_log_t v34 = (os_log_t)&_os_log_internal;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      id v9 = (id)[v58 inputsMetadata];
      uint64_t v7 = [v9 count];
      id v8 = (id)[v58 outputsMetadata];
      __os_log_helper_16_0_2_8_0_8_0((uint64_t)v60, v7, [v8 count]);
      _os_log_debug_impl(&dword_20ABD4000, v34, OS_LOG_TYPE_DEBUG, "From JSON metadata: %lu inputs, %lu outputs", v60, 0x16u);
    }
    objc_storeStrong((id *)&v34, 0);
    v59 = (AMDModelMetadata *)v58;
    int v53 = 1;
    objc_storeStrong(&v41, 0);
    objc_storeStrong(&v48, 0);
    objc_storeStrong(&v49, 0);
  }
  else
  {
    v52 = @"Model Metadata json could not be deserialized";
    id v51 = &_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v51, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v65, (uint64_t)v52);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)v51, type, "%@", v65, 0xCu);
    }
    objc_storeStrong(&v51, 0);
    id *v56 = +[AMDError allocError:15 withMessage:v52];
    v59 = 0;
    int v53 = 1;
    objc_storeStrong((id *)&v52, 0);
  }
  objc_storeStrong(v54, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v58, 0);
  return v59;
}

- (id)getAssetsMetadata
{
  return [(AMDModelMetadata *)self assetsMetadata];
}

- (id)getInputsMetadata
{
  return [(AMDModelMetadata *)self inputsMetadata];
}

- (id)getOutputsMetadata
{
  return [(AMDModelMetadata *)self outputsMetadata];
}

- (char)getModelArchType
{
  return [(AMDModelMetadata *)self modelArchType];
}

- (id)getModelUid
{
  return [(AMDModelMetadata *)self modelUid];
}

- (id)getMappingFileRequirement
{
  return [(AMDModelMetadata *)self mappingFilesRequired];
}

- (BOOL)isValid
{
  v10 = [(AMDModelMetadata *)self inputsMetadata];
  char v17 = 0;
  BOOL v11 = 0;
  if (v10)
  {
    uint64_t v18 = [(AMDModelMetadata *)self inputsMetadata];
    char v17 = 1;
    BOOL v11 = [(NSMutableDictionary *)v18 count] != 0;
  }
  if (v17) {

  }
  id v8 = [(AMDModelMetadata *)self outputsMetadata];
  char v15 = 0;
  BOOL v9 = 0;
  if (v8)
  {
    id v16 = [(AMDModelMetadata *)self outputsMetadata];
    char v15 = 1;
    BOOL v9 = [(NSMutableDictionary *)v16 count] != 0;
  }
  if (v15) {

  }
  v6 = [(AMDModelMetadata *)self assetsMetadata];
  char v13 = 0;
  BOOL v7 = 0;
  if (v6)
  {
    uint64_t v14 = [(AMDModelMetadata *)self assetsMetadata];
    char v13 = 1;
    BOOL v7 = [(AMDModelAssetsMetadata *)v14 isValid];
  }
  if (v13) {

  }
  BOOL v12 = [(AMDModelMetadata *)self modelArchType] != 0;
  v2 = [(AMDModelMetadata *)self modelUid];
  BOOL v4 = v2 != 0;

  BOOL v5 = 0;
  if (v11)
  {
    BOOL v5 = 0;
    if (v9)
    {
      BOOL v5 = 0;
      if (v7)
      {
        BOOL v5 = 0;
        if (v12) {
          return v4;
        }
      }
    }
  }
  return v5;
}

- (NSString)modelId
{
  return self->_modelId;
}

- (void)setModelId:(id)a3
{
}

- (NSString)modelUid
{
  return self->_modelUid;
}

- (void)setModelUid:(id)a3
{
}

- (char)modelArchType
{
  return self->_modelArchType;
}

- (void)setModelArchType:(char)a3
{
  self->_modelArchType = a3;
}

- (NSMutableDictionary)inputsMetadata
{
  return self->_inputsMetadata;
}

- (void)setInputsMetadata:(id)a3
{
}

- (NSMutableDictionary)outputsMetadata
{
  return self->_outputsMetadata;
}

- (void)setOutputsMetadata:(id)a3
{
}

- (AMDModelAssetsMetadata)assetsMetadata
{
  return self->_assetsMetadata;
}

- (void)setAssetsMetadata:(id)a3
{
}

- (NSNumber)mappingFilesRequired
{
  return self->_mappingFilesRequired;
}

- (void)setMappingFilesRequired:(id)a3
{
}

- (void).cxx_destruct
{
}

@end