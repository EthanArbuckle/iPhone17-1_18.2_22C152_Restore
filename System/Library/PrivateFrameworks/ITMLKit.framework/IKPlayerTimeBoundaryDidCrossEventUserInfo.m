@interface IKPlayerTimeBoundaryDidCrossEventUserInfo
- (IKPlayerTimeBoundaryDidCrossEventUserInfo)initWithBoundary:(double)a3;
- (NSDictionary)properties;
- (double)boundary;
@end

@implementation IKPlayerTimeBoundaryDidCrossEventUserInfo

- (IKPlayerTimeBoundaryDidCrossEventUserInfo)initWithBoundary:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IKPlayerTimeBoundaryDidCrossEventUserInfo;
  result = [(IKPlayerTimeBoundaryDidCrossEventUserInfo *)&v5 init];
  if (result) {
    result->_boundary = a3;
  }
  return result;
}

- (NSDictionary)properties
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  v4 = [NSNumber numberWithDouble:self->_boundary];
  [v3 setObject:v4 forKeyedSubscript:@"boundary"];

  objc_super v5 = (void *)[v3 copy];
  return (NSDictionary *)v5;
}

- (double)boundary
{
  return self->_boundary;
}

@end