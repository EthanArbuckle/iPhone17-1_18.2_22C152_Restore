@interface BWPersonSemanticsConfiguration
+ (unsigned)personSemanticForAttachedMediaKey:(id)a3;
- (BOOL)appliesFinalCropRect;
- (unsigned)enabledSemantics;
- (void)setAppliesFinalCropRect:(BOOL)a3;
- (void)setEnabledSemantics:(unsigned int)a3;
@end

@implementation BWPersonSemanticsConfiguration

- (unsigned)enabledSemantics
{
  return self->_enabledSemantics;
}

- (BOOL)appliesFinalCropRect
{
  return self->_appliesFinalCropRect;
}

- (void)setEnabledSemantics:(unsigned int)a3
{
  self->_enabledSemantics = a3;
}

+ (unsigned)personSemanticForAttachedMediaKey:(id)a3
{
  if ([a3 isEqualToString:0x1EFA6A200]) {
    return 1;
  }
  if ([a3 isEqualToString:0x1EFA6A220]) {
    return 2;
  }
  if ([a3 isEqualToString:0x1EFA6A260]) {
    return 8;
  }
  if ([a3 isEqualToString:0x1EFA6A280]) {
    return 16;
  }
  if ([a3 isEqualToString:0x1EFA6A2A0]) {
    return 32;
  }
  if ([a3 isEqualToString:0x1EFA6A2C0]) {
    return 64;
  }
  if ([a3 hasPrefix:0x1EFA6A360]) {
    return 128;
  }
  return 0;
}

- (void)setAppliesFinalCropRect:(BOOL)a3
{
  self->_appliesFinalCropRect = a3;
}

@end