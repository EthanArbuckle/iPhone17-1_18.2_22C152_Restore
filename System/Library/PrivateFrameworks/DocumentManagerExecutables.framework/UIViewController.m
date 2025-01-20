@interface UIViewController
+ (void)doc_performWithDeferredTransitionsAndAnimationsDisabled:(id)a3;
- (BOOL)doc_inWindowPerformingSnapshotting;
- (BOOL)doc_scheduleHandlerIfInLiveResize:(SEL)a3;
- (BOOL)enclosedInUIPDocumentLanding;
- (int64_t)enclosingDocumentLandingMode;
- (int64_t)enclosingTabSwitcherStyle;
- (void)_doc_liveResizeDidEnd;
- (void)doc_addChildViewController:(id)a3 addSubviewBlock:(id)a4;
- (void)doc_addChildWithEqualAutoresizingFrame:(id)a3;
- (void)doc_dismissViewController;
- (void)doc_removeFromParentWithRemoveSubviewBlock:(id)a3;
- (void)registerForTabSwitcherTraitChangesWithHandler:(id)a3;
- (void)registerForUIPDocumentLandingTraitChangesWithHandler:(id)a3;
@end

@implementation UIViewController

- (int64_t)enclosingTabSwitcherStyle
{
  return (int64_t)sub_22BDD99D0(self, (uint64_t)a2, (SEL *)&selRef_enclosingTabSwitcherStyle);
}

- (void)registerForTabSwitcherTraitChangesWithHandler:(id)a3
{
  uint64_t ObjectType = swift_getObjectType();
  v6 = _Block_copy(a3);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v10 = 0;
  char v11 = 1;
  v8 = (void *)swift_allocObject();
  v8[2] = sub_22BE2CBCC;
  v8[3] = v7;
  v8[4] = ObjectType;
  v9 = self;
  sub_22BE91C58();
  UIViewController.registerForUIPTraitChanges<A>(tabStyle:documentLanding:options:_:)(1, 0, &v10, (uint64_t)sub_22BE181A8, (uint64_t)v8, ObjectType);

  swift_release();
  swift_release();

  swift_unknownObjectRelease();
}

- (BOOL)doc_scheduleHandlerIfInLiveResize:(SEL)a3
{
  v3 = self;
  v4 = [(UIViewController *)v3 viewIfLoaded];

  return 0;
}

- (BOOL)enclosedInUIPDocumentLanding
{
  v2 = self;
  char v3 = sub_22BDD9AD0(&qword_26AF003C8);

  return v3 & 1;
}

void __70__UIViewController_DOCAppearanceInheritance___notifyAppearanceChange___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) effectiveAppearanceDidChange:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) viewIfLoaded];
  [v2 _notifyAppearanceChange:*(void *)(a1 + 40)];
}

- (int64_t)enclosingDocumentLandingMode
{
  return (int64_t)sub_22BDD99D0(self, (uint64_t)a2, (SEL *)&selRef_enclosingDocumentLandingMode);
}

- (void)doc_dismissViewController
{
  id v2 = self;
  UIViewController.doc_dismiss(animated:includingPresented:completion:)(1, 1, (uint64_t)nullsub_1, 0);
}

- (void)registerForUIPDocumentLandingTraitChangesWithHandler:(id)a3
{
  uint64_t ObjectType = swift_getObjectType();
  v6 = _Block_copy(a3);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v10 = 0;
  char v11 = 1;
  v8 = (void *)swift_allocObject();
  v8[2] = sub_22BE2CBCC;
  v8[3] = v7;
  v8[4] = ObjectType;
  v9 = self;
  sub_22BE91C58();
  UIViewController.registerForUIPTraitChanges<A>(tabStyle:documentLanding:options:_:)(0, 1, &v10, (uint64_t)sub_22BE181A8, (uint64_t)v8, ObjectType);

  swift_release();
  swift_release();

  swift_unknownObjectRelease();
}

- (BOOL)doc_inWindowPerformingSnapshotting
{
  id v2 = self;
  char v3 = [(UIViewController *)v2 viewIfLoaded];
  if (v3)
  {
    v4 = (UIViewController *)v3;
    unsigned __int8 v5 = [(UIView *)v3 doc_inWindowPerformingSnapshotting];

    id v2 = v4;
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)doc_removeFromParentWithRemoveSubviewBlock:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    *(void *)(swift_allocObject() + 16) = v4;
    unsigned __int8 v5 = sub_22BE341EC;
  }
  else
  {
    unsigned __int8 v5 = 0;
  }
  v6 = self;
  sub_22BE329CC((void (*)(void))v5);
  sub_22BDE0E58((uint64_t)v5);
}

- (void)doc_addChildViewController:(id)a3 addSubviewBlock:(id)a4
{
  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    v6 = (void (*)(void))sub_22BE304F4;
  }
  id v7 = a3;
  v8 = self;
  UIViewController.doc_addChildViewController(_:addSubview:)(v7, v6);
  sub_22BDE0E58((uint64_t)v6);
}

- (void)doc_addChildWithEqualAutoresizingFrame:(id)a3
{
  v4 = (UIViewController *)a3;
  unsigned __int8 v5 = self;
  UIViewController.doc_addChildWithEqualAutoresizingFrame(_:)(v4);
}

+ (void)doc_performWithDeferredTransitionsAndAnimationsDisabled:(id)a3
{
  char v3 = _Block_copy(a3);
  v8[2] = v3;
  uint64_t v4 = self;
  uint64_t v5 = swift_allocObject();
  *(unsigned char *)(v5 + 16) = 0;
  *(void *)(v5 + 24) = sub_22BE2CBBC;
  *(void *)(v5 + 32) = v8;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_22BE34224;
  *(void *)(v6 + 24) = v5;
  aBlock[4] = sub_22BE111C8;
  aBlock[5] = v6;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22BE16ACC;
  aBlock[3] = &block_descriptor_47_0;
  id v7 = _Block_copy(aBlock);
  sub_22BE91C58();
  swift_release();
  objc_msgSend((id)v4, sel__performWithoutDeferringTransitions_, v7);
  _Block_release(v7);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  _Block_release(v3);
  if (v4) {
    __break(1u);
  }
}

- (void)_doc_liveResizeDidEnd
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = self;
  v6[4] = sub_22BE33E88;
  v6[5] = v3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 1107296256;
  v6[2] = sub_22BDD0BA8;
  v6[3] = &block_descriptor_30_3;
  uint64_t v4 = _Block_copy(v6);
  uint64_t v5 = self;
  swift_release();
  DOCRunInMainThread();
  _Block_release(v4);
}

@end