@interface MSTrackListCellConfigurationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MSTrackListCellConfigurationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MSTrackListCellConfiguration";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF40];
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"track.list.listen.hint");
}

- (id)accessibilityLabel
{
  [self _accessibilityReloadMediaStrings];
  uint64_t v3 = objc_msgSend((id)-[MSTrackListCellConfigurationAccessibility safeValueForKey:](self, "safeValueForKey:", @"_accessibilityStringsArrayPointer"), "bytes");
  v4 = *(void **)(v3 + 24);
  v5 = *(void **)(v3 + 32);
  v6 = *(void **)v3;
  v7 = *(void **)(v3 + 8);
  v8 = *(void **)(v3 + 16);
  v9 = (void *)[(MSTrackListCellConfigurationAccessibility *)self safeValueForKey:@"_accessibilityVideoIconString"];
  v10 = (void *)[MEMORY[0x263F089D8] string];
  if ([v5 length]) {
    [v10 appendFormat:accessibilityLocalizedString(@"track.index"), v5];
  }
  if ([v4 length]) {
    [v10 appendFormat:@"%@, ", v4];
  }
  if ([v8 length]) {
    [v10 appendFormat:@"%@, ", v8];
  }
  if ([v7 length])
  {
    v11 = (void *)[v7 mutableCopyWithZone:0];
    objc_msgSend(v11, "replaceOccurrencesOfString:withString:options:range:", @"("), &stru_26F727900, 0, 0, objc_msgSend(v11, "length");
    objc_msgSend(v11, "replaceOccurrencesOfString:withString:options:range:", @""), &stru_26F727900, 0, 0, objc_msgSend(v11, "length"));
    uint64_t v12 = [v10 length];
    [v10 appendFormat:@" %@ ", v11];
    uint64_t v13 = [v10 length] - v12;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if ([v6 length]) {
    [v10 appendFormat:@"%@, ", v6];
  }
  if ([v9 length]) {
    [v10 appendFormat:@"%@, ", v9];
  }
  v14 = (void *)[MEMORY[0x263F21660] axAttributedStringWithString:v10];
  v15 = v14;
  if (v12 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v14, "setAttribute:forKey:withRange:", *MEMORY[0x263EFFB40], *MEMORY[0x263F21740], v12, v13);
  }
  return v15;
}

@end