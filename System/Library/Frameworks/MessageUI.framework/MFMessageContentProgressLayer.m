@interface MFMessageContentProgressLayer
- (MFMessageContentProgressLayer)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)edgeInsets;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setEdgeInsets:(UIEdgeInsets)a3;
@end

@implementation MFMessageContentProgressLayer

- (MFMessageContentProgressLayer)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)MFMessageContentProgressLayer;
  v3 = -[MFMessageContentProgressLayer initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [v3 setBackgroundColor:v4];

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    v6 = (void *)*((void *)v3 + 51);
    *((void *)v3 + 51) = v5;

    id v7 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    v8 = (void *)*((void *)v3 + 52);
    *((void *)v3 + 52) = v7;

    v9 = (void *)*((void *)v3 + 52);
    v10 = [MEMORY[0x1E4F28B50] mainBundle];
    v11 = [v10 localizedStringForKey:@"LOADING" value:&stru_1F0817A00 table:@"Main"];
    [v9 setText:v11];

    v12 = (void *)*((void *)v3 + 52);
    v13 = [MEMORY[0x1E4FB1618] grayColor];
    [v12 setTextColor:v13];

    [*((id *)v3 + 52) sizeToFit];
    long long v14 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
    *(_OWORD *)(v3 + 424) = *MEMORY[0x1E4FB2848];
    *(_OWORD *)(v3 + 440) = v14;
    [v3 addSubview:*((void *)v3 + 51)];
    [*((id *)v3 + 51) startAnimating];
    [v3 addSubview:*((void *)v3 + 52)];
  }
  return (MFMessageContentProgressLayer *)v3;
}

- (void)dealloc
{
  [(UIActivityIndicatorView *)self->_progressIndicator stopAnimating];
  v3.receiver = self;
  v3.super_class = (Class)MFMessageContentProgressLayer;
  [(MFMessageContentProgressLayer *)&v3 dealloc];
}

- (void)layoutSubviews
{
  [(MFMessageContentProgressLayer *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(UIActivityIndicatorView *)self->_progressIndicator frame];
  double v8 = v7;
  double v10 = v9;
  [(UILabel *)self->_loadingText frame];
  CGFloat v12 = round(self->_edgeInsets.left * 0.5) + round((v4 - (v8 + 5.0 + v11)) * 0.5);
  CGFloat v14 = round((v6 - v13) * 0.5) + round((self->_edgeInsets.top + self->_edgeInsets.bottom) * 0.5);
  -[UIActivityIndicatorView setFrame:](self->_progressIndicator, "setFrame:", v12, v14, v8, v10);
  [(UILabel *)self->_loadingText frame];
  double v16 = v15;
  double v18 = v17;
  v23.origin.x = v12;
  v23.origin.y = v14;
  v23.size.width = v8;
  v23.size.height = v10;
  double v19 = CGRectGetMaxX(v23) + 5.0;
  loadingText = self->_loadingText;
  double v21 = v14 + round((v10 - v18) * 0.5);

  -[UILabel setFrame:](loadingText, "setFrame:", v19, v21, v16, v18);
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingText, 0);

  objc_storeStrong((id *)&self->_progressIndicator, 0);
}

@end