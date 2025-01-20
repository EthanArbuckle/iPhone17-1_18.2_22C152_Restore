@interface IPCMuteSpokenGuidanceMessage
- (BOOL)muteNavigation;
- (IPCMuteSpokenGuidanceMessage)initWithDictionary:(id)a3;
- (id)description;
- (id)dictionaryValue;
- (void)setMuteNavigation:(BOOL)a3;
@end

@implementation IPCMuteSpokenGuidanceMessage

- (IPCMuteSpokenGuidanceMessage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IPCMuteSpokenGuidanceMessage;
  v5 = [(IPCMessageObject *)&v8 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"kIPCMuteSpokenGuidanceMessageMuteNavigationKey"];
    -[IPCMuteSpokenGuidanceMessage setMuteNavigation:](v5, "setMuteNavigation:", [v6 BOOLValue]);
  }
  return v5;
}

- (id)dictionaryValue
{
  v8.receiver = self;
  v8.super_class = (Class)IPCMuteSpokenGuidanceMessage;
  v3 = [(IPCMessageObject *)&v8 dictionaryValue];
  id v4 = [v3 mutableCopy];

  v5 = +[NSNumber numberWithBool:[(IPCMuteSpokenGuidanceMessage *)self muteNavigation]];
  [v4 setObject:v5 forKeyedSubscript:@"kIPCMuteSpokenGuidanceMessageMuteNavigationKey"];

  id v6 = [v4 copy];

  return v6;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)IPCMuteSpokenGuidanceMessage;
  v3 = [(IPCMuteSpokenGuidanceMessage *)&v7 description];
  id v4 = [(IPCMuteSpokenGuidanceMessage *)self dictionaryValue];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)muteNavigation
{
  return self->_muteNavigation;
}

- (void)setMuteNavigation:(BOOL)a3
{
  self->_muteNavigation = a3;
}

@end