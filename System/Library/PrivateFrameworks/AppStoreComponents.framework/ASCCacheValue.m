@interface ASCCacheValue
- (ASCCacheValue)initWithValue:(id)a3;
- (NSObject)value;
- (void)setValue:(id)a3;
@end

@implementation ASCCacheValue

- (ASCCacheValue)initWithValue:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ASCCacheValue;
  v5 = [(ASCCacheValue *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ASCCacheValue *)v5 setValue:v4];
  }

  return v6;
}

- (NSObject)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end