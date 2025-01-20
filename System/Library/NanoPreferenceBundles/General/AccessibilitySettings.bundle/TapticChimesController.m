@interface TapticChimesController
- (id)_tapticChimesCurrentSchedule;
- (id)_tapticChimesCurrentSounds;
- (id)_tapticChimesEnabled;
- (id)specifiers;
- (void)_setTapticChimesEnabled:(id)a3;
@end

@implementation TapticChimesController

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [MEMORY[0x263EFF980] array];
    v6 = [MEMORY[0x263F21DC0] sharedInstance];
    v7 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    v8 = [v6 tapticChimesLocalizedDescription];
    [v7 setProperty:v8 forKey:*MEMORY[0x263F600F8]];

    [v5 addObject:v7];
    v9 = (void *)MEMORY[0x263F5FC40];
    v10 = [v6 tapticChimesLocalizedTitle];
    v11 = [v9 preferenceSpecifierNamed:v10 target:self set:sel__setTapticChimesEnabled_ get:sel__tapticChimesEnabled detail:0 cell:6 edit:0];

    [v5 addObject:v11];
    v12 = (void *)MEMORY[0x263F5FC40];
    v13 = [v6 tapticChimesScheduleLocalizedTitle];
    v14 = [v12 preferenceSpecifierNamed:v13 target:self set:0 get:sel__tapticChimesCurrentSchedule detail:objc_opt_class() cell:2 edit:0];

    [v5 addObject:v14];
    v15 = (void *)MEMORY[0x263F5FC40];
    v16 = [v6 tapticChimesSoundsLocalizedTitle];
    v17 = [v15 preferenceSpecifierNamed:v16 target:self set:0 get:sel__tapticChimesCurrentSounds detail:objc_opt_class() cell:2 edit:0];

    [v5 addObject:v17];
    v18 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (void)_setTapticChimesEnabled:(id)a3
{
  uint64_t v3 = [a3 BOOLValue];
  id v4 = [MEMORY[0x263F21DC0] sharedInstance];
  [v4 setVoiceOverTapticChimesEnabled:v3];
}

- (id)_tapticChimesEnabled
{
  v2 = NSNumber;
  uint64_t v3 = [MEMORY[0x263F21DC0] sharedInstance];
  id v4 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "voiceOverTapticChimesEnabled"));

  return v4;
}

- (id)_tapticChimesCurrentSchedule
{
  v2 = [MEMORY[0x263F21DC0] sharedInstance];
  uint64_t v3 = [v2 tapticChimesLocalizedCurrentFrequency];

  return v3;
}

- (id)_tapticChimesCurrentSounds
{
  v2 = [MEMORY[0x263F21DC0] sharedInstance];
  uint64_t v3 = [v2 tapticChimesLocalizedCurrentSounds];

  return v3;
}

@end