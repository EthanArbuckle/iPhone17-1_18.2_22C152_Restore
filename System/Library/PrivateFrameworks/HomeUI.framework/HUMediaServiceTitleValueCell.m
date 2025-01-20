@interface HUMediaServiceTitleValueCell
- (BOOL)iconImageLoadingInProgress;
- (HUMediaServiceTitleValueCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSArray)constraints;
- (UIImageView)serviceIconView;
- (void)_loadServiceIconImage;
- (void)_updateContentMetrics;
- (void)setConstraints:(id)a3;
- (void)setIconImageLoadingInProgress:(BOOL)a3;
- (void)setServiceIconView:(id)a3;
- (void)updateConstraints;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUMediaServiceTitleValueCell

- (HUMediaServiceTitleValueCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)HUMediaServiceTitleValueCell;
  v4 = [(HUTitleValueCell *)&v12 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    serviceIconView = v4->_serviceIconView;
    v4->_serviceIconView = (UIImageView *)v5;

    [(UIImageView *)v4->_serviceIconView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v7) = 1148846080;
    [(UIImageView *)v4->_serviceIconView setContentHuggingPriority:1 forAxis:v7];
    LODWORD(v8) = 1148846080;
    [(UIImageView *)v4->_serviceIconView setContentHuggingPriority:0 forAxis:v8];
    v9 = [(UIImageView *)v4->_serviceIconView layer];
    [v9 setCornerRadius:5.0];

    [(UIImageView *)v4->_serviceIconView setClipsToBounds:1];
    v10 = [(HUIconCell *)v4 iconView];
    [v10 addSubview:v4->_serviceIconView];
  }
  return v4;
}

- (void)updateConstraints
{
  v28[3] = *MEMORY[0x1E4F143B8];
  v3 = [(HUIconCell *)self contentMetrics];
  [v3 iconSize];
  double v5 = v4;

  if (v5 != 32.0) {
    [(HUMediaServiceTitleValueCell *)self _updateContentMetrics];
  }
  v6 = [(HUMediaServiceTitleValueCell *)self constraints];

  if (v6)
  {
    double v7 = (void *)MEMORY[0x1E4F28DC8];
    double v8 = [(HUMediaServiceTitleValueCell *)self constraints];
    [v7 deactivateConstraints:v8];
  }
  v9 = [(HUMediaServiceTitleValueCell *)self contentView];
  v10 = [v9 heightAnchor];
  v11 = [v10 constraintGreaterThanOrEqualToConstant:60.0];

  LODWORD(v12) = 1148829696;
  v26 = v11;
  [v11 setPriority:v12];
  v28[0] = v11;
  v25 = [(HUMediaServiceTitleValueCell *)self serviceIconView];
  v24 = [v25 heightAnchor];
  v13 = [(HUIconCell *)self iconView];
  v14 = [v13 heightAnchor];
  v15 = [v24 constraintEqualToAnchor:v14];
  v28[1] = v15;
  v16 = [(HUMediaServiceTitleValueCell *)self serviceIconView];
  v17 = [v16 widthAnchor];
  v18 = [(HUIconCell *)self iconView];
  v19 = [v18 widthAnchor];
  v20 = [v17 constraintEqualToAnchor:v19];
  v28[2] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
  [(HUMediaServiceTitleValueCell *)self setConstraints:v21];

  v22 = (void *)MEMORY[0x1E4F28DC8];
  v23 = [(HUMediaServiceTitleValueCell *)self constraints];
  [v22 activateConstraints:v23];

  v27.receiver = self;
  v27.super_class = (Class)HUMediaServiceTitleValueCell;
  [(HUTitleValueCell *)&v27 updateConstraints];
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUMediaServiceTitleValueCell;
  [(HUTitleValueCell *)&v4 updateUIWithAnimation:a3];
  [(HUMediaServiceTitleValueCell *)self _loadServiceIconImage];
}

- (void)_loadServiceIconImage
{
  if (![(HUMediaServiceTitleValueCell *)self iconImageLoadingInProgress])
  {
    [(HUMediaServiceTitleValueCell *)self setIconImageLoadingInProgress:1];
    uint64_t v3 = objc_opt_class();
    id v4 = [(HUIconCell *)self item];
    if (v4)
    {
      if (objc_opt_isKindOfClass()) {
        double v5 = v4;
      }
      else {
        double v5 = 0;
      }
      v6 = v4;
      if (v5) {
        goto LABEL_9;
      }
      double v7 = [MEMORY[0x1E4F28B00] currentHandler];
      double v8 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v7 handleFailureInFunction:v8, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v3, objc_opt_class() file lineNumber description];
    }
    v6 = 0;
LABEL_9:

    v9 = [v6 mediaService];
    v10 = [v9 iconImageURL];

    v11 = objc_msgSend(MEMORY[0x1E4F42A80], "hf_fetchImageFromURL:", v10);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __53__HUMediaServiceTitleValueCell__loadServiceIconImage__block_invoke;
    v13[3] = &unk_1E638B108;
    v13[4] = self;
    id v12 = (id)[v11 addCompletionBlock:v13];
  }
}

void __53__HUMediaServiceTitleValueCell__loadServiceIconImage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    double v7 = [*(id *)(a1 + 32) serviceIconView];
    [v7 setImage:v5];

    [*(id *)(a1 + 32) setIconImageLoadingInProgress:0];
  }
  else
  {
    double v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "Failed to load media service icon with error: %@", buf, 0xCu);
    }

    v9 = [MEMORY[0x1E4F42D90] mainScreen];
    [v9 scale];
    double v11 = v10;

    id v12 = [MEMORY[0x1E4F6F248] genericApplicationIcon];
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", 64.0, 64.0, v11);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __53__HUMediaServiceTitleValueCell__loadServiceIconImage__block_invoke_12;
    v14[3] = &unk_1E638B240;
    *(double *)&v14[5] = v11;
    v14[4] = *(void *)(a1 + 32);
    [v12 getImageForImageDescriptor:v13 completion:v14];
  }
}

void __53__HUMediaServiceTitleValueCell__loadServiceIconImage__block_invoke_12(uint64_t a1, void *a2)
{
  objc_msgSend(MEMORY[0x1E4F42A80], "imageWithCGImage:scale:orientation:", objc_msgSend(a2, "CGImage"), 0, *(double *)(a1 + 40));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [*(id *)(a1 + 32) serviceIconView];
  [v3 setImage:v4];

  [*(id *)(a1 + 32) setIconImageLoadingInProgress:0];
}

- (void)_updateContentMetrics
{
  id v3 = +[HUIconCellContentMetrics defaultMetrics];
  objc_msgSend(v3, "setIconSize:", 32.0, 32.0);
  [(HUIconCell *)self setContentMetrics:v3];
}

- (UIImageView)serviceIconView
{
  return self->_serviceIconView;
}

- (void)setServiceIconView:(id)a3
{
}

- (BOOL)iconImageLoadingInProgress
{
  return self->_iconImageLoadingInProgress;
}

- (void)setIconImageLoadingInProgress:(BOOL)a3
{
  self->_iconImageLoadingInProgress = a3;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);

  objc_storeStrong((id *)&self->_serviceIconView, 0);
}

@end