@interface CSLUILayoutViewController
- (CSLUILayoutViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UILabel)nameLabel;
- (double)defaultPixelDiameter;
- (id)createIconViewWithBundleIdentifier:(id)a3;
- (void)createFieldOfIconsView;
- (void)iconsEdited;
- (void)resetIconPositions;
- (void)setNameLabel:(id)a3;
- (void)showConfirmationAlert;
- (void)store:(id)a3 updatedIconGraph:(id)a4;
- (void)updatedIconGraph:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CSLUILayoutViewController

- (CSLUILayoutViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CSLUILayoutViewController;
  v8 = [(CSLUILayoutViewController *)&v17 initWithNibName:v6 bundle:v7];
  if (v8)
  {
    v9 = objc_alloc_init(CSLIconPositionsStore);
    iconPositionsStore = v8->_iconPositionsStore;
    v8->_iconPositionsStore = v9;

    uint64_t v11 = [(CSLIconPositionsStore *)v8->_iconPositionsStore loadPositions];
    iconGraph = v8->_iconGraph;
    v8->_iconGraph = (CSLHexAppGraph *)v11;

    [(CSLIconPositionsStore *)v8->_iconPositionsStore setDelegate:v8];
    v13 = cslprf_icon_field_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      if (v8->_iconGraph) {
        v14 = "";
      }
      else {
        v14 = "not ";
      }
      *(_DWORD *)buf = 136446210;
      v19 = v14;
      _os_log_impl(&def_1AB14, v13, OS_LOG_TYPE_INFO, "initial icon positions %{public}sloaded", buf, 0xCu);
    }

    v15 = sub_B5D0(@"CSL_LAYOUT_NAV_TITLE");
    [(CSLUILayoutViewController *)v8 setTitle:v15];
  }
  return v8;
}

- (void)viewDidLoad
{
  v29.receiver = self;
  v29.super_class = (Class)CSLUILayoutViewController;
  [(CSLUILayoutViewController *)&v29 viewDidLoad];
  if (MGGetBoolAnswer())
  {
    id v3 = objc_alloc((Class)UIBarButtonItem);
    v4 = sub_B5D0(@"CSL_LAYOUT_INTERNAL_RESET_BUTTON");
    id v5 = [v3 initWithTitle:v4 style:0 target:self action:"showConfirmationAlert"];

    id v6 = [(CSLUILayoutViewController *)self navigationItem];
    [v6 setRightBarButtonItem:v5];
  }
  id v7 = [(CSLUILayoutViewController *)self view];
  v8 = +[UIColor blackColor];
  [v7 setBackgroundColor:v8];

  [v7 setClipsToBounds:1];
  id v9 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:101];
  [v9 setHidesWhenStopped:1];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 addSubview:v9];
  objc_storeWeak((id *)&self->_spinner, v9);
  v10 = +[NSLayoutConstraint constraintWithItem:v9 attribute:9 relatedBy:0 toItem:v7 attribute:9 multiplier:1.0 constant:0.0];
  [v7 addConstraint:v10];

  uint64_t v11 = +[NSLayoutConstraint constraintWithItem:v9 attribute:10 relatedBy:0 toItem:v7 attribute:10 multiplier:1.0 constant:0.0];
  [v7 addConstraint:v11];

  [(CSLUILayoutViewController *)self updatedIconGraph:self->_iconGraph];
  id v12 = objc_alloc((Class)UINavigationBarAppearance);
  v13 = [(CSLUILayoutViewController *)self navigationController];
  v14 = [v13 navigationBar];
  v15 = [v14 standardAppearance];
  id v16 = [v12 initWithBarAppearance:v15];

  objc_super v17 = +[UIBlurEffect effectWithStyle:18];
  [v16 setBackgroundEffect:v17];

  v18 = [(CSLUILayoutViewController *)self navigationItem];
  [v18 setScrollEdgeAppearance:v16];

  id v19 = objc_alloc((Class)UITabBarAppearance);
  v20 = [(CSLUILayoutViewController *)self navigationController];
  v21 = [v20 tabBarController];
  v22 = [v21 tabBar];
  v23 = [v22 standardAppearance];
  id v24 = [v19 initWithBarAppearance:v23];

  v25 = +[UIBlurEffect effectWithStyle:18];
  [v24 setBackgroundEffect:v25];

  v26 = [(CSLUILayoutViewController *)self navigationController];
  v27 = [v26 tabBarController];
  v28 = [v27 tabBar];
  [v28 setScrollEdgeAppearance:v24];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CSLUILayoutViewController;
  [(CSLUILayoutViewController *)&v7 viewWillDisappear:a3];
  v4 = [(CSLUILayoutViewController *)self navigationController];
  id v5 = [v4 tabBarController];
  id v6 = [v5 tabBar];
  [v6 setScrollEdgeAppearance:0];
}

- (void)store:(id)a3 updatedIconGraph:(id)a4
{
}

- (void)updatedIconGraph:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_spinner);
    [WeakRetained stopAnimating];

    id v7 = objc_loadWeakRetained((id *)&self->_fieldOfIconsView);
    p_iconGraph = &self->_iconGraph;
    if (v7)
    {
      id v9 = [(CSLHexAppGraph *)*p_iconGraph changeToMatch:v5];
    }
    else
    {
      objc_storeStrong((id *)p_iconGraph, a3);
      if ([(CSLUILayoutViewController *)self isViewLoaded]) {
        [(CSLUILayoutViewController *)self createFieldOfIconsView];
      }
    }
  }
  else
  {
    v10 = cslprf_icon_field_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&def_1AB14, v10, OS_LOG_TYPE_INFO, "spinner started", v13, 2u);
    }

    id v11 = objc_loadWeakRetained((id *)&self->_fieldOfIconsView);
    [v11 removeFromSuperview];

    objc_storeWeak((id *)&self->_fieldOfIconsView, 0);
    id v12 = objc_loadWeakRetained((id *)&self->_spinner);
    [v12 startAnimating];
  }
}

- (void)createFieldOfIconsView
{
  id v3 = [(CSLUILayoutViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 safeAreaInsets];
  double v14 = v9 - (v12 + v13);
  double v17 = v11 - (v15 + v16);
  v18 = -[CSLUIFieldOfIconsView initWithFrame:iconGraph:viewFactory:options:]([CSLUIFieldOfIconsView alloc], "initWithFrame:iconGraph:viewFactory:options:", self->_iconGraph, self, 394, v5 + v12, v7 + v15, v14, v17);
  [(CSLUIFieldOfIconsView *)v18 setActionDelegate:self];
  [v3 addSubview:v18];
  objc_storeWeak((id *)&self->_fieldOfIconsView, v18);
  id v19 = [CSLScrollableUniformHexLayout alloc];
  float v20 = round((v14 + -60.0) * 0.5) * 0.5;
  __asm { FMOV            V1.2S, #3.0 }
  v35[0] = vdup_n_s32(0x3EAAAAABu);
  v35[1] = _D1;
  __asm
  {
    FMOV            V10.2S, #0.25
    FMOV            V0.2S, #1.0
  }
  v35[2] = _D10;
  v35[3] = _D0;
  float v36 = v20;
  v28 = +[UIScreen mainScreen];
  [v28 scale];
  *(float *)&double v29 = v29;
  int v37 = LODWORD(v29);
  *(float *)&uint64_t v30 = v14;
  float v31 = v17;
  *((float *)&v30 + 1) = v31;
  uint64_t v38 = v30;
  float v32 = 1.0;
  if ((int)v20 >= 35) {
    float v32 = (float)((int)v20 / 0x23u);
  }
  float v39 = (float)((float)(v20 * 0.5) + 2.5) + (float)(v32 * 5.0);
  float32x2_t v33 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v29, 0);
  float32x2_t v40 = vdiv_f32(vrndm_f32(vmul_n_f32(vmul_n_f32((float32x2_t)vdup_n_s32(0x3EAAAAABu), v39), *(float *)&v29)), v33);
  float32x2_t v41 = vdiv_f32(vrndm_f32(vmul_n_f32(vmul_n_f32(_D10, v39), *(float *)&v29)), v33);
  v34 = [(CSLUniformHexLayout *)v19 initWithConfiguration:v35];
  [(CSLUIFieldOfIconsView *)v18 setLayout:v34 percentComplete:0 animated:394 options:0.0];
}

- (void)resetIconPositions
{
  uint64_t v3 = [(CSLIconPositionsStore *)self->_iconPositionsStore loadDefaultPositionsVerticalOnly:[(CSLHexAppGraph *)self->_iconGraph isVerticalOnly]];
  iconGraph = self->_iconGraph;
  id v8 = (id)v3;
  if (iconGraph)
  {
    [(CSLHexAppGraph *)iconGraph resetToDefaults:v3];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fieldOfIconsView);
    double v6 = [WeakRetained layout];
    objc_msgSend(v6, "setContentOffset:", CGPointZero.x, CGPointZero.y);

    id v7 = objc_loadWeakRetained((id *)&self->_fieldOfIconsView);
    [v7 layoutAnimated:1];

    uint64_t v3 = (uint64_t)self->_iconGraph;
  }
  [(CSLIconPositionsStore *)self->_iconPositionsStore savePositions:v3];
}

- (void)showConfirmationAlert
{
  uint64_t v3 = sub_B5D0(@"RESET_GRID_VIEW_ARRANGEMENT_ALERT_TITLE");
  double v4 = sub_B5D0(@"RESET_GRID_VIEW_ARRANGEMENT_ALERT_MESSAGE");
  double v5 = +[UIAlertController alertControllerWithTitle:v3 message:v4 preferredStyle:1];

  double v6 = sub_B5D0(@"RESET_GRID_VIEW_ARRANGEMENT_ALERT_PRIMARY_ACTION");
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_C274;
  v10[3] = &unk_3CB10;
  v10[4] = self;
  id v7 = +[UIAlertAction actionWithTitle:v6 style:0 handler:v10];

  id v8 = sub_B5D0(@"RESET_GRID_VIEW_ARRANGEMENT_ALERT_CANCEL");
  double v9 = +[UIAlertAction actionWithTitle:v8 style:1 handler:0];

  [v5 addAction:v9];
  [v5 addAction:v7];
  [(CSLUILayoutViewController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)iconsEdited
{
  if (self->_iconGraph)
  {
    -[CSLIconPositionsStore savePositions:](self->_iconPositionsStore, "savePositions:");
    if (os_variant_has_internal_diagnostics())
    {
      iconPositionsStore = self->_iconPositionsStore;
      iconGraph = self->_iconGraph;
      [(CSLIconPositionsStore *)iconPositionsStore archivePositionsToDiagnostics:iconGraph];
    }
  }
}

- (id)createIconViewWithBundleIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:kClockBundleIdentifier])
  {
    double v4 = &off_3C4C8;
LABEL_5:
    double v5 = (CSLUINanoResourceGrabberIconView *)objc_alloc_init(*v4);
    goto LABEL_7;
  }
  if ([v3 isEqualToString:kCalendarBundleIdentifier])
  {
    double v4 = off_3C4C0;
    goto LABEL_5;
  }
  double v5 = [[CSLUINanoResourceGrabberIconView alloc] initWithBundleID:v3];
LABEL_7:
  double v6 = v5;

  return v6;
}

- (double)defaultPixelDiameter
{
  +[CSLUILayoutIconView defaultDiameter];
  return v2 + v2;
}

- (UILabel)nameLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_nameLabel);

  return (UILabel *)WeakRetained;
}

- (void)setNameLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_nameLabel);
  objc_destroyWeak((id *)&self->_spinner);
  objc_destroyWeak((id *)&self->_fieldOfIconsView);
  objc_storeStrong((id *)&self->_iconGraph, 0);

  objc_storeStrong((id *)&self->_iconPositionsStore, 0);
}

@end