@interface HUMediaSourceListItemCell
- (HUMediaSourceListItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIActivityIndicatorView)spinner;
- (UIImageView)serviceIconView;
- (void)prepareForReuse;
- (void)setServiceIconView:(id)a3;
- (void)setSpinner:(id)a3;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUMediaSourceListItemCell

- (HUMediaSourceListItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)HUMediaSourceListItemCell;
  v4 = [(HUTitleDescriptionCell *)&v17 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F42AA0]);
    v6 = [(HUIconCell *)v4 iconView];
    [v6 bounds];
    v7 = objc_msgSend(v5, "initWithFrame:");
    [(HUMediaSourceListItemCell *)v4 setServiceIconView:v7];

    v8 = [(HUMediaSourceListItemCell *)v4 serviceIconView];
    [v8 setAutoresizingMask:18];

    v9 = [(HUMediaSourceListItemCell *)v4 serviceIconView];
    v10 = [v9 layer];
    [v10 setCornerRadius:5.0];

    v11 = [(HUMediaSourceListItemCell *)v4 serviceIconView];
    [v11 setClipsToBounds:1];

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
    spinner = v4->_spinner;
    v4->_spinner = (UIActivityIndicatorView *)v12;

    v14 = [(HUIconCell *)v4 iconView];
    v15 = [(HUMediaSourceListItemCell *)v4 serviceIconView];
    [v14 addSubview:v15];
  }
  return v4;
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  v21.receiver = self;
  v21.super_class = (Class)HUMediaSourceListItemCell;
  [(HUTitleDescriptionCell *)&v21 updateUIWithAnimation:a3];
  v4 = [(HUIconCell *)self item];
  id v5 = [v4 latestResults];
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F689F8]];
  v7 = [(HUMediaSourceListItemCell *)self serviceIconView];
  [v7 setImage:v6];

  v8 = [(HUIconCell *)self item];
  uint64_t v9 = [v8 loadingState];

  if (v9)
  {
    v10 = [(HUMediaSourceListItemCell *)self spinner];
    [(HUMediaSourceListItemCell *)self setAccessoryView:v10];

    v11 = [(HUMediaSourceListItemCell *)self spinner];
    [v11 startAnimating];
  }
  else
  {
    [(HUMediaSourceListItemCell *)self setAccessoryView:0];
    uint64_t v12 = [(HUMediaSourceListItemCell *)self spinner];
    [v12 stopAnimating];

    objc_opt_class();
    v13 = [(HUIconCell *)self item];
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
    id v15 = v14;

    char v16 = [v15 success];
    if (v16)
    {
      int v17 = 1;
      [(HUMediaSourceListItemCell *)self setAccessoryType:1];
      v18 = [MEMORY[0x1E4F428B8] labelColor];
      int v19 = 0;
      goto LABEL_10;
    }
    [(HUMediaSourceListItemCell *)self setAccessoryType:0];
  }
  v18 = [MEMORY[0x1E4F428B8] systemGrayColor];
  int v17 = 0;
  int v19 = 1;
LABEL_10:
  v20 = [(HUTitleDescriptionCell *)self titleLabel];
  [v20 setTextColor:v18];

  if (v19) {
  if (v17)
  }
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)HUMediaSourceListItemCell;
  [(HUTitleDescriptionCell *)&v4 prepareForReuse];
  v3 = [(HUMediaSourceListItemCell *)self serviceIconView];
  [v3 setImage:0];

  [(HUMediaSourceListItemCell *)self setAccessoryView:0];
}

- (UIImageView)serviceIconView
{
  return self->_serviceIconView;
}

- (void)setServiceIconView:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);

  objc_storeStrong((id *)&self->_serviceIconView, 0);
}

@end