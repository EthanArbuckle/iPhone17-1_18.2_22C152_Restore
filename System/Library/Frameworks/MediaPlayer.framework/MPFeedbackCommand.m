@interface MPFeedbackCommand
- (BOOL)isActive;
- (NSString)localizedShortTitle;
- (NSString)localizedTitle;
- (id)_mediaRemoteCommandInfoOptions;
- (id)newCommandEventWithState:(int64_t)a3;
- (int64_t)presentationStyle;
- (void)setActive:(BOOL)active;
- (void)setLocalizedShortTitle:(NSString *)localizedShortTitle;
- (void)setLocalizedTitle:(NSString *)localizedTitle;
- (void)setPresentationStyle:(int64_t)a3;
@end

@implementation MPFeedbackCommand

- (id)_mediaRemoteCommandInfoOptions
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
  if ([(MPRemoteCommand *)self mediaRemoteCommandType] != 128)
  {
    v4 = [NSNumber numberWithBool:self->_active];
    [v3 setObject:v4 forKey:*MEMORY[0x1E4F77250]];
  }
  localizedTitle = self->_localizedTitle;
  if (localizedTitle) {
    [v3 setObject:localizedTitle forKey:*MEMORY[0x1E4F77268]];
  }
  localizedShortTitle = self->_localizedShortTitle;
  if (localizedShortTitle) {
    [v3 setObject:localizedShortTitle forKey:*MEMORY[0x1E4F77260]];
  }
  if (self->_presentationStyle)
  {
    v7 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v3 setObject:v7 forKey:*MEMORY[0x1E4F772B0]];
  }

  return v3;
}

- (void)setLocalizedTitle:(NSString *)localizedTitle
{
}

- (void)setActive:(BOOL)active
{
  if (self->_active != active)
  {
    self->_active = active;
    [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
  }
}

- (void)setPresentationStyle:(int64_t)a3
{
  if (self->_presentationStyle != a3)
  {
    self->_presentationStyle = a3;
    [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
  }
}

- (void)setLocalizedShortTitle:(NSString *)localizedShortTitle
{
  v6 = localizedShortTitle;
  if (!-[NSString isEqualToString:](self->_localizedShortTitle, "isEqualToString:"))
  {
    v4 = (NSString *)[(NSString *)v6 copy];
    v5 = self->_localizedShortTitle;
    self->_localizedShortTitle = v4;

    [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedShortTitle, 0);

  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

- (NSString)localizedShortTitle
{
  return self->_localizedShortTitle;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (BOOL)isActive
{
  return self->_active;
}

- (id)newCommandEventWithState:(int64_t)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(MPRemoteCommand *)self mediaRemoteCommandType];
  uint64_t v10 = *MEMORY[0x1E4F776C8];
  v6 = [NSNumber numberWithInt:a3 == -1];
  v11[0] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v8 = [(MPRemoteCommand *)self newCommandEventWithCommandType:v5 options:v7];

  return v8;
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

@end