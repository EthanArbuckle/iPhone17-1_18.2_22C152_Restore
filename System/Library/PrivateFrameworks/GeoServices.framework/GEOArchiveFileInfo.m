@interface GEOArchiveFileInfo
- (GEOArchiveFileInfo)initWithFilePath:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5;
- (NSString)filePath;
- (unint64_t)length;
- (unint64_t)offset;
@end

@implementation GEOArchiveFileInfo

- (GEOArchiveFileInfo)initWithFilePath:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOArchiveFileInfo;
  v9 = [(GEOArchiveFileInfo *)&v14 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    filePath = v9->_filePath;
    v9->_filePath = (NSString *)v10;

    v9->_offset = a4;
    v9->_length = a5;
    v12 = v9;
  }

  return v9;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (unint64_t)length
{
  return self->_length;
}

- (void).cxx_destruct
{
}

@end