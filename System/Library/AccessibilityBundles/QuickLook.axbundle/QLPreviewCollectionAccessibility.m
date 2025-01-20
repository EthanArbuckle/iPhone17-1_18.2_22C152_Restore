@interface QLPreviewCollectionAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)previewItemViewController:(id)a3 wantsFullScreen:(BOOL)a4;
@end

@implementation QLPreviewCollectionAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"QLPreviewCollection";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"QLMovieItemViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLMovieItemViewController", @"isEditing", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLPreviewCollection", @"previewItemViewController:wantsFullScreen:", "v", "@", "B", 0);
}

- (void)previewItemViewController:(id)a3 wantsFullScreen:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!UIAccessibilityIsVoiceOverRunning()
    || (MEMORY[0x2455E48A0](@"QLMovieItemViewController"), (objc_opt_isKindOfClass() & 1) == 0)
    || [v6 safeBoolForKey:@"isEditing"])
  {
    v7.receiver = self;
    v7.super_class = (Class)QLPreviewCollectionAccessibility;
    [(QLPreviewCollectionAccessibility *)&v7 previewItemViewController:v6 wantsFullScreen:v4];
  }
}

@end