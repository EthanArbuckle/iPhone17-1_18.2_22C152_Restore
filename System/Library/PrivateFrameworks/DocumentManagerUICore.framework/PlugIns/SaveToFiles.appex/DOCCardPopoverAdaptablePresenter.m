@interface DOCCardPopoverAdaptablePresenter
- (_TtC11SaveToFiles32DOCCardPopoverAdaptablePresenter)init;
- (void)_presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4;
- (void)prepareForPopoverPresentation:(id)a3;
- (void)presentationControllerWillDismiss:(id)a3;
@end

@implementation DOCCardPopoverAdaptablePresenter

- (void)prepareForPopoverPresentation:(id)a3
{
  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC11SaveToFiles32DOCCardPopoverAdaptablePresenter_activePresentationController);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC11SaveToFiles32DOCCardPopoverAdaptablePresenter_activePresentationController) = (Class)a3;
  id v6 = a3;
  v5 = self;
  sub_100069278(v4);
}

- (void)_presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4
{
  id v6 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC11SaveToFiles32DOCCardPopoverAdaptablePresenter_activePresentationController);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC11SaveToFiles32DOCCardPopoverAdaptablePresenter_activePresentationController) = (Class)a4;
  id v9 = a4;
  id v7 = a3;
  v8 = self;
  sub_100069278(v6);
}

- (void)presentationControllerWillDismiss:(id)a3
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC11SaveToFiles32DOCCardPopoverAdaptablePresenter_isActivelyPresentingPopover) = 0;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v6 = (void *)Strong;
    id v7 = a3;
    v8 = self;
    [v6 setIsActivePopoverSource:0];

    swift_unknownObjectRelease();
  }
}

- (_TtC11SaveToFiles32DOCCardPopoverAdaptablePresenter)init
{
  return (_TtC11SaveToFiles32DOCCardPopoverAdaptablePresenter *)sub_100069644();
}

- (void).cxx_destruct
{
  sub_10003BA48((uint64_t)self + OBJC_IVAR____TtC11SaveToFiles32DOCCardPopoverAdaptablePresenter_presentationSource);
  sub_10003B980(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11SaveToFiles32DOCCardPopoverAdaptablePresenter_willPresentPopoverHandler));
  sub_10003B980(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11SaveToFiles32DOCCardPopoverAdaptablePresenter_willPresentCardHandler));
  sub_10003BA70((uint64_t)self + OBJC_IVAR____TtC11SaveToFiles32DOCCardPopoverAdaptablePresenter_ppcDismissObserance);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SaveToFiles32DOCCardPopoverAdaptablePresenter_activePresentationController));
  swift_unknownObjectWeakDestroy();
}

@end