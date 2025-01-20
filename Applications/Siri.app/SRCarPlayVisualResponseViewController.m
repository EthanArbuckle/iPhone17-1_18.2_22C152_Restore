@interface SRCarPlayVisualResponseViewController
- (void)cancelSpeechSynthesis;
- (void)emitInstrumentationEvent:(id)a3;
- (void)hideBackgroundBehindSiri;
- (void)informHostOfBackgroundColor:(id)a3;
- (void)informHostOfBackgroundMaterial:(int64_t)a3;
- (void)informHostOfViewResize:(CGSize)a3;
- (void)navigateWithAceCommand:(id)a3;
- (void)navigateWithResponseData:(id)a3;
- (void)performAceCommand:(id)a3;
- (void)performShowResponse:(id)a3;
- (void)restartSpeechSynthesis;
- (void)scrollViewDidScroll:(id)a3;
- (void)snippetFocusDidChange:(int64_t)a3;
- (void)viewDidLoad;
@end

@implementation SRCarPlayVisualResponseViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100094280();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_aceSnippet));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_pluginSnippet));
  sub_10007E630((uint64_t)self + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_delegate);
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_snippet);
}

- (void)performAceCommand:(id)a3
{
  swift_getObjectType();
  id v5 = a3;
  v6 = self;
  sub_100098AD8((uint64_t)v5, 0, (uint64_t)v6);
}

- (void)performShowResponse:(id)a3
{
  id v4 = a3;
  v8 = self;
  uint64_t v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = v6;

  sub_100095BCC(v5, v7);
  sub_100088E54(v5, v7);
}

- (void)navigateWithResponseData:(id)a3
{
  id v4 = a3;
  v10 = self;
  uint64_t v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = v6;

  if (qword_100170448 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  sub_10007DCA0(v8, (uint64_t)qword_100171AB0);
  os_log_type_t v9 = static os_log_type_t.info.getter();
  sub_1000B2FEC(v9, 0x10uLL, 0xD00000000000001CLL, 0x80000001000FCFE0, 0xD00000000000004ELL, 0x80000001000FCEF0);
  sub_100095BCC(v5, v7);
  sub_100088E54(v5, v7);
}

- (void)navigateWithAceCommand:(id)a3
{
  uint64_t v4 = qword_100170448;
  id v5 = a3;
  uint64_t v8 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_10007DCA0(v6, (uint64_t)qword_100171AB0);
  os_log_type_t v7 = static os_log_type_t.info.getter();
  sub_1000B2FEC(v7, 0x10uLL, 0xD00000000000001ALL, 0x80000001000FCED0, 0xD00000000000004ELL, 0x80000001000FCEF0);
  swift_getObjectType();
  sub_100098AD8((uint64_t)v5, 1, (uint64_t)v8);
}

- (void)informHostOfViewResize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = self;
  sub_100096108(width, height);
}

- (void)informHostOfBackgroundColor:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1000965E4(a3);
}

- (void)informHostOfBackgroundMaterial:(int64_t)a3
{
  uint64_t v4 = self;
  sub_10009683C(a3);
}

- (void)cancelSpeechSynthesis
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_proceedToNextCommandAtSpeechSynthesisEnd) = 0;
  v3 = (char *)self + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v4 = *((void *)v3 + 1);
    swift_getObjectType();
    id v5 = *(void (**)(void))(*(void *)(v4 + 8) + 16);
    uint64_t v6 = self;
    v5();

    swift_unknownObjectRelease();
  }
}

- (void)restartSpeechSynthesis
{
  v3 = (char *)self + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v4 = *((void *)v3 + 1);
    swift_getObjectType();
    id v5 = *(void (**)(void))(*(void *)(v4 + 8) + 48);
    uint64_t v6 = self;
    v5();

    swift_unknownObjectRelease();
  }
}

- (void)snippetFocusDidChange:(int64_t)a3
{
  uint64_t v4 = self;
  sub_100096C80(a3);
}

- (void)emitInstrumentationEvent:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100096E60(v4);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1000993F0();
}

- (void)hideBackgroundBehindSiri
{
  v2 = self;
  sub_1000979EC();
}

@end