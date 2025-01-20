@interface AXSSKeyboardEvent
- (AXSSKeyChord)backupKeyChord;
- (AXSSKeyChord)keyChord;
- (BOOL)isCapsLockDown;
- (BOOL)isCommandDown;
- (BOOL)isControlDown;
- (BOOL)isDownEvent;
- (BOOL)isFnDown;
- (BOOL)isLeftCommandDown;
- (BOOL)isLeftControlDown;
- (BOOL)isLeftOptionDown;
- (BOOL)isLeftShiftDown;
- (BOOL)isModifierChangedEvent;
- (BOOL)isOptionDown;
- (BOOL)isRepeatEvent;
- (BOOL)isRightCommandDown;
- (BOOL)isRightControlDown;
- (BOOL)isRightOptionDown;
- (BOOL)isRightShiftDown;
- (BOOL)isShiftDown;
- (NSString)backupUnicodeCharacter;
- (NSString)unicodeCharacter;
- (id)_keyChordForUnicodeCharacter:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)modifierMask;
- (unint64_t)keyCode;
- (void)setBackupUnicodeCharacter:(id)a3;
- (void)setIsCapsLockDown:(BOOL)a3;
- (void)setIsDownEvent:(BOOL)a3;
- (void)setIsFnDown:(BOOL)a3;
- (void)setIsLeftCommandDown:(BOOL)a3;
- (void)setIsLeftControlDown:(BOOL)a3;
- (void)setIsLeftOptionDown:(BOOL)a3;
- (void)setIsLeftShiftDown:(BOOL)a3;
- (void)setIsModifierChangedEvent:(BOOL)a3;
- (void)setIsRepeatEvent:(BOOL)a3;
- (void)setIsRightCommandDown:(BOOL)a3;
- (void)setIsRightControlDown:(BOOL)a3;
- (void)setIsRightOptionDown:(BOOL)a3;
- (void)setIsRightShiftDown:(BOOL)a3;
- (void)setKeyCode:(unint64_t)a3;
- (void)setUnicodeCharacter:(id)a3;
@end

@implementation AXSSKeyboardEvent

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  v4 = objc_opt_new();
  objc_msgSend(v4, "setKeyCode:", -[AXSSKeyboardEvent keyCode](self, "keyCode"));
  v5 = [(AXSSKeyboardEvent *)self unicodeCharacter];
  [v4 setUnicodeCharacter:v5];

  v6 = [(AXSSKeyboardEvent *)self backupUnicodeCharacter];
  [v4 setBackupUnicodeCharacter:v6];

  objc_msgSend(v4, "setIsDownEvent:", -[AXSSKeyboardEvent isDownEvent](self, "isDownEvent"));
  objc_msgSend(v4, "setIsRepeatEvent:", -[AXSSKeyboardEvent isRepeatEvent](self, "isRepeatEvent"));
  objc_msgSend(v4, "setIsModifierChangedEvent:", -[AXSSKeyboardEvent isModifierChangedEvent](self, "isModifierChangedEvent"));
  objc_msgSend(v4, "setIsLeftCommandDown:", -[AXSSKeyboardEvent isLeftCommandDown](self, "isLeftCommandDown"));
  objc_msgSend(v4, "setIsRightCommandDown:", -[AXSSKeyboardEvent isRightCommandDown](self, "isRightCommandDown"));
  objc_msgSend(v4, "setIsLeftOptionDown:", -[AXSSKeyboardEvent isLeftOptionDown](self, "isLeftOptionDown"));
  objc_msgSend(v4, "setIsRightOptionDown:", -[AXSSKeyboardEvent isRightOptionDown](self, "isRightOptionDown"));
  objc_msgSend(v4, "setIsLeftShiftDown:", -[AXSSKeyboardEvent isLeftShiftDown](self, "isLeftShiftDown"));
  objc_msgSend(v4, "setIsRightShiftDown:", -[AXSSKeyboardEvent isRightShiftDown](self, "isRightShiftDown"));
  objc_msgSend(v4, "setIsFnDown:", -[AXSSKeyboardEvent isFnDown](self, "isFnDown"));
  objc_msgSend(v4, "setIsCapsLockDown:", -[AXSSKeyboardEvent isCapsLockDown](self, "isCapsLockDown"));
  return v4;
}

- (BOOL)isCommandDown
{
  if ([(AXSSKeyboardEvent *)self isLeftCommandDown]) {
    return 1;
  }

  return [(AXSSKeyboardEvent *)self isRightCommandDown];
}

- (BOOL)isOptionDown
{
  if ([(AXSSKeyboardEvent *)self isLeftOptionDown]) {
    return 1;
  }

  return [(AXSSKeyboardEvent *)self isRightOptionDown];
}

- (BOOL)isControlDown
{
  if ([(AXSSKeyboardEvent *)self isLeftControlDown]) {
    return 1;
  }

  return [(AXSSKeyboardEvent *)self isRightControlDown];
}

- (BOOL)isShiftDown
{
  if ([(AXSSKeyboardEvent *)self isLeftShiftDown]) {
    return 1;
  }

  return [(AXSSKeyboardEvent *)self isRightShiftDown];
}

- (int64_t)modifierMask
{
  int64_t v3 = [(AXSSKeyboardEvent *)self isCommandDown];
  if ([(AXSSKeyboardEvent *)self isOptionDown]) {
    v3 |= 2uLL;
  }
  if ([(AXSSKeyboardEvent *)self isControlDown]) {
    v3 |= 4uLL;
  }
  if ([(AXSSKeyboardEvent *)self isShiftDown]) {
    v3 |= 8uLL;
  }
  if ([(AXSSKeyboardEvent *)self isFnDown]) {
    v3 |= 0x10uLL;
  }
  if ([(AXSSKeyboardEvent *)self isCapsLockDown]) {
    return v3 | 0x20;
  }
  else {
    return v3;
  }
}

- (id)_keyChordForUnicodeCharacter:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  v6 = [v4 array];
  if ([(AXSSKeyboardEvent *)self isCommandDown]) {
    [v6 addObject:@"⌘"];
  }
  if ([(AXSSKeyboardEvent *)self isControlDown]) {
    [v6 addObject:@"⌃"];
  }
  if ([(AXSSKeyboardEvent *)self isOptionDown]) {
    [v6 addObject:@"⌥"];
  }
  if ([(AXSSKeyboardEvent *)self isShiftDown]) {
    [v6 addObject:@"⇧"];
  }
  if ([(AXSSKeyboardEvent *)self isFnDown]) {
    [v6 addObject:@"Fn"];
  }
  if ([(AXSSKeyboardEvent *)self isCapsLockDown]) {
    [v6 addObject:@"⇪"];
  }
  v7 = +[AXSSKeyChord keyFromKeyCode:[(AXSSKeyboardEvent *)self keyCode] unicodeCharacter:v5];

  if (v7)
  {
    [v6 addObject:v7];
    v8 = +[AXSSKeyChord keyChordWithKeys:v6];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (AXSSKeyChord)keyChord
{
  int64_t v3 = [(AXSSKeyboardEvent *)self unicodeCharacter];
  v4 = [(AXSSKeyboardEvent *)self _keyChordForUnicodeCharacter:v3];

  return (AXSSKeyChord *)v4;
}

- (AXSSKeyChord)backupKeyChord
{
  int64_t v3 = [(AXSSKeyboardEvent *)self backupUnicodeCharacter];
  v4 = [(AXSSKeyboardEvent *)self _keyChordForUnicodeCharacter:v3];

  return (AXSSKeyChord *)v4;
}

- (id)description
{
  v23 = NSString;
  v24.receiver = self;
  v24.super_class = (Class)AXSSKeyboardEvent;
  v22 = [(AXSSKeyboardEvent *)&v24 description];
  unint64_t v21 = [(AXSSKeyboardEvent *)self keyCode];
  BOOL v20 = [(AXSSKeyboardEvent *)self isDownEvent];
  BOOL v19 = [(AXSSKeyboardEvent *)self isRepeatEvent];
  BOOL v18 = [(AXSSKeyboardEvent *)self isModifierChangedEvent];
  BOOL v17 = [(AXSSKeyboardEvent *)self isCommandDown];
  BOOL v16 = [(AXSSKeyboardEvent *)self isLeftCommandDown];
  BOOL v15 = [(AXSSKeyboardEvent *)self isRightCommandDown];
  BOOL v3 = [(AXSSKeyboardEvent *)self isOptionDown];
  BOOL v4 = [(AXSSKeyboardEvent *)self isLeftOptionDown];
  BOOL v5 = [(AXSSKeyboardEvent *)self isRightOptionDown];
  BOOL v6 = [(AXSSKeyboardEvent *)self isControlDown];
  BOOL v7 = [(AXSSKeyboardEvent *)self isShiftDown];
  BOOL v8 = [(AXSSKeyboardEvent *)self isLeftShiftDown];
  BOOL v9 = [(AXSSKeyboardEvent *)self isRightShiftDown];
  BOOL v10 = [(AXSSKeyboardEvent *)self isFnDown];
  BOOL v11 = [(AXSSKeyboardEvent *)self isCapsLockDown];
  v12 = [(AXSSKeyboardEvent *)self unicodeCharacter];
  objc_msgSend(v23, "stringWithFormat:", @"<%@: keyCode=%lu isDownEvent=%d isRepeatEvent=%d isModifierChangedEvent=%d isCommandDown=%d isLeftCommandDown=%d isRightCommandDown=%d isOptionDown=%d isLeftOptionDown=%d isRightOptionDown=%d isControlDown=%d isShiftDown=%d isLeftShiftDown=%d isRightShiftDown=%d isFnDown=%d isCapsLockDown=%d unicodeCharacter=%@", v22, v21, v20, v19, v18, v17, v16, v15, v3, v4, v5, v6, v7, v8, v9, v10,
    v11,
  v13 = v12);

  return v13;
}

- (unint64_t)keyCode
{
  return self->_keyCode;
}

- (void)setKeyCode:(unint64_t)a3
{
  self->_keyCode = a3;
}

- (NSString)unicodeCharacter
{
  return self->_unicodeCharacter;
}

- (void)setUnicodeCharacter:(id)a3
{
}

- (NSString)backupUnicodeCharacter
{
  return self->_backupUnicodeCharacter;
}

- (void)setBackupUnicodeCharacter:(id)a3
{
}

- (BOOL)isDownEvent
{
  return self->_isDownEvent;
}

- (void)setIsDownEvent:(BOOL)a3
{
  self->_isDownEvent = a3;
}

- (BOOL)isRepeatEvent
{
  return self->_isRepeatEvent;
}

- (void)setIsRepeatEvent:(BOOL)a3
{
  self->_isRepeatEvent = a3;
}

- (BOOL)isModifierChangedEvent
{
  return self->_isModifierChangedEvent;
}

- (void)setIsModifierChangedEvent:(BOOL)a3
{
  self->_isModifierChangedEvent = a3;
}

- (BOOL)isLeftCommandDown
{
  return self->_isLeftCommandDown;
}

- (void)setIsLeftCommandDown:(BOOL)a3
{
  self->_isLeftCommandDown = a3;
}

- (BOOL)isRightCommandDown
{
  return self->_isRightCommandDown;
}

- (void)setIsRightCommandDown:(BOOL)a3
{
  self->_isRightCommandDown = a3;
}

- (BOOL)isLeftOptionDown
{
  return self->_isLeftOptionDown;
}

- (void)setIsLeftOptionDown:(BOOL)a3
{
  self->_isLeftOptionDown = a3;
}

- (BOOL)isRightOptionDown
{
  return self->_isRightOptionDown;
}

- (void)setIsRightOptionDown:(BOOL)a3
{
  self->_isRightOptionDown = a3;
}

- (BOOL)isLeftControlDown
{
  return self->_isLeftControlDown;
}

- (void)setIsLeftControlDown:(BOOL)a3
{
  self->_isLeftControlDown = a3;
}

- (BOOL)isRightControlDown
{
  return self->_isRightControlDown;
}

- (void)setIsRightControlDown:(BOOL)a3
{
  self->_isRightControlDown = a3;
}

- (BOOL)isLeftShiftDown
{
  return self->_isLeftShiftDown;
}

- (void)setIsLeftShiftDown:(BOOL)a3
{
  self->_isLeftShiftDown = a3;
}

- (BOOL)isRightShiftDown
{
  return self->_isRightShiftDown;
}

- (void)setIsRightShiftDown:(BOOL)a3
{
  self->_isRightShiftDown = a3;
}

- (BOOL)isCapsLockDown
{
  return self->_isCapsLockDown;
}

- (void)setIsCapsLockDown:(BOOL)a3
{
  self->_isCapsLockDown = a3;
}

- (BOOL)isFnDown
{
  return self->_isFnDown;
}

- (void)setIsFnDown:(BOOL)a3
{
  self->_isFnDown = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backupUnicodeCharacter, 0);

  objc_storeStrong((id *)&self->_unicodeCharacter, 0);
}

@end