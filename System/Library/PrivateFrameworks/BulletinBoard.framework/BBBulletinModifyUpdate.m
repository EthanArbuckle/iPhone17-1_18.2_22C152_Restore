@interface BBBulletinModifyUpdate
+ (id)updateWithBulletin:(id)a3 feeds:(unint64_t)a4;
- (id)typeDescription;
@end

@implementation BBBulletinModifyUpdate

+ (id)updateWithBulletin:(id)a3 feeds:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithBulletin:v6 feeds:a4];

  return v7;
}

- (id)typeDescription
{
  return @"update";
}

@end