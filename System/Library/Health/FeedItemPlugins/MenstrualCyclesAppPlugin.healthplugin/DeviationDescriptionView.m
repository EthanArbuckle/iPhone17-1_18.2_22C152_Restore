@interface DeviationDescriptionView
- (_TtC24MenstrualCyclesAppPlugin24DeviationDescriptionView)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin24DeviationDescriptionView)initWithFrame:(CGRect)a3;
- (void)respondToContentSizeChanges;
- (void)updateConstraints;
@end

@implementation DeviationDescriptionView

- (_TtC24MenstrualCyclesAppPlugin24DeviationDescriptionView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2415C99EC();
}

- (void)respondToContentSizeChanges
{
  v2 = self;
  sub_2415C8A94();
}

- (void)updateConstraints
{
  v2 = self;
  sub_2415C8B94();
}

- (_TtC24MenstrualCyclesAppPlugin24DeviationDescriptionView)initWithFrame:(CGRect)a3
{
  result = (_TtC24MenstrualCyclesAppPlugin24DeviationDescriptionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2411F4090(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24DeviationDescriptionView_buttonAction));
  sub_2415C97C4(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24DeviationDescriptionView_configuration), *(void *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24DeviationDescriptionView_configuration), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24DeviationDescriptionView_configuration), *((unsigned char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24DeviationDescriptionView_configuration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24DeviationDescriptionView_textTopAnchor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24DeviationDescriptionView_textLeadingAnchor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24DeviationDescriptionView_exportButtonHeightAnchor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24DeviationDescriptionView_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24DeviationDescriptionView_header));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24DeviationDescriptionView_detail));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24DeviationDescriptionView_imageView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24DeviationDescriptionView____lazy_storage___exportPDFButton);
}

@end