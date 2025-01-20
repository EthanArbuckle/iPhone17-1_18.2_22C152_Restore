@interface _LTSELFLoggingTranslateAppContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isGenderAlternativeEnabled;
- (BOOL)isPlayTranslationsEnabled;
- (BOOL)languageIdentificationEnabled;
- (NSUUID)autoTranslateSessionId;
- (NSUUID)tabSessionId;
- (_LTLocalePair)localePair;
- (_LTSELFLoggingTranslateAppContext)initWithCoder:(id)a3;
- (_LTSELFLoggingTranslateAppContext)initWithDisplayMode:(int64_t)a3 localePair:(id)a4 isGenderAlternativeEnabled:(BOOL)a5 tabName:(int64_t)a6 tabSessionId:(id)a7 conversationTabView:(int64_t)a8 isPlayTranslationsEnabled:(BOOL)a9 autoTranslateSessionId:(id)a10 audioChannel:(int64_t)a11 languageIdentificationEnabled:(BOOL)a12;
- (int64_t)audioChannel;
- (int64_t)conversationTabView;
- (int64_t)displayMode;
- (int64_t)tabName;
- (void)encodeWithCoder:(id)a3;
- (void)setAudioChannel:(int64_t)a3;
@end

@implementation _LTSELFLoggingTranslateAppContext

- (_LTSELFLoggingTranslateAppContext)initWithDisplayMode:(int64_t)a3 localePair:(id)a4 isGenderAlternativeEnabled:(BOOL)a5 tabName:(int64_t)a6 tabSessionId:(id)a7 conversationTabView:(int64_t)a8 isPlayTranslationsEnabled:(BOOL)a9 autoTranslateSessionId:(id)a10 audioChannel:(int64_t)a11 languageIdentificationEnabled:(BOOL)a12
{
  id v18 = a4;
  id v19 = a7;
  id v20 = a10;
  v26.receiver = self;
  v26.super_class = (Class)_LTSELFLoggingTranslateAppContext;
  v21 = [(_LTSELFLoggingTranslateAppContext *)&v26 init];
  v22 = v21;
  if (v21)
  {
    v21->_displayMode = a3;
    objc_storeStrong((id *)&v21->_localePair, a4);
    v22->_isGenderAlternativeEnabled = a5;
    v22->_tabName = a6;
    objc_storeStrong((id *)&v22->_tabSessionId, a7);
    v22->_conversationTabView = a8;
    v22->_isPlayTranslationsEnabled = a9;
    objc_storeStrong((id *)&v22->_autoTranslateSessionId, a10);
    v22->_audioChannel = a11;
    v22->_languageIdentificationEnabled = a12;
    v23 = v22;
  }

  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t displayMode = self->_displayMode;
  id v5 = a3;
  [v5 encodeInteger:displayMode forKey:@"displayMode"];
  [v5 encodeObject:self->_localePair forKey:@"localePair"];
  [v5 encodeBool:self->_isGenderAlternativeEnabled forKey:@"isGenderAlternativeEnabled"];
  [v5 encodeInteger:self->_tabName forKey:@"tabName"];
  [v5 encodeObject:self->_tabSessionId forKey:@"tabSessionId"];
  [v5 encodeInteger:self->_conversationTabView forKey:@"conversationTabView"];
  [v5 encodeBool:self->_isPlayTranslationsEnabled forKey:@"isPlayTranslationsEnabled"];
  [v5 encodeObject:self->_autoTranslateSessionId forKey:@"autoTranslateSessionId"];
  [v5 encodeInteger:self->_audioChannel forKey:@"audioChannel"];
  [v5 encodeBool:self->_languageIdentificationEnabled forKey:@"languageIdentificationEnabled"];
}

- (_LTSELFLoggingTranslateAppContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_LTSELFLoggingTranslateAppContext;
  id v5 = [(_LTSELFLoggingTranslateAppContext *)&v14 init];
  if (v5)
  {
    v5->_int64_t displayMode = [v4 decodeIntegerForKey:@"displayMode"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localePair"];
    localePair = v5->_localePair;
    v5->_localePair = (_LTLocalePair *)v6;

    v5->_isGenderAlternativeEnabled = [v4 decodeBoolForKey:@"isGenderAlternativeEnabled"];
    v5->_tabName = [v4 decodeIntegerForKey:@"tabName"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tabSessionId"];
    tabSessionId = v5->_tabSessionId;
    v5->_tabSessionId = (NSUUID *)v8;

    v5->_conversationTabView = [v4 decodeIntegerForKey:@"conversationTabView"];
    v5->_isPlayTranslationsEnabled = [v4 decodeBoolForKey:@"isPlayTranslationsEnabled"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"autoTranslateSessionId"];
    autoTranslateSessionId = v5->_autoTranslateSessionId;
    v5->_autoTranslateSessionId = (NSUUID *)v10;

    v5->_audioChannel = [v4 decodeIntegerForKey:@"audioChannel"];
    v5->_languageIdentificationEnabled = [v4 decodeBoolForKey:@"languageIdentificationEnabled"];
    v12 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)displayMode
{
  return self->_displayMode;
}

- (_LTLocalePair)localePair
{
  return self->_localePair;
}

- (BOOL)isGenderAlternativeEnabled
{
  return self->_isGenderAlternativeEnabled;
}

- (int64_t)tabName
{
  return self->_tabName;
}

- (NSUUID)tabSessionId
{
  return self->_tabSessionId;
}

- (int64_t)conversationTabView
{
  return self->_conversationTabView;
}

- (BOOL)isPlayTranslationsEnabled
{
  return self->_isPlayTranslationsEnabled;
}

- (NSUUID)autoTranslateSessionId
{
  return self->_autoTranslateSessionId;
}

- (int64_t)audioChannel
{
  return self->_audioChannel;
}

- (void)setAudioChannel:(int64_t)a3
{
  self->_audioChannel = a3;
}

- (BOOL)languageIdentificationEnabled
{
  return self->_languageIdentificationEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoTranslateSessionId, 0);
  objc_storeStrong((id *)&self->_tabSessionId, 0);

  objc_storeStrong((id *)&self->_localePair, 0);
}

@end