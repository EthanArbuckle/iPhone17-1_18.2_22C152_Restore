@interface AXVoiceOverNotificationVerbosity
- (AXVoiceOverNotificationVerbosity)initWithCoder:(id)a3;
- (AXVoiceOverNotificationVerbosity)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_useRingerSwitchWithSpec:(id)a3;
- (id)specifiers;
- (void)_setUseRingerSwitchWithValue:(id)a3 spec:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation AXVoiceOverNotificationVerbosity

- (id)specifiers
{
  v2 = self;
  unint64_t v3 = (unint64_t)AXVoiceOverNotificationVerbosity.specifiers()();

  if (v3)
  {
    v4.super.isa = sub_1698E0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return v4.super.isa;
}

- (id)_useRingerSwitchWithSpec:(id)a3
{
  v5 = self;
  id v6 = a3;
  v7 = self;
  id v8 = [v5 sharedInstance];
  [v8 voiceOverUseRingerSwitchToControlNotificationOutput];

  v9 = (void *)sub_169CF0();

  return v9;
}

- (void)_setUseRingerSwitchWithValue:(id)a3 spec:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  v7 = self;
  sub_169B90();
  swift_unknownObjectRelease();
  sub_150CD0((uint64_t)v8);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_168F30();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_168F20();
  id v10 = a3;
  v11 = self;
  AXVoiceOverNotificationVerbosity.tableView(_:didSelectRowAt:)((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8 = sub_168F30();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_168F20();
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  sub_150D8C(v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (AXVoiceOverNotificationVerbosity)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_169880();
    id v6 = a4;
    NSString v7 = sub_169850();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AXVoiceOverNotificationVerbosity();
  uint64_t v9 = [(AXVoiceOverNotificationVerbosity *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (AXVoiceOverNotificationVerbosity)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AXVoiceOverNotificationVerbosity();
  return [(AXVoiceOverNotificationVerbosity *)&v5 initWithCoder:a3];
}

@end