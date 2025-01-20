@interface MTRContentControlClusterRemainingScreenTimeExpiredEvent
- (MTRContentControlClusterRemainingScreenTimeExpiredEvent)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation MTRContentControlClusterRemainingScreenTimeExpiredEvent

- (MTRContentControlClusterRemainingScreenTimeExpiredEvent)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTRContentControlClusterRemainingScreenTimeExpiredEvent;
  return [(MTRContentControlClusterRemainingScreenTimeExpiredEvent *)&v3 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(MTRContentControlClusterRemainingScreenTimeExpiredEvent);
}

- (id)description
{
  v2 = NSString;
  objc_super v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v6 = objc_msgSend_stringWithFormat_(v2, v5, @"<%@: >", v4);

  return v6;
}

@end