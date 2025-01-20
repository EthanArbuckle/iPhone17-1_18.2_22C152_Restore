@interface MCSingleAppModeConfiguration
- (BOOL)allowAccessibilitySpeech;
- (BOOL)allowActivityContinuation;
- (BOOL)allowAutoCorrection;
- (BOOL)allowContinuousPathKeyboard;
- (BOOL)allowDefinitionLookup;
- (BOOL)allowDictation;
- (BOOL)allowKeyboardShortcuts;
- (BOOL)allowPasswordAutoFill;
- (BOOL)allowPredictiveKeyboard;
- (BOOL)allowQuickNote;
- (BOOL)allowScreenShot;
- (BOOL)allowSelectedTextSharing;
- (BOOL)allowSmartPunctuation;
- (BOOL)allowSmartPuncutation;
- (BOOL)allowSpellCheck;
- (BOOL)allowTranslationLookup;
- (id)serializedConfiguration;
- (void)setAllowAccessibilitySpeech:(BOOL)a3;
- (void)setAllowActivityContinuation:(BOOL)a3;
- (void)setAllowAutoCorrection:(BOOL)a3;
- (void)setAllowContinuousPathKeyboard:(BOOL)a3;
- (void)setAllowDefinitionLookup:(BOOL)a3;
- (void)setAllowDictation:(BOOL)a3;
- (void)setAllowKeyboardShortcuts:(BOOL)a3;
- (void)setAllowPasswordAutoFill:(BOOL)a3;
- (void)setAllowPredictiveKeyboard:(BOOL)a3;
- (void)setAllowQuickNote:(BOOL)a3;
- (void)setAllowScreenShot:(BOOL)a3;
- (void)setAllowSelectedTextSharing:(BOOL)a3;
- (void)setAllowSmartPunctuation:(BOOL)a3;
- (void)setAllowSmartPuncutation:(BOOL)a3;
- (void)setAllowSpellCheck:(BOOL)a3;
- (void)setAllowTranslationLookup:(BOOL)a3;
@end

@implementation MCSingleAppModeConfiguration

- (id)serializedConfiguration
{
  v3 = objc_opt_new();
  v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MCSingleAppModeConfiguration allowSpellCheck](self, "allowSpellCheck"));
  [v3 setObject:v4 forKeyedSubscript:@"allowSpellCheck"];

  v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MCSingleAppModeConfiguration allowDefinitionLookup](self, "allowDefinitionLookup"));
  [v3 setObject:v5 forKeyedSubscript:@"allowDefinitionLookup"];

  v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MCSingleAppModeConfiguration allowSelectedTextSharing](self, "allowSelectedTextSharing"));
  [v3 setObject:v6 forKeyedSubscript:@"allowSelectedTextSharing"];

  v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MCSingleAppModeConfiguration allowAutoCorrection](self, "allowAutoCorrection"));
  [v3 setObject:v7 forKeyedSubscript:@"allowAutoCorrection"];

  v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MCSingleAppModeConfiguration allowPredictiveKeyboard](self, "allowPredictiveKeyboard"));
  [v3 setObject:v8 forKeyedSubscript:@"allowPredictiveKeyboard"];

  v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MCSingleAppModeConfiguration allowKeyboardShortcuts](self, "allowKeyboardShortcuts"));
  [v3 setObject:v9 forKeyedSubscript:@"allowKeyboardShortcuts"];

  v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MCSingleAppModeConfiguration allowActivityContinuation](self, "allowActivityContinuation"));
  [v3 setObject:v10 forKeyedSubscript:@"allowActivityContinuation"];

  v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MCSingleAppModeConfiguration allowDictation](self, "allowDictation"));
  [v3 setObject:v11 forKeyedSubscript:@"allowDictation"];

  v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MCSingleAppModeConfiguration allowScreenShot](self, "allowScreenShot"));
  [v3 setObject:v12 forKeyedSubscript:@"allowScreenShot"];

  v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MCSingleAppModeConfiguration allowSmartPunctuation](self, "allowSmartPunctuation"));
  [v3 setObject:v13 forKeyedSubscript:@"allowSmartPunctuation"];

  v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MCSingleAppModeConfiguration allowAccessibilitySpeech](self, "allowAccessibilitySpeech"));
  [v3 setObject:v14 forKeyedSubscript:@"allowAccessibilitySpeech"];

  v15 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MCSingleAppModeConfiguration allowPasswordAutoFill](self, "allowPasswordAutoFill"));
  [v3 setObject:v15 forKeyedSubscript:@"allowPasswordAutoFill"];

  v16 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MCSingleAppModeConfiguration allowContinuousPathKeyboard](self, "allowContinuousPathKeyboard"));
  [v3 setObject:v16 forKeyedSubscript:@"allowContinuousPathKeyboard"];

  v17 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MCSingleAppModeConfiguration allowTranslationLookup](self, "allowTranslationLookup"));
  [v3 setObject:v17 forKeyedSubscript:@"allowTranslationLookup"];

  v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MCSingleAppModeConfiguration allowQuickNote](self, "allowQuickNote"));
  [v3 setObject:v18 forKeyedSubscript:@"allowQuickNote"];

  return v3;
}

- (BOOL)allowSmartPuncutation
{
  return self->_allowSmartPunctuation;
}

- (void)setAllowSmartPuncutation:(BOOL)a3
{
  self->_allowSmartPunctuation = a3;
}

- (BOOL)allowSpellCheck
{
  return self->_allowSpellCheck;
}

- (void)setAllowSpellCheck:(BOOL)a3
{
  self->_allowSpellCheck = a3;
}

- (BOOL)allowDefinitionLookup
{
  return self->_allowDefinitionLookup;
}

- (void)setAllowDefinitionLookup:(BOOL)a3
{
  self->_allowDefinitionLookup = a3;
}

- (BOOL)allowSelectedTextSharing
{
  return self->_allowSelectedTextSharing;
}

- (void)setAllowSelectedTextSharing:(BOOL)a3
{
  self->_allowSelectedTextSharing = a3;
}

- (BOOL)allowAutoCorrection
{
  return self->_allowAutoCorrection;
}

- (void)setAllowAutoCorrection:(BOOL)a3
{
  self->_allowAutoCorrection = a3;
}

- (BOOL)allowPredictiveKeyboard
{
  return self->_allowPredictiveKeyboard;
}

- (void)setAllowPredictiveKeyboard:(BOOL)a3
{
  self->_allowPredictiveKeyboard = a3;
}

- (BOOL)allowKeyboardShortcuts
{
  return self->_allowKeyboardShortcuts;
}

- (void)setAllowKeyboardShortcuts:(BOOL)a3
{
  self->_allowKeyboardShortcuts = a3;
}

- (BOOL)allowActivityContinuation
{
  return self->_allowActivityContinuation;
}

- (void)setAllowActivityContinuation:(BOOL)a3
{
  self->_allowActivityContinuation = a3;
}

- (BOOL)allowDictation
{
  return self->_allowDictation;
}

- (void)setAllowDictation:(BOOL)a3
{
  self->_allowDictation = a3;
}

- (BOOL)allowScreenShot
{
  return self->_allowScreenShot;
}

- (void)setAllowScreenShot:(BOOL)a3
{
  self->_allowScreenShot = a3;
}

- (BOOL)allowSmartPunctuation
{
  return self->_allowSmartPunctuation;
}

- (void)setAllowSmartPunctuation:(BOOL)a3
{
  self->_allowSmartPunctuation = a3;
}

- (BOOL)allowAccessibilitySpeech
{
  return self->_allowAccessibilitySpeech;
}

- (void)setAllowAccessibilitySpeech:(BOOL)a3
{
  self->_allowAccessibilitySpeech = a3;
}

- (BOOL)allowPasswordAutoFill
{
  return self->_allowPasswordAutoFill;
}

- (void)setAllowPasswordAutoFill:(BOOL)a3
{
  self->_allowPasswordAutoFill = a3;
}

- (BOOL)allowContinuousPathKeyboard
{
  return self->_allowContinuousPathKeyboard;
}

- (void)setAllowContinuousPathKeyboard:(BOOL)a3
{
  self->_allowContinuousPathKeyboard = a3;
}

- (BOOL)allowTranslationLookup
{
  return self->_allowTranslationLookup;
}

- (void)setAllowTranslationLookup:(BOOL)a3
{
  self->_allowTranslationLookup = a3;
}

- (BOOL)allowQuickNote
{
  return self->_allowQuickNote;
}

- (void)setAllowQuickNote:(BOOL)a3
{
  self->_allowQuickNote = a3;
}

@end