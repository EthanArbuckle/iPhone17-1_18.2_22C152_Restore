@interface NSSQLiteIndexStatisticsRequest
+ (id)indexStatistics;
- (unint64_t)requestType;
@end

@implementation NSSQLiteIndexStatisticsRequest

+ (id)indexStatistics
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (unint64_t)requestType
{
  return 10;
}

@end