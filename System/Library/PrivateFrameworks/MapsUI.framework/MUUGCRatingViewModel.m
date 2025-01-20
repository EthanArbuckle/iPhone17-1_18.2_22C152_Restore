@interface MUUGCRatingViewModel
- (MUUGCRatingViewModel)initWithCategory:(id)a3 value:(id)a4;
- (NSNumber)value;
- (NSString)category;
@end

@implementation MUUGCRatingViewModel

- (MUUGCRatingViewModel)initWithCategory:(id)a3 value:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MUUGCRatingViewModel;
  v9 = [(MUUGCRatingViewModel *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_category, a3);
    objc_storeStrong((id *)&v10->_value, a4);
  }

  return v10;
}

- (NSString)category
{
  return self->_category;
}

- (NSNumber)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

@end