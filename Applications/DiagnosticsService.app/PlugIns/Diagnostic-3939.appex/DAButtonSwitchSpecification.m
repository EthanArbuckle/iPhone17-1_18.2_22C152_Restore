@interface DAButtonSwitchSpecification
- (CGRect)position;
- (DAAsset)asset;
- (DAButtonSwitchSpecification)initWithDictionary:(id)a3;
- (void)setAsset:(id)a3;
- (void)setPosition:(CGRect)a3;
@end

@implementation DAButtonSwitchSpecification

- (DAButtonSwitchSpecification)initWithDictionary:(id)a3
{
  id v4 = a3;
  char v26 = 0;
  v25.receiver = self;
  v25.super_class = (Class)DAButtonSwitchSpecification;
  v5 = [(DASpecification *)&v25 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 dk_dictionaryFromRequiredKey:@"position" failed:&v26];
    v7 = [v6 dk_numberFromRequiredKey:@"x" lowerBound:&off_1000112A8 upperBound:&off_100011298 failed:&v26];
    [v7 doubleValue];
    CGFloat v9 = v8;

    v10 = [v6 dk_numberFromRequiredKey:@"y" lowerBound:&off_1000112A8 upperBound:&off_100011298 failed:&v26];
    [v10 doubleValue];
    CGFloat v12 = v11;

    v13 = [v6 dk_numberFromRequiredKey:@"w" lowerBound:&off_1000112A8 upperBound:&off_100011298 failed:&v26];
    [v13 doubleValue];
    CGFloat v15 = v14;

    v16 = [v6 dk_numberFromRequiredKey:@"h" lowerBound:&off_1000112A8 upperBound:&off_100011298 failed:&v26];
    [v16 doubleValue];
    CGFloat v18 = v17;

    v5->_position.origin.x = v9;
    v5->_position.origin.y = v12;
    v5->_position.size.width = v15;
    v5->_position.size.height = v18;
    v19 = [DAAsset alloc];
    v20 = [v4 dk_dictionaryFromRequiredKey:@"asset" failed:&v26];
    v21 = [(DAAsset *)v19 initWithDictionary:v20];
    asset = v5->_asset;
    v5->_asset = v21;

    BOOL v23 = v26 == 0;
  }
  else
  {
    BOOL v23 = 1;
  }
  if (!v5->_asset || !v23)
  {

    v5 = 0;
  }

  return v5;
}

- (CGRect)position
{
  double x = self->_position.origin.x;
  double y = self->_position.origin.y;
  double width = self->_position.size.width;
  double height = self->_position.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPosition:(CGRect)a3
{
  self->_position = a3;
}

- (DAAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (void).cxx_destruct
{
}

@end