@interface AXEventKeyInfoRepresentation
+ (BOOL)supportsSecureCoding;
+ (__GSKeyboard)_getUIKitKeyboardRef;
+ (__GSKeyboard)_getUSUIKitKeyboardRef;
+ (unsigned)_getIOHIDKeyboardTypeForGSKeyboardType:(unsigned __int8)a3;
+ (void)prepareForKeycodeTranslation;
- (AXEventKeyInfoRepresentation)initWithCoder:(id)a3;
- (BOOL)keyDown;
- (NSString)backupModifiedInput;
- (NSString)backupShiftModifiedInput;
- (NSString)backupUnmodifiedInput;
- (NSString)description;
- (NSString)modifiedInput;
- (NSString)shiftModifiedInput;
- (NSString)unmodifiedInput;
- (__GSKeyboard)_getUIKitKeyboardRef;
- (__GSKeyboard)_getUSUIKitKeyboardRef;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)alternativeKeyCode;
- (unsigned)gsModifierState;
- (unsigned)keyCode;
- (unsigned)modifierState;
- (unsigned)usagePage;
- (void)encodeWithCoder:(id)a3;
- (void)setAlternativeKeyCode:(unsigned __int16)a3;
- (void)setBackupModifiedInput:(id)a3;
- (void)setBackupShiftModifiedInput:(id)a3;
- (void)setBackupUnmodifiedInput:(id)a3;
- (void)setGsModifierState:(unsigned int)a3;
- (void)setKeyCode:(unsigned __int16)a3;
- (void)setKeyDown:(BOOL)a3;
- (void)setModifiedInput:(id)a3;
- (void)setModifierState:(unsigned int)a3;
- (void)setShiftModifiedInput:(id)a3;
- (void)setUnmodifiedInput:(id)a3;
- (void)setUsagePage:(unsigned int)a3;
- (void)translateKeycode;
- (void)translateStringToKeycode;
@end

@implementation AXEventKeyInfoRepresentation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXEventKeyInfoRepresentation)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AXEventKeyInfoRepresentation;
  v5 = [(AXEventKeyInfoRepresentation *)&v13 init];
  if (v5)
  {
    -[AXEventKeyInfoRepresentation setKeyCode:](v5, "setKeyCode:", (unsigned __int16)[v4 decodeInt32ForKey:@"keyCode"]);
    -[AXEventKeyInfoRepresentation setUsagePage:](v5, "setUsagePage:", [v4 decodeInt32ForKey:@"usagePage"]);
    -[AXEventKeyInfoRepresentation setKeyDown:](v5, "setKeyDown:", [v4 decodeBoolForKey:@"keyDown"]);
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"unmodifiedInput"];
    [(AXEventKeyInfoRepresentation *)v5 setUnmodifiedInput:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modifiedInput"];
    [(AXEventKeyInfoRepresentation *)v5 setModifiedInput:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shiftModifiedInput"];
    [(AXEventKeyInfoRepresentation *)v5 setShiftModifiedInput:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backupUnmodifiedInput"];
    [(AXEventKeyInfoRepresentation *)v5 setBackupUnmodifiedInput:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backupModifiedInput"];
    [(AXEventKeyInfoRepresentation *)v5 setBackupModifiedInput:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backupShiftModifiedInput"];
    [(AXEventKeyInfoRepresentation *)v5 setBackupShiftModifiedInput:v11];

    -[AXEventKeyInfoRepresentation setModifierState:](v5, "setModifierState:", [v4 decodeIntegerForKey:@"modifierState"]);
    -[AXEventKeyInfoRepresentation setGsModifierState:](v5, "setGsModifierState:", [v4 decodeInt32ForKey:@"gsModifierState"]);
    -[AXEventKeyInfoRepresentation setAlternativeKeyCode:](v5, "setAlternativeKeyCode:", (unsigned __int16)[v4 decodeInt32ForKey:@"alternativeKeyCode"]);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(AXEventKeyInfoRepresentation);
  v5 = [(AXEventKeyInfoRepresentation *)self unmodifiedInput];
  [(AXEventKeyInfoRepresentation *)v4 setUnmodifiedInput:v5];

  v6 = [(AXEventKeyInfoRepresentation *)self shiftModifiedInput];
  [(AXEventKeyInfoRepresentation *)v4 setShiftModifiedInput:v6];

  [(AXEventKeyInfoRepresentation *)v4 setModifierState:[(AXEventKeyInfoRepresentation *)self modifierState]];
  [(AXEventKeyInfoRepresentation *)v4 setGsModifierState:[(AXEventKeyInfoRepresentation *)self gsModifierState]];
  v7 = [(AXEventKeyInfoRepresentation *)self modifiedInput];
  [(AXEventKeyInfoRepresentation *)v4 setModifiedInput:v7];

  [(AXEventKeyInfoRepresentation *)v4 setKeyCode:[(AXEventKeyInfoRepresentation *)self keyCode]];
  [(AXEventKeyInfoRepresentation *)v4 setUsagePage:[(AXEventKeyInfoRepresentation *)self usagePage]];
  [(AXEventKeyInfoRepresentation *)v4 setAlternativeKeyCode:[(AXEventKeyInfoRepresentation *)self alternativeKeyCode]];
  [(AXEventKeyInfoRepresentation *)v4 setKeyDown:[(AXEventKeyInfoRepresentation *)self keyDown]];
  v8 = [(AXEventKeyInfoRepresentation *)self backupUnmodifiedInput];
  [(AXEventKeyInfoRepresentation *)v4 setBackupUnmodifiedInput:v8];

  v9 = [(AXEventKeyInfoRepresentation *)self backupShiftModifiedInput];
  [(AXEventKeyInfoRepresentation *)v4 setBackupShiftModifiedInput:v9];

  v10 = [(AXEventKeyInfoRepresentation *)self backupModifiedInput];
  [(AXEventKeyInfoRepresentation *)v4 setBackupModifiedInput:v10];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[AXEventKeyInfoRepresentation keyCode](self, "keyCode"), @"keyCode");
  objc_msgSend(v4, "encodeInt32:forKey:", -[AXEventKeyInfoRepresentation alternativeKeyCode](self, "alternativeKeyCode"), @"alternativeKeyCode");
  objc_msgSend(v4, "encodeInt32:forKey:", -[AXEventKeyInfoRepresentation usagePage](self, "usagePage"), @"usagePage");
  objc_msgSend(v4, "encodeBool:forKey:", -[AXEventKeyInfoRepresentation keyDown](self, "keyDown"), @"keyDown");
  v5 = [(AXEventKeyInfoRepresentation *)self unmodifiedInput];
  [v4 encodeObject:v5 forKey:@"unmodifiedInput"];

  v6 = [(AXEventKeyInfoRepresentation *)self modifiedInput];
  [v4 encodeObject:v6 forKey:@"modifiedInput"];

  v7 = [(AXEventKeyInfoRepresentation *)self shiftModifiedInput];
  [v4 encodeObject:v7 forKey:@"shiftModifiedInput"];

  objc_msgSend(v4, "encodeInt32:forKey:", -[AXEventKeyInfoRepresentation modifierState](self, "modifierState"), @"modifierState");
  objc_msgSend(v4, "encodeInt32:forKey:", -[AXEventKeyInfoRepresentation gsModifierState](self, "gsModifierState"), @"gsModifierState");
  v8 = [(AXEventKeyInfoRepresentation *)self backupModifiedInput];
  [v4 encodeObject:v8 forKey:@"backupModifiedInput"];

  v9 = [(AXEventKeyInfoRepresentation *)self backupUnmodifiedInput];
  [v4 encodeObject:v9 forKey:@"backupUnmodifiedInput"];

  id v10 = [(AXEventKeyInfoRepresentation *)self backupShiftModifiedInput];
  [v4 encodeObject:v10 forKey:@"backupShiftModifiedInput"];
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"keyCode:%hu usagePage:%u down:%u modState:%u unmodIn:%@ modIn:%@ shftIn:%@", self->_keyCode, self->_usagePage, self->_keyDown, self->_modifierState, self->_unmodifiedInput, self->_modifiedInput, self->_shiftModifiedInput];
}

+ (void)prepareForKeycodeTranslation
{
  [a1 _getUIKitKeyboardRef];

  [a1 _getUSUIKitKeyboardRef];
}

- (__GSKeyboard)_getUIKitKeyboardRef
{
  v2 = objc_opt_class();

  return (__GSKeyboard *)[v2 _getUIKitKeyboardRef];
}

- (__GSKeyboard)_getUSUIKitKeyboardRef
{
  v2 = objc_opt_class();

  return (__GSKeyboard *)[v2 _getUSUIKitKeyboardRef];
}

+ (__GSKeyboard)_getUSUIKitKeyboardRef
{
  if (_getUSUIKitKeyboardRef_onceToken != -1) {
    dispatch_once(&_getUSUIKitKeyboardRef_onceToken, &__block_literal_global_33);
  }
  result = (__GSKeyboard *)_getUSUIKitKeyboardRef__KeyboardRef;
  if (!_getUSUIKitKeyboardRef__KeyboardRef)
  {
    AXPerformBlockSynchronouslyOnMainThread();
    return (__GSKeyboard *)_getUSUIKitKeyboardRef__KeyboardRef;
  }
  return result;
}

void __54__AXEventKeyInfoRepresentation__getUSUIKitKeyboardRef__block_invoke()
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v0 = *MEMORY[0x1E4FAEA28];
  v1 = [MEMORY[0x1E4F28F08] mainQueue];
  id v2 = (id)[v3 addObserverForName:v0 object:0 queue:v1 usingBlock:&__block_literal_global_310];
}

void __54__AXEventKeyInfoRepresentation__getUSUIKitKeyboardRef__block_invoke_2()
{
}

__GSKeyboard *__54__AXEventKeyInfoRepresentation__getUSUIKitKeyboardRef__block_invoke_3()
{
  if (_getUSUIKitKeyboardRef__KeyboardRef)
  {
    GSKeyboardRelease();
    _getUSUIKitKeyboardRef__KeyboardRef = 0;
  }

  return +[AXEventKeyInfoRepresentation _getUIKitKeyboardRef];
}

uint64_t __54__AXEventKeyInfoRepresentation__getUSUIKitKeyboardRef__block_invoke_4(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _getUIKitKeyboardRef];
  if (result)
  {
    GSKeyboardGetHWKeyboardType();
    uint64_t result = GSKeyboardCreate();
    _getUSUIKitKeyboardRef__KeyboardRef = result;
  }
  return result;
}

+ (unsigned)_getIOHIDKeyboardTypeForGSKeyboardType:(unsigned __int8)a3
{
  if (a3 == 202) {
    unsigned __int8 v3 = 0;
  }
  else {
    unsigned __int8 v3 = a3;
  }
  if (a3 == 203) {
    unsigned __int8 v4 = 1;
  }
  else {
    unsigned __int8 v4 = v3;
  }
  if (a3 == 207) {
    return 2;
  }
  else {
    return v4;
  }
}

+ (__GSKeyboard)_getUIKitKeyboardRef
{
  if (_getUIKitKeyboardRef_onceToken != -1) {
    dispatch_once(&_getUIKitKeyboardRef_onceToken, &__block_literal_global_317);
  }
  uint64_t result = (__GSKeyboard *)_getUIKitKeyboardRef__KeyboardRef;
  if (!_getUIKitKeyboardRef__KeyboardRef)
  {
    AXPerformBlockSynchronouslyOnMainThread();
    return (__GSKeyboard *)_getUIKitKeyboardRef__KeyboardRef;
  }
  return result;
}

void __52__AXEventKeyInfoRepresentation__getUIKitKeyboardRef__block_invoke()
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v0 = *MEMORY[0x1E4FAEA28];
  v1 = [MEMORY[0x1E4F28F08] mainQueue];
  id v2 = (id)[v3 addObserverForName:v0 object:0 queue:v1 usingBlock:&__block_literal_global_319];
}

void __52__AXEventKeyInfoRepresentation__getUIKitKeyboardRef__block_invoke_2()
{
}

__GSKeyboard *__52__AXEventKeyInfoRepresentation__getUIKitKeyboardRef__block_invoke_3()
{
  if (_getUIKitKeyboardRef__KeyboardRef)
  {
    GSKeyboardRelease();
    _getUIKitKeyboardRef__KeyboardRef = 0;
  }

  return +[AXEventKeyInfoRepresentation _getUIKitKeyboardRef];
}

void __52__AXEventKeyInfoRepresentation__getUIKitKeyboardRef__block_invoke_4(uint64_t a1)
{
  id v2 = [NSClassFromString(&cfstr_Uiapplication.isa) safeValueForKey:@"sharedApplication"];

  if (v2)
  {
    id v3 = [NSClassFromString(&cfstr_Uikeyboardimpl.isa) safeValueForKey:@"sharedInstance"];
    id v4 = (id)[v3 safeValueForKey:@"setInputModeFromPreferences"];
  }
  [*(id *)(a1 + 32) _getIOHIDKeyboardTypeForGSKeyboardType:GSEventGetHardwareKeyboardType()];
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2050000000;
  v5 = (void *)getUIKeyboardInputModeControllerClass_softClass;
  uint64_t v14 = getUIKeyboardInputModeControllerClass_softClass;
  if (!getUIKeyboardInputModeControllerClass_softClass)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __getUIKeyboardInputModeControllerClass_block_invoke;
    v10[3] = &unk_1E5585E30;
    v10[4] = &v11;
    __getUIKeyboardInputModeControllerClass_block_invoke((uint64_t)v10);
    v5 = (void *)v12[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v11, 8);
  v7 = [v6 sharedInputModeController];
  v8 = [v7 hardwareInputMode];
  v9 = [v8 automaticHardwareLayout];

  _getUIKitKeyboardRef__KeyboardRef = GSKeyboardCreate();
}

- (void)translateStringToKeycode
{
  id v3 = [(AXEventKeyInfoRepresentation *)self modifiedInput];
  uint64_t v4 = [v3 length];

  if (!v4) {
    return;
  }
  v5 = [(AXEventKeyInfoRepresentation *)self modifiedInput];
  int v6 = [v5 characterAtIndex:0];

  if ((v6 - 97) <= 0x19)
  {
    unsigned __int16 v7 = v6 - 93;
LABEL_13:
    [(AXEventKeyInfoRepresentation *)self setKeyCode:v7];
    goto LABEL_14;
  }
  if ((v6 - 65) <= 0x19)
  {
    unsigned __int16 v7 = v6 - 61;
    goto LABEL_13;
  }
  if (v6 == 48)
  {
    unsigned __int16 v7 = 39;
    goto LABEL_13;
  }
  if ((v6 - 49) <= 8)
  {
    unsigned __int16 v7 = v6 - 19;
    goto LABEL_13;
  }
  if (v6 == 32)
  {
    unsigned __int16 v7 = 44;
    goto LABEL_13;
  }
LABEL_14:

  [(AXEventKeyInfoRepresentation *)self setUsagePage:7];
}

- (void)translateKeycode
{
  if ([(AXEventKeyInfoRepresentation *)self usagePage] == 7
    || [(AXEventKeyInfoRepresentation *)self usagePage] == 65281
    || [(AXEventKeyInfoRepresentation *)self usagePage] == 255)
  {
    id v3 = (unsigned __int16 *)malloc_type_calloc(1uLL, 0xA2uLL, 0x10000402B2F1F51uLL);
    uint64_t v4 = (unsigned __int16 *)malloc_type_calloc(1uLL, 0xA2uLL, 0x10000402B2F1F51uLL);
    [(AXEventKeyInfoRepresentation *)self keyDown];
    if ([(AXEventKeyInfoRepresentation *)self alternativeKeyCode]) {
      int v5 = [(AXEventKeyInfoRepresentation *)self alternativeKeyCode];
    }
    else {
      int v5 = [(AXEventKeyInfoRepresentation *)self keyCode];
    }
    int v6 = v5;
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x2020000000;
    __int16 v52 = 0;
    v49[0] = 0;
    v49[1] = v49;
    v49[2] = 0x2020000000;
    __int16 v50 = 0;
    if (v5)
    {
      uint64_t v45 = 0;
      v46 = &v45;
      uint64_t v47 = 0x2020000000;
      int v48 = 0;
      uint64_t v39 = 0;
      v40 = &v39;
      uint64_t v41 = 0x3032000000;
      v42 = __Block_byref_object_copy__11;
      v43 = __Block_byref_object_dispose__11;
      id v44 = 0;
      uint64_t v33 = 0;
      v34 = &v33;
      uint64_t v35 = 0x3032000000;
      v36 = __Block_byref_object_copy__11;
      v37 = __Block_byref_object_dispose__11;
      id v38 = 0;
      uint64_t v29 = 0;
      v30 = &v29;
      uint64_t v31 = 0x2020000000;
      int v32 = 0;
      uint64_t v25 = 0;
      v26 = &v25;
      uint64_t v27 = 0x2020000000;
      int v28 = 0;
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x3032000000;
      v22 = __Block_byref_object_copy__11;
      v23 = __Block_byref_object_dispose__11;
      id v24 = 0;
      uint64_t v15 = 0;
      v16 = &v15;
      uint64_t v17 = 0x2020000000;
      char v18 = 0;
      AXPerformBlockSynchronouslyOnMainThread();
      if (*((unsigned char *)v16 + 24) && !*((_DWORD *)v46 + 6))
      {
        unsigned __int16 v7 = [NSString stringWithCharacters:v3 + 5 length:v3[4]];
        [(AXEventKeyInfoRepresentation *)self setModifiedInput:v7];

        v8 = [NSString stringWithCharacters:v3 + 30 length:v3[29]];
        [(AXEventKeyInfoRepresentation *)self setUnmodifiedInput:v8];

        [(AXEventKeyInfoRepresentation *)self setShiftModifiedInput:v40[5]];
        v9 = [NSString stringWithCharacters:v4 + 5 length:v4[4]];
        if ([(id)v20[5] length] && *((_DWORD *)v26 + 6) == -1)
        {
          [(AXEventKeyInfoRepresentation *)self setBackupModifiedInput:v9];
          [(AXEventKeyInfoRepresentation *)self setBackupUnmodifiedInput:v20[5]];
          [(AXEventKeyInfoRepresentation *)self setBackupShiftModifiedInput:v34[5]];
        }
        unsigned int v10 = *((_DWORD *)v30 + 6);
        int v11 = (v10 & 0x1010000) != 0;
        if ((v10 & 0x480000) != 0) {
          v11 |= 2u;
        }
        if ((v10 & 0x900000) != 0) {
          v11 |= 4u;
        }
        if ((v10 & 0x220000) != 0) {
          v11 |= 8u;
        }
        unsigned int v12 = v11 | (v10 >> 14) & 0x10;
        if ((v6 - 83) < 0x11 || v6 == 103) {
          v12 |= 0x20u;
        }
        if (_AXSimulatedEventKeyDown) {
          uint64_t v14 = v12 | 0x40;
        }
        else {
          uint64_t v14 = v12;
        }
        [(AXEventKeyInfoRepresentation *)self setModifierState:v14];
        [(AXEventKeyInfoRepresentation *)self setGsModifierState:*((unsigned int *)v30 + 6)];
      }
      _Block_object_dispose(&v15, 8);
      _Block_object_dispose(&v19, 8);

      _Block_object_dispose(&v25, 8);
      _Block_object_dispose(&v29, 8);
      _Block_object_dispose(&v33, 8);

      _Block_object_dispose(&v39, 8);
      _Block_object_dispose(&v45, 8);
    }
    free(v3);
    free(v4);
    _Block_object_dispose(v49, 8);
    _Block_object_dispose(v51, 8);
  }
}

void __48__AXEventKeyInfoRepresentation_translateKeycode__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _getUIKitKeyboardRef];
  uint64_t v3 = [*(id *)(a1 + 32) _getUSUIKitKeyboardRef];
  if (v2) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = GSKeyboardTranslateKeyExtended();
    uint64_t v5 = *(void *)(a1 + 120);
    uint64_t v16 = v5 + 108;
    uint64_t v17 = v5 + 110;
    uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8) + 24;
    GSKeyboardTranslateKeyExtended();
    uint64_t v6 = objc_msgSend(NSString, "stringWithCharacters:length:", v19, *(unsigned __int16 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), v15, v18, v16, v17);
    uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    uint64_t v9 = [NSString stringWithCharacters:v18 length:*(unsigned __int16 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
    uint64_t v10 = *(void *)(*(void *)(a1 + 80) + 8);
    int v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = GSKeyboardGetLiveModifierState();
      uint64_t v12 = [NSString stringWithCharacters:*(void *)(a1 + 120) + 60 length:*(unsigned __int16 *)(*(void *)(a1 + 120) + 58)];
      uint64_t v13 = *(void *)(*(void *)(a1 + 96) + 8);
      uint64_t v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      if ([*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) length])
      {
        [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) characterAtIndex:0];
        *(_DWORD *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = GSKeyboardGetKeyCodeForChar();
      }
    }
  }
}

- (unsigned)keyCode
{
  return self->_keyCode;
}

- (void)setKeyCode:(unsigned __int16)a3
{
  self->_keyCode = a3;
}

- (unsigned)alternativeKeyCode
{
  return self->_alternativeKeyCode;
}

- (void)setAlternativeKeyCode:(unsigned __int16)a3
{
  self->_alternativeKeyCode = a3;
}

- (unsigned)usagePage
{
  return self->_usagePage;
}

- (void)setUsagePage:(unsigned int)a3
{
  self->_usagePage = a3;
}

- (BOOL)keyDown
{
  return self->_keyDown;
}

- (void)setKeyDown:(BOOL)a3
{
  self->_keyDown = a3;
}

- (NSString)unmodifiedInput
{
  return self->_unmodifiedInput;
}

- (void)setUnmodifiedInput:(id)a3
{
}

- (NSString)modifiedInput
{
  return self->_modifiedInput;
}

- (void)setModifiedInput:(id)a3
{
}

- (NSString)shiftModifiedInput
{
  return self->_shiftModifiedInput;
}

- (void)setShiftModifiedInput:(id)a3
{
}

- (unsigned)modifierState
{
  return self->_modifierState;
}

- (void)setModifierState:(unsigned int)a3
{
  self->_modifierState = a3;
}

- (NSString)backupUnmodifiedInput
{
  return self->_backupUnmodifiedInput;
}

- (void)setBackupUnmodifiedInput:(id)a3
{
}

- (NSString)backupModifiedInput
{
  return self->_backupModifiedInput;
}

- (void)setBackupModifiedInput:(id)a3
{
}

- (NSString)backupShiftModifiedInput
{
  return self->_backupShiftModifiedInput;
}

- (void)setBackupShiftModifiedInput:(id)a3
{
}

- (unsigned)gsModifierState
{
  return self->_gsModifierState;
}

- (void)setGsModifierState:(unsigned int)a3
{
  self->_gsModifierState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backupShiftModifiedInput, 0);
  objc_storeStrong((id *)&self->_backupModifiedInput, 0);
  objc_storeStrong((id *)&self->_backupUnmodifiedInput, 0);
  objc_storeStrong((id *)&self->_shiftModifiedInput, 0);
  objc_storeStrong((id *)&self->_modifiedInput, 0);

  objc_storeStrong((id *)&self->_unmodifiedInput, 0);
}

@end