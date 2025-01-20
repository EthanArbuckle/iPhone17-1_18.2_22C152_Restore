@interface MTLBinaryKey
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToKey:(id)a3;
- (MTLBinaryKey)initWithHash:(const void *)a3;
- (const)getFunctionId;
- (const)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation MTLBinaryKey

- (MTLBinaryKey)initWithHash:(const void *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTLBinaryKey;
  if ([(MTLBinaryKey *)&v4 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  id = (MTLHashKey *)self->_id;
  if (id)
  {
    MTLHashKey::~MTLHashKey(id);
    MEMORY[0x18530C140]();
  }
  v4.receiver = self;
  v4.super_class = (Class)MTLBinaryKey;
  [(MTLBinaryKey *)&v4 dealloc];
}

- (const)value
{
  return (const $2772B1D07D29A72E8557B2574C0AE5C1 *)((char *)self->_id + 24);
}

- (unint64_t)hash
{
  return MTLHashKey::hash((MTLHashKey *)self->_id);
}

- (BOOL)isEqualToKey:(id)a3
{
  id = self->_id;
  objc_super v4 = (void *)[a3 getFunctionId];

  return MTLHashKey::operator==(id, v4);
}

- (const)getFunctionId
{
  return self->_id;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [(MTLBinaryKey *)self isEqualToKey:a3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = [MTLBinaryKey alloc];
  id = self->_id;

  return [(MTLBinaryKey *)v4 initWithHash:id];
}

- (id)description
{
  v5.receiver = self;
  v5.super_class = (Class)MTLBinaryKey;
  id v3 = [(MTLBinaryKey *)&v5 description];
  return (id)[v3 stringByAppendingFormat:@" %@", MTLHashKey::description((MTLHashKey *)self->_id)];
}

@end