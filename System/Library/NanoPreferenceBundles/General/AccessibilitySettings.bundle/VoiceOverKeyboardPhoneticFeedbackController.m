@interface VoiceOverKeyboardPhoneticFeedbackController
+ (id)phoneticFeedbackShortStringDescription:(int64_t)a3;
- (id)_phoneticFeedbackArray;
- (id)actionDetailControllerDelegate;
- (id)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation VoiceOverKeyboardPhoneticFeedbackController

- (id)actionDetailControllerDelegate
{
  v2 = [(VoiceOverKeyboardPhoneticFeedbackController *)self specifier];
  v3 = [v2 userInfo];
  v4 = [v3 objectForKeyedSubscript:@"VoiceOverKeyboardPhoneticFeedbackDelegateKey"];

  return v4;
}

- (id)specifiers
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v22 = (int)*MEMORY[0x263F5FDB8];
    v21 = [MEMORY[0x263EFF980] array];
    v4 = [(VoiceOverKeyboardPhoneticFeedbackController *)self actionDetailControllerDelegate];
    v5 = [v4 selectedPhoneticFeedback];

    v6 = [MEMORY[0x263EFF980] array];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v23 = self;
    id obj = [(VoiceOverKeyboardPhoneticFeedbackController *)self _phoneticFeedbackArray];
    uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      v9 = 0;
      uint64_t v10 = *(void *)v26;
      uint64_t v11 = *MEMORY[0x263F60308];
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v14 = +[VoiceOverKeyboardPhoneticFeedbackController phoneticFeedbackShortStringDescription:](VoiceOverKeyboardPhoneticFeedbackController, "phoneticFeedbackShortStringDescription:", [v13 integerValue]);
          v15 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v14 target:0 set:0 get:0 detail:0 cell:3 edit:0];
          [v15 setProperty:v13 forKey:v11];
          if ([v13 isEqualToNumber:v5])
          {
            id v16 = v15;

            v9 = v16;
          }
          [v6 addObject:v15];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    if ([v6 count])
    {
      v17 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:v23 set:0 get:0 detail:0 cell:0 edit:0];
      [v17 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60168]];
      [v21 addObject:v17];
      if (v9) {
        [v17 setProperty:v9 forKey:*MEMORY[0x263F60200]];
      }
      [v21 addObjectsFromArray:v6];
    }
    uint64_t v18 = [v21 copy];
    v19 = *(Class *)((char *)&v23->super.super.super.super.super.super.isa + v22);
    *(Class *)((char *)&v23->super.super.super.super.super.super.isa + v22) = (Class)v18;

    v3 = *(Class *)((char *)&v23->super.super.super.super.super.super.isa + v22);
  }

  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)VoiceOverKeyboardPhoneticFeedbackController;
  id v6 = a4;
  [(VoiceOverKeyboardPhoneticFeedbackController *)&v16 tableView:a3 didSelectRowAtIndexPath:v6];
  uint64_t v7 = -[VoiceOverKeyboardPhoneticFeedbackController indexForIndexPath:](self, "indexForIndexPath:", v6, v16.receiver, v16.super_class);
  uint64_t v8 = [(VoiceOverKeyboardPhoneticFeedbackController *)self specifiers];
  v9 = [v8 objectAtIndex:v7];

  uint64_t v10 = [v6 section];
  uint64_t v11 = [(VoiceOverKeyboardPhoneticFeedbackController *)self specifierAtIndex:[(VoiceOverKeyboardPhoneticFeedbackController *)self indexOfGroup:v10]];
  v12 = [v11 propertyForKey:*MEMORY[0x263F60168]];
  int v13 = [v12 BOOLValue];

  if (v13)
  {
    v14 = [v9 propertyForKey:*MEMORY[0x263F60308]];
    if (v14)
    {
      v15 = [(VoiceOverKeyboardPhoneticFeedbackController *)self actionDetailControllerDelegate];
      [v15 setPhoneticFeedback:v14];

      [(VoiceOverKeyboardPhoneticFeedbackController *)self reloadSpecifiers];
    }
  }
}

- (id)_phoneticFeedbackArray
{
  return &unk_26FB007D8;
}

+ (id)phoneticFeedbackShortStringDescription:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
  {
    v4 = 0;
  }
  else
  {
    v4 = settingsLocString(off_2651F2438[a3], @"VoiceOverSettings");
  }
  return v4;
}

@end