@interface BuddyiOSTCController
- (BuddyiOSTCController)init;
- (id)termsContent;
- (id)titleString;
- (unint64_t)licenseVersionDisplayed;
- (void)didAgree;
- (void)setLicenseVersionDisplayed:(unint64_t)a3;
@end

@implementation BuddyiOSTCController

- (BuddyiOSTCController)init
{
  SEL v6 = a2;
  id location = 0;
  v5.receiver = self;
  v5.super_class = (Class)BuddyiOSTCController;
  id location = [(BuddyiOSTCController *)&v5 init];
  objc_storeStrong(&location, location);
  if (location)
  {
    id v2 = +[BYLicenseAgreement versionOfOnDiskAgreement];
    *((void *)location + 3) = v2;
  }
  v3 = (BuddyiOSTCController *)location;
  objc_storeStrong(&location, 0);
  return v3;
}

- (id)termsContent
{
  v16[2] = self;
  v16[1] = (id)a2;
  id v2 = (id)SFLicenseFilePath();
  v16[0] = +[NSData dataWithContentsOfFile:v2];

  id v15 = [objc_alloc((Class)NSString) initWithData:v16[0] encoding:4];
  v3 = +[NSBundle mainBundle];
  id v14 = [(NSBundle *)v3 localizedStringForKey:@"TERMS_CONDITIONS_LINK" value:&stru_1002B4E18 table:@"Localizable"];

  if (sub_100147F28()) {
    v4 = @"rtl";
  }
  else {
    v4 = @"ltr";
  }
  objc_super v5 = v4;
  SEL v6 = +[NSString stringWithFormat:@"<body><p dir=\"%@\" class=\"p1\"><b>%@</b></p><p class=\"p1\"><br></p>", v5, v14, v5];
  id v7 = [v15 stringByReplacingOccurrencesOfString:@"<body>" withString:v6];
  id v8 = v15;
  id v15 = v7;

  id v9 = [v15 stringByReplacingOccurrencesOfString:@"<head>", @"<head><meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no\"/>" withString];
  id v10 = v15;
  id v15 = v9;

  id v11 = v15;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(v16, 0);
  return v11;
}

- (id)titleString
{
  id v2 = +[NSBundle mainBundle];
  v3 = [(NSBundle *)v2 localizedStringForKey:@"TERMS_AND_CONDITIONS" value:&stru_1002B4E18 table:@"Localizable"];

  return v3;
}

- (void)didAgree
{
}

- (unint64_t)licenseVersionDisplayed
{
  return self->_licenseVersionDisplayed;
}

- (void)setLicenseVersionDisplayed:(unint64_t)a3
{
  self->_licenseVersionDisplayed = a3;
}

@end