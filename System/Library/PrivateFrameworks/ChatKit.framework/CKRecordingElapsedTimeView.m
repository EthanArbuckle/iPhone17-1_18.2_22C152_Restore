@interface CKRecordingElapsedTimeView
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKRecordingElapsedTimeView)initWithCoder:(id)a3;
- (CKRecordingElapsedTimeView)initWithFrame:(CGRect)a3;
- (NSDate)_startTime;
- (NSDateComponentsFormatter)_durationFormatter;
- (NSTimer)_updateTimer;
- (UILabel)_timeLabel;
- (UIView)_recordingDotView;
- (void)_beginRecordingAnimation;
- (void)_commonCAMElapsedTimeViewInitialization;
- (void)_endRecordingAnimation;
- (void)_update:(id)a3;
- (void)dealloc;
- (void)endTimer;
- (void)layoutSubviews;
- (void)resetTimer;
- (void)startTimer;
@end

@implementation CKRecordingElapsedTimeView

- (void)_commonCAMElapsedTimeViewInitialization
{
  v3 = (NSDateComponentsFormatter *)objc_opt_new();
  durationFormatter = self->__durationFormatter;
  self->__durationFormatter = v3;

  [(NSDateComponentsFormatter *)self->__durationFormatter setUnitsStyle:0];
  [(NSDateComponentsFormatter *)self->__durationFormatter setZeroFormattingBehavior:0x10000];
  [(NSDateComponentsFormatter *)self->__durationFormatter setAllowedUnits:224];
  id v5 = objc_alloc(MEMORY[0x1E4F42B38]);
  v6 = (UILabel *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  timeLabel = self->__timeLabel;
  self->__timeLabel = v6;

  v8 = self->__timeLabel;
  v9 = [MEMORY[0x1E4FB08E0] fontWithName:@"DINAlternate-Bold" size:20.0];
  [(UILabel *)v8 setFont:v9];

  v10 = self->__timeLabel;
  v11 = [MEMORY[0x1E4F428B8] whiteColor];
  [(UILabel *)v10 setTextColor:v11];

  [(UILabel *)self->__timeLabel setTextAlignment:1];
  v12 = self->__timeLabel;
  v13 = [MEMORY[0x1E4F428B8] clearColor];
  [(UILabel *)v12 setBackgroundColor:v13];

  v14 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
  recordingDotView = self->__recordingDotView;
  self->__recordingDotView = v14;

  [(UIView *)self->__recordingDotView setAlpha:0.0];
  v16 = self->__recordingDotView;
  v17 = +[CKUIBehavior sharedBehaviors];
  v18 = [v17 theme];
  v19 = [v18 activeRecordingDotColor];
  [(UIView *)v16 setBackgroundColor:v19];

  [(CKRecordingElapsedTimeView *)self addSubview:self->__timeLabel];
  [(CKRecordingElapsedTimeView *)self addSubview:self->__recordingDotView];

  [(CKRecordingElapsedTimeView *)self _update:0];
}

- (CKRecordingElapsedTimeView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKRecordingElapsedTimeView;
  v3 = -[CKRecordingElapsedTimeView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CKRecordingElapsedTimeView *)v3 _commonCAMElapsedTimeViewInitialization];
    id v5 = v4;
  }

  return v4;
}

- (CKRecordingElapsedTimeView)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKRecordingElapsedTimeView;
  v3 = [(CKRecordingElapsedTimeView *)&v7 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    [(CKRecordingElapsedTimeView *)v3 _commonCAMElapsedTimeViewInitialization];
    id v5 = v4;
  }

  return v4;
}

- (void)dealloc
{
  updateTimer = self->__updateTimer;
  self->__updateTimer = 0;

  startTime = self->__startTime;
  self->__startTime = 0;

  v5.receiver = self;
  v5.super_class = (Class)CKRecordingElapsedTimeView;
  [(CKRecordingElapsedTimeView *)&v5 dealloc];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UILabel sizeThatFits:](self->__timeLabel, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)CKRecordingElapsedTimeView;
  [(CKRecordingElapsedTimeView *)&v18 layoutSubviews];
  [(CKRecordingElapsedTimeView *)self bounds];
  double x = v19.origin.x;
  double y = v19.origin.y;
  double width = v19.size.width;
  double height = v19.size.height;
  CGRectGetMinX(v19);
  v20.origin.double x = x;
  v20.origin.double y = y;
  v20.size.double width = width;
  v20.size.double height = height;
  CGRectGetMinY(v20);
  UIRectCenteredIntegralRectScale();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v21.origin.double x = x;
  v21.origin.double y = y;
  v21.size.double width = width;
  v21.size.double height = height;
  double MinX = CGRectGetMinX(v21);
  v14 = objc_msgSend(MEMORY[0x1E4F42D90], "mainScreen", 0);
  [v14 scale];
  double v16 = MinX - (1.0 / v15 + 12.0);

  -[UIView setFrame:](self->__recordingDotView, "setFrame:", v16, v8, v10, v12);
  v17 = [(UIView *)self->__recordingDotView layer];
  [v17 setCornerRadius:v12 * 0.5];

  -[UILabel setFrame:](self->__timeLabel, "setFrame:", x, y, width, height);
}

- (void)_update:(id)a3
{
  [(NSDate *)self->__startTime timeIntervalSinceNow];
  id v5 = [(NSDateComponentsFormatter *)self->__durationFormatter stringFromTimeInterval:0.0 - v4];
  [(UILabel *)self->__timeLabel setText:v5];
}

- (void)startTimer
{
  double v3 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  startTime = self->__startTime;
  self->__startTime = v3;

  [(NSTimer *)self->__updateTimer invalidate];
  id v5 = (NSTimer *)[objc_alloc(MEMORY[0x1E4F1CB00]) initWithFireDate:self->__startTime interval:self target:sel__update_ selector:0 userInfo:1 repeats:0.2];
  updateTimer = self->__updateTimer;
  self->__updateTimer = v5;

  double v7 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  [v7 addTimer:self->__updateTimer forMode:*MEMORY[0x1E4F1C3A0]];

  double v8 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  [v8 addTimer:self->__updateTimer forMode:*MEMORY[0x1E4F43EA8]];

  [(CKRecordingElapsedTimeView *)self _beginRecordingAnimation];
}

- (void)endTimer
{
  [(NSTimer *)self->__updateTimer invalidate];
  updateTimer = self->__updateTimer;
  self->__updateTimer = 0;

  startTime = self->__startTime;
  self->__startTime = 0;

  [(CKRecordingElapsedTimeView *)self _endRecordingAnimation];
}

- (void)resetTimer
{
  [(CKRecordingElapsedTimeView *)self endTimer];
  [(CKRecordingElapsedTimeView *)self _update:0];

  [(CKRecordingElapsedTimeView *)self startTimer];
}

- (void)_beginRecordingAnimation
{
  v18[2] = *MEMORY[0x1E4F143B8];
  [(UIView *)self->__recordingDotView setAlpha:1.0];
  double v3 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
  [v3 setValues:&unk_1EDF15530];
  [v3 setKeyTimes:&unk_1EDF15548];
  UIAnimationDragCoefficient();
  [v3 setDuration:v4 * 0.82];
  [v3 setFillMode:*MEMORY[0x1E4F39FA0]];
  LODWORD(v5) = 2139095040;
  [v3 setRepeatCount:v5];
  LODWORD(v6) = 998490346;
  LODWORD(v7) = 1013385185;
  LODWORD(v8) = 1.0;
  LODWORD(v9) = 1.0;
  double v10 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v8 :v6 :v7 :v9];
  v18[0] = v10;
  LODWORD(v11) = 1063043161;
  LODWORD(v12) = 993744730;
  LODWORD(v13) = 1002018232;
  LODWORD(v14) = 1065285772;
  double v15 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v11 :v12 :v13 :v14];
  v18[1] = v15;
  double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  [v3 setTimingFunctions:v16];

  v17 = [(UIView *)self->__recordingDotView layer];
  [v17 addAnimation:v3 forKey:@"recordingAnimation"];
}

- (void)_endRecordingAnimation
{
  id v3 = [(UIView *)self->__recordingDotView layer];
  [v3 removeAllAnimations];
  [(UIView *)self->__recordingDotView setAlpha:0.0];
}

- (NSDateComponentsFormatter)_durationFormatter
{
  return self->__durationFormatter;
}

- (UILabel)_timeLabel
{
  return self->__timeLabel;
}

- (UIView)_recordingDotView
{
  return self->__recordingDotView;
}

- (NSTimer)_updateTimer
{
  return self->__updateTimer;
}

- (NSDate)_startTime
{
  return self->__startTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__startTime, 0);
  objc_storeStrong((id *)&self->__updateTimer, 0);
  objc_storeStrong((id *)&self->__recordingDotView, 0);
  objc_storeStrong((id *)&self->__timeLabel, 0);

  objc_storeStrong((id *)&self->__durationFormatter, 0);
}

@end