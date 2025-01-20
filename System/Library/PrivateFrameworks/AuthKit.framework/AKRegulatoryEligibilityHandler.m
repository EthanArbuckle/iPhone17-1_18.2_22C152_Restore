@interface AKRegulatoryEligibilityHandler
+ (id)regulatoryEligibilities;
+ (void)reportRegulatoryEligibilityStatusToIdMS;
@end

@implementation AKRegulatoryEligibilityHandler

+ (id)regulatoryEligibilities
{
  id v11 = 0;
  int all_domain_answers = os_eligibility_get_all_domain_answers();
  if (all_domain_answers)
  {
    int v3 = all_domain_answers;
    v4 = _AKLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10018DF30(v3, v4);
    }
    v5 = 0;
  }
  else
  {
    v4 = objc_alloc_init((Class)NSMutableDictionary);
    v5 = +[NSString ak_base64EncodedJsonFromObject:](NSString, "ak_base64EncodedJsonFromObject:", v4, v7, v8, v9, v10);
  }

  return v5;
}

+ (void)reportRegulatoryEligibilityStatusToIdMS
{
  v2 = +[AKAccountManager sharedInstance];
  int v3 = [v2 primaryAuthKitAccount];
  v4 = _AKLogSystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Triggering liveness to report latest eligibility", v6, 2u);
    }

    v4 = +[AKAppleIDCheckInHelperService sharedService];
    [v4 performCheckInForAccount:v3 event:AKPostDataEventLiveness reason:8 completion:&stru_10022A7F8];
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Skipping regulatory eligibility check since there is no primary AuthKit account", buf, 2u);
  }
}

@end