@interface SGRawKey
+ (BOOL)isSupportedEntityType:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRawKey:(id)a3;
- (NSString)description;
- (SGRawKey)initWithSerialized:(id)a3;
- (id)serialize;
- (unint64_t)hash;
@end

@implementation SGRawKey

- (void).cxx_destruct
{
}

- (NSString)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<SGRawKey: %@>", self->_serialized];
  return (NSString *)v2;
}

- (unint64_t)hash
{
  return [(NSString *)self->_serialized hash];
}

- (BOOL)isEqualToRawKey:(id)a3
{
  v4 = (SGRawKey *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    v5 = self->_serialized;
    v6 = v5;
    if (v5 == v4->_serialized) {
      char v7 = 1;
    }
    else {
      char v7 = -[NSString isEqual:](v5, "isEqual:");
    }
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SGRawKey *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGRawKey *)self isEqualToRawKey:v5];

  return v6;
}

- (id)serialize
{
  return self->_serialized;
}

- (SGRawKey)initWithSerialized:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SGRawKey.m", 18, @"Invalid parameter not satisfying: %@", @"serialized" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)SGRawKey;
  char v7 = [(SGRawKey *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_serialized, a3);
  }

  return v8;
}

+ (BOOL)isSupportedEntityType:(int64_t)a3
{
  return 1;
}

@end