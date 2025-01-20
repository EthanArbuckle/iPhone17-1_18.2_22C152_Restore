@interface IASTextInputActionsEvent
- (BOOL)isDispatchable;
- (BOOL)isEmojiSearch;
- (BOOL)isMarkedText;
- (BOOL)sessionIsModeless;
- (IASTextInputActionsEvent)initWithbundleId:(id)a3;
- (NSString)bundleId;
- (NSString)inputModeIdentifier;
- (NSString)keyboardLayout;
- (NSString)keyboardType;
- (NSString)keyboardVariant;
- (NSString)language;
- (NSString)region;
- (NSString)sessionActions;
- (int64_t)netCharacters;
- (int64_t)netEmojiCharacters;
- (int64_t)source;
- (int64_t)type;
- (unint64_t)inputActionCount;
- (unint64_t)userRemovedCharacters;
- (unint64_t)userRemovedEmojiCharacters;
- (void)dispatchEvent;
- (void)dispatchEvent:(id)a3;
- (void)resetMeasures;
- (void)setBundleId:(id)a3;
- (void)setInputActionCount:(unint64_t)a3;
- (void)setInputModeIdentifier:(id)a3;
- (void)setIsEmojiSearch:(BOOL)a3;
- (void)setIsMarkedText:(BOOL)a3;
- (void)setKeyboardLayout:(id)a3;
- (void)setKeyboardType:(id)a3;
- (void)setKeyboardVariant:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setNetCharacters:(int64_t)a3;
- (void)setNetEmojiCharacters:(int64_t)a3;
- (void)setRegion:(id)a3;
- (void)setSessionActions:(id)a3;
- (void)setSessionIsModeless:(BOOL)a3;
- (void)setSource:(int64_t)a3;
- (void)setType:(int64_t)a3;
- (void)setUserRemovedCharacters:(unint64_t)a3;
- (void)setUserRemovedEmojiCharacters:(unint64_t)a3;
@end

@implementation IASTextInputActionsEvent

- (IASTextInputActionsEvent)initWithbundleId:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IASTextInputActionsEvent;
  v6 = [(IASTextInputActionsEvent *)&v16 init];
  v7 = v6;
  if (v6)
  {
    *(_OWORD *)&v6->_netCharacters = 0u;
    *(_OWORD *)&v6->_netEmojiCharacters = 0u;
    *(_OWORD *)&v6->_source = 0u;
    sessionActions = v6->_sessionActions;
    v6->_inputActionCount = 0;
    v6->_sessionActions = (NSString *)@"T";

    *(_WORD *)&v7->_isEmojiSearch = 0;
    v7->_sessionIsModeless = 0;
    language = v7->_language;
    v7->_language = (NSString *)@"None";

    region = v7->_region;
    v7->_region = (NSString *)@"None";

    keyboardVariant = v7->_keyboardVariant;
    v7->_keyboardVariant = (NSString *)@"None";

    keyboardLayout = v7->_keyboardLayout;
    v7->_keyboardLayout = (NSString *)@"None";

    keyboardType = v7->_keyboardType;
    v7->_keyboardType = (NSString *)@"None";

    inputModeIdentifier = v7->_inputModeIdentifier;
    v7->_inputModeIdentifier = (NSString *)@"None";

    objc_storeStrong((id *)&v7->_bundleId, a3);
  }

  return v7;
}

- (void)dispatchEvent
{
  objc_msgSend_dispatchEvent_(self, a2, (uint64_t)&unk_2702E3968, v2);
}

- (void)dispatchEvent:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void *))a3;
  int isDispatchable = objc_msgSend_isDispatchable(self, v5, v6, v7);
  if (v4 && isDispatchable)
  {
    v45[0] = @"src";
    v44 = objc_msgSend_numberWithInteger_(NSNumber, v9, self->_source, v10);
    v46[0] = v44;
    v45[1] = @"type";
    v43 = objc_msgSend_numberWithInteger_(NSNumber, v11, self->_type, v12);
    v46[1] = v43;
    v45[2] = @"netChars";
    v15 = objc_msgSend_numberWithInteger_(NSNumber, v13, self->_netCharacters, v14);
    v46[2] = v15;
    v45[3] = @"usrRmChars";
    v18 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v16, self->_userRemovedCharacters, v17);
    v46[3] = v18;
    v45[4] = @"netEmojis";
    v21 = objc_msgSend_numberWithInteger_(NSNumber, v19, self->_netEmojiCharacters, v20);
    v46[4] = v21;
    v45[5] = @"usrRmEmojis";
    v24 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v22, self->_userRemovedEmojiCharacters, v23);
    v46[5] = v24;
    v45[6] = @"isEmojiSearch";
    v27 = objc_msgSend_numberWithBool_(NSNumber, v25, self->_isEmojiSearch, v26);
    v46[6] = v27;
    v45[7] = @"isMarkedText";
    v30 = objc_msgSend_numberWithBool_(NSNumber, v28, self->_isMarkedText, v29);
    v46[7] = v30;
    v45[8] = @"inputActionCount";
    v33 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v31, self->_inputActionCount, v32);
    v46[8] = v33;
    v45[9] = @"sessionIsModeless";
    v36 = objc_msgSend_numberWithBool_(NSNumber, v34, self->_sessionIsModeless, v35);
    sessionActions = self->_sessionActions;
    language = self->_language;
    v46[9] = v36;
    v46[10] = sessionActions;
    v45[10] = @"sessionActions";
    v45[11] = @"language";
    v46[11] = language;
    long long v47 = *(_OWORD *)&self->_region;
    v45[12] = @"region";
    v45[13] = @"kbVariant";
    v45[14] = @"kbLayout";
    v45[15] = @"kbType";
    keyboardType = self->_keyboardType;
    keyboardLayout = self->_keyboardLayout;
    v49 = keyboardType;
    v45[16] = @"kbConfiguration";
    v45[17] = @"bundleId";
    bundleId = self->_bundleId;
    inputModeIdentifier = self->_inputModeIdentifier;
    v51 = bundleId;
    v42 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v41, (uint64_t)v46, (uint64_t)v45, 18);

    v4[2](v4, v42);
  }
}

- (BOOL)isDispatchable
{
  return (self->_netCharacters
       || self->_netEmojiCharacters
       || self->_userRemovedCharacters
       || self->_inputActionCount
       || self->_userRemovedEmojiCharacters)
      && self->_sessionActions
      && self->_language
      && self->_region
      && self->_keyboardLayout
      && self->_keyboardVariant
      && self->_keyboardType
      && self->_inputModeIdentifier
      && self->_bundleId != 0;
}

- (void)resetMeasures
{
  self->_inputActionCount = 0;
  *(_OWORD *)&self->_netCharacters = 0u;
  *(_OWORD *)&self->_netEmojiCharacters = 0u;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)netCharacters
{
  return self->_netCharacters;
}

- (void)setNetCharacters:(int64_t)a3
{
  self->_netCharacters = a3;
}

- (unint64_t)userRemovedCharacters
{
  return self->_userRemovedCharacters;
}

- (void)setUserRemovedCharacters:(unint64_t)a3
{
  self->_userRemovedCharacters = a3;
}

- (int64_t)netEmojiCharacters
{
  return self->_netEmojiCharacters;
}

- (void)setNetEmojiCharacters:(int64_t)a3
{
  self->_netEmojiCharacters = a3;
}

- (unint64_t)userRemovedEmojiCharacters
{
  return self->_userRemovedEmojiCharacters;
}

- (void)setUserRemovedEmojiCharacters:(unint64_t)a3
{
  self->_userRemovedEmojiCharacters = a3;
}

- (unint64_t)inputActionCount
{
  return self->_inputActionCount;
}

- (void)setInputActionCount:(unint64_t)a3
{
  self->_inputActionCount = a3;
}

- (BOOL)isEmojiSearch
{
  return self->_isEmojiSearch;
}

- (void)setIsEmojiSearch:(BOOL)a3
{
  self->_isEmojiSearch = a3;
}

- (BOOL)isMarkedText
{
  return self->_isMarkedText;
}

- (void)setIsMarkedText:(BOOL)a3
{
  self->_isMarkedText = a3;
}

- (BOOL)sessionIsModeless
{
  return self->_sessionIsModeless;
}

- (void)setSessionIsModeless:(BOOL)a3
{
  self->_sessionIsModeless = a3;
}

- (NSString)sessionActions
{
  return self->_sessionActions;
}

- (void)setSessionActions:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
}

- (NSString)keyboardVariant
{
  return self->_keyboardVariant;
}

- (void)setKeyboardVariant:(id)a3
{
}

- (NSString)keyboardLayout
{
  return self->_keyboardLayout;
}

- (void)setKeyboardLayout:(id)a3
{
}

- (NSString)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(id)a3
{
}

- (NSString)inputModeIdentifier
{
  return self->_inputModeIdentifier;
}

- (void)setInputModeIdentifier:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_inputModeIdentifier, 0);
  objc_storeStrong((id *)&self->_keyboardType, 0);
  objc_storeStrong((id *)&self->_keyboardLayout, 0);
  objc_storeStrong((id *)&self->_keyboardVariant, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_sessionActions, 0);
}

@end