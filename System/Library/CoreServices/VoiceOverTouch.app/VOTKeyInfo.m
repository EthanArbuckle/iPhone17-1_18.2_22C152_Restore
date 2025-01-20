@interface VOTKeyInfo
- (AXEventRepresentation)eventRecord;
- (BOOL)isAppleVendorKey;
- (BOOL)isArrowKey;
- (BOOL)isBrightnessKey;
- (BOOL)isCapsLockKeyDown;
- (BOOL)isCapsLockKeyToggledOn;
- (BOOL)isCapsLockKeyUp;
- (BOOL)isCommandKeyPressed;
- (BOOL)isControlKeyPressed;
- (BOOL)isEscapeKey;
- (BOOL)isFNKey;
- (BOOL)isFNKeyPressed;
- (BOOL)isKeyboardSelectKey;
- (BOOL)isMediaKey;
- (BOOL)isOptionKeyPressed;
- (BOOL)isShiftKeyPressed;
- (BOOL)keyDown;
- (BOOL)keyUp;
- (BOOL)modifiersChanged;
- (NSString)characters;
- (NSString)originalCharacters;
- (VOTKeyInfo)initWithEventRepresentation:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)mediaKeyCode;
- (int64_t)eventOrigin;
- (unsigned)changedModifiers;
- (unsigned)keyCode;
- (unsigned)modifierState;
- (void)_setCommandKeyPressed:(BOOL)a3;
- (void)setChangedModifiers:(unsigned int)a3;
- (void)setCharacters:(id)a3;
- (void)setEventOrigin:(int64_t)a3;
- (void)setEventRecord:(id)a3;
- (void)setKeyCode:(unsigned __int16)a3;
- (void)setKeyDown:(BOOL)a3;
- (void)setKeyUp:(BOOL)a3;
- (void)setModifiersChanged:(BOOL)a3;
- (void)setOriginalCharacters:(id)a3;
@end

@implementation VOTKeyInfo

- (VOTKeyInfo)initWithEventRepresentation:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VOTKeyInfo;
  v5 = [(VOTKeyInfo *)&v13 init];
  v6 = v5;
  v7 = 0;
  if (v4 && v5)
  {
    v8 = [v4 keyInfo];
    v9 = v8;
    if (v8)
    {
      v10 = [v8 modifiedInput];
      if (v10)
      {
      }
      else if ([v9 keyCode])
      {
        [(id)VOTSharedWorkspace loadUIKit];
        [v9 translateKeycode];
      }
    }
    [(VOTKeyInfo *)v6 setEventRecord:v4];
    *(unsigned char *)&v6->_flags = *(unsigned char *)&v6->_flags & 0xFE | [v9 keyDown];
    if ([v9 keyDown]) {
      char v11 = 0;
    }
    else {
      char v11 = 2;
    }
    *(unsigned char *)&v6->_flags = *(unsigned char *)&v6->_flags & 0xFD | v11;
    v7 = v6;
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [(VOTKeyInfo *)self eventRecord];
  id v6 = [v5 copyWithZone:a3];

  v7 = objc_alloc_init(VOTKeyInfo);
  [(VOTKeyInfo *)v7 setEventRecord:v6];
  [(VOTKeyInfo *)v7 setKeyDown:[(VOTKeyInfo *)self keyDown]];
  [(VOTKeyInfo *)v7 setKeyUp:[(VOTKeyInfo *)self keyUp]];
  [(VOTKeyInfo *)v7 setChangedModifiers:[(VOTKeyInfo *)self changedModifiers]];

  return v7;
}

- (unsigned)modifierState
{
  v2 = [(AXEventRepresentation *)self->_eventRecord keyInfo];
  unsigned int v3 = [v2 modifierState];

  return v3;
}

- (NSString)characters
{
  v2 = [(AXEventRepresentation *)self->_eventRecord keyInfo];
  unsigned int v3 = [v2 modifiedInput];

  return (NSString *)v3;
}

- (NSString)originalCharacters
{
  v2 = [(AXEventRepresentation *)self->_eventRecord keyInfo];
  unsigned int v3 = [v2 unmodifiedInput];

  return (NSString *)v3;
}

- (BOOL)modifiersChanged
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (void)setModifiersChanged:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)keyDown
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)setKeyDown:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)keyUp
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)setKeyUp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (unsigned)keyCode
{
  v2 = [(VOTKeyInfo *)self eventRecord];
  char v3 = [v2 keyInfo];
  unsigned __int16 v4 = (unsigned __int16)[v3 keyCode];

  return v4;
}

- (void)setKeyCode:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v5 = [(VOTKeyInfo *)self eventRecord];
  unsigned __int16 v4 = [v5 keyInfo];
  [v4 setKeyCode:v3];
}

- (BOOL)isFNKey
{
  return [(VOTKeyInfo *)self keyCode] == 48
      || [(AXEventRepresentation *)self->_eventRecord type] == 4500
      || [(AXEventRepresentation *)self->_eventRecord type] == 4501;
}

- (BOOL)isFNKeyPressed
{
  return ([(VOTKeyInfo *)self modifierState] >> 6) & 1;
}

- (BOOL)isShiftKeyPressed
{
  return ([(VOTKeyInfo *)self modifierState] >> 3) & 1;
}

- (BOOL)isCommandKeyPressed
{
  return [(VOTKeyInfo *)self modifierState] & 1;
}

- (BOOL)isOptionKeyPressed
{
  return ([(VOTKeyInfo *)self modifierState] >> 1) & 1;
}

- (BOOL)isControlKeyPressed
{
  return ([(VOTKeyInfo *)self modifierState] >> 2) & 1;
}

- (BOOL)isCapsLockKeyToggledOn
{
  return ([(VOTKeyInfo *)self modifierState] >> 4) & 1;
}

- (BOOL)isCapsLockKeyDown
{
  if ([(VOTKeyInfo *)self keyCode] != 57) {
    return 0;
  }

  return [(VOTKeyInfo *)self keyDown];
}

- (BOOL)isCapsLockKeyUp
{
  if ([(VOTKeyInfo *)self keyCode] != 57) {
    return 0;
  }

  return [(VOTKeyInfo *)self keyUp];
}

- (BOOL)isKeyboardSelectKey
{
  return [(AXEventRepresentation *)self->_eventRecord type] == 4501
      || [(AXEventRepresentation *)self->_eventRecord type] == 4500;
}

- (int)mediaKeyCode
{
  int result = [(VOTKeyInfo *)self isMediaKey];
  if (result)
  {
    eventRecord = self->_eventRecord;
    return [(AXEventRepresentation *)eventRecord subtype];
  }
  return result;
}

- (BOOL)isArrowKey
{
  return [(VOTKeyInfo *)self keyCode] - 79 < 4;
}

- (BOOL)isMediaKey
{
  return [(AXEventRepresentation *)self->_eventRecord type] == 1023;
}

- (BOOL)isAppleVendorKey
{
  return 0;
}

- (BOOL)isBrightnessKey
{
  BOOL v3 = [(VOTKeyInfo *)self isAppleVendorKey];
  if (v3) {
    LOBYTE(v3) = ([(AXEventRepresentation *)self->_eventRecord subtype] & 0xFFFFFFFE) == 32;
  }
  return v3;
}

- (BOOL)isEscapeKey
{
  return [(VOTKeyInfo *)self keyCode] == 41;
}

- (id)description
{
  BOOL v3 = [(AXEventRepresentation *)self->_eventRecord keyInfo];
  if ([(VOTKeyInfo *)self isAppleVendorKey])
  {
    unsigned __int16 v4 = +[NSString stringWithFormat:@"Apple Vender KeyDown: code: %i", [(VOTKeyInfo *)self mediaKeyCode]];
  }
  else
  {
    if ([(AXEventRepresentation *)self->_eventRecord type] == 10)
    {
      CFStringRef v5 = @"Key down";
    }
    else
    {
      unsigned int v6 = [(AXEventRepresentation *)self->_eventRecord type];
      CFStringRef v5 = @"Flags changed";
      if (v6 == 11) {
        CFStringRef v5 = @"Key up";
      }
    }
    CFStringRef v11 = v5;
    unsigned int v10 = [v3 keyCode];
    v7 = [v3 modifiedInput];
    v8 = [v3 unmodifiedInput];
    unsigned __int16 v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: code: %u (MODIFIED: %@ : UNMODIFIED: %@), flags: %d, shift: %d, control: %d, option: %d, command: %d, fn: %d", v11, v10, v7, v8, [v3 modifierState], -[VOTKeyInfo isShiftKeyPressed](self, "isShiftKeyPressed"), -[VOTKeyInfo isControlKeyPressed](self, "isControlKeyPressed"), -[VOTKeyInfo isOptionKeyPressed](self, "isOptionKeyPressed"), -[VOTKeyInfo isCommandKeyPressed](self, "isCommandKeyPressed"), -[VOTKeyInfo isFNKeyPressed](self, "isFNKeyPressed"));
  }

  return v4;
}

- (AXEventRepresentation)eventRecord
{
  return self->_eventRecord;
}

- (void)setEventRecord:(id)a3
{
}

- (void)setCharacters:(id)a3
{
}

- (void)setOriginalCharacters:(id)a3
{
}

- (int64_t)eventOrigin
{
  return self->_eventOrigin;
}

- (void)setEventOrigin:(int64_t)a3
{
  self->_eventOrigin = a3;
}

- (unsigned)changedModifiers
{
  return self->_changedModifiers;
}

- (void)setChangedModifiers:(unsigned int)a3
{
  self->_changedModifiers = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalCharacters, 0);
  objc_storeStrong((id *)&self->_characters, 0);

  objc_storeStrong((id *)&self->_eventRecord, 0);
}

- (void)_setCommandKeyPressed:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AXEventRepresentation *)self->_eventRecord keyInfo];
  objc_msgSend(v4, "setModifierState:", objc_msgSend(v4, "modifierState") & 0xFFFFFFFE | v3);
}

@end