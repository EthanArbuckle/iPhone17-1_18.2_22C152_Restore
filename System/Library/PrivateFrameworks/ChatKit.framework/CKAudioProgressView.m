@interface CKAudioProgressView
+ (float)progressForTime:(double)a3 duration:(double)a4;
+ (id)imageWithType:(unsigned __int8)a3 color:(char)a4;
+ (id)templateImageWithControlImage:(id)a3;
+ (id)templateImageWithType:(unsigned __int8)a3;
- (BOOL)isPlayed;
- (BOOL)isPlaying;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKAudioProgressView)initWithFrame:(CGRect)a3;
- (IMManualUpdater)displayUpdater;
- (char)color;
- (float)progress;
- (void)prepareForDisplay;
- (void)prepareForDisplayIfNeeded;
- (void)setColor:(char)a3;
- (void)setDisplayUpdater:(id)a3;
- (void)setNeedsPrepareForDisplay;
- (void)setPlayed:(BOOL)a3;
- (void)setPlaying:(BOOL)a3;
- (void)setProgress:(float)a3;
@end

@implementation CKAudioProgressView

- (CKAudioProgressView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKAudioProgressView;
  v3 = -[CKBalloonImageView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CKAudioProgressView *)v3 setOpaque:0];
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F6C368]) initWithTarget:v4 action:sel_prepareForDisplay];
    [(CKAudioProgressView *)v4 setDisplayUpdater:v5];
  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = +[CKUIBehavior sharedBehaviors];
  [v3 audioProgressViewSize];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

+ (float)progressForTime:(double)a3 duration:(double)a4
{
  float v4 = 0.0;
  if (a3 != 0.0)
  {
    float v4 = 1.0;
    if (a3 != a4)
    {
      if (a4 >= 0.05) {
        a3 = a3 + 0.05;
      }
      float v4 = a3 / a4;
    }
  }
  double v5 = v4;
  if (v4 > 1.0) {
    double v5 = 1.0;
  }
  return fmax(v5, 0.0);
}

- (void)setProgress:(float)a3
{
  double v3 = a3;
  if (v3 > 1.0) {
    double v3 = 1.0;
  }
  float v4 = fmax(v3, 0.0);
  if (self->_progress != v4)
  {
    self->_progress = v4;
    [(CKAudioProgressView *)self setNeedsPrepareForDisplay];
  }
}

- (void)setPlaying:(BOOL)a3
{
  if (self->_playing != a3)
  {
    self->_playing = a3;
    [(CKAudioProgressView *)self setNeedsPrepareForDisplay];
  }
}

- (void)setPlayed:(BOOL)a3
{
  if (self->_played != a3)
  {
    self->_played = a3;
    [(CKAudioProgressView *)self setNeedsPrepareForDisplay];
  }
}

- (void)setColor:(char)a3
{
  if (self->_color != a3)
  {
    self->_color = a3;
    [(CKAudioProgressView *)self setNeedsPrepareForDisplay];
  }
}

- (void)prepareForDisplay
{
  BOOL v3 = [(CKAudioProgressView *)self isPlaying];
  [(CKAudioProgressView *)self progress];
  float v5 = v4;
  uint64_t v6 = [(CKAudioProgressView *)self color];
  double v7 = +[CKAudioProgressView imageWithType:v3 color:v6];
  CGFloat v8 = *MEMORY[0x1E4F1DAD8];
  CGFloat v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v10 = +[CKUIBehavior sharedBehaviors];
  [v10 audioProgressViewSize];
  double v12 = v11;
  CGFloat v14 = v13;

  v31.origin.x = v8;
  v31.origin.y = v9;
  v31.size.width = v12;
  v31.size.height = v14;
  double MidX = CGRectGetMidX(v31);
  v32.origin.x = v8;
  v32.origin.y = v9;
  v32.size.width = v12;
  v32.size.height = v14;
  double MidY = CGRectGetMidY(v32);
  v17 = +[CKUIBehavior sharedBehaviors];
  v18 = [v17 theme];
  v19 = [v18 progressViewColorForColorType:v6];

  v20 = [(CKAudioProgressView *)self traitCollection];
  CGFloat v21 = 4.0;
  if ([v20 userInterfaceIdiom] != 6)
  {
    v22 = [(CKAudioProgressView *)self traitCollection];
    [v22 displayScale];
    CGFloat v21 = v23;
  }
  v30.width = v12;
  v30.height = v14;
  UIGraphicsBeginImageContextWithOptions(v30, 0, v21);
  if (v5 > 0.0)
  {
    v24 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, (v12 + -3.0) * 0.5, -1.57079633, v5 * 6.28318531 + -1.57079633);
    [v19 set];
    [v24 setLineWidth:3.0];
    [v24 stroke];
  }
  [v7 size];
  double v26 = MidX - v25 * 0.5;
  [v7 size];
  objc_msgSend(v7, "drawAtPoint:", v26, MidY - v27 * 0.5);
  UIGraphicsGetImageFromCurrentImageContext();
  id v28 = (id)objc_claimAutoreleasedReturnValue();

  UIGraphicsEndImageContext();
  [(CKBalloonImageView *)self setImage:v28];
}

- (void)prepareForDisplayIfNeeded
{
  id v2 = [(CKAudioProgressView *)self displayUpdater];
  [v2 updateIfNeeded];
}

- (void)setNeedsPrepareForDisplay
{
  id v2 = [(CKAudioProgressView *)self displayUpdater];
  [v2 setNeedsUpdate];
}

+ (id)imageWithType:(unsigned __int8)a3 color:(char)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  double v7 = CKAudioProgressImageCache();
  v15[0] = v4;
  v15[1] = v5;
  v15[2] = 0;
  CGFloat v8 = [MEMORY[0x1E4F29238] value:v15 withObjCType:"{?=cCB}"];
  CGFloat v9 = [v7 objectForKey:v8];
  if (!v9)
  {
    v10 = [a1 templateImageWithType:v5];
    double v11 = +[CKUIBehavior sharedBehaviors];
    double v12 = [v11 theme];
    double v13 = [v12 progressViewColorForColorType:v4];
    CGFloat v9 = [v10 _flatImageWithColor:v13];

    [v7 setObject:v9 forKey:v8];
  }

  return v9;
}

+ (id)templateImageWithType:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v4 = CKAudioProgressImageCache();
  v14[0] = 0;
  v14[1] = v3;
  v14[2] = 1;
  uint64_t v5 = [MEMORY[0x1E4F29238] value:v14 withObjCType:"{?=cCB}"];
  uint64_t v6 = [v4 objectForKey:v5];
  if (!v6)
  {
    double v7 = +[CKUIBehavior sharedBehaviors];
    [v7 audioProgressViewSize];
    double v9 = v8 + -10.0;

    v10 = [MEMORY[0x1E4F42A98] configurationWithPointSize:v9];
    if (v3) {
      double v11 = @"pause.circle.fill";
    }
    else {
      double v11 = @"play.circle.fill";
    }
    double v12 = [MEMORY[0x1E4F42A80] systemImageNamed:v11];
    uint64_t v6 = [v12 imageWithSymbolConfiguration:v10];

    [v4 setObject:v6 forKey:v5];
  }

  return v6;
}

+ (id)templateImageWithControlImage:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[CKUIBehavior sharedBehaviors];
  [v4 audioProgressViewSize];
  double v6 = v5;
  double v8 = v7;

  v28.width = v6;
  v28.height = v8;
  UIGraphicsBeginImageContextWithOptions(v28, 0, 0.0);
  double v9 = [MEMORY[0x1E4F428B8] blackColor];
  [v9 set];

  if (v3)
  {
    double v10 = *MEMORY[0x1E4F1DAD8];
    double v11 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [v3 alignmentRectInsets];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    [v3 size];
    double v21 = v20 - (v15 + v19);
    double v23 = v22 - (v13 + v17);
    if (CKMainScreenScale_once_98 != -1) {
      dispatch_once(&CKMainScreenScale_once_98, &__block_literal_global_97_3);
    }
    double v24 = *(double *)&CKMainScreenScale_sMainScreenScale_98;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_98 == 0.0) {
      double v24 = 1.0;
    }
    objc_msgSend(v3, "drawAtPoint:", 1.0 / v24 * (v10 * v24 + floor((v6 * v24 - v21 * v24) * 0.5)) - v15, 1.0 / v24 * (v11 * v24 + floor((v8 * v24 - v23 * v24) * 0.5)) - v13);
  }
  double v25 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v25;
}

- (float)progress
{
  return self->_progress;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (BOOL)isPlayed
{
  return self->_played;
}

- (char)color
{
  return self->_color;
}

- (IMManualUpdater)displayUpdater
{
  return self->_displayUpdater;
}

- (void)setDisplayUpdater:(id)a3
{
}

- (void).cxx_destruct
{
}

@end