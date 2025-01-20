@interface CSBounceSettings
- (double)elasticity;
- (double)friction;
- (double)gravity;
- (double)maxVelocityAssistance;
- (double)maxVelocityToAssist;
- (double)minVelocityToAssist;
- (double)multiplier;
- (double)resistance;
- (double)velocity;
- (void)setDefaultValues;
- (void)setElasticity:(double)a3;
- (void)setFriction:(double)a3;
- (void)setGravity:(double)a3;
- (void)setMaxVelocityAssistance:(double)a3;
- (void)setMaxVelocityToAssist:(double)a3;
- (void)setMinVelocityToAssist:(double)a3;
- (void)setMultiplier:(double)a3;
- (void)setResistance:(double)a3;
- (void)setVelocity:(double)a3;
@end

@implementation CSBounceSettings

- (void)setDefaultValues
{
  [(CSBounceSettings *)self setGravity:4.0];
  [(CSBounceSettings *)self setElasticity:0.4];
  [(CSBounceSettings *)self setVelocity:600.0];
  [(CSBounceSettings *)self setFriction:0.2];
  [(CSBounceSettings *)self setResistance:0.1];
  [(CSBounceSettings *)self setMultiplier:1.0];
  [(CSBounceSettings *)self setMinVelocityToAssist:1450.0];
  [(CSBounceSettings *)self setMaxVelocityToAssist:2610.0];

  [(CSBounceSettings *)self setMaxVelocityAssistance:1050.0];
}

- (double)gravity
{
  return self->_gravity;
}

- (void)setGravity:(double)a3
{
  self->_gravity = a3;
}

- (double)velocity
{
  return self->_velocity;
}

- (void)setVelocity:(double)a3
{
  self->_velocity = a3;
}

- (double)elasticity
{
  return self->_elasticity;
}

- (void)setElasticity:(double)a3
{
  self->_elasticity = a3;
}

- (double)friction
{
  return self->_friction;
}

- (void)setFriction:(double)a3
{
  self->_friction = a3;
}

- (double)resistance
{
  return self->_resistance;
}

- (void)setResistance:(double)a3
{
  self->_resistance = a3;
}

- (double)multiplier
{
  return self->_multiplier;
}

- (void)setMultiplier:(double)a3
{
  self->_multiplier = a3;
}

- (double)minVelocityToAssist
{
  return self->_minVelocityToAssist;
}

- (void)setMinVelocityToAssist:(double)a3
{
  self->_minVelocityToAssist = a3;
}

- (double)maxVelocityToAssist
{
  return self->_maxVelocityToAssist;
}

- (void)setMaxVelocityToAssist:(double)a3
{
  self->_maxVelocityToAssist = a3;
}

- (double)maxVelocityAssistance
{
  return self->_maxVelocityAssistance;
}

- (void)setMaxVelocityAssistance:(double)a3
{
  self->_maxVelocityAssistance = a3;
}

@end