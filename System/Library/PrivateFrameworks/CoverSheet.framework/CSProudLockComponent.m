@interface CSProudLockComponent
- (BOOL)prefersInlineCoaching;
- (BOOL)shouldResideInALowerSubview;
- (BOOL)supportsMaterialBackground;
- (CSProudLockComponent)init;
- (id)optOutOfAlphaFadesForPageScroll:(int64_t)a3;
- (id)prefersInlineCoaching:(BOOL)a3;
- (id)shouldResideInALowerSubview:(BOOL)a3;
- (id)supportsMaterialBackground:(BOOL)a3;
- (void)_setUnsignedIntegerValue:(void *)a1;
- (void)setOptOutOfAlphaFadesForPageScroll:(int64_t)a3;
- (void)setPrefersInlineCoaching:(BOOL)a3;
- (void)setShouldResideInALowerSubview:(BOOL)a3;
- (void)setSupportsMaterialBackground:(BOOL)a3;
@end

@implementation CSProudLockComponent

- (CSProudLockComponent)init
{
  v5.receiver = self;
  v5.super_class = (Class)CSProudLockComponent;
  v2 = [(CSComponent *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(CSComponent *)v2 setType:11];
    -[CSProudLockComponent _setUnsignedIntegerValue:](v3, 0);
  }
  return v3;
}

- (void)_setUnsignedIntegerValue:(void *)a1
{
  if (a1)
  {
    id v3 = [NSNumber numberWithUnsignedInteger:a2];
    [a1 setValue:v3];
  }
}

- (id)optOutOfAlphaFadesForPageScroll:(int64_t)a3
{
  return self;
}

- (id)shouldResideInALowerSubview:(BOOL)a3
{
  return self;
}

- (id)prefersInlineCoaching:(BOOL)a3
{
  return self;
}

- (id)supportsMaterialBackground:(BOOL)a3
{
  return self;
}

- (void)setOptOutOfAlphaFadesForPageScroll:(int64_t)a3
{
  if ([(CSComponent *)self flag] != a3)
  {
    [(CSComponent *)self setFlag:a3];
  }
}

- (BOOL)shouldResideInALowerSubview
{
  v2 = [(CSComponent *)self value];
  BOOL v3 = [v2 unsignedIntegerValue] & 1;

  return v3;
}

- (void)setShouldResideInALowerSubview:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(CSComponent *)self value];
  uint64_t v6 = [v5 unsignedIntegerValue];

  -[CSProudLockComponent _setUnsignedIntegerValue:](self, v6 & 0xFFFFFFFFFFFFFFFELL | v3);
}

- (BOOL)prefersInlineCoaching
{
  v2 = [(CSComponent *)self value];
  unint64_t v3 = ((unint64_t)[v2 unsignedIntegerValue] >> 1) & 1;

  return v3;
}

- (void)setPrefersInlineCoaching:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(CSComponent *)self value];
  uint64_t v6 = [v5 unsignedIntegerValue];

  uint64_t v7 = 2;
  if (!v3) {
    uint64_t v7 = 0;
  }

  -[CSProudLockComponent _setUnsignedIntegerValue:](self, v6 & 0xFFFFFFFFFFFFFFFDLL | v7);
}

- (BOOL)supportsMaterialBackground
{
  v2 = [(CSComponent *)self value];
  unint64_t v3 = ((unint64_t)[v2 unsignedIntegerValue] >> 2) & 1;

  return v3;
}

- (void)setSupportsMaterialBackground:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(CSComponent *)self value];
  uint64_t v6 = [v5 unsignedIntegerValue];

  uint64_t v7 = 4;
  if (!v3) {
    uint64_t v7 = 0;
  }

  -[CSProudLockComponent _setUnsignedIntegerValue:](self, v6 & 0xFFFFFFFFFFFFFFFBLL | v7);
}

@end