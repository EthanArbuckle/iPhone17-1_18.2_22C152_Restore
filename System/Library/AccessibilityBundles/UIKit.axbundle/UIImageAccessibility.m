@interface UIImageAccessibility
+ (BOOL)_isSerializableAccessibilityElement;
+ (Class)safeCategoryBaseClass;
+ (id)imageAtPath:(id)a3;
+ (id)imageNamed:(id)a3 inBundle:(id)a4 compatibleWithTraitCollection:(id)a5;
+ (id)imageWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5;
+ (id)imageWithContentsOfFile:(id)a3;
+ (id)kitImageNamed:(id)a3;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGImage)CGImage;
- (UIImageAccessibility)initWithCoder:(id)a3;
- (UIImageAccessibility)initWithContentsOfFile:(id)a3;
- (UIImageAccessibility)initWithContentsOfFile:(id)a3 cache:(BOOL)a4;
- (id)_accessibilityPhotoDescription;
- (id)_bezeledImageWithShadowRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 fillRed:(double)a7 green:(double)a8 blue:(double)a9 alpha:(double)a10 drawShadow:(BOOL)a11;
- (id)_doubleBezeledImageWithExteriorShadowRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 interiorShadowRed:(double)a7 green:(double)a8 blue:(double)a9 alpha:(double)a10 fillRed:(double)a11 green:(double)a12 blue:(double)a13 alpha:(double)a14;
- (id)_flatImageWithColor:(id)a3;
- (id)_flatImageWithWhite:(double)a3 alpha:(double)a4;
- (id)_imageScaledToProportion:(double)a3 interpolationQuality:(int)a4;
- (id)_imageTintedWithColor:(id)a3 renderingMode:(int64_t)a4 withUpdatedCGImage:(BOOL)a5;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)imageFlippedForRightToLeftLayoutDirection;
- (id)imageWithAlignmentRectInsets:(UIEdgeInsets)a3;
- (id)imageWithRenderingMode:(int64_t)a3;
- (id)resizableImageWithCapInsets:(UIEdgeInsets)a3 resizingMode:(int64_t)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UIImageAccessibility

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  [(UIImageAccessibility *)self _accessibilityUnregister];
  v2.receiver = v4;
  v2.super_class = (Class)UIImageAccessibility;
  [(UIImageAccessibility *)&v2 dealloc];
}

- (CGImage)CGImage
{
  v7 = self;
  SEL v6 = a2;
  v5 = 0;
  v4.receiver = self;
  v4.super_class = (Class)UIImageAccessibility;
  v5 = [(UIImageAccessibility *)&v4 CGImage];
  if (UIAccessibilityIsVoiceOverRunning())
  {
    id location = [(UIImageAccessibility *)v7 accessibilityLabel];
    if (location) {
      [(CGImage *)v5 setAccessibilityLabel:location];
    }
    objc_storeStrong(&location, 0);
  }
  return v5;
}

+ (id)imageNamed:(id)a3 inBundle:(id)a4 compatibleWithTraitCollection:(id)a5
{
  id v16 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  id v13 = 0;
  objc_storeStrong(&v13, a5);
  v11.receiver = v16;
  v11.super_class = (Class)&OBJC_METACLASS___UIImageAccessibility;
  id v12 = objc_msgSendSuper2(&v11, sel_imageNamed_inBundle_compatibleWithTraitCollection_, location[0], v14, v13);
  id v9 = v12;
  id v10 = location[0];
  AXPerformBlockOnMainThread();
  id v8 = v12;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);

  return v8;
}

- (id)accessibilityLabel
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v26 = self;
  v25[1] = (id)a2;
  v25[0] = (id)[(UIImageAccessibility *)self accessibilityUserDefinedLabel];
  if ([v25[0] length])
  {
    id v27 = v25[0];
    int v24 = 1;
  }
  else
  {
    id v23 = (id)[(UIImageAccessibility *)v26 _accessibilityContextDrawingAnnotations];
    if ([v23 count])
    {
      id v22 = (id)[MEMORY[0x263EFF980] array];
      memset(__b, 0, sizeof(__b));
      id obj = v23;
      uint64_t v14 = [obj countByEnumeratingWithState:__b objects:v28 count:16];
      if (v14)
      {
        uint64_t v10 = *(void *)__b[2];
        uint64_t v11 = 0;
        unint64_t v12 = v14;
        while (1)
        {
          uint64_t v9 = v11;
          if (*(void *)__b[2] != v10) {
            objc_enumerationMutation(obj);
          }
          id v21 = *(id *)(__b[1] + 8 * v11);
          id v7 = v22;
          id v8 = (id)[v21 label];
          objc_msgSend(v7, "addObject:");

          ++v11;
          if (v9 + 1 >= v12)
          {
            uint64_t v11 = 0;
            unint64_t v12 = [obj countByEnumeratingWithState:__b objects:v28 count:16];
            if (!v12) {
              break;
            }
          }
        }
      }

      id v27 = (id)MEMORY[0x2455E6560](v22);
      int v24 = 1;
      objc_storeStrong(&v22, 0);
    }
    else
    {
      id v6 = (id)[(UIImageAccessibility *)v26 safeValueForKey:@"_imageAsset"];
      id v19 = (id)[v6 safeStringForKey:@"assetName"];

      if (!(MEMORY[0x2455E6B80](v26) & 1)) {
        goto LABEL_32;
      }
      id v17 = (id)accessibilityUIKitSymbolNamesLocalizedString();
      if (![v17 length] || (objc_msgSend(v17, "isEqualToString:", v19) & 1) != 0)
      {
        id v2 = (id)accessibilityUIKitLocalizedString();
        id v3 = v17;
        id v17 = v2;
      }
      if ([v17 length])
      {
        id v16 = (id)[MEMORY[0x263F21660] axAttributedStringWithString:v17];
        if ([v17 isEqualToString:v19]) {
          [v16 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F21790]];
        }
        [v16 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F21798]];
        id v27 = v16;
        int v24 = 1;
        objc_storeStrong(&v16, 0);
      }
      else
      {
        int v24 = 0;
      }
      objc_storeStrong(&v17, 0);
      if (!v24)
      {
LABEL_32:
        if (([v19 isEqualToString:@"magnifyingglass"] & 1) != 0
          || ([v19 isEqualToString:@"SearchIcon"] & 1) != 0
          || ([v19 containsString:@"ellipsis.circle"] & 1) != 0
          || ([v19 isEqualToString:@"plus.circle.fill"] & 1) != 0
          || ([v19 isEqualToString:@"square.and.arrow.up"] & 1) != 0
          || ([v19 isEqualToString:@"trash"] & 1) != 0
          || ([v19 isEqualToString:@"xmark"] & 1) != 0
          || ([v19 isEqualToString:@"UIButtonBarKeyboardCutGroup"] & 1) != 0
          || ([v19 isEqualToString:@"UIButtonBarKeyboardUndoGroup"] & 1) != 0)
        {
          id v27 = (id)accessibilityUIKitLocalizedString();
          int v24 = 1;
        }
        else
        {
          if ([v19 isEqualToString:@"mic_badge_xmark"])
          {
            id v27 = (id)accessibilityUIKitLocalizedString();
          }
          else
          {
            v15.receiver = v26;
            v15.super_class = (Class)UIImageAccessibility;
            id v27 = [(UIImageAccessibility *)&v15 accessibilityLabel];
          }
          int v24 = 1;
        }
      }
      objc_storeStrong(&v19, 0);
    }
    objc_storeStrong(&v23, 0);
  }
  objc_storeStrong(v25, 0);
  objc_super v4 = v27;

  return v4;
}

void __47__UIImageAccessibility_imageWithRenderingMode___block_invoke(id *a1)
{
  id location[2] = a1;
  location[1] = a1;
  id v1 = a1[4];
  id v2 = (id)[a1[5] accessibilityIdentification];
  objc_msgSend(v1, "accessibilitySetIdentification:");

  id v3 = a1[4];
  id v4 = (id)[a1[5] accessibilityIdentifier];
  objc_msgSend(v3, "setAccessibilityIdentifier:");

  location[0] = (id)[a1[5] accessibilityUserDefinedLabel];
  if (location[0]) {
    [a1[4] setAccessibilityLabel:location[0]];
  }
  objc_storeStrong(location, 0);
}

uint64_t __74__UIImageAccessibility_imageNamed_inBundle_compatibleWithTraitCollection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessibilitySetIdentification:", *(void *)(a1 + 40), a1, a1);
}

void __44__UIImageAccessibility__flatImageWithColor___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = (id)[*(id *)(a1 + 40) accessibilityIdentification];
  objc_msgSend(v1, "accessibilitySetIdentification:");

  id v4 = *(void **)(a1 + 32);
  id v5 = (id)[*(id *)(a1 + 40) accessibilityIdentifier];
  objc_msgSend(v4, "setAccessibilityIdentifier:");
}

void __79__UIImageAccessibility__imageTintedWithColor_renderingMode_withUpdatedCGImage___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = (id)[*(id *)(a1 + 40) accessibilityIdentification];
  objc_msgSend(v1, "accessibilitySetIdentification:");

  id v4 = *(void **)(a1 + 32);
  id v5 = (id)[*(id *)(a1 + 40) accessibilityIdentifier];
  objc_msgSend(v4, "setAccessibilityIdentifier:");
}

- (id)accessibilityIdentifier
{
  id v6 = self;
  v5[1] = (id)a2;
  v5[0] = (id)[(UIImageAccessibility *)self accessibilityUserDefinedIdentifier];
  if (!v5[0])
  {
    v5[0] = (id)[(UIImageAccessibility *)v6 accessibilityIdentification];
  }
  if (!v5[0])
  {
    id v4 = (id)[(UIImageAccessibility *)v6 safeValueForKey:@"_imageAsset"];
    v5[0] = (id)[v4 safeStringForKey:@"assetName"];
  }
  id v3 = v5[0];
  objc_storeStrong(v5, 0);

  return v3;
}

+ (id)imageWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5
{
  v10[5] = a1;
  v10[4] = (id)a2;
  v10[3] = a3;
  v10[2] = *(id *)&a4;
  v10[1] = (id)a5;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___UIImageAccessibility;
  v10[0] = objc_msgSendSuper2(&v9, sel_imageWithCGImage_scale_orientation_, a3, a5, a4);
  CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
  id v7 = (id)[MEMORY[0x263F22290] annotationsForContext:CurrentContext];
  [v10[0] _accessibilitySetContextDrawingAnnotations:v7];
  id v6 = v10[0];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(v10, 0);

  return v6;
}

- (id)_flatImageWithColor:(id)a3
{
  uint64_t v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7.receiver = v10;
  v7.super_class = (Class)UIImageAccessibility;
  id v8 = [(UIImageAccessibility *)&v7 _flatImageWithColor:location[0]];
  id v5 = v8;
  id v6 = v10;
  AXPerformBlockOnMainThread();
  id v4 = v8;
  objc_storeStrong((id *)&v6, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);

  return v4;
}

- (id)_imageTintedWithColor:(id)a3 renderingMode:(int64_t)a4 withUpdatedCGImage:(BOOL)a5
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v14 = a4;
  BOOL v13 = a5;
  v11.receiver = v16;
  v11.super_class = (Class)UIImageAccessibility;
  id v12 = [(UIImageAccessibility *)&v11 _imageTintedWithColor:location[0] renderingMode:a4 withUpdatedCGImage:a5];
  id v9 = v12;
  uint64_t v10 = v16;
  AXPerformBlockOnMainThread();
  id v8 = v12;
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);

  return v8;
}

void __53__UIImageAccessibility_imageWithAlignmentRectInsets___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = (id)[*(id *)(a1 + 40) accessibilityIdentification];
  objc_msgSend(v1, "accessibilitySetIdentification:");

  id v4 = *(void **)(a1 + 32);
  id v5 = (id)[*(id *)(a1 + 40) accessibilityIdentifier];
  objc_msgSend(v4, "setAccessibilityIdentifier:");
}

- (id)imageWithRenderingMode:(int64_t)a3
{
  id v9 = self;
  v8[2] = (id)a2;
  v8[1] = (id)a3;
  v7.receiver = self;
  v7.super_class = (Class)UIImageAccessibility;
  v8[0] = [(UIImageAccessibility *)&v7 imageWithRenderingMode:a3];
  id v5 = v8[0];
  id v6 = v9;
  AXPerformBlockOnMainThread();
  id v4 = v8[0];
  objc_storeStrong((id *)&v6, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(v8, 0);

  return v4;
}

- (id)imageWithAlignmentRectInsets:(UIEdgeInsets)a3
{
  UIEdgeInsets v10 = a3;
  id v9 = self;
  v8[1] = (id)a2;
  v7.receiver = self;
  v7.super_class = (Class)UIImageAccessibility;
  v8[0] = -[UIImageAccessibility imageWithAlignmentRectInsets:](&v7, sel_imageWithAlignmentRectInsets_, a3.top, a3.left, a3.bottom, a3.right);
  id v5 = v8[0];
  id v6 = v9;
  AXPerformBlockOnMainThread();
  id v4 = v8[0];
  objc_storeStrong((id *)&v6, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(v8, 0);

  return v4;
}

+ (id)safeCategoryTargetClassName
{
  return @"UIImage";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  id v9 = location;
  id v8 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = "{UIEdgeInsets=dddd}";
  id v5 = "q";
  id v6 = @"UIImage";
  objc_super v7 = "@";
  [location[0] validateClass:"{UIEdgeInsets=dddd}" hasInstanceMethod:"q" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"_flatImageWithColor:", v7, 0);
  id v4 = "^{CGImage=}";
  [location[0] validateClass:v6 hasInstanceMethod:@"CGImage" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"imageWithAlignmentRectInsets:", v7, v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"imageWithRenderingMode:", v7, v5, 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v6, @"imageWithCGImage:scale:orientation:", v7, v4, "d", v5, 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v6, @"imageNamed:inBundle:compatibleWithTraitCollection:", v7, v7, v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"imageFlippedForRightToLeftLayoutDirection", v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"_imageTintedWithColor:renderingMode:withUpdatedCGImage:", v7, v5, "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"encodeWithCoder:", "v", v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"initWithCoder:", v7, 0);
  [location[0] validateClass:v6 hasInstanceVariable:@"_imageAsset" withType:"UIImageAsset"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIImageAsset", @"assetName", v7, 0);
  objc_storeStrong(v9, v8);
}

- (void)encodeWithCoder:(id)a3
{
  UIEdgeInsets v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8.receiver = v10;
  v8.super_class = (Class)UIImageAccessibility;
  [(UIImageAccessibility *)&v8 encodeWithCoder:location[0]];
  id v7 = (id)[(UIImageAccessibility *)v10 _accessibilityEncodedHierarchyData];
  if (v7) {
    [location[0] encodeObject:v7 forKey:@"_accessibilityEncodedHierarchyData"];
  }
  id v3 = location[0];
  id v4 = (id)[(UIImageAccessibility *)v10 accessibilityHint];
  objc_msgSend(v3, "encodeObject:forKey:");

  id v5 = location[0];
  id v6 = (id)[(UIImageAccessibility *)v10 accessibilityValue];
  objc_msgSend(v5, "encodeObject:forKey:");

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (UIImageAccessibility)initWithCoder:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v12;
  id v12 = 0;
  v9.receiver = v3;
  v9.super_class = (Class)UIImageAccessibility;
  id v12 = [(UIImageAccessibility *)&v9 initWithCoder:location[0]];
  UIEdgeInsets v10 = v12;
  id v8 = (id)[location[0] decodeObjectOfClass:objc_opt_class() forKey:@"_accessibilityEncodedHierarchyData"];
  if (v8) {
    [(UIImageAccessibility *)v10 _setAccessibilityEncodedHierarchyData:v8];
  }
  id v5 = (id)[location[0] decodeObjectOfClass:objc_opt_class() forKey:@"accessibilityHint"];
  -[UIImageAccessibility setAccessibilityHint:](v12, "setAccessibilityHint:");

  id v6 = (id)[location[0] decodeObjectOfClass:objc_opt_class() forKey:@"accessibilityValue"];
  -[UIImageAccessibility setAccessibilityValue:](v12, "setAccessibilityValue:");

  id v7 = v10;
  objc_storeStrong(&v8, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v12, 0);
  return v7;
}

- (id)_accessibilityPhotoDescription
{
  v18[2] = self;
  v18[1] = (id)a2;
  v18[0] = (id)[(UIImageAccessibility *)self accessibilityIdentification];
  if (v18[0])
  {
    id v16 = (id)[objc_alloc(NSURL) initFileURLWithPath:v18[0]];
    id v15 = 0;
    if (v16)
    {
      id v14 = (id)UIAccessibilityPhotoCreationDate();
      id v13 = (id)UIAccessibilityEmojiDescription();
      if ([v13 length])
      {
        id v12 = (id)accessibilityUIKitLocalizedString();
        id v2 = (id)__UIAXStringForVariables();
        id v3 = v15;
        id v15 = v2;

        objc_storeStrong(&v12, 0);
      }
      else
      {
        id v11 = (id)UIAccessibilityMetadataDescriptionForImage();
        id v10 = 0;
        if (UIAccessibilityIsImageScreenshot())
        {
          id v4 = (id)accessibilityUIKitLocalizedString();
          id v5 = v10;
          id v10 = v4;
        }
        id v6 = (id)__UIAXStringForVariables();
        id v7 = v15;
        id v15 = v6;

        objc_storeStrong(&v10, 0);
        objc_storeStrong(&v11, 0);
      }
      objc_storeStrong(&v13, 0);
      objc_storeStrong(&v14, 0);
    }
    id v19 = v15;
    int v17 = 1;
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v16, 0);
  }
  else
  {
    id v19 = 0;
    int v17 = 1;
  }
  objc_storeStrong(v18, 0);
  id v8 = v19;

  return v8;
}

- (id)resizableImageWithCapInsets:(UIEdgeInsets)a3 resizingMode:(int64_t)a4
{
  UIEdgeInsets v11 = a3;
  id v10 = self;
  v9[2] = (id)a2;
  v9[1] = (id)a4;
  v8.receiver = self;
  v8.super_class = (Class)UIImageAccessibility;
  v9[0] = -[UIImageAccessibility resizableImageWithCapInsets:resizingMode:](&v8, sel_resizableImageWithCapInsets_resizingMode_, a4, a3.top, a3.left, a3.bottom, a3.right);
  id v6 = v9[0];
  id v7 = v10;
  AXPerformBlockOnMainThread();
  id v5 = v9[0];
  objc_storeStrong((id *)&v7, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(v9, 0);

  return v5;
}

void __65__UIImageAccessibility_resizableImageWithCapInsets_resizingMode___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = (id)[*(id *)(a1 + 40) accessibilityIdentification];
  objc_msgSend(v1, "accessibilitySetIdentification:");

  id v4 = *(void **)(a1 + 32);
  id v5 = (id)[*(id *)(a1 + 40) accessibilityIdentifier];
  objc_msgSend(v4, "setAccessibilityIdentifier:");
}

- (UIImageAccessibility)initWithContentsOfFile:(id)a3 cache:(BOOL)a4
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v11 = a4;
  id v4 = v13;
  id v13 = 0;
  v10.receiver = v4;
  v10.super_class = (Class)UIImageAccessibility;
  id v13 = [(UIImageAccessibility *)&v10 initWithContentsOfFile:location[0] cache:a4];
  objc_storeStrong((id *)&v13, v13);
  objc_super v8 = v13;
  id v9 = location[0];
  AXPerformBlockOnMainThread();
  id v7 = v13;
  objc_storeStrong(&v9, 0);
  objc_storeStrong((id *)&v8, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v13, 0);
  return v7;
}

uint64_t __53__UIImageAccessibility_initWithContentsOfFile_cache___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessibilitySetIdentification:", *(void *)(a1 + 40), a1, a1);
}

+ (id)imageAtPath:(id)a3
{
  id v10 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7.receiver = v10;
  v7.super_class = (Class)&OBJC_METACLASS___UIImageAccessibility;
  id v8 = objc_msgSendSuper2(&v7, sel_imageAtPath_, location[0]);
  id v5 = v8;
  id v6 = location[0];
  AXPerformBlockOnMainThread();
  id v4 = v8;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);

  return v4;
}

void __36__UIImageAccessibility_imageAtPath___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = (id)[*(id *)(a1 + 40) lastPathComponent];
  objc_msgSend(v1, "accessibilitySetIdentification:");
}

- (UIImageAccessibility)initWithContentsOfFile:(id)a3
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v15;
  id v15 = 0;
  v13.receiver = v3;
  v13.super_class = (Class)UIImageAccessibility;
  id v15 = [(UIImageAccessibility *)&v13 initWithContentsOfFile:location[0]];
  objc_storeStrong((id *)&v15, v15);
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = __47__UIImageAccessibility_initWithContentsOfFile___block_invoke;
  id v10 = &unk_2650ADFB0;
  BOOL v11 = v15;
  id v12 = location[0];
  AXPerformBlockOnMainThread();
  id v5 = v15;
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v15, 0);
  return v5;
}

uint64_t __47__UIImageAccessibility_initWithContentsOfFile___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessibilitySetIdentification:", *(void *)(a1 + 40), a1, a1);
}

+ (id)imageWithContentsOfFile:(id)a3
{
  id v10 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7.receiver = v10;
  v7.super_class = (Class)&OBJC_METACLASS___UIImageAccessibility;
  id v8 = objc_msgSendSuper2(&v7, sel_imageWithContentsOfFile_, location[0]);
  id v5 = v8;
  id v6 = location[0];
  AXPerformBlockOnMainThread();
  id v4 = v8;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);

  return v4;
}

uint64_t __48__UIImageAccessibility_imageWithContentsOfFile___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessibilitySetIdentification:", *(void *)(a1 + 40), a1, a1);
}

+ (id)kitImageNamed:(id)a3
{
  id v10 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7.receiver = v10;
  v7.super_class = (Class)&OBJC_METACLASS___UIImageAccessibility;
  id v8 = objc_msgSendSuper2(&v7, sel_kitImageNamed_, location[0]);
  id v5 = v8;
  id v6 = location[0];
  AXPerformBlockOnMainThread();
  id v4 = v8;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);

  return v4;
}

uint64_t __38__UIImageAccessibility_kitImageNamed___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessibilitySetIdentification:", *(void *)(a1 + 40), a1, a1);
}

- (id)_imageScaledToProportion:(double)a3 interpolationQuality:(int)a4
{
  objc_super v13 = self;
  SEL v12 = a2;
  double v11 = a3;
  int v10 = a4;
  v8.receiver = self;
  v8.super_class = (Class)UIImageAccessibility;
  id v9 = [(UIImageAccessibility *)&v8 _imageScaledToProportion:a4 interpolationQuality:a3];
  id v6 = v9;
  objc_super v7 = v13;
  AXPerformBlockOnMainThread();
  id v5 = v9;
  objc_storeStrong((id *)&v7, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v9, 0);

  return v5;
}

uint64_t __70__UIImageAccessibility__imageScaledToProportion_interpolationQuality___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (id)[*(id *)(a1 + 40) accessibilityIdentification];
  objc_msgSend(v2, "accessibilitySetIdentification:");

  id v4 = *(void **)(a1 + 32);
  id v5 = (id)[*(id *)(a1 + 40) accessibilityIdentifier];
  objc_msgSend(v4, "setAccessibilityIdentifier:");

  return [*(id *)(a1 + 32) setAccessibilityLabel:0];
}

- (id)_flatImageWithWhite:(double)a3 alpha:(double)a4
{
  int v10 = self;
  id v9[3] = (id)a2;
  v9[2] = *(id *)&a3;
  v9[1] = *(id *)&a4;
  v8.receiver = self;
  v8.super_class = (Class)UIImageAccessibility;
  v9[0] = [(UIImageAccessibility *)&v8 _flatImageWithWhite:a3 alpha:a4];
  id v6 = v9[0];
  objc_super v7 = v10;
  AXPerformBlockOnMainThread();
  id v5 = v9[0];
  objc_storeStrong((id *)&v7, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(v9, 0);

  return v5;
}

void __50__UIImageAccessibility__flatImageWithWhite_alpha___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = (id)[*(id *)(a1 + 40) accessibilityIdentification];
  objc_msgSend(v1, "accessibilitySetIdentification:");

  id v4 = *(void **)(a1 + 32);
  id v5 = (id)[*(id *)(a1 + 40) accessibilityIdentifier];
  objc_msgSend(v4, "setAccessibilityIdentifier:");
}

- (id)_bezeledImageWithShadowRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 fillRed:(double)a7 green:(double)a8 blue:(double)a9 alpha:(double)a10 drawShadow:(BOOL)a11
{
  id v27 = self;
  SEL v26 = a2;
  double v25 = a3;
  double v24 = a4;
  double v23 = a5;
  double v22 = a6;
  double v21 = a7;
  double v20 = a8;
  double v19 = a9;
  double v18 = a10;
  BOOL v17 = a11;
  v15.receiver = self;
  v15.super_class = (Class)UIImageAccessibility;
  id v16 = [(UIImageAccessibility *)&v15 _bezeledImageWithShadowRed:a11 green:a3 blue:a4 alpha:a5 fillRed:a6 green:a7 blue:a8 alpha:a9 drawShadow:a10];
  id v13 = v16;
  id v14 = v27;
  AXPerformBlockOnMainThread();
  id v12 = v16;
  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v16, 0);

  return v12;
}

void __104__UIImageAccessibility__bezeledImageWithShadowRed_green_blue_alpha_fillRed_green_blue_alpha_drawShadow___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = (id)[*(id *)(a1 + 40) accessibilityIdentification];
  objc_msgSend(v1, "accessibilitySetIdentification:");

  id v4 = *(void **)(a1 + 32);
  id v5 = (id)[*(id *)(a1 + 40) accessibilityIdentifier];
  objc_msgSend(v4, "setAccessibilityIdentifier:");
}

- (id)_doubleBezeledImageWithExteriorShadowRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 interiorShadowRed:(double)a7 green:(double)a8 blue:(double)a9 alpha:(double)a10 fillRed:(double)a11 green:(double)a12 blue:(double)a13 alpha:(double)a14
{
  v34 = self;
  v33[13] = (id)a2;
  v33[12] = *(id *)&a3;
  v33[11] = *(id *)&a4;
  v33[10] = *(id *)&a5;
  v33[9] = *(id *)&a6;
  v33[8] = *(id *)&a7;
  v33[7] = *(id *)&a8;
  v33[6] = *(id *)&a9;
  v33[5] = *(id *)&a10;
  v33[4] = *(id *)&a11;
  v33[3] = *(id *)&a12;
  v33[2] = *(id *)&a13;
  v33[1] = *(id *)&a14;
  v32.receiver = self;
  v32.super_class = (Class)UIImageAccessibility;
  id v14 = [(UIImageAccessibility *)&v32 _doubleBezeledImageWithExteriorShadowRed:a3 green:a4 blue:a5 alpha:a6 interiorShadowRed:a7 green:a8 blue:a9 alpha:a10 fillRed:*(void *)&a11 green:*(void *)&a12 blue:*(void *)&a13 alpha:*(void *)&a14];
  double v22 = v33;
  v33[0] = v14;
  double v19 = &v25;
  uint64_t v25 = MEMORY[0x263EF8330];
  int v26 = -1073741824;
  int v27 = 0;
  v28 = __142__UIImageAccessibility__doubleBezeledImageWithExteriorShadowRed_green_blue_alpha_interiorShadowRed_green_blue_alpha_fillRed_green_blue_alpha___block_invoke;
  uint64_t v29 = &unk_2650ADFB0;
  id v15 = v14;
  double v21 = (id *)(v19 + 4);
  id v30 = v15;
  id v16 = v34;
  id location = (id *)(v19 + 5);
  v31 = v16;
  AXPerformBlockOnMainThread();
  id v24 = v33[0];
  id obj = 0;
  objc_storeStrong(location, 0);
  objc_storeStrong(v21, obj);
  objc_storeStrong(v22, obj);
  id v17 = v24;

  return v17;
}

void __142__UIImageAccessibility__doubleBezeledImageWithExteriorShadowRed_green_blue_alpha_interiorShadowRed_green_blue_alpha_fillRed_green_blue_alpha___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = (id)[*(id *)(a1 + 40) accessibilityIdentification];
  objc_msgSend(v1, "accessibilitySetIdentification:");

  id v4 = *(void **)(a1 + 32);
  id v5 = (id)[*(id *)(a1 + 40) accessibilityIdentifier];
  objc_msgSend(v4, "setAccessibilityIdentifier:");
}

- (id)imageFlippedForRightToLeftLayoutDirection
{
  objc_super v8 = self;
  v7[1] = (id)a2;
  v6.receiver = self;
  v6.super_class = (Class)UIImageAccessibility;
  v7[0] = [(UIImageAccessibility *)&v6 imageFlippedForRightToLeftLayoutDirection];
  id v4 = v7[0];
  id v5 = v8;
  AXPerformBlockOnMainThread();
  id v3 = v7[0];
  objc_storeStrong((id *)&v5, 0);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(v7, 0);

  return v3;
}

void __65__UIImageAccessibility_imageFlippedForRightToLeftLayoutDirection__block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = (id)[*(id *)(a1 + 40) accessibilityIdentification];
  objc_msgSend(v1, "accessibilitySetIdentification:");

  id v4 = *(void **)(a1 + 32);
  id v5 = (id)[*(id *)(a1 + 40) accessibilityIdentifier];
  objc_msgSend(v4, "setAccessibilityIdentifier:");
}

@end