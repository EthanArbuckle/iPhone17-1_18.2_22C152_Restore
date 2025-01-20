@interface HUClipLiveSpacerCollectionViewCell
- (HUClipLiveSpacerCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation HUClipLiveSpacerCollectionViewCell

- (HUClipLiveSpacerCollectionViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUClipLiveSpacerCollectionViewCell;
  v3 = -[HUClipLiveSpacerCollectionViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(HUClipLiveSpacerCollectionViewCell *)v3 setOpaque:0];
  }
  return v4;
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetLineDash(CurrentContext, 2.0, drawRect__lengths_1, 2uLL);
  v8 = [MEMORY[0x1E4F427D0] bezierPath];
  [v8 setLineWidth:2.0];
  [v8 setLineCapStyle:1];
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.double width = width;
  v14.size.double height = height;
  double MidY = CGRectGetMidY(v14);
  objc_msgSend(v8, "moveToPoint:", 0.0, MidY);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.double width = width;
  v15.size.double height = height;
  *(float *)&CGFloat y = CGRectGetMaxX(v15) + -1.0;
  objc_msgSend(v8, "addLineToPoint:", width, MidY);
  v10 = [MEMORY[0x1E4F428B8] systemGrayColor];
  [v10 setStroke];

  [v8 stroke];
  objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:cornerRadius:", *(float *)&y, 7.0, 1.0, height + -14.0, 2.0);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  v11 = [MEMORY[0x1E4F428B8] systemOrangeColor];
  [v11 setStroke];

  CGContextSetLineDash(CurrentContext, 0.0, 0, 0);
  [v12 stroke];
}

@end