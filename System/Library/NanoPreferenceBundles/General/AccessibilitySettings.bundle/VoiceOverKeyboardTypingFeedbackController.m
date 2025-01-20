@interface VoiceOverKeyboardTypingFeedbackController
+ (id)typingFeedbackShortStringDescription:(int64_t)a3;
- (id)_specifiersForSoftware:(BOOL)a3;
- (id)_typingFeedbackArray;
- (id)actionDetailControllerDelegate;
- (id)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation VoiceOverKeyboardTypingFeedbackController

- (id)actionDetailControllerDelegate
{
  v2 = [(VoiceOverKeyboardTypingFeedbackController *)self specifier];
  v3 = [v2 userInfo];
  v4 = [v3 objectForKeyedSubscript:@"VoiceOverKeyboardTypingFeedbackDelegateKey"];

  return v4;
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [(VoiceOverKeyboardTypingFeedbackController *)self _specifiersForSoftware:1];
    v6 = [(VoiceOverKeyboardTypingFeedbackController *)self _specifiersForSoftware:0];
    v7 = [v5 arrayByAddingObjectsFromArray:v6];
    v8 = (objc_class *)[v7 copy];
    v9 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = v8;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (id)_specifiersForSoftware:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v28 = [MEMORY[0x263EFF980] array];
  v5 = [(VoiceOverKeyboardTypingFeedbackController *)self actionDetailControllerDelegate];
  BOOL v26 = v3;
  v30 = [v5 selectedTypingFeedbackWithSoftware:v3];

  v6 = [MEMORY[0x263EFF980] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v27 = self;
  id obj = [(VoiceOverKeyboardTypingFeedbackController *)self _typingFeedbackArray];
  uint64_t v7 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    v9 = 0;
    uint64_t v10 = *(void *)v32;
    uint64_t v11 = *MEMORY[0x263F60308];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v14 = +[VoiceOverKeyboardTypingFeedbackController typingFeedbackShortStringDescription:](VoiceOverKeyboardTypingFeedbackController, "typingFeedbackShortStringDescription:", [v13 integerValue]);
        v15 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v14 target:0 set:0 get:0 detail:0 cell:3 edit:0];
        [v15 setProperty:v13 forKey:v11];
        if ([v13 isEqualToNumber:v30])
        {
          id v16 = v15;

          v9 = v16;
        }
        [v6 addObject:v15];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  if ([v6 count])
  {
    v17 = @"FEEDBACK_HARDWARE";
    if (v26)
    {
      v17 = @"FEEDBACK_SOFTWARE";
      v18 = (id *)MEMORY[0x263F22B30];
    }
    else
    {
      v18 = (id *)MEMORY[0x263F22B00];
    }
    v19 = v17;
    id v20 = *v18;
    v21 = (void *)MEMORY[0x263F5FC40];
    v22 = settingsLocString(v19, @"VoiceOverSettings");
    v23 = [v21 preferenceSpecifierNamed:v22 target:v27 set:0 get:0 detail:0 cell:0 edit:0];

    [v23 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60168]];
    [v23 setProperty:v20 forKey:*MEMORY[0x263F60138]];
    [v28 addObject:v23];
    if (v9) {
      [v23 setProperty:v9 forKey:*MEMORY[0x263F60200]];
    }
    [v28 addObjectsFromArray:v6];
  }
  id v24 = v28;

  return v24;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)VoiceOverKeyboardTypingFeedbackController;
  id v6 = a4;
  [(VoiceOverKeyboardTypingFeedbackController *)&v18 tableView:a3 didSelectRowAtIndexPath:v6];
  uint64_t v7 = -[VoiceOverKeyboardTypingFeedbackController indexForIndexPath:](self, "indexForIndexPath:", v6, v18.receiver, v18.super_class);
  uint64_t v8 = [(VoiceOverKeyboardTypingFeedbackController *)self specifiers];
  v9 = [v8 objectAtIndex:v7];

  uint64_t v10 = [v6 section];
  uint64_t v11 = [(VoiceOverKeyboardTypingFeedbackController *)self specifierAtIndex:[(VoiceOverKeyboardTypingFeedbackController *)self indexOfGroup:v10]];
  v12 = [v11 propertyForKey:*MEMORY[0x263F60168]];
  int v13 = [v12 BOOLValue];

  if (v13)
  {
    v14 = [v9 propertyForKey:*MEMORY[0x263F60308]];
    if (v14)
    {
      v15 = [v11 propertyForKey:*MEMORY[0x263F60138]];
      uint64_t v16 = [v15 isEqualToString:*MEMORY[0x263F22B30]];

      v17 = [(VoiceOverKeyboardTypingFeedbackController *)self actionDetailControllerDelegate];
      [v17 setTypingFeedback:v14 isSoftware:v16];

      [(VoiceOverKeyboardTypingFeedbackController *)self reloadSpecifiers];
    }
  }
}

- (id)_typingFeedbackArray
{
  return &unk_26FB007C0;
}

+ (id)typingFeedbackShortStringDescription:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
  {
    v4 = 0;
  }
  else
  {
    v4 = settingsLocString(off_2651F2340[a3], @"VoiceOverSettings");
  }
  return v4;
}

@end