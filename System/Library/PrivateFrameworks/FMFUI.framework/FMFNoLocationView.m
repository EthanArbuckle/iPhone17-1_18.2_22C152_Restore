@interface FMFNoLocationView
- (BOOL)blockLabelUpdates;
- (FMFNoLocationView)initWithFrame:(CGRect)a3;
- (FMFNoLocationViewDelegate)delegate;
- (NSLayoutConstraint)bottomInsetConstraint;
- (NSLayoutConstraint)topInsetConstraint;
- (UIImage)offlineProfileImage;
- (UIImageView)offlineProfileImageView;
- (UIImageView)personImageView;
- (UILabel)detailsLabel;
- (UIView)blur;
- (UIView)insetView;
- (id)accessibilityLabel;
- (void)addLayoutConstraints;
- (void)dealloc;
- (void)setAlpha:(double)a3;
- (void)setBlockLabelUpdates:(BOOL)a3;
- (void)setBlur:(id)a3;
- (void)setBottomInsetConstraint:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDetailsLabel:(id)a3;
- (void)setInsetView:(id)a3;
- (void)setOfflineProfileImage:(id)a3;
- (void)setOfflineProfileImageView:(id)a3;
- (void)setPersonImageView:(id)a3;
- (void)setTopInsetConstraint:(id)a3;
- (void)updateConstriantsForInsets;
- (void)updateLabel;
- (void)updateLabelNotification:(id)a3;
- (void)updatePersonImageViewImage;
@end

@implementation FMFNoLocationView

- (FMFNoLocationView)initWithFrame:(CGRect)a3
{
  v27.receiver = self;
  v27.super_class = (Class)FMFNoLocationView;
  v3 = -[FMFNoLocationView initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1CB60]);
    [(FMFNoLocationView *)v3 bounds];
    v5 = objc_msgSend(v4, "initWithFrame:");
    [(FMFNoLocationView *)v3 setBlur:v5];

    v6 = (void *)MEMORY[0x263F1C550];
    v7 = (void *)MEMORY[0x263F1C6B0];
    v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v9 = [v7 imageNamed:@"bg_grid" inBundle:v8];
    v10 = [v6 colorWithPatternImage:v9];
    [(UIView *)v3->_blur setBackgroundColor:v10];

    [(FMFNoLocationView *)v3 addSubview:v3->_blur];
    [(FMFNoLocationView *)v3 sendSubviewToBack:v3->_blur];
    id v11 = objc_alloc(MEMORY[0x263F1C6D0]);
    v12 = [(FMFNoLocationView *)v3 offlineProfileImage];
    v13 = (void *)[v11 initWithImage:v12];
    [(FMFNoLocationView *)v3 setOfflineProfileImageView:v13];

    [(FMFNoLocationView *)v3 addSubview:v3->_offlineProfileImageView];
    v14 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:0];
    [(FMFNoLocationView *)v3 setPersonImageView:v14];

    [(FMFNoLocationView *)v3 addSubview:v3->_personImageView];
    id v15 = objc_alloc(MEMORY[0x263F1C768]);
    double v16 = *MEMORY[0x263F001A8];
    double v17 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v18 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v19 = *(double *)(MEMORY[0x263F001A8] + 24);
    v20 = objc_msgSend(v15, "initWithFrame:", *MEMORY[0x263F001A8], v17, v18, v19);
    [(FMFNoLocationView *)v3 setDetailsLabel:v20];

    v21 = [MEMORY[0x263F1C658] systemFontOfSize:15.0];
    [(UILabel *)v3->_detailsLabel setFont:v21];

    [(UILabel *)v3->_detailsLabel setTextAlignment:1];
    v22 = [MEMORY[0x263F1C550] colorWithRed:0.623529434 green:0.611764729 blue:0.592156887 alpha:1.0];
    [(UILabel *)v3->_detailsLabel setTextColor:v22];

    [(FMFNoLocationView *)v3 addSubview:v3->_detailsLabel];
    v23 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v16, v17, v18, v19);
    [(FMFNoLocationView *)v3 setInsetView:v23];

    v24 = [MEMORY[0x263F1C550] clearColor];
    [(UIView *)v3->_insetView setBackgroundColor:v24];

    [(FMFNoLocationView *)v3 addSubview:v3->_insetView];
    [(FMFNoLocationView *)v3 addLayoutConstraints];
    [(FMFNoLocationView *)v3 setAlpha:0.0];
    [(FMFNoLocationView *)v3 updateLabel];
    [(FMFNoLocationView *)v3 updatePersonImageViewImage];
    v25 = [MEMORY[0x263F08A00] defaultCenter];
    [v25 addObserver:v3 selector:sel_updateLabelNotification_ name:@"locatingInProgressChanged" object:0];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"locatingInProgressChanged" object:0];

  v4.receiver = self;
  v4.super_class = (Class)FMFNoLocationView;
  [(FMFNoLocationView *)&v4 dealloc];
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  [(FMFNoLocationView *)self updateLabel];
}

- (void)addLayoutConstraints
{
  [(UIImageView *)self->_offlineProfileImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_personImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_detailsLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_blur setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_insetView setTranslatesAutoresizingMaskIntoConstraints:0];
  v3 = [MEMORY[0x263F08938] constraintWithItem:self->_blur attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:0.0];
  [(FMFNoLocationView *)self addConstraint:v3];

  objc_super v4 = [MEMORY[0x263F08938] constraintWithItem:self->_blur attribute:4 relatedBy:0 toItem:self attribute:4 multiplier:1.0 constant:0.0];
  [(FMFNoLocationView *)self addConstraint:v4];

  v5 = [MEMORY[0x263F08938] constraintWithItem:self->_blur attribute:1 relatedBy:0 toItem:self attribute:1 multiplier:1.0 constant:0.0];
  [(FMFNoLocationView *)self addConstraint:v5];

  v6 = [MEMORY[0x263F08938] constraintWithItem:self->_blur attribute:2 relatedBy:0 toItem:self attribute:2 multiplier:1.0 constant:0.0];
  [(FMFNoLocationView *)self addConstraint:v6];

  v7 = [MEMORY[0x263F08938] constraintWithItem:self->_offlineProfileImageView attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
  [(FMFNoLocationView *)self addConstraint:v7];

  v8 = [MEMORY[0x263F08938] constraintWithItem:self->_offlineProfileImageView attribute:10 relatedBy:0 toItem:self->_insetView attribute:10 multiplier:1.0 constant:-10.0];
  [(FMFNoLocationView *)self addConstraint:v8];

  v9 = [MEMORY[0x263F08938] constraintWithItem:self->_personImageView attribute:9 relatedBy:0 toItem:self->_offlineProfileImageView attribute:9 multiplier:1.0 constant:0.0];
  [(FMFNoLocationView *)self addConstraint:v9];

  v10 = [MEMORY[0x263F08938] constraintWithItem:self->_personImageView attribute:10 relatedBy:0 toItem:self->_offlineProfileImageView attribute:10 multiplier:1.0 constant:0.0];
  [(FMFNoLocationView *)self addConstraint:v10];

  id v11 = [MEMORY[0x263F08938] constraintWithItem:self->_personImageView attribute:7 relatedBy:0 toItem:0 attribute:7 multiplier:1.0 constant:60.0];
  [(FMFNoLocationView *)self addConstraint:v11];

  v12 = [MEMORY[0x263F08938] constraintWithItem:self->_personImageView attribute:8 relatedBy:0 toItem:0 attribute:8 multiplier:1.0 constant:60.0];
  [(FMFNoLocationView *)self addConstraint:v12];

  v13 = [MEMORY[0x263F08938] constraintWithItem:self->_insetView attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:0.0];
  [(FMFNoLocationView *)self setTopInsetConstraint:v13];

  [(FMFNoLocationView *)self addConstraint:self->_topInsetConstraint];
  v14 = [MEMORY[0x263F08938] constraintWithItem:self attribute:4 relatedBy:0 toItem:self->_insetView attribute:4 multiplier:1.0 constant:0.0];
  [(FMFNoLocationView *)self setBottomInsetConstraint:v14];

  [(FMFNoLocationView *)self addConstraint:self->_bottomInsetConstraint];
  id v15 = [MEMORY[0x263F08938] constraintWithItem:self->_insetView attribute:1 relatedBy:0 toItem:self attribute:1 multiplier:1.0 constant:0.0];
  [(FMFNoLocationView *)self addConstraint:v15];

  double v16 = [MEMORY[0x263F08938] constraintWithItem:self->_insetView attribute:2 relatedBy:0 toItem:self attribute:2 multiplier:1.0 constant:0.0];
  [(FMFNoLocationView *)self addConstraint:v16];

  double v17 = [MEMORY[0x263F08938] constraintWithItem:self->_detailsLabel attribute:3 relatedBy:0 toItem:self->_offlineProfileImageView attribute:4 multiplier:1.0 constant:-3.0];
  [(FMFNoLocationView *)self addConstraint:v17];

  double v18 = [MEMORY[0x263F08938] constraintWithItem:self->_detailsLabel attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
  [(FMFNoLocationView *)self addConstraint:v18];

  double v19 = [MEMORY[0x263F08938] constraintWithItem:self->_detailsLabel attribute:8 relatedBy:1 toItem:0 attribute:8 multiplier:1.0 constant:20.0];
  [(FMFNoLocationView *)self addConstraint:v19];

  [(FMFNoLocationView *)self updateConstriantsForInsets];
}

- (void)updateConstriantsForInsets
{
  id v4 = [(FMFNoLocationView *)self delegate];
  [v4 edgeInsets];
  -[NSLayoutConstraint setConstant:](self->_topInsetConstraint, "setConstant:");
  [v4 edgeInsets];
  [(NSLayoutConstraint *)self->_bottomInsetConstraint setConstant:v3];
}

- (void)updateLabelNotification:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__FMFNoLocationView_updateLabelNotification___block_invoke;
  block[3] = &unk_2643438F0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __45__FMFNoLocationView_updateLabelNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateLabel];
}

- (void)updateLabel
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (![(FMFNoLocationView *)self blockLabelUpdates])
  {
    double v3 = [(FMFNoLocationView *)self delegate];
    id v4 = [v3 handlesShowingLocations];
    if ([v4 count])
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      v5 = v4;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v24;
        while (2)
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v24 != v8) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8 * v9);
            id v11 = objc_msgSend(MEMORY[0x263F3BA80], "sharedInstance", (void)v23);
            v12 = [v11 cachedLocationForHandle:v10];

            if (!v12)
            {
              id v15 = LogCategory_Daemon();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_2188D1000, v15, OS_LOG_TYPE_DEFAULT, "No location received from service yet.", buf, 2u);
              }

LABEL_19:
              goto LABEL_20;
            }
            if ([v12 isLocatingInProgress]) {
              goto LABEL_19;
            }
            v13 = [v12 location];

            if (v13) {
              goto LABEL_20;
            }
            ++v9;
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
      int v14 = 0;
    }
    else
    {
      v5 = LogCategory_Daemon();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2188D1000, v5, OS_LOG_TYPE_DEFAULT, "No handles received from service yet.", buf, 2u);
      }
LABEL_20:
      int v14 = 1;
    }

    double v16 = LogCategory_Daemon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      double v17 = [v3 handlesShowingLocations];
      *(_DWORD *)buf = 67109378;
      int v28 = v14;
      __int16 v29 = 2112;
      v30 = v17;
      _os_log_impl(&dword_2188D1000, v16, OS_LOG_TYPE_DEFAULT, "Updating labels for FMFNoLocationView isLocating: %d handles: %@", buf, 0x12u);
    }
    double v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v19 = v18;
    if (v14) {
      v20 = @"LOCATING";
    }
    else {
      v20 = @"LOCATION_NOT_AVAILABLE";
    }
    v21 = objc_msgSend(v18, "localizedStringForKey:value:table:", v20, &stru_26CA0AD00, @"LocalizableUI", (void)v23);

    v22 = [(FMFNoLocationView *)self detailsLabel];
    [v22 setText:v21];

    [(UILabel *)self->_detailsLabel sizeToFit];
    [(UILabel *)self->_detailsLabel invalidateIntrinsicContentSize];
  }
}

- (void)setAlpha:(double)a3
{
  [(FMFNoLocationView *)self alpha];
  double v6 = v5;
  v7.receiver = self;
  v7.super_class = (Class)FMFNoLocationView;
  [(FMFNoLocationView *)&v7 setAlpha:a3];
  if (v6 != a3) {
    [(FMFNoLocationView *)self updateConstriantsForInsets];
  }
}

- (void)updatePersonImageViewImage
{
  double v3 = (void *)MEMORY[0x263F1C6B0];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = [v3 imageNamed:@"person_noloc" inBundle:v4];

  double v5 = [(FMFNoLocationView *)self personImageView];
  [v5 setImage:v6];
}

- (UIImage)offlineProfileImage
{
  offlineProfileImage = self->_offlineProfileImage;
  if (!offlineProfileImage)
  {
    id v4 = (void *)MEMORY[0x263F1C6B0];
    double v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = [v4 imageNamed:@"profile" inBundle:v5];
    [(FMFNoLocationView *)self setOfflineProfileImage:v6];

    offlineProfileImage = self->_offlineProfileImage;
  }
  return offlineProfileImage;
}

- (id)accessibilityLabel
{
  return 0;
}

- (FMFNoLocationViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FMFNoLocationViewDelegate *)WeakRetained;
}

- (BOOL)blockLabelUpdates
{
  return self->_blockLabelUpdates;
}

- (void)setBlockLabelUpdates:(BOOL)a3
{
  self->_blockLabelUpdates = a3;
}

- (NSLayoutConstraint)topInsetConstraint
{
  return self->_topInsetConstraint;
}

- (void)setTopInsetConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomInsetConstraint
{
  return self->_bottomInsetConstraint;
}

- (void)setBottomInsetConstraint:(id)a3
{
}

- (void)setOfflineProfileImage:(id)a3
{
}

- (UIImageView)offlineProfileImageView
{
  return self->_offlineProfileImageView;
}

- (void)setOfflineProfileImageView:(id)a3
{
}

- (UIImageView)personImageView
{
  return self->_personImageView;
}

- (void)setPersonImageView:(id)a3
{
}

- (UILabel)detailsLabel
{
  return self->_detailsLabel;
}

- (void)setDetailsLabel:(id)a3
{
}

- (UIView)blur
{
  return self->_blur;
}

- (void)setBlur:(id)a3
{
}

- (UIView)insetView
{
  return self->_insetView;
}

- (void)setInsetView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insetView, 0);
  objc_storeStrong((id *)&self->_blur, 0);
  objc_storeStrong((id *)&self->_detailsLabel, 0);
  objc_storeStrong((id *)&self->_personImageView, 0);
  objc_storeStrong((id *)&self->_offlineProfileImageView, 0);
  objc_storeStrong((id *)&self->_offlineProfileImage, 0);
  objc_storeStrong((id *)&self->_bottomInsetConstraint, 0);
  objc_storeStrong((id *)&self->_topInsetConstraint, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end