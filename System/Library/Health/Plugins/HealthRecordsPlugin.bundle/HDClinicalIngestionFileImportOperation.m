@interface HDClinicalIngestionFileImportOperation
- (HDClinicalIngestionFileImportOperation)initWithFileHandle:(id)a3;
- (NSData)documentData;
- (NSError)operationError;
- (NSFileHandle)fileHandle;
- (void)main;
- (void)setDocumentData:(id)a3;
- (void)setFileHandle:(id)a3;
- (void)setOperationError:(id)a3;
@end

@implementation HDClinicalIngestionFileImportOperation

- (HDClinicalIngestionFileImportOperation)initWithFileHandle:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDClinicalIngestionFileImportOperation;
  v5 = [(HDClinicalIngestionFileImportOperation *)&v8 init];
  v6 = v5;
  if (v5) {
    [(HDClinicalIngestionFileImportOperation *)v5 setFileHandle:v4];
  }

  return v6;
}

- (void)main
{
  v2 = self;
  fileHandle = self->_fileHandle;
  _HKInitializeLogging();
  id v4 = (void *)HKLogHealthRecords;
  if (fileHandle)
  {
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      v6 = [(HDClinicalIngestionFileImportOperation *)v2 debugDescription];
      *(_DWORD *)buf = 138543362;
      v66 = v6;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ file import beginning", buf, 0xCu);
    }
    v7 = [(NSFileHandle *)v2->_fileHandle readDataToEndOfFile];
    if (v7)
    {
      id v62 = 0;
      objc_super v8 = +[NSJSONSerialization hk_JSONObjectFromFHIRData:v7 options:0 error:&v62];
      id v9 = v62;
    }
    else
    {
      objc_super v8 = 0;
      id v9 = 0;
    }
    objc_opt_class();
    id v61 = v9;
    v10 = HKSafeObject();
    id v11 = v9;

    if (v10)
    {
      v12 = +[NSMutableArray array];
      v13 = [v10 objectForKeyedSubscript:@"resourceType"];
      v48 = v13;
      if (v13)
      {
        if ([v13 isEqualToString:@"Bundle"])
        {
          id v14 = v10;
        }
        else
        {
          CFStringRef v73 = @"resource";
          v74 = v10;
          v36 = +[NSDictionary dictionaryWithObjects:&v74 forKeys:&v73 count:1];
          [v12 addObject:v36];

          id v14 = 0;
        }
      }
      else
      {
        id v46 = v11;
        v47 = v7;
        v49 = v2;
        uint64_t v15 = [v10 objectForKey:@"resources"];
        objc_opt_class();
        v45 = (void *)v15;
        if (objc_opt_isKindOfClass()) {
          v16 = (void *)v15;
        }
        else {
          v16 = v8;
        }
        id v17 = v16;

        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id v44 = v17;
        id obj = [v17 allValues];
        id v18 = [obj countByEnumeratingWithState:&v57 objects:v72 count:16];
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = *(void *)v58;
          do
          {
            v21 = 0;
            id v50 = v19;
            do
            {
              if (*(void *)v58 != v20) {
                objc_enumerationMutation(obj);
              }
              v22 = *(void **)(*((void *)&v57 + 1) + 8 * (void)v21);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v23 = v20;
                long long v55 = 0u;
                long long v56 = 0u;
                long long v53 = 0u;
                long long v54 = 0u;
                id v24 = v22;
                id v25 = [v24 countByEnumeratingWithState:&v53 objects:v71 count:16];
                if (v25)
                {
                  id v26 = v25;
                  uint64_t v27 = *(void *)v54;
                  do
                  {
                    for (i = 0; i != v26; i = (char *)i + 1)
                    {
                      if (*(void *)v54 != v27) {
                        objc_enumerationMutation(v24);
                      }
                      uint64_t v29 = *(void *)(*((void *)&v53 + 1) + 8 * i);
                      CFStringRef v69 = @"resource";
                      uint64_t v70 = v29;
                      v30 = +[NSDictionary dictionaryWithObjects:&v70 forKeys:&v69 count:1];
                      [v12 addObject:v30];
                    }
                    id v26 = [v24 countByEnumeratingWithState:&v53 objects:v71 count:16];
                  }
                  while (v26);
                }

                uint64_t v20 = v23;
                id v19 = v50;
              }
              else
              {
                _HKInitializeLogging();
                v31 = (void *)HKLogHealthRecords;
                if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
                {
                  v32 = v31;
                  v33 = [(HDClinicalIngestionFileImportOperation *)v49 debugDescription];
                  v34 = objc_opt_class();
                  *(_DWORD *)buf = 138543618;
                  v66 = v33;
                  __int16 v67 = 2114;
                  id v68 = v34;
                  id v35 = v34;
                  _os_log_error_impl(&dword_0, v32, OS_LOG_TYPE_ERROR, "%{public}@ invalid resource object array: %{public}@", buf, 0x16u);
                }
              }
              v21 = (char *)v21 + 1;
            }
            while (v21 != v19);
            id v19 = [obj countByEnumeratingWithState:&v57 objects:v72 count:16];
          }
          while (v19);
        }

        id v14 = 0;
        objc_super v8 = v44;
        v2 = v49;
        id v11 = v46;
        v7 = v47;
      }
      _HKInitializeLogging();
      v37 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
      {
        v38 = v37;
        v39 = [(HDClinicalIngestionFileImportOperation *)v2 debugDescription];
        id v40 = [v12 count];
        *(_DWORD *)buf = 138543618;
        v66 = v39;
        __int16 v67 = 2048;
        id v68 = v40;
        _os_log_impl(&dword_0, v38, OS_LOG_TYPE_DEFAULT, "%{public}@ found %ld resources in file", buf, 0x16u);
      }
      if (!v14 && v12)
      {
        v63[0] = @"resourceType";
        v63[1] = @"entry";
        v64[0] = @"Bundle";
        v64[1] = v12;
        id v14 = +[NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:2];
      }
      if (v14)
      {
        id v52 = v11;
        v41 = +[NSJSONSerialization dataWithJSONObject:v14 options:0 error:&v52];
        id v42 = v52;

        id v11 = v42;
      }
      else
      {
        v41 = 0;
      }
      [(HDClinicalIngestionFileImportOperation *)v2 setDocumentData:v41];
      v43 = [(HDClinicalIngestionFileImportOperation *)v2 documentData];

      if (!v43) {
        [(HDClinicalIngestionFileImportOperation *)v2 setOperationError:v11];
      }
    }
    else
    {
      [(HDClinicalIngestionFileImportOperation *)v2 setOperationError:v11];
    }
  }
  else if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG))
  {
    sub_B2184(v4, v2);
  }
}

- (NSData)documentData
{
  return self->_documentData;
}

- (void)setDocumentData:(id)a3
{
}

- (NSError)operationError
{
  return self->_operationError;
}

- (void)setOperationError:(id)a3
{
}

- (NSFileHandle)fileHandle
{
  return self->_fileHandle;
}

- (void)setFileHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_operationError, 0);

  objc_storeStrong((id *)&self->_documentData, 0);
}

@end