@interface SGPseudoEventKey
+ (BOOL)isSupportedEntityType:(int64_t)a3;
- (BOOL)isDropoff;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPseudoEventKey:(id)a3;
- (NSString)description;
- (NSString)domain;
- (NSString)groupId;
- (SGPseudoEventKey)initWithGloballyUniqueId:(id)a3;
- (SGPseudoEventKey)initWithSerialized:(id)a3;
- (id)alternativeKeysForEventKitQuery;
- (id)serialize;
- (unint64_t)hash;
@end

@implementation SGPseudoEventKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupId, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_serialized, 0);
}

- (NSString)groupId
{
  return self->_groupId;
}

- (NSString)domain
{
  return self->_domain;
}

- (id)alternativeKeysForEventKitQuery
{
  v3 = objc_opt_new();
  v4 = (void *)MEMORY[0x1CB79B230]();
  v5 = [(NSString *)self->_groupId componentsSeparatedByString:@"|"];
  if ([v5 count])
  {
    unint64_t v6 = 0;
    uint64_t v7 = -1;
    do
    {
      v8 = (void *)MEMORY[0x1CB79B230]();
      v9 = [v5 objectAtIndexedSubscript:v6];
      if ([v9 length]
        && [v9 characterAtIndex:0] == 123
        && objc_msgSend(v9, "characterAtIndex:", objc_msgSend(v9, "length") - 1) == 125)
      {
        v10 = objc_msgSend(v5, "subarrayWithRange:", 0, v6);
        v11 = objc_msgSend(v5, "subarrayWithRange:", v6 + 1, objc_msgSend(v5, "count") + v7);
        v12 = [v10 arrayByAddingObjectsFromArray:v11];
        v13 = objc_msgSend(v12, "_pas_componentsJoinedByString:", @"|");

        v14 = SGDelimitedStringsSerialize();
        objc_msgSend(v3, "addObject:", v14, 0);
      }
      ++v6;
      --v7;
    }
    while ([v5 count] > v6);
  }

  return v3;
}

- (BOOL)isDropoff
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1CB79B230](self, a2);
  [(NSString *)self->_groupId componentsSeparatedByString:@"|"];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "isEqualToString:", @"{dropoff}", (void)v11))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (NSString)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"[SGPseudoEventKey groupId:%@", self->_groupId];
  return (NSString *)v2;
}

- (id)serialize
{
  return (id)SGDelimitedStringsSerialize();
}

- (unint64_t)hash
{
  return [(NSString *)self->_groupId hash];
}

- (BOOL)isEqualToPseudoEventKey:(id)a3
{
  id v4 = self->_groupId;
  uint64_t v5 = v4;
  if (v4 == *((NSString **)a3 + 3)) {
    char v6 = 1;
  }
  else {
    char v6 = -[NSString isEqual:](v4, "isEqual:");
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SGPseudoEventKey *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGPseudoEventKey *)self isEqualToPseudoEventKey:v5];

  return v6;
}

- (SGPseudoEventKey)initWithGloballyUniqueId:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SGPseudoEventKey.m", 41, @"Invalid parameter not satisfying: %@", @"globalId" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)SGPseudoEventKey;
  uint64_t v7 = [(SGPseudoEventKey *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_groupId, a3);
  }

  return v8;
}

- (SGPseudoEventKey)initWithSerialized:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SGPseudoEventKey.m", 33, @"Invalid parameter not satisfying: %@", @"serialized" object file lineNumber description];
  }
  id v6 = SGDelimitedStringsDeserialize();
  if ([v6 count] != 1)
  {
    objc_super v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"SGPseudoEventKey.m" lineNumber:35 description:@"Invalid serialization"];
  }
  uint64_t v7 = [v6 objectAtIndexedSubscript:0];
  v8 = [(SGPseudoEventKey *)self initWithGloballyUniqueId:v7];

  return v8;
}

+ (BOOL)isSupportedEntityType:(int64_t)a3
{
  if ((unint64_t)a3 < 0x1C) {
    return (a3 & 0xFFFFFFF) == 2;
  }
  uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"SGPseudoEventKey.m", 107, @"Unknown entity type: %lu", a3);

  return 0;
}

@end