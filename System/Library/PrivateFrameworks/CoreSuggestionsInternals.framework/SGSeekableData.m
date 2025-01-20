@interface SGSeekableData
- (SGSeekableData)initWithData:(id)a3;
- (SGSeekableData)initWithMemoryMappedPath:(id)a3;
- (SGSeekableData)initWithMemoryMappedPath:(id)a3 error:(id *)a4;
- (const)dataOfLength:(unint64_t)a3;
- (unint64_t)offsetInFile;
- (void)seekToFileOffset:(unint64_t)a3;
@end

@implementation SGSeekableData

- (void).cxx_destruct
{
}

- (unint64_t)offsetInFile
{
  return self->_offsetInFile;
}

- (void)seekToFileOffset:(unint64_t)a3
{
  if (self->_length < a3)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SGSeekableData.m", 58, @"offset %llu outside of bounds (file length %llu)", a3, self->_length);
  }
  self->_offsetInFile = a3;
}

- (const)dataOfLength:(unint64_t)a3
{
  unint64_t offsetInFile = self->_offsetInFile;
  unint64_t v5 = offsetInFile + a3;
  bytes = (char *)self->_bytes;
  if (offsetInFile + a3 > self->_length)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SGSeekableData.m", 51, @"Tried to read %llu-%llu from data of length %llu", self->_offsetInFile, self->_offsetInFile + a3, self->_length);

    unint64_t v5 = self->_offsetInFile + a3;
  }
  result = &bytes[offsetInFile];
  self->_unint64_t offsetInFile = v5;
  return result;
}

- (SGSeekableData)initWithMemoryMappedPath:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SGSeekableData.m", 43, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v7 options:1 error:a4];
  if (v8)
  {
    self = [(SGSeekableData *)self initWithData:v8];
    v9 = self;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  return v10;
}

- (SGSeekableData)initWithMemoryMappedPath:(id)a3
{
  id v5 = a3;
  id v10 = 0;
  v6 = [(SGSeekableData *)self initWithMemoryMappedPath:v5 error:&v10];
  id v7 = v10;
  if (!v6)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, 0, @"SGSeekableData.m", 37, @"Error loading %@: %@", v5, v7 object file lineNumber description];
  }
  return v6;
}

- (SGSeekableData)initWithData:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SGSeekableData.m", 23, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)SGSeekableData;
  id v7 = [(SGSeekableData *)&v12 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_data, a3);
    id v9 = v6;
    v8->_bytes = (const void *)[v9 bytes];
    v8->_length = [v9 length];
    v8->_unint64_t offsetInFile = 0;
  }

  return v8;
}

@end