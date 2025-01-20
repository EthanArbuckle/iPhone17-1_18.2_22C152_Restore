@interface _NSFileWatcherFileHandleInfo
+ (id)openFileWithPath:(id)a3;
- (BOOL)isDirectory;
- (BOOL)verifyAccessByAuditToken:(id *)a3;
- (id)description;
- (void)close;
- (void)dealloc;
@end

@implementation _NSFileWatcherFileHandleInfo

- (BOOL)verifyAccessByAuditToken:(id *)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  return fcntl(self->fileHandle, 50, v4) != -1 && sandbox_check_by_audit_token() == 0;
}

- (BOOL)isDirectory
{
  return 0;
}

+ (id)openFileWithPath:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v3 = open((const char *)[a3 fileSystemRepresentation], 2129920);
  if (_MergedGlobals_152 != -1) {
    dispatch_once(&_MergedGlobals_152, &__block_literal_global_83);
  }
  if (v3 == -1) {
    return 0;
  }
  memset(&v11, 0, sizeof(v11));
  if (!fstat(v3, &v11) && (v11.st_mode & 0xF000) == 0x4000)
  {
    v4 = objc_alloc_init(_NSFileWatcherDirectoryFileHandleInfo);
    if (v4)
    {
      uint64_t v5 = v4;
      *(_DWORD *)(&v4->super.closed + 1) = v11.st_dev;
      *(void *)((char *)&v4->inodeDevPair.dev + 1) = v11.st_ino;
      uint64_t v6 = [(id)qword_1EB1EDE88 member:v4];
      if (v6)
      {
        v7 = (void *)v6;
        close(v3);
        v8 = v7;
      }
      else
      {
        v5->super.fileHandle = v3;
        v8 = v5;
      }
      [(id)qword_1EB1EDE88 addObject:v8];
      return v8;
    }
    return 0;
  }
  v9 = objc_alloc_init(_NSFileWatcherFileHandleInfo);
  v8 = v9;
  if (v9) {
    v9->fileHandle = v3;
  }
  return v8;
}

- (void)close
{
  if (self->closed)
  {
    int v3 = +[NSString stringWithFormat:@"Attempting to close a file descriptor that was already closed: %@", self];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v3 userInfo:0]);
  }
  close(self->fileHandle);
  self->closed = 1;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (self->fileHandle && !self->closed)
  {
    v2 = +[NSString stringWithFormat:@"%@ was deallocated without being closed", self];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v2 userInfo:0]);
  }
  v3.receiver = self;
  v3.super_class = (Class)_NSFileWatcherFileHandleInfo;
  [(_NSFileWatcherFileHandleInfo *)&v3 dealloc];
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@:%p> File: %d", objc_opt_class(), self, self->fileHandle];
}

@end