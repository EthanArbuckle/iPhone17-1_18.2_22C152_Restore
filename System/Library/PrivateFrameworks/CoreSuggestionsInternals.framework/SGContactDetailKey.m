@interface SGContactDetailKey
+ (BOOL)isSupportedEntityType:(int64_t)a3;
+ (id)prefixForForIdentityKey:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContactDetailKey:(id)a3;
- (NSString)description;
- (NSString)label;
- (NSString)value;
- (SGContactDetailKey)initWithIdentityKey:(id)a3 label:(id)a4 normalizedValue:(id)a5;
- (SGContactDetailKey)initWithSerialized:(id)a3;
- (SGIdentityKey)identityKey;
- (id)serialize;
- (unint64_t)hash;
@end

@implementation SGContactDetailKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identityKey, 0);
}

- (NSString)value
{
  return self->_value;
}

- (NSString)label
{
  return self->_label;
}

- (SGIdentityKey)identityKey
{
  return self->_identityKey;
}

- (NSString)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<SGContactDetailKey identityKey:%@ label:%@ value:%@>", self->_identityKey, self->_label, self->_value];
  return (NSString *)v2;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SGIdentityKey *)self->_identityKey hash];
  NSUInteger v4 = [(NSString *)self->_label hash] - v3 + 32 * v3;
  return [(NSString *)self->_value hash] - v4 + 32 * v4;
}

- (BOOL)isEqualToContactDetailKey:(id)a3
{
  NSUInteger v4 = (SGContactDetailKey *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    identityKey = self->_identityKey;
    v7 = v4->_identityKey;
    if (identityKey == v7)
    {
    }
    else
    {
      v8 = v7;
      v9 = identityKey;
      BOOL v10 = [(SGIdentityKey *)v9 isEqual:v8];

      if (!v10) {
        goto LABEL_9;
      }
    }
    label = self->_label;
    v13 = v5->_label;
    if (label == v13)
    {
    }
    else
    {
      v14 = v13;
      v15 = label;
      char v16 = [(NSString *)v15 isEqual:v14];

      if ((v16 & 1) == 0)
      {
LABEL_9:
        char v11 = 0;
        goto LABEL_15;
      }
    }
    v17 = self->_value;
    v18 = v17;
    if (v17 == v5->_value) {
      char v11 = 1;
    }
    else {
      char v11 = -[NSString isEqual:](v17, "isEqual:");
    }
  }
LABEL_15:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (SGContactDetailKey *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGContactDetailKey *)self isEqualToContactDetailKey:v5];

  return v6;
}

- (SGContactDetailKey)initWithIdentityKey:(id)a3 label:(id)a4 normalizedValue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SGContactDetailKey;
  v12 = [(SGContactDetailKey *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identityKey, a3);
    objc_storeStrong((id *)&v13->_label, a4);
    objc_storeStrong((id *)&v13->_value, a5);
  }

  return v13;
}

- (id)serialize
{
  v2 = [(SGIdentityKey *)self->_identityKey serialize];
  unint64_t v3 = SGDelimitedStringsSerialize();

  return v3;
}

- (SGContactDetailKey)initWithSerialized:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SGContactDetailKey.m", 20, @"Invalid parameter not satisfying: %@", @"serialized" object file lineNumber description];
  }
  BOOL v6 = SGDelimitedStringsDeserialize();
  v7 = [SGIdentityKey alloc];
  v8 = [v6 objectAtIndexedSubscript:0];
  id v9 = [(SGIdentityKey *)v7 initWithSerialized:v8];
  id v10 = [v6 objectAtIndexedSubscript:1];
  char v11 = [v10 isEqualToString:&stru_1F24EEF20];
  if (v11)
  {
    v12 = 0;
  }
  else
  {
    v12 = [v6 objectAtIndexedSubscript:1];
  }
  v13 = [v6 objectAtIndexedSubscript:2];
  if ([v13 isEqualToString:&stru_1F24EEF20])
  {
    v14 = [(SGContactDetailKey *)self initWithIdentityKey:v9 label:v12 normalizedValue:0];
  }
  else
  {
    objc_super v15 = [v6 objectAtIndexedSubscript:2];
    v14 = [(SGContactDetailKey *)self initWithIdentityKey:v9 label:v12 normalizedValue:v15];
  }
  if ((v11 & 1) == 0) {

  }
  return v14;
}

+ (BOOL)isSupportedEntityType:(int64_t)a3
{
  if ((unint64_t)a3 >= 0x1C)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"SGContactDetailKey.m", 84, @"Unknown entity type: %lu", a3);

    LOBYTE(v4) = 0;
  }
  else
  {
    return (0xF8CFC0u >> a3) & 1;
  }
  return v4;
}

+ (id)prefixForForIdentityKey:(id)a3
{
  unint64_t v3 = [a3 serialize];
  BOOL v4 = SGDelimitedStringsSerialize();

  return v4;
}

@end