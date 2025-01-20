@interface CXAnswerCallAction
+ (BOOL)supportsSecureCoding;
+ (double)timeout;
- (BOOL)downgradeToAudio;
- (BOOL)pauseVideoToStart;
- (BOOL)screening;
- (CGSize)localLandscapeAspectRatio;
- (CGSize)localPortraitAspectRatio;
- (CXAnswerCallAction)initWithCoder:(id)a3;
- (NSDate)dateConnected;
- (id)customDescription;
- (void)encodeWithCoder:(id)a3;
- (void)fulfill;
- (void)fulfillWithDateConnected:(NSDate *)dateConnected;
- (void)setDateConnected:(id)a3;
- (void)setDowngradeToAudio:(BOOL)a3;
- (void)setLocalLandscapeAspectRatio:(CGSize)a3;
- (void)setLocalPortraitAspectRatio:(CGSize)a3;
- (void)setPauseVideoToStart:(BOOL)a3;
- (void)setScreening:(BOOL)a3;
- (void)updateAsFulfilledWithDateConnected:(id)a3;
- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4;
- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXAnswerCallAction

- (id)customDescription
{
  v8.receiver = self;
  v8.super_class = (Class)CXAnswerCallAction;
  v3 = [(CXCallAction *)&v8 customDescription];
  [(CXAnswerCallAction *)self localLandscapeAspectRatio];
  v4 = NSStringFromSize(v10);
  [v3 appendFormat:@" localLandscapeAspectRatio=%@", v4];

  [(CXAnswerCallAction *)self localPortraitAspectRatio];
  v5 = NSStringFromSize(v11);
  [v3 appendFormat:@" localPortraitAspectRatio=%@", v5];

  v6 = [(CXAnswerCallAction *)self dateConnected];
  [v3 appendFormat:@" dateConnected=%@", v6];

  objc_msgSend(v3, "appendFormat:", @" downgradeToAudio=%d", -[CXAnswerCallAction downgradeToAudio](self, "downgradeToAudio"));
  objc_msgSend(v3, "appendFormat:", @" pauseVideoToStart=%d", -[CXAnswerCallAction pauseVideoToStart](self, "pauseVideoToStart"));
  objc_msgSend(v3, "appendFormat:", @" screening=%d", -[CXAnswerCallAction screening](self, "screening"));

  return v3;
}

- (void)fulfill
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [(CXAnswerCallAction *)self fulfillWithDateConnected:v3];
}

- (void)fulfillWithDateConnected:(NSDate *)dateConnected
{
  v6 = dateConnected;
  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXAnswerCallAction fulfillWithDateConnected:]", @"dateConnected" format];
  }
  v4 = (void *)[(CXAnswerCallAction *)self copy];
  [v4 updateAsFulfilledWithDateConnected:v6];
  v5 = [v4 delegate];
  [v5 actionCompleted:v4];
}

- (void)updateAsFulfilledWithDateConnected:(id)a3
{
  id v4 = a3;
  [(CXAction *)self updateAsFulfilled];
  [(CXAnswerCallAction *)self setDateConnected:v4];
}

+ (double)timeout
{
  return 60.0;
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CXAnswerCallAction;
  id v6 = a3;
  [(CXCallAction *)&v8 updateSanitizedCopy:v6 withZone:a4];
  v7 = [(CXAnswerCallAction *)self dateConnected];
  [v6 setDateConnected:v7];
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CXAnswerCallAction;
  id v6 = a3;
  [(CXAction *)&v7 updateCopy:v6 withZone:a4];
  [(CXAnswerCallAction *)self localLandscapeAspectRatio];
  objc_msgSend(v6, "setLocalLandscapeAspectRatio:");
  [(CXAnswerCallAction *)self localPortraitAspectRatio];
  objc_msgSend(v6, "setLocalPortraitAspectRatio:");
  objc_msgSend(v6, "setDowngradeToAudio:", -[CXAnswerCallAction downgradeToAudio](self, "downgradeToAudio"));
  objc_msgSend(v6, "setPauseVideoToStart:", -[CXAnswerCallAction pauseVideoToStart](self, "pauseVideoToStart"));
  objc_msgSend(v6, "setScreening:", -[CXAnswerCallAction screening](self, "screening"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXAnswerCallAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CXAnswerCallAction;
  v5 = [(CXCallAction *)&v22 initWithCoder:v4];
  id v6 = v5;
  if (v5)
  {
    p_localLandscapeAspectRatio = &v5->_localLandscapeAspectRatio;
    objc_super v8 = NSStringFromSelector(sel_localLandscapeAspectRatio);
    [v4 decodeSizeForKey:v8];
    *(void *)&p_localLandscapeAspectRatio->width = v9;
    v6->_localLandscapeAspectRatio.height = v10;

    NSSize v11 = NSStringFromSelector(sel_localPortraitAspectRatio);
    [v4 decodeSizeForKey:v11];
    v6->_localPortraitAspectRatio.width = v12;
    v6->_localPortraitAspectRatio.height = v13;

    uint64_t v14 = objc_opt_class();
    v15 = NSStringFromSelector(sel_dateConnected);
    uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
    dateConnected = v6->_dateConnected;
    v6->_dateConnected = (NSDate *)v16;

    v18 = NSStringFromSelector(sel_downgradeToAudio);
    v6->_downgradeToAudio = [v4 decodeBoolForKey:v18];

    v19 = NSStringFromSelector(sel_pauseVideoToStart);
    v6->_pauseVideoToStart = [v4 decodeBoolForKey:v19];

    v20 = NSStringFromSelector(sel_screening);
    v6->_screening = [v4 decodeBoolForKey:v20];
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v23.receiver = self;
  v23.super_class = (Class)CXAnswerCallAction;
  id v4 = a3;
  [(CXCallAction *)&v23 encodeWithCoder:v4];
  [(CXAnswerCallAction *)self localLandscapeAspectRatio];
  double v6 = v5;
  double v8 = v7;
  v9 = NSStringFromSelector(sel_localLandscapeAspectRatio);
  objc_msgSend(v4, "encodeSize:forKey:", v9, v6, v8);

  [(CXAnswerCallAction *)self localPortraitAspectRatio];
  double v11 = v10;
  double v13 = v12;
  uint64_t v14 = NSStringFromSelector(sel_localPortraitAspectRatio);
  objc_msgSend(v4, "encodeSize:forKey:", v14, v11, v13);

  v15 = [(CXAnswerCallAction *)self dateConnected];
  uint64_t v16 = NSStringFromSelector(sel_dateConnected);
  [v4 encodeObject:v15 forKey:v16];

  BOOL v17 = [(CXAnswerCallAction *)self downgradeToAudio];
  v18 = NSStringFromSelector(sel_downgradeToAudio);
  [v4 encodeBool:v17 forKey:v18];

  BOOL v19 = [(CXAnswerCallAction *)self pauseVideoToStart];
  v20 = NSStringFromSelector(sel_pauseVideoToStart);
  [v4 encodeBool:v19 forKey:v20];

  BOOL v21 = [(CXAnswerCallAction *)self screening];
  objc_super v22 = NSStringFromSelector(sel_screening);
  [v4 encodeBool:v21 forKey:v22];
}

- (CGSize)localPortraitAspectRatio
{
  double width = self->_localPortraitAspectRatio.width;
  double height = self->_localPortraitAspectRatio.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLocalPortraitAspectRatio:(CGSize)a3
{
  self->_localPortraitAspectRatio = a3;
}

- (CGSize)localLandscapeAspectRatio
{
  double width = self->_localLandscapeAspectRatio.width;
  double height = self->_localLandscapeAspectRatio.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLocalLandscapeAspectRatio:(CGSize)a3
{
  self->_localLandscapeAspectRatio = a3;
}

- (BOOL)downgradeToAudio
{
  return self->_downgradeToAudio;
}

- (void)setDowngradeToAudio:(BOOL)a3
{
  self->_downgradeToAudio = a3;
}

- (BOOL)pauseVideoToStart
{
  return self->_pauseVideoToStart;
}

- (void)setPauseVideoToStart:(BOOL)a3
{
  self->_pauseVideoToStart = a3;
}

- (BOOL)screening
{
  return self->_screening;
}

- (void)setScreening:(BOOL)a3
{
  self->_screening = a3;
}

- (NSDate)dateConnected
{
  return self->_dateConnected;
}

- (void)setDateConnected:(id)a3
{
}

- (void).cxx_destruct
{
}

@end