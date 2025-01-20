@interface UIButtonAccessibility
@end

@implementation UIButtonAccessibility

void __65__UIButtonAccessibility__AnnotationKit__UIKit_accessibilityLabel__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  v6 = [v8 customView];
  int v7 = [v6 isEqual:*(void *)(a1 + 32)];

  if (v7)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v8 tag];
    *a4 = 1;
  }
}

@end