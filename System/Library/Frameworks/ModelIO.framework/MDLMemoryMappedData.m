@interface MDLMemoryMappedData
- (MDLMemoryMappedData)initWithURL:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5;
- (id)dataNoCopy;
- (void)dealloc;
@end

@implementation MDLMemoryMappedData

- (MDLMemoryMappedData)initWithURL:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5
{
  id v8 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MDLMemoryMappedData;
  v9 = [(MDLMemoryMappedData *)&v24 init];
  if (v9)
  {
    unint64_t v10 = sysconf(29);
    objc_msgSend_path(v8, v11, v12);
    id v13 = objc_claimAutoreleasedReturnValue();
    v16 = (const char *)objc_msgSend_UTF8String(v13, v14, v15);
    v9->_file = fopen(v16, "r");

    file = v9->_file;
    if (file)
    {
      off_t v18 = a4 / v10 * v10;
      unint64_t v19 = a4 - v18;
      size_t v20 = a4 - v18 + a5;
      v9->_mappedFileSize = v20;
      int v21 = fileno(file);
      v22 = (char *)mmap(0, v20, 1, 2, v21, v18);
      v9->_mappedAddr = v22;
      if (v22)
      {
        v9->_fileStart = &v22[v19];
        v9->_length = a5;
      }
    }
  }

  return v9;
}

- (void)dealloc
{
  mappedAddr = self->_mappedAddr;
  if (mappedAddr)
  {
    int v4 = munmap(mappedAddr, self->_mappedFileSize);
    if (v4) {
      printf("Could not unmap file - error (%d)\n", v4);
    }
  }
  file = self->_file;
  if (file) {
    fclose(file);
  }
  v6.receiver = self;
  v6.super_class = (Class)MDLMemoryMappedData;
  [(MDLMemoryMappedData *)&v6 dealloc];
}

- (id)dataNoCopy
{
  fileStart = self->_fileStart;
  if (fileStart)
  {
    v3 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x263EFF8F8], a2, (uint64_t)fileStart, self->_length, 0);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end