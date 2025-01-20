@interface AEConcreteAccessibilityServerPrimitives
- (BOOL)isRestrictedForAAC;
- (id)observeGuidedAccessActiveStateChangeOnQueue:(id)a3 withHandler:(id)a4;
@end

@implementation AEConcreteAccessibilityServerPrimitives

- (BOOL)isRestrictedForAAC
{
  v2 = [MEMORY[0x263F22838] server];
  char v3 = [v2 isRestrictedForAAC];

  return v3;
}

- (id)observeGuidedAccessActiveStateChangeOnQueue:(id)a3 withHandler:(id)a4
{
  return +[AESystemNotificationObservation observationWithNotificationName:*MEMORY[0x263F22608] queue:a3 notificationHandler:a4];
}

@end