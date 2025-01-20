@interface KBBMetricUtility
+ (BOOL)isValidMetricIdTag:(id)a3 forClass:(Class)a4;
@end

@implementation KBBMetricUtility

+ (BOOL)isValidMetricIdTag:(id)a3 forClass:(Class)a4
{
  uint64_t v4 = qword_1002DC3B8[0];
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(qword_1002DC3B8, &stru_1002884C0);
  }
  v6 = [(id)qword_1002DC3B0 objectForKey:v5];

  return v6 != 0;
}

@end