@interface LPTextRowStyle
- (LPTextRowStyle)initWithPlatform:(int64_t)a3 fontScalingFactor:(double)a4;
- (LPTextViewStyle)leading;
- (LPTextViewStyle)trailing;
- (id)left;
- (id)right;
- (int64_t)balancingMode;
- (void)applyToAllTextViewStyles:(id)a3;
- (void)setBalancingMode:(int64_t)a3;
@end

@implementation LPTextRowStyle

- (LPTextRowStyle)initWithPlatform:(int64_t)a3 fontScalingFactor:(double)a4
{
  v13.receiver = self;
  v13.super_class = (Class)LPTextRowStyle;
  v6 = [(LPTextRowStyle *)&v13 init];
  if (v6)
  {
    v7 = [[LPTextViewStyle alloc] initWithPlatform:a3 fontScalingFactor:a4];
    leading = v6->_leading;
    v6->_leading = v7;

    [(LPTextViewStyle *)v6->_leading setTextAlignment:0];
    v9 = [[LPTextViewStyle alloc] initWithPlatform:a3 fontScalingFactor:a4];
    trailing = v6->_trailing;
    v6->_trailing = v9;

    [(LPTextViewStyle *)v6->_trailing setTextAlignment:1];
    v6->_balancingMode = 0;
    v11 = v6;
  }

  return v6;
}

- (id)left
{
  if (appIsLTR()) {
    [(LPTextRowStyle *)self leading];
  }
  else {
  v3 = [(LPTextRowStyle *)self trailing];
  }

  return v3;
}

- (id)right
{
  if (appIsLTR()) {
    [(LPTextRowStyle *)self trailing];
  }
  else {
  v3 = [(LPTextRowStyle *)self leading];
  }

  return v3;
}

- (void)applyToAllTextViewStyles:(id)a3
{
  v4 = (void (**)(id, LPTextViewStyle *))a3;
  v4[2](v4, self->_leading);
  v4[2](v4, self->_trailing);
}

- (LPTextViewStyle)leading
{
  return self->_leading;
}

- (LPTextViewStyle)trailing
{
  return self->_trailing;
}

- (int64_t)balancingMode
{
  return self->_balancingMode;
}

- (void)setBalancingMode:(int64_t)a3
{
  self->_balancingMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailing, 0);

  objc_storeStrong((id *)&self->_leading, 0);
}

@end