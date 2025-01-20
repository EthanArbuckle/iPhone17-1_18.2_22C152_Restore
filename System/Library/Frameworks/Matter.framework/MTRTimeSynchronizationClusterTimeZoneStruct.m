@interface MTRTimeSynchronizationClusterTimeZoneStruct
- (MTRTimeSynchronizationClusterTimeZoneStruct)init;
- (NSNumber)offset;
- (NSNumber)validAt;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setName:(NSString *)name;
- (void)setOffset:(NSNumber *)offset;
- (void)setValidAt:(NSNumber *)validAt;
@end

@implementation MTRTimeSynchronizationClusterTimeZoneStruct

- (MTRTimeSynchronizationClusterTimeZoneStruct)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRTimeSynchronizationClusterTimeZoneStruct;
  v2 = [(MTRTimeSynchronizationClusterTimeZoneStruct *)&v8 init];
  v3 = v2;
  if (v2)
  {
    offset = v2->_offset;
    v2->_offset = (NSNumber *)&unk_26F9C8620;

    validAt = v3->_validAt;
    v3->_validAt = (NSNumber *)&unk_26F9C8620;

    name = v3->_name;
    v3->_name = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRTimeSynchronizationClusterTimeZoneStruct);
  v7 = objc_msgSend_offset(self, v5, v6);
  objc_msgSend_setOffset_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_validAt(self, v9, v10);
  objc_msgSend_setValidAt_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_name(self, v13, v14);
  objc_msgSend_setName_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: offset:%@; validAt:%@; name:%@; >",
    v5,
    self->_offset,
    self->_validAt,
  v7 = self->_name);

  return v7;
}

- (NSNumber)offset
{
  return self->_offset;
}

- (void)setOffset:(NSNumber *)offset
{
}

- (NSNumber)validAt
{
  return self->_validAt;
}

- (void)setValidAt:(NSNumber *)validAt
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_validAt, 0);

  objc_storeStrong((id *)&self->_offset, 0);
}

@end