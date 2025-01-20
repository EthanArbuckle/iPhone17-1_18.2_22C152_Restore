@interface JSUserDefaults
- (BOOL)BOOL:(id)a3;
- (_TtC19AppStoreKitInternal14JSUserDefaults)init;
- (id)double:(id)a3;
- (id)integer:(id)a3;
- (id)string:(id)a3;
- (void)setBool:(BOOL)a3 :(id)a4;
- (void)setDouble:(id)a3 :(id)a4;
- (void)setInteger:(id)a3 :(id)a4;
- (void)setString:(id)a3 :(id)a4;
@end

@implementation JSUserDefaults

- (id)string:(id)a3
{
  sub_1E1D5BE58();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal14JSUserDefaults_userDefaults);
  v5 = self;
  v6 = (void *)sub_1E1D5BE18();
  id v7 = objc_msgSend(v4, sel_stringForKey_, v6);

  if (v7)
  {
    sub_1E1D5BE58();

    swift_bridgeObjectRelease();
    v8 = (void *)sub_1E1D5BE18();
  }
  else
  {

    v8 = 0;
  }
  swift_bridgeObjectRelease();
  return v8;
}

- (BOOL)BOOL:(id)a3
{
  sub_1E1D5BE58();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal14JSUserDefaults_userDefaults);
  v5 = self;
  v6 = (void *)sub_1E1D5BE18();
  LOBYTE(v4) = objc_msgSend(v4, sel_BOOLForKey_, v6);

  swift_bridgeObjectRelease();
  return (char)v4;
}

- (id)integer:(id)a3
{
  sub_1E1D5BE58();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal14JSUserDefaults_userDefaults);
  v5 = self;
  v6 = (void *)sub_1E1D5BE18();
  id v7 = objc_msgSend(v4, sel_integerForKey_, v6);

  id v8 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v7);
  swift_bridgeObjectRelease();
  return v8;
}

- (id)double:(id)a3
{
  sub_1E1D5BE58();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal14JSUserDefaults_userDefaults);
  v5 = self;
  v6 = (void *)sub_1E1D5BE18();
  objc_msgSend(v4, sel_doubleForKey_, v6);
  double v8 = v7;

  id v9 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, v8);
  swift_bridgeObjectRelease();
  return v9;
}

- (void)setString:(id)a3 :(id)a4
{
  if (a3)
  {
    sub_1E1D5BE58();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  sub_1E1D5BE58();
  double v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal14JSUserDefaults_userDefaults);
  double v8 = self;
  if (v6) {
    uint64_t v9 = sub_1E1D5BE18();
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = (id)sub_1E1D5BE18();
  objc_msgSend(v7, sel_setObject_forKey_, v9, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

- (void)setBool:(BOOL)a3 :(id)a4
{
  BOOL v4 = a3;
  sub_1E1D5BE58();
  uint64_t v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal14JSUserDefaults_userDefaults);
  double v7 = self;
  id v8 = (id)sub_1E1D5BE18();
  objc_msgSend(v6, sel_setBool_forKey_, v4, v8);

  swift_bridgeObjectRelease();
}

- (void)setInteger:(id)a3 :(id)a4
{
  sub_1E1D5BE58();
  uint64_t v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal14JSUserDefaults_userDefaults);
  id v7 = a3;
  id v8 = self;
  id v9 = objc_msgSend(v7, sel_integerValue);
  id v10 = (id)sub_1E1D5BE18();
  objc_msgSend(v6, sel_setInteger_forKey_, v9, v10);

  swift_bridgeObjectRelease();
}

- (void)setDouble:(id)a3 :(id)a4
{
  sub_1E1D5BE58();
  uint64_t v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal14JSUserDefaults_userDefaults);
  id v7 = a3;
  id v8 = self;
  objc_msgSend(v7, sel_doubleValue);
  double v10 = v9;
  id v11 = (id)sub_1E1D5BE18();
  objc_msgSend(v6, sel_setDouble_forKey_, v11, v10);

  swift_bridgeObjectRelease();
}

- (_TtC19AppStoreKitInternal14JSUserDefaults)init
{
  result = (_TtC19AppStoreKitInternal14JSUserDefaults *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end