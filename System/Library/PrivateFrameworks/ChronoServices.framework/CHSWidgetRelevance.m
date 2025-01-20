@interface CHSWidgetRelevance
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CHSIntentReference)intentReference;
- (CHSWidgetRelevance)initWithAttribute:(id)a3 intentReference:(id)a4;
- (CHSWidgetRelevance)initWithCoder:(id)a3;
- (CHSWidgetRelevanceAttribute)attribute;
- (LNRelevantContext)relevantContext;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSWidgetRelevance

- (CHSWidgetRelevance)initWithAttribute:(id)a3 intentReference:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CHSWidgetRelevance;
  v9 = [(CHSWidgetRelevance *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_attribute, a3);
    objc_storeStrong((id *)&v10->_intentReference, a4);
  }

  return v10;
}

- (LNRelevantContext)relevantContext
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [(CHSWidgetRelevanceAttribute *)self->_attribute context];
  }
  else
  {
    v3 = 0;
  }
  return (LNRelevantContext *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  attribute = self->_attribute;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __30__CHSWidgetRelevance_isEqual___block_invoke;
  v18[3] = &unk_1E56C81C8;
  id v7 = v4;
  id v19 = v7;
  id v8 = (id)[v5 appendObject:attribute counterpart:v18];
  intentReference = self->_intentReference;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __30__CHSWidgetRelevance_isEqual___block_invoke_2;
  v16 = &unk_1E56C81C8;
  id v10 = v7;
  id v17 = v10;
  id v11 = (id)[v5 appendObject:intentReference counterpart:&v13];
  LOBYTE(v7) = objc_msgSend(v5, "isEqual", v13, v14, v15, v16);

  return (char)v7;
}

id __30__CHSWidgetRelevance_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

id __30__CHSWidgetRelevance_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

- (unint64_t)hash
{
  v3 = objc_opt_new();
  id v4 = (id)[v3 appendObject:self->_attribute];
  id v5 = (id)[v3 appendObject:self->_intentReference];
  unint64_t v6 = [v3 hash];

  return v6;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_attribute withName:@"attribute"];
  id v5 = (id)[v3 appendObject:self->_intentReference withName:@"intentReference" skipIfNil:1];
  unint64_t v6 = [v3 build];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_attribute forKey:@"attribute"];
  [v4 encodeObject:self->_intentReference forKey:@"intentReference"];
}

- (CHSWidgetRelevance)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CHSWidgetRelevance;
  id v5 = [(CHSWidgetRelevance *)&v11 init];
  if (v5)
  {
    if ([v4 containsValueForKey:@"relevantContext"])
    {
      unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"relevantContext"];
      id v7 = [[CHSWidgetRelevanceRelevantContextAttribute alloc] initWithRelevantContext:v6];
    }
    else
    {
      id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attribute"];
    }
    objc_storeStrong((id *)&v5->_attribute, v7);
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intentReference"];
    intentReference = v5->_intentReference;
    v5->_intentReference = (CHSIntentReference *)v8;
  }
  return v5;
}

- (CHSWidgetRelevanceAttribute)attribute
{
  return self->_attribute;
}

- (CHSIntentReference)intentReference
{
  return self->_intentReference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentReference, 0);
  objc_storeStrong((id *)&self->_attribute, 0);
}

@end