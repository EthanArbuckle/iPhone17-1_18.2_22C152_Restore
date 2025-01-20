@interface UIMenu(ITKUtilities)
+ (id)itk_menuWithItems:()ITKUtilities title:subtitle:image:;
+ (uint64_t)itk_menuWithItems:()ITKUtilities title:;
+ (uint64_t)itk_menuWithItems:()ITKUtilities title:subtitle:;
- (id)itk_addItems:()ITKUtilities;
- (id)itk_addNonNilItems:()ITKUtilities;
- (void)itk_addNonNilItem:()ITKUtilities;
@end

@implementation UIMenu(ITKUtilities)

+ (uint64_t)itk_menuWithItems:()ITKUtilities title:
{
  return objc_msgSend(a1, "itk_menuWithItems:title:subtitle:image:", a3, a4, 0, 0);
}

+ (uint64_t)itk_menuWithItems:()ITKUtilities title:subtitle:
{
  return objc_msgSend(a1, "itk_menuWithItems:title:subtitle:image:", a3, a4, a5, 0);
}

+ (id)itk_menuWithItems:()ITKUtilities title:subtitle:image:
{
  id v9 = a5;
  v10 = &stru_2702F9148;
  if (a4) {
    v10 = a4;
  }
  v11 = v10;
  id v12 = a6;
  id v13 = a3;
  v14 = [MEMORY[0x263F82940] menuWithTitle:v11 image:v12 identifier:0 options:0 children:v13];

  if (objc_opt_respondsToSelector()) {
    [v14 setSubtitle:v9];
  }

  return v14;
}

- (id)itk_addNonNilItems:()ITKUtilities
{
  id v4 = a1;
  v5 = v4;
  if (a3)
  {
    uint64_t v6 = objc_msgSend(v4, "itk_addItems:", a3);

    v5 = (void *)v6;
  }
  return v5;
}

- (void)itk_addNonNilItem:()ITKUtilities
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v9 = a3;
    id v4 = (void *)MEMORY[0x263EFF8C0];
    id v5 = a3;
    uint64_t v6 = [v4 arrayWithObjects:&v9 count:1];

    id v7 = (id)objc_msgSend(a1, "itk_addItems:", v6, v9, v10);
  }
  return a1;
}

- (id)itk_addItems:()ITKUtilities
{
  id v4 = a1;
  id v5 = a3;
  uint64_t v6 = [v4 children];
  id v7 = (void *)v6;
  v8 = (void *)MEMORY[0x263EFFA68];
  if (v6) {
    v8 = (void *)v6;
  }
  id v9 = v8;

  uint64_t v10 = objc_msgSend(v9, "itk_arrayByAddingObjectsFromNonNilArray:", v5);

  v11 = [v4 menuByReplacingChildren:v10];

  return v11;
}

@end