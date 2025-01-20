@interface DAAsset
- (CGSize)size;
- (DAAsset)initWithDictionary:(id)a3;
- (NSString)name;
- (void)setName:(id)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation DAAsset

- (DAAsset)initWithDictionary:(id)a3
{
  id v4 = a3;
  char v21 = 0;
  v20.receiver = self;
  v20.super_class = (Class)DAAsset;
  v5 = [(DASpecification *)&v20 initWithDictionary:v4];
  if (v5)
  {
    uint64_t v6 = [v4 dk_stringFromRequiredKey:@"name" maxLength:100 failed:&v21];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = [v4 dk_numberFromRequiredKey:@"frameHeight" lowerBound:&off_100011288 upperBound:&off_100011298 failed:&v21];
    [v8 doubleValue];
    double v10 = v9;

    v11 = [v4 dk_numberFromRequiredKey:@"frameWidth" lowerBound:&off_100011288 upperBound:&off_100011298 failed:&v21];
    [v11 doubleValue];
    double v13 = v12;

    v14 = +[UIScreen mainScreen];
    [v14 scale];
    CGFloat v16 = v13 * v15;
    v17 = +[UIScreen mainScreen];
    [v17 scale];
    v5->_size.width = v16;
    v5->_size.height = v10 * v18;

    if (v21)
    {

      v5 = 0;
    }
  }

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
}

@end