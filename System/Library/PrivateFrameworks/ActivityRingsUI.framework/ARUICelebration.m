@interface ARUICelebration
- (_TtC3VFX8VFXScene)scene;
- (double)duration;
- (id)description;
- (unint64_t)hash;
- (unint64_t)type;
@end

@implementation ARUICelebration

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  [(ARUICelebration *)self type];
  [v3 appendString:@"sparks" withName:@"type"];
  id v4 = (id)[v3 appendDouble:@"duration" withName:3 decimalPrecision:self->_duration];
  v5 = [v3 build];

  return v5;
}

- (unint64_t)hash
{
  v3 = +[ARUIHashBuilder builder];
  [v3 appendDouble:self->_duration];
  [v3 appendUnsignedInt:self->_type];
  unint64_t v4 = [v3 hash];

  return v4;
}

- (unint64_t)type
{
  return self->_type;
}

- (_TtC3VFX8VFXScene)scene
{
  return self->_scene;
}

- (double)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
}

@end