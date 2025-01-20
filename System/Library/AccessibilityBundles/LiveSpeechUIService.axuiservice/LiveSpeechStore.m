@interface LiveSpeechStore
- (_TtC19LiveSpeechUIService15LiveSpeechStore)init;
@end

@implementation LiveSpeechStore

- (_TtC19LiveSpeechUIService15LiveSpeechStore)init
{
  result = (_TtC19LiveSpeechUIService15LiveSpeechStore *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC19LiveSpeechUIService15LiveSpeechStore__favoritePhrases;
  uint64_t v4 = sub_7AF4(&qword_DA670);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC19LiveSpeechUIService15LiveSpeechStore__favoritePhraseInfo;
  uint64_t v6 = sub_7AF4(&qword_DA678);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC19LiveSpeechUIService15LiveSpeechStore__categories;
  uint64_t v8 = sub_7AF4(&qword_DA680);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  v9 = (char *)self + OBJC_IVAR____TtC19LiveSpeechUIService15LiveSpeechStore__category;
  uint64_t v10 = sub_7AF4(&qword_DA688);
  (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  v11 = (char *)self + OBJC_IVAR____TtC19LiveSpeechUIService15LiveSpeechStore__phrases;
  uint64_t v12 = sub_7AF4(&qword_DA6A0);
  (*(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  v13 = (char *)self + OBJC_IVAR____TtC19LiveSpeechUIService15LiveSpeechStore__recentMaxCount;
  uint64_t v14 = sub_7AF4(&qword_DA8C8);
  (*(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  v15 = (char *)self + OBJC_IVAR____TtC19LiveSpeechUIService15LiveSpeechStore__presentTextField;
  uint64_t v16 = sub_7AF4(&qword_DA6D8);
  v17 = *(void (**)(char *, uint64_t))(*(void *)(v16 - 8) + 8);
  v17(v15, v16);
  v17((char *)self + OBJC_IVAR____TtC19LiveSpeechUIService15LiveSpeechStore__isEditingPhrase, v16);
  v17((char *)self + OBJC_IVAR____TtC19LiveSpeechUIService15LiveSpeechStore__isFillInPhrase, v16);
  v18 = (char *)self + OBJC_IVAR____TtC19LiveSpeechUIService15LiveSpeechStore__editingPhrase;
  uint64_t v19 = sub_7AF4(&qword_DA8D0);
  (*(void (**)(char *, uint64_t))(*(void *)(v19 - 8) + 8))(v18, v19);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19LiveSpeechUIService15LiveSpeechStore____lazy_storage___callManager));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19LiveSpeechUIService15LiveSpeechStore____lazy_storage___accessManager));
  swift_bridgeObjectRelease();
  v17((char *)self + OBJC_IVAR____TtC19LiveSpeechUIService15LiveSpeechStore__isHUDVisible, v16);
  v20 = (char *)self + OBJC_IVAR____TtC19LiveSpeechUIService15LiveSpeechStore__speechState;
  uint64_t v21 = sub_7AF4(&qword_DA6D0);
  (*(void (**)(char *, uint64_t))(*(void *)(v21 - 8) + 8))(v20, v21);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19LiveSpeechUIService15LiveSpeechStore____lazy_storage___synth));
  v22 = (char *)self + OBJC_IVAR____TtC19LiveSpeechUIService15LiveSpeechStore__currentSpeechContext;
  uint64_t v23 = sub_7AF4(&qword_DA6C8);
  (*(void (**)(char *, uint64_t))(*(void *)(v23 - 8) + 8))(v22, v23);
  v24 = (char *)self + OBJC_IVAR____TtC19LiveSpeechUIService15LiveSpeechStore__lastSpokenContext;
  uint64_t v25 = sub_7AF4(&qword_DA6C0);
  (*(void (**)(char *, uint64_t))(*(void *)(v25 - 8) + 8))(v24, v25);
  v26 = (char *)self + OBJC_IVAR____TtC19LiveSpeechUIService15LiveSpeechStore__lastWillReplaySpeechDate;
  uint64_t v27 = sub_7AF4(&qword_D9DF8);
  (*(void (**)(char *, uint64_t))(*(void *)(v27 - 8) + 8))(v26, v27);
  v28 = (char *)self + OBJC_IVAR____TtC19LiveSpeechUIService15LiveSpeechStore__queuedText;
  uint64_t v29 = sub_7AF4(&qword_DA6B8);
  (*(void (**)(char *, uint64_t))(*(void *)(v29 - 8) + 8))(v28, v29);
  v30 = (char *)self + OBJC_IVAR____TtC19LiveSpeechUIService15LiveSpeechStore__inputMode;
  uint64_t v31 = sub_7AF4(&qword_DA6B0);
  v32 = *(void (**)(char *, uint64_t))(*(void *)(v31 - 8) + 8);

  v32(v30, v31);
}

@end