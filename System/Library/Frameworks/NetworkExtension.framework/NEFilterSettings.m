@interface NEFilterSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (NEFilterAction)defaultAction;
- (NEFilterSettings)initWithCoder:(id)a3;
- (NEFilterSettings)initWithRules:(NSArray *)rules defaultAction:(NEFilterAction)defaultAction;
- (NSArray)rules;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NEFilterSettings

- (void).cxx_destruct
{
}

- (NEFilterAction)defaultAction
{
  return self->_defaultAction;
}

- (NSArray)rules
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[NEFilterSettings allocWithZone:a3];
  rules = self->_rules;
  int64_t defaultAction = self->_defaultAction;

  return [(NEFilterSettings *)v4 initWithRules:rules defaultAction:defaultAction];
}

- (NEFilterSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NEFilterSettings;
  v5 = [(NEFilterSettings *)&v12 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"rules"];
    rules = v5->_rules;
    v5->_rules = (NSArray *)v9;

    v5->_int64_t defaultAction = [v4 decodeIntegerForKey:@"defaultAction"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  rules = self->_rules;
  id v5 = a3;
  [v5 encodeObject:rules forKey:@"rules"];
  [v5 encodeInteger:self->_defaultAction forKey:@"defaultAction"];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  v8 = [(NEFilterSettings *)self rules];
  [v7 appendPrettyObject:v8 withName:@"rules" andIndent:v5 options:a4];

  uint64_t v9 = +[NEFilterProvider descriptionForAction:]((uint64_t)NEFilterProvider, self->_defaultAction);
  [v7 appendPrettyObject:v9 withName:@"defaultAction" andIndent:v5 options:a4];

  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t defaultAction = self->_defaultAction;
  if ((unint64_t)(defaultAction - 1) > 1)
  {
    int v7 = 1;
  }
  else
  {
    NSUInteger v6 = [(NSArray *)self->_rules count];
    int v7 = v6 != 0;
    if (!v6)
    {
      v8 = NEResourcesCopyLocalizedNSString(@"FILTER_SETTINGS_ERROR_INVALID", @"FILTER_SETTINGS_ERROR_INVALID");
      [v4 addObject:v8];
    }
    int64_t defaultAction = self->_defaultAction;
  }
  if (defaultAction == 3 || defaultAction == 0)
  {
    v10 = NEResourcesCopyLocalizedNSString(@"FILTER_SETTINGS_ERROR_INVALID_ACTION", @"FILTER_SETTINGS_ERROR_INVALID_ACTION");
    [v4 addObject:v10];

    int v7 = 0;
  }
  if ([(NSArray *)self->_rules count] >= 0x3E9)
  {
    id v11 = [NSString alloc];
    objc_super v12 = NEResourcesCopyLocalizedNSString(@"FILTER_SETTINGS_ERROR_TOO_MANY_RULES", @"FILTER_SETTINGS_ERROR_TOO_MANY_RULES");
    v13 = objc_msgSend(v11, "initWithFormat:", v12, 1000);
    [v4 addObject:v13];

    int v7 = 0;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v14 = self->_rules;
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        v7 &= [*(id *)(*((void *)&v20 + 1) + 8 * i) checkValidityAndCollectErrors:v4];
      }
      uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v16);
  }

  return v7;
}

- (NEFilterSettings)initWithRules:(NSArray *)rules defaultAction:(NEFilterAction)defaultAction
{
  NSUInteger v6 = rules;
  v11.receiver = self;
  v11.super_class = (Class)NEFilterSettings;
  int v7 = [(NEFilterSettings *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [(NSArray *)v6 copy];
    uint64_t v9 = v7->_rules;
    v7->_rules = (NSArray *)v8;

    v7->_int64_t defaultAction = defaultAction;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end