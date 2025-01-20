@interface SubmitButtonContainer
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC18ASMessagesProviderP33_9A283CDB21D4766BFE4A1C51D15B048821SubmitButtonContainer)initWithCoder:(id)a3;
- (_TtC18ASMessagesProviderP33_9A283CDB21D4766BFE4A1C51D15B048821SubmitButtonContainer)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SubmitButtonContainer

- (_TtC18ASMessagesProviderP33_9A283CDB21D4766BFE4A1C51D15B048821SubmitButtonContainer)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProviderP33_9A283CDB21D4766BFE4A1C51D15B048821SubmitButtonContainer *)sub_6E3698(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProviderP33_9A283CDB21D4766BFE4A1C51D15B048821SubmitButtonContainer)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18ASMessagesProviderP33_9A283CDB21D4766BFE4A1C51D15B048821SubmitButtonContainer_submitButton) = 0;
  id v4 = a3;

  result = (_TtC18ASMessagesProviderP33_9A283CDB21D4766BFE4A1C51D15B048821SubmitButtonContainer *)sub_77EB20();
  __break(1u);
  return result;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  double v6 = sub_6E68F0();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  swift_unknownObjectRelease();

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.var3 = v16;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_6E38E0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProviderP33_9A283CDB21D4766BFE4A1C51D15B048821SubmitButtonContainer_submitButton));
}

@end