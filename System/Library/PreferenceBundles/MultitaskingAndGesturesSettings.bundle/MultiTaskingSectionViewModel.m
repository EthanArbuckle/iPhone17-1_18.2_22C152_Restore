@interface MultiTaskingSectionViewModel
- (_TtC31MultitaskingAndGesturesSettings28MultiTaskingSectionViewModel)init;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation MultiTaskingSectionViewModel

- (_TtC31MultitaskingAndGesturesSettings28MultiTaskingSectionViewModel)init
{
  return (_TtC31MultitaskingAndGesturesSettings28MultiTaskingSectionViewModel *)sub_23510();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v9 = sub_2A4F8();
    uint64_t v11 = v10;
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v16, 0, sizeof(v16));
    id v14 = a5;
    v15 = self;
    if (!a5) {
      goto LABEL_7;
    }
    goto LABEL_4;
  }
  uint64_t v9 = 0;
  uint64_t v11 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v12 = a5;
  v13 = self;
  sub_2A618();
  swift_unknownObjectRelease();
  if (a5)
  {
LABEL_4:
    type metadata accessor for NSKeyValueChangeKey(0);
    sub_297F0(&qword_39458, type metadata accessor for NSKeyValueChangeKey);
    sub_2A498();
  }
LABEL_7:
  sub_29368(v9, v11, (uint64_t)v16);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_9D34((uint64_t)v16);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v3 = (char *)self
     + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings28MultiTaskingSectionViewModel__multitaskingWindowType;
  uint64_t v4 = sub_9134(&qword_3A0A0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self
     + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings28MultiTaskingSectionViewModel__shouldShowRecentAppsInStageManager;
  uint64_t v6 = sub_9134(&qword_39348);
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  v7((char *)self+ OBJC_IVAR____TtC31MultitaskingAndGesturesSettings28MultiTaskingSectionViewModel__shouldShowDockInStageManager, v6);
  v8 = (char *)self + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings28MultiTaskingSectionViewModel__orientation;
  uint64_t v9 = sub_9134(&qword_3A098);
  (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  uint64_t v10 = (char *)self + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings28MultiTaskingSectionViewModel__displayManager;
  uint64_t v11 = sub_9134(&qword_3A090);
  (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  id v12 = (char *)self
      + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings28MultiTaskingSectionViewModel__selectedDisplaySection;
  uint64_t v13 = sub_9134(&qword_3A088);
  id v14 = *(void (**)(char *, uint64_t))(*(void *)(v13 - 8) + 8);

  v14(v12, v13);
}

@end