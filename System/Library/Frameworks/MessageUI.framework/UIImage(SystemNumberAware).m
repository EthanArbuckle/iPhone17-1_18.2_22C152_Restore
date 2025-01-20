@interface UIImage(SystemNumberAware)
+ (id)mf_systemImageNamedNumberAware:()SystemNumberAware textStyle:scale:weight:maximumContentSizeCategory:;
@end

@implementation UIImage(SystemNumberAware)

+ (id)mf_systemImageNamedNumberAware:()SystemNumberAware textStyle:scale:weight:maximumContentSizeCategory:
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  id v14 = v11;
  if (MapImageNameNumberAware_onceToken != -1) {
    dispatch_once(&MapImageNameNumberAware_onceToken, &__block_literal_global_40);
  }
  if (([(id)MapImageNameNumberAware_sDigitAwareSet containsObject:v14] & 1) == 0)
  {

    v19 = 0;
LABEL_14:
    v23 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_systemImageNamed:textStyle:scale:weight:maximumContentSizeCategory:", v14, v12, a5, a6, v13);
    goto LABEL_15;
  }
  v15 = [MEMORY[0x1E4F1CA20] currentLocale];
  v16 = [v15 languageCode];

  if (([v16 isEqualToString:@"ar"] & 1) != 0
    || [v16 isEqualToString:@"hi"])
  {
    v17 = [MEMORY[0x1E4F1CA20] currentLocale];
    v18 = [v17 numberingSystem];

    if ([v18 isEqualToString:@"latn"])
    {
      v19 = [v14 stringByAppendingFormat:@".rtl.westernarabic"];
    }
    else
    {
      v19 = 0;
    }
  }
  else
  {
    v19 = 0;
  }

  if (!v19) {
    goto LABEL_14;
  }
  v20 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_symbolConfigurationForImageSymbolType:textStyle:scale:weight:traits:maximumContentSizeCategory:", 2, v12, a5, a6, 0, v13);
  v21 = (void *)MEMORY[0x1E4FB1818];
  v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.messageui"];
  v23 = [v21 imageNamed:v19 inBundle:v22 withConfiguration:v20];

  if (!v23) {
    goto LABEL_14;
  }
LABEL_15:

  return v23;
}

@end