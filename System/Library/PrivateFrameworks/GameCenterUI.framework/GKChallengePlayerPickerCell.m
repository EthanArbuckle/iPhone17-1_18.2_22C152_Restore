@interface GKChallengePlayerPickerCell
- (void)setSelected:(BOOL)a3;
@end

@implementation GKChallengePlayerPickerCell

- (void)setSelected:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GKChallengePlayerPickerCell;
  [(GKDashboardPlayerPickerCell *)&v6 setSelected:a3];
  v4 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.0700000003];
  v5 = [(GKChallengePlayerPickerCell *)self contentView];
  [v5 setBackgroundColor:v4];
}

@end