@interface ContactChangeManager
- (_TtC20FaceTimeMessageStore20ContactChangeManager)init;
- (void)contactStoreDidChange:(id)a3;
- (void)visitAddContactEvent:(id)a3;
- (void)visitDeleteContactEvent:(id)a3;
- (void)visitDropEverythingEvent:(id)a3;
- (void)visitUpdateContactEvent:(id)a3;
@end

@implementation ContactChangeManager

- (void)contactStoreDidChange:(id)a3
{
  uint64_t v4 = sub_24DF1E160();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24DF1E140();
  v8 = self;
  sub_24DEBF130();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC20FaceTimeMessageStore20ContactChangeManager)init
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20FaceTimeMessageStore20ContactChangeManager_contactStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20FaceTimeMessageStore20ContactChangeManager_userDefaults));
  v3 = (char *)self + OBJC_IVAR____TtC20FaceTimeMessageStore20ContactChangeManager_delegate;
  sub_24DE2A720((uint64_t)v3);
}

- (void)visitDropEverythingEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_24DEC032C();
}

- (void)visitAddContactEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_24DEC0488(v4);
}

- (void)visitUpdateContactEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_24DEC0714(v4);
}

- (void)visitDeleteContactEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_24DEC09D8(v4);
}

@end