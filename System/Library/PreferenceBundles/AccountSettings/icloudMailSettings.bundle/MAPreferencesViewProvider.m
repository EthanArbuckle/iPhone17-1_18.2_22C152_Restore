@interface MAPreferencesViewProvider
+ (id)getSwiftUIViewWithAccountStore:(id)a3 appleAccount:(id)a4 delegate:(id)a5;
- (_TtC18icloudMailSettings25MAPreferencesViewProvider)init;
@end

@implementation MAPreferencesViewProvider

+ (id)getSwiftUIViewWithAccountStore:(id)a3 appleAccount:(id)a4 delegate:(id)a5
{
  id v8 = objc_allocWithZone((Class)type metadata accessor for MAPreferencesController());
  id v9 = a3;
  id v10 = a4;
  swift_unknownObjectRetain_n();
  id v11 = v9;
  id v12 = v10;
  v13 = (void *)sub_7EA90(v11, v12, (uint64_t)a5);

  swift_unknownObjectRelease();

  return v13;
}

- (_TtC18icloudMailSettings25MAPreferencesViewProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MAPreferencesViewProvider();
  return [(MAPreferencesViewProvider *)&v3 init];
}

@end