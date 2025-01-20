@interface CLBDNDManager
+ (CLBDNDManager)sharedInstance;
- (unint64_t)resolveBehaviorForBulletin:(id)a3;
- (unint64_t)resolveBehaviorForClientEventDetails:(id)a3;
@end

@implementation CLBDNDManager

+ (CLBDNDManager)sharedInstance
{
  if (qword_100181108 != -1) {
    dispatch_once(&qword_100181108, &stru_10015CC20);
  }
  v2 = (void *)qword_100181100;

  return (CLBDNDManager *)v2;
}

- (unint64_t)resolveBehaviorForBulletin:(id)a3
{
  v4 = objc_msgSend(a3, "clarity_clientEventDetails");
  unint64_t v5 = [(CLBDNDManager *)self resolveBehaviorForClientEventDetails:v4];

  return v5;
}

- (unint64_t)resolveBehaviorForClientEventDetails:(id)a3
{
  id v3 = a3;
  v4 = +[DNDEventBehaviorResolutionService serviceForClientIdentifier:@"com.apple.private.ClarityBoard.dnd"];
  uint64_t v8 = 0;
  unint64_t v5 = [v4 resolveBehaviorForEventDetails:v3 error:&v8];

  unint64_t v6 = [v5 interruptionSuppression] != 0;
  return v6;
}

@end