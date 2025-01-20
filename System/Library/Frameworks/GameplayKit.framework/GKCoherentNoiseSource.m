@interface GKCoherentNoiseSource
- (NSInteger)octaveCount;
- (double)frequency;
- (double)lacunarity;
- (double)valueAt:(GKCoherentNoiseSource *)self;
- (id)cloneModule;
- (int32_t)seed;
- (void)setFrequency:(double)frequency;
- (void)setLacunarity:(double)lacunarity;
- (void)setOctaveCount:(NSInteger)octaveCount;
- (void)setSeed:(int32_t)seed;
@end

@implementation GKCoherentNoiseSource

- (double)valueAt:(GKCoherentNoiseSource *)self
{
  v3 = (void *)MEMORY[0x263EFF940];
  v4 = NSString;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(a2);
  v7 = [v4 stringWithFormat:@"Derived class %@ must override %@", v5, v6];
  id v8 = [v3 exceptionWithName:*MEMORY[0x263EFF498] reason:v7 userInfo:MEMORY[0x263EFFA78]];

  objc_exception_throw(v8);
}

- (id)cloneModule
{
  v3 = (void *)MEMORY[0x263EFF940];
  v4 = NSString;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(a2);
  v7 = [v4 stringWithFormat:@"Derived class %@ must override %@", v5, v6];
  id v8 = [v3 exceptionWithName:*MEMORY[0x263EFF498] reason:v7 userInfo:MEMORY[0x263EFFA78]];

  objc_exception_throw(v8);
}

- (double)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(double)frequency
{
  self->_frequency = frequency;
}

- (NSInteger)octaveCount
{
  return self->_octaveCount;
}

- (void)setOctaveCount:(NSInteger)octaveCount
{
  self->_octaveCount = octaveCount;
}

- (double)lacunarity
{
  return self->_lacunarity;
}

- (void)setLacunarity:(double)lacunarity
{
  self->_lacunarity = lacunarity;
}

- (int32_t)seed
{
  return self->_seed;
}

- (void)setSeed:(int32_t)seed
{
  self->_seed = seed;
}

@end