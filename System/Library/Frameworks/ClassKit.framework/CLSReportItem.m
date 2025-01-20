@interface CLSReportItem
+ (void)endpointServer:(id)a3 willQueryForObjectWithPredicate:(id)a4;
- (BOOL)willBeProcessedByEndpointServer:(id)a3;
@end

@implementation CLSReportItem

- (BOOL)willBeProcessedByEndpointServer:(id)a3
{
  return 1;
}

+ (void)endpointServer:(id)a3 willQueryForObjectWithPredicate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v12 = [v6 database];
  v7 = [v6 daemon];
  v8 = sub_1000830EC([PDFetchReportsOperation alloc], v5, (uint64_t)v12);

  v9 = [v6 client];

  v10 = sub_10000C6B4(v9);
  [v8 setSourceApplicationBundleIdentifier:v10];

  v11 = [v7 operationsManager];
  sub_100111240(v11, v8);
}

@end