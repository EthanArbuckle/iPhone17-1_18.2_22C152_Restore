@interface BuddyWarrantyTCController
+ (id)warrantyFilePath;
- (id)termsContent;
- (id)titleString;
@end

@implementation BuddyWarrantyTCController

+ (id)warrantyFilePath
{
  return (id)SFWarrantyFilePath();
}

- (id)termsContent
{
  location[2] = self;
  location[1] = (id)a2;
  id v2 = +[BuddyWarrantyTCController warrantyFilePath];
  location[0] = +[NSData dataWithContentsOfFile:v2];

  id v7 = [objc_alloc((Class)NSString) initWithData:location[0] encoding:4];
  id v3 = [v7 stringByReplacingOccurrencesOfString:@"<head>", @"<head><meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no\"/>" withString];
  id v4 = v7;
  id v7 = v3;

  id v5 = v7;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (id)titleString
{
  id v2 = +[NSBundle mainBundle];
  id v3 = [(NSBundle *)v2 localizedStringForKey:@"WARRANTY" value:&stru_1002B4E18 table:@"Localizable"];

  return v3;
}

@end