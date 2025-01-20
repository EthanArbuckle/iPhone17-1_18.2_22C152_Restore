@interface CHSWidgetRelevanceRelevantContextAttribute
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CHSWidgetRelevanceRelevantContextAttribute)initWithCoder:(id)a3;
- (CHSWidgetRelevanceRelevantContextAttribute)initWithRelevantContext:(id)a3;
- (LNRelevantContext)context;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSWidgetRelevanceRelevantContextAttribute

- (CHSWidgetRelevanceRelevantContextAttribute)initWithRelevantContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSWidgetRelevanceRelevantContextAttribute;
  v5 = [(CHSWidgetRelevanceAttribute *)&v9 _init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    context = v5->_context;
    v5->_context = (LNRelevantContext *)v6;
  }
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_context withName:@"context"];
  v5 = [v3 build];

  return v5;
}

- (unint64_t)hash
{
  return [(LNRelevantContext *)self->_context hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CHSWidgetRelevanceRelevantContextAttribute *)a3;
  if (v4 == self)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = BSEqualObjects();
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CHSWidgetRelevanceRelevantContextAttribute)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSWidgetRelevanceRelevantContextAttribute;
  char v5 = [(CHSWidgetRelevanceAttribute *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"context"];
    context = v5->_context;
    v5->_context = (LNRelevantContext *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (LNRelevantContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
}

@end