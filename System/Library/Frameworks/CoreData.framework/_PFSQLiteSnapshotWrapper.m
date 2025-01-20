@interface _PFSQLiteSnapshotWrapper
- (BOOL)isEqual:(id)a3;
- (const)bytes;
- (id)description;
- (id)mutableCopy;
- (int64_t)compare:(id)a3;
- (uint64_t)data;
- (unint64_t)hash;
- (void)dealloc;
- (void)initWithData:(void *)a1;
@end

@implementation _PFSQLiteSnapshotWrapper

- (unint64_t)hash
{
  unint64_t result = (unint64_t)self->_s->hidden;
  if (result) {
    return CFHashBytes();
  }
  return result;
}

- (const)bytes
{
  return self->_s;
}

- (void)dealloc
{
  if (self->_flags)
  {
    sqlite3_snapshot_free(self->_s);
  }
  else
  {
    v3 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone) {
      v3 = malloc_default_zone();
    }
    malloc_zone_free(v3, self->_s);
  }
  self->_s = 0;
  v4.receiver = self;
  v4.super_class = (Class)_PFSQLiteSnapshotWrapper;
  [(_PFSQLiteSnapshotWrapper *)&v4 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0 && [(_PFSQLiteSnapshotWrapper *)self compare:a3] == 0;
}

- (int64_t)compare:(id)a3
{
  return sqlite3_snapshot_cmp(self->_s, (sqlite3_snapshot *)[a3 bytes]);
}

- (void)initWithData:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v7.receiver = a1;
  v7.super_class = (Class)_PFSQLiteSnapshotWrapper;
  v3 = objc_msgSendSuper2(&v7, sel_init);
  if (v3)
  {
    objc_super v4 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone) {
      objc_super v4 = malloc_default_zone();
    }
    v5 = malloc_type_zone_calloc(v4, 1uLL, 0x30uLL, 0x1000040EED21634uLL);
    v3[1] = v5;
    [a2 getBytes:v5 length:48];
    *((_DWORD *)v3 + 5) = 0;
  }
  return v3;
}

- (id)mutableCopy
{
  id v3 = objc_alloc((Class)objc_opt_class());
  if (self) {
    objc_super v4 = (void *)[MEMORY[0x1E4F1C9B8] dataWithBytes:self->_s length:48];
  }
  else {
    objc_super v4 = 0;
  }

  return -[_PFSQLiteSnapshotWrapper initWithData:](v3, v4);
}

- (uint64_t)data
{
  if (result) {
    return [MEMORY[0x1E4F1C9B8] dataWithBytes:*(void *)(result + 8) length:48];
  }
  return result;
}

- (id)description
{
  id v3 = NSString;
  objc_super v4 = objc_opt_class();
  ClassName = object_getClassName(v4);
  if (self) {
    uint64_t v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:self->_s length:48];
  }
  else {
    uint64_t v6 = 0;
  }
  return (id)[v3 stringWithFormat:@"%s (%p) : %@", ClassName, self, v6];
}

@end