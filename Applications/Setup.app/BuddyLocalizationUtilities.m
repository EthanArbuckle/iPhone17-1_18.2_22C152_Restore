@interface BuddyLocalizationUtilities
+ (id)dispositionSpecificLocalizedStringKeyForKey:(id)a3 disposition:(unint64_t)a4;
+ (id)modelSpecificLocalizedStringKeyForKey:(id)a3 deviceClass:(id)a4;
+ (id)siblingDeviceSpecificLocalizedStringKeyForKey:(id)a3 deviceClass:(id)a4;
+ (id)siblingPairDeviceSpecificLocalizedStringKeyForKey:(id)a3 deviceClass:(id)a4;
@end

@implementation BuddyLocalizationUtilities

+ (id)modelSpecificLocalizedStringKeyForKey:(id)a3 deviceClass:(id)a4
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  id v5 = location[0];
  id v6 = [v9 uppercaseString];
  v7 = +[NSString localizedStringWithFormat:@"%@_%@", v5, v6];

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);

  return v7;
}

+ (id)siblingDeviceSpecificLocalizedStringKeyForKey:(id)a3 deviceClass:(id)a4
{
  id v11 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  id v8 = (id)MGCopyAnswer();
  if (([v8 isEqualToString:v9] & 1) == 0 && objc_msgSend(v9, "length"))
  {
    id v12 = [v11 modelSpecificLocalizedStringKeyForKey:location[0] deviceClass:v9];
  }
  else
  {
    id v7 = +[NSString localizedStringWithFormat:@"%@_OTHER", location[0]];
    id v12 = +[UIDevice modelSpecificLocalizedStringKeyForKey:v7];
    objc_storeStrong(&v7, 0);
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  id v5 = v12;

  return v5;
}

+ (id)siblingPairDeviceSpecificLocalizedStringKeyForKey:(id)a3 deviceClass:(id)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  id v11 = (id)MGCopyAnswer();
  if (([v11 isEqualToString:v12] & 1) == 0 && objc_msgSend(v12, "length"))
  {
    id v5 = location[0];
    id v6 = [v11 uppercaseString];
    id v7 = [v12 uppercaseString];
    v14 = +[NSString localizedStringWithFormat:@"%@_%@_%@", v5, v6, v7];
  }
  else
  {
    id v10 = +[NSString localizedStringWithFormat:@"%@_OTHER", location[0]];
    v14 = (NSString *)+[UIDevice modelSpecificLocalizedStringKeyForKey:v10];
    objc_storeStrong(&v10, 0);
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  id v8 = v14;

  return v8;
}

+ (id)dispositionSpecificLocalizedStringKeyForKey:(id)a3 disposition:(unint64_t)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v15 = a4;
  id v14 = (id)BYStringForFlowItemDispositions();
  char v13 = 0;
  char v5 = 0;
  if (a4)
  {
    char v5 = 0;
    if ((v15 & 0x1C) == v15) {
      char v5 = [v14 containsString:@","] ^ 1;
    }
  }
  char v13 = v5 & 1;
  if ((v5 & 1) == 0)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      id v10 = (id)BYStringForFlowItemDispositions();
      sub_10004B238((uint64_t)buf, (uint64_t)v10);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, v11, "Disposition specific localized string key not supported for '%@'", buf, 0xCu);

      objc_storeStrong(&v10, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  id v6 = [v14 uppercaseString];
  id v9 = [v6 stringByReplacingOccurrencesOfString:@" " withString:@"_"];

  id v7 = +[NSString stringWithFormat:@"%@_%@", location[0], v9];
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);

  return v7;
}

@end