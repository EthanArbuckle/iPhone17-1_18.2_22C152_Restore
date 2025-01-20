@interface EspressoDataFrameStorage
+ (id)dataFrameStorageFromPath:(id)a3 error:(id *)a4;
- (NSMutableArray)dataFrames;
- (NSMutableDictionary)mappedFiles;
- (NSString)baseFilename;
- (id)dataFrameAtIndex:(unint64_t)a3;
- (unint64_t)numberOfDataFrames;
- (void)setBaseFilename:(id)a3;
- (void)setDataFrames:(id)a3;
- (void)setMappedFiles:(id)a3;
@end

@implementation EspressoDataFrameStorage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseFilename, 0);
  objc_storeStrong((id *)&self->_mappedFiles, 0);

  objc_storeStrong((id *)&self->_dataFrames, 0);
}

- (void)setBaseFilename:(id)a3
{
}

- (NSString)baseFilename
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMappedFiles:(id)a3
{
}

- (NSMutableDictionary)mappedFiles
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDataFrames:(id)a3
{
}

- (NSMutableArray)dataFrames
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (id)dataFrameAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_dataFrames objectAtIndexedSubscript:a3];
}

- (unint64_t)numberOfDataFrames
{
  return [(NSMutableArray *)self->_dataFrames count];
}

+ (id)dataFrameStorageFromPath:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  v5 = objc_opt_new();
  if (a4) {
    *a4 = 0;
  }
  v6 = objc_opt_new();
  [v5 setDataFrames:v6];

  v7 = objc_opt_new();
  [v5 setMappedFiles:v7];

  v8 = (Espresso *)[v5 setBaseFilename:v32];
  v10 = Espresso::espresso_os_log_subsystem(v8, v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v39 = v32;
    _os_log_impl(&dword_1920CB000, v10, OS_LOG_TYPE_INFO, "EspressoDataFrameStorage: load %@", buf, 0xCu);
  }

  v11 = [v32 pathExtension];
  int v12 = [v11 isEqualToString:@"json"];

  if (!v12)
  {
    v26 = [v32 pathExtension];
    int v27 = [v26 isEqualToString:@"db"];

    if (v27)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x58uLL);
      Espresso::not_implemented_error::not_implemented_error(exception);
    }
    Espresso::throw_exception_selector<Espresso::invalid_argument_error>("format not supported");
  }
  uint64_t v13 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v32];
  v31 = (void *)v13;
  if (!v13)
  {
    v29 = (std::runtime_error *)__cxa_allocate_exception(0x58uLL);
    Espresso::io_error::io_error(v29);
  }
  v14 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v13 options:0 error:a4];
  v15 = v14;
  if (!v14)
  {
    v30 = (std::runtime_error *)__cxa_allocate_exception(0x58uLL);
    Espresso::io_error::io_error(v30);
  }
  v16 = [v14 objectForKeyedSubscript:@"frames"];
  if (!v16) {
    Espresso::throw_exception_selector<Espresso::io_error>("Missing frames key");
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v17 = v16;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v34 != v19) {
          objc_enumerationMutation(v17);
        }
        uint64_t v21 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        v22 = objc_opt_new();
        [v22 loadFromDict:v21 frameStorage:v5];
        v23 = [v5 dataFrames];
        [v23 addObject:v22];
      }
      uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v18);
  }

  id v24 = v5;

  return v24;
}

@end