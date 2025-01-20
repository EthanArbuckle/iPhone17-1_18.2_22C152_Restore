@interface NSString(AXPropertyListCoersion)
- (id)_axReconstitutedRepresentationForDictionaryKeyReplacement;
@end

@implementation NSString(AXPropertyListCoersion)

- (id)_axReconstitutedRepresentationForDictionaryKeyReplacement
{
  unint64_t v2 = [a1 length];
  if (v2 > [@"_AXSNSNumber" length]
    && ([a1 substringToIndex:objc_msgSend(@"_AXSNSNumber", "length")],
        v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 isEqualToString:@"_AXSNSNumber"],
        v3,
        v4))
  {
    v5 = [a1 substringFromIndex:objc_msgSend(@"_AXSNSNumber", "length")];
    objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v5, "longLongValue"));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = a1;
  }
  return v6;
}

@end