@interface NEFilterControlVerdict
+ (BOOL)supportsSecureCoding;
+ (NEFilterControlVerdict)allowVerdictWithUpdateRules:(BOOL)updateRules;
+ (NEFilterControlVerdict)dropVerdictWithUpdateRules:(BOOL)updateRules;
+ (NEFilterControlVerdict)updateRules;
- (NEFilterControlVerdict)init;
- (NEFilterControlVerdict)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NEFilterControlVerdict

- (NEFilterControlVerdict)init
{
  v3.receiver = self;
  v3.super_class = (Class)NEFilterControlVerdict;
  result = [(NEFilterControlVerdict *)&v3 init];
  if (result)
  {
    result->_updateRules = 0;
    result->_handledByDataProvider = 1;
  }
  return result;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)NEFilterControlVerdict;
  v7 = -[NEFilterNewFlowVerdict descriptionWithIndent:options:](&v11, sel_descriptionWithIndent_options_);
  v8 = v7;
  if (self)
  {
    [v7 appendPrettyBOOL:self->_updateRules withName:@"updateRules" andIndent:v5 options:a4];
    BOOL handledByDataProvider = self->_handledByDataProvider;
  }
  else
  {
    [v7 appendPrettyBOOL:0 withName:@"updateRules" andIndent:v5 options:a4];
    BOOL handledByDataProvider = 0;
  }
  [v8 appendPrettyBOOL:handledByDataProvider withName:@"handledByDataProvider" andIndent:v5 options:a4];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NEFilterControlVerdict;
  id result = [(NEFilterNewFlowVerdict *)&v7 copyWithZone:a3];
  if (self)
  {
    BOOL updateRules = self->_updateRules;
    if (!result) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  BOOL updateRules = 0;
  if (result) {
LABEL_3:
  }
    *((unsigned char *)result + 72) = updateRules;
LABEL_4:
  if (self)
  {
    BOOL handledByDataProvider = self->_handledByDataProvider;
    if (!result) {
      return result;
    }
  }
  else
  {
    BOOL handledByDataProvider = 0;
    if (!result) {
      return result;
    }
  }
  *((unsigned char *)result + 73) = handledByDataProvider;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NEFilterControlVerdict;
  id v4 = a3;
  [(NEFilterNewFlowVerdict *)&v6 encodeWithCoder:v4];
  if (self)
  {
    objc_msgSend(v4, "encodeBool:forKey:", self->_updateRules, @"UpdateRules", v6.receiver, v6.super_class);
    BOOL handledByDataProvider = self->_handledByDataProvider;
  }
  else
  {
    objc_msgSend(v4, "encodeBool:forKey:", 0, @"UpdateRules", v6.receiver, v6.super_class);
    BOOL handledByDataProvider = 0;
  }
  [v4 encodeBool:handledByDataProvider forKey:@"HandleByDataProvider"];
}

- (NEFilterControlVerdict)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NEFilterControlVerdict;
  uint64_t v5 = [(NEFilterNewFlowVerdict *)&v7 initWithCoder:v4];
  if (v5)
  {
    v5->_BOOL updateRules = [v4 decodeBoolForKey:@"UpdateRules"];
    v5->_BOOL handledByDataProvider = [v4 decodeBoolForKey:@"HandleByDataProvider"];
  }

  return v5;
}

+ (NEFilterControlVerdict)updateRules
{
  v2 = objc_alloc_init(NEFilterControlVerdict);
  if (v2) {
    v2->_BOOL updateRules = 1;
  }

  return v2;
}

+ (NEFilterControlVerdict)dropVerdictWithUpdateRules:(BOOL)updateRules
{
  id v4 = [(NEFilterVerdict *)[NEFilterControlVerdict alloc] initWithDrop:1 remediate:0];
  if (v4)
  {
    v4->_BOOL updateRules = updateRules;
    v4->_BOOL handledByDataProvider = 0;
  }

  return v4;
}

+ (NEFilterControlVerdict)allowVerdictWithUpdateRules:(BOOL)updateRules
{
  id v4 = [(NEFilterVerdict *)[NEFilterControlVerdict alloc] initWithDrop:0 remediate:0];
  [(NEFilterNewFlowVerdict *)v4 setFilterInbound:0];
  [(NEFilterNewFlowVerdict *)v4 setFilterOutbound:0];
  if (v4)
  {
    v4->_BOOL updateRules = updateRules;
    v4->_BOOL handledByDataProvider = 0;
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end