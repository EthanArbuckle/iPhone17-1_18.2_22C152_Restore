@interface IMSharedMessageRichLinkSummary
+ (id)linkMetadataForPluginPayload:(id)a3;
+ (id)pluginPath;
+ (id)previewSummaryWithPluginPayload:(id)a3;
@end

@implementation IMSharedMessageRichLinkSummary

+ (id)pluginPath
{
  return @"/System/Library/Messages/iMessageBalloons/RichLinkProvider.bundle";
}

+ (id)previewSummaryWithPluginPayload:(id)a3
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___IMSharedMessageRichLinkSummary;
  id v4 = objc_msgSendSuper2(&v7, sel_previewSummaryWithPluginPayload_);
  if ([a3 data])
  {
    id v4 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "dataSourceClass"), "individualPreviewSummaryForPluginPayload:", a3), "copy");
    if (!v4)
    {
      v5 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "dataSourceClass")), "initWithPluginPayload:", a3);
      id v4 = (id)objc_msgSend((id)objc_msgSend(v5, "individualPreviewSummary"), "copy");
      if (v5) {
    }
      }
  }
  return v4;
}

+ (id)linkMetadataForPluginPayload:(id)a3
{
  if (![a3 data]) {
    return 0;
  }
  id v4 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "dataSourceClass")), "initWithPluginPayload:", a3);
  id v5 = (id)objc_msgSend((id)objc_msgSend(v4, "richLinkMetadata"), "copy");
  if (v4) {

  }
  return v5;
}

@end