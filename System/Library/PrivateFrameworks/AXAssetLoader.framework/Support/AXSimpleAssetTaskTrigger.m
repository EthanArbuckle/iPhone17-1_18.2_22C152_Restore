@interface AXSimpleAssetTaskTrigger
+ (id)withAnonymousInvokation:(id)a3;
+ (id)withFirstBootType;
+ (id)withFirstUnlockType;
+ (id)withLaunchActivityId:(id)a3;
+ (id)withNotificationName:(id)a3;
- (AXAssetsXPCActivity)launchActivity;
- (NSDictionary)arguments;
- (NSString)launchActivityId;
- (NSString)notificationName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)type;
- (void)setArguments:(id)a3;
- (void)setLaunchActivity:(id)a3;
- (void)setLaunchActivityId:(id)a3;
- (void)setNotificationName:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation AXSimpleAssetTaskTrigger

+ (id)withLaunchActivityId:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(AXSimpleAssetTaskTrigger);
  [(AXSimpleAssetTaskTrigger *)v4 setType:0];
  [(AXSimpleAssetTaskTrigger *)v4 setLaunchActivityId:v3];

  return v4;
}

+ (id)withNotificationName:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(AXSimpleAssetTaskTrigger);
  [(AXSimpleAssetTaskTrigger *)v4 setType:1];
  [(AXSimpleAssetTaskTrigger *)v4 setNotificationName:v3];

  return v4;
}

+ (id)withFirstBootType
{
  v2 = objc_alloc_init(AXSimpleAssetTaskTrigger);
  [(AXSimpleAssetTaskTrigger *)v2 setType:2];
  return v2;
}

+ (id)withFirstUnlockType
{
  v2 = objc_alloc_init(AXSimpleAssetTaskTrigger);
  [(AXSimpleAssetTaskTrigger *)v2 setType:3];
  return v2;
}

+ (id)withAnonymousInvokation:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(AXSimpleAssetTaskTrigger);
  [(AXSimpleAssetTaskTrigger *)v4 setType:4];
  [(AXSimpleAssetTaskTrigger *)v4 setArguments:v3];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(AXSimpleAssetTaskTrigger);
  [(AXSimpleAssetTaskTrigger *)v4 setType:[(AXSimpleAssetTaskTrigger *)self type]];
  v5 = [(AXSimpleAssetTaskTrigger *)self launchActivityId];
  [(AXSimpleAssetTaskTrigger *)v4 setLaunchActivityId:v5];

  v6 = [(AXSimpleAssetTaskTrigger *)self notificationName];
  [(AXSimpleAssetTaskTrigger *)v4 setNotificationName:v6];

  return v4;
}

- (id)description
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)launchActivityId
{
  return self->_launchActivityId;
}

- (void)setLaunchActivityId:(id)a3
{
}

- (AXAssetsXPCActivity)launchActivity
{
  return self->_launchActivity;
}

- (void)setLaunchActivity:(id)a3
{
}

- (NSString)notificationName
{
  return self->_notificationName;
}

- (void)setNotificationName:(id)a3
{
}

- (NSDictionary)arguments
{
  return self->_arguments;
}

- (void)setArguments:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_notificationName, 0);
  objc_storeStrong((id *)&self->_launchActivity, 0);
  objc_storeStrong((id *)&self->_launchActivityId, 0);
}

@end