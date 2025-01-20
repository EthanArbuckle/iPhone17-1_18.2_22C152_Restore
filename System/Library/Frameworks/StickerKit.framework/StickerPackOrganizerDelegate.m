@interface StickerPackOrganizerDelegate
- (_TtC10StickerKit28StickerPackOrganizerDelegate)init;
- (id)dragControllerTranscriptDelegate;
- (void)browserAppManagerDidSelectPlugin:(id)a3;
- (void)dismiss;
- (void)openURL:(id)a3 applicationIdentifier:(id)a4 pluginID:(id)a5 completionHandler:(id)a6;
- (void)openURL:(id)a3 pluginID:(id)a4 completionHandler:(id)a5;
- (void)presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 completion:(id)a6;
@end

@implementation StickerPackOrganizerDelegate

- (void)openURL:(id)a3 pluginID:(id)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECEC28);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_2453FCB38();
    uint64_t v12 = sub_2453FCBA8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = sub_2453FCBA8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  if (a4) {
    sub_2453FFB38();
  }
  if (v8)
  {
    v14 = self;
    _Block_release(v8);
  }
  swift_bridgeObjectRelease();
  sub_24525DCF8((uint64_t)v11);
}

- (void)openURL:(id)a3 applicationIdentifier:(id)a4 pluginID:(id)a5 completionHandler:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECEC28);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_2453FCB38();
    uint64_t v14 = sub_2453FCBA8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 0, 1, v14);
  }
  else
  {
    uint64_t v15 = sub_2453FCBA8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v13, 1, 1, v15);
  }
  if (a4) {
    sub_2453FFB38();
  }
  if (a5) {
    sub_2453FFB38();
  }
  v16 = self;
  if (v10) {
    _Block_release(v10);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_24525DCF8((uint64_t)v13);
}

- (void)presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 completion:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  if (a3) {
    sub_2453FFB38();
  }
  if (a4) {
    sub_2453FFB38();
  }
  if (a5) {
    sub_2453FFB38();
  }
  uint64_t v11 = self;
  if (v10) {
    _Block_release(v10);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (id)dragControllerTranscriptDelegate
{
  return 0;
}

- (void)dismiss
{
  v2 = *(void (**)(void))((char *)&self->super.isa
                        + OBJC_IVAR____TtC10StickerKit28StickerPackOrganizerDelegate_requestDismiss);
  v3 = self;
  v2();
}

- (void)browserAppManagerDidSelectPlugin:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_24525DA60(a3);
}

- (_TtC10StickerKit28StickerPackOrganizerDelegate)init
{
  result = (_TtC10StickerKit28StickerPackOrganizerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

@end