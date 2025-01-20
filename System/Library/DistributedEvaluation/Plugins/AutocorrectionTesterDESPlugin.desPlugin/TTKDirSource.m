@interface TTKDirSource
- (NSDictionary)layouts;
- (NSString)inputMode;
- (float)fileVersion;
- (id)getNextTestCase;
- (id)init:(id)a3;
- (id)onNewLayoutsFound;
- (int)majorVersion;
- (int)minorVersion;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)loadLayouts:(id)a3;
- (void)loadRootDir;
- (void)reset;
- (void)setOnNewLayoutsFound:(id)a3;
@end

@implementation TTKDirSource

- (void)loadRootDir
{
  v3 = +[NSFileManager defaultManager];
  v4 = [v3 contentsOfDirectoryAtPath:self->_rootDir error:0];

  v5 = [v4 sortedArrayUsingSelector:"compare:"];

  [(TTKDirSource *)self loadLayouts:self->_rootDir];
  self->_is_multiDir = 1;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        if ([*(id *)(*((void *)&v28 + 1) + 8 * i) isEqualToString:@"layouts.json"])self->_is_multiDir = 0; {
      }
        }
      id v8 = [v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v8);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = v6;
  id v12 = [v11 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v25;
    p_testCaseFiles = &self->_testCaseFiles;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v24 + 1) + 8 * (void)j);
        if ((objc_msgSend(v16, "isEqualToString:", @".DS_Store", p_testCaseFiles) & 1) == 0)
        {
          v32[0] = self->_rootDir;
          v32[1] = v16;
          v17 = +[NSArray arrayWithObjects:v32 count:2];
          v18 = +[NSString pathWithComponents:v17];

          char v23 = 0;
          v19 = +[NSFileManager defaultManager];
          [v19 fileExistsAtPath:v18 isDirectory:&v23];

          p_testCaseDirs = &self->_testCaseDirs;
          if (v23
            || (unsigned __int8 v21 = [v16 isEqualToString:@"layouts.json"],
                p_testCaseDirs = p_testCaseFiles,
                (v21 & 1) == 0))
          {
            [(NSMutableArray *)*p_testCaseDirs addObject:v16];
          }
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v13);
  }
}

- (id)getNextTestCase
{
  currTestCaseSource = self->_currTestCaseSource;
  if (currTestCaseSource)
  {
    v5 = [(TTKTestCaseSource *)currTestCaseSource getNextTestCase];
    if (v5) {
      goto LABEL_15;
    }
    id v6 = self->_currTestCaseSource;
    self->_currTestCaseSource = 0;
  }
  if ([(NSMutableArray *)self->_testCaseFiles count])
  {
    rootDir = self->_rootDir;
    currDir = self->_currDir;
    uint64_t v9 = [(NSMutableArray *)self->_testCaseFiles objectAtIndex:0];
    v10 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", rootDir, currDir, v9, 0);

    [(NSMutableArray *)self->_testCaseFiles removeObjectAtIndex:0];
    id v11 = +[NSString pathWithComponents:v10];
    id v12 = +[TTKTestCaseReader loadFromFile:v11 inputMode:self->_inputMode layouts:self->_layouts];
    id v13 = self->_currTestCaseSource;
    self->_currTestCaseSource = v12;

    uint64_t v14 = [(TTKTestCaseSource *)self->_currTestCaseSource layouts];
    if (![v14 count])
    {
LABEL_8:

      goto LABEL_14;
    }
    v15 = [(TTKDirSource *)self onNewLayoutsFound];

    if (v15)
    {
      v16 = +[NSMutableDictionary dictionaryWithDictionary:self->_layouts];
      v17 = [(TTKTestCaseSource *)self->_currTestCaseSource layouts];
      [(NSMutableDictionary *)v16 addEntriesFromDictionary:v17];

      layouts = self->_layouts;
      self->_layouts = v16;
      v19 = v16;

      uint64_t v14 = [(TTKDirSource *)self onNewLayoutsFound];
      v20 = [(TTKTestCaseSource *)self->_currTestCaseSource layouts];

      ((void (**)(void, void *))v14)[2](v14, v20);
      goto LABEL_8;
    }
  }
  else
  {
    if (![(NSMutableArray *)self->_testCaseDirs count])
    {
      v5 = 0;
      goto LABEL_15;
    }
    unsigned __int8 v21 = [(NSMutableArray *)self->_testCaseDirs objectAtIndex:0];
    v22 = self->_currDir;
    self->_currDir = v21;

    [(NSMutableArray *)self->_testCaseDirs removeObjectAtIndex:0];
    v10 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", self->_rootDir, self->_currDir, 0);
    id v11 = +[NSString pathWithComponents:v10];
    if (self->_is_multiDir)
    {
      char v23 = [[TTKDirSource alloc] init:v11];
      long long v24 = self->_currTestCaseSource;
      self->_currTestCaseSource = v23;
    }
    else
    {
      long long v25 = +[NSFileManager defaultManager];
      long long v26 = [v25 contentsOfDirectoryAtPath:v11 error:0];
      long long v27 = +[NSMutableArray arrayWithArray:v26];
      testCaseFiles = self->_testCaseFiles;
      self->_testCaseFiles = v27;

      [(NSMutableArray *)self->_testCaseFiles removeObject:@".DS_Store"];
    }
  }
LABEL_14:
  v5 = [(TTKDirSource *)self getNextTestCase];

LABEL_15:

  return v5;
}

- (id)init:(id)a3
{
  id v5 = a3;
  id v6 = sub_4038();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_59270(v5);
  }

  v10.receiver = self;
  v10.super_class = (Class)TTKDirSource;
  id v7 = [(TTKDirSource *)&v10 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_rootDir, a3);
    [(TTKDirSource *)v8 reset];
  }

  return v8;
}

- (void)reset
{
  currTestCaseSource = self->_currTestCaseSource;
  self->_currTestCaseSource = 0;

  currDir = self->_currDir;
  self->_currDir = (NSString *)&stru_8DEF0;

  id v5 = +[NSMutableArray array];
  testCaseDirs = self->_testCaseDirs;
  self->_testCaseDirs = v5;

  id v7 = +[NSMutableArray array];
  testCaseFiles = self->_testCaseFiles;
  self->_testCaseFiles = v7;

  [(TTKDirSource *)self loadRootDir];
}

- (void)loadLayouts:(id)a3
{
  id v4 = a3;
  id v6 = +[NSFileManager defaultManager];
  id v62 = 0;
  v49 = v4;
  id v7 = [v6 contentsOfDirectoryAtPath:v4 error:&v62];
  id v8 = v62;

  if (!v8)
  {
    v47 = v5;
    uint64_t v9 = [v7 sortedArrayUsingSelector:"compare:"];

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v58 objects:v67 count:16];
    v48 = v10;
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v59;
      location = (id *)&self->_inputMode;
      p_layouts = &self->_layouts;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v59 != v13) {
            objc_enumerationMutation(v10);
          }
          v16 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          if (([v16 isEqualToString:@".DS_Store"] & 1) == 0)
          {
            v66[0] = v49;
            v66[1] = v16;
            v17 = +[NSArray arrayWithObjects:v66 count:2];
            v18 = +[NSString pathWithComponents:v17];

            if ([v16 isEqualToString:@"layouts.json"])
            {
              long long v27 = +[TTKTestCaseReader loadFromFile:v18];
              long long v28 = [v27 inputMode];
              long long v29 = [v27 layouts];
              long long v30 = +[NSMutableDictionary dictionaryWithDictionary:v29];

              int v31 = [v27 majorVersion];
              int v32 = [v27 minorVersion];
              [v27 fileVersion];
              if (*location)
              {
                v44 = v28;
                locationa = (id *)v27;
                long long v56 = 0u;
                long long v57 = 0u;
                long long v54 = 0u;
                long long v55 = 0u;
                v34 = [v30 allKeys];
                id v35 = [v34 countByEnumeratingWithState:&v54 objects:v65 count:16];
                if (v35)
                {
                  id v36 = v35;
                  uint64_t v37 = *(void *)v55;
                  do
                  {
                    for (j = 0; j != v36; j = (char *)j + 1)
                    {
                      if (*(void *)v55 != v37) {
                        objc_enumerationMutation(v34);
                      }
                      uint64_t v39 = *(void *)(*((void *)&v54 + 1) + 8 * (void)j);
                      v40 = [(NSMutableDictionary *)*p_layouts objectForKey:v39];

                      if (!v40)
                      {
                        v41 = *p_layouts;
                        v42 = [v30 objectForKeyedSubscript:v39];
                        [(NSMutableDictionary *)v41 setObject:v42 forKey:v39];
                      }
                    }
                    id v36 = [v34 countByEnumeratingWithState:&v54 objects:v65 count:16];
                  }
                  while (v36);
                }

                long long v28 = v44;
                long long v27 = locationa;
              }
              else
              {
                float v43 = v33;
                objc_storeStrong(location, v28);
                objc_storeStrong((id *)&self->_layouts, v30);
                self->_majorVersion = v31;
                self->_minorVersion = v32;
                self->_fileVersion = v43;
              }

              goto LABEL_35;
            }

            id v10 = v48;
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v58 objects:v67 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v19 = v10;
    id v20 = [v19 countByEnumeratingWithState:&v50 objects:v64 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v51;
      do
      {
        for (k = 0; k != v21; k = (char *)k + 1)
        {
          if (*(void *)v51 != v22) {
            objc_enumerationMutation(v19);
          }
          long long v24 = *(void **)(*((void *)&v50 + 1) + 8 * (void)k);
          if (([v24 isEqualToString:@".DS_Store"] & 1) == 0)
          {
            v63[0] = v49;
            v63[1] = v24;
            long long v25 = +[NSArray arrayWithObjects:v63 count:2];
            long long v26 = +[NSString pathWithComponents:v25];
            [(TTKDirSource *)self loadLayouts:v26];
          }
        }
        id v21 = [v19 countByEnumeratingWithState:&v50 objects:v64 count:16];
      }
      while (v21);
    }
LABEL_35:
    id v7 = v48;

    id v8 = 0;
    id v5 = v47;
  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (!a3->var0) {
    a3->var2 = a3->var3;
  }
  a3->var0 = 0;
  if (a5)
  {
    do
    {
      id v9 = [(TTKDirSource *)self getNextTestCase];
      unint64_t result = a3->var0;
      if (!v9) {
        break;
      }
      a3->var0 = result + 1;
      a4[result] = v9;
      unint64_t result = a3->var0;
    }
    while (a3->var0 < a5);
  }
  else
  {
    unint64_t result = 0;
  }
  a3->var1 = a4;
  return result;
}

- (NSDictionary)layouts
{
  return &self->_layouts->super;
}

- (NSString)inputMode
{
  return self->_inputMode;
}

- (float)fileVersion
{
  return self->_fileVersion;
}

- (int)majorVersion
{
  return self->_majorVersion;
}

- (int)minorVersion
{
  return self->_minorVersion;
}

- (id)onNewLayoutsFound
{
  return self->_onNewLayoutsFound;
}

- (void)setOnNewLayoutsFound:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onNewLayoutsFound, 0);
  objc_storeStrong((id *)&self->_currTestCaseSource, 0);
  objc_storeStrong((id *)&self->_testCaseFiles, 0);
  objc_storeStrong((id *)&self->_testCaseDirs, 0);
  objc_storeStrong((id *)&self->_currDir, 0);
  objc_storeStrong((id *)&self->_rootDir, 0);
  objc_storeStrong((id *)&self->_layouts, 0);

  objc_storeStrong((id *)&self->_inputMode, 0);
}

@end