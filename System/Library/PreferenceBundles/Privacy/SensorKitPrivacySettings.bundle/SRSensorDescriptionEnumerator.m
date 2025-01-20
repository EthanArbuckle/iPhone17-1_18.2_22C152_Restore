@interface SRSensorDescriptionEnumerator
- (id)nextObject;
- (void)dealloc;
@end

@implementation SRSensorDescriptionEnumerator

- (void)dealloc
{
  if (self) {
    objc_setProperty_atomic(self, a2, 0, 24);
  }

  v3.receiver = self;
  v3.super_class = (Class)SRSensorDescriptionEnumerator;
  [(SRSensorDescriptionEnumerator *)&v3 dealloc];
}

- (id)nextObject
{
  v2 = self;
  unint64_t currentSensorDirectoryIndex = self->_currentSensorDirectoryIndex;
  sensorsCache = self->_sensorsCache;
  if (sensorsCache) {
    sensorsCache = objc_getProperty(sensorsCache, a2, 16, 1);
  }
  if (currentSensorDirectoryIndex >= (unint64_t)[sensorsCache count])
  {
    v8 = qword_11180;
    if (os_log_type_enabled((os_log_t)qword_11180, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_0, v8, OS_LOG_TYPE_FAULT, "Unexpectedly trying to iterate beyond the maximum number of directories", buf, 2u);
    }
    return 0;
  }
  if (v2->_descriptionFileEnumerator)
  {
    NSURLResourceKey v7 = NSURLIsDirectoryKey;
  }
  else
  {
    id Property = v2->_sensorsCache;
    if (Property) {
      id Property = objc_getProperty(Property, v5, 16, 1);
    }
    id v10 = [Property objectAtIndexedSubscript:v2->_currentSensorDirectoryIndex];
    NSURLResourceKey v7 = NSURLIsDirectoryKey;
    NSURLResourceKey v55 = NSURLIsDirectoryKey;
    v11 = [+[NSFileManager defaultManager](NSFileManager, "defaultManager") enumeratorAtURL:v10 includingPropertiesForKeys:+[NSArray arrayWithObjects:&v55 count:1] options:4 errorHandler:0];
    objc_setProperty_atomic(v2, v12, v11, 24);
  }
  *(void *)&long long v6 = 138543362;
  long long v46 = v6;
  v48 = v7;
  v47 = v2;
  while (1)
  {
    while (1)
    {
      id v13 = [(NSDirectoryEnumerator *)v2->_descriptionFileEnumerator nextObject];
      id v49 = 0;
      [v13 getResourceValue:&v49 forKey:v7 error:0];
      v15 = 0;
      if (([v49 BOOLValue] & 1) == 0) {
        break;
      }
LABEL_53:
      if (v15) {
        return v15;
      }
    }
    if (!v13)
    {
      unint64_t v16 = v2->_currentSensorDirectoryIndex + 1;
      v2->_unint64_t currentSensorDirectoryIndex = v16;
      id v17 = v2->_sensorsCache;
      if (v17) {
        id v17 = objc_getProperty(v17, v14, 16, 1);
      }
      BOOL v18 = v16 >= (unint64_t)[v17 count];
      NSURLResourceKey v7 = v48;
      if (v18) {
        break;
      }
      id v20 = v2->_sensorsCache;
      if (v20) {
        id v20 = objc_getProperty(v20, v19, 16, 1);
      }
      v21 = -[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", [v20 objectAtIndexedSubscript:v2->_currentSensorDirectoryIndex], 0, 4, 0);
      objc_setProperty_atomic(v2, v22, v21, 24);
      id v13 = [(NSDirectoryEnumerator *)v2->_descriptionFileEnumerator nextObject];
      if (!v13) {
        break;
      }
    }
    id v23 = objc_msgSend(objc_msgSend(v13, "URLByDeletingPathExtension"), "lastPathComponent");
    v24 = v2->_sensorsCache;
    if (v24)
    {
      id v25 = v23;
      v26 = (NSURL *)objc_msgSend(v23, "sr_sensorByDeletingDeletionRecord");
      unsigned __int8 v27 = [(NSURL *)v26 isEqualToString:v25];
      v15 = [(NSCache *)v24->_sensorsCache objectForKey:v26];
      if (!v15)
      {
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        sensorDescriptionsDirs = v24->_sensorDescriptionsDirs;
        id v29 = [(NSArray *)sensorDescriptionsDirs countByEnumeratingWithState:&v50 objects:buf count:16];
        if (v29)
        {
          id v30 = v29;
          uint64_t v31 = *(void *)v51;
          unsigned __int8 v32 = v27;
LABEL_24:
          uint64_t v33 = 0;
          while (1)
          {
            if (*(void *)v51 != v31) {
              objc_enumerationMutation(sensorDescriptionsDirs);
            }
            uint64_t v34 = *(void *)(*((void *)&v50 + 1) + 8 * v33);
            id v35 = [(NSURL *)v26 stringByAppendingPathExtension:@"plist"];
            if (!v35) {
              break;
            }
            v36 = +[NSURL fileURLWithPath:v35 isDirectory:0 relativeToURL:v34];
            v54 = 0;
            v37 = +[NSDictionary dictionaryWithContentsOfURL:v36 error:&v54];
            if (v37)
            {
              v15 = (NSArray *)[objc_alloc((Class)SRSensorDescription) initWithDictionary:v37];
              v38 = (NSURL *)[(NSArray *)v15 name];
              [(NSCache *)v24->_sensorsCache setObject:v15 forKey:v38];
              if ([(NSArray *)v15 legacyName]) {
                [(NSCache *)v24->_sensorsCache setObject:v15 forKey:[(NSArray *)v15 legacyName]];
              }
              v39 = qword_11180;
              if (os_log_type_enabled((os_log_t)qword_11180, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v57 = 138543618;
                v58 = v38;
                __int16 v59 = 2114;
                v60 = v15;
                _os_log_impl(&dword_0, v39, OS_LOG_TYPE_INFO, "Cached description for %{public}@, %{public}@", v57, 0x16u);
              }
              unsigned __int8 v27 = v32;
              if (v15) {
                goto LABEL_47;
              }
            }
            else
            {
              if (objc_msgSend(-[NSArray domain](v54, "domain"), "isEqualToString:", NSCocoaErrorDomain)
                && [(NSArray *)v54 code] == &stru_B8.reserved3)
              {
                v40 = qword_11180;
                if (os_log_type_enabled((os_log_t)qword_11180, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v57 = v46;
                  v58 = v36;
                  _os_log_impl(&dword_0, v40, OS_LOG_TYPE_INFO, "%{public}@ not found", v57, 0xCu);
                }
              }
              else
              {
                v41 = qword_11180;
                if (os_log_type_enabled((os_log_t)qword_11180, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v57 = 138543618;
                  v58 = v36;
                  __int16 v59 = 2114;
                  v60 = v54;
                  _os_log_error_impl(&dword_0, v41, OS_LOG_TYPE_ERROR, "Failed to parse %{public}@ because %{public}@", v57, 0x16u);
                }
              }
              unsigned __int8 v27 = v32;
            }
            if (v30 == (id)++v33)
            {
              id v30 = [(NSArray *)sensorDescriptionsDirs countByEnumeratingWithState:&v50 objects:buf count:16];
              if (v30) {
                goto LABEL_24;
              }
              goto LABEL_44;
            }
          }
        }
        else
        {
LABEL_44:
          v42 = qword_11180;
          if (os_log_type_enabled((os_log_t)qword_11180, OS_LOG_TYPE_ERROR))
          {
            v44 = v24->_sensorDescriptionsDirs;
            *(_DWORD *)v57 = 138543618;
            v58 = v26;
            __int16 v59 = 2114;
            v60 = v44;
            _os_log_error_impl(&dword_0, v42, OS_LOG_TYPE_ERROR, "Failed to find description for %{public}@ in %{public}@", v57, 0x16u);
          }
        }
        v15 = 0;
LABEL_47:
        v2 = v47;
        NSURLResourceKey v7 = v48;
      }
      if (v15) {
        char v43 = v27;
      }
      else {
        char v43 = 1;
      }
      if ((v43 & 1) == 0) {
        v15 = (NSArray *)+[SRSensorDescription sensorDescriptionForDeletionRecordFromDescription:v15];
      }
      goto LABEL_53;
    }
  }
  objc_setProperty_atomic(v2, v19, 0, 24);
  return 0;
}

@end