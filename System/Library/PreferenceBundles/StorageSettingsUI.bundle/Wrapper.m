@interface Wrapper
+ (id)hostingControllerWithParentController:(id)a3;
- (_TtC17StorageSettingsUI7Wrapper)init;
@end

@implementation Wrapper

+ (id)hostingControllerWithParentController:(id)a3
{
  uint64_t v3 = qword_A2C28;
  id v4 = a3;
  if (v3 != -1) {
    swift_once();
  }
  [v4 setDelegate:qword_A6A70];
  id v5 = objc_allocWithZone((Class)sub_14F50(&qword_A4538));
  v6 = (void *)sub_76550();

  return v6;
}

- (_TtC17StorageSettingsUI7Wrapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Wrapper();
  return [(Wrapper *)&v3 init];
}

@end