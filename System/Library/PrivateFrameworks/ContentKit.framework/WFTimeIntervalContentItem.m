@interface WFTimeIntervalContentItem
+ (id)contentCategories;
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (int64_t)tableTemplateSubjectType;
- (WFTimeInterval)timeInterval;
- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5;
@end

@implementation WFTimeIntervalContentItem

+ (int64_t)tableTemplateSubjectType
{
  return 7;
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Time intervals");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Time intervals", @"Time intervals");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Time interval", @"Time interval");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)outputTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  v4 = +[WFObjectType typeWithClass:objc_opt_class()];
  v5 = +[WFObjectType typeWithClass:objc_opt_class()];
  v6 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, 0);

  return v6;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  if ((Class)objc_opt_class() == a3)
  {
    v8 = [(WFTimeIntervalContentItem *)self timeInterval];
    uint64_t v9 = [v8 absoluteTimeString];
  }
  else if ((Class)objc_opt_class() == a3)
  {
    v10 = NSNumber;
    v8 = [(WFTimeIntervalContentItem *)self timeInterval];
    [v8 timeInterval];
    uint64_t v9 = objc_msgSend(v10, "numberWithDouble:");
  }
  else
  {
    if ((Class)objc_opt_class() != a3)
    {
      v7 = 0;
      goto LABEL_9;
    }
    v11 = (void *)MEMORY[0x263EFF910];
    v8 = [(WFTimeIntervalContentItem *)self timeInterval];
    [v8 timeInterval];
    uint64_t v9 = objc_msgSend(v11, "dateWithTimeIntervalSinceNow:");
  }
  v12 = (void *)v9;
  v7 = +[WFObjectRepresentation object:v9];

LABEL_9:
  return v7;
}

- (WFTimeInterval)timeInterval
{
  uint64_t v3 = objc_opt_class();
  return (WFTimeInterval *)[(WFContentItem *)self objectForClass:v3];
}

@end