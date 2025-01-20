@interface VKCImageSubjectHighlightViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)_axDraggableView;
- (id)accessibilityDragSourceDescriptors;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation VKCImageSubjectHighlightViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VKCImageSubjectHighlightView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityLabel
{
  v2 = [(VKCImageSubjectHighlightViewAccessibility *)self _axDraggableView];

  if (v2)
  {
    v3 = accessibilityLocalizedString(@"detected.subject.element");
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)VKCImageSubjectHighlightViewAccessibility;
  return *MEMORY[0x263F1CF00] | [(VKCImageSubjectHighlightViewAccessibility *)&v3 accessibilityTraits];
}

- (id)_axDraggableView
{
  return (id)[(VKCImageSubjectHighlightViewAccessibility *)self _accessibilityFindViewAncestor:&__block_literal_global_0 startWithSelf:1];
}

uint64_t __61__VKCImageSubjectHighlightViewAccessibility__axDraggableView__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _accessibilityCanDrag];
}

- (id)accessibilityDragSourceDescriptors
{
  v10[1] = *MEMORY[0x263EF8340];
  objc_super v3 = [(VKCImageSubjectHighlightViewAccessibility *)self _axDraggableView];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C3B8]);
    v5 = accessibilityLocalizedString(@"lift.subject.from.background");
    [(VKCImageSubjectHighlightViewAccessibility *)self accessibilityActivationPoint];
    UIAccessibilityPointToPoint();
    v6 = objc_msgSend(v4, "initWithName:point:inView:", v5, v3);
    v10[0] = v6;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)VKCImageSubjectHighlightViewAccessibility;
    v7 = [(VKCImageSubjectHighlightViewAccessibility *)&v9 accessibilityDragSourceDescriptors];
  }

  return v7;
}

@end