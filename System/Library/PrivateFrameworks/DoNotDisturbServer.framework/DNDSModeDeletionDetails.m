@interface DNDSModeDeletionDetails
- (NSSet)applicationIdentifiers;
- (NSSet)modeSpecificSettings;
- (void)setApplicationIdentifiers:(id)a3;
- (void)setModeSpecificSettings:(id)a3;
@end

@implementation DNDSModeDeletionDetails

- (NSSet)applicationIdentifiers
{
  return self->_applicationIdentifiers;
}

- (void)setApplicationIdentifiers:(id)a3
{
}

- (NSSet)modeSpecificSettings
{
  return self->_modeSpecificSettings;
}

- (void)setModeSpecificSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeSpecificSettings, 0);
  objc_storeStrong((id *)&self->_applicationIdentifiers, 0);
}

@end