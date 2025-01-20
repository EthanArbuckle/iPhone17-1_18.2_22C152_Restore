@interface CSLNotificationCell
- (id)getLazyIcon;
- (id)lazyIconQueue:(id)a3;
@end

@implementation CSLNotificationCell

- (id)lazyIconQueue:(id)a3
{
  return [a3 propertyForKey:@"CSLNotificationCellIconQueue"];
}

- (id)getLazyIcon
{
  v3 = [(CSLNotificationCell *)self specifier];
  v4 = [v3 propertyForKey:BPSNotificationAppBBSectionInfo];

  v5 = [v4 icon];
  v6 = [v5 _bestVariantForFormat:1];
  v7 = [v6 imageData];

  if (v7)
  {
    v8 = [v4 iconData];
    v9 = +[UIImage imageWithData:v8];
    v7 = objc_msgSend(v9, "_applicationIconImageForFormat:precomposed:", 0, objc_msgSend(v6, "isPrecomposed"));
  }
  uint64_t v10 = [v6 bundlePath];
  if (v10)
  {
    v11 = (void *)v10;
    v12 = [v6 imageName];

    if (v12)
    {
      v13 = [v6 bundlePath];
      v14 = +[NSBundle bundleWithPath:v13];

      if (v14)
      {
        v15 = [v6 imageName];
        v16 = +[UIImage imageNamed:v15 inBundle:v14];
        uint64_t v17 = objc_msgSend(v16, "_applicationIconImageForFormat:precomposed:", 0, objc_msgSend(v6, "isPrecomposed"));

        v7 = (void *)v17;
      }
    }
  }
  if (!v7)
  {
    v19.receiver = self;
    v19.super_class = (Class)CSLNotificationCell;
    v7 = [(CSLNotificationCell *)&v19 getLazyIcon];
  }

  return v7;
}

@end