@interface HUHomeHubsAndBridgesHelper
+ (id)presentBridgeDetailViewForAccessory:(id)a3 withHome:(id)a4;
+ (id)serviceDetailVCWithItem:(id)a3;
@end

@implementation HUHomeHubsAndBridgesHelper

+ (id)presentBridgeDetailViewForAccessory:(id)a3 withHome:(id)a4
{
  return +[HomeHubsAndBridgesHelper presentBridgeDetailViewForAccessory:a3 withHome:a4];
}

+ (id)serviceDetailVCWithItem:(id)a3
{
  id v3 = a3;
  v4 = +[HUViewControllerRegistry sharedInstance];
  v5 = objc_msgSend(objc_alloc((Class)objc_msgSend(v4, "viewControllerClassForIdentifier:", @"serviceLikeItemDetails")), "initWithServiceLikeItem:", v3);

  return v5;
}

@end