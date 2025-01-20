@interface BRShareCopyLinkActivity
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (id)_activitySettingsImage;
- (id)_beforeActivity;
- (id)activityImage;
- (id)activitySettingsImage;
- (id)activityTitle;
- (id)activityType;
- (id)activityViewController;
- (void)performActivity;
- (void)prepareWithActivityItems:(id)a3;
@end

@implementation BRShareCopyLinkActivity

+ (int64_t)activityCategory
{
  return 1;
}

- (id)activityType
{
  return @"com.apple.CloudDocsUI.CopyShareLinkActivity";
}

- (id)activityTitle
{
  v2 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  v3 = [v2 localizedStringForKey:@"COPY_LINK_ACTIVITY_TEXT" value:@"Copy Link" table:@"Localizable"];

  return v3;
}

- (id)activityImage
{
  return +[UIImage imageNamed:@"CopyLinkActivity"];
}

- (id)activitySettingsImage
{
  return +[UIImage imageNamed:@"CopyLinkActivityEdit"];
}

- (id)_activitySettingsImage
{
  v2 = [(BRShareCopyLinkActivity *)self activitySettingsImage];
  v3 = [v2 _applicationIconImageForFormat:0 precomposed:0];

  return v3;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a3;
  v4 = (char *)[v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = (char *)[v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

- (id)_beforeActivity
{
  return UIActivityTypeCreateReminder;
}

- (void)prepareWithActivityItems:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_storeStrong((id *)&self->_urlToCopy, v9);
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (id)activityViewController
{
  return 0;
}

- (void)performActivity
{
  id v3 = +[UIPasteboard generalPasteboard];
  [v3 setValue:self->_urlToCopy forPasteboardType:kUTTypeURL];

  [(BRShareCopyLinkActivity *)self activityDidFinish:1];
}

- (void).cxx_destruct
{
}

@end