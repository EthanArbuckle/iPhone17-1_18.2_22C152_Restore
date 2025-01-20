@interface MTPodcastCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)prepareForReuse;
@end

@implementation MTPodcastCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTPodcastCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MTPodcastCollectionViewCell" isKindOfClass:@"UICollectionReusableView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionReusableView", @"prepareForReuse", "v", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"MTDB", @"sharedInstance", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTDB", @"mainOrPrivateContext", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTPodcastCollectionViewCell", @"podcastUUID", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v15.receiver = self;
  v15.super_class = (Class)MTPodcastCollectionViewCellAccessibility;
  id v3 = [(MTPodcastCollectionViewCellAccessibility *)&v15 accessibilityLabel];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x3032000000;
    v12 = __Block_byref_object_copy_;
    v13 = __Block_byref_object_dispose_;
    id v14 = 0;
    AXPerformSafeBlock();
    v6 = [(id)v10[5] firstObject];
    v7 = __UIAccessibilitySafeClass();

    id v5 = [v7 safeValueForKey:@"title"];

    [(MTPodcastCollectionViewCellAccessibility *)self setAccessibilityLabel:v5];
    _Block_object_dispose(&v9, 8);
  }

  return v5;
}

void __62__MTPodcastCollectionViewCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F08A98];
  char v16 = 0;
  id v3 = [*(id *)(a1 + 32) safeValueForKey:@"podcastUUID"];
  v4 = __UIAccessibilitySafeClass();

  id v5 = [v2 predicateWithFormat:@"%K == %@", @"uuid", v4];

  v6 = (void *)[objc_alloc(MEMORY[0x263EFF260]) initWithEntityName:@"MTPodcast"];
  [v6 setPredicate:v5];
  char v15 = 0;
  v7 = [(id)MEMORY[0x24565BA80](@"MTDB") safeValueForKey:@"sharedInstance"];
  v8 = [v7 safeValueForKey:@"mainOrPrivateContext"];
  uint64_t v9 = __UIAccessibilitySafeClass();

  id v14 = 0;
  uint64_t v10 = [v9 executeFetchRequest:v6 error:&v14];
  id v11 = v14;
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v10;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)MTPodcastCollectionViewCellAccessibility;
  [(MTPodcastCollectionViewCellAccessibility *)&v3 prepareForReuse];
  [(MTPodcastCollectionViewCellAccessibility *)self setAccessibilityLabel:0];
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end