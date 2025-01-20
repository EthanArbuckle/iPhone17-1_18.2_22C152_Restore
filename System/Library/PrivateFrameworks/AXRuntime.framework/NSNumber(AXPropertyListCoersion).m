@interface NSNumber(AXPropertyListCoersion)
- (uint64_t)_axDictionaryKeyReplacementRepresentation;
- (uint64_t)_axReconstitutedRepresentationForDictionaryKeyReplacement;
@end

@implementation NSNumber(AXPropertyListCoersion)

- (uint64_t)_axDictionaryKeyReplacementRepresentation
{
  return [NSString stringWithFormat:@"%@%lld", @"_AXSNSNumber", objc_msgSend(a1, "longLongValue")];
}

- (uint64_t)_axReconstitutedRepresentationForDictionaryKeyReplacement
{
  return 0;
}

@end