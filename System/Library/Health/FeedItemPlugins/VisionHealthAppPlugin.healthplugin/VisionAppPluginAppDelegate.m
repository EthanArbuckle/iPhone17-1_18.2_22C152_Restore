@interface VisionAppPluginAppDelegate
- (_TtC21VisionHealthAppPlugin26VisionAppPluginAppDelegate)init;
- (id)makeDataListViewControllerForHealthStore:(id)a3 displayType:(id)a4 predicate:(id)a5;
@end

@implementation VisionAppPluginAppDelegate

- (_TtC21VisionHealthAppPlugin26VisionAppPluginAppDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VisionAppPluginAppDelegate();
  return [(VisionAppPluginAppDelegate *)&v3 init];
}

- (id)makeDataListViewControllerForHealthStore:(id)a3 displayType:(id)a4 predicate:(id)a5
{
  id v7 = objc_allocWithZone((Class)type metadata accessor for VisionPrescriptionAllDataViewController());
  id v8 = a3;
  id v9 = a5;
  id v10 = sub_241D30164(v8, a5);

  return v10;
}

@end