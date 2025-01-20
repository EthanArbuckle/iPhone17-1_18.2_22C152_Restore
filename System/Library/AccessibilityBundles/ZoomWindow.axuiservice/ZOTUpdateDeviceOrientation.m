@interface ZOTUpdateDeviceOrientation
@end

@implementation ZOTUpdateDeviceOrientation

void __ZOTUpdateDeviceOrientation_block_invoke(id a1)
{
  id v1 = +[AXSpringBoardServer server];
  [v1 activeApplicationOrientation];
}

@end