@interface IDSOffGridDeliveryQueryOptions
+ (BOOL)supportsSecureCoding;
+ (id)cached;
- (BOOL)cached;
- (IDSOffGridDeliveryQueryOptions)init;
- (IDSOffGridDeliveryQueryOptions)initWithCached:(BOOL)a3;
- (IDSOffGridDeliveryQueryOptions)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCached:(BOOL)a3;
@end

@implementation IDSOffGridDeliveryQueryOptions

+ (id)cached
{
  v2 = [[IDSOffGridDeliveryQueryOptions alloc] initWithCached:1];

  return v2;
}

- (IDSOffGridDeliveryQueryOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)IDSOffGridDeliveryQueryOptions;
  result = [(IDSOffGridDeliveryQueryOptions *)&v3 init];
  if (result) {
    result->_cached = 0;
  }
  return result;
}

- (IDSOffGridDeliveryQueryOptions)initWithCached:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IDSOffGridDeliveryQueryOptions;
  result = [(IDSOffGridDeliveryQueryOptions *)&v5 init];
  if (result) {
    result->_cached = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSOffGridDeliveryQueryOptions)initWithCoder:(id)a3
{
  v4 = -[IDSOffGridDeliveryQueryOptions initWithCached:]([IDSOffGridDeliveryQueryOptions alloc], "initWithCached:", [a3 decodeBoolForKey:@"cached"]);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[IDSOffGridDeliveryQueryOptions cached](self, "cached"), @"cached");
}

- (BOOL)cached
{
  return self->_cached;
}

- (void)setCached:(BOOL)a3
{
  self->_cached = a3;
}

@end