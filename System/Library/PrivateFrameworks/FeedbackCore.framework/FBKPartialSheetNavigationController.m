@interface FBKPartialSheetNavigationController
+ (id)detentForCustomHeight:(double)a3;
- (double)customDetentHeight;
- (id)detentForPreferredContentSize;
- (unint64_t)detentBehavior;
- (void)_presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4;
- (void)setCustomDetentHeight:(double)a3;
- (void)setDetentBehavior:(unint64_t)a3;
- (void)viewDidLoad;
@end

@implementation FBKPartialSheetNavigationController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)FBKPartialSheetNavigationController;
  [(FBKPartialSheetNavigationController *)&v3 viewDidLoad];
  [(FBKPartialSheetNavigationController *)self setDetentBehavior:0];
  [(FBKPartialSheetNavigationController *)self setCustomDetentHeight:-1.0];
}

- (void)_presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4
{
  v22[2] = *MEMORY[0x263EF8340];
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    [v6 _setShouldDismissWhenTappedOutside:1];
    v7 = [v6 presentedViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
LABEL_15:

      goto LABEL_16;
    }
    v9 = [v6 presentedViewController];
    v10 = [v9 topViewController];
    objc_opt_class();
    char v11 = objc_opt_isKindOfClass();

    if ((v11 & 1) == 0)
    {
LABEL_14:

      goto LABEL_15;
    }
    unint64_t v12 = [(FBKPartialSheetNavigationController *)self detentBehavior];
    switch(v12)
    {
      case 0uLL:
        goto LABEL_8;
      case 1uLL:
        uint64_t v14 = [MEMORY[0x263F830D0] _mediumDetent];
        break;
      case 2uLL:
        v13 = objc_opt_class();
        [(FBKPartialSheetNavigationController *)self customDetentHeight];
        uint64_t v14 = objc_msgSend(v13, "detentForCustomHeight:");
        break;
      default:
LABEL_8:
        uint64_t v14 = [(FBKPartialSheetNavigationController *)self detentForPreferredContentSize];
        break;
    }
    v15 = (void *)v14;
    if (v14)
    {
      v22[0] = v14;
      v16 = [MEMORY[0x263F830D0] _largeDetent];
      v22[1] = v16;
      v17 = (void *)MEMORY[0x263EFF8C0];
      v18 = (void **)v22;
      uint64_t v19 = 2;
    }
    else
    {
      v16 = [MEMORY[0x263F830D0] _largeDetent];
      v21 = v16;
      v17 = (void *)MEMORY[0x263EFF8C0];
      v18 = &v21;
      uint64_t v19 = 1;
    }
    v20 = objc_msgSend(v17, "arrayWithObjects:count:", v18, v19, v21);
    [v6 _setDetents:v20];

    goto LABEL_14;
  }
LABEL_16:
}

- (void)setCustomDetentHeight:(double)a3
{
  double v4 = -1.0;
  if (a3 > 0.0)
  {
    id v6 = [MEMORY[0x263F82B60] mainScreen];
    [v6 bounds];
    double v8 = v7;

    if (v8 > a3) {
      double v4 = a3;
    }
  }
  self->_customDetentHeight = v4;
}

+ (id)detentForCustomHeight:(double)a3
{
  if (a3 == -1.0)
  {
    id v5 = 0;
  }
  else
  {
    v7[5] = v3;
    uint64_t v8 = v4;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __61__FBKPartialSheetNavigationController_detentForCustomHeight___block_invoke;
    v7[3] = &__block_descriptor_40_e16_d16__0__UIView_8l;
    *(double *)&v7[4] = a3;
    id v5 = [MEMORY[0x263F830D0] _detentWithContainerViewBlock:v7];
  }
  return v5;
}

double __61__FBKPartialSheetNavigationController_detentForCustomHeight___block_invoke(uint64_t a1, void *a2)
{
  double v2 = *(double *)(a1 + 32);
  [a2 bounds];
  return fmin(v2, v3 + -100.0);
}

- (id)detentForPreferredContentSize
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __68__FBKPartialSheetNavigationController_detentForPreferredContentSize__block_invoke;
  v4[3] = &unk_2648761B8;
  v4[4] = self;
  double v2 = [MEMORY[0x263F830D0] _detentWithContainerViewBlock:v4];

  return v2;
}

double __68__FBKPartialSheetNavigationController_detentForPreferredContentSize__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) preferredContentSize];
  return v1;
}

- (unint64_t)detentBehavior
{
  return self->_detentBehavior;
}

- (void)setDetentBehavior:(unint64_t)a3
{
  self->_detentBehavior = a3;
}

- (double)customDetentHeight
{
  return self->_customDetentHeight;
}

@end