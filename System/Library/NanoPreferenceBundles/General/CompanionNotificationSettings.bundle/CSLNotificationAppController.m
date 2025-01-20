@interface CSLNotificationAppController
- (BBSectionInfo)bbSectionInfo;
- (id)applicationBundleIdentifier;
- (id)localizedPaneTitle;
- (void)setBbSectionInfo:(id)a3;
@end

@implementation CSLNotificationAppController

- (id)localizedPaneTitle
{
  return [*(id *)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:BPSNotificationAppBBDisplayName];
}

- (id)applicationBundleIdentifier
{
  v3 = [*(id *)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:BPSNotificationAppBBSectionInfo];
  bbSectionInfo = self->_bbSectionInfo;
  self->_bbSectionInfo = v3;

  v5 = self->_bbSectionInfo;

  return [(BBSectionInfo *)v5 sectionID];
}

- (BBSectionInfo)bbSectionInfo
{
  return self->_bbSectionInfo;
}

- (void)setBbSectionInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end