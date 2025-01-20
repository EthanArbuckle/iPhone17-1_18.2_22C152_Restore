@interface NSAllDescendantPathsEnumerator
+ (id)newWithPath:(id)a3 prepend:(id)a4 attributes:(id)a5 cross:(BOOL)a6 depth:(unint64_t)a7;
- (BOOL)isEnumeratingDirectoryPostOrder;
- (id)_under;
- (id)currentSubdirectoryAttributes;
- (id)directoryAttributes;
- (id)fileAttributes;
- (id)nextObject;
- (unint64_t)level;
- (void)dealloc;
- (void)skipDescendants;
@end

@implementation NSAllDescendantPathsEnumerator

+ (id)newWithPath:(id)a3 prepend:(id)a4 attributes:(id)a5 cross:(BOOL)a6 depth:(unint64_t)a7
{
  uint64_t v12 = [objc_allocWithZone((Class)a1) init];
  *(void *)(v12 + 16) = [+[NSFileManager defaultManager] contentsOfDirectoryAtPath:a3 error:0];
  *(void *)(v12 + 32) = [a4 copyWithZone:0];
  *(void *)(v12 + 8) = (id)[a3 stringByAppendingString:@"/"];
  *(void *)(v12 + 48) = a5;
  *(unsigned char *)(v12 + 72) = a6;
  *(void *)(v12 + 64) = a7;
  return (id)v12;
}

- (id)nextObject
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  memset(&v12, 0, sizeof(v12));
  under = self->under;
  if (under)
  {
    id v4 = [(NSAllDescendantPathsEnumerator *)under nextObject];
    if (v4) {
      return v4;
    }

    self->pathToLastReportedItem = self->under->pathToLastReportedItem;
    self->under = 0;
  }
  unint64_t v5 = [(NSArray *)self->contents count];
  if (self->idx >= v5) {
    return 0;
  }
  unint64_t v6 = v5;
  while (1)
  {
    id v4 = -[NSArray objectAtIndex:](self->contents, "objectAtIndex:");
    ++self->idx;
    v7 = [(NSString *)self->path stringByAppendingString:v4];
    if (!lstat([(NSString *)v7 fileSystemRepresentation], &v12)) {
      break;
    }
    if (self->idx >= v6) {
      return 0;
    }
  }

  self->pathToLastReportedItem = v7;
  if ((v12.st_mode & 0xF000) == 0x4000)
  {
    prepend = self->prepend;
    uint64_t v10 = (uint64_t)v4;
    if (prepend) {
      uint64_t v10 = -[NSString stringByAppendingPathComponent:](prepend, "stringByAppendingPathComponent:", v4, v4);
    }
    self->under = (NSAllDescendantPathsEnumerator *)+[NSAllDescendantPathsEnumerator newWithPath:v7 prepend:v10 attributes:0 cross:self->cross depth:self->depth + 1];
  }
  v11 = self->prepend;
  if (v11) {
    return [(NSString *)v11 stringByAppendingPathComponent:v4];
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSAllDescendantPathsEnumerator;
  [(NSAllDescendantPathsEnumerator *)&v3 dealloc];
}

- (id)fileAttributes
{
  do
  {
    v2 = self;
    self = self->under;
  }
  while (self && self->idx);
  objc_super v3 = +[NSFileManager defaultManager];
  pathToLastReportedItem = v2->pathToLastReportedItem;

  return [(NSFileManager *)v3 attributesOfItemAtPath:pathToLastReportedItem error:0];
}

- (id)directoryAttributes
{
  objc_super v3 = +[NSFileManager defaultManager];
  path = self->path;

  return [(NSFileManager *)v3 attributesOfItemAtPath:path error:0];
}

- (id)currentSubdirectoryAttributes
{
  do
  {
    v2 = self;
    self = self->under;
  }
  while (self && self->idx);
  objc_super v3 = +[NSFileManager defaultManager];
  uint64_t v4 = [(NSString *)v2->pathToLastReportedItem stringByDeletingLastPathComponent];

  return [(NSFileManager *)v3 attributesOfItemAtPath:v4 error:0];
}

- (unint64_t)level
{
  do
  {
    v2 = self;
    self = self->under;
  }
  while (self && self->idx);
  return v2->depth;
}

- (id)_under
{
  return self->under;
}

- (void)skipDescendants
{
  under = self->under;
  if (under && (uint64_t v4 = [(NSAllDescendantPathsEnumerator *)under _under], under = self->under, !v4))
  {

    self->under = 0;
  }
  else
  {
    [(NSAllDescendantPathsEnumerator *)under skipDescendents];
  }
}

- (BOOL)isEnumeratingDirectoryPostOrder
{
  return 0;
}

@end