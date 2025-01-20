@interface TKTableViewCellSubtitle
- (TKTableViewCellSubtitle)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation TKTableViewCellSubtitle

- (TKTableViewCellSubtitle)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9 = self;
  location[2] = (id)a2;
  location[1] = (id)a3;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v4 = v9;
  v9 = 0;
  v7.receiver = v4;
  v7.super_class = (Class)TKTableViewCellSubtitle;
  v9 = [(TKTableViewCellSubtitle *)&v7 initWithStyle:3 reuseIdentifier:location[0]];
  objc_storeStrong((id *)&v9, v9);
  v6 = v9;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v6;
}

@end