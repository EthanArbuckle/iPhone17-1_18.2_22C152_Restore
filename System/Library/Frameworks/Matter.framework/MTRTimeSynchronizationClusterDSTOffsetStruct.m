@interface MTRTimeSynchronizationClusterDSTOffsetStruct
- (MTRTimeSynchronizationClusterDSTOffsetStruct)init;
- (NSNumber)offset;
- (NSNumber)validStarting;
- (NSNumber)validUntil;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setOffset:(NSNumber *)offset;
- (void)setValidStarting:(NSNumber *)validStarting;
- (void)setValidUntil:(NSNumber *)validUntil;
@end

@implementation MTRTimeSynchronizationClusterDSTOffsetStruct

- (MTRTimeSynchronizationClusterDSTOffsetStruct)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRTimeSynchronizationClusterDSTOffsetStruct;
  v2 = [(MTRTimeSynchronizationClusterDSTOffsetStruct *)&v8 init];
  v3 = v2;
  if (v2)
  {
    offset = v2->_offset;
    v2->_offset = (NSNumber *)&unk_26F9C8620;

    validStarting = v3->_validStarting;
    v3->_validStarting = (NSNumber *)&unk_26F9C8620;

    validUntil = v3->_validUntil;
    v3->_validUntil = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRTimeSynchronizationClusterDSTOffsetStruct);
  v7 = objc_msgSend_offset(self, v5, v6);
  objc_msgSend_setOffset_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_validStarting(self, v9, v10);
  objc_msgSend_setValidStarting_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_validUntil(self, v13, v14);
  objc_msgSend_setValidUntil_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: offset:%@; validStarting:%@; validUntil:%@; >",
    v5,
    self->_offset,
    self->_validStarting,
  v7 = self->_validUntil);

  return v7;
}

- (NSNumber)offset
{
  return self->_offset;
}

- (void)setOffset:(NSNumber *)offset
{
}

- (NSNumber)validStarting
{
  return self->_validStarting;
}

- (void)setValidStarting:(NSNumber *)validStarting
{
}

- (NSNumber)validUntil
{
  return self->_validUntil;
}

- (void)setValidUntil:(NSNumber *)validUntil
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validUntil, 0);
  objc_storeStrong((id *)&self->_validStarting, 0);

  objc_storeStrong((id *)&self->_offset, 0);
}

@end