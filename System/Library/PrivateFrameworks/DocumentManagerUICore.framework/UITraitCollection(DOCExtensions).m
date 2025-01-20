@interface UITraitCollection(DOCExtensions)
+ (id)doc_traitsAffectingFonts;
- (double)doc_NSDirectionalEdgeInsetsFromInsets:()DOCExtensions;
- (double)doc_UIEdgeInsetsFromDirectionalInsets:()DOCExtensions;
@end

@implementation UITraitCollection(DOCExtensions)

+ (id)doc_traitsAffectingFonts
{
  v3[1] = *MEMORY[0x263EF8340];
  v0 = self;
  v3[0] = v0;
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:1];

  return v1;
}

- (double)doc_UIEdgeInsetsFromDirectionalInsets:()DOCExtensions
{
  return a2;
}

- (double)doc_NSDirectionalEdgeInsetsFromInsets:()DOCExtensions
{
  return a2;
}

@end