@interface ATXActionCriteria
+ (id)atx_criteriaWithDictionary:(id)a3;
@end

@implementation ATXActionCriteria

+ (id)atx_criteriaWithDictionary:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"startDate"];
  v5 = sub_10001841C(v4);

  v6 = [v3 objectForKeyedSubscript:@"endDate"];
  v7 = sub_10001841C(v6);

  if (v5 && v7 && [v5 compare:v7] == (id)1)
  {
    v8 = sub_100002EBC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      [v5 timeIntervalSinceReferenceDate];
      uint64_t v10 = v9;
      [v7 timeIntervalSinceReferenceDate];
      int v16 = 134218240;
      uint64_t v17 = v10;
      __int16 v18 = 2048;
      uint64_t v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Start date %f must be before end date %f", (uint8_t *)&v16, 0x16u);
    }

    id v12 = 0;
  }
  else
  {
    v13 = [v3 objectForKeyedSubscript:@"lockScreenEligible"];
    id v14 = [v13 BOOLValue];

    id v12 = [objc_alloc((Class)ATXActionCriteria) initWithStartDate:v5 endDate:v7 lockScreenEligible:v14 predicate:0];
  }

  return v12;
}

@end