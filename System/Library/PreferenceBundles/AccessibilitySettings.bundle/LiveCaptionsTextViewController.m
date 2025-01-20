@interface LiveCaptionsTextViewController
- (id)readPreferredContentSizeCategoryNameForAppID:(id)a3;
- (void)savePreferredContentSizeCategoryName:(id)a3 forAppID:(id)a4;
@end

@implementation LiveCaptionsTextViewController

- (id)readPreferredContentSizeCategoryNameForAppID:(id)a3
{
  v3 = (void *)_AXSLiveCaptionsCopyContentSizeCategoryName();

  return v3;
}

- (void)savePreferredContentSizeCategoryName:(id)a3 forAppID:(id)a4
{
}

@end