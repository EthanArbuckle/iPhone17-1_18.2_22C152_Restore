@interface DOCAXIdentifier
+ (Class)itemInfoView;
+ (Class)navBarButton;
+ (Class)sidebar;
+ (Class)viewStyleSelector;
+ (NSString)browsingModeTabBar;
+ (NSString)browsingRoot;
+ (NSString)fullNavBar;
+ (NSString)groupByMenuButton;
+ (NSString)inlineRenameField;
+ (NSString)itemCollectionView;
+ (NSString)itemInfoNavigationRoot;
+ (NSString)showFilenameExtensions;
+ (NSString)sizeSettingMenuButton;
+ (NSString)sortByMenuButton;
+ (NSString)tagEditorContainer;
+ (NSString)viewOptionsRoot;
+ (id)browsingRootIdentifierForSourceIdentifier:(id)a3;
+ (id)groupByMenuItemForGrouping:(id)a3;
+ (id)groupByPrefix;
+ (id)idBase;
+ (id)itemCollectionMenuButtonShowing:(id)a3;
+ (id)searchMenuButtonShowing:(id)a3;
+ (id)sizeSettingMenuItemForSize:(id)a3;
+ (id)sizeSettingPrefix;
+ (id)sortByHeaderButtonForSortIdentifier:(id)a3 ascending:(BOOL)a4 active:(BOOL)a5;
+ (id)sortByMenuButtonForSortIdentifier:(id)a3 ascending:(BOOL)a4 active:(BOOL)a5;
+ (id)sortByMenuItemForSortMode:(id)a3;
+ (id)sortByPrefix;
@end

@implementation DOCAXIdentifier

+ (id)sortByMenuButtonForSortIdentifier:(id)a3 ascending:(BOOL)a4 active:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v8 = [MEMORY[0x263EFF980] arrayWithObject:a3];
  v9 = v8;
  if (v5)
  {
    if (v6) {
      v10 = @"ascending";
    }
    else {
      v10 = @"descending";
    }
    [v8 addObject:v10];
  }
  v11 = [a1 idBase];
  v12 = composedID(v11, @"sortMenuButton");
  v13 = [v9 componentsJoinedByString:@"."];
  v14 = composedID(v12, v13);

  return v14;
}

+ (id)idBase
{
  return @"DOC";
}

+ (NSString)fullNavBar
{
  return (NSString *)@"FullDocumentManagerViewControllerNavigationBar";
}

+ (id)itemCollectionMenuButtonShowing:(id)a3
{
  id v4 = a3;
  BOOL v5 = [a1 idBase];
  BOOL v6 = composedID(v5, @"itemCollectionMenuButton");
  v7 = composedID(v6, v4);

  return v7;
}

+ (id)browsingRootIdentifierForSourceIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x263EFF980];
  BOOL v6 = [a1 browsingRoot];
  v7 = [v5 arrayWithObject:v6];

  if ([v4 length]) {
    [v7 addObject:v4];
  }
  v8 = [v7 componentsJoinedByString:@" "];

  return v8;
}

+ (NSString)browsingRoot
{
  v2 = [a1 idBase];
  v3 = composedID(v2, @"browsingRoot");

  return (NSString *)v3;
}

+ (NSString)browsingModeTabBar
{
  v2 = [a1 idBase];
  v3 = composedID(v2, @"browsingModeTabBar");

  return (NSString *)v3;
}

+ (Class)itemInfoView
{
  return (Class)objc_opt_class();
}

+ (Class)sidebar
{
  return (Class)objc_opt_class();
}

+ (Class)viewStyleSelector
{
  return (Class)objc_opt_class();
}

+ (Class)navBarButton
{
  return (Class)objc_opt_class();
}

+ (NSString)itemCollectionView
{
  return (NSString *)@"File View";
}

+ (id)searchMenuButtonShowing:(id)a3
{
  id v4 = a3;
  BOOL v5 = [a1 idBase];
  BOOL v6 = composedID(v5, @"searchMenuButton");

  if (v4)
  {
    uint64_t v7 = composedID(v6, v4);

    BOOL v6 = (void *)v7;
  }

  return v6;
}

+ (id)sortByHeaderButtonForSortIdentifier:(id)a3 ascending:(BOOL)a4 active:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v8 = [MEMORY[0x263EFF980] arrayWithObject:a3];
  v9 = v8;
  if (v5)
  {
    if (v6) {
      v10 = @"ascending";
    }
    else {
      v10 = @"descending";
    }
    [v8 addObject:v10];
  }
  v11 = [a1 idBase];
  v12 = composedID(v11, @"sortHeaderButton");
  v13 = [v9 componentsJoinedByString:@"."];
  v14 = composedID(v12, v13);

  return v14;
}

+ (NSString)sizeSettingMenuButton
{
  v2 = [a1 sizeSettingPrefix];
  v3 = composedID(@"DOCMenuPresentingButton", v2);

  return (NSString *)v3;
}

+ (id)sizeSettingMenuItemForSize:(id)a3
{
  id v4 = a3;
  BOOL v5 = [a1 idBase];
  BOOL v6 = composedID(v5, @"sizeSettingMenuItemButton");
  uint64_t v7 = composedID(v6, v4);

  return v7;
}

+ (NSString)groupByMenuButton
{
  v2 = [a1 groupByPrefix];
  v3 = composedID(@"DOCMenuPresentingButton", v2);

  return (NSString *)v3;
}

+ (id)groupByMenuItemForGrouping:(id)a3
{
  id v4 = a3;
  BOOL v5 = [a1 idBase];
  BOOL v6 = composedID(v5, @"groupMenuItemButton");
  uint64_t v7 = composedID(v6, v4);

  return v7;
}

+ (NSString)sortByMenuButton
{
  v2 = [a1 sortByPrefix];
  v3 = composedID(@"DOCMenuPresentingButton", v2);

  return (NSString *)v3;
}

+ (id)sortByMenuItemForSortMode:(id)a3
{
  id v4 = a3;
  BOOL v5 = [a1 idBase];
  BOOL v6 = composedID(v5, @"sortMenuItemButton");
  uint64_t v7 = composedID(v6, v4);

  return v7;
}

+ (NSString)inlineRenameField
{
  v2 = [a1 idBase];
  v3 = composedID(v2, @"inlineRenameField");

  return (NSString *)v3;
}

+ (NSString)itemInfoNavigationRoot
{
  v2 = [a1 idBase];
  v3 = composedID(v2, @"itemInfoNavigationRoot");

  return (NSString *)v3;
}

+ (NSString)tagEditorContainer
{
  v2 = [a1 idBase];
  v3 = composedID(v2, @"tagEditorContainer");

  return (NSString *)v3;
}

+ (NSString)viewOptionsRoot
{
  v2 = [a1 idBase];
  v3 = composedID(v2, @"viewOptionsRoot");

  return (NSString *)v3;
}

+ (NSString)showFilenameExtensions
{
  return (NSString *)@"Show All Filename Extensions";
}

+ (id)sortByPrefix
{
  return @"Sort By";
}

+ (id)groupByPrefix
{
  return @"Group By";
}

+ (id)sizeSettingPrefix
{
  return @"Icon and List Size";
}

@end