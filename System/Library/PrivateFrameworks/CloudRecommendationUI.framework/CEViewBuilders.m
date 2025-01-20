@interface CEViewBuilders
+ (id)buildRecommendationFlowControllerWithAction:(id)a3;
@end

@implementation CEViewBuilders

+ (id)buildRecommendationFlowControllerWithAction:(id)a3
{
  id v3 = objc_alloc_init((Class)[a3 detailControllerClass]);
  if ([v3 conformsToProtocol:&unk_26FE1EA70]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

@end