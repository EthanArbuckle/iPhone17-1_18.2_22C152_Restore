@interface HFValueSetFormatter
+ (id)formatterWithStringProvider:(id)a3;
- (HFValueSetFormatter)init;
- (HFValueSetFormatter)initWithStringProvider:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stringForObjectValue:(id)a3;
- (id)stringProvider;
- (int64_t)unitStyle;
- (void)setStringProvider:(id)a3;
- (void)setUnitStyle:(int64_t)a3;
@end

@implementation HFValueSetFormatter

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(HFValueSetFormatter *)self stringProvider];
  v6 = (void *)[v4 initWithStringProvider:v5];

  objc_msgSend(v6, "setUnitStyle:", -[HFValueSetFormatter unitStyle](self, "unitStyle"));
  return v6;
}

+ (id)formatterWithStringProvider:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithStringProvider:v4];

  return v5;
}

- (HFValueSetFormatter)initWithStringProvider:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HFValueSetFormatter.m", 33, @"Invalid parameter not satisfying: %@", @"provider" object file lineNumber description];
  }
  v10.receiver = self;
  v10.super_class = (Class)HFValueSetFormatter;
  v6 = [(HFValueSetFormatter *)&v10 init];
  v7 = v6;
  if (v6)
  {
    [(HFValueSetFormatter *)v6 setStringProvider:v5];
    [(HFValueSetFormatter *)v7 setUnitStyle:2];
  }

  return v7;
}

- (void)setUnitStyle:(int64_t)a3
{
  self->_unitStyle = a3;
}

- (void)setStringProvider:(id)a3
{
}

- (id)stringForObjectValue:(id)a3
{
  id v4 = a3;
  id v5 = [(HFValueSetFormatter *)self stringProvider];
  if (v5)
  {
    v6 = [(HFValueSetFormatter *)self stringProvider];
    v7 = ((void (**)(void, id, int64_t))v6)[2](v6, v4, [(HFValueSetFormatter *)self unitStyle]);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)stringProvider
{
  return self->_stringProvider;
}

- (int64_t)unitStyle
{
  return self->_unitStyle;
}

- (void).cxx_destruct
{
}

- (HFValueSetFormatter)init
{
  v5.receiver = self;
  v5.super_class = (Class)HFValueSetFormatter;
  v2 = [(HFValueSetFormatter *)&v5 init];
  v3 = v2;
  if (v2) {
    [(HFValueSetFormatter *)v2 setUnitStyle:2];
  }
  return v3;
}

@end