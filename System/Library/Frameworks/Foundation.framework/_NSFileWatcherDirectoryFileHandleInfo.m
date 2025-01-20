@interface _NSFileWatcherDirectoryFileHandleInfo
- (BOOL)isDirectory;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)close;
@end

@implementation _NSFileWatcherDirectoryFileHandleInfo

- (unint64_t)hash
{
  return CFHashBytes();
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  uint64_t v5 = objc_opt_class();
  return v5 == objc_opt_class()
      && *(_DWORD *)(&self->super.closed + 1) == *(_DWORD *)((char *)a3 + 13)
      && *(void *)((char *)&self->inodeDevPair.dev + 1) == *(void *)((char *)a3 + 17);
}

- (BOOL)isDirectory
{
  return 1;
}

- (void)close
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = self;
  [(id)qword_1EB1EDE88 removeObject:self];
  if (![(id)qword_1EB1EDE88 countForObject:self])
  {
    v5.receiver = self;
    v5.super_class = (Class)_NSFileWatcherDirectoryFileHandleInfo;
    [(_NSFileWatcherFileHandleInfo *)&v5 close];
  }
  v4 = self;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@:%p> Directory: %d - inode: %llu dev: %d", objc_opt_class(), self, self->super.fileHandle, *(void *)((char *)&self->inodeDevPair.dev + 1), *(unsigned int *)(&self->super.closed + 1)];
}

@end