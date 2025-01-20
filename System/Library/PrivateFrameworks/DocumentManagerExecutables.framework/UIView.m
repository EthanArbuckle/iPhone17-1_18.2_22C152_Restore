@interface UIView
+ (BOOL)swift_docVibrancyFeatureEnabled;
+ (void)doc_performAllowingAnimations:(BOOL)a3 block:(id)a4;
- (BOOL)doc_inWindowPerformingSnapshotting;
- (BOOL)enclosedInUIPDocumentLanding;
- (BOOL)isVibrantContainer;
- (DOCAppearance)effectiveAppearance;
- (UIView)swift_asPrimaryStrokeViewDecoratorEmbeddable;
- (UIView)swift_asSecondaryStrokeViewDecoratorEmbeddable;
- (double)enclosingUIPHorizontalInset;
- (id)_appearance;
- (id)_inheritedAppearance;
- (id)_owningViewController;
- (int64_t)enclosingDocumentLandingMode;
- (int64_t)enclosingTabSwitcherStyle;
- (void)_notifyAppearanceChange:(id)a3;
- (void)doc_configureWithNoPlatter;
- (void)doc_configureWithStandardPlatterWithCornerRadius:(double)a3;
- (void)doc_didMoveToSuperview;
- (void)registerForTabSwitcherTraitChangesWithHandler:(id)a3;
- (void)registerForUIPDocumentLandingTraitChangesWithHandler:(id)a3;
@end

@implementation UIView

- (BOOL)enclosedInUIPDocumentLanding
{
  v2 = self;
  char v3 = sub_22BDD9AD0(&qword_26AF004C8);

  return v3 & 1;
}

void __60__UIView_DOCAppearanceInheritance___notifyAppearanceChange___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "subviews", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        v8 = [v7 _appearance];

        if (!v8) {
          [v7 _notifyAppearanceChange:*(void *)(a1 + 40)];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  [*(id *)(a1 + 32) effectiveAppearanceDidChange:*(void *)(a1 + 40)];
  v9 = [*(id *)(a1 + 32) _owningViewController];
  [v9 effectiveAppearanceDidChange:*(void *)(a1 + 40)];
}

- (void)doc_didMoveToSuperview
{
  [(UIView *)self doc_didMoveToSuperview];
  uint64_t v3 = [(UIView *)self _appearance];

  if (!v3)
  {
    uint64_t v4 = [(UIView *)self effectiveAppearance];
    if (v4) {
      [(UIView *)self _notifyAppearanceChange:v4];
    }
    MEMORY[0x270F9A758]();
  }
}

- (DOCAppearance)effectiveAppearance
{
  uint64_t v3 = [(UIView *)self _appearance];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(UIView *)self _inheritedAppearance];
  }
  v6 = v5;

  return (DOCAppearance *)v6;
}

- (id)_inheritedAppearance
{
  v2 = [(UIView *)self superview];
  if (v2)
  {
    do
    {
      uint64_t v3 = v2;
      uint64_t v4 = [v2 _appearance];
      v2 = [v2 superview];
    }
    while (v2 && !v4);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_appearance
{
  v2 = [(UIView *)self _owningViewController];
  uint64_t v3 = [v2 _appearance];

  return v3;
}

- (id)_owningViewController
{
  return (id)[MEMORY[0x263F82E10] viewControllerForView:self];
}

- (void)_notifyAppearanceChange:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F82E00];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__UIView_DOCAppearanceInheritance___notifyAppearanceChange___block_invoke;
  v7[3] = &unk_2648FB630;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performWithoutAnimation:v7];
}

- (int64_t)enclosingTabSwitcherStyle
{
  return (int64_t)sub_22BDD99D0(self, (uint64_t)a2, (SEL *)&selRef_enclosingTabSwitcherStyle);
}

- (int64_t)enclosingDocumentLandingMode
{
  return (int64_t)sub_22BDD99D0(self, (uint64_t)a2, (SEL *)&selRef_enclosingDocumentLandingMode);
}

- (double)enclosingUIPHorizontalInset
{
  id v1 = a1;
  id v2 = objc_msgSend(v1, sel_traitCollection);
  objc_msgSend(v2, sel_enclosingUIPHorizontalInset);
  double v4 = v3;

  return v4;
}

- (void)doc_configureWithStandardPlatterWithCornerRadius:(double)a3
{
  id v5 = self;
  v7 = self;
  id v6 = objc_msgSend(v5, sel_secondarySystemBackgroundColor);
  [(UIView *)v7 setBackgroundColor:v6];

  if (a3 > 0.0) {
    [(UIView *)v7 _setCornerRadius:a3];
  }
}

- (void)doc_configureWithNoPlatter
{
  double v3 = self;
  double v4 = self;
  id v5 = objc_msgSend(v3, sel_clearColor);
  [(UIView *)v4 setBackgroundColor:v5];
}

- (void)registerForTabSwitcherTraitChangesWithHandler:(id)a3
{
  uint64_t ObjectType = swift_getObjectType();
  id v6 = _Block_copy(a3);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v10 = 0;
  char v11 = 1;
  id v8 = (void *)swift_allocObject();
  v8[2] = sub_22BE2CBCC;
  v8[3] = v7;
  v8[4] = ObjectType;
  v9 = self;
  sub_22BE91C58();
  UIView.registerForUIPTraitChanges<A>(tabStyle:documentLanding:options:_:)(1, 0, &v10, (uint64_t)sub_22BE181A8, (uint64_t)v8, ObjectType);

  swift_release();
  swift_release();

  swift_unknownObjectRelease();
}

- (void)registerForUIPDocumentLandingTraitChangesWithHandler:(id)a3
{
  uint64_t ObjectType = swift_getObjectType();
  id v6 = _Block_copy(a3);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v10 = 0;
  char v11 = 1;
  id v8 = (void *)swift_allocObject();
  v8[2] = sub_22BE2CBBC;
  v8[3] = v7;
  v8[4] = ObjectType;
  v9 = self;
  sub_22BE91C58();
  UIView.registerForUIPTraitChanges<A>(tabStyle:documentLanding:options:_:)(0, 1, &v10, (uint64_t)sub_22BE181A8, (uint64_t)v8, ObjectType);

  swift_release();
  swift_release();

  swift_unknownObjectRelease();
}

- (BOOL)doc_inWindowPerformingSnapshotting
{
  id v2 = self;
  double v3 = [(UIView *)v2 window];
  double v4 = v3;
  if (v3)
  {
    id v5 = [(UIWindow *)v3 windowScene];

    if (v5)
    {
      LOBYTE(v4) = [(UIView *)v5 _isPerformingSystemSnapshot];

      id v2 = v5;
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }

  return (char)v4;
}

+ (void)doc_performAllowingAnimations:(BOOL)a3 block:(id)a4
{
  id v5 = _Block_copy(a4);
  sub_22BE33EE0(a3, (uint64_t)v5);

  _Block_release(v5);
}

+ (BOOL)swift_docVibrancyFeatureEnabled
{
  return 0;
}

- (UIView)swift_asSecondaryStrokeViewDecoratorEmbeddable
{
  return (UIView *)0;
}

- (UIView)swift_asPrimaryStrokeViewDecoratorEmbeddable
{
  return (UIView *)0;
}

- (BOOL)isVibrantContainer
{
  return 0;
}

@end