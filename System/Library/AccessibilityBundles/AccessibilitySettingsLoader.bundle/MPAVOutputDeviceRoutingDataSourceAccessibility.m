@interface MPAVOutputDeviceRoutingDataSourceAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setPickedRoute:(id)a3 withPassword:(id)a4 completion:(id)a5;
@end

@implementation MPAVOutputDeviceRoutingDataSourceAccessibility

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (id)safeCategoryTargetClassName
{
  return @"MPAVOutputDeviceRoutingDataSource";
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)setPickedRoute:(id)a3 withPassword:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  v12 = (CFNotificationName *)getAXSpringBoardUserChangedAudioRouteNotificationSymbolLoc_ptr_0;
  uint64_t v18 = getAXSpringBoardUserChangedAudioRouteNotificationSymbolLoc_ptr_0;
  if (!getAXSpringBoardUserChangedAudioRouteNotificationSymbolLoc_ptr_0)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __getAXSpringBoardUserChangedAudioRouteNotificationSymbolLoc_block_invoke_0;
    v14[3] = &unk_26509DAA8;
    v14[4] = &v15;
    __getAXSpringBoardUserChangedAudioRouteNotificationSymbolLoc_block_invoke_0((uint64_t)v14);
    v12 = (CFNotificationName *)v16[3];
  }
  _Block_object_dispose(&v15, 8);
  if (!v12) {
    -[MPAVOutputDeviceRoutingDataSourceAccessibility setPickedRoute:withPassword:completion:]();
  }
  CFNotificationCenterPostNotification(DarwinNotifyCenter, *v12, 0, 0, 1u);
  v13.receiver = self;
  v13.super_class = (Class)MPAVOutputDeviceRoutingDataSourceAccessibility;
  [(MPAVOutputDeviceRoutingDataSourceAccessibility *)&v13 setPickedRoute:v8 withPassword:v9 completion:v10];
}

- (void)setPickedRoute:withPassword:completion:.cold.1()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getAXSpringBoardUserChangedAudioRouteNotification(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"MPAVRoutingControllerAccessibility.m", 13, @"%s", dlerror());

  __break(1u);
}

@end