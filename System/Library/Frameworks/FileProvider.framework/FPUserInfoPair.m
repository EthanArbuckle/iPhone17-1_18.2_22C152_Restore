@interface FPUserInfoPair
- (FPUserInfoPair)initWithA:(id)a3 b:(id)a4;
- (NSString)a;
- (NSString)b;
- (void)setA:(id)a3;
- (void)setB:(id)a3;
@end

@implementation FPUserInfoPair

- (FPUserInfoPair)initWithA:(id)a3 b:(id)a4
{
  id v6 = a4;
  [(FPUserInfoPair *)self setA:a3];
  [(FPUserInfoPair *)self setB:v6];

  return self;
}

- (void)setB:(id)a3
{
}

- (void)setA:(id)a3
{
}

- (NSString)a
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_b, 0);

  objc_storeStrong((id *)&self->_a, 0);
}

- (NSString)b
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

@end