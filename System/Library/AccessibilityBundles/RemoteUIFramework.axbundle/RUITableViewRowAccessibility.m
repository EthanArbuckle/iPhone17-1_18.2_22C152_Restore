@interface RUITableViewRowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)loadImage;
@end

@implementation RUITableViewRowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"RUITableViewRow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"RUITableViewRow" isKindOfClass:@"RUIElement"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RUIElement", @"loadImage", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RUIElement", @"URLAttributeForImageName: getScale:", "@", "@", "^d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCell", @"_imageView:", "@", "B", 0);
}

- (BOOL)loadImage
{
  v24.receiver = self;
  v24.super_class = (Class)RUITableViewRowAccessibility;
  BOOL v3 = [(RUITableViewRowAccessibility *)&v24 loadImage];
  if (v3)
  {
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x2020000000;
    v23[3] = 0xBFF0000000000000;
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__0;
    v21 = __Block_byref_object_dispose__0;
    id v22 = 0;
    AXPerformSafeBlock();
    id v4 = (id)v18[5];
    _Block_object_dispose(&v17, 8);

    v5 = [v4 absoluteString];
    v6 = [v5 lastPathComponent];

    LOBYTE(v17) = 0;
    v7 = [(RUITableViewRowAccessibility *)self safeValueForKey:@"tableCell"];
    v8 = __UIAccessibilitySafeClass();

    if ((_BYTE)v17) {
      abort();
    }
    objc_opt_class();
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__0;
    v21 = __Block_byref_object_dispose__0;
    id v22 = 0;
    uint64_t v16 = MEMORY[0x263EF8330];
    id v9 = v8;
    AXPerformSafeBlock();
    id v10 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
    v11 = __UIAccessibilityCastAsClass();

    if (v6)
    {
      v12 = objc_msgSend(v11, "accessibilityIdentifier", v16, 3221225472, __41__RUITableViewRowAccessibility_loadImage__block_invoke_2, &unk_2650AAD10);

      if (!v12)
      {
        v13 = [v6 componentsSeparatedByString:@"@"];
        if ([v13 count])
        {
          v14 = [v13 firstObject];
          [v11 setAccessibilityIdentifier:v14];
        }
      }
    }

    _Block_object_dispose(v23, 8);
  }
  return v3;
}

uint64_t __41__RUITableViewRowAccessibility_loadImage__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) URLAttributeForImageName:@"image" getScale:*(void *)(*(void *)(a1 + 48) + 8) + 24];

  return MEMORY[0x270F9A758]();
}

uint64_t __41__RUITableViewRowAccessibility_loadImage__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _imageView:0];

  return MEMORY[0x270F9A758]();
}

@end