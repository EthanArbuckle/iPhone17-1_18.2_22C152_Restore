@interface BuddyMandatoryUpdateAboutRowViewModel
+ (id)_makeCurrentVersionRow;
+ (id)_makeRequiredVersionRowWithScanOptions:(id)a3;
+ (id)viewModelsWithScanOptions:(id)a3;
- (BuddyMandatoryUpdateAboutRowViewModel)initWithTitle:(id)a3 detail:(id)a4;
- (NSString)detail;
- (NSString)title;
@end

@implementation BuddyMandatoryUpdateAboutRowViewModel

+ (id)viewModelsWithScanOptions:(id)a3
{
  id v8 = a1;
  v7[1] = (id)a2;
  v7[0] = 0;
  objc_storeStrong(v7, a3);
  id v3 = [v8 _makeCurrentVersionRow];
  v9[0] = v3;
  id v4 = [v8 _makeRequiredVersionRowWithScanOptions:v7[0]];
  v9[1] = v4;
  v5 = +[NSArray arrayWithObjects:v9 count:2];

  objc_storeStrong(v7, 0);

  return v5;
}

- (BuddyMandatoryUpdateAboutRowViewModel)initWithTitle:(id)a3 detail:(id)a4
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v5 = v15;
  id v15 = 0;
  v12.receiver = v5;
  v12.super_class = (Class)BuddyMandatoryUpdateAboutRowViewModel;
  id v15 = [(BuddyMandatoryUpdateAboutRowViewModel *)&v12 init];
  objc_storeStrong(&v15, v15);
  if (v15)
  {
    id v6 = [location[0] copy];
    v7 = (void *)*((void *)v15 + 1);
    *((void *)v15 + 1) = v6;

    id v8 = [v13 copy];
    v9 = (void *)*((void *)v15 + 2);
    *((void *)v15 + 2) = v8;
  }
  v10 = (BuddyMandatoryUpdateAboutRowViewModel *)v15;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v15, 0);
  return v10;
}

+ (id)_makeCurrentVersionRow
{
  Class v7 = (Class)a1;
  location[1] = (id)a2;
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  location[0] = [(NSBundle *)v2 localizedStringForKey:@"MANDATORY_UPDATE_INFO_CURRENT_VERSION" value:&stru_1002B4E18 table:@"MandatorySoftwareUpdate"];

  id v5 = +[BuddyMandatoryUpdateUtilities humanReadableCurrentOSVersion];
  id v3 = [[v7 alloc] initWithTitle:location[0] detail:v5];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);

  return v3;
}

+ (id)_makeRequiredVersionRowWithScanOptions:(id)a3
{
  Class v9 = (Class)a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [(NSBundle *)v3 localizedStringForKey:@"MANDATORY_UPDATE_INFO_REQUIRED_VERSION" value:&stru_1002B4E18 table:@"MandatorySoftwareUpdate"];

  id v6 = +[BuddyMandatoryUpdateUtilities humanReadableOSVersionFromScanOptions:location[0]];
  id v4 = [[v9 alloc] initWithTitle:v7 detail:v6];
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)detail
{
  return self->_detail;
}

- (void).cxx_destruct
{
}

@end