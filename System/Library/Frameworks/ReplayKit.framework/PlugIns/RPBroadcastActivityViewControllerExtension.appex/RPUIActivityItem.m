@interface RPUIActivityItem
- (NSString)appName;
- (NSString)overrideShareMessage;
- (NSString)shareText;
- (NSURL)itemURL;
- (NSURL)videoURL;
- (UIImage)appIcon;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (void)setAppIcon:(id)a3;
- (void)setAppName:(id)a3;
- (void)setItemURL:(id)a3;
- (void)setOverrideShareMessage:(id)a3;
- (void)setShareText:(id)a3;
- (void)setVideoURL:(id)a3;
@end

@implementation RPUIActivityItem

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return [(RPUIActivityItem *)self videoURL];
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return [(RPUIActivityItem *)self videoURL];
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (NSString)overrideShareMessage
{
  return self->_overrideShareMessage;
}

- (void)setOverrideShareMessage:(id)a3
{
}

- (NSString)shareText
{
  return self->_shareText;
}

- (void)setShareText:(id)a3
{
}

- (UIImage)appIcon
{
  return self->_appIcon;
}

- (void)setAppIcon:(id)a3
{
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (void)setVideoURL:(id)a3
{
}

- (NSURL)itemURL
{
  return self->_itemURL;
}

- (void)setItemURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemURL, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_appIcon, 0);
  objc_storeStrong((id *)&self->_shareText, 0);
  objc_storeStrong((id *)&self->_overrideShareMessage, 0);

  objc_storeStrong((id *)&self->_appName, 0);
}

@end