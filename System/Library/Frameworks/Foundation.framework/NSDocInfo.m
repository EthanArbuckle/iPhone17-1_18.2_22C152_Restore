@interface NSDocInfo
- (NSDocInfo)initWithFileAttributes:(id)a3;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initFromInfo:(stat *)a3;
- (void)setFileAttributes:(id)a3;
@end

@implementation NSDocInfo

- (id)initFromInfo:(stat *)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSDocInfo;
  id result = [(NSDocInfo *)&v6 init];
  *((void *)result + 1) = a3->st_mtimespec.tv_sec;
  mode_t st_mode = a3->st_mode;
  *((_WORD *)result + 8) = st_mode;
  *((_WORD *)result + 9) = *((_WORD *)result + 9) & 0xFFFA | ((st_mode & 0xF000) == 0x4000) | (4
                                                                                             * ((st_mode & 0xF000) == 40960));
  return result;
}

- (void)setFileAttributes:(id)a3
{
  if (!a3)
  {
    self->time = 0;
    self->mode = 0;
    unsigned __int16 v8 = *(&self->mode + 1) & 0xFFF8;
LABEL_11:
    *(&self->mode + 1) = v8;
    return;
  }
  v5 = (void *)[a3 fileModificationDate];
  if (v5)
  {
    [v5 timeIntervalSince1970];
    int64_t v7 = (uint64_t)v6;
  }
  else
  {
    int64_t v7 = 0;
  }
  self->time = v7;
  self->mode = [a3 filePosixPermissions];
  v9 = (void *)[a3 fileType];
  if (v9)
  {
    v10 = v9;
    *(&self->mode + 1) = *(&self->mode + 1) & 0xFFFE | [v9 isEqualToString:@"NSFileTypeDirectory"];
    if ([v10 isEqualToString:@"NSFileTypeSymbolicLink"]) {
      __int16 v11 = 4;
    }
    else {
      __int16 v11 = 0;
    }
    unsigned __int16 v8 = *(&self->mode + 1) & 0xFFF9 | v11;
    goto LABEL_11;
  }
}

- (NSDocInfo)initWithFileAttributes:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSDocInfo;
  v4 = [(NSDocInfo *)&v6 init];
  [(NSDocInfo *)v4 setFileAttributes:a3];
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return NSCopyObject(self, 0, a3);
}

- (id)copy
{
  return [(NSDocInfo *)self copyWithZone:0];
}

@end