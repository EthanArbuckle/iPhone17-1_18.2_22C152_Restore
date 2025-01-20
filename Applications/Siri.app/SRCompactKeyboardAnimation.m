@interface SRCompactKeyboardAnimation
- (CGRect)beginningFrame;
- (CGRect)endingFrame;
- (SRCompactKeyboardAnimation)initWithDuration:(double)a3 curve:(int64_t)a4 beginningFrame:(CGRect)a5 endingFrame:(CGRect)a6;
- (SRCompactKeyboardAnimation)initWithKeyboardNotification:(id)a3;
- (double)duration;
- (unint64_t)options;
@end

@implementation SRCompactKeyboardAnimation

- (SRCompactKeyboardAnimation)initWithDuration:(double)a3 curve:(int64_t)a4 beginningFrame:(CGRect)a5 endingFrame:(CGRect)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)SRCompactKeyboardAnimation;
  result = [(SRCompactKeyboardAnimation *)&v14 init];
  if (result)
  {
    result->_duration = a3;
    if ((unint64_t)(a4 - 1) >= 3) {
      unint64_t v13 = 0;
    }
    else {
      unint64_t v13 = ((a4 - 1) << 16) + 0x10000;
    }
    result->_options = v13;
    result->_beginningFrame.origin.CGFloat x = x;
    result->_beginningFrame.origin.CGFloat y = y;
    result->_beginningFrame.size.CGFloat width = width;
    result->_beginningFrame.size.CGFloat height = height;
    result->_endingFrame = a6;
  }
  return result;
}

- (SRCompactKeyboardAnimation)initWithKeyboardNotification:(id)a3
{
  id v4 = a3;
  if (sub_10003B2AC(v4))
  {
    v5 = [v4 userInfo];
    v6 = [v5 objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    [v6 doubleValue];
    double v8 = v7;

    if (v8 == 0.0)
    {
      v9 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
        sub_1000B7EF0(v9);
      }
      v10 = 0;
    }
    else
    {
      v12 = [v5 objectForKey:UIKeyboardAnimationCurveUserInfoKey];
      id v13 = [v12 unsignedIntegerValue];

      objc_super v14 = [v5 objectForKey:UIKeyboardFrameBeginUserInfoKey];
      [v14 CGRectValue];
      double v32 = v15;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;

      v22 = [v5 objectForKey:UIKeyboardFrameEndUserInfoKey];
      [v22 CGRectValue];
      uint64_t v24 = v23;
      uint64_t v26 = v25;
      uint64_t v28 = v27;
      uint64_t v30 = v29;

      self = -[SRCompactKeyboardAnimation initWithDuration:curve:beginningFrame:endingFrame:](self, "initWithDuration:curve:beginningFrame:endingFrame:", v13, v8, v32, v17, v19, v21, v24, v26, v28, v30);
      v10 = self;
    }
  }
  else
  {
    v11 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_FAULT)) {
      sub_1000B7F74(v11, v4);
    }
    v10 = 0;
  }

  return v10;
}

- (double)duration
{
  return self->_duration;
}

- (unint64_t)options
{
  return self->_options;
}

- (CGRect)beginningFrame
{
  double x = self->_beginningFrame.origin.x;
  double y = self->_beginningFrame.origin.y;
  double width = self->_beginningFrame.size.width;
  double height = self->_beginningFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)endingFrame
{
  double x = self->_endingFrame.origin.x;
  double y = self->_endingFrame.origin.y;
  double width = self->_endingFrame.size.width;
  double height = self->_endingFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end