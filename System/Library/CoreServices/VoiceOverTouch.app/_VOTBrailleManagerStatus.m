@interface _VOTBrailleManagerStatus
- (BOOL)bluetoothBrailleDisplayConnected;
- (BOOL)realtimeBlinkIsUp;
- (BOOL)realtimeBlinking;
- (BOOL)showGeneral;
- (BOOL)showRealtime;
- (BOOL)showText;
- (NSMutableDictionary)generalDict;
- (NSMutableDictionary)textDict;
- (unint64_t)realtimeSpinnerCount;
- (unsigned)general;
- (unsigned)realtime;
- (unsigned)text;
- (void)setBluetoothBrailleDisplayConnected:(BOOL)a3;
- (void)setGeneral:(unsigned __int8)a3;
- (void)setGeneralDict:(id)a3;
- (void)setRealtime:(unsigned __int8)a3;
- (void)setRealtimeBlinkIsUp:(BOOL)a3;
- (void)setRealtimeBlinking:(BOOL)a3;
- (void)setRealtimeSpinnerCount:(unint64_t)a3;
- (void)setShowGeneral:(BOOL)a3;
- (void)setShowRealtime:(BOOL)a3;
- (void)setShowText:(BOOL)a3;
- (void)setText:(unsigned __int8)a3;
- (void)setTextDict:(id)a3;
@end

@implementation _VOTBrailleManagerStatus

- (unsigned)general
{
  return self->_general;
}

- (void)setGeneral:(unsigned __int8)a3
{
  self->_general = a3;
}

- (unsigned)text
{
  return self->_text;
}

- (void)setText:(unsigned __int8)a3
{
  self->_text = a3;
}

- (unsigned)realtime
{
  return self->_realtime;
}

- (void)setRealtime:(unsigned __int8)a3
{
  self->_realtime = a3;
}

- (BOOL)showGeneral
{
  return self->_showGeneral;
}

- (void)setShowGeneral:(BOOL)a3
{
  self->_showGeneral = a3;
}

- (BOOL)showText
{
  return self->_showText;
}

- (void)setShowText:(BOOL)a3
{
  self->_showText = a3;
}

- (BOOL)showRealtime
{
  return self->_showRealtime;
}

- (void)setShowRealtime:(BOOL)a3
{
  self->_showRealtime = a3;
}

- (BOOL)realtimeBlinking
{
  return self->_realtimeBlinking;
}

- (void)setRealtimeBlinking:(BOOL)a3
{
  self->_realtimeBlinking = a3;
}

- (BOOL)realtimeBlinkIsUp
{
  return self->_realtimeBlinkIsUp;
}

- (void)setRealtimeBlinkIsUp:(BOOL)a3
{
  self->_realtimeBlinkIsUp = a3;
}

- (unint64_t)realtimeSpinnerCount
{
  return self->_realtimeSpinnerCount;
}

- (void)setRealtimeSpinnerCount:(unint64_t)a3
{
  self->_realtimeSpinnerCount = a3;
}

- (NSMutableDictionary)generalDict
{
  return self->_generalDict;
}

- (void)setGeneralDict:(id)a3
{
}

- (NSMutableDictionary)textDict
{
  return self->_textDict;
}

- (void)setTextDict:(id)a3
{
}

- (BOOL)bluetoothBrailleDisplayConnected
{
  return self->_bluetoothBrailleDisplayConnected;
}

- (void)setBluetoothBrailleDisplayConnected:(BOOL)a3
{
  self->_bluetoothBrailleDisplayConnected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textDict, 0);

  objc_storeStrong((id *)&self->_generalDict, 0);
}

@end