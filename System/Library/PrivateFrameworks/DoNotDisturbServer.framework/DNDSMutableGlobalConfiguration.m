@interface DNDSMutableGlobalConfiguration
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAutomaticallyGenerated:(BOOL)a3;
- (void)setBypassSettings:(id)a3;
- (void)setLastModified:(id)a3;
- (void)setModesCanImpactAvailability:(unint64_t)a3;
- (void)setPreventAutoReply:(unint64_t)a3;
@end

@implementation DNDSMutableGlobalConfiguration

- (void)setPreventAutoReply:(unint64_t)a3
{
  self->super._preventAutoReply = a3;
  self->super._automaticallyGenerated = 0;
}

- (void)setBypassSettings:(id)a3
{
  v4 = (DNDBypassSettings *)[a3 copy];
  bypassSettings = self->super._bypassSettings;
  self->super._bypassSettings = v4;

  self->super._automaticallyGenerated = 0;
}

- (void)setModesCanImpactAvailability:(unint64_t)a3
{
  self->super._modesCanImpactAvailability = a3;
  self->super._automaticallyGenerated = 0;
}

- (void)setLastModified:(id)a3
{
  v4 = (NSDate *)[a3 copy];
  lastModified = self->super._lastModified;
  self->super._lastModified = v4;
  MEMORY[0x1F41817F8](v4, lastModified);
}

- (void)setAutomaticallyGenerated:(BOOL)a3
{
  self->super._automaticallyGenerated = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[DNDSGlobalConfiguration allocWithZone:a3];
  return [(DNDSGlobalConfiguration *)v4 _initWithConfiguration:self];
}

@end