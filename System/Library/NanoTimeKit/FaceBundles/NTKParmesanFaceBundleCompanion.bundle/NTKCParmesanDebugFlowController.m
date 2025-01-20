@interface NTKCParmesanDebugFlowController
+ (id)debugViewControllerForFace:(id)a3;
- (NTKCParmesanDebugFlowController)init;
@end

@implementation NTKCParmesanDebugFlowController

+ (id)debugViewControllerForFace:(id)a3
{
  id v4 = objc_allocWithZone((Class)type metadata accessor for ParmesanDebugViewController());
  id v5 = a3;
  id v6 = sub_246BDAFDC();
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F829B8]), sel_initWithRootViewController_, v6);

  return v7;
}

- (NTKCParmesanDebugFlowController)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ParmesanDebugFlowController();
  return [(NTKCParmesanDebugFlowController *)&v3 init];
}

@end