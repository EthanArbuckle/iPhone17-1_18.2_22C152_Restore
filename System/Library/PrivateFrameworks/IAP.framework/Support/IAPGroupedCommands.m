@interface IAPGroupedCommands
- (BOOL)cancelled;
- (BOOL)lineOutChanged;
- (BOOL)lineOutEnabled;
- (BOOL)videoOutSettingChanged;
- (void)setCancelled:(BOOL)a3;
- (void)setLineOutChanged:(BOOL)a3;
- (void)setLineOutEnabled:(BOOL)a3;
- (void)setVideoOutSettingChanged:(BOOL)a3;
@end

@implementation IAPGroupedCommands

- (BOOL)videoOutSettingChanged
{
  unsigned int videoOutSettingsChanged = self->_videoOutSettingsChanged;
  if (videoOutSettingsChanged >= 2) {
    __break(0x550Au);
  }
  else {
    LOBYTE(self) = videoOutSettingsChanged != 0;
  }
  return (char)self;
}

- (void)setVideoOutSettingChanged:(BOOL)a3
{
  self->_unsigned int videoOutSettingsChanged = a3;
}

- (BOOL)lineOutEnabled
{
  unsigned int lineOutEnabled = self->_lineOutEnabled;
  if (lineOutEnabled >= 2) {
    __break(0x550Au);
  }
  else {
    LOBYTE(self) = lineOutEnabled != 0;
  }
  return (char)self;
}

- (void)setLineOutEnabled:(BOOL)a3
{
  self->_unsigned int lineOutEnabled = a3;
}

- (BOOL)lineOutChanged
{
  unsigned int lineOutChanged = self->_lineOutChanged;
  if (lineOutChanged >= 2) {
    __break(0x550Au);
  }
  else {
    LOBYTE(self) = lineOutChanged != 0;
  }
  return (char)self;
}

- (void)setLineOutChanged:(BOOL)a3
{
  self->_unsigned int lineOutChanged = a3;
}

- (BOOL)cancelled
{
  unsigned int cancelled = self->_cancelled;
  if (cancelled >= 2) {
    __break(0x550Au);
  }
  else {
    LOBYTE(self) = cancelled != 0;
  }
  return (char)self;
}

- (void)setCancelled:(BOOL)a3
{
  self->_unsigned int cancelled = a3;
}

@end