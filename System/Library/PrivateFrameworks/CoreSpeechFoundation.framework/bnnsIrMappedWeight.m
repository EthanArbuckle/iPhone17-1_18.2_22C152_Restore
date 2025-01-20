@interface bnnsIrMappedWeight
- (NSString)weightFilePath;
- (bnnsIrMappedWeight)initWithWeightFile:(id)a3 errOut:(id *)a4;
- (unint64_t)weightSize;
- (void)dealloc;
- (void)getWeightData;
- (void)setWeightSize:(unint64_t)a3;
- (void)ummapForWeight;
@end

@implementation bnnsIrMappedWeight

- (void).cxx_destruct
{
}

- (void)setWeightSize:(unint64_t)a3
{
  self->_weightSize = a3;
}

- (unint64_t)weightSize
{
  return self->_weightSize;
}

- (NSString)weightFilePath
{
  return self->_weightFilePath;
}

- (void)getWeightData
{
  return self->_weightData;
}

- (void)ummapForWeight
{
  weightData = self->_weightData;
  if (weightData != (void *)-1)
  {
    munmap(weightData, self->_weightSize);
    self->_weightData = (void *)-1;
    self->_weightSize = 0;
  }
}

- (void)dealloc
{
  [(bnnsIrMappedWeight *)self ummapForWeight];
  v3.receiver = self;
  v3.super_class = (Class)bnnsIrMappedWeight;
  [(bnnsIrMappedWeight *)&v3 dealloc];
}

- (bnnsIrMappedWeight)initWithWeightFile:(id)a3 errOut:(id *)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)bnnsIrMappedWeight;
  v7 = [(bnnsIrMappedWeight *)&v22 init];
  if (!v7) {
    goto LABEL_4;
  }
  int v8 = open((const char *)[v6 UTF8String], 0);
  fstat(v8, &v21);
  size_t st_size = v21.st_size;
  v7->_weightSize = v21.st_size;
  if (v8 == -1)
  {
    if (a4)
    {
      v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = *MEMORY[0x1E4F28568];
      v12 = NSString;
      v13 = __error();
      v14 = objc_msgSend(v12, "stringWithFormat:", @"Could not OPEN() weights: %s", strerror(*v13));
      v26[0] = v14;
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
      v16 = [v11 errorWithDomain:@"com.apple.corespeech" code:2454 userInfo:v15];
LABEL_9:
      *a4 = v16;
    }
LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  v7->_weightData = mmap(0, st_size, 1, 2, v8, 0);
  close(v8);
  if (v7->_weightData == (void *)-1)
  {
    if (a4)
    {
      v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F28568];
      v18 = NSString;
      v19 = __error();
      v14 = objc_msgSend(v18, "stringWithFormat:", @"Could not MMAP() weights: %s", strerror(*v19));
      v24 = v14;
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      v16 = [v17 errorWithDomain:@"com.apple.corespeech" code:2454 userInfo:v15];
      goto LABEL_9;
    }
    goto LABEL_10;
  }
LABEL_4:
  v10 = v7;
LABEL_11:

  return v10;
}

@end