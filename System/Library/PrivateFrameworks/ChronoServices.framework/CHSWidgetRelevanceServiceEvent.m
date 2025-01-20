@interface CHSWidgetRelevanceServiceEvent
+ (BOOL)supportsSecureCoding;
+ (id)addOrUpdateEventWithRelevanceKeys:(id)a3;
+ (id)reloadEvent;
+ (id)removeEventWithExtensionIdentities:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CHSWidgetRelevanceServiceEvent)initWithCoder:(id)a3;
- (NSSet)extensionIdentities;
- (NSSet)keys;
- (id)description;
- (unint64_t)eventType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)initWithEventType:(void *)a3 keys:(void *)a4 extensionIdentities:;
@end

@implementation CHSWidgetRelevanceServiceEvent

- (void)initWithEventType:(void *)a3 keys:(void *)a4 extensionIdentities:
{
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)CHSWidgetRelevanceServiceEvent;
    v9 = objc_msgSendSuper2(&v15, sel_init);
    a1 = v9;
    if (v9)
    {
      v9[1] = a2;
      uint64_t v10 = [v7 copy];
      v11 = (void *)a1[2];
      a1[2] = v10;

      uint64_t v12 = [v8 copy];
      v13 = (void *)a1[3];
      a1[3] = v12;
    }
  }

  return a1;
}

+ (id)reloadEvent
{
  v2 = -[CHSWidgetRelevanceServiceEvent initWithEventType:keys:extensionIdentities:](objc_alloc((Class)a1), 0, 0, 0);
  return v2;
}

+ (id)addOrUpdateEventWithRelevanceKeys:(id)a3
{
  id v4 = a3;
  v5 = -[CHSWidgetRelevanceServiceEvent initWithEventType:keys:extensionIdentities:](objc_alloc((Class)a1), 1, v4, 0);

  return v5;
}

+ (id)removeEventWithExtensionIdentities:(id)a3
{
  id v4 = a3;
  v5 = -[CHSWidgetRelevanceServiceEvent initWithEventType:keys:extensionIdentities:](objc_alloc((Class)a1), 2, 0, v4);

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = v3;
  unint64_t eventType = self->_eventType;
  v6 = @"reload";
  if (eventType == 1) {
    v6 = @"addOrUpdate";
  }
  if (eventType == 2) {
    id v7 = @"remove";
  }
  else {
    id v7 = v6;
  }
  [v3 appendString:v7 withName:@"eventType"];
  id v8 = [(NSSet *)self->_keys allObjects];
  [v4 appendArraySection:v8 withName:@"keys" skipIfEmpty:1];

  v9 = [(NSSet *)self->_extensionIdentities allObjects];
  [v4 appendArraySection:v9 withName:@"extensionIdentities" skipIfEmpty:1];

  uint64_t v10 = [v4 build];

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSSet *)self->_keys hash];
  return [(NSSet *)self->_extensionIdentities hash] ^ v3 ^ self->_eventType;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v4[1] == self->_eventType && BSEqualSets()) {
    char v5 = BSEqualSets();
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:self->_eventType forKey:@"eventType"];
  [v4 encodeObject:self->_keys forKey:@"keys"];
  [v4 encodeObject:self->_extensionIdentities forKey:@"extensionIdentities"];
}

- (CHSWidgetRelevanceServiceEvent)initWithCoder:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CHSWidgetRelevanceServiceEvent;
  char v5 = [(CHSWidgetRelevanceServiceEvent *)&v17 init];
  if (v5)
  {
    v5->_unint64_t eventType = [v4 decodeIntegerForKey:@"eventType"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    id v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"keys"];
    keys = v5->_keys;
    v5->_keys = (NSSet *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"extensionIdentities"];
    extensionIdentities = v5->_extensionIdentities;
    v5->_extensionIdentities = (NSSet *)v14;
  }
  return v5;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (NSSet)keys
{
  return self->_keys;
}

- (NSSet)extensionIdentities
{
  return self->_extensionIdentities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionIdentities, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

@end