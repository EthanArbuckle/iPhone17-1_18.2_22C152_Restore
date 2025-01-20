@interface _PFTempNestedSnapshot
- (_PFTempNestedSnapshot)initWithOwnedKKsD:(id)a3 andVersion:(unint64_t)a4;
- (const)knownKeyValuesPointer;
- (id)_snapshot_;
- (id)valueForKey:(id)a3;
- (unsigned)_versionNumber;
- (void)dealloc;
@end

@implementation _PFTempNestedSnapshot

- (_PFTempNestedSnapshot)initWithOwnedKKsD:(id)a3 andVersion:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_PFTempNestedSnapshot;
  result = [(_PFTempNestedSnapshot *)&v7 init];
  if (result)
  {
    result->_snapshot = (NSKnownKeysDictionary *)a3;
    result->_version = a4;
  }
  return result;
}

- (const)knownKeyValuesPointer
{
  return [(NSKnownKeysDictionary *)self->_snapshot values];
}

- (id)_snapshot_
{
  return 0;
}

- (unsigned)_versionNumber
{
  return self->_version;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_PFTempNestedSnapshot;
  [(_PFTempNestedSnapshot *)&v3 dealloc];
}

- (id)valueForKey:(id)a3
{
  return (id)[(NSKnownKeysDictionary *)self->_snapshot valueForKey:a3];
}

@end