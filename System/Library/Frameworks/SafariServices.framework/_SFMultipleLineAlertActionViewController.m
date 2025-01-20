@interface _SFMultipleLineAlertActionViewController
- (CGSize)preferredContentSize;
- (_SFMultipleLineAlertActionViewController)initWithTitle:(id)a3 detail:(id)a4 style:(int64_t)a5;
- (void)loadView;
@end

@implementation _SFMultipleLineAlertActionViewController

- (_SFMultipleLineAlertActionViewController)initWithTitle:(id)a3 detail:(id)a4 style:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(_SFMultipleLineAlertActionViewController *)self initWithNibName:0 bundle:0];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    title = v10->_title;
    v10->_title = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    detail = v10->_detail;
    v10->_detail = (NSString *)v13;

    v10->_style = a5;
    v15 = v10;
  }

  return v10;
}

- (void)loadView
{
  id v8 = objc_alloc_init(_SFMultipleLineAlertActionView);
  if (self->_style == 2)
  {
    v3 = [MEMORY[0x1E4FB1618] systemRedColor];
    [(_SFMultipleLineAlertActionView *)v8 setTintColor:v3];
  }
  title = self->_title;
  v5 = [(_SFMultipleLineAlertActionView *)v8 titleLabel];
  [v5 setText:title];

  detail = self->_detail;
  v7 = [(_SFMultipleLineAlertActionView *)v8 detailLabel];
  [v7 setText:detail];

  [(_SFMultipleLineAlertActionViewController *)self setView:v8];
}

- (CGSize)preferredContentSize
{
  v2 = [(_SFMultipleLineAlertActionViewController *)self view];
  objc_msgSend(v2, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detail, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end