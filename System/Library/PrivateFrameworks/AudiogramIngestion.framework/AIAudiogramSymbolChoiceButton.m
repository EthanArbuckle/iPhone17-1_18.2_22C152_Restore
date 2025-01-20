@interface AIAudiogramSymbolChoiceButton
- (_TtC18AudiogramIngestion29AIAudiogramSymbolChoiceButton)initWithCoder:(id)a3;
- (_TtC18AudiogramIngestion29AIAudiogramSymbolChoiceButton)initWithFrame:(CGRect)a3;
@end

@implementation AIAudiogramSymbolChoiceButton

- (_TtC18AudiogramIngestion29AIAudiogramSymbolChoiceButton)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18AudiogramIngestion29AIAudiogramSymbolChoiceButton_percentageOfSymbolSize) = (Class)0x3FC999999999999ALL;
  uint64_t v5 = OBJC_IVAR____TtC18AudiogramIngestion29AIAudiogramSymbolChoiceButton_labelForSymbol;
  id v6 = objc_allocWithZone(MEMORY[0x263F828E0]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC18AudiogramIngestion29AIAudiogramSymbolChoiceButton *)sub_23F121060();
  __break(1u);
  return result;
}

- (_TtC18AudiogramIngestion29AIAudiogramSymbolChoiceButton)initWithFrame:(CGRect)a3
{
  result = (_TtC18AudiogramIngestion29AIAudiogramSymbolChoiceButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18AudiogramIngestion29AIAudiogramSymbolChoiceButton_symbolImage));
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18AudiogramIngestion29AIAudiogramSymbolChoiceButton_labelForSymbol);
}

@end