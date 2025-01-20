@interface INStartWorkoutIntent(ACSCardRequesting)
- (uint64_t)servicePriorityForCardRequest:()ACSCardRequesting;
- (void)requestCard:()ACSCardRequesting reply:;
@end

@implementation INStartWorkoutIntent(ACSCardRequesting)

- (void)requestCard:()ACSCardRequesting reply:
{
  v32[1] = *MEMORY[0x263EF8340];
  v6 = a4;
  if (v6)
  {
    v7 = [a3 content];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([v7 underlyingInteraction], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v9 = (void *)v8;
      v10 = objc_msgSend(MEMORY[0x263F677D0], "acs_uniquelyIdentifiedCard");
      v11 = objc_msgSend(MEMORY[0x263F679F8], "acs_uniquelyIdentifiedCardSection");
      v12 = [a1 workoutName];
      v13 = [v12 spokenPhrase];

      unint64_t v14 = [v9 intentHandlingStatus];
      if (v14 <= 6)
      {
        if (((1 << v14) & 0x67) != 0)
        {
          v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v16 = v15;
          v17 = @"Start a %@";
        }
        else if (v14 == 3)
        {
          v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v16 = v15;
          v17 = @"%@ Started";
        }
        else
        {
          v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v16 = v15;
          v17 = @"Failure Starting %@";
        }
        v18 = [v15 localizedStringForKey:v17 value:&stru_26D3AA9F8 table:0];

        v19 = objc_msgSend(NSString, "localizedStringWithFormat:", v18, v13);
        [v11 setTitle:v19];
      }
      v20 = (void *)MEMORY[0x263F0FCE0];
      uint64_t v21 = objc_opt_class();
      v22 = NSStringFromSelector(sel_workoutName);
      v23 = [v20 parameterForClass:v21 keyPath:v22];

      if (v23)
      {
        v30 = v23;
        v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
        objc_msgSend(v11, "acs_setParameters:", v24);
      }
      [v11 setIsCentered:1];
      v29[0] = v11;
      v25 = objc_msgSend(MEMORY[0x263F67980], "acs_wildCardSection");
      v29[1] = v25;
      v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];
      [v10 setCardSections:v26];

      objc_msgSend(v10, "acs_setInteraction:", v9);
      v6[2](v6, v10, 0);
    }
    else
    {
      v27 = (void *)MEMORY[0x263F087E8];
      uint64_t v28 = *MEMORY[0x263F31628];
      uint64_t v31 = *MEMORY[0x263F07F80];
      v9 = [NSString stringWithFormat:@"Content %@ is incompatible with this service", v7];
      v32[0] = v9;
      v10 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
      v11 = [v27 errorWithDomain:v28 code:400 userInfo:v10];
      ((void (**)(id, void *, void *))v6)[2](v6, 0, v11);
    }
  }
}

- (uint64_t)servicePriorityForCardRequest:()ACSCardRequesting
{
  return 2;
}

@end