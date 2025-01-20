@interface LiveSpeechTextView.Coordinator
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)textViewShouldBeginEditing:(id)a3;
- (BOOL)textViewShouldEndEditing:(id)a3;
- (_TtCV19LiveSpeechUIService18LiveSpeechTextView11Coordinator)init;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidChange:(id)a3;
@end

@implementation LiveSpeechTextView.Coordinator

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  return 1;
}

- (void)textViewDidBeginEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_60E34(v4);
}

- (BOOL)textViewShouldEndEditing:(id)a3
{
  return 1;
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  uint64_t v7 = sub_A71D0();
  unint64_t v9 = v8;
  id v10 = a3;
  v11 = self;
  sub_622F8(v10, v7, v9);
  LOBYTE(v7) = v12;

  swift_bridgeObjectRelease();
  return v7 & 1;
}

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_610A8(v4);
}

- (_TtCV19LiveSpeechUIService18LiveSpeechTextView11Coordinator)init
{
  result = (_TtCV19LiveSpeechUIService18LiveSpeechTextView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV19LiveSpeechUIService18LiveSpeechTextView11Coordinator_store));
}

@end