@interface CRSUIClusterPressAction
- (CRSUIClusterPressAction)initWithPressType:(unint64_t)a3;
- (unint64_t)actionType;
@end

@implementation CRSUIClusterPressAction

- (CRSUIClusterPressAction)initWithPressType:(unint64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263F29C78]);
  v6 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v6 forSetting:1];

  v9.receiver = self;
  v9.super_class = (Class)CRSUIClusterPressAction;
  v7 = [(CRSUIClusterPressAction *)&v9 initWithInfo:v5 responder:0];

  return v7;
}

- (unint64_t)actionType
{
  v2 = [(CRSUIClusterPressAction *)self info];
  v3 = [v2 objectForSetting:1];
  unint64_t v4 = [v3 integerValue];

  return v4;
}

@end