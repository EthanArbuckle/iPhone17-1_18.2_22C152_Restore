@interface DDOpenMapsAction
+ (BOOL)actionAvailableForCachedEvent:(id)a3;
+ (BOOL)actionAvailableForContact:(id)a3;
- (BOOL)canBePerformedByOpeningURL;
- (id)compactTitle;
- (id)iconName;
- (id)localizedName;
- (id)notificationIconBundleIdentifier;
- (id)notificationTitle;
- (id)notificationURL;
- (id)variantIconName;
- (void)performFromView:(id)a3;
@end

@implementation DDOpenMapsAction

+ (BOOL)actionAvailableForContact:(id)a3
{
  v3 = _displayString(0, 0, a3, 0, 0);
  BOOL v4 = [v3 length] != 0;

  return v4;
}

+ (BOOL)actionAvailableForCachedEvent:(id)a3
{
  v3 = _displayString(0, 0, 0, a3, 0);
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (id)localizedName
{
  return DDLocalizedString(@"Open in Maps");
}

- (id)iconName
{
  return @"map";
}

- (id)variantIconName
{
  return @"location.fill";
}

- (id)compactTitle
{
  url = self->super._url;
  BOOL v4 = self->super._result;
  contact = self->super._contact;
  v6 = [(NSDictionary *)self->super._context objectForKeyedSubscript:0x1EF5023F8];
  v7 = _displayString(url, (uint64_t)v4, contact, v6, 1);

  if ([v7 length])
  {
    id v8 = v7;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)DDOpenMapsAction;
    id v8 = [(DDAction *)&v11 compactTitle];
  }
  v9 = v8;

  return v9;
}

- (id)notificationTitle
{
  url = self->super._url;
  BOOL v4 = self->super._result;
  contact = self->super._contact;
  v6 = [(NSDictionary *)self->super._context objectForKeyedSubscript:0x1EF5023F8];
  v7 = _displayString(url, (uint64_t)v4, contact, v6, 1);

  if (v7)
  {
    id v8 = [(NSURL *)self->super._url scheme];
    v9 = [v8 lowercaseString];
    int v10 = [v9 isEqualToString:@"geo"];

    objc_super v11 = NSString;
    if (v10) {
      v12 = @"View location “%@” in Maps";
    }
    else {
      v12 = @"View “%@” in Maps";
    }
    v14 = DDLocalizedString(v12);
    v13 = objc_msgSend(v11, "stringWithFormat:", v14, v7);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)notificationIconBundleIdentifier
{
  return @"com.apple.Maps";
}

- (id)notificationURL
{
  v3 = self->super._result;
  if (v3) {
    goto LABEL_8;
  }
  if (!self->super._url)
  {
    BOOL v4 = DDDefaultAddressForContact(self->super._contact);
    if (v4)
    {
    }
    else
    {
      v5 = [(NSDictionary *)self->super._context objectForKeyedSubscript:0x1EF5023F8];
      v6 = [v5 objectForKeyedSubscript:@"event"];

      if (!v6) {
        DDUILogAssertionFailure((uint64_t)"_result || _url || DDDefaultAddressForContact(_contact) || _context[kDataDetectorsCachedEventKey][@\"event\"]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/MobileDataDetectorsUI/Actions/DDAddressActions.m", (uint64_t)"[(DDOpenMapsAction *)"Expecting a result notificationURL], v7, v8, v9, v18);
      }
    }
  }
  v3 = self->super._result;
  if (v3)
  {
LABEL_8:
    int v10 = DDMapURLForResult(v3);
    if (v10) {
      goto LABEL_19;
    }
    objc_super v11 = self->super._result;
  }
  else
  {
    objc_super v11 = 0;
  }
  url = self->super._url;
  if (!url)
  {
    v13 = 0;
    goto LABEL_15;
  }
  int v10 = DDMapsURLForUrlAndResult(url, v11);
  if (!v10)
  {
    v13 = self->super._url;
    objc_super v11 = self->super._result;
LABEL_15:
    contact = self->super._contact;
    v15 = [(NSDictionary *)self->super._context objectForKeyedSubscript:0x1EF5023F8];
    v16 = _displayString(v13, (uint64_t)v11, contact, v15, 0);

    if (v16)
    {
      int v10 = DDMapURLForString(v16);
    }
    else
    {
      int v10 = 0;
    }
  }
LABEL_19:
  return v10;
}

- (void)performFromView:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(DDOpenMapsAction *)self notificationURL];
  if (v4)
  {
    [(DDAction *)self addToRecents];
    [(DDAction *)self _performFromView:v5 byOpeningURL:v4];
  }
}

- (BOOL)canBePerformedByOpeningURL
{
  return 1;
}

@end