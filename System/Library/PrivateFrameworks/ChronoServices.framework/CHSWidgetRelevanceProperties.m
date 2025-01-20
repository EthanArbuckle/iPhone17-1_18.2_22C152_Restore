@interface CHSWidgetRelevanceProperties
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)matches:(id)a3;
- (BOOL)supportsBackgroundRefresh;
- (CHSExtensionIdentity)extensionIdentity;
- (CHSWidgetRelevanceKey)key;
- (CHSWidgetRelevanceProperties)initWithCoder:(id)a3;
- (CHSWidgetRelevanceProperties)initWithSupportsBackgroundRefresh:(BOOL)a3 lastRelevanceUpdate:(double)a4 relevances:(id)a5;
- (CHSWidgetRelevanceProperties)initWithWidgetExtensionIdentity:(id)a3 kind:(id)a4 supportsBackgroundRefresh:(BOOL)a5 lastRelevanceUpdate:(double)a6 relevanceFunction:(id)a7;
- (CHSWidgetRelevanceProperties)initWithWidgetExtensionIdentity:(id)a3 kind:(id)a4 supportsBackgroundRefresh:(BOOL)a5 lastRelevanceUpdate:(double)a6 relevances:(id)a7;
- (CHSWidgetRelevanceProperties)initWithWidgetRelevanceKey:(id)a3 supportsBackgroundRefresh:(BOOL)a4 lastRelevanceUpdate:(double)a5 relevances:(id)a6;
- (NSArray)relevances;
- (NSString)kind;
- (double)lastRelevanceUpdate;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSWidgetRelevanceProperties

- (CHSWidgetRelevanceProperties)initWithWidgetRelevanceKey:(id)a3 supportsBackgroundRefresh:(BOOL)a4 lastRelevanceUpdate:(double)a5 relevances:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  v12 = [v10 extensionIdentity];
  v13 = [v10 kind];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __116__CHSWidgetRelevanceProperties_initWithWidgetRelevanceKey_supportsBackgroundRefresh_lastRelevanceUpdate_relevances___block_invoke;
  v17[3] = &unk_1E56C8178;
  id v14 = v11;
  id v18 = v14;
  v15 = [(CHSWidgetRelevanceProperties *)self initWithWidgetExtensionIdentity:v12 kind:v13 supportsBackgroundRefresh:v8 lastRelevanceUpdate:v17 relevanceFunction:a5];

  return v15;
}

id __116__CHSWidgetRelevanceProperties_initWithWidgetRelevanceKey_supportsBackgroundRefresh_lastRelevanceUpdate_relevances___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (CHSWidgetRelevanceProperties)initWithWidgetExtensionIdentity:(id)a3 kind:(id)a4 supportsBackgroundRefresh:(BOOL)a5 lastRelevanceUpdate:(double)a6 relevances:(id)a7
{
  BOOL v8 = a5;
  id v12 = a7;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __126__CHSWidgetRelevanceProperties_initWithWidgetExtensionIdentity_kind_supportsBackgroundRefresh_lastRelevanceUpdate_relevances___block_invoke;
  v16[3] = &unk_1E56C8178;
  id v17 = v12;
  id v13 = v12;
  id v14 = [(CHSWidgetRelevanceProperties *)self initWithWidgetExtensionIdentity:a3 kind:a4 supportsBackgroundRefresh:v8 lastRelevanceUpdate:v16 relevanceFunction:a6];

  return v14;
}

id __126__CHSWidgetRelevanceProperties_initWithWidgetExtensionIdentity_kind_supportsBackgroundRefresh_lastRelevanceUpdate_relevances___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (CHSWidgetRelevanceProperties)initWithSupportsBackgroundRefresh:(BOOL)a3 lastRelevanceUpdate:(double)a4 relevances:(id)a5
{
  id v8 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CHSWidgetRelevanceProperties;
  v9 = [(CHSWidgetRelevanceProperties *)&v18 init];
  id v10 = v9;
  if (v9)
  {
    extensionIdentity = v9->_extensionIdentity;
    v9->_extensionIdentity = 0;

    kind = v10->_kind;
    v10->_kind = 0;

    v10->_supportsBackgroundRefresh = a3;
    v10->_lastRelevanceUpdate = a4;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __97__CHSWidgetRelevanceProperties_initWithSupportsBackgroundRefresh_lastRelevanceUpdate_relevances___block_invoke;
    aBlock[3] = &unk_1E56C8178;
    id v17 = v8;
    id v13 = _Block_copy(aBlock);
    id relevanceFunction = v10->_relevanceFunction;
    v10->_id relevanceFunction = v13;
  }
  return v10;
}

id __97__CHSWidgetRelevanceProperties_initWithSupportsBackgroundRefresh_lastRelevanceUpdate_relevances___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (CHSWidgetRelevanceProperties)initWithWidgetExtensionIdentity:(id)a3 kind:(id)a4 supportsBackgroundRefresh:(BOOL)a5 lastRelevanceUpdate:(double)a6 relevanceFunction:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CHSWidgetRelevanceProperties;
  v16 = [(CHSWidgetRelevanceProperties *)&v21 init];
  id v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_extensionIdentity, a3);
    objc_storeStrong((id *)&v17->_kind, a4);
    v17->_supportsBackgroundRefresh = a5;
    v17->_lastRelevanceUpdate = a6;
    objc_super v18 = _Block_copy(v15);
    id relevanceFunction = v17->_relevanceFunction;
    v17->_id relevanceFunction = v18;
  }
  return v17;
}

- (CHSWidgetRelevanceKey)key
{
  v2 = [[CHSWidgetRelevanceKey alloc] initWithExtensionIdentity:self->_extensionIdentity kind:self->_kind];
  return v2;
}

- (NSArray)relevances
{
  return (NSArray *)(*((uint64_t (**)(void))self->_relevanceFunction + 2))();
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_extensionIdentity];
  id v5 = (id)[v3 appendObject:self->_kind];
  id v6 = (id)[v3 appendBool:self->_supportsBackgroundRefresh];
  id v7 = (id)[v3 appendDouble:self->_lastRelevanceUpdate];
  id v8 = [(CHSWidgetRelevanceProperties *)self relevances];
  id v9 = (id)[v3 appendObject:v8];

  unint64_t v10 = [v3 hash];
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && BSEqualObjects()
    && BSEqualObjects()
    && BSEqualBools()
    && BSEqualDoubles())
  {
    id v5 = [(CHSWidgetRelevanceProperties *)self relevances];
    id v6 = [v4 relevances];
    char v7 = BSEqualObjects();
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)matches:(id)a3
{
  id v4 = a3;
  id v5 = [v4 extensionIdentity];
  if ([v5 isEqual:self->_extensionIdentity])
  {
    id v6 = [v4 kind];
    char v7 = [v6 isEqual:self->_kind];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_extensionIdentity forKey:@"extensionIdentity"];
  [v5 encodeObject:self->_kind forKey:@"kind"];
  [v5 encodeBool:self->_supportsBackgroundRefresh forKey:@"supportsBackgroundRefresh"];
  [v5 encodeDouble:@"lastRelevanceUpdate" forKey:self->_lastRelevanceUpdate];
  id v4 = [(CHSWidgetRelevanceProperties *)self relevances];
  [v5 encodeObject:v4 forKey:@"relevances"];
}

- (CHSWidgetRelevanceProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extensionIdentity"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kind"];
  uint64_t v7 = [v4 decodeBoolForKey:@"supportsBackgroundRefresh"];
  [v4 decodeDoubleForKey:@"lastRelevanceUpdate"];
  double v9 = v8;
  unint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  id v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  id v13 = [v4 decodeObjectOfClasses:v12 forKey:@"relevances"];
  id v14 = [(CHSWidgetRelevanceProperties *)self initWithWidgetExtensionIdentity:v5 kind:v6 supportsBackgroundRefresh:v7 lastRelevanceUpdate:v13 relevances:v9];

  return v14;
}

- (CHSExtensionIdentity)extensionIdentity
{
  return self->_extensionIdentity;
}

- (NSString)kind
{
  return self->_kind;
}

- (BOOL)supportsBackgroundRefresh
{
  return self->_supportsBackgroundRefresh;
}

- (double)lastRelevanceUpdate
{
  return self->_lastRelevanceUpdate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_extensionIdentity, 0);
  objc_storeStrong(&self->_relevanceFunction, 0);
}

@end