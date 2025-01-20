@interface AAUIPrintableAccountRecoverySummaryViewFactory
+ (id)createWithContext:(id)a3;
- (AAUIPrintableAccountRecoverySummaryViewFactory)init;
@end

@implementation AAUIPrintableAccountRecoverySummaryViewFactory

+ (id)createWithContext:(id)a3
{
  swift_getObjCClassMetadata();
  id v3 = a3;
  uint64_t v6 = sub_2098BF368();
  v7 = v4;
  swift_getObjCClassMetadata();
  id v9 = static PrintableAccountRecoverySummaryViewFactory.create(context:)(v6, v7);
  swift_bridgeObjectRelease();

  return v9;
}

- (AAUIPrintableAccountRecoverySummaryViewFactory)init
{
  return (AAUIPrintableAccountRecoverySummaryViewFactory *)PrintableAccountRecoverySummaryViewFactory.init()();
}

@end