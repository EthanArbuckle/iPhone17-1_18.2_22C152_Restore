@interface DDDirectionsAction
- (id)iconName;
- (id)localizedName;
- (id)notificationTitle;
- (id)notificationURL;
@end

@implementation DDDirectionsAction

- (id)localizedName
{
  return DDLocalizedString(@"Get Directions");
}

- (id)iconName
{
  return @"arrow.triangle.turn.up.right.circle";
}

- (id)notificationTitle
{
  url = self->super.super._url;
  v4 = self->super.super._result;
  contact = self->super.super._contact;
  v6 = [(NSDictionary *)self->super.super._context objectForKeyedSubscript:0x1EF5023F8];
  v7 = _displayString(url, (uint64_t)v4, contact, v6, 1);

  if (v7)
  {
    v8 = [(NSURL *)self->super.super._url scheme];
    v9 = [v8 lowercaseString];
    int v10 = [v9 isEqualToString:@"geo"];

    v11 = NSString;
    if (v10) {
      v12 = @"Get directions to location “%@”";
    }
    else {
      v12 = @"Get directions to “%@”";
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

- (id)notificationURL
{
  v3 = self->super.super._result;
  if (!v3)
  {
    if (!self->super.super._url)
    {
      v4 = DDDefaultAddressForContact(self->super.super._contact);
      if (v4)
      {
      }
      else
      {
        v5 = [(NSDictionary *)self->super.super._context objectForKeyedSubscript:0x1EF5023F8];

        if (!v5) {
          DDUILogAssertionFailure((uint64_t)"_result || _url || DDDefaultAddressForContact(_contact) || _context[kDataDetectorsCachedEventKey]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/MobileDataDetectorsUI/Actions/DDAddressActions.m", (uint64_t)"[(DDDirectionsAction *)"Expecting a result notificationURL], v6, v7, v8, v17);
        }
      }
    }
    v3 = self->super.super._result;
    if (!v3) {
      goto LABEL_9;
    }
  }
  v9 = DDDirectionsURLForResult(v3);
  if (!v9)
  {
LABEL_9:
    url = self->super.super._url;
    if (!url)
    {
      v11 = 0;
      goto LABEL_13;
    }
    v9 = DDDirectionsURLForURL(url);
    if (!v9)
    {
      v11 = self->super.super._url;
LABEL_13:
      v12 = self->super.super._result;
      contact = self->super.super._contact;
      v14 = [(NSDictionary *)self->super.super._context objectForKeyedSubscript:0x1EF5023F8];
      v15 = _displayString(v11, (uint64_t)v12, contact, v14, 0);

      if (v15)
      {
        v9 = DDDirectionsURLForString(v15);
      }
      else
      {
        v9 = 0;
      }
    }
  }
  return v9;
}

@end