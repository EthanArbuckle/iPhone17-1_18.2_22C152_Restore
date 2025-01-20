@interface TapbackPickerSuggestionsDebugModel
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (_TtC7ChatKit34TapbackPickerSuggestionsDebugModel)init;
- (void)textViewDidChange:(id)a3;
@end

@implementation TapbackPickerSuggestionsDebugModel

- (_TtC7ChatKit34TapbackPickerSuggestionsDebugModel)init
{
  result = (_TtC7ChatKit34TapbackPickerSuggestionsDebugModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC7ChatKit34TapbackPickerSuggestionsDebugModel___observationRegistrar;
  uint64_t v4 = sub_18F7B6470();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  sub_18F7B97E0();
  id v7 = a3;
  v8 = self;
  v9 = (void *)sub_18F7B97A0();
  int v10 = CEMStringContainsEmoji();

  swift_bridgeObjectRelease();
  return v10 != 0;
}

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18F4C8DA8(v4);
}

@end