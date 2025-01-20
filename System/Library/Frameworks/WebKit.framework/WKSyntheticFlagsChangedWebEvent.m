@interface WKSyntheticFlagsChangedWebEvent
- (WKSyntheticFlagsChangedWebEvent)initWithCapsLockState:(BOOL)a3;
- (WKSyntheticFlagsChangedWebEvent)initWithKeyCode:(unsigned __int16)a3 modifiers:(unsigned int)a4 keyDown:(BOOL)a5;
- (WKSyntheticFlagsChangedWebEvent)initWithShiftState:(BOOL)a3;
@end

@implementation WKSyntheticFlagsChangedWebEvent

- (WKSyntheticFlagsChangedWebEvent)initWithKeyCode:(unsigned __int16)a3 modifiers:(unsigned int)a4 keyDown:(BOOL)a5
{
  uint64_t v5 = *(void *)&a4;
  int v6 = a3;
  if (a5) {
    uint64_t v8 = 4;
  }
  else {
    uint64_t v8 = 5;
  }
  double v9 = (double)(unint64_t)GSCurrentEventTimestamp();
  v12.receiver = self;
  v12.super_class = (Class)WKSyntheticFlagsChangedWebEvent;
  BYTE2(v11) = v6 == 43;
  LOWORD(v11) = v6;
  return -[WebEvent initWithKeyEventType:timeStamp:characters:charactersIgnoringModifiers:modifiers:isRepeating:withFlags:withInputManagerHint:keyCode:isTabKey:](&v12, sel_initWithKeyEventType_timeStamp_characters_charactersIgnoringModifiers_modifiers_isRepeating_withFlags_withInputManagerHint_keyCode_isTabKey_, v8, &stru_1EEA10550, &stru_1EEA10550, v5, 0, 32, v9, 0, v11);
}

- (WKSyntheticFlagsChangedWebEvent)initWithCapsLockState:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 0x40000;
  }
  else {
    uint64_t v3 = 0;
  }
  return [(WKSyntheticFlagsChangedWebEvent *)self initWithKeyCode:57 modifiers:v3 keyDown:a3];
}

- (WKSyntheticFlagsChangedWebEvent)initWithShiftState:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 0x20000;
  }
  else {
    uint64_t v3 = 0;
  }
  return [(WKSyntheticFlagsChangedWebEvent *)self initWithKeyCode:225 modifiers:v3 keyDown:a3];
}

@end