@interface SGPatternDataFile
- (SGPatternDataFile)initWithData:(id)a3;
- (SGPatternDataFile)initWithPath:(id)a3;
- (id)dataForOffset:(id)a3;
- (id)dataForOffset:(id)a3 includeTerminator:(int)a4;
@end

@implementation SGPatternDataFile

- (void).cxx_destruct
{
}

- (id)dataForOffset:(id)a3
{
  return [(SGPatternDataFile *)self dataForOffset:a3 includeTerminator:1];
}

- (id)dataForOffset:(id)a3 includeTerminator:(int)a4
{
  id v7 = a3;
  unint64_t v8 = [v7 longLongValue];
  if ((v8 & 3) != 0)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SGPatterns.m", 589, @"Invalid parameter not satisfying: %@", @"(off & 0b11) == 0" object file lineNumber description];
  }
  if (a4) {
    uint64_t v9 = HIDWORD(v8);
  }
  else {
    uint64_t v9 = HIDWORD(v8) + 1;
  }
  uint64_t v10 = v8;
  if (v9 + (unint64_t)v8 > [(NSData *)self->_fileData length])
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SGPatterns.m", 592, @"Invalid parameter not satisfying: %@", @"off + len <= _fileData.length" object file lineNumber description];
  }
  v11 = (void *)MEMORY[0x1CB79B230]();
  v12 = -[NSData subdataWithRange:](self->_fileData, "subdataWithRange:", v10, v9);

  return v12;
}

- (SGPatternDataFile)initWithData:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SGPatterns.m", 575, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)SGPatternDataFile;
  id v7 = [(SGPatternDataFile *)&v11 init];
  unint64_t v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_fileData, a3);
  }

  return v8;
}

- (SGPatternDataFile)initWithPath:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SGPatterns.m", 566, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  id v12 = 0;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v5 options:1 error:&v12];
  id v7 = v12;
  if (!v6)
  {
    objc_super v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SGPatterns.m", 569, @"Error loading file %@: %@", v5, v7 object file lineNumber description];
  }
  unint64_t v8 = [(SGPatternDataFile *)self initWithData:v6];

  return v8;
}

@end