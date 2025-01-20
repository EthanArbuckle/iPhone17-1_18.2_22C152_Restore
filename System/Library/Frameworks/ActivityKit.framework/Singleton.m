@interface Singleton
+ (_TtC11ActivityKitP33_1602B0B984EDF6E52CE840E80AB3FBCA9Singleton)shared;
+ (_TtC11ActivityKitP33_37102ADAD4FB4DA90D1EB342A548B6909Singleton)shared;
+ (_TtC11ActivityKitP33_53EEA475F928A92791709C064B1A8B959Singleton)shared;
+ (_TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton)shared;
- (_TtC11ActivityKitP33_1602B0B984EDF6E52CE840E80AB3FBCA9Singleton)init;
- (_TtC11ActivityKitP33_37102ADAD4FB4DA90D1EB342A548B6909Singleton)init;
- (_TtC11ActivityKitP33_53EEA475F928A92791709C064B1A8B959Singleton)init;
- (_TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton)init;
- (_TtC11ActivityKitP33_D074D31B035C9B27F4F7807A7D21110D9Singleton)init;
- (id)listenForActivityPresentationWithActivityIdentifier:(id)a3 presenterBundleIdentifier:(id)a4 handler:(id)a5;
- (id)listenForActivityProminenceWithActivityIdentifier:(id)a3 handler:(id)a4;
- (id)listenForActivityQoSWithActivityIdentifier:(id)a3 handler:(id)a4;
- (void)activitiesChanged:(id)a3 completion:(id)a4;
- (void)activityDidExceedReducedPushBudgetForIdentifier:(id)a3;
- (void)activityDidUnsubscribeForIdentifier:(id)a3;
- (void)activityPresentationsDidChange:(id)a3 completion:(id)a4;
- (void)activityProminenceDidChange:(id)a3 completion:(id)a4;
- (void)activityQoSDidChange:(id)a3 completion:(id)a4;
@end

@implementation Singleton

+ (_TtC11ActivityKitP33_1602B0B984EDF6E52CE840E80AB3FBCA9Singleton)shared
{
  if (qword_26B0B8A30 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26B0B88C8;

  return (_TtC11ActivityKitP33_1602B0B984EDF6E52CE840E80AB3FBCA9Singleton *)v2;
}

- (_TtC11ActivityKitP33_1602B0B984EDF6E52CE840E80AB3FBCA9Singleton)init
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B8840);
  MEMORY[0x270FA5388](v2);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void))(v5 + 104))(v4, *MEMORY[0x263F67E20]);
  id v6 = objc_allocWithZone((Class)type metadata accessor for Singleton());
  v7 = (_TtC11ActivityKitP33_1602B0B984EDF6E52CE840E80AB3FBCA9Singleton *)sub_242F2C704((uint64_t)v4);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v7;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton_queue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton_connection));
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)activitiesChanged:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  id v7 = a3;
  v15 = self;
  uint64_t v8 = sub_242FDBBF0();
  unint64_t v10 = v9;

  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v6;
  v12 = (void *)sub_242FDBBD0();
  sub_242F5EE64((uint64_t)v12, &v16);

  uint64_t v13 = v16;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = sub_242F33DE0;
  *(void *)(v14 + 24) = v11;
  uint64_t v16 = v13;
  swift_retain();
  sub_242F2D27C(&v16, 1, (uint64_t)sub_242F33DE8, v14);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  sub_242F26068(v8, v10);
}

+ (_TtC11ActivityKitP33_37102ADAD4FB4DA90D1EB342A548B6909Singleton)shared
{
  if (qword_268D5CA68 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_268D5D608;

  return (_TtC11ActivityKitP33_37102ADAD4FB4DA90D1EB342A548B6909Singleton *)v2;
}

- (_TtC11ActivityKitP33_37102ADAD4FB4DA90D1EB342A548B6909Singleton)init
{
  return (_TtC11ActivityKitP33_37102ADAD4FB4DA90D1EB342A548B6909Singleton *)sub_242F3D760();
}

- (id)listenForActivityPresentationWithActivityIdentifier:(id)a3 presenterBundleIdentifier:(id)a4 handler:(id)a5
{
  id v6 = _Block_copy(a5);
  uint64_t v7 = sub_242FDC0D0();
  uint64_t v9 = v8;
  uint64_t v10 = sub_242FDC0D0();
  uint64_t v12 = v11;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v6;
  uint64_t v14 = self;
  id v15 = sub_242F3F17C(v7, v9, v10, v12, (uint64_t)sub_242F401E0, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return v15;
}

- (void)activityPresentationsDidChange:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  id v7 = a3;
  uint64_t v11 = self;
  uint64_t v8 = sub_242FDBBF0();
  unint64_t v10 = v9;

  _Block_copy(v6);
  sub_242F3FEF0(v8, v10, (uint64_t)v11, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
  sub_242F26068(v8, v10);
}

+ (_TtC11ActivityKitP33_53EEA475F928A92791709C064B1A8B959Singleton)shared
{
  if (qword_268D5BEC8 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_268D5BF08;

  return (_TtC11ActivityKitP33_53EEA475F928A92791709C064B1A8B959Singleton *)v2;
}

- (_TtC11ActivityKitP33_53EEA475F928A92791709C064B1A8B959Singleton)init
{
  return (_TtC11ActivityKitP33_53EEA475F928A92791709C064B1A8B959Singleton *)sub_242F52668();
}

- (id)listenForActivityProminenceWithActivityIdentifier:(id)a3 handler:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = sub_242FDC0D0();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  unint64_t v10 = self;
  id v11 = sub_242F54018(v6, v8, (uint64_t)sub_242F552CC, v9);

  swift_bridgeObjectRelease();
  swift_release();

  return v11;
}

- (void)activityProminenceDidChange:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  id v7 = a3;
  id v11 = self;
  uint64_t v8 = sub_242FDBBF0();
  unint64_t v10 = v9;

  _Block_copy(v6);
  sub_242F55030(v8, v10, (uint64_t)v11, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
  sub_242F26068(v8, v10);
}

- (_TtC11ActivityKitP33_D074D31B035C9B27F4F7807A7D21110D9Singleton)init
{
  return (_TtC11ActivityKitP33_D074D31B035C9B27F4F7807A7D21110D9Singleton *)sub_242F66828();
}

- (void)activityDidExceedReducedPushBudgetForIdentifier:(id)a3
{
  uint64_t v4 = sub_242FDC0D0();
  uint64_t v6 = v5;
  id v7 = self;
  sub_242F67F28(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)activityDidUnsubscribeForIdentifier:(id)a3
{
  uint64_t v4 = sub_242FDC0D0();
  uint64_t v6 = v5;
  id v7 = self;
  uint64_t v8 = sub_242F667C8();
  if (*v9)
  {
    sub_242F6592C(v4, v6);
    ((void (*)(unsigned char *, void))v8)(v10, 0);

    swift_bridgeObjectRelease();
  }
  else
  {
    ((void (*)(unsigned char *, void))v8)(v10, 0);
  }
  swift_bridgeObjectRelease();
}

+ (_TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton)shared
{
  if (qword_268D5CA88 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_268D5E7E8;

  return (_TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton *)v2;
}

- (_TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton)init
{
  return (_TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton *)sub_242FC3B08();
}

- (id)listenForActivityQoSWithActivityIdentifier:(id)a3 handler:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = sub_242FDC0D0();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  unint64_t v10 = self;
  id v11 = sub_242FC54AC(v6, v8, (uint64_t)sub_242F401E0, v9);

  swift_bridgeObjectRelease();
  swift_release();

  return v11;
}

- (void)activityQoSDidChange:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  id v7 = a3;
  id v11 = self;
  uint64_t v8 = sub_242FDBBF0();
  unint64_t v10 = v9;

  _Block_copy(v6);
  sub_242FC681C(v8, v10, (uint64_t)v11, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
  sub_242F26068(v8, v10);
}

@end