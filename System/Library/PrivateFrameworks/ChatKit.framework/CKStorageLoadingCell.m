@interface CKStorageLoadingCell
+ (id)reuseIdentifier;
- (CKStorageLoadingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIActivityIndicatorView)spinner;
- (void)layoutSubviews;
- (void)setSpinner:(id)a3;
@end

@implementation CKStorageLoadingCell

- (CKStorageLoadingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CKStorageLoadingCell;
  v4 = [(CKStorageLoadingCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
    spinner = v4->_spinner;
    v4->_spinner = (UIActivityIndicatorView *)v5;

    [(UIActivityIndicatorView *)v4->_spinner startAnimating];
    v7 = [(CKStorageLoadingCell *)v4 contentView];
    [v7 addSubview:v4->_spinner];
  }
  return v4;
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)CKStorageLoadingCell;
  [(CKStorageLoadingCell *)&v10 layoutSubviews];
  v3 = [(CKStorageLoadingCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  [(UIActivityIndicatorView *)self->_spinner frame];
  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", (v5 - v8) * 0.5, (v7 - v9) * 0.5);
}

+ (id)reuseIdentifier
{
  return @"CKStorageLoadingCell";
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
}

@end