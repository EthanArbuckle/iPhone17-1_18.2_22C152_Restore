@interface MTEpisodeDownloadCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityDeleteAction:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_privateAccessibilityCustomActions;
- (id)accessibilityLabel;
@end

@implementation MTEpisodeDownloadCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTEpisodeDownloadCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MTEpisodeDownloadCell" isKindOfClass:@"MTCollectionViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTCollectionViewCell", @"collectionView", "@", 0);
  [v3 validateClass:@"MTCollectionView" isKindOfClass:@"UICollectionView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTGenericCollectionCell", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTGenericCollectionCell", @"subtitle", "@", 0);
  [v3 validateClass:@"MTEpisode" hasProperty:@"author" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTEpisodeDownloadCell", @"downloadButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTCollectionViewCell", @"deleteButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTDownloadsCollectionViewController", @"episodeForDownloadAtIndex:", "@", "Q", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(MTEpisodeDownloadCellAccessibility *)self safeValueForKey:@"collectionView"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 indexPathForCell:self];
  [v4 safeValueForKey:@"delegate"];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v5;
  AXPerformSafeBlock();
  id v8 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  LOBYTE(v17) = 0;
  objc_opt_class();
  v9 = [v8 safeValueForKey:@"author"];
  v10 = __UIAccessibilityCastAsClass();

  if ((_BYTE)v17) {
    goto LABEL_8;
  }
  LOBYTE(v17) = 0;
  objc_opt_class();
  v11 = [(MTEpisodeDownloadCellAccessibility *)self safeValueForKey:@"title"];
  v12 = __UIAccessibilityCastAsClass();

  if ((_BYTE)v17
    || (LOBYTE(v17) = 0,
        objc_opt_class(),
        [(MTEpisodeDownloadCellAccessibility *)self safeValueForKey:@"subtitle"],
        v13 = objc_claimAutoreleasedReturnValue(),
        __UIAccessibilityCastAsClass(),
        v14 = objc_claimAutoreleasedReturnValue(),
        v13,
        (_BYTE)v17))
  {
LABEL_8:
    abort();
  }
  v15 = __UIAXStringForVariables();

  return v15;
}

uint64_t __56__MTEpisodeDownloadCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "episodeForDownloadAtIndex:", objc_msgSend(*(id *)(a1 + 40), "row"));

  return MEMORY[0x270F9A758]();
}

- (id)_accessibilitySupplementaryFooterViews
{
  id v3 = [MEMORY[0x263EFF980] array];
  v4 = [(MTEpisodeDownloadCellAccessibility *)self safeValueForKey:@"downloadButton"];
  if (v4) {
    [v3 addObject:v4];
  }

  return v3;
}

- (BOOL)accessibilityDeleteAction:(id)a3
{
  id v3 = [(MTEpisodeDownloadCellAccessibility *)self safeValueForKey:@"deleteButton"];
  [v3 accessibilityActivate];

  return 1;
}

- (id)_privateAccessibilityCustomActions
{
  id v3 = [MEMORY[0x263EFF980] array];
  objc_opt_class();
  v4 = [(MTEpisodeDownloadCellAccessibility *)self safeValueForKey:@"deleteButton"];
  v5 = __UIAccessibilityCastAsClass();

  if (v5 && ([v5 isHidden] & 1) == 0)
  {
    id v6 = [v5 accessibilityLabel];
    id v7 = (void *)[objc_alloc(MEMORY[0x263F1C390]) initWithName:v6 target:self selector:sel_accessibilityDeleteAction_];
    [v7 setSortPriority:*MEMORY[0x263F81158]];
    [v3 addObject:v7];
  }

  return v3;
}

@end