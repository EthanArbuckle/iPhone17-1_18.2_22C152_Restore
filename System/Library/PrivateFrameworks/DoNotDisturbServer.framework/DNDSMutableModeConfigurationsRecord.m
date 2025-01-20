@interface DNDSMutableModeConfigurationsRecord
- (id)copyWithZone:(_NSZone *)a3;
- (void)setConfiguration:(id)a3 forModeIdentifier:(id)a4;
- (void)setMode:(id)a3 forModeIdentifier:(id)a4;
- (void)setModeConfiguration:(id)a3 forModeIdentifier:(id)a4;
- (void)setTriggers:(id)a3 forModeIdentifier:(id)a4;
@end

@implementation DNDSMutableModeConfigurationsRecord

- (void)setModeConfiguration:(id)a3 forModeIdentifier:(id)a4
{
  if (a4) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._modeConfigurationsByModeIdentifier, "setObject:forKeyedSubscript:", a3);
  }
}

- (void)setMode:(id)a3 forModeIdentifier:(id)a4
{
  id v10 = a3;
  modeConfigurationsByModeIdentifier = self->super._modeConfigurationsByModeIdentifier;
  id v7 = a4;
  v8 = [(NSMutableDictionary *)modeConfigurationsByModeIdentifier objectForKeyedSubscript:v7];
  v9 = (DNDSMutableModeConfigurationRecord *)[v8 mutableCopy];

  if (!v9) {
    v9 = objc_alloc_init(DNDSMutableModeConfigurationRecord);
  }
  [(DNDSMutableModeConfigurationRecord *)v9 setMode:v10];
  [(NSMutableDictionary *)self->super._modeConfigurationsByModeIdentifier setObject:v9 forKeyedSubscript:v7];
}

- (void)setConfiguration:(id)a3 forModeIdentifier:(id)a4
{
  modeConfigurationsByModeIdentifier = self->super._modeConfigurationsByModeIdentifier;
  id v7 = a4;
  id v8 = a3;
  v9 = [(NSMutableDictionary *)modeConfigurationsByModeIdentifier objectForKeyedSubscript:v7];
  id v10 = (id)[v9 mutableCopy];

  [v10 setConfiguration:v8];
  [(NSMutableDictionary *)self->super._modeConfigurationsByModeIdentifier setObject:v10 forKeyedSubscript:v7];
}

- (void)setTriggers:(id)a3 forModeIdentifier:(id)a4
{
  modeConfigurationsByModeIdentifier = self->super._modeConfigurationsByModeIdentifier;
  id v7 = a4;
  id v8 = a3;
  v9 = [(NSMutableDictionary *)modeConfigurationsByModeIdentifier objectForKeyedSubscript:v7];
  id v10 = (id)[v9 mutableCopy];

  [v10 setTriggers:v8];
  [(NSMutableDictionary *)self->super._modeConfigurationsByModeIdentifier setObject:v10 forKeyedSubscript:v7];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[DNDSModeConfigurationsRecord allocWithZone:a3];
  v5 = [(NSMutableDictionary *)self->super._modeConfigurationsByModeIdentifier allValues];
  id v6 = [(DNDSModeConfigurationsRecord *)v4 _initWithModeConfigurations:v5];

  return v6;
}

@end