@interface SystemApertureElementViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)attachedMinimalViewRequiresZeroPadding;
- (NSString)associatedAppBundleIdentifier;
- (NSString)associatedScenePersistenceIdentifier;
- (NSString)elementIdentifier;
- (NSURL)launchURL;
- (SBUISystemApertureAccessoryView)leadingView;
- (SBUISystemApertureAccessoryView)minimalView;
- (SBUISystemApertureAccessoryView)trailingView;
- (UIColor)keyColor;
- (_TtC10ChronoCore35SystemApertureElementViewController)initWithCoder:(id)a3;
- (_TtC10ChronoCore35SystemApertureElementViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_timelinesForDateInterval:(id)a3;
- (int64_t)activeLayoutMode;
- (int64_t)contentRole;
- (int64_t)maximumLayoutMode;
- (int64_t)preferredLayoutMode;
- (unint64_t)presentationBehaviors;
- (void)_updateWithFrameSpecifier:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)setActiveLayoutMode:(int64_t)a3;
- (void)setAssociatedAppBundleIdentifier:(id)a3;
- (void)setAssociatedScenePersistenceIdentifier:(id)a3;
- (void)setAttachedMinimalViewRequiresZeroPadding:(BOOL)a3;
- (void)setContentRole:(int64_t)a3;
- (void)setElementIdentifier:(id)a3;
- (void)setLeadingView:(id)a3;
- (void)setMaximumLayoutMode:(int64_t)a3;
- (void)setMinimalView:(id)a3;
- (void)setPreferredLayoutMode:(int64_t)a3;
- (void)setPresentationBehaviors:(unint64_t)a3;
- (void)setTrailingView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3;
@end

@implementation SystemApertureElementViewController

- (int64_t)activeLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_activeLayoutMode);
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_activeLayoutMode) = (Class)a3;
}

- (int64_t)contentRole
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_contentRole);
}

- (void)setContentRole:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_contentRole) = (Class)a3;
}

- (int64_t)preferredLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_preferredLayoutMode);
}

- (void)setPreferredLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_preferredLayoutMode) = (Class)a3;
}

- (int64_t)maximumLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_maximumLayoutMode);
}

- (void)setMaximumLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_maximumLayoutMode) = (Class)a3;
}

- (NSString)associatedScenePersistenceIdentifier
{
  return (NSString *)sub_1DABC13CC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_associatedScenePersistenceIdentifier);
}

- (void)setAssociatedScenePersistenceIdentifier:(id)a3
{
}

- (NSString)associatedAppBundleIdentifier
{
  return (NSString *)sub_1DABC13CC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_associatedAppBundleIdentifier);
}

- (void)setAssociatedAppBundleIdentifier:(id)a3
{
}

- (NSString)elementIdentifier
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_elementIdentifier));
}

- (void)setElementIdentifier:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_elementIdentifier);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_elementIdentifier) = (Class)a3;
  id v3 = a3;
}

- (BOOL)attachedMinimalViewRequiresZeroPadding
{
  return *((unsigned char *)&self->super.super.super.isa
         + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_attachedMinimalViewRequiresZeroPadding);
}

- (void)setAttachedMinimalViewRequiresZeroPadding:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_attachedMinimalViewRequiresZeroPadding) = a3;
}

- (SBUISystemApertureAccessoryView)leadingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_leadingView));
}

- (void)setLeadingView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_leadingView);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_leadingView) = (Class)a3;
  id v3 = a3;
}

- (SBUISystemApertureAccessoryView)trailingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_trailingView));
}

- (void)setTrailingView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_trailingView);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_trailingView) = (Class)a3;
  id v3 = a3;
}

- (SBUISystemApertureAccessoryView)minimalView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_minimalView));
}

- (void)setMinimalView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_minimalView);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_minimalView) = (Class)a3;
  id v3 = a3;
}

- (unint64_t)presentationBehaviors
{
  return *(unint64_t *)((char *)&self->super.super.super.isa
                             + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_presentationBehaviors);
}

- (void)setPresentationBehaviors:(unint64_t)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_presentationBehaviors);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_presentationBehaviors) = (Class)a3;
  if (v3 != a3)
  {
    id v4 = self;
    objc_msgSend(-[SystemApertureElementViewController systemApertureElementContext](v4, sel_systemApertureElementContext), sel_setElementNeedsUpdate);

    swift_unknownObjectRelease();
  }
}

- (NSURL)launchURL
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE438E0);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_1DABC17DC((uint64_t)v5);

  uint64_t v7 = sub_1DAD21E08();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1DAD21D88();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }

  return (NSURL *)v9;
}

- (UIColor)keyColor
{
  v2 = self;
  id v3 = sub_1DABC1A14();

  return (UIColor *)v3;
}

- (_TtC10ChronoCore35SystemApertureElementViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DABC806C();
}

- (void)invalidate
{
  v2 = self;
  sub_1DABC2C48();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = self;
  v8[4] = sub_1DABC96E0;
  v8[5] = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 1107296256;
  v8[2] = sub_1DAB3B83C;
  v8[3] = &block_descriptor_112_0;
  v6 = _Block_copy(v8);
  uint64_t v7 = self;
  swift_unknownObjectRetain();
  swift_release();
  objc_msgSend(a3, sel_animateAlongsideTransition_completion_, v6, 0);
  _Block_release(v6);
  swift_unknownObjectRelease();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1DABC35B8(a3);
}

- (id)_timelinesForDateInterval:(id)a3
{
  uint64_t v4 = sub_1DAD21AF8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DAD21AD8();
  uint64_t v8 = self;
  sub_1DABC3DB8((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_1DA9E142C(0, &qword_1EA8EF880);
  v9 = (void *)sub_1DAD27B28();
  swift_bridgeObjectRelease();

  return v9;
}

- (void)_updateWithFrameSpecifier:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_1DABC4404(a3, (uint64_t)sub_1DABC9658, v7);

  swift_release();
}

- (_TtC10ChronoCore35SystemApertureElementViewController)initWithNibName:(id)a3 bundle:(id)a4
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_elementIdentifier));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_expandedUIHostingController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_leadingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_leadingUIHostingController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_trailingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_trailingUIHostingController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_minimalView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_minimalUIHostingController));
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController__logger;
  uint64_t v4 = sub_1DAD23828();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();

  swift_unknownObjectWeakDestroy();
}

@end