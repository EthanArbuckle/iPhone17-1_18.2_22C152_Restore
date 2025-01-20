@interface WFContentItemStringConversionBehavior
+ (id)accessingProperty:(id)a3;
+ (id)coercingToStringWithDescription:(id)a3;
- (NSString)behaviorDescription;
- (WFContentItemStringConversionBehavior)initWithProperty:(id)a3 description:(id)a4;
- (WFContentProperty)property;
@end

@implementation WFContentItemStringConversionBehavior

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behaviorDescription, 0);
  objc_storeStrong((id *)&self->_property, 0);
}

- (NSString)behaviorDescription
{
  return self->_behaviorDescription;
}

- (WFContentProperty)property
{
  return self->_property;
}

- (WFContentItemStringConversionBehavior)initWithProperty:(id)a3 description:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFContentItemStringConversionBehavior.m", 16, @"Invalid parameter not satisfying: %@", @"description" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)WFContentItemStringConversionBehavior;
  v10 = [(WFContentItemStringConversionBehavior *)&v17 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_property, a3);
    uint64_t v12 = [v9 copy];
    behaviorDescription = v11->_behaviorDescription;
    v11->_behaviorDescription = (NSString *)v12;

    v14 = v11;
  }

  return v11;
}

+ (id)coercingToStringWithDescription:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithProperty:0 description:v4];

  return v5;
}

+ (id)accessingProperty:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"WFContentItemStringConversionBehavior.m", 29, @"Invalid parameter not satisfying: %@", @"property" object file lineNumber description];
  }
  id v6 = objc_alloc((Class)a1);
  v7 = [v5 localizedName];
  id v8 = (void *)[v6 initWithProperty:v5 description:v7];

  return v8;
}

@end