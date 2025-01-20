@interface BKSTouchDeliveryUpdate
+ (BOOL)supportsSecureCoding;
- (BKSTouchDeliveryUpdate)initWithCoder:(id)a3;
- (BOOL)isDetached;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)pid;
- (int64_t)type;
- (unsigned)contextID;
- (unsigned)touchIdentifier;
- (void)appendDescriptionToStream:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setContextID:(unsigned int)a3;
- (void)setIsDetached:(BOOL)a3;
- (void)setPid:(int)a3;
- (void)setTouchIdentifier:(unsigned int)a3;
- (void)setType:(int64_t)a3;
@end

@implementation BKSTouchDeliveryUpdate

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"updateType"];
  [v5 encodeInteger:self->_touchIdentifier forKey:@"touchIdentifier"];
  [v5 encodeBool:self->_isDetached forKey:@"isDetached"];
  [v5 encodeInteger:self->_contextID forKey:@"contextID"];
  [v5 encodeInteger:self->_pid forKey:@"pid"];
}

- (void)setTouchIdentifier:(unsigned int)a3
{
  self->_touchIdentifier = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [+[BKSTouchDeliveryUpdate allocWithZone:a3] init];
  *((void *)result + 3) = self->_type;
  *((_DWORD *)result + 3) = self->_touchIdentifier;
  *((unsigned char *)result + 8) = self->_isDetached;
  *((_DWORD *)result + 4) = self->_contextID;
  *((_DWORD *)result + 5) = self->_pid;
  return result;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (void)setIsDetached:(BOOL)a3
{
  self->_isDetached = a3;
}

- (void)setContextID:(unsigned int)a3
{
  self->_contextID = a3;
}

- (unsigned)touchIdentifier
{
  return self->_touchIdentifier;
}

- (int)pid
{
  return self->_pid;
}

- (unsigned)contextID
{
  return self->_contextID;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)isDetached
{
  return self->_isDetached;
}

- (BKSTouchDeliveryUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BKSTouchDeliveryUpdate;
  id v5 = [(BKSTouchDeliveryUpdate *)&v7 init];
  if (v5)
  {
    v5->_int64_t type = [v4 decodeIntegerForKey:@"updateType"];
    v5->_touchIdentifier = [v4 decodeIntegerForKey:@"touchIdentifier"];
    v5->_isDetached = [v4 decodeBoolForKey:@"isDetached"];
    v5->_contextID = [v4 decodeIntegerForKey:@"contextID"];
    v5->_pid = [v4 decodeIntegerForKey:@"pid"];
  }

  return v5;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__BKSTouchDeliveryUpdate_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E5441BB0;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  [v5 appendProem:0 block:v6];
}

id __52__BKSTouchDeliveryUpdate_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = NSStringFromBKSTouchDeliveryUpdateType(*(void *)(*(void *)(a1 + 40) + 24));
  [v2 appendString:v3 withName:0];

  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(unsigned int *)(v4 + 12);
  if (v5)
  {
    id v6 = (id)[*(id *)(a1 + 32) appendInteger:v5 withName:@"touchIdentifier"];
    uint64_t v4 = *(void *)(a1 + 40);
  }
  if (*(unsigned char *)(v4 + 8))
  {
    id v7 = (id)[*(id *)(a1 + 32) appendBool:1 withName:@"detached"];
    uint64_t v4 = *(void *)(a1 + 40);
  }
  id result = (id)[*(id *)(a1 + 32) appendInteger:*(int *)(v4 + 20) withName:@"pid"];
  uint64_t v9 = *(unsigned int *)(*(void *)(a1 + 40) + 16);
  if (v9) {
    return (id)[*(id *)(a1 + 32) appendInteger:v9 withName:@"contextID"];
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  v8 = v7;

  BOOL v9 = v8
    && self->_type == v8[3]
    && self->_touchIdentifier == *((_DWORD *)v8 + 3)
    && self->_isDetached == *((unsigned __int8 *)v8 + 8)
    && self->_contextID == *((_DWORD *)v8 + 4)
    && self->_pid == *((_DWORD *)v8 + 5);

  return v9;
}

@end