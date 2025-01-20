@interface GKDashboardLeaderboardScoreHeaderView
+ (double)defaultHeight;
- (GKTimeScopeButton)timeScopeButton;
- (NSString)title;
- (SEL)timeScopeAction;
- (UILabel)titleLabel;
- (id)timeScopeTarget;
- (int64_t)timeScope;
- (void)awakeFromNib;
- (void)setTimeScope:(int64_t)a3;
- (void)setTimeScopeAction:(SEL)a3;
- (void)setTimeScopeButton:(id)a3;
- (void)setTimeScopeTarget:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)timeScopePressed:(id)a3;
@end

@implementation GKDashboardLeaderboardScoreHeaderView

+ (double)defaultHeight
{
  return 31.0;
}

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)GKDashboardLeaderboardScoreHeaderView;
  [(GKDashboardLeaderboardScoreHeaderView *)&v3 awakeFromNib];
  [(GKDashboardLeaderboardScoreHeaderView *)self setClipsToBounds:0];
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setTimeScope:(int64_t)a3
{
}

- (int64_t)timeScope
{
  return [(GKTimeScopeButton *)self->_timeScopeButton timeScope];
}

- (void)timeScopePressed:(id)a3
{
  id v4 = a3;
  id timeScopeTarget = self->_timeScopeTarget;
  if (timeScopeTarget)
  {
    SEL timeScopeAction = self->_timeScopeAction;
    if (timeScopeAction)
    {
      id v7 = v4;
      id timeScopeTarget = (id)[timeScopeTarget _gkPerformSelector:timeScopeAction withObject:self->_timeScopeButton];
      id v4 = v7;
    }
  }

  MEMORY[0x1F41817F8](timeScopeTarget, v4);
}

- (id)timeScopeTarget
{
  return self->_timeScopeTarget;
}

- (void)setTimeScopeTarget:(id)a3
{
  self->_id timeScopeTarget = a3;
}

- (SEL)timeScopeAction
{
  if (self->_timeScopeAction) {
    return self->_timeScopeAction;
  }
  else {
    return 0;
  }
}

- (void)setTimeScopeAction:(SEL)a3
{
  if (a3) {
    objc_super v3 = a3;
  }
  else {
    objc_super v3 = 0;
  }
  self->_SEL timeScopeAction = v3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  self->_titleLabel = (UILabel *)a3;
}

- (GKTimeScopeButton)timeScopeButton
{
  return self->_timeScopeButton;
}

- (void)setTimeScopeButton:(id)a3
{
  self->_timeScopeButton = (GKTimeScopeButton *)a3;
}

@end