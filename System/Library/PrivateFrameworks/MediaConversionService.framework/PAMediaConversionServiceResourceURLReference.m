@interface PAMediaConversionServiceResourceURLReference
+ (BOOL)getPathHash:(unint64_t *)a3 lastPathComponent:(id *)a4 forDictionaryRepresentation:(id)a5;
+ (id)referenceWithDictionaryRepresentation:(id)a3 error:(id *)a4;
+ (id)referenceWithURL:(id)a3;
- (BOOL)getFileSize:(unint64_t *)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)mustStopAccessingURL;
- (BOOL)shouldDeleteOnDeallocation;
- (NSURL)url;
- (id)dictionaryRepresentationWithError:(id *)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)getPathHash:(unint64_t *)a3 lastPathComponent:(id *)a4;
- (void)setMustStopAccessingURL:(BOOL)a3;
- (void)setShouldDeleteOnDeallocation:(BOOL)a3;
- (void)setUrl:(id)a3;
@end

@implementation PAMediaConversionServiceResourceURLReference

- (void).cxx_destruct
{
}

- (void)setShouldDeleteOnDeallocation:(BOOL)a3
{
  self->_shouldDeleteOnDeallocation = a3;
}

- (BOOL)shouldDeleteOnDeallocation
{
  return self->_shouldDeleteOnDeallocation;
}

- (void)setMustStopAccessingURL:(BOOL)a3
{
  self->_mustStopAccessingURL = a3;
}

- (BOOL)mustStopAccessingURL
{
  return self->_mustStopAccessingURL;
}

- (void)setUrl:(id)a3
{
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (id)dictionaryRepresentationWithError:(id *)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSURL *)self->_url bookmarkDataWithOptions:0x20000000 includingResourceValuesForKeys:0 relativeToURL:0 error:a3];
  v4 = (void *)v3;
  if (v3)
  {
    v7 = @"bookmarkData";
    v8[0] = v3;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_shouldDeleteOnDeallocation)
  {
    uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    v4 = [(NSURL *)self->_url path];
    int v5 = [v3 fileExistsAtPath:v4];

    if (v5)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        v6 = [(NSURL *)self->_url path];
        *(_DWORD *)buf = 138412290;
        v14 = v6;
        _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Deleting temporary file %@", buf, 0xCu);
      }
      url = self->_url;
      id v12 = 0;
      char v8 = [v3 removeItemAtURL:url error:&v12];
      id v9 = v12;
      if ((v8 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v10 = [(NSURL *)self->_url path];
        *(_DWORD *)buf = 138412546;
        v14 = v10;
        __int16 v15 = 2112;
        id v16 = v9;
        _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to delete temporary file %@: %@", buf, 0x16u);
      }
    }
  }
  if (self->_mustStopAccessingURL) {
    [(NSURL *)self->_url stopAccessingSecurityScopedResource];
  }
  v11.receiver = self;
  v11.super_class = (Class)PAMediaConversionServiceResourceURLReference;
  [(PAMediaConversionServiceResourceURLReference *)&v11 dealloc];
}

- (BOOL)getFileSize:(unint64_t *)a3 error:(id *)a4
{
  url = self->_url;
  id v9 = 0;
  BOOL v6 = [(NSURL *)url getResourceValue:&v9 forKey:*MEMORY[0x1E4F1C5F8] error:a4];
  BOOL v7 = v6;
  if (a3 && v6) {
    *a3 = [v9 unsignedLongLongValue];
  }
  return v7;
}

- (unint64_t)hash
{
  v2 = [(NSURL *)self->_url path];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = [a3 url];
  int v5 = [v4 path];
  BOOL v6 = [(NSURL *)self->_url path];
  char v7 = [v5 isEqual:v6];

  return v7;
}

- (void)getPathHash:(unint64_t *)a3 lastPathComponent:(id *)a4
{
  url = self->_url;
  if (!url)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PAMediaConversionServiceResourceURLCollection.m" lineNumber:82 description:@"Unexpected nil resource reference URL"];

    url = self->_url;
  }
  char v8 = [(NSURL *)url path];
  id v11 = v8;
  if (a3)
  {
    *a3 = [v8 hash];
    char v8 = v11;
  }
  if (a4)
  {
    *a4 = [v11 lastPathComponent];
    char v8 = v11;
  }
}

+ (BOOL)getPathHash:(unint64_t *)a3 lastPathComponent:(id *)a4 forDictionaryRepresentation:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v9 = [a5 objectForKeyedSubscript:@"bookmarkData"];
  if (!v9)
  {
    __int16 v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceResourceURLCollection.m", 60, @"Invalid parameter not satisfying: %@", @"bookmarkData" object file lineNumber description];
  }
  id v16 = 0;
  v10 = [MEMORY[0x1E4F1CB10] URLByResolvingBookmarkData:v9 options:256 relativeToURL:0 bookmarkDataIsStale:0 error:&v16];
  id v11 = v16;
  if (v10)
  {
    id v12 = [v10 path];
    v13 = v12;
    if (a3) {
      *a3 = [v12 hash];
    }
    if (a4)
    {
      *a4 = [v13 lastPathComponent];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v11;
    _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to decode bookmark data to get hash/filename: %@", buf, 0xCu);
  }

  return v10 != 0;
}

+ (id)referenceWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  char v7 = [a3 objectForKeyedSubscript:@"bookmarkData"];
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceResourceURLCollection.m", 38, @"Invalid parameter not satisfying: %@", @"bookmarkData" object file lineNumber description];
  }
  id v13 = 0;
  char v8 = [MEMORY[0x1E4F1CB10] URLByResolvingBookmarkData:v7 options:0 relativeToURL:0 bookmarkDataIsStale:0 error:&v13];
  id v9 = v13;
  if (v8)
  {
    v10 = [a1 referenceWithURL:v8];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v9;
      _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Unable to decode URL reference bookmark data: %@", buf, 0xCu);
    }
    v10 = 0;
    if (a4) {
      *a4 = v9;
    }
  }

  return v10;
}

+ (id)referenceWithURL:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    char v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceResourceURLCollection.m", 29, @"Invalid parameter not satisfying: %@", @"url" object file lineNumber description];
  }
  BOOL v6 = objc_opt_new();
  [v6 setUrl:v5];

  return v6;
}

@end