@interface HeadphoneDigitalEngravingManager
- (_TtC18SharingViewService32HeadphoneDigitalEngravingManager)init;
- (id)fetchEngravingDataHandler;
- (void)deviceDidConnect:(id)a3;
- (void)setFetchEngravingDataHandler:(id)a3;
@end

@implementation HeadphoneDigitalEngravingManager

- (id)fetchEngravingDataHandler
{
  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18SharingViewService32HeadphoneDigitalEngravingManager_fetchEngravingDataHandler))
  {
    uint64_t v2 = *(void *)&self->localStorage[OBJC_IVAR____TtC18SharingViewService32HeadphoneDigitalEngravingManager_fetchEngravingDataHandler];
    v5[4] = *(Class *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18SharingViewService32HeadphoneDigitalEngravingManager_fetchEngravingDataHandler);
    v5[5] = v2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_1000BF970;
    v5[3] = &unk_10019FCB0;
    v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setFetchEngravingDataHandler:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_1000C1098;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))((char *)self
                                                          + OBJC_IVAR____TtC18SharingViewService32HeadphoneDigitalEngravingManager_fetchEngravingDataHandler);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC18SharingViewService32HeadphoneDigitalEngravingManager_fetchEngravingDataHandler);
  *v7 = v6;
  v7[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v4;

  sub_100017C38(v8);
}

- (_TtC18SharingViewService32HeadphoneDigitalEngravingManager)init
{
  return (_TtC18SharingViewService32HeadphoneDigitalEngravingManager *)sub_1000BFC78();
}

- (void)deviceDidConnect:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1000BFDA0(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18SharingViewService32HeadphoneDigitalEngravingManager_localStorage));
  swift_release();
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC18SharingViewService32HeadphoneDigitalEngravingManager_fetchEngravingDataHandler);

  sub_100017C38(v3);
}

@end