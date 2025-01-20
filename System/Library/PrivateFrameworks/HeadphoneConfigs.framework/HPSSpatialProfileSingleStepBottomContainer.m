@interface HPSSpatialProfileSingleStepBottomContainer
- (OBBoldTrayButton)continueButton;
- (OBHeaderView)infoView;
- (UILabel)learnMoreView;
- (UIScrollView)scrollView;
- (UIStackView)stackContainerView;
- (UIView)buttonTray;
- (UIView)spacerViewFirst;
- (UIView)spacerViewSecond;
- (UIVisualEffectView)buttonTrayEffectView;
- (_TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer)initWithBudsInEarString:(id)a3;
- (_TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer)initWithCoder:(id)a3;
- (_TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer)initWithFrame:(CGRect)a3;
- (void)moveToEnrollmentFromStep:(int)a3 toStep:(int)a4;
- (void)moveToEnrollmentFromStep:(int)a3 toStep:(int)a4 animateInAlongSide:(id *)a5 animateOutAlongSide:(id *)a6 animatedCompletion:(id)a7;
- (void)moveToEnrollmentFromStep:(int)a3 toStep:(int)a4 completionAction:(id)a5;
- (void)showContinueButton:(BOOL)a3;
- (void)updateContinueButtonActionWithTarget:(id)a3 selector:(SEL)a4;
- (void)updateContinueButtonTitleWithTitle:(id)a3;
@end

@implementation HPSSpatialProfileSingleStepBottomContainer

- (OBHeaderView)infoView
{
  return (OBHeaderView *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa
                                                                            + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl)
                                                                 + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_infoView));
}

- (UIView)spacerViewFirst
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa
                                                                      + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl)
                                                           + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_spacerViewFirst));
}

- (UILabel)learnMoreView
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa
                                                                       + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl)
                                                            + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_learnMoreView));
}

- (UIView)spacerViewSecond
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa
                                                                      + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl)
                                                           + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_spacerViewSecond));
}

- (UIVisualEffectView)buttonTrayEffectView
{
  return (UIVisualEffectView *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa
                                                                                  + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl)
                                                                       + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_buttonTrayEffectView));
}

- (OBBoldTrayButton)continueButton
{
  return (OBBoldTrayButton *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa
                                                                                + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl)
                                                                     + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_continueButton));
}

- (UIView)buttonTray
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa
                                                                      + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl)
                                                           + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_buttonTray));
}

- (UIStackView)stackContainerView
{
  return (UIStackView *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa
                                                                           + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl)
                                                                + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_stackContainerView));
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa
                                                                            + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl)
                                                                 + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_scrollView));
}

- (_TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer)initWithBudsInEarString:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  return (_TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer *)sub_1E4CA7C3C((uint64_t)sub_1E4CACCA0, v4);
}

- (void)showContinueButton:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1E4CA7EE4(a3);
}

- (void)updateContinueButtonActionWithTarget:(id)a3 selector:(SEL)a4
{
  swift_unknownObjectRetain();
  v7 = self;
  sub_1E4CA7FCC((uint64_t)a3, (uint64_t)a4);
  swift_unknownObjectRelease();
}

- (void)updateContinueButtonTitleWithTitle:(id)a3
{
  sub_1E4CBF1F0();
  uint64_t v4 = self;
  sub_1E4CA8128();

  swift_bridgeObjectRelease();
}

- (void)moveToEnrollmentFromStep:(int)a3 toStep:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  v6 = *(void (**)(uint64_t, uint64_t, void, void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.super.isa)
                                                               + 0x138);
  v7 = self;
  v6(v5, v4, 0, 0);
}

- (void)moveToEnrollmentFromStep:(int)a3 toStep:(int)a4 completionAction:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  v8 = _Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    v8 = sub_1E4C7D398;
  }
  else
  {
    uint64_t v9 = 0;
  }
  v10 = *(void (**)(uint64_t, uint64_t, void, void, void *, uint64_t))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.super.isa)
                                                                                 + 0x140);
  v11 = self;
  v10(v6, v5, 0, 0, v8, v9);
  sub_1E4C879AC((uint64_t)v8);
}

- (void)moveToEnrollmentFromStep:(int)a3 toStep:(int)a4 animateInAlongSide:(id *)a5 animateOutAlongSide:(id *)a6 animatedCompletion:(id)a7
{
  v12 = _Block_copy(a7);
  if (v12)
  {
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v12;
    v12 = sub_1E4C7D020;
  }
  else
  {
    uint64_t v13 = 0;
  }
  v14 = self;
  sub_1E4CA84C4(a3, a4, a5, a6, (uint64_t)v12, v13);
  sub_1E4C879AC((uint64_t)v12);
}

- (_TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E4CAC6A4();
}

- (_TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer)initWithFrame:(CGRect)a3
{
  result = (_TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl));

  swift_release();
}

@end