@interface ACCAnalytics
+ (id)loggerForUser:(int)a3;
- (void)logACCAnalyticsForEventNamed:(id)a3 withAttributes:(id)a4;
@end

@implementation ACCAnalytics

+ (id)loggerForUser:(int)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___ACCAnalytics;
  v3 = objc_msgSendSuper2(&v5, sel_loggerForUser_, *(void *)&a3);
  return v3;
}

- (void)logACCAnalyticsForEventNamed:(id)a3 withAttributes:(id)a4
{
  if (a4) {
    -[ACCAnalyticsLogger logEventNamed:withAttributes:](self, "logEventNamed:withAttributes:", a3);
  }
}

@end