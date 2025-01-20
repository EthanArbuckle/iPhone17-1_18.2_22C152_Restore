@interface SGMessageKey
+ (BOOL)isSupportedEntityType:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMessageKey:(id)a3;
- (NSString)description;
- (NSString)source;
- (NSString)uniqueIdentifier;
- (SGMessageKey)initWithSerialized:(id)a3;
- (SGMessageKey)initWithSource:(id)a3 uniqueIdentifier:(id)a4;
- (id)serialize;
- (unint64_t)hash;
@end

@implementation SGMessageKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (NSString)source
{
  return self->_source;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<SGMessageKey source:%@ uniqueIdentifier:%@>", self->_source, self->_uniqueIdentifier];
  return (NSString *)v2;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_source hash];
  return [(NSString *)self->_uniqueIdentifier hash] - v3 + 32 * v3;
}

- (BOOL)isEqualToMessageKey:(id)a3
{
  v4 = (SGMessageKey *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v11 = 1;
    goto LABEL_11;
  }
  source = self->_source;
  v7 = v4->_source;
  if (source == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = source;
    char v10 = [(NSString *)v9 isEqual:v8];

    if ((v10 & 1) == 0)
    {
      char v11 = 0;
      goto LABEL_11;
    }
  }
  v12 = self->_uniqueIdentifier;
  v13 = v12;
  if (v12 == v5->_uniqueIdentifier) {
    char v11 = 1;
  }
  else {
    char v11 = -[NSString isEqual:](v12, "isEqual:");
  }

LABEL_11:
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SGMessageKey *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGMessageKey *)self isEqualToMessageKey:v5];

  return v6;
}

- (id)serialize
{
  return (id)SGDelimitedStringsSerialize();
}

- (SGMessageKey)initWithSerialized:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    char v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SGMessageKey.m", 35, @"Invalid parameter not satisfying: %@", @"serialized" object file lineNumber description];
  }
  BOOL v6 = SGDelimitedStringsDeserialize();
  if ([v6 count] != 2 && objc_msgSend(v6, "count") != 3)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"SGMessageKey.m" lineNumber:38 description:@"Invalid serialization"];
  }
  v7 = [v6 objectAtIndexedSubscript:0];
  v8 = [v6 objectAtIndexedSubscript:1];
  v9 = [(SGMessageKey *)self initWithSource:v7 uniqueIdentifier:v8];

  return v9;
}

- (SGMessageKey)initWithSource:(id)a3 uniqueIdentifier:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  char v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SGMessageKey.m", 21, @"Invalid parameter not satisfying: %@", @"source" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"SGMessageKey.m", 22, @"Invalid parameter not satisfying: %@", @"uniqueIdentifier" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)SGMessageKey;
  char v11 = [(SGMessageKey *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_uniqueIdentifier, a4);
    objc_storeStrong((id *)&v12->_source, a3);
  }

  return v12;
}

+ (BOOL)isSupportedEntityType:(int64_t)a3
{
  if ((unint64_t)a3 >= 0x1C)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"SGMessageKey.m", 81, @"Unknown entity type: %lu", a3);

    LOBYTE(v4) = 0;
  }
  else
  {
    return (0x52020u >> a3) & 1;
  }
  return v4;
}

@end