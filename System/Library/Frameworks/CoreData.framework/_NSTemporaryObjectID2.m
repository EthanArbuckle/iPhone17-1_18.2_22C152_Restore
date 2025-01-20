@interface _NSTemporaryObjectID2
+ (id)initWithEntity:(id)a3 andUUIDString:(id)a4;
- (BOOL)_isPersistentStoreAlive;
- (BOOL)isEqual:(id)a3;
- (id)_referenceData;
- (id)_storeIdentifier;
- (id)persistentStore;
- (unint64_t)hash;
- (void)_setPersistentStore:(id)a3;
- (void)dealloc;
@end

@implementation _NSTemporaryObjectID2

+ (id)initWithEntity:(id)a3 andUUIDString:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)[a4 length] < 0x25)
  {
    v9 = (const char *)[a4 UTF8String];
    int v10 = 0;
  }
  else
  {
    v7 = (void *)[a4 substringToIndex:36];
    v8 = (void *)[a4 substringFromIndex:36];
    v9 = (const char *)[v7 UTF8String];
    int v10 = [v8 intValue];
  }
  memset(uu, 0, sizeof(uu));
  int v11 = uuid_parse(v9, uu);
  v12 = 0;
  if (!v11)
  {
    if (*(void *)uu == *(void *)(qword_1EB2704A0 + 8) && *(void *)&uu[8] == *(void *)(qword_1EB2704A0 + 16))
    {
      v12 = _PFAllocateObject((Class)_NSTemporaryObjectID_Default_Class, 0);
    }
    else
    {
      v12 = _PFAllocateObject((Class)a1, 0);
      v12[4] = -[_NS128bitWrapper initWithBytes:]((char *)[_NS128bitWrapper alloc], uu);
    }
    v12[2] = a3;
    *((_DWORD *)v12 + 3) = v10;
  }
  return v12;
}

- (void)dealloc
{
  self->_store = 0;
  uuid128 = self->_uuid128;
  if (uuid128 != (_NS128bitWrapper *)qword_1EB2704A0) {

  }
  self->_uuid128 = 0;

  _PFDeallocateObject(self);
}

- (unint64_t)hash
{
  unsigned int counter = self->super._counter;
  if (counter) {
    return __rbit32(counter);
  }
  else {
    return [(_NS128bitWrapper *)self->_uuid128 hash];
  }
}

- (id)_storeIdentifier
{
  return (id)[self->_store identifier];
}

- (id)persistentStore
{
  return self->_store;
}

- (BOOL)_isPersistentStoreAlive
{
  return [self->_store _isPersistentStoreAlive];
}

- (void)_setPersistentStore:(id)a3
{
  id store = self->_store;
  if (store != a3)
  {

    self->_id store = a3;
  }
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  Class Class = object_getClass(self);
  if (Class != (Class)objc_opt_class() || self->super._counter != *((_DWORD *)a3 + 3)) {
    return 0;
  }
  uuid128 = self->_uuid128;
  if (uuid128 == *((_NS128bitWrapper **)a3 + 4)) {
    return 1;
  }

  return -[_NS128bitWrapper isEqual:](uuid128, "isEqual:");
}

- (id)_referenceData
{
  return self->_uuid128;
}

@end