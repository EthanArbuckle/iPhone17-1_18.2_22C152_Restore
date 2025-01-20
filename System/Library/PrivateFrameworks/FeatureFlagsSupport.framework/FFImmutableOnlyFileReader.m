@interface FFImmutableOnlyFileReader
- (FFFileReader)underlying;
- (FFImmutableOnlyFileReader)init;
- (NSString)immutableInternalPathPrefix;
- (NSString)immutablePathPrefix;
- (id)contentsOfDirectoryAtURL:(id)a3 error:(id *)a4;
- (id)dictionaryWithContentsOfURL:(id)a3 error:(id *)a4;
- (void)setImmutableInternalPathPrefix:(id)a3;
- (void)setImmutablePathPrefix:(id)a3;
- (void)setUnderlying:(id)a3;
@end

@implementation FFImmutableOnlyFileReader

- (FFImmutableOnlyFileReader)init
{
  v6.receiver = self;
  v6.super_class = (Class)FFImmutableOnlyFileReader;
  v2 = [(FFImmutableOnlyFileReader *)&v6 init];
  if (v2)
  {
    v3 = [NSString stringWithUTF8String:*_os_feature_search_paths()];
    [(FFImmutableOnlyFileReader *)v2 setImmutablePathPrefix:v3];

    v4 = [NSString stringWithUTF8String:_os_feature_internal_search_path()];
    [(FFImmutableOnlyFileReader *)v2 setImmutableInternalPathPrefix:v4];
  }
  return v2;
}

- (id)dictionaryWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 path];
  v8 = [(FFImmutableOnlyFileReader *)self immutablePathPrefix];
  if ([v7 hasPrefix:v8])
  {

LABEL_4:
    v12 = [(FFImmutableOnlyFileReader *)self underlying];
    v13 = [v12 dictionaryWithContentsOfURL:v6 error:a4];

    goto LABEL_6;
  }
  v9 = [v6 path];
  v10 = [(FFImmutableOnlyFileReader *)self immutableInternalPathPrefix];
  int v11 = [v9 hasPrefix:v10];

  if (v11) {
    goto LABEL_4;
  }
  v13 = 0;
LABEL_6:

  return v13;
}

- (id)contentsOfDirectoryAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 path];
  v8 = [(FFImmutableOnlyFileReader *)self immutablePathPrefix];
  if ([v7 hasPrefix:v8])
  {

LABEL_4:
    v12 = [(FFImmutableOnlyFileReader *)self underlying];
    v13 = [v12 contentsOfDirectoryAtURL:v6 error:a4];

    goto LABEL_6;
  }
  v9 = [v6 path];
  v10 = [(FFImmutableOnlyFileReader *)self immutableInternalPathPrefix];
  char v11 = [v9 hasPrefix:v10];

  if (v11) {
    goto LABEL_4;
  }
  v13 = [MEMORY[0x1E4F1C978] array];
LABEL_6:

  return v13;
}

- (FFFileReader)underlying
{
  return self->_underlying;
}

- (void)setUnderlying:(id)a3
{
}

- (NSString)immutablePathPrefix
{
  return self->_immutablePathPrefix;
}

- (void)setImmutablePathPrefix:(id)a3
{
}

- (NSString)immutableInternalPathPrefix
{
  return self->_immutableInternalPathPrefix;
}

- (void)setImmutableInternalPathPrefix:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_immutableInternalPathPrefix, 0);
  objc_storeStrong((id *)&self->_immutablePathPrefix, 0);
  objc_storeStrong((id *)&self->_underlying, 0);
}

@end