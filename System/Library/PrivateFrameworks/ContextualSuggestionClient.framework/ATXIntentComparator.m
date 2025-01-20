@interface ATXIntentComparator
+ (BOOL)intent:(id)a3 isEqualToIntent:(id)a4;
- (ATXIntentComparator)init;
@end

@implementation ATXIntentComparator

+ (BOOL)intent:(id)a3 isEqualToIntent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = sub_24A798A8C(v5, v6);

  return v7 & 1;
}

- (ATXIntentComparator)init
{
  v3.receiver = self;
  v3.super_class = (Class)ATXIntentComparator;
  return [(ATXIntentComparator *)&v3 init];
}

@end