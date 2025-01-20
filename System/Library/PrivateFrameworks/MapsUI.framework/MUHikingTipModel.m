@interface MUHikingTipModel
- (MUHikingTipModel)initWithHikingTipViewModel:(id)a3;
- (NSString)subtitle;
- (NSString)title;
@end

@implementation MUHikingTipModel

- (MUHikingTipModel)initWithHikingTipViewModel:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MUHikingTipModel;
  v5 = [(MUHikingTipModel *)&v13 init];
  if (v5)
  {
    v6 = [v4 title];
    uint64_t v7 = [v6 copy];
    title = v5->_title;
    v5->_title = (NSString *)v7;

    v9 = [v4 subtitle];
    uint64_t v10 = [v9 copy];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v10;
  }
  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end