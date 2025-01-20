@interface ASDTPMActionFileReader
- (ASDPropertyAddress)propertyAddress;
- (ASDTPMActionFileReader)initWithConfig:(id)a3 forSequencer:(id)a4;
- (NSString)filePath;
- (id)convert:(id)a3;
- (int)action;
- (unsigned)propertyDataType;
- (void)action;
- (void)setFilePath:(id)a3;
- (void)setPropertyAddress:(id)a3;
- (void)setPropertyDataType:(unsigned int)a3;
@end

@implementation ASDTPMActionFileReader

- (ASDTPMActionFileReader)initWithConfig:(id)a3 forSequencer:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v28.receiver = self;
  v28.super_class = (Class)ASDTPMActionFileReader;
  v7 = [(ASDTPMAction *)&v28 initWithConfig:v6 forSequencer:a4];
  if (!v7) {
    goto LABEL_5;
  }
  v8 = [v6 asdtFilePath];
  [(ASDTPMActionFileReader *)v7 setFilePath:v8];

  v9 = [(ASDTPMActionFileReader *)v7 filePath];

  if (!v9)
  {
    v13 = (objc_class *)[v6 asdtBundleClass];
    v14 = [v6 asdtBundlePath];
    v15 = [v6 asdtBundleResource];
    v16 = [v6 asdtBundleExtension];
    v17 = [v6 asdtBundleSubdir];
    if (v15 && (unint64_t)v13 | (unint64_t)v14)
    {
      if (v13) {
        [MEMORY[0x263F086E0] bundleForClass:v13];
      }
      else {
      v18 = [MEMORY[0x263F086E0] bundleWithPath:v14];
      }
      v19 = v18;
      if (v18)
      {
        if (v17) {
          [v18 pathForResource:v15 ofType:v16 inDirectory:v17];
        }
        else {
        v22 = [v18 pathForResource:v15 ofType:v16];
        }
        [(ASDTPMActionFileReader *)v7 setFilePath:v22];

        v23 = [(ASDTPMActionFileReader *)v7 filePath];

        if (v23)
        {

          goto LABEL_3;
        }
        v20 = ASDTBaseLogType();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v25 = [(ASDTPMDevice *)v7 name];
          v26 = [v19 bundlePath];
          *(_DWORD *)buf = 138413314;
          v30 = v25;
          __int16 v31 = 2112;
          v32 = v15;
          __int16 v33 = 2112;
          v34 = v16;
          __int16 v35 = 2112;
          v36 = v17;
          __int16 v37 = 2112;
          v38 = v26;
          _os_log_error_impl(&dword_2489BC000, v20, OS_LOG_TYPE_ERROR, "%@: Could not generate path for bundle resource '%@', type '%@', subdir '%@'. Bundle path: %@", buf, 0x34u);
        }
      }
      else
      {
        v20 = ASDTBaseLogType();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v27 = [(ASDTPMDevice *)v7 name];
          v21 = v14;
          if (v13)
          {
            v21 = NSStringFromClass(v13);
          }
          *(_DWORD *)buf = 138412546;
          v30 = v27;
          __int16 v31 = 2112;
          v32 = v21;
          _os_log_error_impl(&dword_2489BC000, v20, OS_LOG_TYPE_ERROR, "%@: Bundle not found for %@", buf, 0x16u);
          if (v13) {
        }
          }
      }
    }
    else
    {
      v19 = ASDTBaseLogType();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[ASDTPMActionFileReader initWithConfig:forSequencer:](v7);
      }
    }

LABEL_31:
    v12 = 0;
    goto LABEL_32;
  }
LABEL_3:
  v10 = [v6 asdtPropertyAddress];
  [(ASDTPMActionFileReader *)v7 setPropertyAddress:v10];

  v11 = [(ASDTPMActionFileReader *)v7 propertyAddress];

  if (!v11)
  {
    v14 = ASDTBaseLogType();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ASDTPMActionFileReader initWithConfig:forSequencer:](v7);
    }
    goto LABEL_31;
  }
  -[ASDTPMActionFileReader setPropertyDataType:](v7, "setPropertyDataType:", [v6 asdtPropertyIsPList]);
LABEL_5:
  v12 = v7;
LABEL_32:

  return v12;
}

- (id)convert:(id)a3
{
  id v3 = a3;
  return v3;
}

- (int)action
{
  id v3 = (void *)MEMORY[0x263EFF8F8];
  v4 = [(ASDTPMActionFileReader *)self filePath];
  id v22 = 0;
  v5 = [v3 dataWithContentsOfFile:v4 options:2 error:&v22];
  id v6 = v22;

  if (v5)
  {
    v7 = [(ASDTPMActionFileReader *)self convert:v5];
    v21 = 0;
    if ([(ASDTPMActionFileReader *)self propertyDataType] == 1886155636)
    {
      v21 = v7;
      uint64_t v8 = 8;
      v9 = &v21;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v7;
        v9 = (void **)[v12 bytes];
        uint64_t v8 = [v12 length];
      }
      else
      {
        v9 = 0;
        uint64_t v8 = 0;
      }
    }
    v13 = [(ASDTPMActionFileReader *)self propertyAddress];
    uint64_t v19 = [v13 audioObjectPropertyAddress];
    LODWORD(v20) = v14;

    v15 = [(ASDTPMDevice *)self parentSequencer];
    v16 = [v15 parentDevice];
    int v17 = [v16 setProperty:&v19 withQualifierSize:0 qualifierData:0 dataSize:v8 andData:v9 forClient:0];

    if (v17) {
      int v11 = 0;
    }
    else {
      int v11 = 2003329396;
    }
  }
  else
  {
    v10 = ASDTBaseLogType();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      [(ASDTPMActionFileReader *)self action];
    }

    int v11 = [v6 code];
  }

  return v11;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
}

- (ASDPropertyAddress)propertyAddress
{
  return self->_propertyAddress;
}

- (void)setPropertyAddress:(id)a3
{
}

- (unsigned)propertyDataType
{
  return self->_propertyDataType;
}

- (void)setPropertyDataType:(unsigned int)a3
{
  self->_propertyDataType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyAddress, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
}

- (void)initWithConfig:(void *)a1 forSequencer:.cold.1(void *a1)
{
  id v6 = [a1 name];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x34u);
}

- (void)initWithConfig:(void *)a1 forSequencer:.cold.2(void *a1)
{
  id v6 = [a1 name];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0xCu);
}

- (void)action
{
  v4 = [a1 name];
  v5 = [a1 filePath];
  int v11 = [a2 description];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(v6, v7, v8, v9, v10, 0x20u);
}

@end