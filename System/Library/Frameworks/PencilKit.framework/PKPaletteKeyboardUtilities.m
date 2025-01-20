@interface PKPaletteKeyboardUtilities
+ (BOOL)isReturnKeyEnabled;
+ (id)combinedMenuFromKeyboardMenu:(id)a3 withLanguageMenu:(id)a4;
+ (id)textInputResponderForEditing;
+ (id)textInputUndoManagerForEditing;
+ (int64_t)textInputReturnKeyTypeForEditing;
+ (void)performReturn;
@end

@implementation PKPaletteKeyboardUtilities

+ (id)textInputResponderForEditing
{
  v2 = [MEMORY[0x1E4FB1900] sharedInstance];
  v3 = [v2 delegateAsResponder];
  v4 = [v3 _responderForEditing];

  return v4;
}

+ (id)textInputUndoManagerForEditing
{
  v2 = [a1 textInputResponderForEditing];
  v3 = [v2 undoManager];

  return v3;
}

+ (int64_t)textInputReturnKeyTypeForEditing
{
  v2 = [a1 textInputResponderForEditing];
  v3 = +[PKTextInputUtilities textInputTraitsFromTextInput:v2];
  if ([v3 keyboardType] == 10)
  {
    int64_t v4 = 6;
  }
  else
  {
    char v5 = objc_opt_respondsToSelector();
    v6 = v3;
    if (v5 & 1) != 0 || (char v7 = objc_opt_respondsToSelector(), v6 = v2, (v7)) {
      int64_t v4 = [v6 returnKeyType];
    }
    else {
      int64_t v4 = 0;
    }
  }

  return v4;
}

+ (BOOL)isReturnKeyEnabled
{
  v2 = [MEMORY[0x1E4FB1900] activeInstance];
  char v3 = [v2 returnKeyEnabled];

  return v3;
}

+ (void)performReturn
{
  id v5 = [MEMORY[0x1E4FB1900] activeInstance];
  [v5 performReturn];
  char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  int64_t v4 = [a1 textInputResponderForEditing];
  [v3 postNotificationName:@"PKPaletteKeyboardUtilitiesDidPerformReturnNotification" object:v4];
}

+ (id)combinedMenuFromKeyboardMenu:(id)a3 withLanguageMenu:(id)a4
{
  int64_t v4 = 0;
  v12[2] = *MEMORY[0x1E4F143B8];
  if (a3 && a4)
  {
    v6 = (void *)MEMORY[0x1E4FB1970];
    v12[0] = a3;
    v12[1] = a4;
    char v7 = (void *)MEMORY[0x1E4F1C978];
    id v8 = a4;
    id v9 = a3;
    v10 = [v7 arrayWithObjects:v12 count:2];
    int64_t v4 = [v6 menuWithChildren:v10];
  }

  return v4;
}

@end