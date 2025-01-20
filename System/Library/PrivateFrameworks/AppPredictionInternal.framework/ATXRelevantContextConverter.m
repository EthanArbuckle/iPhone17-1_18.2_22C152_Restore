@interface ATXRelevantContextConverter
+ (id)contextFromRelevanceProvider:(id)a3;
+ (id)contextFromRelevantContext:(id)a3;
- (ATXRelevantContextConverter)init;
@end

@implementation ATXRelevantContextConverter

+ (id)contextFromRelevanceProvider:(id)a3
{
  id v3 = a3;
  v4 = sub_1D13B6E54(v3);

  return v4;
}

+ (id)contextFromRelevantContext:(id)a3
{
  id v3 = a3;
  v4 = sub_1D13B6E54(v3);

  return v4;
}

- (ATXRelevantContextConverter)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RelevantContextConverter();
  return [(ATXRelevantContextConverter *)&v3 init];
}

@end