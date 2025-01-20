@interface AXVoiceOverVoiceRotorItem
- (AXCVoiceSelection)selection;
- (AXVoiceOverVoiceRotorItem)init;
- (AXVoiceOverVoiceRotorItem)initWithIdentifier:(id)a3 selection:(id)a4 userDefinedName:(id)a5;
- (NSString)identifier;
- (NSString)userDefinedName;
- (NSString)voiceId;
- (void)setIdentifier:(id)a3;
- (void)setSelection:(id)a3;
- (void)setUserDefinedName:(id)a3;
- (void)setVoiceId:(id)a3;
@end

@implementation AXVoiceOverVoiceRotorItem

- (NSString)identifier
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_18D40A7C8();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v4 = sub_18D40A7F8();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___AXVoiceOverVoiceRotorItem_identifier);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSString)userDefinedName
{
  v2 = (char *)self + OBJC_IVAR___AXVoiceOverVoiceRotorItem_userDefinedName;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_18D40A7C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setUserDefinedName:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_18D40A7F8();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___AXVoiceOverVoiceRotorItem_userDefinedName);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSString)voiceId
{
  v2 = self;
  v3 = [(AXVoiceOverVoiceRotorItem *)v2 selection];
  id v4 = [(AXCVoiceSelection *)v3 voiceId];

  if (v4)
  {
    sub_18D40A7F8();
  }
  else
  {
  }
  uint64_t v5 = (void *)sub_18D40A7C8();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (void)setVoiceId:(id)a3
{
  sub_18D40A7F8();
  id v4 = self;
  uint64_t v5 = [(AXVoiceOverVoiceRotorItem *)v4 selection];
  id v6 = (id)sub_18D40A7C8();
  swift_bridgeObjectRelease();
  [(AXCVoiceSelection *)v5 setVoiceId:v6];
}

- (AXCVoiceSelection)selection
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___AXVoiceOverVoiceRotorItem_selection);
  swift_beginAccess();
  return (AXCVoiceSelection *)*v2;
}

- (void)setSelection:(id)a3
{
  id v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___AXVoiceOverVoiceRotorItem_selection);
  swift_beginAccess();
  uint64_t v5 = *v4;
  *id v4 = a3;
  id v6 = a3;
}

- (AXVoiceOverVoiceRotorItem)initWithIdentifier:(id)a3 selection:(id)a4 userDefinedName:(id)a5
{
  uint64_t v8 = sub_18D40A7F8();
  uint64_t v10 = v9;
  if (a5)
  {
    a5 = (id)sub_18D40A7F8();
    v12 = v11;
  }
  else
  {
    v12 = 0;
  }
  v13 = (id *)((char *)&self->super.isa + OBJC_IVAR___AXVoiceOverVoiceRotorItem_userDefinedName);
  id *v13 = 0;
  v13[1] = 0;
  v14 = (uint64_t *)((char *)self + OBJC_IVAR___AXVoiceOverVoiceRotorItem_identifier);
  uint64_t *v14 = v8;
  v14[1] = v10;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AXVoiceOverVoiceRotorItem_selection) = (Class)a4;
  swift_beginAccess();
  id *v13 = a5;
  v13[1] = v12;
  id v15 = a4;
  swift_bridgeObjectRelease();
  v18.receiver = self;
  v18.super_class = (Class)AXVoiceOverVoiceRotorItem;
  v16 = [(AXVoiceOverVoiceRotorItem *)&v18 init];

  return v16;
}

- (AXVoiceOverVoiceRotorItem)init
{
  result = (AXVoiceOverVoiceRotorItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AXVoiceOverVoiceRotorItem_selection);
}

@end