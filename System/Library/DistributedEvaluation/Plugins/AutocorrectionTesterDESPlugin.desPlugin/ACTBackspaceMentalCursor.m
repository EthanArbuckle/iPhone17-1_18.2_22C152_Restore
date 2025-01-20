@interface ACTBackspaceMentalCursor
- (ACTBackspaceMentalCursor)init;
- (id)description;
@end

@implementation ACTBackspaceMentalCursor

- (ACTBackspaceMentalCursor)init
{
  v3.receiver = self;
  v3.super_class = (Class)ACTBackspaceMentalCursor;
  return [(ACTBackspaceMentalCursor *)&v3 init];
}

- (id)description
{
  v2 = (objc_class *)objc_opt_class();
  objc_super v3 = NSStringFromClass(v2);
  v4 = +[NSString stringWithFormat:@"<%@>", v3];

  return v4;
}

@end