@interface SFNullCardSection(CRCardSection)
- (id)parametersForInteraction:()CRCardSection;
@end

@implementation SFNullCardSection(CRCardSection)

- (id)parametersForInteraction:()CRCardSection
{
  v6.receiver = a1;
  v6.super_class = (Class)&off_26DB1AD98;
  v1 = objc_msgSendSuper2(&v6, sel_parametersForInteraction_);
  v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    id v3 = [MEMORY[0x263EFFA08] set];
  }
  v4 = v3;

  return v4;
}

@end