@interface CSFocusSettings
+ (id)settingsControllerModule;
- (BOOL)gatesOnControlCenterAccess;
- (BOOL)requiresAuthWithoutControlCenterAccess;
- (void)setDefaultValues;
- (void)setGatesOnControlCenterAccess:(BOOL)a3;
- (void)setRequiresAuthWithoutControlCenterAccess:(BOOL)a3;
@end

@implementation CSFocusSettings

- (void)setDefaultValues
{
  [(CSFocusSettings *)self setGatesOnControlCenterAccess:0];

  [(CSFocusSettings *)self setRequiresAuthWithoutControlCenterAccess:1];
}

+ (id)settingsControllerModule
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Blocks Interaction" valueKeyPath:@"gatesOnControlCenterAccess"];
  v3 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Requests Authentication" valueKeyPath:@"requiresAuthWithoutControlCenterAccess"];
  v4 = (void *)MEMORY[0x1E4F94160];
  v12[0] = v2;
  v12[1] = v3;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v6 = [v4 sectionWithRows:v5 title:@"Control Center While Locked"];

  v7 = (void *)MEMORY[0x1E4F94160];
  v11 = v6;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  v9 = [v7 moduleWithTitle:@"Focus Settings" contents:v8];

  return v9;
}

- (BOOL)gatesOnControlCenterAccess
{
  return *(&self->super.__isObservingChildren + 1);
}

- (void)setGatesOnControlCenterAccess:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 1) = a3;
}

- (BOOL)requiresAuthWithoutControlCenterAccess
{
  return *(&self->super.__isObservingChildren + 2);
}

- (void)setRequiresAuthWithoutControlCenterAccess:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 2) = a3;
}

@end