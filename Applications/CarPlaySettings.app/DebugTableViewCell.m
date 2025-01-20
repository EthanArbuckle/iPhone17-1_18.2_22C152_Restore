@interface DebugTableViewCell
+ (id)reuseIdentifier;
- (DebugTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation DebugTableViewCell

+ (id)reuseIdentifier
{
  return @"DebugTableViewCell";
}

- (DebugTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)DebugTableViewCell;
  return [(DebugTableViewCell *)&v5 initWithStyle:a3 reuseIdentifier:a4];
}

@end