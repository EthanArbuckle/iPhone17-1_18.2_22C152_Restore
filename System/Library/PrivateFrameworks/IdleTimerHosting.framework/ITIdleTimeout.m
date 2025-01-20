@interface ITIdleTimeout
+ (id)timeoutGeneratorUsingIdentifier:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (ITIdleTimeout)init;
- (ITIdleTimeout)initWithDuration:(double)a3;
- (ITIdleTimeout)initWithDuration:(double)a3 identifier:(unint64_t)a4;
- (double)duration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)identifier;
@end

@implementation ITIdleTimeout

- (ITIdleTimeout)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"ITIdleTimeout.m" lineNumber:20 description:@"wrong initializer"];

  return 0;
}

- (ITIdleTimeout)initWithDuration:(double)a3 identifier:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ITIdleTimeout;
  result = [(ITIdleTimeout *)&v7 init];
  if (result)
  {
    result->_duration = a3;
    result->_identifier = a4;
  }
  return result;
}

- (ITIdleTimeout)initWithDuration:(double)a3
{
  return [(ITIdleTimeout *)self initWithDuration:0 identifier:a3];
}

+ (id)timeoutGeneratorUsingIdentifier:(unint64_t)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__ITIdleTimeout_timeoutGeneratorUsingIdentifier___block_invoke;
  v5[3] = &__block_descriptor_40_e23___ITIdleTimeout_16__0d8l;
  v5[4] = a3;
  v3 = (void *)MEMORY[0x223C89C80](v5, a2);

  return v3;
}

ITIdleTimeout *__49__ITIdleTimeout_timeoutGeneratorUsingIdentifier___block_invoke(uint64_t a1, double a2)
{
  v2 = [[ITIdleTimeout alloc] initWithDuration:*(void *)(a1 + 32) identifier:a2];

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (v4 && (uint64_t v5 = objc_opt_class(), v5 == objc_opt_class()) && v4[2] == self->_identifier) {
    char v6 = BSFloatEqualToFloat();
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[ITIdleTimeout allocWithZone:a3];
  double duration = self->_duration;
  unint64_t identifier = self->_identifier;

  return [(ITIdleTimeout *)v4 initWithDuration:identifier identifier:duration];
}

- (id)succinctDescription
{
  v2 = [(ITIdleTimeout *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendUInt64:self->_identifier withName:@"identifier"];
  id v5 = (id)[v3 appendTimeInterval:@"duration" withName:0 decomposeUnits:self->_duration];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(ITIdleTimeout *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (double)duration
{
  return self->_duration;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

@end