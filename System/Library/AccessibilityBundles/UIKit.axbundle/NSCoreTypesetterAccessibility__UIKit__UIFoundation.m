@interface NSCoreTypesetterAccessibility__UIKit__UIFoundation
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGRect)_stringDrawingCoreTextEngineWithOriginalString:(id)a3 rect:(CGRect)a4 padding:(double)a5 graphicsContext:(id)a6 forceClipping:(BOOL)a7 attributes:(id)a8 stringDrawingOptions:(int64_t)a9 drawingContext:(id)a10 stringDrawingInterface:(id *)a11;
@end

@implementation NSCoreTypesetterAccessibility__UIKit__UIFoundation

- (CGRect)_stringDrawingCoreTextEngineWithOriginalString:(id)a3 rect:(CGRect)a4 padding:(double)a5 graphicsContext:(id)a6 forceClipping:(BOOL)a7 attributes:(id)a8 stringDrawingOptions:(int64_t)a9 drawingContext:(id)a10 stringDrawingInterface:(id *)a11
{
  CGRect v41 = a4;
  v40 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  double v38 = a5;
  id v37 = 0;
  objc_storeStrong(&v37, a6);
  BOOL v36 = a7;
  id v35 = 0;
  objc_storeStrong(&v35, a8);
  int64_t v34 = a9;
  id v33 = 0;
  objc_storeStrong(&v33, a10);
  v32 = a11;
  long long v42 = 0u;
  long long v43 = 0u;
  v31.receiver = v40;
  v31.super_class = (Class)NSCoreTypesetterAccessibility__UIKit__UIFoundation;
  -[NSCoreTypesetterAccessibility__UIKit__UIFoundation _stringDrawingCoreTextEngineWithOriginalString:rect:padding:graphicsContext:forceClipping:attributes:stringDrawingOptions:drawingContext:stringDrawingInterface:](&v31, sel__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface_, location[0], v37, v36, v35, v34, v33, v41.origin.x, v41.origin.y, v41.size.width, v41.size.height, v38, a11);
  *(void *)&long long v42 = v11;
  *((void *)&v42 + 1) = v12;
  *(void *)&long long v43 = v13;
  *((void *)&v43 + 1) = v14;
  id v30 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong(&v30, location[0]);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = (id)[location[0] string];
      id v16 = v30;
      id v30 = v15;
    }
  }
  if ([v37 CGContext] && objc_msgSend(v30, "length"))
  {
    v23 = (void *)MEMORY[0x263F22290];
    id v22 = v30;
    uint64_t v17 = [v37 CGContext];
    objc_msgSend(v23, "addLabel:boundingRect:withContext:", v22, v17, v42, v43);
  }
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(location, 0);
  double v19 = *((double *)&v42 + 1);
  double v18 = *(double *)&v42;
  double v21 = *((double *)&v43 + 1);
  double v20 = *(double *)&v43;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

+ (id)safeCategoryTargetClassName
{
  return @"NSCoreTypesetter";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id v3 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"NSCoreTypesetter", @"_stringDrawingCoreTextEngineWithOriginalString:rect:padding:graphicsContext:forceClipping:attributes:stringDrawingOptions:drawingContext:stringDrawingInterface:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "d", "@", "B", "@", "q", "@", "^{?=CqBB}", 0);
  objc_storeStrong(v4, v3);
}

@end