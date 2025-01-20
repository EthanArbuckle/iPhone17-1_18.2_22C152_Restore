@interface PKVectorTimestampElement
- (BOOL)isEqual:(id)a3;
- (unint64_t)clock;
- (unint64_t)hash;
- (unint64_t)subclock;
- (void)setClock:(unint64_t)a3;
- (void)setSubclock:(unint64_t)a3;
@end

@implementation PKVectorTimestampElement

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PKVectorTimestampElement *)self clock];
  if (v5 == [v4 clock])
  {
    unint64_t v6 = [(PKVectorTimestampElement *)self subclock];
    BOOL v7 = v6 == [v4 subclock];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PKVectorTimestampElement *)self clock];
  return v3 ^ ([(PKVectorTimestampElement *)self subclock] << 16);
}

- (unint64_t)clock
{
  return self->_clock;
}

- (void)setClock:(unint64_t)a3
{
  self->_clock = a3;
}

- (unint64_t)subclock
{
  return self->_subclock;
}

- (void)setSubclock:(unint64_t)a3
{
  self->_subclock = a3;
}

@end