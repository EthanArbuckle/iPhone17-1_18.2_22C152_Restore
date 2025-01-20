@interface BBSectionInfo
- (BOOL)isEqualToSection:(id)a3;
- (id)_scaledImageForImage:(id)a3;
- (id)nc_settingsIconImage;
- (int64_t)nc_effectiveAnnounceSetting;
@end

@implementation BBSectionInfo

- (id)nc_settingsIconImage
{
  v3 = [(BBSectionInfo *)self icon];
  v4 = [v3 _bestVariantForFormat:1];
  v5 = [v4 imageData];

  if (v5)
  {
    v6 = [(BBSectionInfo *)self iconData];
    v5 = +[UIImage imageWithData:v6];
  }
  uint64_t v7 = [v4 bundlePath];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [v4 imageName];

    if (v9)
    {
      v10 = [v4 bundlePath];
      v11 = +[NSBundle bundleWithPath:v10];

      if (!v11)
      {
LABEL_10:

        goto LABEL_11;
      }
      uint64_t v12 = [v4 imageName];
      uint64_t v13 = +[UIImage imageNamed:v12 inBundle:v11];

      v5 = (void *)v12;
LABEL_9:

      v5 = (void *)v13;
      goto LABEL_10;
    }
  }
  v14 = [v4 imagePath];

  if (v14)
  {
    v11 = [v4 imagePath];
    uint64_t v13 = +[UIImage imageWithContentsOfFile:v11];
    goto LABEL_9;
  }
LABEL_11:
  if (!v5
    || ([(BBSectionInfo *)self _scaledImageForImage:v5],
        v15 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v15))
  {
    v16 = [(BBSectionInfo *)self sectionID];
    unsigned int v17 = [v16 isEqualToString:@"com.apple.Passbook"];

    if (v17)
    {
      v15 = PSPassbookImage();
    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (int64_t)nc_effectiveAnnounceSetting
{
  if (![(BBSectionInfo *)self allowsNotifications]) {
    return 1;
  }

  return (int64_t)[(BBSectionInfo *)self announceSetting];
}

- (id)_scaledImageForImage:(id)a3
{
  id v3 = a3;
  v4 = +[UIScreen mainScreen];
  [v4 scale];
  double v6 = v5;

  uint64_t v7 = PSBlankIconImage();
  [v7 size];
  double v9 = v8;
  double v11 = v10;

  id v12 = objc_msgSend(objc_alloc((Class)ISImageDescriptor), "initWithSize:scale:", v9, v11, v6);
  [v12 setDrawBorder:1];
  uint64_t v13 = +[UITraitCollection currentTraitCollection];
  objc_msgSend(v12, "setAppearance:", objc_msgSend(v13, "userInterfaceStyle") != (char *)&dword_0 + 1);

  v14 = +[UITraitCollection currentTraitCollection];
  if ([v14 layoutDirection]) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = 1;
  }
  [v12 setLanguageDirection:v15];

  v16 = +[UITraitCollection currentTraitCollection];
  objc_msgSend(v12, "setContrast:", objc_msgSend(v16, "accessibilityContrast") == (char *)&dword_0 + 1);

  id v17 = objc_alloc((Class)IFImage);
  id v18 = v3;
  id v19 = [v18 CGImage];
  [v18 scale];
  id v20 = objc_msgSend(v17, "initWithCGImage:scale:", v19);
  id v21 = objc_alloc((Class)ISIcon);
  id v30 = v20;
  v22 = +[NSArray arrayWithObjects:&v30 count:1];
  id v23 = [v21 initWithImages:v22];

  if (v23)
  {
    v24 = [v23 prepareImageForDescriptor:v12];
    v25 = v24;
    if (v24)
    {
      id v26 = [v24 CGImage];
      v27 = +[UIScreen mainScreen];
      [v27 scale];
      +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v26, 0);
      id v28 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v28 = v18;
    }
  }
  else
  {
    id v28 = v18;
  }

  return v28;
}

- (BOOL)isEqualToSection:(id)a3
{
  id v4 = a3;
  double v5 = [(BBSectionInfo *)self sectionID];
  double v6 = [v4 sectionID];
  unsigned int v23 = [v5 isEqualToString:v6];

  id v22 = [(BBSectionInfo *)self notificationCenterSetting];
  id v21 = [v4 notificationCenterSetting];
  id v20 = [(BBSectionInfo *)self lockScreenSetting];
  id v19 = [v4 lockScreenSetting];
  id v7 = [(BBSectionInfo *)self alertType];
  id v8 = [v4 alertType];
  id v9 = [(BBSectionInfo *)self contentPreviewSetting];
  id v10 = [v4 contentPreviewSetting];
  id v11 = [(BBSectionInfo *)self carPlaySetting];
  id v12 = [v4 carPlaySetting];
  id v18 = [(BBSectionInfo *)self remoteNotificationsSetting];
  id v13 = [v4 remoteNotificationsSetting];
  id v14 = [(BBSectionInfo *)self criticalAlertSetting];
  id v15 = [v4 criticalAlertSetting];

  BOOL result = 0;
  if (v23 && v22 == v21 && v20 == v19 && v7 == v8 && v9 == v10 && v11 == v12) {
    return v18 == v13 && v14 == v15;
  }
  return result;
}

@end