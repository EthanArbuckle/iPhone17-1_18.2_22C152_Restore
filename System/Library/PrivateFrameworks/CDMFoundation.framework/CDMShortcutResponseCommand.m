@interface CDMShortcutResponseCommand
- (CDMShortcutResponseCommand)initWithVoiceCommandUserParses:(id)a3 autoShortcutParses:(id)a4;
- (NSArray)autoShortcutParses;
- (NSArray)voiceCommandsUserParses;
@end

@implementation CDMShortcutResponseCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoShortcutParses, 0);
  objc_storeStrong((id *)&self->_voiceCommandsUserParses, 0);
}

- (NSArray)autoShortcutParses
{
  return self->_autoShortcutParses;
}

- (NSArray)voiceCommandsUserParses
{
  return self->_voiceCommandsUserParses;
}

- (CDMShortcutResponseCommand)initWithVoiceCommandUserParses:(id)a3 autoShortcutParses:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDMShortcutResponseCommand;
  v9 = [(CDMBaseCommand *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_voiceCommandsUserParses, a3);
    objc_storeStrong((id *)&v10->_autoShortcutParses, a4);
  }

  return v10;
}

@end