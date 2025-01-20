@interface GKPeerPickerTableViewCell
+ (double)separatorHeight;
- (BOOL)topSeparator;
- (GKPeerPickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation GKPeerPickerTableViewCell

+ (double)separatorHeight
{
  return 0.0;
}

- (GKPeerPickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)GKPeerPickerTableViewCell;
  return [(GKPeerPickerTableViewCell *)&v5 initWithStyle:a3 reuseIdentifier:a4];
}

- (BOOL)topSeparator
{
  return self->_topSeparator;
}

@end