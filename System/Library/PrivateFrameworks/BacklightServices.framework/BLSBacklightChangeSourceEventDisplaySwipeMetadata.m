@interface BLSBacklightChangeSourceEventDisplaySwipeMetadata
+ (BOOL)supportsSecureCoding;
- (BLSBacklightChangeSourceEventDisplaySwipeMetadata)initWithCoder:(id)a3;
- (BLSBacklightChangeSourceEventDisplaySwipeMetadata)initWithDirection:(int64_t)a3;
- (BLSBacklightChangeSourceEventDisplaySwipeMetadata)initWithXPCDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (int64_t)direction;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation BLSBacklightChangeSourceEventDisplaySwipeMetadata

- (BLSBacklightChangeSourceEventDisplaySwipeMetadata)initWithDirection:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BLSBacklightChangeSourceEventDisplaySwipeMetadata;
  result = [(BLSBacklightChangeSourceEventDisplaySwipeMetadata *)&v5 init];
  if (result) {
    result->_direction = a3;
  }
  return result;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = v3;
  unint64_t v5 = self->_direction - 1;
  if (v5 > 3) {
    v6 = @"Unknown";
  }
  else {
    v6 = off_1E6107750[v5];
  }
  [v3 appendString:v6 withName:@"direction"];
  v7 = [v4 build];

  return v7;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendInteger:self->_direction];
  unint64_t v5 = [v3 hash];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BLSBacklightChangeSourceEventDisplaySwipeMetadata *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t direction = self->_direction;
      BOOL v6 = direction == [(BLSBacklightChangeSourceEventDisplaySwipeMetadata *)v4 direction];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (BLSBacklightChangeSourceEventDisplaySwipeMetadata)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  int64_t int64 = xpc_dictionary_get_int64(v4, (const char *)[@"direction" UTF8String]);

  return [(BLSBacklightChangeSourceEventDisplaySwipeMetadata *)self initWithDirection:int64];
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  xpc_dictionary_set_int64(xdict, (const char *)[@"direction" UTF8String], self->_direction);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLSBacklightChangeSourceEventDisplaySwipeMetadata)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeIntegerForKey:@"direction"];

  return [(BLSBacklightChangeSourceEventDisplaySwipeMetadata *)self initWithDirection:v4];
}

- (void)encodeWithCoder:(id)a3
{
}

- (int64_t)direction
{
  return self->_direction;
}

@end