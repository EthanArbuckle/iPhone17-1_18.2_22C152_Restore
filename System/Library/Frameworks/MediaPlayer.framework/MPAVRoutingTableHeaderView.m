@interface MPAVRoutingTableHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (MPAVRoutingTableHeaderView)initWithCoder:(id)a3;
- (MPAVRoutingTableHeaderView)initWithFrame:(CGRect)a3;
- (id)_mirroringCompactDescription;
- (id)_mirroringCompactDescriptionTextAttributes;
- (id)_mirroringTitleTextAttributes;
- (void)_init;
- (void)layoutSubviews;
@end

@implementation MPAVRoutingTableHeaderView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderLayer, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

- (id)_mirroringCompactDescriptionTextAttributes
{
  v8[3] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1378]);
  [v2 setAlignment:1];
  [v2 setLineBreakMode:0];
  v7[0] = *MEMORY[0x1E4FB12B0];
  v3 = [MEMORY[0x1E4FB1798] defaultFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  v8[0] = v3;
  v7[1] = *MEMORY[0x1E4FB12B8];
  v4 = [MEMORY[0x1E4FB1618] tableCellGrayTextColor];
  v7[2] = *MEMORY[0x1E4FB12D0];
  v8[1] = v4;
  v8[2] = v2;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

- (id)_mirroringCompactDescription
{
  v14[3] = *MEMORY[0x1E4F143B8];
  v13[0] = @"iPhone";
  id v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
  v3 = [v2 localizedStringForKey:@"AIRPLAY_MIRRORING_COMPACT_DESCRIPTION_IPHONE" value:&stru_1EE680640 table:@"MediaPlayer"];
  v14[0] = v3;
  v13[1] = @"iPad";
  v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
  v5 = [v4 localizedStringForKey:@"AIRPLAY_MIRRORING_COMPACT_DESCRIPTION_IPAD" value:&stru_1EE680640 table:@"MediaPlayer"];
  v14[1] = v5;
  v13[2] = @"iPod";
  v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
  v7 = [v6 localizedStringForKey:@"AIRPLAY_MIRRORING_COMPACT_DESCRIPTION_IPOD" value:&stru_1EE680640 table:@"MediaPlayer"];
  v14[2] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];

  v9 = (void *)MGCopyAnswer();
  if (v9)
  {
    v10 = [v8 objectForKey:v9];
  }
  else
  {
    v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
    v10 = [v11 localizedStringForKey:@"AIRPLAY_MIRRORING_COMPACT_DESCRIPTION_IPHONE" value:&stru_1EE680640 table:@"MediaPlayer"];
  }

  return v10;
}

- (id)_mirroringTitleTextAttributes
{
  v8[3] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1378]);
  [v2 setAlignment:1];
  [v2 setLineBreakMode:0];
  v7[0] = *MEMORY[0x1E4FB12B0];
  v3 = [MEMORY[0x1E4FB1798] defaultFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  v8[0] = v3;
  v7[1] = *MEMORY[0x1E4FB12B8];
  v4 = [MEMORY[0x1E4FB1618] blackColor];
  v7[2] = *MEMORY[0x1E4FB12D0];
  v8[1] = v4;
  v8[2] = v2;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
  v7 = [v6 localizedStringForKey:@"AIRPLAY_MIRRORING_TITLE" value:&stru_1EE680640 table:@"MediaPlayer"];

  v8 = [(MPAVRoutingTableHeaderView *)self _mirroringTitleTextAttributes];
  v9 = [(MPAVRoutingTableHeaderView *)self _mirroringCompactDescription];
  v10 = [(MPAVRoutingTableHeaderView *)self _mirroringCompactDescriptionTextAttributes];
  p_edgeInsets = &self->_edgeInsets;
  double v12 = width - (p_edgeInsets->left + p_edgeInsets->right);
  double v13 = height - (p_edgeInsets->top + p_edgeInsets->bottom);
  objc_msgSend(v7, "boundingRectWithSize:options:attributes:context:", 1, v8, 0, v12, v13);
  double v15 = v14;
  double v17 = v16;
  objc_msgSend(v9, "boundingRectWithSize:options:attributes:context:", 1, v10, 0, v12, v13);
  if (v15 >= v18) {
    double v20 = v15;
  }
  else {
    double v20 = v18;
  }
  double v21 = rint(p_edgeInsets->right + p_edgeInsets->left + v20);
  double v22 = rint(v17 + 2.0 + v19 + p_edgeInsets->top + p_edgeInsets->bottom);

  double v23 = v21;
  double v24 = v22;
  result.double height = v24;
  result.double width = v23;
  return result;
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)MPAVRoutingTableHeaderView;
  [(MPAVRoutingTableHeaderView *)&v22 layoutSubviews];
  [(MPAVRoutingTableHeaderView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v20 = v5;
  double v21 = v7;
  double v9 = v8;
  CGFloat v10 = v7 - (self->_edgeInsets.left + self->_edgeInsets.right);
  double v11 = v8 - (self->_edgeInsets.top + self->_edgeInsets.bottom);
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v10, v11);
  CGFloat v13 = v12;
  CGFloat v14 = v4 + self->_edgeInsets.left;
  CGFloat v15 = v6 + self->_edgeInsets.top;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v14, v15, v10, v12);
  -[UILabel sizeThatFits:](self->_detailLabel, "sizeThatFits:", v10, v11);
  double v17 = v16;
  v23.origin.x = v14;
  v23.origin.y = v15;
  v23.size.double width = v10;
  v23.size.double height = v13;
  -[UILabel setFrame:](self->_detailLabel, "setFrame:", v4 + self->_edgeInsets.left, CGRectGetMaxY(v23) + 2.0, v10, v17);
  id v18 = objc_alloc_init(MEMORY[0x1E4FB14C0]);
  objc_msgSend(v18, "moveToPoint:", v4, v20 + v9);
  objc_msgSend(v18, "addLineToPoint:", v4 + v21, v20 + v9);
  id v19 = v18;
  -[CAShapeLayer setPath:](self->_borderLayer, "setPath:", [v19 CGPath]);
}

- (MPAVRoutingTableHeaderView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MPAVRoutingTableHeaderView;
  double v3 = [(MPAVRoutingTableHeaderView *)&v6 initWithCoder:a3];
  double v4 = v3;
  if (v3) {
    [(MPAVRoutingTableHeaderView *)v3 _init];
  }
  return v4;
}

- (MPAVRoutingTableHeaderView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MPAVRoutingTableHeaderView;
  double v3 = -[MPAVRoutingTableHeaderView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3) {
    [(MPAVRoutingTableHeaderView *)v3 _init];
  }
  return v4;
}

- (void)_init
{
  double v3 = [MEMORY[0x1E4FB1618] whiteColor];
  [(MPAVRoutingTableHeaderView *)self setBackgroundColor:v3];

  *(_OWORD *)&self->_edgeInsets.top = xmmword_195689860;
  *(_OWORD *)&self->_edgeInsets.bottom = xmmword_195689860;
  id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v9 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v9;

  double v11 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v5, v6, v7, v8);
  detailLabel = self->_detailLabel;
  self->_detailLabel = v11;

  CGFloat v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
  id v24 = [v13 localizedStringForKey:@"AIRPLAY_MIRRORING_TITLE" value:&stru_1EE680640 table:@"MediaPlayer"];

  CGFloat v14 = [(MPAVRoutingTableHeaderView *)self _mirroringTitleTextAttributes];
  CGFloat v15 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v24 attributes:v14];
  [(UILabel *)self->_titleLabel setAttributedText:v15];

  [(UILabel *)self->_titleLabel setNumberOfLines:1];
  [(MPAVRoutingTableHeaderView *)self addSubview:self->_titleLabel];
  double v16 = [(MPAVRoutingTableHeaderView *)self _mirroringCompactDescription];
  double v17 = [(MPAVRoutingTableHeaderView *)self _mirroringCompactDescriptionTextAttributes];
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v16 attributes:v17];
  [(UILabel *)self->_detailLabel setAttributedText:v18];

  [(UILabel *)self->_detailLabel setNumberOfLines:0];
  [(MPAVRoutingTableHeaderView *)self addSubview:self->_detailLabel];
  id v19 = [MEMORY[0x1E4F39C88] layer];
  borderLayer = self->_borderLayer;
  self->_borderLayer = v19;

  id v21 = [MEMORY[0x1E4FB1618] colorWithWhite:0.8 alpha:1.0];
  -[CAShapeLayer setStrokeColor:](self->_borderLayer, "setStrokeColor:", [v21 CGColor]);

  [(CAShapeLayer *)self->_borderLayer setLineWidth:0.5];
  [(CAShapeLayer *)self->_borderLayer setFillColor:0];
  LODWORD(v22) = 1.0;
  [(CAShapeLayer *)self->_borderLayer setOpacity:v22];
  CGRect v23 = [(MPAVRoutingTableHeaderView *)self layer];
  [v23 addSublayer:self->_borderLayer];
}

@end