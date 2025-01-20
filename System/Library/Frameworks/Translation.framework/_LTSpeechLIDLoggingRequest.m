@interface _LTSpeechLIDLoggingRequest
+ (BOOL)supportsSecureCoding;
- (NSLocale)selectedLocale;
- (NSLocale)targetLocale;
- (NSString)conversationID;
- (NSString)requestID;
- (_LTLanguageDetectionResult)lidResult;
- (_LTLocalePair)localePair;
- (_LTSpeechLIDLoggingRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setConversationID:(id)a3;
- (void)setLidResult:(id)a3;
- (void)setLocalePair:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setSelectedLocale:(id)a3;
- (void)setTargetLocale:(id)a3;
@end

@implementation _LTSpeechLIDLoggingRequest

- (void)encodeWithCoder:(id)a3
{
  conversationID = self->_conversationID;
  id v5 = a3;
  [v5 encodeObject:conversationID forKey:@"conversationID"];
  [v5 encodeObject:self->_requestID forKey:@"requestID"];
  [v5 encodeObject:self->_localePair forKey:@"localePair"];
  [v5 encodeObject:self->_selectedLocale forKey:@"selectedLocale"];
  [v5 encodeObject:self->_targetLocale forKey:@"targetLocale"];
  [v5 encodeObject:self->_lidResult forKey:@"lidResult"];
}

- (_LTSpeechLIDLoggingRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_LTSpeechLIDLoggingRequest;
  id v5 = [(_LTSpeechLIDLoggingRequest *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"conversationID"];
    conversationID = v5->_conversationID;
    v5->_conversationID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestID"];
    requestID = v5->_requestID;
    v5->_requestID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localePair"];
    localePair = v5->_localePair;
    v5->_localePair = (_LTLocalePair *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selectedLocale"];
    selectedLocale = v5->_selectedLocale;
    v5->_selectedLocale = (NSLocale *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetLocale"];
    targetLocale = v5->_targetLocale;
    v5->_targetLocale = (NSLocale *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lidResult"];
    lidResult = v5->_lidResult;
    v5->_lidResult = (_LTLanguageDetectionResult *)v16;

    v18 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(id)a3
{
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
}

- (_LTLocalePair)localePair
{
  return self->_localePair;
}

- (void)setLocalePair:(id)a3
{
}

- (NSLocale)targetLocale
{
  return self->_targetLocale;
}

- (void)setTargetLocale:(id)a3
{
}

- (NSLocale)selectedLocale
{
  return self->_selectedLocale;
}

- (void)setSelectedLocale:(id)a3
{
}

- (_LTLanguageDetectionResult)lidResult
{
  return self->_lidResult;
}

- (void)setLidResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lidResult, 0);
  objc_storeStrong((id *)&self->_selectedLocale, 0);
  objc_storeStrong((id *)&self->_targetLocale, 0);
  objc_storeStrong((id *)&self->_localePair, 0);
  objc_storeStrong((id *)&self->_requestID, 0);

  objc_storeStrong((id *)&self->_conversationID, 0);
}

@end