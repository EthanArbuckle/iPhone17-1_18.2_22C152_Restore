@interface BKSHIDEventKeyCommand
+ (BOOL)_isModifierKeyWithPage:(int64_t)a3 usage:(int64_t)a4;
+ (BOOL)_shouldMatchKeyCommandsForEvent:(__IOHIDEvent *)a3 gsKeyboard:(__GSKeyboard *)a4;
+ (BOOL)supportsSecureCoding;
+ (id)_descriptionForKeyCommandCollection:(id)a3;
+ (id)keyCommandForEvent:(__IOHIDEvent *)a3 gsKeyboard:(__GSKeyboard *)a4;
+ (id)keyCommandForEvent:(__IOHIDEvent *)a3 gsKeyboard:(__GSKeyboard *)a4 activeModifiers:(int64_t *)a5;
+ (id)keyCommandWithInput:(id)a3 modifierFlags:(int64_t)a4;
+ (id)keyCommandWithKeyCode:(int64_t)a3 modifierFlags:(int64_t)a4;
- (BKSHIDEventKeyCommand)init;
- (BKSHIDEventKeyCommand)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isModifierOnlyCommand;
- (BOOL)isRoutableKeyCommand;
- (BOOL)isTextualKeyCommand;
- (NSString)commandModifiedInput;
- (NSString)description;
- (NSString)input;
- (NSString)shiftModifiedInput;
- (NSString)unmodifiedInput;
- (id)_initWithInput:(id)a3 keyCode:(int64_t)a4 modifierFlags:(int64_t)a5;
- (id)_sanitizedInputForDescription;
- (int64_t)describes:(id)a3;
- (int64_t)keyCode;
- (int64_t)modifierFlags;
- (int64_t)usagePage;
- (unint64_t)hash;
- (void)_appendKeyWithoutModifiersToDescriptionTarget:(id)a3 keyCodeString:(id)a4;
- (void)_appendPropertiesCommon:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCommandModifiedInput:(id)a3;
- (void)setShiftModifiedInput:(id)a3;
- (void)setUnmodifiedInput:(id)a3;
- (void)setUsagePage:(int64_t)a3;
@end

@implementation BKSHIDEventKeyCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandModifiedInput, 0);
  objc_storeStrong((id *)&self->_shiftModifiedInput, 0);
  objc_storeStrong((id *)&self->_unmodifiedInput, 0);
  objc_storeStrong((id *)&self->_input, 0);
}

- (void)setUsagePage:(int64_t)a3
{
  self->_usagePage = a3;
}

- (int64_t)usagePage
{
  return self->_usagePage;
}

- (void)setCommandModifiedInput:(id)a3
{
}

- (NSString)commandModifiedInput
{
  return self->_commandModifiedInput;
}

- (void)setShiftModifiedInput:(id)a3
{
}

- (NSString)shiftModifiedInput
{
  return self->_shiftModifiedInput;
}

- (void)setUnmodifiedInput:(id)a3
{
}

- (NSString)unmodifiedInput
{
  return self->_unmodifiedInput;
}

- (int64_t)modifierFlags
{
  return self->_modifierFlags;
}

- (int64_t)keyCode
{
  return self->_keyCode;
}

- (NSString)input
{
  return self->_input;
}

- (int64_t)describes:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  v7 = v6;
  if (!v6)
  {
    int64_t v9 = 0;
    goto LABEL_34;
  }
  if ([v6 isModifierOnlyCommand])
  {
    int64_t v8 = [(BKSHIDEventKeyCommand *)self modifierFlags];
    int64_t v9 = ([v7 modifierFlags] & v8) != 0;
    goto LABEL_34;
  }
  if ([(BKSHIDEventKeyCommand *)self keyCode] != -1)
  {
    uint64_t v10 = [v7 keyCode];
    if (v10 == [(BKSHIDEventKeyCommand *)self keyCode])
    {
      int64_t v11 = [(BKSHIDEventKeyCommand *)self modifierFlags];
      if (v11 == [v7 modifierFlags]) {
        goto LABEL_33;
      }
    }
  }
  uint64_t v12 = [v7 unmodifiedInput];
  if (!v12) {
    goto LABEL_16;
  }
  v13 = (void *)v12;
  v14 = [v7 commandModifiedInput];
  if (v14) {
    goto LABEL_15;
  }
  v14 = [v7 unmodifiedInput];
  v15 = [(BKSHIDEventKeyCommand *)self input];
  if ([v14 caseInsensitiveCompare:v15])
  {

LABEL_15:
    goto LABEL_16;
  }
  int64_t v33 = [(BKSHIDEventKeyCommand *)self modifierFlags];
  uint64_t v34 = [v7 modifierFlags];

  if (v33 == v34) {
    goto LABEL_33;
  }
LABEL_16:
  uint64_t v16 = [v7 commandModifiedInput];
  if (v16)
  {
    v17 = (void *)v16;
    v18 = [v7 commandModifiedInput];
    v19 = [(BKSHIDEventKeyCommand *)self input];
    if ([v18 caseInsensitiveCompare:v19])
    {

      goto LABEL_20;
    }
    int64_t v20 = [(BKSHIDEventKeyCommand *)self modifierFlags];
    uint64_t v21 = [v7 modifierFlags];

    if (v20 != v21) {
      goto LABEL_20;
    }
LABEL_33:
    int64_t v9 = 3;
    goto LABEL_34;
  }
LABEL_20:
  v22 = [(BKSHIDEventKeyCommand *)self input];
  v23 = [v22 uppercaseString];
  v24 = [(BKSHIDEventKeyCommand *)self input];
  v25 = [v24 lowercaseString];
  if ([v23 isEqualToString:v25])
  {
    v26 = [v7 shiftModifiedInput];
    v27 = [(BKSHIDEventKeyCommand *)self input];
    if ([v26 isEqualToString:v27])
    {
      uint64_t v28 = [v7 shiftModifiedInput];
      uint64_t v29 = [v7 unmodifiedInput];
      v37 = (void *)v28;
      v30 = (void *)v28;
      v31 = (void *)v29;
      if ([v30 isEqualToString:v29])
      {
        BOOL v32 = 0;
      }
      else
      {
        unint64_t v36 = [v7 modifierFlags] & 0xFFFFFFFFFFFDFFFFLL;
        BOOL v32 = v36 == [(BKSHIDEventKeyCommand *)self modifierFlags];
      }
    }
    else
    {
      BOOL v32 = 0;
    }
  }
  else
  {
    BOOL v32 = 0;
  }

  if (v32) {
    int64_t v9 = 3;
  }
  else {
    int64_t v9 = 0;
  }
LABEL_34:

  return v9;
}

- (BOOL)isRoutableKeyCommand
{
  return ([(BKSHIDEventKeyCommand *)self modifierFlags] & 0x940000) != 0;
}

- (BOOL)isModifierOnlyCommand
{
  int64_t v3 = [(BKSHIDEventKeyCommand *)self modifierFlags];
  if (v3)
  {
    id v4 = [(BKSHIDEventKeyCommand *)self input];

    if (v4)
    {
      LOBYTE(v3) = 0;
    }
    else if ([(BKSHIDEventKeyCommand *)self keyCode] == -1)
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      v5 = objc_opt_class();
      int64_t v6 = [(BKSHIDEventKeyCommand *)self usagePage];
      int64_t v7 = [(BKSHIDEventKeyCommand *)self keyCode];
      LOBYTE(v3) = [v5 _isModifierKeyWithPage:v6 usage:v7];
    }
  }
  return v3;
}

- (BOOL)isTextualKeyCommand
{
  return ([(BKSHIDEventKeyCommand *)self modifierFlags] & 0x140000) == 0;
}

- (id)_sanitizedInputForDescription
{
  v2 = [(BKSHIDEventKeyCommand *)self input];
  int64_t v3 = [v2 _stringRepresentation];

  return v3;
}

- (void)_appendPropertiesCommon:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__BKSHIDEventKeyCommand__appendPropertiesCommon___block_invoke;
  v6[3] = &unk_1E54408B8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [v5 appendCustomFormatWithName:0 block:v6];
}

void __49__BKSHIDEventKeyCommand__appendPropertiesCommon___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 24);
  if (v4
    && ([*(id *)(a1 + 40) style],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 clientInformation],
        int64_t v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 containsObject:@"skipModifiers"],
        v6,
        v5,
        (v7 & 1) == 0))
  {
    BSDescriptionStreamAppendBKSKeyModifierFlags(v3, v4);
    int v8 = 1;
  }
  else
  {
    int v8 = 0;
  }
  uint64_t v9 = [*(id *)(a1 + 32) keyCode];
  uint64_t v10 = v9;
  if ((v9 - 1) > 0xFFFFFFFD)
  {
    v13 = 0;
    if (!v8) {
      goto LABEL_27;
    }
    goto LABEL_25;
  }
  if ((v9 - 4) > 0x19)
  {
    if ((v9 - 30) > 8)
    {
      if ((int)v9 > 223)
      {
        switch((int)v9)
        {
          case 224:
            v14 = @"lctrl";
            break;
          case 225:
            v14 = @"lshft";
            break;
          case 226:
            v14 = @"lopt";
            break;
          case 227:
            v14 = @"lcmd";
            break;
          case 228:
            v14 = @"rctrl";
            break;
          case 229:
            v14 = @"rshft";
            break;
          case 230:
            v14 = @"ropt";
            break;
          case 231:
            v14 = @"rcmd";
            break;
          default:
            goto LABEL_24;
        }
        v15 = @" ";
LABEL_14:
        v13 = [NSString stringWithFormat:@"(%02X:%@)", v10, v14];

        if ((v8 & 1) == 0) {
          goto LABEL_27;
        }
        goto LABEL_26;
      }
      switch((int)v9)
      {
        case 'O':
          v14 = @"rightArrow";
          break;
        case 'P':
          v14 = @"leftArrow";
          break;
        case 'Q':
          v14 = @"downArrow";
          break;
        case 'R':
          v14 = @"upArrow";
          break;
        default:
          if (v9 == 39)
          {
            v14 = @"0";
          }
          else
          {
            if (v9 != 44) {
              goto LABEL_24;
            }
            v14 = @"space";
          }
          break;
      }
LABEL_13:
      v15 = @"-";
      goto LABEL_14;
    }
    __int16 v16 = v9 + 19;
    int64_t v11 = NSString;
    uint64_t v12 = &v16;
  }
  else
  {
    __int16 v17 = v9 + 93;
    int64_t v11 = NSString;
    uint64_t v12 = &v17;
  }
  v14 = [v11 stringWithCharacters:v12 length:1];
  if (v14) {
    goto LABEL_13;
  }
LABEL_24:
  v13 = objc_msgSend(NSString, "stringWithFormat:", @"(code: %02X)", v10);
  if (v8)
  {
LABEL_25:
    v15 = @"-";
LABEL_26:
    [v3 appendString:v15];
  }
LABEL_27:
  [*(id *)(a1 + 32) _appendKeyWithoutModifiersToDescriptionTarget:v3 keyCodeString:v13];
}

- (void)_appendKeyWithoutModifiersToDescriptionTarget:(id)a3 keyCodeString:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  char v7 = [(BKSHIDEventKeyCommand *)self _sanitizedInputForDescription];
  if (v7)
  {
    [v8 appendString:v7];
    if (!v6) {
      goto LABEL_6;
    }
    [v8 appendString:@" "];
  }
  else if (!v6)
  {
    goto LABEL_6;
  }
  [v8 appendString:v6];
LABEL_6:
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __36__BKSHIDEventKeyCommand_description__block_invoke;
  uint64_t v10 = &unk_1E5441BB0;
  int64_t v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  id v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return (NSString *)v5;
}

uint64_t __36__BKSHIDEventKeyCommand_description__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _appendPropertiesCommon:*(void *)(a1 + 40)];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 input];
    uint64_t v7 = [(BKSHIDEventKeyCommand *)self input];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      uint64_t v8 = (void *)v7;
      uint64_t v9 = [v5 input];
      uint64_t v10 = [(BKSHIDEventKeyCommand *)self input];
      int v11 = [v9 isEqualToString:v10];

      if (!v11) {
        goto LABEL_9;
      }
    }
    uint64_t v13 = [v5 keyCode];
    if (v13 == [(BKSHIDEventKeyCommand *)self keyCode])
    {
      uint64_t v14 = [v5 modifierFlags];
      BOOL v12 = v14 == [(BKSHIDEventKeyCommand *)self modifierFlags];
LABEL_10:

      goto LABEL_11;
    }
LABEL_9:
    BOOL v12 = 0;
    goto LABEL_10;
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (unint64_t)hash
{
  int64_t keyCode = self->_keyCode;
  if (keyCode == -1)
  {
    NSUInteger v5 = [(NSString *)self->_input hash] & 0xFFFFFFFFFF40FFFFLL;
    unint64_t modifierFlags = self->_modifierFlags;
  }
  else
  {
    unint64_t modifierFlags = keyCode & 0xFFFFFFFFFF40FFFFLL;
    NSUInteger v5 = self->_modifierFlags;
  }
  return v5 | modifierFlags;
}

- (BKSHIDEventKeyCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"input"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"keyCode"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"modifierFlags"];

  uint64_t v8 = [(BKSHIDEventKeyCommand *)self _initWithInput:v5 keyCode:v6 modifierFlags:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  input = self->_input;
  id v5 = a3;
  [v5 encodeObject:input forKey:@"input"];
  [v5 encodeInteger:self->_keyCode forKey:@"keyCode"];
  [v5 encodeInteger:self->_modifierFlags forKey:@"modifierFlags"];
}

- (id)_initWithInput:(id)a3 keyCode:(int64_t)a4 modifierFlags:(int64_t)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BKSHIDEventKeyCommand;
  uint64_t v9 = [(BKSHIDEventKeyCommand *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    input = v9->_input;
    v9->_input = (NSString *)v10;

    objc_storeStrong((id *)&v9->_unmodifiedInput, v9->_input);
    v9->_int64_t keyCode = a4;
    v9->_unint64_t modifierFlags = a5;
    v9->_usagePage = 7;
  }

  return v9;
}

- (BKSHIDEventKeyCommand)init
{
  id v4 = [NSString stringWithFormat:@"-init is not allowed on BKSHIDEventKeyCommand"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    BOOL v12 = v7;
    __int16 v13 = 2048;
    uint64_t v14 = self;
    __int16 v15 = 2114;
    __int16 v16 = @"BKSHIDEventKeyCommand.m";
    __int16 v17 = 1024;
    int v18 = 110;
    __int16 v19 = 2114;
    int64_t v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BKSHIDEventKeyCommand *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (BOOL)_shouldMatchKeyCommandsForEvent:(__IOHIDEvent *)a3 gsKeyboard:(__GSKeyboard *)a4
{
  if (!a4) {
    return 0;
  }
  uint64_t IntegerValue = IOHIDEventGetIntegerValue();
  return ([a1 _isModifierKeyWithPage:IntegerValue usage:IOHIDEventGetIntegerValue()] & 1) != 0
      || (GSKeyboardGetModifierState() & 0x5910000) != 0;
}

+ (BOOL)_isModifierKeyWithPage:(int64_t)a3 usage:(int64_t)a4
{
  if (a3 != 7) {
    return GSKeyboardIsGlobeKeyUsagePair() != 0;
  }
  return (unint64_t)(a4 - 224) < 8 || a4 == 83 || a4 == 57;
}

+ (id)keyCommandForEvent:(__IOHIDEvent *)a3 gsKeyboard:(__GSKeyboard *)a4 activeModifiers:(int64_t *)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t IntegerValue = IOHIDEventGetIntegerValue();
  uint64_t v8 = IOHIDEventGetIntegerValue();
  uint64_t v9 = IOHIDEventGetIntegerValue();
  [(id)objc_opt_class() _isModifierKeyWithPage:v9 usage:IntegerValue];
  if ((unint64_t)(IntegerValue - 83) < 0x11 || IntegerValue == 103 || IntegerValue == 133) {
    int64_t v12 = 0x200000;
  }
  else {
    int64_t v12 = 0;
  }
  if (!a4 || !MEMORY[0x1E4F64CD0])
  {
    if (a5) {
      *a5 = v12;
    }
    v40[0] = 0;
    if ((unsigned __int16)IntegerValue - 4 <= 0x19)
    {
      char v15 = IntegerValue + 93;
LABEL_57:
      LOBYTE(v40[0]) = v15;
      v25 = [NSString stringWithUTF8String:v40];
      uint64_t v21 = [(id)objc_opt_class() keyCommandWithInput:v25 modifierFlags:v12];
      v21[2] = (unsigned __int16)IntegerValue;
      [v21 setUnmodifiedInput:v25];

      goto LABEL_58;
    }
    if ((unsigned __int16)IntegerValue - 30 <= 9)
    {
      char v15 = IntegerValue + 18;
      goto LABEL_57;
    }
    if ((unsigned __int16)IntegerValue - 89 <= 9)
    {
      char v15 = IntegerValue - 41;
      goto LABEL_57;
    }
    if ((unsigned __int16)IntegerValue > 0x57u)
    {
      if ((unsigned __int16)IntegerValue != 88)
      {
        if ((unsigned __int16)IntegerValue != 133) {
          goto LABEL_52;
        }
        goto LABEL_55;
      }
    }
    else if ((unsigned __int16)IntegerValue != 40)
    {
      if ((unsigned __int16)IntegerValue != 54)
      {
LABEL_52:
        uint64_t v21 = [(id)objc_opt_class() keyCommandWithKeyCode:(unsigned __int16)IntegerValue modifierFlags:v12];
        goto LABEL_58;
      }
LABEL_55:
      char v15 = 44;
      goto LABEL_57;
    }
    char v15 = 13;
    goto LABEL_57;
  }
  int v35 = 0;
  int v36 = 0;
  __int16 v34 = 0;
  unsigned int LiveModifierState = GSKeyboardGetLiveModifierState();
  uint64_t v32 = 0;
  uint64_t v33 = v9;
  v31 = &v34;
  uint64_t v29 = &v35;
  v30 = v37;
  v27 = (char *)&v35 + 2;
  uint64_t v28 = v38;
  GSKeyboardTranslateKeyExtendedCommandWithUsagePage();
  if (v8)
  {
    int64_t v14 = v12;
    unsigned int LiveModifierState = GSKeyboardGetLiveModifierState();
  }
  else
  {
    int64_t v14 = v12;
  }
  if ((LiveModifierState & 0x480000) != 0) {
    unint64_t v16 = ((unint64_t)((LiveModifierState & 0x1010000) != 0) << 20) | 0x80000;
  }
  else {
    unint64_t v16 = (unint64_t)((LiveModifierState & 0x1010000) != 0) << 20;
  }
  if ((LiveModifierState & 0x900000) != 0) {
    v16 |= 0x40000uLL;
  }
  if ((LiveModifierState & 0x220000) != 0) {
    v16 |= 0x20000uLL;
  }
  unint64_t v17 = v16 | (LiveModifierState >> 3) & 0x800000 | (LiveModifierState >> 2) & 0x10000 | (unint64_t)v14;
  if (a5)
  {
    unsigned int v18 = GSKeyboardGetLiveModifierState();
    if ((v18 & 0x480000) != 0) {
      unint64_t v19 = ((unint64_t)((v18 & 0x1010000) != 0) << 20) | 0x80000;
    }
    else {
      unint64_t v19 = (unint64_t)((v18 & 0x1010000) != 0) << 20;
    }
    if ((v18 & 0x900000) != 0) {
      v19 |= 0x40000uLL;
    }
    if ((v18 & 0x220000) != 0) {
      v19 |= 0x20000uLL;
    }
    *a5 = v19 | (v18 >> 3) & 0x800000 | (v18 >> 2) & 0x10000;
  }
  if (HIWORD(v36))
  {
    int64_t v20 = objc_msgSend(NSString, "stringWithCharacters:length:", v40, (char *)&v35 + 2, v38, &v35, v37, &v34, 0, v9);
  }
  else
  {
    int64_t v20 = 0;
  }
  uint64_t v21 = [(id)objc_opt_class() keyCommandWithInput:v20 modifierFlags:v17];
  v21[2] = IntegerValue;
  if ((_WORD)v36)
  {
    v22 = objc_msgSend(NSString, "stringWithCharacters:length:", v39);
    [v21 setUnmodifiedInput:v22];
  }
  if (HIWORD(v35))
  {
    v23 = objc_msgSend(NSString, "stringWithCharacters:length:", v38);
    [v21 setShiftModifiedInput:v23];
  }
  if ((_WORD)v35)
  {
    v24 = objc_msgSend(NSString, "stringWithCharacters:length:", v37);
    [v21 setCommandModifiedInput:v24];
  }
  objc_msgSend(v21, "setUsagePage:", v9, v27, v28, v29, v30, v31, v32, v33);

LABEL_58:
  return v21;
}

+ (id)keyCommandForEvent:(__IOHIDEvent *)a3 gsKeyboard:(__GSKeyboard *)a4
{
  return (id)[a1 keyCommandForEvent:a3 gsKeyboard:a4 activeModifiers:0];
}

+ (id)_descriptionForKeyCommandCollection:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    __int16 v13 = [NSString stringWithFormat:@"collection must be an NSSet, NSArray, or NSOrderedSet"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int64_t v14 = NSStringFromSelector(a2);
      char v15 = (objc_class *)objc_opt_class();
      unint64_t v16 = NSStringFromClass(v15);
      *(_DWORD *)buf = 138544642;
      v24 = v14;
      __int16 v25 = 2114;
      v26 = v16;
      __int16 v27 = 2048;
      id v28 = a1;
      __int16 v29 = 2114;
      v30 = @"BKSHIDEventKeyCommand.m";
      __int16 v31 = 1024;
      int v32 = 328;
      __int16 v33 = 2114;
      __int16 v34 = v13;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA2A368);
  }
  uint64_t v6 = objc_msgSend(v5, "bs_dictionaryByPartitioning:", &__block_literal_global_344);
  uint64_t v7 = [MEMORY[0x1E4F4F728] build:&__block_literal_global_62];
  id v8 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  unint64_t v19 = __61__BKSHIDEventKeyCommand__descriptionForKeyCommandCollection___block_invoke_3;
  int64_t v20 = &unk_1E5440950;
  id v21 = v8;
  id v22 = v7;
  id v9 = v7;
  id v10 = v8;
  [v10 appendDictionary:v6 withName:0 itemBlock:&v17];
  __int16 v11 = objc_msgSend(v10, "description", v17, v18, v19, v20);

  return v11;
}

void __61__BKSHIDEventKeyCommand__descriptionForKeyCommandCollection___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__BKSHIDEventKeyCommand__descriptionForKeyCommandCollection___block_invoke_4;
  v12[3] = &unk_1E5440928;
  id v13 = v7;
  id v14 = *(id *)(a1 + 40);
  id v15 = v6;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__BKSHIDEventKeyCommand__descriptionForKeyCommandCollection___block_invoke_7;
  v10[3] = &unk_1E54410D0;
  id v11 = v5;
  id v8 = v5;
  id v9 = v6;
  [v13 appendCustomFormatForValue:v12 withCustomFormatForName:v10];
}

void __61__BKSHIDEventKeyCommand__descriptionForKeyCommandCollection___block_invoke_4(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__BKSHIDEventKeyCommand__descriptionForKeyCommandCollection___block_invoke_5;
  v4[3] = &unk_1E5441BB0;
  id v5 = v2;
  id v6 = *(id *)(a1 + 48);
  [v5 overlayStyle:v3 block:v4];
}

void __61__BKSHIDEventKeyCommand__descriptionForKeyCommandCollection___block_invoke_7(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  BSDescriptionStreamAppendBKSKeyModifierFlags(v3, [v2 unsignedIntValue]);
}

void __61__BKSHIDEventKeyCommand__descriptionForKeyCommandCollection___block_invoke_5(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__BKSHIDEventKeyCommand__descriptionForKeyCommandCollection___block_invoke_6;
  v3[3] = &unk_1E5440900;
  id v4 = v1;
  [v4 appendCollection:v2 withName:0 itemBlock:v3];
}

id __61__BKSHIDEventKeyCommand__descriptionForKeyCommandCollection___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return (id)[*(id *)(a1 + 32) appendObject:a2 withName:0];
}

void __61__BKSHIDEventKeyCommand__descriptionForKeyCommandCollection___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setCollectionLineBreak:2];
  id v3 = [MEMORY[0x1E4F1CAD0] setWithObject:@"skipModifiers"];
  [v2 setClientInformation:v3];
}

uint64_t __61__BKSHIDEventKeyCommand__descriptionForKeyCommandCollection___block_invoke(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 modifierFlags];
  return [v2 numberWithInteger:v3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)keyCommandWithKeyCode:(int64_t)a3 modifierFlags:(int64_t)a4
{
  id v4 = [[BKSHIDEventKeyCommand alloc] _initWithInput:0 keyCode:a3 modifierFlags:a4];
  return v4;
}

+ (id)keyCommandWithInput:(id)a3 modifierFlags:(int64_t)a4
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F1CA98] null];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {

    id v5 = 0;
  }
  id v8 = [[BKSHIDEventKeyCommand alloc] _initWithInput:v5 keyCode:-1 modifierFlags:a4];

  return v8;
}

@end