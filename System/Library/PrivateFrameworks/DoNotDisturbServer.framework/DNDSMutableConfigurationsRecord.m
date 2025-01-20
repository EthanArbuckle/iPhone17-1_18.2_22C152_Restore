@interface DNDSMutableConfigurationsRecord
- (id)copyWithZone:(_NSZone *)a3;
- (void)setConfiguration:(id)a3 forModeIdentifier:(id)a4;
- (void)setModeConfigurations:(id)a3;
@end

@implementation DNDSMutableConfigurationsRecord

- (void)setModeConfigurations:(id)a3
{
  v4 = (NSMutableDictionary *)[a3 copy];
  modeConfigurations = self->super._modeConfigurations;
  self->super._modeConfigurations = v4;
  MEMORY[0x1F41817F8](v4, modeConfigurations);
}

- (void)setConfiguration:(id)a3 forModeIdentifier:(id)a4
{
  modeConfigurations = self->super._modeConfigurations;
  id v6 = a4;
  id v7 = [a3 makeRecord];
  [(NSMutableDictionary *)modeConfigurations setObject:v7 forKey:v6];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [DNDSConfigurationsRecord alloc];
  return [(DNDSConfigurationsRecord *)v4 _initWithRecord:self];
}

@end