@interface APVersionHelper
+ (id)versionNumberFromJSONFileAtPath:(id)a3;
- (APVersionDatasource)datasource;
- (APVersionHelper)initWithDatasource:(id)a3;
- (id)_versionInDirectoryWithURLs:(id)a3;
- (int64_t)_getVersionForNodesAtDirectoryPath:(id)a3;
- (int64_t)systemVersion;
- (void)setDatasource:(id)a3;
@end

@implementation APVersionHelper

+ (id)versionNumberFromJSONFileAtPath:(id)a3
{
  v4 = objc_msgSend_dataWithContentsOfFile_(MEMORY[0x263EFF8F8], a2, (uint64_t)a3);
  if (v4)
  {
    v5 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x263F08900], v3, (uint64_t)v4, 0, 0);
    v7 = v5;
    if (v5)
    {
      v8 = objc_msgSend_objectForKey_(v5, v6, @"version");
      v9 = v8;
      if (v8)
      {
        v9 = v8;
        v10 = v9;
      }
      else
      {
        v11 = APLogForCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v13 = 0;
          _os_log_impl(&dword_24718C000, v11, OS_LOG_TYPE_ERROR, "Error Unable to get version from bundle.", v13, 2u);
        }

        v10 = 0;
      }
    }
    else
    {
      v9 = APLogForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_24718C000, v9, OS_LOG_TYPE_ERROR, "Error Unable to get dictionary from JSON.", v14, 2u);
      }
      v10 = 0;
    }
  }
  else
  {
    v7 = APLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24718C000, v7, OS_LOG_TYPE_ERROR, "Error getting data for JSON", buf, 2u);
    }
    v10 = 0;
  }

  return v10;
}

- (APVersionHelper)initWithDatasource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APVersionHelper;
  v6 = [(APVersionHelper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_datasource, a3);
  }

  return v7;
}

- (int64_t)systemVersion
{
  v4 = objc_msgSend_configSystemDirectoryPath(APConfigurationMediator, a2, v2);
  int64_t VersionForNodesAtDirectoryPath = objc_msgSend__getVersionForNodesAtDirectoryPath_(self, v5, (uint64_t)v4);

  return VersionForNodesAtDirectoryPath;
}

- (int64_t)_getVersionForNodesAtDirectoryPath:(id)a3
{
  v21[2] = *(id *)MEMORY[0x263EF8340];
  id v4 = a3;
  v6 = objc_msgSend_fileURLWithPath_(NSURL, v5, (uint64_t)v4);
  if (v6)
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2020000000;
    uint64_t v16 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v18 = 0x3042000000;
    v19 = sub_2471935B0;
    v20 = sub_2471935BC;
    v21[0] = 0;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = sub_2471935C4;
    v12[3] = &unk_265206358;
    v12[4] = self;
    v12[5] = &v13;
    v12[6] = &buf;
    v7 = (void (**)(void, void))MEMORY[0x24C54ADE0](v12);
    objc_storeWeak((id *)(*((void *)&buf + 1) + 40), v7);
    ((void (**)(void, void *))v7)[2](v7, v6);
    int64_t v8 = v14[3];

    _Block_object_dispose(&buf, 8);
    objc_destroyWeak(v21);
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    objc_super v9 = APLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138477827;
      *(void *)((char *)&buf + 4) = objc_opt_class();
      id v10 = *(id *)((char *)&buf + 4);
      _os_log_impl(&dword_24718C000, v9, OS_LOG_TYPE_ERROR, "[%{private}@] Error: Unable to create URL from directory path.", (uint8_t *)&buf, 0xCu);
    }
    int64_t v8 = 0;
  }

  return v8;
}

- (id)_versionInDirectoryWithURLs:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = a3;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v19, v23, 16);
  if (v5)
  {
    uint64_t v8 = v5;
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v3);
        }
        v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v12 = objc_msgSend_pathExtension(v11, v6, v7, (void)v19);
        char isEqualToString = objc_msgSend_isEqualToString_(v12, v13, @"json");

        if (isEqualToString)
        {
          uint64_t v16 = objc_msgSend_path(v11, v6, v7);
          uint64_t v15 = objc_msgSend_versionNumberFromJSONFileAtPath_(APVersionHelper, v17, (uint64_t)v16);

          goto LABEL_11;
        }
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v19, v23, 16);
      if (v8) {
        continue;
      }
      break;
    }
  }
  uint64_t v15 = 0;
LABEL_11:

  return v15;
}

- (APVersionDatasource)datasource
{
  return self->_datasource;
}

- (void)setDatasource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end