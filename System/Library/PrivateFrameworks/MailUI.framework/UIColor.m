@interface UIColor
@end

@implementation UIColor

id __46__UIColor_MailUI__mailSecondaryLabelDarkColor__block_invoke(uint64_t a1, void *a2)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4FB1E20];
  v10[0] = a2;
  id v3 = a2;
  v4 = [v2 traitCollectionWithUserInterfaceStyle:2];
  v10[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  v6 = [v2 traitCollectionWithTraitsFromCollections:v5];

  v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];

  v8 = [v7 resolvedColorWithTraitCollection:v6];

  return v8;
}

@end