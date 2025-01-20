@interface SKGArchiver
- (BOOL)enumerateArchivePathsUsingBlock:(id)a3;
- (BOOL)removeArchivePath:(id)a3 error:(id *)a4;
- (BOOL)writeArchive:(id)a3 name:(id)a4 error:(id *)a5;
- (NSString)resourcePath;
- (SKGArchiver)initWithResourceDirectoryPath:(id)a3;
- (id)archivePaths;
- (id)archiverResourcePath;
- (void)setResourcePath:(id)a3;
@end

@implementation SKGArchiver

- (SKGArchiver)initWithResourceDirectoryPath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKGArchiver;
  v6 = [(SKGArchiver *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_resourcePath, a3);
  }

  return v7;
}

- (id)archiverResourcePath
{
  return self->_resourcePath;
}

- (id)archivePaths
{
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 1;
  v2 = [(SKGArchiver *)self archiverResourcePath];
  v16 = +[NSURL fileURLWithPath:v2 isDirectory:1];

  v3 = +[NSFileManager defaultManager];
  v4 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", NSURLNameKey, NSURLCreationDateKey, 0);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10004BD74;
  v22[3] = &unk_1000D9A08;
  v22[4] = &v23;
  v15 = [v3 enumeratorAtURL:v16 includingPropertiesForKeys:v4 options:4 errorHandler:v22];

  if (*((unsigned char *)v24 + 24))
  {
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v15;
    id v7 = [v6 countByEnumeratingWithState:&v18 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v19;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v11 = [v10 lastPathComponent];
          unsigned int v12 = [v11 hasPrefix:@"skg_archive"];

          if (v12)
          {
            id v17 = 0;
            [v10 getResourceValue:&v17 forKey:NSURLCreationDateKey error:0];
            id v13 = v17;
            [v5 setObject:v13 forKey:v10];
          }
        }
        id v7 = [v6 countByEnumeratingWithState:&v18 objects:v27 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v5 = 0;
  }

  _Block_object_dispose(&v23, 8);

  return v5;
}

- (BOOL)enumerateArchivePathsUsingBlock:(id)a3
{
  v4 = (void (**)(id, void *, unsigned char *))a3;
  uint64_t v25 = 0;
  char v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 1;
  id v5 = [(SKGArchiver *)self archiverResourcePath];
  long long v18 = +[NSURL fileURLWithPath:v5 isDirectory:1];

  id v6 = +[NSFileManager defaultManager];
  id v7 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", NSURLNameKey, 0);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10004C058;
  v24[3] = &unk_1000D9A08;
  v24[4] = &v25;
  id v17 = [v6 enumeratorAtURL:v18 includingPropertiesForKeys:v7 options:4 errorHandler:v24];

  if (*((unsigned char *)v26 + 24))
  {
    char v23 = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = v17;
    id v9 = [v8 countByEnumeratingWithState:&v19 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v20;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v8);
        }
        unsigned int v12 = *(void **)(*((void *)&v19 + 1) + 8 * v11);
        id v13 = [v12 lastPathComponent];
        unsigned int v14 = [v13 hasPrefix:@"skg_archive"];

        if (v14)
        {
          v4[2](v4, v12, &v23);
          if (v23) {
            break;
          }
        }
        if (v9 == (id)++v11)
        {
          id v9 = [v8 countByEnumeratingWithState:&v19 objects:v29 count:16];
          if (v9) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    BOOL v15 = *((unsigned char *)v26 + 24) != 0;
  }
  else
  {
    BOOL v15 = 0;
  }

  _Block_object_dispose(&v25, 8);
  return v15;
}

- (BOOL)writeArchive:(id)a3 name:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(SKGArchiver *)self archiverResourcePath];
  uint64_t v11 = +[NSURL fileURLWithPath:v10 isDirectory:1];

  unsigned int v12 = [v11 path];
  id v13 = +[NSString stringWithFormat:@"%@/skg_%@", v12, v8];

  id v17 = 0;
  unsigned __int8 v14 = [v9 writeToFile:v13 options:1 error:&v17];

  id v15 = v17;
  if (a5) {
    *a5 = v15;
  }

  return v14;
}

- (BOOL)removeArchivePath:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[NSFileManager defaultManager];
  id v9 = 0;
  [v6 removeItemAtURL:v5 error:&v9];

  id v7 = v9;
  if (a4 && v7) {
    *a4 = v7;
  }

  return v7 == 0;
}

- (NSString)resourcePath
{
  return self->_resourcePath;
}

- (void)setResourcePath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end