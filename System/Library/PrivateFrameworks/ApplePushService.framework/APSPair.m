@interface APSPair
+ (id)pairWithFirst:(id)a3 second:(id)a4;
- (APSPair)initWithFirst:(id)a3 second:(id)a4;
- (id)first;
- (id)second;
- (void)setFirst:(id)a3;
- (void)setSecond:(id)a3;
@end

@implementation APSPair

- (APSPair)initWithFirst:(id)a3 second:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)APSPair;
  v9 = [(APSPair *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_first, a3);
    objc_storeStrong(&v10->_second, a4);
  }

  return v10;
}

+ (id)pairWithFirst:(id)a3 second:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithFirst:v7 second:v6];

  return v8;
}

- (id)first
{
  return self->_first;
}

- (void)setFirst:(id)a3
{
}

- (id)second
{
  return self->_second;
}

- (void)setSecond:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_second, 0);
  objc_storeStrong(&self->_first, 0);
}

@end