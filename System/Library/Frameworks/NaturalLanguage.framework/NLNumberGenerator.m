@interface NLNumberGenerator
- (NLNumberGenerator)init;
- (unint64_t)numberInRange:(_NSRange)a3;
- (void)reset;
- (void)resetWithSeed:(unint64_t)a3;
@end

@implementation NLNumberGenerator

- (NLNumberGenerator)init
{
  v5.receiver = self;
  v5.super_class = (Class)NLNumberGenerator;
  v2 = [(NLNumberGenerator *)&v5 init];
  v3 = v2;
  if (v2) {
    [(NLNumberGenerator *)v2 reset];
  }
  return v3;
}

- (void)reset
{
}

- (void)resetWithSeed:(unint64_t)a3
{
  self->state[0] = a3;
  self->state[1] = a3;
}

- (unint64_t)numberInRange:(_NSRange)a3
{
  unint64_t v3 = self->state[1];
  unint64_t v4 = self->state[0] ^ (self->state[0] << 23);
  unint64_t v5 = (v3 >> 26) ^ (v4 >> 17) ^ v3 ^ v4;
  self->state[0] = v3;
  self->state[1] = v5;
  if (a3.length < 2) {
    NSUInteger v6 = 0;
  }
  else {
    NSUInteger v6 = (v5 + v3) % a3.length;
  }
  return v6 + a3.location;
}

@end