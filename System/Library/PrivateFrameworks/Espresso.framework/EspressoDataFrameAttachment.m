@interface EspressoDataFrameAttachment
+ (id)fromDict:(id)a3 frameStorage:(id)a4;
- (BOOL)disabled;
- (NSString)filePath;
- (unint64_t)offset;
- (unint64_t)size;
- (void)loadFromDict:(id)a3 frameStorage:(id)a4;
- (void)rawPointer;
- (void)setDisabled:(BOOL)a3;
- (void)setFilePath:(id)a3;
- (void)setOffset:(unint64_t)a3;
- (void)setRawPointer:(void *)a3;
- (void)setSize:(unint64_t)a3;
@end

@implementation EspressoDataFrameAttachment

- (void).cxx_destruct
{
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void)setRawPointer:(void *)a3
{
  self->_rawPointer = a3;
}

- (void)rawPointer
{
  return self->_rawPointer;
}

- (void)setFilePath:(id)a3
{
}

- (NSString)filePath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (void)loadFromDict:(id)a3 frameStorage:(id)a4
{
  id v25 = a3;
  id v6 = a4;
  v7 = [v25 objectForKeyedSubscript:@"file"];
  v8 = [v25 objectForKeyedSubscript:@"offset"];
  uint64_t v9 = [v8 unsignedLongValue];

  v10 = [v25 objectForKeyedSubscript:@"size"];
  uint64_t v11 = [v10 unsignedLongValue];

  v12 = [v6 mappedFiles];
  v13 = [v12 objectForKey:v7];

  if (!v13)
  {
    id v14 = v7;
    v15 = v14;
    if (([v14 hasPrefix:@"/"] & 1) == 0)
    {
      v16 = [v6 baseFilename];
      v17 = [v16 stringByDeletingLastPathComponent];

      v15 = [v17 stringByAppendingPathComponent:v14];
    }
    v18 = [[EspressoDataFrameMappedFile alloc] initWithPath:v15];
    v19 = [v6 mappedFiles];
    [v19 setObject:v18 forKeyedSubscript:v14];
  }
  v20 = [v6 mappedFiles];
  v21 = [v20 objectForKeyedSubscript:v7];

  v22 = [v21 path];
  [(EspressoDataFrameAttachment *)self setFilePath:v22];

  [(EspressoDataFrameAttachment *)self setOffset:v9];
  [(EspressoDataFrameAttachment *)self setSize:v11];
  if ([v21 basePtr])
  {
    uint64_t v23 = [v21 basePtr];
    unint64_t v24 = v23 + [(EspressoDataFrameAttachment *)self offset];
  }
  else
  {
    unint64_t v24 = 0;
  }
  [(EspressoDataFrameAttachment *)self setRawPointer:v24];
}

+ (id)fromDict:(id)a3 frameStorage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 objectForKeyedSubscript:@"kind"];
  if (([v7 isEqualToString:@"image"] & 1) == 0
    && ![v7 isEqualToString:@"tensor"])
  {
    id v10 = v7;
    if ([v10 UTF8String]) {
      uint64_t v11 = (const char *)[v10 UTF8String];
    }
    else {
      uint64_t v11 = "";
    }
    v12 = v11;
    Espresso::throw_exception_selector<Espresso::invalid_state_error,char const*>("Invalid attachment kind %s", &v12);
  }
  v8 = objc_opt_new();
  [v8 loadFromDict:v5 frameStorage:v6];

  return v8;
}

@end