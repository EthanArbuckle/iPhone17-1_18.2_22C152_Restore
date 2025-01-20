@interface UIActionAccessibility__SpringBoardHome__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
- (void)accessibilityLabel;
@end

@implementation UIActionAccessibility__SpringBoardHome__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UIAction";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  LOBYTE(v25) = 0;
  v3 = __UIAccessibilitySafeClass();
  v4 = [v3 identifier];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  v5 = (void *)getkSBHIconChangeWidgetSizeToSmallApplicationShortcutItemTypeSymbolLoc_ptr;
  uint64_t v33 = getkSBHIconChangeWidgetSizeToSmallApplicationShortcutItemTypeSymbolLoc_ptr;
  if (!getkSBHIconChangeWidgetSizeToSmallApplicationShortcutItemTypeSymbolLoc_ptr)
  {
    uint64_t v25 = MEMORY[0x263EF8330];
    uint64_t v26 = 3221225472;
    v27 = __getkSBHIconChangeWidgetSizeToSmallApplicationShortcutItemTypeSymbolLoc_block_invoke;
    v28 = &unk_265157D98;
    v29 = &v30;
    v6 = (void *)SpringBoardHomeLibrary();
    v31[3] = (uint64_t)dlsym(v6, "kSBHIconChangeWidgetSizeToSmallApplicationShortcutItemType");
    getkSBHIconChangeWidgetSizeToSmallApplicationShortcutItemTypeSymbolLoc_ptr = *(void *)(v29[1] + 24);
    v5 = (void *)v31[3];
  }
  _Block_object_dispose(&v30, 8);
  if (!v5) {
    -[UIActionAccessibility__SpringBoardHome__UIKit accessibilityLabel]();
  }
  int v7 = [v4 isEqualToString:*v5];

  if (v7)
  {
    v8 = @"small.widget.size";
LABEL_21:
    uint64_t v21 = accessibilityLocalizedString(v8);
    goto LABEL_22;
  }
  v9 = [v3 identifier];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  v10 = (void *)getkSBHIconChangeWidgetSizeToMediumApplicationShortcutItemTypeSymbolLoc_ptr;
  uint64_t v33 = getkSBHIconChangeWidgetSizeToMediumApplicationShortcutItemTypeSymbolLoc_ptr;
  if (!getkSBHIconChangeWidgetSizeToMediumApplicationShortcutItemTypeSymbolLoc_ptr)
  {
    uint64_t v25 = MEMORY[0x263EF8330];
    uint64_t v26 = 3221225472;
    v27 = __getkSBHIconChangeWidgetSizeToMediumApplicationShortcutItemTypeSymbolLoc_block_invoke;
    v28 = &unk_265157D98;
    v29 = &v30;
    v11 = (void *)SpringBoardHomeLibrary();
    v31[3] = (uint64_t)dlsym(v11, "kSBHIconChangeWidgetSizeToMediumApplicationShortcutItemType");
    getkSBHIconChangeWidgetSizeToMediumApplicationShortcutItemTypeSymbolLoc_ptr = *(void *)(v29[1] + 24);
    v10 = (void *)v31[3];
  }
  _Block_object_dispose(&v30, 8);
  if (!v10) {
    -[UIActionAccessibility__SpringBoardHome__UIKit accessibilityLabel]();
  }
  int v12 = [v9 isEqualToString:*v10];

  if (v12)
  {
    v8 = @"medium.widget.size";
    goto LABEL_21;
  }
  v13 = [v3 identifier];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  v14 = (void *)getkSBHIconChangeWidgetSizeToLargeApplicationShortcutItemTypeSymbolLoc_ptr;
  uint64_t v33 = getkSBHIconChangeWidgetSizeToLargeApplicationShortcutItemTypeSymbolLoc_ptr;
  if (!getkSBHIconChangeWidgetSizeToLargeApplicationShortcutItemTypeSymbolLoc_ptr)
  {
    uint64_t v25 = MEMORY[0x263EF8330];
    uint64_t v26 = 3221225472;
    v27 = __getkSBHIconChangeWidgetSizeToLargeApplicationShortcutItemTypeSymbolLoc_block_invoke;
    v28 = &unk_265157D98;
    v29 = &v30;
    v15 = (void *)SpringBoardHomeLibrary();
    v31[3] = (uint64_t)dlsym(v15, "kSBHIconChangeWidgetSizeToLargeApplicationShortcutItemType");
    getkSBHIconChangeWidgetSizeToLargeApplicationShortcutItemTypeSymbolLoc_ptr = *(void *)(v29[1] + 24);
    v14 = (void *)v31[3];
  }
  _Block_object_dispose(&v30, 8);
  if (!v14) {
    -[UIActionAccessibility__SpringBoardHome__UIKit accessibilityLabel]();
  }
  int v16 = [v13 isEqualToString:*v14];

  if (v16)
  {
    v8 = @"large.widget.size";
    goto LABEL_21;
  }
  v17 = [v3 identifier];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  v18 = (void *)getkSBHIconChangeWidgetToAppIconApplicationShortcutItemTypeSymbolLoc_ptr;
  uint64_t v33 = getkSBHIconChangeWidgetToAppIconApplicationShortcutItemTypeSymbolLoc_ptr;
  if (!getkSBHIconChangeWidgetToAppIconApplicationShortcutItemTypeSymbolLoc_ptr)
  {
    uint64_t v25 = MEMORY[0x263EF8330];
    uint64_t v26 = 3221225472;
    v27 = __getkSBHIconChangeWidgetToAppIconApplicationShortcutItemTypeSymbolLoc_block_invoke;
    v28 = &unk_265157D98;
    v29 = &v30;
    v19 = (void *)SpringBoardHomeLibrary();
    v31[3] = (uint64_t)dlsym(v19, "kSBHIconChangeWidgetToAppIconApplicationShortcutItemType");
    getkSBHIconChangeWidgetToAppIconApplicationShortcutItemTypeSymbolLoc_ptr = *(void *)(v29[1] + 24);
    v18 = (void *)v31[3];
  }
  _Block_object_dispose(&v30, 8);
  if (!v18) {
    -[UIActionAccessibility__SpringBoardHome__UIKit accessibilityLabel].cold.4();
  }
  int v20 = [v17 isEqualToString:*v18];

  if (v20)
  {
    v8 = @"app.icon.size";
    goto LABEL_21;
  }
  v24.receiver = self;
  v24.super_class = (Class)UIActionAccessibility__SpringBoardHome__UIKit;
  uint64_t v21 = [(UIActionAccessibility__SpringBoardHome__UIKit *)&v24 accessibilityLabel];
LABEL_22:
  v22 = (void *)v21;

  return v22;
}

- (void)accessibilityLabel
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getkSBHIconChangeWidgetToAppIconApplicationShortcutItemType(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"UIActionAccessibility.m", 22, @"%s", dlerror());

  __break(1u);
}

@end