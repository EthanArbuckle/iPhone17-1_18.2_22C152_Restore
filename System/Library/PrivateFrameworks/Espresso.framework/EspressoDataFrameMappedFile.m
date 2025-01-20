@interface EspressoDataFrameMappedFile
- (EspressoDataFrameMappedFile)initWithPath:(id)a3;
- (NSString)path;
- (char)basePtr;
- (void)dealloc;
- (void)setBasePtr:(char *)a3;
- (void)setPath:(id)a3;
@end

@implementation EspressoDataFrameMappedFile

- (void).cxx_destruct
{
}

- (void)setBasePtr:(char *)a3
{
  self->_basePtr = a3;
}

- (char)basePtr
{
  return self->_basePtr;
}

- (void)setPath:(id)a3
{
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)dealloc
{
  basePtr = self->_basePtr;
  if ((unint64_t)(basePtr + 1) >= 2) {
    munmap(basePtr, self->length);
  }
  int file_id = self->file_id;
  if (file_id != -1) {
    close(file_id);
  }
  v5.receiver = self;
  v5.super_class = (Class)EspressoDataFrameMappedFile;
  [(EspressoDataFrameMappedFile *)&v5 dealloc];
}

- (EspressoDataFrameMappedFile)initWithPath:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)EspressoDataFrameMappedFile;
  objc_super v5 = [(EspressoDataFrameMappedFile *)&v14 init];
  v6 = v5;
  if (v5)
  {
    [(EspressoDataFrameMappedFile *)v5 setBasePtr:0];
    id v7 = v4;
    v6->int file_id = open((const char *)[v7 UTF8String], 0);
    objc_storeStrong((id *)&v6->_path, v7);
    int file_id = v6->file_id;
    if (file_id == -1) {
      Espresso::throw_exception_selector<Espresso::io_error,char const*>("Error loading file: %s", [v7 UTF8String]);
    }
    v13.off_t st_size = 0;
    fstat(file_id, &v13);
    off_t st_size = v13.st_size;
    v6->length = v13.st_size;
    if (!st_size) {
      Espresso::throw_exception_selector<Espresso::io_error,char const*>("Error mapping file: %s", [v7 UTF8String]);
    }
    v10 = (char *)mmap(0, st_size, 1, 2, v6->file_id, 0);
    v6->_basePtr = v10;
    if ((unint64_t)(v10 + 1) <= 1) {
      Espresso::throw_exception_selector<Espresso::io_error,char const*>("Error mapping file: %s", [v7 UTF8String]);
    }
    v11 = v6;
  }

  return v6;
}

@end