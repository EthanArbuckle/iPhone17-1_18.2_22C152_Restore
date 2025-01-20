@interface SGCuratedEventKey
+ (BOOL)isSupportedEntityType:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCuratedEventKey:(id)a3;
- (NSString)description;
- (NSString)externalId;
- (SGCuratedEventKey)initWithExternalId:(id)a3;
- (SGCuratedEventKey)initWithSerialized:(id)a3;
- (id)serialize;
- (unint64_t)hash;
@end

@implementation SGCuratedEventKey

- (void).cxx_destruct
{
}

- (NSString)externalId
{
  return self->_externalId;
}

- (NSString)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<SGCuratedEvent externalId: %@>", self->_externalId];
  return (NSString *)v2;
}

- (unint64_t)hash
{
  return [(NSString *)self->_externalId hash];
}

- (BOOL)isEqualToCuratedEventKey:(id)a3
{
  v4 = (SGCuratedEventKey *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    v5 = self->_externalId;
    v6 = v5;
    if (v5 == v4->_externalId) {
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
  v4 = (SGCuratedEventKey *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGCuratedEventKey *)self isEqualToCuratedEventKey:v5];

  return v6;
}

- (SGCuratedEventKey)initWithExternalId:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SGCuratedEventKey.m", 28, @"Invalid parameter not satisfying: %@", @"externalId" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)SGCuratedEventKey;
  char v7 = [(SGCuratedEventKey *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_externalId, a3);
  }

  return v8;
}

- (id)serialize
{
  return self->_externalId;
}

- (SGCuratedEventKey)initWithSerialized:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SGCuratedEventKey.m", 17, @"Invalid parameter not satisfying: %@", @"serialized" object file lineNumber description];
  }
  id v6 = [(SGCuratedEventKey *)self initWithExternalId:v5];

  return v6;
}

+ (BOOL)isSupportedEntityType:(int64_t)a3
{
  if ((unint64_t)a3 < 0x1C) {
    return (a3 & 0xFFFFFFF) == 1;
  }
  char v7 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"SGCuratedEventKey.m", 77, @"Unknown entity type: %lu", a3);

  return 0;
}

@end