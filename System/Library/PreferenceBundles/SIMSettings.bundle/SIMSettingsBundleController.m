@interface SIMSettingsBundleController
- (id)specifiersWithSpecifier:(id)a3;
@end

@implementation SIMSettingsBundleController

- (id)specifiersWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray array];
  uint64_t v6 = PSBundlePathKey;
  uint64_t v35 = PSBundlePathKey;
  CFStringRef v36 = @"SIMPasscodeTelephonySettings";
  v7 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
  v32 = v7;
  CFStringRef v33 = @"items";
  v8 = +[NSArray arrayWithObjects:&v32 count:1];
  v34 = v8;
  v9 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  v10 = (id *)&self->PSBundleController_opaque[OBJC_IVAR___PSBundleController__parent];
  id v11 = objc_loadWeakRetained(v10);
  v12 = [v11 bundle];
  id WeakRetained = objc_loadWeakRetained(v10);
  uint64_t v24 = 0;
  v26 = v4;
  v14 = SpecifiersFromPlist();

  if (v14) {
    objc_msgSend(v5, "addObjectsFromArray:", v14, 0);
  }
  uint64_t v30 = v6;
  CFStringRef v31 = @"SIMApplicationsTelephonySettings";
  v15 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1, v24);

  v27 = v15;
  CFStringRef v28 = @"items";
  v16 = +[NSArray arrayWithObjects:&v27 count:1];
  v29 = v16;
  v17 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  id v18 = objc_loadWeakRetained(v10);
  v19 = [v18 bundle];
  id v20 = objc_loadWeakRetained(v10);
  uint64_t v25 = 0;
  v21 = SpecifiersFromPlist();

  if (v21) {
    objc_msgSend(v5, "addObjectsFromArray:", v21, 0);
  }
  if (objc_msgSend(v5, "count", v25))
  {
    v22 = +[PSSpecifier emptyGroupSpecifier];
    [v5 insertObject:v22 atIndex:0];
  }

  return v5;
}

@end