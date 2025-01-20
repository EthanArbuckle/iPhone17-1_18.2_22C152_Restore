@interface AXSSKeyboardCommandCategory
+ (id)_advancedCommandsFromAvailableCommands:(id)a3;
+ (id)_basicCommandsFromAvailableCommands:(id)a3;
+ (id)_categoryWithCommandIdentifiers:(id)a3 availableCommands:(id)a4 localizedName:(id)a5;
+ (id)_categoryWithCommands:(id)a3 availableCommands:(id)a4 localizedName:(id)a5;
+ (id)_deviceCommandsFromAvailableCommands:(id)a3;
+ (id)_gesturesCommandsFromAvailableCommands:(id)a3;
+ (id)_interactionCommandsFromAvailableCommands:(id)a3;
+ (id)_movementCommandsFromAvailableCommands:(id)a3;
+ (id)_pointerCommandsFromAvailableCommands:(id)a3;
+ (id)allCategoriesForAvailableCommands:(id)a3;
- (AXSSKeyboardCommandCategory)initWithCommands:(id)a3 localizedName:(id)a4;
- (NSArray)commands;
- (NSString)localizedName;
@end

@implementation AXSSKeyboardCommandCategory

+ (id)allCategoriesForAvailableCommands:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v6 = objc_msgSend(a1, "_basicCommandsFromAvailableCommands:", v4, 0);
  v26[0] = v6;
  v7 = [a1 _movementCommandsFromAvailableCommands:v4];
  v26[1] = v7;
  v8 = [a1 _interactionCommandsFromAvailableCommands:v4];
  v26[2] = v8;
  v9 = [a1 _deviceCommandsFromAvailableCommands:v4];
  v26[3] = v9;
  v10 = [a1 _pointerCommandsFromAvailableCommands:v4];
  v26[4] = v10;
  v11 = [a1 _gesturesCommandsFromAvailableCommands:v4];
  v26[5] = v11;
  v12 = [a1 _advancedCommandsFromAvailableCommands:v4];
  v26[6] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:7];

  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v19 = [v18 commands];
        uint64_t v20 = [v19 count];

        if (v20) {
          [v5 addObject:v18];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v15);
  }

  return v5;
}

+ (id)_categoryWithCommandIdentifiers:(id)a3 availableCommands:(id)a4 localizedName:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:](AXSSKeyboardCommand, "commandWithStandardCommandIdentifier:", *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20);
        [v11 addObject:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }

  v18 = [a1 _categoryWithCommands:v11 availableCommands:v9 localizedName:v10];

  return v18;
}

+ (id)_categoryWithCommands:(id)a3 availableCommands:(id)a4 localizedName:(id)a5
{
  id v7 = a4;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __85__AXSSKeyboardCommandCategory__categoryWithCommands_availableCommands_localizedName___block_invoke;
  v16[3] = &unk_1E606DDB0;
  id v17 = v7;
  id v8 = v7;
  id v9 = a5;
  id v10 = a3;
  v11 = [v10 indexesOfObjectsPassingTest:v16];
  id v12 = [AXSSKeyboardCommandCategory alloc];
  uint64_t v13 = [v10 objectsAtIndexes:v11];

  uint64_t v14 = [(AXSSKeyboardCommandCategory *)v12 initWithCommands:v13 localizedName:v9];

  return v14;
}

uint64_t __85__AXSSKeyboardCommandCategory__categoryWithCommands_availableCommands_localizedName___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

+ (id)_basicCommandsFromAvailableCommands:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v11 = @"Help";
  id v12 = @"GoToNextElement";
  uint64_t v13 = @"GoToPreviousElement";
  uint64_t v14 = @"MoveUp";
  uint64_t v15 = @"MoveDown";
  uint64_t v16 = @"MoveLeft";
  id v17 = @"MoveRight";
  v18 = @"PerformDefaultAction";
  v19 = @"GoHome";
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v11 count:9];
  id v7 = objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class(), v11, v12, v13, v14, v15, v16, v17, v18, v19, v20);
  id v8 = [v7 localizedStringForKey:@"BASIC" value:&stru_1F0C5BA58 table:@"FullKeyboardAccess"];
  id v9 = [a1 _categoryWithCommandIdentifiers:v6 availableCommands:v5 localizedName:v8];

  return v9;
}

+ (id)_movementCommandsFromAvailableCommands:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v11 = @"GoToNextElement";
  id v12 = @"GoToPreviousElement";
  uint64_t v13 = @"MoveUp";
  uint64_t v14 = @"MoveDown";
  uint64_t v15 = @"MoveLeft";
  uint64_t v16 = @"MoveRight";
  id v17 = @"GoToFirstElement";
  v18 = @"GoToLastElement";
  v19 = @"MoveInsideNext";
  uint64_t v20 = @"MoveInsidePrevious";
  long long v21 = @"EnterContainer";
  long long v22 = @"ExitContainer";
  long long v23 = @"GoToNextSection";
  long long v24 = @"GoToPreviousSection";
  uint64_t v25 = @"ActivateTypeahead";
  v26 = @"ApplicationList";
  v27 = @"WindowList";
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v11 count:17];
  objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class(), v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26,
    v27,
  id v7 = v28);
  id v8 = [v7 localizedStringForKey:@"MOVEMENT" value:&stru_1F0C5BA58 table:@"FullKeyboardAccess"];
  id v9 = [a1 _categoryWithCommandIdentifiers:v6 availableCommands:v5 localizedName:v8];

  return v9;
}

+ (id)_interactionCommandsFromAvailableCommands:(id)a3
{
  v11[4] = *MEMORY[0x1E4F143B8];
  v11[0] = @"PerformDefaultAction";
  v11[1] = @"PerformEscape";
  v11[2] = @"OpenContextualMenu";
  v11[3] = @"ShowAccessibilityActions";
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:v11 count:4];
  id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"INTERACTION" value:&stru_1F0C5BA58 table:@"FullKeyboardAccess"];
  id v9 = [a1 _categoryWithCommandIdentifiers:v6 availableCommands:v5 localizedName:v8];

  return v9;
}

+ (id)_advancedCommandsFromAvailableCommands:(id)a3
{
  v11[14] = *MEMORY[0x1E4F143B8];
  v11[0] = @"NextButton";
  v11[1] = @"PreviousButton";
  v11[2] = @"NextCheckbox";
  v11[3] = @"PreviousCheckbox";
  v11[4] = @"NextTable";
  void v11[5] = @"PreviousTable";
  v11[6] = @"NextImage";
  v11[7] = @"PreviousImage";
  v11[8] = @"NextLink";
  v11[9] = @"PreviousLink";
  v11[10] = @"NextHeading";
  v11[11] = @"PreviousHeading";
  v11[12] = @"NextTextField";
  v11[13] = @"PreviousTextField";
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:v11 count:14];
  id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"ADVANCED" value:&stru_1F0C5BA58 table:@"FullKeyboardAccess"];
  id v9 = [a1 _categoryWithCommandIdentifiers:v6 availableCommands:v5 localizedName:v8];

  return v9;
}

+ (id)_deviceCommandsFromAvailableCommands:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v11 = @"GoHome";
  id v12 = @"ToggleMenuBar";
  uint64_t v13 = @"ToggleAppSwitcher";
  uint64_t v14 = @"ToggleControlCenter";
  uint64_t v15 = @"ToggleNotificationCenter";
  uint64_t v16 = @"ToggleDock";
  id v17 = @"ToggleAppLibrary";
  v18 = @"ToggleQuickNote";
  v19 = @"LockScreen";
  uint64_t v20 = @"RebootDevice";
  long long v21 = @"ActivateSiri";
  long long v22 = @"ActivateAccessibilityShortcut";
  long long v23 = @"ActivateSOS";
  long long v24 = @"RotateDevice";
  uint64_t v25 = @"ArmApplePay";
  v26 = @"PerformSysdiagnose";
  v27 = @"TogglePassthroughMode";
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v11 count:17];
  objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class(), v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26,
    v27,
  id v7 = v28);
  id v8 = [v7 localizedStringForKey:@"DEVICE" value:&stru_1F0C5BA58 table:@"FullKeyboardAccess"];
  id v9 = [a1 _categoryWithCommandIdentifiers:v6 availableCommands:v5 localizedName:v8];

  return v9;
}

+ (id)_pointerCommandsFromAvailableCommands:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v11 = @"MovePointerToFocus";
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v11 count:1];
  id v7 = objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class(), v11, v12);
  id v8 = [v7 localizedStringForKey:@"POINTER" value:&stru_1F0C5BA58 table:@"FullKeyboardAccess"];
  id v9 = [a1 _categoryWithCommandIdentifiers:v6 availableCommands:v5 localizedName:v8];

  return v9;
}

+ (id)_gesturesCommandsFromAvailableCommands:(id)a3
{
  v11[16] = *MEMORY[0x1E4F143B8];
  v11[0] = @"Gestures";
  v11[1] = @"PressAndLift";
  v11[2] = @"3DTouch";
  v11[3] = @"SwipeUp";
  v11[4] = @"SwipeDown";
  void v11[5] = @"SwipeLeft";
  v11[6] = @"SwipeRight";
  v11[7] = @"PinchIn";
  v11[8] = @"PinchOut";
  v11[9] = @"RotateLeft";
  v11[10] = @"RotateRight";
  v11[11] = @"TwoFingerPressAndLift";
  v11[12] = @"TwoFingerSwipeDown";
  v11[13] = @"TwoFingerSwipeLeft";
  v11[14] = @"TwoFingerSwipeRight";
  void v11[15] = @"TwoFingerSwipeUp";
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:v11 count:16];
  id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"GESTURES" value:&stru_1F0C5BA58 table:@"FullKeyboardAccess"];
  id v9 = [a1 _categoryWithCommandIdentifiers:v6 availableCommands:v5 localizedName:v8];

  return v9;
}

- (AXSSKeyboardCommandCategory)initWithCommands:(id)a3 localizedName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AXSSKeyboardCommandCategory;
  id v9 = [(AXSSKeyboardCommandCategory *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_localizedName, a4);
    objc_storeStrong((id *)&v10->_commands, a3);
  }

  return v10;
}

- (NSArray)commands
{
  return self->_commands;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);

  objc_storeStrong((id *)&self->_commands, 0);
}

@end