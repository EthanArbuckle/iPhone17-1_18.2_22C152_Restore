@interface BYSIMRegionService
- (BYSIMRegionService)init;
- (CoreTelephonyClient)telephonyClient;
- (id)cellularNetworkInformation;
- (id)isoCodeForMCC:(int64_t)a3;
- (id)subregionISOCodesForMCC:(int64_t)a3 MNC:(int64_t)a4;
- (void)logTelephonyError:(id)a3;
- (void)setTelephonyClient:(id)a3;
@end

@implementation BYSIMRegionService

- (BYSIMRegionService)init
{
  SEL v6 = a2;
  id location = 0;
  v5.receiver = self;
  v5.super_class = (Class)BYSIMRegionService;
  id location = [(BYSIMRegionService *)&v5 init];
  objc_storeStrong(&location, location);
  if (location)
  {
    id v2 = [objc_alloc((Class)CoreTelephonyClient) initWithQueue:0];
    [location setTelephonyClient:v2];
  }
  v3 = (BYSIMRegionService *)location;
  objc_storeStrong(&location, 0);
  return v3;
}

- (id)cellularNetworkInformation
{
  v47 = self;
  v46[1] = (id)a2;
  v46[0] = objc_alloc_init((Class)NSMutableArray);
  id location = 0;
  id v2 = [(BYSIMRegionService *)v47 telephonyClient];
  id v43 = 0;
  id v3 = [(CoreTelephonyClient *)v2 getActiveContexts:&v43];
  objc_storeStrong(&location, v43);
  id v44 = v3;

  if (location)
  {
    id v42 = (id)_BYLoggingFacility();
    os_log_type_t v41 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_ERROR))
    {
      sub_10004B238((uint64_t)buf, (uint64_t)location);
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v42, v41, "Unable to get active telephony contexts { error: %@ }", buf, 0xCu);
    }
    objc_storeStrong(&v42, 0);
  }
  memset(__b, 0, sizeof(__b));
  id v4 = [v44 subscriptions];
  id v5 = [v4 countByEnumeratingWithState:__b objects:v49 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)__b[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v5; ++i)
      {
        if (*(void *)__b[2] != v6) {
          objc_enumerationMutation(v4);
        }
        id v40 = *(id *)(__b[1] + 8 * i);
        id v38 = objc_alloc_init(BYCellularNetworkInformation);
        id v8 = objc_alloc((Class)CTXPCServiceSubscriptionContext);
        id v37 = [v8 initWithSlot:[v40 slotID]];
        if (v37)
        {
          objc_storeStrong(&location, 0);
          v9 = [(BYSIMRegionService *)v47 telephonyClient];
          id obj = location;
          id v10 = [(CoreTelephonyClient *)v9 copyMobileSubscriberCountryCode:v37 error:&obj];
          objc_storeStrong(&location, obj);
          id v11 = [v10 integerValue];
          [v38 setHomeMCC:v11];

          [(BYSIMRegionService *)v47 logTelephonyError:location];
          objc_storeStrong(&location, 0);
          v12 = [(BYSIMRegionService *)v47 telephonyClient];
          id v35 = location;
          id v13 = [(CoreTelephonyClient *)v12 copyMobileSubscriberNetworkCode:v37 error:&v35];
          objc_storeStrong(&location, v35);
          id v14 = [v13 integerValue];
          [v38 setHomeMNC:v14];

          [(BYSIMRegionService *)v47 logTelephonyError:location];
          objc_storeStrong(&location, 0);
          v15 = [(BYSIMRegionService *)v47 telephonyClient];
          id v34 = location;
          id v16 = [(CoreTelephonyClient *)v15 copyMobileCountryCode:v37 error:&v34];
          objc_storeStrong(&location, v34);
          id v17 = [v16 integerValue];
          [v38 setNetworkMCC:v17];

          [(BYSIMRegionService *)v47 logTelephonyError:location];
          objc_storeStrong(&location, 0);
          v18 = [(BYSIMRegionService *)v47 telephonyClient];
          id v33 = location;
          id v19 = [(CoreTelephonyClient *)v18 copyMobileNetworkCode:v37 error:&v33];
          objc_storeStrong(&location, v33);
          id v20 = [v19 integerValue];
          [v38 setNetworkMNC:v20];

          [(BYSIMRegionService *)v47 logTelephonyError:location];
          id v21 = -[BYSIMRegionService isoCodeForMCC:](v47, "isoCodeForMCC:", [v38 homeMCC]);
          [v38 setHomeCountryISOCode:v21];

          v22 = v47;
          id v23 = [v38 homeMCC];
          id v24 = -[BYSIMRegionService subregionISOCodesForMCC:MNC:](v22, "subregionISOCodesForMCC:MNC:", v23, [v38 homeMNC]);
          [v38 setHomeSubregionISOCodes:v24];

          id v25 = -[BYSIMRegionService isoCodeForMCC:](v47, "isoCodeForMCC:", [v38 networkMCC]);
          [v38 setNetworkCountryISOCode:v25];

          v26 = v47;
          id v27 = [v38 networkMCC];
          id v28 = -[BYSIMRegionService subregionISOCodesForMCC:MNC:](v26, "subregionISOCodesForMCC:MNC:", v27, [v38 networkMNC]);
          [v38 setNetworkSubregionISOCodes:v28];

          [v46[0] addObject:v38];
        }
        else
        {
          os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            v29 = oslog;
            sub_100046588((uint64_t)v48, (uint64_t)[v40 slotID]);
            _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Unable to find selected context to load telephony network information { slot: %ld }", v48, 0xCu);
          }
          objc_storeStrong((id *)&oslog, 0);
        }
        objc_storeStrong(&v37, 0);
        objc_storeStrong(&v38, 0);
      }
      id v5 = [v4 countByEnumeratingWithState:__b objects:v49 count:16];
    }
    while (v5);
  }

  id v30 = v46[0];
  objc_storeStrong(&v44, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(v46, 0);
  return v30;
}

- (void)logTelephonyError:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_10004B238((uint64_t)buf, (uint64_t)location[0]);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Error reading telephony network information { error: %@ }", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(location, 0);
}

- (id)isoCodeForMCC:(int64_t)a3
{
  id v13 = self;
  location[2] = (id)a2;
  location[1] = (id)a3;
  location[0] = 0;
  id v3 = +[NSNumber numberWithInteger:a3];
  id v11 = [(NSNumber *)v3 stringValue];

  id v4 = [(BYSIMRegionService *)v13 telephonyClient];
  id obj = 0;
  id v5 = [(CoreTelephonyClient *)v4 copyMobileSubscriberIsoCountryCode:v11 error:&obj];
  objc_storeStrong(location, obj);
  id v10 = [v5 uppercaseString];

  if (location[0])
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_100051470((uint64_t)buf, (uint64_t)v11, (uint64_t)location[0]);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Error getting ISO code from MCC: %@, error: %@", buf, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  id v6 = v10;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (id)subregionISOCodesForMCC:(int64_t)a3 MNC:(int64_t)a4
{
  id v19 = self;
  SEL v18 = a2;
  int64_t v17 = a3;
  int64_t v16 = a4;
  id location = 0;
  id v4 = +[NSNumber numberWithInteger:a3];
  id v14 = [(NSNumber *)v4 stringValue];

  id v5 = +[NSNumber numberWithInteger:v16];
  id v13 = [(NSNumber *)v5 stringValue];

  id v6 = [(BYSIMRegionService *)v19 telephonyClient];
  id obj = 0;
  id v7 = [(CoreTelephonyClient *)v6 copyMobileSubscriberIsoSubregionCode:v14 MNC:v13 error:&obj];
  objc_storeStrong(&location, obj);
  id v12 = v7;

  if (location)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_100074894((uint64_t)buf, (uint64_t)v14, (uint64_t)v13, (uint64_t)location);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Error getting subregion ISO code from MCC: %@, MNC: %@, error: %@", buf, 0x20u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  id v8 = v12;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&location, 0);
  return v8;
}

- (CoreTelephonyClient)telephonyClient
{
  return self->_telephonyClient;
}

- (void)setTelephonyClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end