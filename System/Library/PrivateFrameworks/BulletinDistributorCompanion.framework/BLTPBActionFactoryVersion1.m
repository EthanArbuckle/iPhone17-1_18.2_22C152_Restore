@interface BLTPBActionFactoryVersion1
- (id)actionWithBBAction:(id)a3;
@end

@implementation BLTPBActionFactoryVersion1

- (id)actionWithBBAction:(id)a3
{
  id v4 = a3;
  if ([v4 behavior])
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BLTPBActionFactoryVersion1;
    v5 = [(BLTPBActionFactory *)&v7 actionWithBBAction:v4];
  }

  return v5;
}

@end