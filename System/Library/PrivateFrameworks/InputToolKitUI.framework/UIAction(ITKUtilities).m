@interface UIAction(ITKUtilities)
+ (id)itk_itemWithTitle:()ITKUtilities subtitle:;
+ (uint64_t)itk_itemWithTitle:()ITKUtilities;
@end

@implementation UIAction(ITKUtilities)

+ (uint64_t)itk_itemWithTitle:()ITKUtilities
{
  return objc_msgSend(a1, "itk_itemWithTitle:subtitle:", a3, 0);
}

+ (id)itk_itemWithTitle:()ITKUtilities subtitle:
{
  v5 = &stru_2702F9148;
  if (a3) {
    v5 = a3;
  }
  v6 = v5;
  id v7 = a4;
  v8 = [MEMORY[0x263F823D0] actionWithTitle:v6 image:0 identifier:0 handler:&__block_literal_global_0];

  [v8 setDiscoverabilityTitle:v7];
  return v8;
}

@end