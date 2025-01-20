@interface TIHardwareKeyboardDetailController
- (NSString)inputMode;
- (UIKeyboardInputMode)uiKeyboardinputMode;
- (id)newSpecifiers;
- (id)specifiers;
- (void)dealloc;
- (void)setHardwareLayout:(id)a3;
- (void)setUiKeyboardinputMode:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TIHardwareKeyboardDetailController

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TIHardwareKeyboardDetailController;
  [(TIHardwareKeyboardDetailController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)TIHardwareKeyboardDetailController;
  [(TIHardwareKeyboardDetailController *)&v4 viewDidLoad];
  uint64_t v3 = (int)*MEMORY[0x263F5FDD0];
  [*(id *)((char *)&self->super.super.super.super.super.isa + v3) setEstimatedSectionHeaderHeight:0.0];
  [*(id *)((char *)&self->super.super.super.super.super.isa + v3) setEstimatedSectionFooterHeight:0.0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TIHardwareKeyboardDetailController;
  [(TIHardwareKeyboardDetailController *)&v6 viewWillAppear:a3];
  objc_super v4 = (void *)[(TIHardwareKeyboardDetailController *)self specifier];
  v5 = (void *)[v4 propertyForKey:*MEMORY[0x263F602B0]];
  if (v5) {
    objc_msgSend((id)-[TIHardwareKeyboardDetailController navigationItem](self, "navigationItem"), "setTitle:", objc_msgSend((id)objc_msgSend(v5, "titleLabel"), "text"));
  }
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  id result = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!result)
  {
    id result = [(TIHardwareKeyboardDetailController *)self newSpecifiers];
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)result;
  }
  return result;
}

- (id)newSpecifiers
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(TIHardwareKeyboardDetailController *)self inputMode];
  id obj = (id)UIKeyboardGetSupportedHardwareKeyboardsForInputMode();
  objc_super v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(obj, "count") + 1);
  v5 = (void *)[MEMORY[0x263F5FC40] groupSpecifierWithID:0];
  [v5 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60168]];
  v23 = v4;
  v21 = v5;
  [v4 addObject:v5];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = +[TIKeyboardListController inputModes];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v29 != v9) {
        objc_enumerationMutation(v6);
      }
      if ([(NSString *)v3 isEqualToString:TIInputModeGetNormalizedIdentifier()])
      {
        v11 = (void *)[(id)TIInputModeGetComponentsFromIdentifier() objectForKey:@"hw"];
        if ([v11 length]) {
          break;
        }
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v11 = 0;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v12 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    uint64_t v15 = *MEMORY[0x263F60138];
    uint64_t v16 = *MEMORY[0x263F60200];
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * v17);
        v19 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", +[TIKeyboardListController displayNameForHardwareLayout:inputMode:](TIKeyboardListController, "displayNameForHardwareLayout:inputMode:", v18, -[TIHardwareKeyboardDetailController uiKeyboardinputMode](self, "uiKeyboardinputMode")), self, 0, 0, 0, 3, 0);
        [v19 setProperty:v18 forKey:v15];
        if ([v11 isEqualToString:v18]) {
          [v21 setProperty:v19 forKey:v16];
        }
        [v23 addObject:v19];
        ++v17;
      }
      while (v13 != v17);
      uint64_t v13 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v13);
  }
  return v23;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)TIHardwareKeyboardDetailController;
  -[TIHardwareKeyboardDetailController tableView:didSelectRowAtIndexPath:](&v10, sel_tableView_didSelectRowAtIndexPath_);
  uint64_t v7 = (void *)[a3 cellForRowAtIndexPath:a4];
  if (v7)
  {
    uint64_t v8 = (void *)[v7 specifier];
    uint64_t v9 = (void *)[v8 propertyForKey:*MEMORY[0x263F60138]];
    if ([v9 length]) {
      [(TIHardwareKeyboardDetailController *)self setHardwareLayout:v9];
    }
  }
}

- (NSString)inputMode
{
  id result = self->_inputMode;
  if (!result)
  {
    objc_super v4 = (void *)[(TIHardwareKeyboardDetailController *)self specifier];
    id result = (NSString *)objc_msgSend((id)objc_msgSend(v4, "propertyForKey:", *MEMORY[0x263F60138]), "copy");
    self->_inputMode = result;
  }
  return result;
}

- (UIKeyboardInputMode)uiKeyboardinputMode
{
  id result = self->_uiKeyboardinputMode;
  if (!result)
  {
    objc_super v4 = (void *)MEMORY[0x263F1C740];
    v5 = (void *)[(TIHardwareKeyboardDetailController *)self specifier];
    id result = (UIKeyboardInputMode *)objc_msgSend((id)objc_msgSend(v4, "keyboardInputModeWithIdentifier:", objc_msgSend(v5, "propertyForKey:", *MEMORY[0x263F60138])), "copy");
    self->_uiKeyboardinputMode = result;
  }
  return result;
}

- (void)setHardwareLayout:(id)a3
{
  id v5 = (id)objc_msgSend(+[TIKeyboardListController inputModes](TIKeyboardListController, "inputModes"), "mutableCopy");
  if ([v5 count])
  {
    uint64_t v6 = [v5 count];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = 0;
      char v9 = 0;
      uint64_t v13 = v6 - 1;
LABEL_4:
      uint64_t v10 = v8;
      do
      {
        [v5 objectAtIndex:v10];
        if ([(NSString *)[(TIHardwareKeyboardDetailController *)self inputMode] isEqualToString:TIInputModeGetNormalizedIdentifier()])
        {
          id v11 = (id)[(id)TIInputModeGetComponentsFromIdentifier() mutableCopy];
          uint64_t v12 = (void *)[v11 objectForKey:@"hw"];
          if (!v12 || ![v12 isEqualToString:a3])
          {
            [v11 setObject:a3 forKey:@"hw"];
            [v5 replaceObjectAtIndex:v10 withObject:UIKeyboardInputModeGetIdentifierFromComponents()];
            uint64_t v8 = v10 + 1;
            char v9 = 1;
            if (v13 != v10) {
              goto LABEL_4;
            }
            goto LABEL_13;
          }
        }
        ++v10;
      }
      while (v7 != v10);
      if ((v9 & 1) == 0) {
        return;
      }
LABEL_13:
      +[TIKeyboardListController setInputModes:v5];
    }
  }
}

- (void)setUiKeyboardinputMode:(id)a3
{
}

@end