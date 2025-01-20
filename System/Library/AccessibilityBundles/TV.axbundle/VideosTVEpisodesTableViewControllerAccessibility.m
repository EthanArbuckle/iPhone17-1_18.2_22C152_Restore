@interface VideosTVEpisodesTableViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)configureCell:(id)a3 atIndexPath:(id)a4 withEntity:(id)a5 invalidationContext:(id)a6;
@end

@implementation VideosTVEpisodesTableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosTVEpisodesTableViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosTVEpisodesTableViewController", @"configureCell: atIndexPath: withEntity: invalidationContext:", "v", "@", "@", "@", "@", 0);
  [v3 validateClass:@"VideosFormatters"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"VideosFormatters", @"localizedEpisodeTitle:", "@", "Q", 0);
}

- (void)configureCell:(id)a3 atIndexPath:(id)a4 withEntity:(id)a5 invalidationContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)VideosTVEpisodesTableViewControllerAccessibility;
  [(VideosTVEpisodesTableViewControllerAccessibility *)&v26 configureCell:v10 atIndexPath:v11 withEntity:v12 invalidationContext:v13];
  v14 = [v12 objectForKeyedSubscript:*MEMORY[0x263F11288]];
  [v14 unsignedIntegerValue];

  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  id v25 = 0;
  AXPerformSafeBlock();
  id v15 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  v16 = [v10 textLabel];
  v17 = [v16 accessibilityLabel];
  [v12 playbackDuration];
  v19 = AXDurationStringForDuration();
  v18 = __UIAXStringForVariables();

  objc_msgSend(v10, "setAccessibilityLabel:", v18, v15, v19, @"__AXStringForVariablesSentinel");
}

uint64_t __109__VideosTVEpisodesTableViewControllerAccessibility_configureCell_atIndexPath_withEntity_invalidationContext___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [(id)MEMORY[0x245666030](@"VideosFormatters") localizedEpisodeTitle:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

@end