@interface CPLCloudKitResourcesCheckTask
- (BOOL)_checkResource:(id)a3 record:(id)a4 error:(id *)a5;
- (CPLCloudKitResourcesCheckTask)initWithController:(id)a3 resources:(id)a4 targetMapping:(id)a5 transportScopeMapping:(id)a6 completionHandler:(id)a7;
- (void)runOperations;
@end

@implementation CPLCloudKitResourcesCheckTask

- (CPLCloudKitResourcesCheckTask)initWithController:(id)a3 resources:(id)a4 targetMapping:(id)a5 transportScopeMapping:(id)a6 completionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)CPLCloudKitResourcesCheckTask;
  v16 = [(CPLCloudKitTransportTask *)&v22 initWithController:a3];
  if (v16)
  {
    id v17 = [v15 copy];
    id completionHandler = v16->_completionHandler;
    v16->_id completionHandler = v17;

    v19 = (NSArray *)[v12 copy];
    resources = v16->_resources;
    v16->_resources = v19;

    objc_storeStrong((id *)&v16->_targetMapping, a5);
    [(CPLCloudKitTransportTask *)v16 setTransportScopeMapping:v14];
    [(CPLCloudKitTransportTask *)v16 setForeground:1];
  }

  return v16;
}

- (void)runOperations
{
  id v29 = 0;
  unsigned __int8 v3 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v29];
  id v4 = v29;
  v5 = v4;
  if (v3)
  {
    id v22 = v4;
    if (!_CPLSilentLogging)
    {
      v6 = sub_1000C7AF8();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        resources = self->_resources;
        *(_DWORD *)buf = 138412290;
        v32 = resources;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Checking resources %@", buf, 0xCu);
      }
    }
    id v8 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSArray count](self->_resources, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v21 = self;
    v9 = self->_resources;
    id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v26;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(NSArray **)(*((void *)&v25 + 1) + 8 * i);
          id v15 = [(NSArray *)v14 itemScopedIdentifier];
          if (v15)
          {
            v16 = [v8 objectForKeyedSubscript:v15];
            id v17 = [v16 mutableCopy];

            if (!v17)
            {
              id v17 = objc_alloc_init((Class)NSMutableArray);
              [v8 setObject:v17 forKeyedSubscript:v15];
            }
            [v17 addObject:v14];
          }
          else
          {
            if (_CPLSilentLogging) {
              goto LABEL_19;
            }
            id v17 = sub_1000C7AF8();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v32 = v14;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Missing identifier to check for resource %@", buf, 0xCu);
            }
          }

LABEL_19:
        }
        id v11 = [(NSArray *)v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v11);
    }

    v18 = [v8 allKeys];
    targetMapping = v21->_targetMapping;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000C7B4C;
    v23[3] = &unk_100278E38;
    v23[4] = v21;
    id v24 = v8;
    id v20 = v8;
    [(CPLCloudKitTransportTask *)v21 fetchFullRecordsForScopedIdentifiers:v18 targetMapping:targetMapping completionHandler:v23];

    v5 = v22;
  }
  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (BOOL)_checkResource:(id)a3 record:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 resourceType];
  id v10 = [v8 resourceForType:v9];

  if (!v10)
  {
    id v11 = +[CPLResource shortDescriptionForResourceType:v9];
    id v25 = +[CPLErrors cplErrorWithCode:26, @"Unable to find resource %@ on cloud record", v11 description];
    goto LABEL_18;
  }
  id v11 = [v7 identity];
  uint64_t v12 = [v10 identity];
  [v11 imageDimensions];
  double v14 = v13;
  double v16 = v15;
  [v12 imageDimensions];
  if (v14 == v18 && v16 == v17)
  {
    id v20 = [v11 fileSize];
    if (v20 == [v12 fileSize])
    {
      uint64_t v21 = [v11 fileUTI];
      id v22 = [v12 fileUTI];
      unint64_t v23 = (unint64_t)v22;
      if (v21 && v22)
      {
        unsigned __int8 v24 = [(id)v21 isEqual:v22];

        if ((v24 & 1) == 0) {
          goto LABEL_17;
        }
LABEL_14:
        uint64_t v26 = [v11 fingerPrint];
        long long v27 = [v12 fingerPrint];
        unint64_t v28 = (unint64_t)v27;
        if (v26 && v27)
        {
          unsigned __int8 v29 = [(id)v26 isEqual:v27];

          if ((v29 & 1) == 0) {
            goto LABEL_17;
          }
        }
        else
        {

          if (v26 | v28) {
            goto LABEL_17;
          }
        }

        id v25 = 0;
        BOOL v31 = 1;
        goto LABEL_21;
      }

      if (!(v21 | v23)) {
        goto LABEL_14;
      }
    }
  }
LABEL_17:
  v30 = +[CPLResource shortDescriptionForResourceType:v9];
  id v25 = +[CPLErrors cplErrorWithCode:26, @"Resource %@ on cloud record is different from %@", v30, v7 description];

LABEL_18:
  if (a5)
  {
    id v25 = v25;
    BOOL v31 = 0;
    *a5 = v25;
  }
  else
  {
    BOOL v31 = 0;
  }
LABEL_21:

  return v31;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetMapping, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end