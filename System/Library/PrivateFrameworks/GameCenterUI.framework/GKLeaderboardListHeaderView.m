@interface GKLeaderboardListHeaderView
+ (double)defaultHeight;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation GKLeaderboardListHeaderView

+ (double)defaultHeight
{
  return 172.0;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  self->_titleLabel = (UILabel *)a3;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  self->_subtitleLabel = (UILabel *)a3;
}

@end