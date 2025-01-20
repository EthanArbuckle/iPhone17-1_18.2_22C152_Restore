@interface HUCameraEventReachabilityCell
+ (id)backgroundColor;
- (BOOL)needsFullDashedLineWidth;
- (CALayer)badgeLayer;
- (HFCameraScrubberReachabilityEventContainer)reachabilityEvent;
- (HUCameraEventReachabilityCell)initWithFrame:(CGRect)a3;
- (id)accessibilityLabel;
- (unint64_t)displayMode;
- (void)drawRect:(CGRect)a3;
- (void)setBadgeLayer:(id)a3;
- (void)setDisplayMode:(unint64_t)a3;
- (void)setNeedsFullDashedLineWidth:(BOOL)a3;
- (void)setReachabilityEvent:(id)a3;
- (void)updateWithReachabilityEventContainer:(id)a3 mode:(unint64_t)a4;
@end

@implementation HUCameraEventReachabilityCell

- (HUCameraEventReachabilityCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUCameraEventReachabilityCell;
  v3 = -[HUCameraEventReachabilityCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(HUCameraEventReachabilityCell *)v3 setOpaque:0];
  }
  return v4;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetLineDash(CurrentContext, 2.0, drawRect__lengths, 2uLL);
  v9 = [MEMORY[0x1E4F427D0] bezierPath];
  [v9 setLineWidth:2.0];
  [v9 setLineCapStyle:1];
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.double width = width;
  v18.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v18);
  objc_msgSend(v9, "moveToPoint:", 0.0, MidY);
  BOOL v11 = [(HUCameraEventReachabilityCell *)self needsFullDashedLineWidth];
  double v12 = -9.0;
  if (v11) {
    double v12 = 1.0;
  }
  objc_msgSend(v9, "addLineToPoint:", width + v12, MidY);
  double v16 = 0.0;
  double v17 = 0.0;
  double v15 = 0.0;
  v13 = [MEMORY[0x1E4F428B8] systemRedColor];
  [v13 getRed:&v17 green:&v16 blue:&v15 alpha:0];

  v14 = [MEMORY[0x1E4F428B8] colorWithRed:v17 green:v16 blue:v15 alpha:0.35];
  [v14 setStroke];

  [v9 stroke];
}

- (CALayer)badgeLayer
{
  badgeLayer = self->_badgeLayer;
  if (!badgeLayer)
  {
    v4 = [MEMORY[0x1E4F39BE8] layer];
    id v5 = [MEMORY[0x1E4F428B8] clearColor];
    -[CALayer setBackgroundColor:](v4, "setBackgroundColor:", [v5 CGColor]);

    [(CALayer *)v4 setCornerRadius:9.0];
    [(CALayer *)v4 setOpaque:0];
    objc_super v6 = [(HUCameraEventReachabilityCell *)self layer];
    [v6 addSublayer:v4];

    v7 = HUImageNamed(@"CameraEventMarkerCameraOffline");
    [(HUCameraEventReachabilityCell *)self bounds];
    double v9 = v8;
    double v11 = v10;
    [v7 size];
    double v13 = v12;
    [v7 size];
    -[CALayer setFrame:](v4, "setFrame:", v9 + 18.0, v11 * 0.5 + -9.0, v13, v14);
    id v15 = v7;
    -[CALayer setContents:](v4, "setContents:", [v15 CGImage]);
    [(CALayer *)v4 setHidden:1];
    double v16 = self->_badgeLayer;
    self->_badgeLayer = v4;

    badgeLayer = self->_badgeLayer;
  }

  return badgeLayer;
}

+ (id)backgroundColor
{
  return (id)[MEMORY[0x1E4F428B8] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.22];
}

- (void)updateWithReachabilityEventContainer:(id)a3 mode:(unint64_t)a4
{
  id v9 = a3;
  [(HUCameraEventReachabilityCell *)self setDisplayMode:a4];
  [(HUCameraEventReachabilityCell *)self setReachabilityEvent:v9];
  objc_super v6 = [v9 endEvent];
  if (v6)
  {
    v7 = [v9 endEvent];
    -[HUCameraEventReachabilityCell setNeedsFullDashedLineWidth:](self, "setNeedsFullDashedLineWidth:", [v7 containerType] == 2);
  }
  else
  {
    [(HUCameraEventReachabilityCell *)self setNeedsFullDashedLineWidth:1];
  }

  if (!self->_badgeLayer)
  {
    double v8 = [(HUCameraEventReachabilityCell *)self badgeLayer];
    [v8 setHidden:0];
  }
  [(HUCameraEventReachabilityCell *)self setNeedsDisplay];
}

- (id)accessibilityLabel
{
  if ([MEMORY[0x1E4F69758] isInternalInstall])
  {
    v3 = NSString;
    v4 = [(HUCameraEventReachabilityCell *)self reachabilityEvent];
    id v5 = [v4 uniqueIdentifier];
    objc_super v6 = [(HUCameraEventReachabilityCell *)self reachabilityEvent];
    v7 = [v6 dateOfOccurrence];
    double v8 = [v3 stringWithFormat:@"Reachability Event UUID:%@ Date:%@", v5, v7];
  }
  else
  {
    v4 = [(HUCameraEventReachabilityCell *)self reachabilityEvent];
    double v8 = [v4 displayDescription];
  }

  return v8;
}

- (unint64_t)displayMode
{
  return self->_displayMode;
}

- (void)setDisplayMode:(unint64_t)a3
{
  self->_displayMode = a3;
}

- (HFCameraScrubberReachabilityEventContainer)reachabilityEvent
{
  return self->_reachabilityEvent;
}

- (void)setReachabilityEvent:(id)a3
{
}

- (void)setBadgeLayer:(id)a3
{
}

- (BOOL)needsFullDashedLineWidth
{
  return self->_needsFullDashedLineWidth;
}

- (void)setNeedsFullDashedLineWidth:(BOOL)a3
{
  self->_needsFullDashedLineWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeLayer, 0);

  objc_storeStrong((id *)&self->_reachabilityEvent, 0);
}

@end