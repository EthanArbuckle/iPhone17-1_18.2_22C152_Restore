@interface DMCIconFactory
+ (id)_imageNamed:(id)a3;
+ (id)accountIcon;
+ (id)appIcon;
+ (id)gearIcon;
+ (id)graduationCapIcon;
+ (id)iCloudCollaborationIcon;
+ (id)iCloudIcon;
+ (id)keyIcon;
+ (id)lanyardCardIcon;
+ (id)lanyardIcon;
+ (id)largeGearIcon;
+ (id)notesIcon;
+ (id)workBadgeIcon;
@end

@implementation DMCIconFactory

+ (id)_imageNamed:(id)a3
{
  v3 = (void *)MEMORY[0x263F1C6B0];
  v4 = (void *)MEMORY[0x263F086E0];
  id v5 = a3;
  v6 = [v4 bundleForClass:objc_opt_class()];
  v7 = [v3 imageNamed:v5 inBundle:v6];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    PSBlankIconImage();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

+ (id)accountIcon
{
  return (id)[a1 _imageNamed:@"account-icon"];
}

+ (id)appIcon
{
  return (id)[a1 _imageNamed:@"app-icon"];
}

+ (id)gearIcon
{
  return (id)[a1 _imageNamed:@"gear-icon"];
}

+ (id)largeGearIcon
{
  return (id)[a1 _imageNamed:@"gear-icon-large"];
}

+ (id)graduationCapIcon
{
  return (id)[a1 _imageNamed:@"graduationcap-icon"];
}

+ (id)keyIcon
{
  return (id)[a1 _imageNamed:@"key-icon"];
}

+ (id)lanyardIcon
{
  return (id)[a1 _imageNamed:@"lanyard-icon"];
}

+ (id)lanyardCardIcon
{
  return (id)[a1 _imageNamed:@"lanyardcard-icon"];
}

+ (id)iCloudIcon
{
  return (id)[a1 _imageNamed:@"icloud-icon"];
}

+ (id)iCloudCollaborationIcon
{
  return (id)[a1 _imageNamed:@"icloudcollab-icon"];
}

+ (id)notesIcon
{
  return (id)[a1 _imageNamed:@"notes-icon"];
}

+ (id)workBadgeIcon
{
  return (id)[a1 _imageNamed:@"workbadge-icon"];
}

@end