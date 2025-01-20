@interface BuddyDeviceManagementProvider
- (void)loadSkipKeys:(id)a3;
@end

@implementation BuddyDeviceManagementProvider

- (void)loadSkipKeys:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = objc_alloc_init((Class)DMFFetchDevicePropertiesRequest);
  uint64_t v13 = DMFDeviceSkippedSetupPanesKey;
  v3 = +[NSArray arrayWithObjects:&v13 count:1];
  [v11 setPropertyKeys:v3];

  id v4 = +[DMFConnection systemConnection];
  v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  v8 = sub_1000D6670;
  v9 = &unk_1002B2978;
  id v10 = location[0];
  [v4 performRequest:v11 completion:&v5];

  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

@end