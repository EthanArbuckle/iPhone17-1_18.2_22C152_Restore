@interface SKStarRatingAlertController
+ (id)starRatingAlertController;
- (SKStarRatingAlertController)initWithNibName:(id)a3 bundle:(id)a4;
- (float)rating;
- (id)completion;
- (void)_updateButtonState;
- (void)dealloc;
- (void)setCompletion:(id)a3;
- (void)setRating:(float)a3;
- (void)setupActionsWithBundle:(id)a3;
@end

@implementation SKStarRatingAlertController

+ (id)starRatingAlertController
{
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"RATING_ALERT_TITLE" value:&stru_1F08A7B80 table:0];
  v5 = [a1 alertControllerWithTitle:v4 message:0 preferredStyle:1];

  return v5;
}

- (SKStarRatingAlertController)initWithNibName:(id)a3 bundle:(id)a4
{
  v22.receiver = self;
  v22.super_class = (Class)SKStarRatingAlertController;
  v4 = [(SKStarRatingAlertController *)&v22 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v6 = [MEMORY[0x1E4FB1818] imageNamed:@"AlertStarBackground" inBundle:v5];
    [v6 size];
    double v8 = v7;
    v9 = [MEMORY[0x1E4FB1818] imageNamed:@"AlertStarForeground" inBundle:v5];
    v10 = SKGetRatingStarsImage(v6, 5, 9.0);

    v11 = SKGetRatingStarsImage(v9, 5, 9.0);

    v12 = [[SKStarRatingControl alloc] initWithBackgroundImage:v10 foregroundImage:v11];
    ratingControl = v4->_ratingControl;
    v4->_ratingControl = v12;

    [(SKStarRatingControl *)v4->_ratingControl addTarget:v4 action:sel__ratingControlChanged_ forControlEvents:4096];
    [(SKStarRatingControl *)v4->_ratingControl setAutoresizingMask:37];
    -[SKStarRatingControl setHitPadding:](v4->_ratingControl, "setHitPadding:", 50.0, 15.0);
    [(SKStarRatingControl *)v4->_ratingControl setStarWidth:v8];
    [(SKStarRatingControl *)v4->_ratingControl sizeToFit];
    [(SKStarRatingControl *)v4->_ratingControl frame];
    double v15 = v14;
    double v17 = v16;
    v18 = (void *)[objc_alloc(MEMORY[0x1E4FB1EC0]) initWithNibName:0 bundle:0];
    v19 = [v18 view];
    objc_msgSend(v19, "setFrame:", 0.0, 0.0, v15, v17 + 20.0);

    objc_msgSend(v18, "setPreferredContentSize:", v15, v17 + 20.0);
    -[SKStarRatingControl setFrame:](v4->_ratingControl, "setFrame:", 0.0, 0.0, v15, v17);
    v20 = [v18 view];
    [v20 addSubview:v4->_ratingControl];

    [(SKStarRatingAlertController *)v4 setContentViewController:v18];
    [(SKStarRatingAlertController *)v4 setupActionsWithBundle:v5];
  }
  return v4;
}

- (void)setupActionsWithBundle:(id)a3
{
  id v4 = a3;
  v5 = [v4 localizedStringForKey:@"CANCEL" value:&stru_1F08A7B80 table:0];
  v6 = [v4 localizedStringForKey:@"SUBMIT" value:&stru_1F08A7B80 table:0];
  objc_initWeak(&location, self);
  double v7 = (void *)MEMORY[0x1E4FB1410];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__SKStarRatingAlertController_setupActionsWithBundle___block_invoke;
  v14[3] = &unk_1E5FAADC8;
  objc_copyWeak(&v15, &location);
  double v8 = [v7 actionWithTitle:v5 style:1 handler:v14];
  [(SKStarRatingAlertController *)self addAction:v8];

  v9 = (void *)MEMORY[0x1E4FB1410];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__SKStarRatingAlertController_setupActionsWithBundle___block_invoke_2;
  v12[3] = &unk_1E5FAADC8;
  objc_copyWeak(&v13, &location);
  v10 = [v9 actionWithTitle:v6 style:0 handler:v12];
  submitAction = self->_submitAction;
  self->_submitAction = v10;

  [(SKStarRatingAlertController *)self addAction:self->_submitAction];
  [(SKStarRatingAlertController *)self _updateButtonState];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __54__SKStarRatingAlertController_setupActionsWithBundle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained completion];

  if (v1)
  {
    v2 = [WeakRetained completion];
    v2[2](v2, 0, 0.0);
  }
}

void __54__SKStarRatingAlertController_setupActionsWithBundle___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained rating];
  float v2 = v1;
  v3 = [WeakRetained completion];

  if (v3)
  {
    id v4 = [WeakRetained completion];
    v4[2](v4, 1, v2);
  }
}

- (void)dealloc
{
  [(SKStarRatingControl *)self->_ratingControl removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  v3.receiver = self;
  v3.super_class = (Class)SKStarRatingAlertController;
  [(SKStarRatingAlertController *)&v3 dealloc];
}

- (float)rating
{
  [(SKStarRatingControl *)self->_ratingControl value];
  return result;
}

- (void)setRating:(float)a3
{
}

- (void)_updateButtonState
{
  if (self->_submitAction)
  {
    [(SKStarRatingAlertController *)self rating];
    submitAction = self->_submitAction;
    [(UIAlertAction *)submitAction setEnabled:v3 > 0.00000011921];
  }
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_submitAction, 0);

  objc_storeStrong((id *)&self->_ratingControl, 0);
}

@end