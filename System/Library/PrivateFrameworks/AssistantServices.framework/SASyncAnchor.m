@interface SASyncAnchor
- (id)description;
@end

@implementation SASyncAnchor

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  v8.receiver = self;
  v8.super_class = (Class)SASyncAnchor;
  v4 = [(SASyncAnchor *)&v8 description];
  v5 = [(SASyncAnchor *)self key];
  id v6 = [v3 initWithFormat:@"%@ key: %@", v4, v5];

  return v6;
}

@end