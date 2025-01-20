@interface FAStoreFrontProvider
- (id)fetchCurrentStoreFront;
@end

@implementation FAStoreFrontProvider

- (id)fetchCurrentStoreFront
{
  id v2 = [objc_alloc((Class)AAFPromise) initWithBlock:&stru_10004D398];
  return v2;
}

@end