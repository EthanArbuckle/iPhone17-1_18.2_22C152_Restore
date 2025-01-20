@interface AMDLighthouseODMLPlugin
+ (void)initialize;
- (AMDLighthouseODMLPlugin)init;
- (AMDLighthouseODMLWorker)worker;
- (MLRTaskAttachments)attachments;
- (NSDictionary)recipe;
- (NSLocale)locale;
- (NSMutableArray)candidateModels;
- (NSNumber)taskShouldBeStopped;
- (TRIClient)client;
- (id)checkIfTaskShouldBeStopped:(id *)a3;
- (id)createMLRTaskAttachmentsObject:(id)a3 modelDirURL:(id)a4 error:(id *)a5;
- (id)downloadModel:(id)a3 outError:(id *)a4;
- (id)gatherGaussianResults:(id)a3 withPartitions:(id)a4 outError:(id *)a5;
- (id)getAttachmentURLByName:(id)a3 namespaceID:(id)a4 triClient:(id)a5 isDirectory:(BOOL)a6 error:(id *)a7;
- (id)performTask:(id)a3 outError:(id *)a4;
- (id)performTrialTask:(id)a3 outError:(id *)a4;
- (id)setUpForGenericTaskWithClient:(id)a3 outError:(id *)a4;
- (id)setupModelDirectoryWithTask:(id)a3 error:(id *)a4;
- (id)setupRecipeWithTask:(id)a3 error:(id *)a4;
- (id)targetingKeyValuePairsForKeys:(id)a3 error:(id *)a4;
- (void)setAttachments:(id)a3;
- (void)setCandidateModels:(id)a3;
- (void)setClient:(id)a3;
- (void)setLocale:(id)a3;
- (void)setRecipe:(id)a3;
- (void)setTaskShouldBeStopped:(id)a3;
- (void)setWorker:(id)a3;
- (void)stop;
@end

@implementation AMDLighthouseODMLPlugin

+ (void)initialize
{
  if (a1 == (id)objc_opt_class())
  {
    os_log_t v2 = os_log_create("com.apple.aiml.AMDLighthouseODMLPlugin", "AMDLighthouseODMLPlugin");
    v3 = (void *)sLog;
    sLog = (uint64_t)v2;
  }
}

- (id)getAttachmentURLByName:(id)a3 namespaceID:(id)a4 triClient:(id)a5 isDirectory:(BOOL)a6 error:(id *)a7
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v30 = 0;
  objc_storeStrong(&v30, a4);
  id v29 = 0;
  objc_storeStrong(&v29, a5);
  BOOL v28 = a6;
  v27 = a7;
  id v26 = [v29 levelForFactor:location[0] withNamespaceName:v30];
  id v25 = 0;
  if (a6) {
    id v7 = [v26 directoryValue];
  }
  else {
    id v7 = [v26 fileValue];
  }
  id v8 = v25;
  id v25 = v7;

  id v15 = [v25 path];
  id v24 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:");

  id v23 = +[NSFileManager defaultManager];
  id v16 = [v24 path];
  unsigned __int8 v17 = objc_msgSend(v23, "fileExistsAtPath:");

  if (v17)
  {
    id v32 = v24;
  }
  else
  {
    id v22 = (id)sLog;
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v35, (uint64_t)location[0], (uint64_t)v24);
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v22, OS_LOG_TYPE_ERROR, "Failed to load '%@' from %@", v35, 0x16u);
    }
    objc_storeStrong(&v22, 0);
    if (v27)
    {
      v12 = AMDLighthouseODMLPluginErrorDomain;
      NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
      v14 = +[NSString stringWithFormat:@"'%@' level missing in Trial", location[0]];
      v34 = v14;
      v13 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      v9 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v12, 133);
      id *v27 = v9;
    }
    id v32 = 0;
  }
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
  v10 = v32;

  return v10;
}

- (id)createMLRTaskAttachmentsObject:(id)a3 modelDirURL:(id)a4 error:(id *)a5
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = 0;
  objc_storeStrong(&v22, a4);
  v21[1] = a5;
  v21[0] = [location[0] objectForKey:AttachmentKeys];
  id v20 = (id)objc_opt_new();
  memset(__b, 0, sizeof(__b));
  id v14 = v21[0];
  id v15 = [v14 countByEnumeratingWithState:__b objects:v24 count:16];
  if (v15)
  {
    uint64_t v9 = *(void *)__b[2];
    uint64_t v10 = 0;
    id v11 = v15;
    while (1)
    {
      uint64_t v8 = v10;
      if (*(void *)__b[2] != v9) {
        objc_enumerationMutation(v14);
      }
      uint64_t v19 = *(void *)(__b[1] + 8 * v10);
      id v17 = [v22 URLByAppendingPathComponent:v19];
      [v20 addObject:v17];
      objc_storeStrong(&v17, 0);
      ++v10;
      if (v8 + 1 >= (unint64_t)v11)
      {
        uint64_t v10 = 0;
        id v11 = [v14 countByEnumeratingWithState:__b objects:v24 count:16];
        if (!v11) {
          break;
        }
      }
    }
  }

  id v5 = objc_alloc((Class)MLRTaskAttachments);
  id v16 = [v5 initWithURLs:v20];
  id v7 = v16;
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);

  return v7;
}

- (id)setupRecipeWithTask:(id)a3 error:(id *)a4
{
  v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v29[1] = a4;
  [(AMDLighthouseODMLPlugin *)v31 setClient:location[0]];
  id v17 = v31;
  id v15 = RecipeAttachmentKey;
  id v16 = TrialNamespace;
  v18 = [(AMDLighthouseODMLPlugin *)v31 client];
  v29[0] = -[AMDLighthouseODMLPlugin getAttachmentURLByName:namespaceID:triClient:isDirectory:error:](v17, "getAttachmentURLByName:namespaceID:triClient:isDirectory:error:", v15, v16);

  if (v29[0])
  {
    id v27 = (id)sLog;
    os_log_type_t v26 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_INFO))
    {
      id v13 = [v29[0] path];
      __os_log_helper_16_2_1_8_64((uint64_t)v35, (uint64_t)v13);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v27, v26, "recipe path: %@", v35, 0xCu);
    }
    objc_storeStrong(&v27, 0);
    id v25 = 0;
    id v7 = objc_alloc((Class)NSData);
    id v9 = [v29[0] path];
    id v23 = v25;
    id v8 = objc_msgSend(v7, "initWithContentsOfFile:options:error:");
    objc_storeStrong(&v25, v23);
    id v24 = v8;

    id v22 = v25;
    id v10 = +[NSJSONSerialization JSONObjectWithData:v24 options:0 error:&v22];
    objc_storeStrong(&v25, v22);
    [(AMDLighthouseODMLPlugin *)v31 setRecipe:v10];

    id v11 = [(AMDLighthouseODMLPlugin *)v31 recipe];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v19 = (id)sLog;
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_INFO))
      {
        v6 = [(AMDLighthouseODMLPlugin *)v31 recipe];
        __os_log_helper_16_2_1_8_64((uint64_t)v33, (uint64_t)v6);
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v19, OS_LOG_TYPE_INFO, "Loaded JSON recipe: %@", v33, 0xCu);
      }
      objc_storeStrong(&v19, 0);
      id v32 = &off_10002DF00;
      int v28 = 1;
    }
    else
    {
      id v21 = (id)sLog;
      os_log_type_t v20 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v34, (uint64_t)v25);
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v21, v20, "Failed to load recipe json with error: %@", v34, 0xCu);
      }
      objc_storeStrong(&v21, 0);
      id v32 = 0;
      int v28 = 1;
    }
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v25, 0);
  }
  else
  {
    id v32 = 0;
    int v28 = 1;
  }
  objc_storeStrong(v29, 0);
  objc_storeStrong(location, 0);
  v4 = v32;

  return v4;
}

- (id)setupModelDirectoryWithTask:(id)a3 error:(id *)a4
{
  id v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17[1] = a4;
  v17[0] = [(AMDLighthouseODMLPlugin *)v19 getAttachmentURLByName:ModelsDirectoryKey namespaceID:TrialNamespace triClient:location[0] isDirectory:1 error:a4];
  if (v17[0])
  {
    id v10 = [(AMDLighthouseODMLPlugin *)v19 worker];
    [(AMDLighthouseODMLWorker *)v10 setModelsURL:v17[0]];

    id v15 = (id)sLog;
    os_log_type_t v14 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_INFO))
    {
      id v9 = [v17[0] path];
      __os_log_helper_16_2_1_8_64((uint64_t)v21, (uint64_t)v9);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v15, v14, "model path: %@", v21, 0xCu);
    }
    objc_storeStrong(&v15, 0);
    id v13 = 0;
    v6 = v19;
    id v8 = [(AMDLighthouseODMLPlugin *)v19 recipe];
    id obj = v13;
    id v7 = -[AMDLighthouseODMLPlugin createMLRTaskAttachmentsObject:modelDirURL:error:](v6, "createMLRTaskAttachmentsObject:modelDirURL:error:");
    objc_storeStrong(&v13, obj);
    [(AMDLighthouseODMLPlugin *)v19 setAttachments:v7];

    os_log_type_t v20 = &off_10002DF00;
    int v16 = 1;
    objc_storeStrong(&v13, 0);
  }
  else
  {
    os_log_type_t v20 = 0;
    int v16 = 1;
  }
  objc_storeStrong(v17, 0);
  objc_storeStrong(location, 0);
  v4 = v20;

  return v4;
}

- (id)gatherGaussianResults:(id)a3 withPartitions:(id)a4 outError:(id *)a5
{
  v41 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v39 = 0;
  objc_storeStrong(&v39, a4);
  v38 = a5;
  id v37 = objc_alloc_init((Class)NSMutableDictionary);
  id v36 = objc_alloc_init((Class)NSMutableDictionary);
  memset(__b, 0, sizeof(__b));
  id v25 = location[0];
  id v26 = [v25 countByEnumeratingWithState:__b objects:v44 count:16];
  if (v26)
  {
    uint64_t v20 = *(void *)__b[2];
    uint64_t v21 = 0;
    id v22 = v26;
    while (1)
    {
      uint64_t v19 = v21;
      if (*(void *)__b[2] != v20) {
        objc_enumerationMutation(v25);
      }
      id v35 = *(id *)(__b[1] + 8 * v21);
      id v33 = [v35 objectForKey:ModelMetrics];
      id v32 = [v35 objectForKey:ModelName];
      memset(v30, 0, sizeof(v30));
      id v17 = v33;
      id v18 = [v17 countByEnumeratingWithState:v30 objects:v43 count:16];
      if (v18)
      {
        uint64_t v14 = *(void *)v30[2];
        uint64_t v15 = 0;
        id v16 = v18;
        while (1)
        {
          uint64_t v13 = v15;
          if (*(void *)v30[2] != v14) {
            objc_enumerationMutation(v17);
          }
          uint64_t v31 = *(void *)(v30[1] + 8 * v15);
          id v5 = [(AMDLighthouseODMLPlugin *)v41 checkIfTaskShouldBeStopped:v38];
          BOOL v12 = v5 != 0;

          if (!v12) {
            break;
          }
          id v28 = [v33 objectForKey:v31];
          id v27 = +[NSString stringWithFormat:@"%@:%@", v32, v31];
          if ([v39 containsObject:v27])
          {
            id v9 = v36;
            [v28 floatValue];
            id v10 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
            objc_msgSend(v9, "setObject:forKey:");
          }
          else
          {
            [v28 floatValue];
            id v11 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
            objc_msgSend(v37, "setObject:forKeyedSubscript:");
          }
          objc_storeStrong(&v27, 0);
          objc_storeStrong(&v28, 0);
          ++v15;
          if (v13 + 1 >= (unint64_t)v16)
          {
            uint64_t v15 = 0;
            id v16 = [v17 countByEnumeratingWithState:v30 objects:v43 count:16];
            if (!v16) {
              goto LABEL_16;
            }
          }
        }
        id v42 = 0;
        int v29 = 1;
      }
      else
      {
LABEL_16:
        int v29 = 0;
      }

      if (!v29) {
        int v29 = 0;
      }
      objc_storeStrong(&v32, 0);
      objc_storeStrong(&v33, 0);
      if (v29) {
        break;
      }
      ++v21;
      if (v19 + 1 >= (unint64_t)v22)
      {
        uint64_t v21 = 0;
        id v22 = [v25 countByEnumeratingWithState:__b objects:v44 count:16];
        if (!v22) {
          goto LABEL_22;
        }
      }
    }
  }
  else
  {
LABEL_22:
    int v29 = 0;
  }

  if (!v29)
  {
    id v6 = objc_alloc((Class)MLRTrialDediscoTaskResult);
    id v42 = [v6 initWithJSONResult:v37 namespaceName:TrialNamespace factorName:@"recipe" additionalKeyVariables:v36];
    int v29 = 1;
  }
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(location, 0);
  id v7 = v42;

  return v7;
}

- (id)downloadModel:(id)a3 outError:(id *)a4
{
  id v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v26 = a4;
  id v25 = dispatch_semaphore_create(0);
  NSLog(@"Calling downloadLevelsForFactors");
  id v16 = [(AMDLighthouseODMLPlugin *)v28 client];
  id v30 = location[0];
  uint64_t v15 = +[NSArray arrayWithObjects:&v30 count:1];
  uint64_t v13 = TrialNamespace;
  id v14 = (id)objc_opt_new();
  id v18 = _NSConcreteStackBlock;
  int v19 = -1073741824;
  int v20 = 0;
  uint64_t v21 = __50__AMDLighthouseODMLPlugin_downloadModel_outError___block_invoke;
  id v22 = &unk_10002C320;
  id v23 = location[0];
  id v24 = v25;
  [(TRIClient *)v16 downloadLevelsForFactors:v15 withNamespace:v13 queue:0 options:v14 progress:0 completion:&v18];

  dsema = v25;
  dispatch_time_t v4 = dispatch_time(0, 600000000000);
  if (dispatch_semaphore_wait(dsema, v4))
  {
    id v5 = objc_alloc((Class)NSError);
    id v6 = [v5 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:149 userInfo:0];
    *id v26 = v6;
    int v29 = 0;
  }
  else
  {
    id v7 = [(AMDLighthouseODMLPlugin *)v28 checkIfTaskShouldBeStopped:v26];
    BOOL v11 = v7 != 0;

    if (v11)
    {
      id v10 = [(AMDLighthouseODMLPlugin *)v28 client];
      [(TRIClient *)v10 refresh];

      int v29 = +[NSNumber numberWithLong:1];
    }
    else
    {
      int v29 = 0;
    }
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
  id v8 = v29;

  return v8;
}

void __50__AMDLighthouseODMLPlugin_downloadModel_outError___block_invoke(uint64_t a1, char a2, id obj)
{
  uint64_t v6 = a1;
  char v5 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  if ((v5 & 1) == 1) {
    NSLog(@"succeeded to download factor level %@", *(void *)(a1 + 32));
  }
  else {
    NSLog(@"failed to download factor level %@", *(void *)(a1 + 32));
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  objc_storeStrong(&location, 0);
}

- (id)targetingKeyValuePairsForKeys:(id)a3 error:(id *)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7[1] = a4;
  v7[0] = objc_alloc_init(AMDDODMLCustomTargetingHelper);
  id v6 = [v7[0] mainTargetingResolver:location[0] error:a4];
  objc_storeStrong(v7, 0);
  objc_storeStrong(location, 0);

  return v6;
}

- (id)checkIfTaskShouldBeStopped:(id *)a3
{
  if ([(NSNumber *)self->_taskShouldBeStopped intValue] == 1)
  {
    id v3 = objc_alloc((Class)NSError);
    *a3 = [v3 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:148 userInfo:0];
    id v6 = 0;
  }
  else
  {
    id v6 = +[NSNumber numberWithLong:1];
  }

  return v6;
}

- (id)setUpForGenericTaskWithClient:(id)a3 outError:(id *)a4
{
  id v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v25 = a4;
  dispatch_time_t v4 = +[NSNumber numberWithInt:0];
  taskShouldBeStopped = v27->_taskShouldBeStopped;
  v27->_taskShouldBeStopped = v4;

  id v24 = (id)sLog;
  char v23 = 1;
  if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_INFO))
  {
    log = v24;
    os_log_type_t type = v23;
    __os_log_helper_16_0_0(v22);
    _os_log_impl((void *)&_mh_execute_header, log, type, "AMDLighthouseODMLPlugin: Start task", v22, 2u);
  }
  objc_storeStrong(&v24, 0);
  id v21 = [(AMDLighthouseODMLPlugin *)v27 setupRecipeWithTask:location[0] error:v25];
  if (v21)
  {
    id v10 = [(AMDLighthouseODMLPlugin *)v27 worker];
    id v9 = [(AMDLighthouseODMLPlugin *)v27 recipe];
    id v19 = -[AMDLighthouseODMLWorker checkIfModelShouldBeDownloaded:outError:](v10, "checkIfModelShouldBeDownloaded:outError:");

    id v18 = [v19 getCoreDictionary];
    if (v18)
    {
      id v17 = [v19 processRecipe:v25 errorDomain:AMDLighthouseODMLPluginErrorDomain];
      if (v17)
      {
        id v8 = [(AMDLighthouseODMLPlugin *)v27 recipe];
        id v16 = [(NSDictionary *)v8 objectForKeyedSubscript:ModelDirectoryName];

        if (!v16) {
          objc_storeStrong(&v16, ModelsDirectoryKey);
        }
        id v15 = [(AMDLighthouseODMLPlugin *)v27 downloadModel:v16 outError:v25];
        if (v15)
        {
          int v20 = 0;
        }
        else
        {
          id v28 = 0;
          int v20 = 1;
        }
        objc_storeStrong(&v15, 0);
        objc_storeStrong(&v16, 0);
        if (!v20)
        {
          id v14 = [(AMDLighthouseODMLPlugin *)v27 setupModelDirectoryWithTask:location[0] error:v25];
          if (v14) {
            id v28 = v18;
          }
          else {
            id v28 = 0;
          }
          int v20 = 1;
          objc_storeStrong(&v14, 0);
        }
      }
      else
      {
        id v28 = 0;
        int v20 = 1;
      }
      objc_storeStrong(&v17, 0);
    }
    else
    {
      id v28 = 0;
      int v20 = 1;
    }
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v19, 0);
  }
  else
  {
    id v28 = 0;
    int v20 = 1;
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
  id v6 = v28;

  return v6;
}

- (AMDLighthouseODMLPlugin)init
{
  SEL v4 = a2;
  id location = 0;
  v3.receiver = self;
  v3.super_class = (Class)AMDLighthouseODMLPlugin;
  id location = [(AMDLighthouseODMLPlugin *)&v3 init];
  if (location) {
    id v6 = (AMDLighthouseODMLPlugin *)location;
  }
  else {
    id v6 = 0;
  }
  objc_storeStrong(&location, 0);
  return v6;
}

- (id)performTrialTask:(id)a3 outError:(id *)a4
{
  v51 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v49 = (uint64_t *)a4;
  id v30 = objc_alloc_init((Class)AMDLighthouseODMLWorker);
  -[AMDLighthouseODMLPlugin setWorker:](v51, "setWorker:");

  id v48 = [location[0] triClient];
  id v47 = [(AMDLighthouseODMLPlugin *)v51 setUpForGenericTaskWithClient:v48 outError:a4];
  uint64_t v31 = [(AMDLighthouseODMLPlugin *)v51 client];
  id v46 = [(TRIClient *)v31 experimentIdentifiersWithNamespaceName:TrialNamespace];

  id v32 = [(AMDLighthouseODMLPlugin *)v51 worker];
  [(AMDLighthouseODMLWorker *)v32 setTriExperimentIdentifiers:v46];

  if (*a4)
  {
    id v45 = (id)sLog;
    os_log_type_t v44 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v45, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v53, *v49);
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v45, v44, "Encountered error when setting up for generic task: %@", v53, 0xCu);
    }
    objc_storeStrong(&v45, 0);
    id v52 = 0;
    int v43 = 1;
  }
  else
  {
    id v28 = [(AMDLighthouseODMLPlugin *)v51 worker];
    id v27 = [(AMDLighthouseODMLPlugin *)v51 recipe];
    id v26 = [(AMDLighthouseODMLPlugin *)v51 attachments];
    id v42 = -[AMDLighthouseODMLWorker gatherMetricsToReturn:withRecipe:withAttachments:outError:](v28, "gatherMetricsToReturn:withRecipe:withAttachments:outError:", v47, v27);

    if (v42)
    {
      id v24 = [(AMDLighthouseODMLPlugin *)v51 recipe];
      id v23 = [(NSDictionary *)v24 objectForKeyedSubscript:LoggingStrategies];
      unsigned __int8 v25 = [v23 containsObject:GaussianDeDisco];

      if (v25)
      {
        id v21 = [(AMDLighthouseODMLPlugin *)v51 recipe];
        id v20 = [(NSDictionary *)v21 objectForKeyedSubscript:LoggingStrategies];
        BOOL v22 = (unint64_t)[v20 count] <= 1;

        if (v22) {
          goto LABEL_15;
        }
        id v19 = [(AMDLighthouseODMLPlugin *)v51 worker];
        id v18 = [(AMDLighthouseODMLPlugin *)v51 recipe];
        id v17 = [(NSDictionary *)v18 objectForKeyedSubscript:LoggingStrategies];
        id v41 = -[AMDLighthouseODMLWorker logAllResultsToCoreAnalyticsOrDeDisco:withLoggingStrategies:outError:](v19, "logAllResultsToCoreAnalyticsOrDeDisco:withLoggingStrategies:outError:", v42);

        if (v41)
        {
          id v40 = (id)sLog;
          char v39 = 1;
          if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_INFO))
          {
            id v15 = v40;
            os_log_type_t type = v39;
            __os_log_helper_16_0_0(v38);
            _os_log_impl((void *)&_mh_execute_header, v15, type, "AMDLighthouseODMLPlugin: Finished task", v38, 2u);
          }
          objc_storeStrong(&v40, 0);
          int v43 = 0;
        }
        else
        {
          id v52 = 0;
          int v43 = 1;
        }
        objc_storeStrong(&v41, 0);
        if (!v43)
        {
LABEL_15:
          BOOL v12 = v51;
          id v11 = v42;
          id v14 = [(AMDLighthouseODMLPlugin *)v51 recipe];
          id v13 = [(NSDictionary *)v14 objectForKeyedSubscript:GaussianDeDiscoPartitions];
          id v37 = -[AMDLighthouseODMLPlugin gatherGaussianResults:withPartitions:outError:](v12, "gatherGaussianResults:withPartitions:outError:", v11);

          if (v37) {
            id v52 = v37;
          }
          else {
            id v52 = 0;
          }
          int v43 = 1;
          objc_storeStrong(&v37, 0);
        }
      }
      else
      {
        id v10 = [(AMDLighthouseODMLPlugin *)v51 worker];
        id v9 = [(AMDLighthouseODMLPlugin *)v51 recipe];
        id v8 = [(NSDictionary *)v9 objectForKeyedSubscript:LoggingStrategies];
        id v36 = -[AMDLighthouseODMLWorker logAllResultsToCoreAnalyticsOrDeDisco:withLoggingStrategies:outError:](v10, "logAllResultsToCoreAnalyticsOrDeDisco:withLoggingStrategies:outError:", v42);

        if (v36)
        {
          id v35 = (id)sLog;
          char v34 = 1;
          if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_INFO))
          {
            id v6 = v35;
            os_log_type_t v7 = v34;
            __os_log_helper_16_0_0(v33);
            _os_log_impl((void *)&_mh_execute_header, v6, v7, "AMDLighthouseODMLPlugin: Finished task", v33, 2u);
          }
          objc_storeStrong(&v35, 0);
          id v52 = (id)objc_opt_new();
          int v43 = 1;
        }
        else
        {
          id v52 = 0;
          int v43 = 1;
        }
        objc_storeStrong(&v36, 0);
      }
    }
    else
    {
      id v52 = 0;
      int v43 = 1;
    }
    objc_storeStrong(&v42, 0);
  }
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(location, 0);
  SEL v4 = v52;

  return v4;
}

- (id)performTask:(id)a3 outError:(id *)a4
{
  id v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v26 = (uint64_t *)a4;
  id v15 = objc_alloc_init((Class)AMDLighthouseODMLWorker);
  -[AMDLighthouseODMLPlugin setWorker:](v28, "setWorker:");

  id v25 = +[TRIClient mlr_clientWithMLRTask:location[0]];
  id v24 = [(AMDLighthouseODMLPlugin *)v28 setUpForGenericTaskWithClient:v25 outError:a4];
  if (*a4)
  {
    id v23 = (id)sLog;
    os_log_type_t v22 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v30, *v26);
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v23, v22, "Encountered error when setting up for generic task: %@", v30, 0xCu);
    }
    objc_storeStrong(&v23, 0);
    id v29 = 0;
    int v21 = 1;
  }
  else
  {
    id v13 = [(AMDLighthouseODMLPlugin *)v28 worker];
    BOOL v12 = [(AMDLighthouseODMLPlugin *)v28 recipe];
    id v11 = [(AMDLighthouseODMLPlugin *)v28 attachments];
    id v20 = -[AMDLighthouseODMLWorker gatherMetricsToReturn:withRecipe:withAttachments:outError:](v13, "gatherMetricsToReturn:withRecipe:withAttachments:outError:", v24, v12);

    if (v20)
    {
      id v10 = [(AMDLighthouseODMLPlugin *)v28 worker];
      id v9 = [(AMDLighthouseODMLPlugin *)v28 recipe];
      id v8 = [(NSDictionary *)v9 objectForKeyedSubscript:LoggingStrategies];
      id v19 = -[AMDLighthouseODMLWorker logAllResultsToCoreAnalyticsOrDeDisco:withLoggingStrategies:outError:](v10, "logAllResultsToCoreAnalyticsOrDeDisco:withLoggingStrategies:outError:", v20);

      if (v19)
      {
        id v18 = (id)sLog;
        char v17 = 1;
        if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_INFO))
        {
          id v6 = v18;
          os_log_type_t v7 = v17;
          __os_log_helper_16_0_0(v16);
          _os_log_impl((void *)&_mh_execute_header, v6, v7, "AMDLighthouseODMLPlugin: Finished task", v16, 2u);
        }
        objc_storeStrong(&v18, 0);
        id v29 = [objc_alloc((Class)MLRTaskResult) initWithJSONResult:&off_10002DF28 unprivatizedVector:0];
        int v21 = 1;
      }
      else
      {
        id v29 = 0;
        int v21 = 1;
      }
      objc_storeStrong(&v19, 0);
    }
    else
    {
      id v29 = 0;
      int v21 = 1;
    }
    objc_storeStrong(&v20, 0);
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
  SEL v4 = v29;

  return v4;
}

- (void)stop
{
  os_log_t v2 = +[NSNumber numberWithInt:1];
  taskShouldBeStopped = self->_taskShouldBeStopped;
  self->_taskShouldBeStopped = v2;

  SEL v4 = [(AMDLighthouseODMLPlugin *)self worker];
  BOOL v8 = v4 == 0;

  if (!v8)
  {
    os_log_type_t v7 = [(AMDLighthouseODMLPlugin *)self worker];
    [(AMDLighthouseODMLWorker *)v7 stop];
  }
  id v6 = [(AMDLighthouseODMLPlugin *)self client];
  id v10 = ModelsDirectoryKey;
  char v5 = +[NSArray arrayWithObjects:&v10 count:1];
  -[TRIClient removeLevelsForFactors:withNamespace:queue:completion:](v6, "removeLevelsForFactors:withNamespace:queue:completion:");
}

void __31__AMDLighthouseODMLPlugin_stop__block_invoke(id a1, BOOL a2, NSError *a3)
{
  id v5 = a1;
  BOOL v4 = a2;
  id location = 0;
  objc_storeStrong(&location, a3);
  if (v4) {
    NSLog(@"succeeded cancel/undo download %@", ModelsDirectoryKey);
  }
  else {
    NSLog(@"failed to cancel/undo download %@", ModelsDirectoryKey);
  }
  objc_storeStrong(&location, 0);
}

- (NSMutableArray)candidateModels
{
  return self->_candidateModels;
}

- (void)setCandidateModels:(id)a3
{
}

- (NSDictionary)recipe
{
  return self->_recipe;
}

- (void)setRecipe:(id)a3
{
}

- (MLRTaskAttachments)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (TRIClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (NSNumber)taskShouldBeStopped
{
  return self->_taskShouldBeStopped;
}

- (void)setTaskShouldBeStopped:(id)a3
{
}

- (AMDLighthouseODMLWorker)worker
{
  return self->_worker;
}

- (void)setWorker:(id)a3
{
}

- (void).cxx_destruct
{
}

@end