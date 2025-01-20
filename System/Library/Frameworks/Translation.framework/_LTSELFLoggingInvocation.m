@interface _LTSELFLoggingInvocation
+ (void)translationTTSPlayedWithInvocationId:(id)a3 sourceOrTargetLanguage:(int64_t)a4 isAutoplayTranslation:(BOOL)a5 ttsPlaybackSpeed:(int64_t)a6 audioChannel:(int64_t)a7;
+ (void)userEndedTypingWithInvocationId:(id)a3 payload:(id)a4 localePair:(id)a5 reason:(int64_t)a6;
- (BOOL)endSent;
- (NSUUID)invocationId;
- (_LTSELFLoggingInvocation)initWithInvocationId:(id)a3;
- (void)appBackgroundedWithPayload:(id)a3 localePair:(id)a4;
- (void)cancelWithReason:(id)a3 qssSessionId:(id)a4;
- (void)endSuccessfullyWithQSSSessionId:(id)a3;
- (void)endWithError:(id)a3 qssSessionId:(id)a4;
- (void)languageIdentificationCompletedWithInputSource:(int64_t)a3 topLocale:(id)a4 lowConfidenceLocales:(id)a5;
- (void)sendEventWithPayload:(id)a3 localePair:(id)a4 type:(int64_t)a5;
- (void)sendUserEndedTypingEventWithPayload:(id)a3 localePair:(id)a4 type:(int64_t)a5;
- (void)setEndSent:(BOOL)a3;
- (void)userEndedTypingWithPayload:(id)a3 localePair:(id)a4 reason:(int64_t)a5;
@end

@implementation _LTSELFLoggingInvocation

- (_LTSELFLoggingInvocation)initWithInvocationId:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_LTSELFLoggingInvocation;
  v6 = [(_LTSELFLoggingInvocation *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_endSent = 0;
    objc_storeStrong((id *)&v6->_invocationId, a3);
    v8 = v7;
  }

  return v7;
}

- (void)endSuccessfullyWithQSSSessionId:(id)a3
{
  id v4 = a3;
  if (self->_endSent)
  {
    id v5 = _LTOSLogSELFLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[_LTSELFLoggingInvocation endSuccessfullyWithQSSSessionId:]();
    }
  }
  else
  {
    v6 = [[_LTSELFLoggingEventData alloc] initWithType:2 invocationId:self->_invocationId];
    [(_LTSELFLoggingEventData *)v6 setQssSessionId:v4];
    +[_LTTranslator selfLoggingEventWithData:v6];
    self->_endSent = 1;
  }
}

- (void)endWithError:(id)a3 qssSessionId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_endSent)
  {
    v8 = _LTOSLogSELFLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[_LTSELFLoggingInvocation endWithError:qssSessionId:]();
    }
  }
  else
  {
    v9 = [[_LTSELFLoggingEventData alloc] initWithType:3 invocationId:self->_invocationId];
    [(_LTSELFLoggingEventData *)v9 setQssSessionId:v7];
    [(_LTSELFLoggingEventData *)v9 setInvocationEndedError:v6];
    +[_LTTranslator selfLoggingEventWithData:v9];
    self->_endSent = 1;
  }
}

- (void)cancelWithReason:(id)a3 qssSessionId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_endSent)
  {
    v8 = _LTOSLogSELFLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[_LTSELFLoggingInvocation cancelWithReason:qssSessionId:]();
    }
  }
  else
  {
    v9 = [[_LTSELFLoggingEventData alloc] initWithType:4 invocationId:self->_invocationId];
    [(_LTSELFLoggingEventData *)v9 setQssSessionId:v7];
    [(_LTSELFLoggingEventData *)v9 setInvocationCancelledReason:v6];
    +[_LTTranslator selfLoggingEventWithData:v9];
    self->_endSent = 1;
  }
}

- (void)userEndedTypingWithPayload:(id)a3 localePair:(id)a4 reason:(int64_t)a5
{
  if ((unint64_t)a5 >= 3) {
    int64_t v5 = 0;
  }
  else {
    int64_t v5 = a5 + 5;
  }
  [(_LTSELFLoggingInvocation *)self sendUserEndedTypingEventWithPayload:a3 localePair:a4 type:v5];
}

- (void)appBackgroundedWithPayload:(id)a3 localePair:(id)a4
{
}

+ (void)translationTTSPlayedWithInvocationId:(id)a3 sourceOrTargetLanguage:(int64_t)a4 isAutoplayTranslation:(BOOL)a5 ttsPlaybackSpeed:(int64_t)a6 audioChannel:(int64_t)a7
{
  BOOL v9 = a5;
  id v11 = a3;
  v13 = [[_LTSELFLoggingEventData alloc] initWithType:9 invocationId:v11];

  v12 = [[_LTSELFLoggingTranslationTTSData alloc] initWithSourceOrTargetLanguage:a4 isAutoplayTranslation:v9 ttsPlaybackSpeed:a6 audioChannel:a7];
  [(_LTSELFLoggingEventData *)v13 setTranslationTTSData:v12];
  +[_LTTranslator selfLoggingEventWithData:v13];
}

- (void)languageIdentificationCompletedWithInputSource:(int64_t)a3 topLocale:(id)a4 lowConfidenceLocales:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  objc_super v10 = [[_LTSELFLoggingTranslationLIDData alloc] initWithInvocationId:self->_invocationId inputSource:a3 topLocale:v9 lowConfidenceLocales:v8];

  +[_LTTranslator selfLoggingLanguageIdentificationCompletedWithLIDData:v10];
}

- (void)sendEventWithPayload:(id)a3 localePair:(id)a4 type:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  objc_super v10 = [[_LTSELFLoggingEventData alloc] initWithType:a5 invocationId:self->_invocationId];
  [(_LTSELFLoggingEventData *)v10 setTranslationPayload:v9];

  [(_LTSELFLoggingEventData *)v10 setTranslationLocalePair:v8];
  +[_LTTranslator selfLoggingEventWithData:v10];
}

- (void)sendUserEndedTypingEventWithPayload:(id)a3 localePair:(id)a4 type:(int64_t)a5
{
  if (self->_endSent)
  {
    id v6 = _LTOSLogSELFLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[_LTSELFLoggingInvocation sendUserEndedTypingEventWithPayload:localePair:type:]();
    }
  }
  else
  {
    [(_LTSELFLoggingInvocation *)self sendEventWithPayload:a3 localePair:a4 type:a5];
    self->_endSent = 1;
  }
}

+ (void)userEndedTypingWithInvocationId:(id)a3 payload:(id)a4 localePair:(id)a5 reason:(int64_t)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [_LTSELFLoggingEventData alloc];
  if ((unint64_t)a6 >= 3) {
    int64_t v13 = 0;
  }
  else {
    int64_t v13 = a6 + 5;
  }
  v14 = [(_LTSELFLoggingEventData *)v12 initWithType:v13 invocationId:v11];

  [(_LTSELFLoggingEventData *)v14 setTranslationPayload:v10];
  [(_LTSELFLoggingEventData *)v14 setTranslationLocalePair:v9];

  +[_LTTranslator selfLoggingEventWithData:v14];
}

- (NSUUID)invocationId
{
  return self->_invocationId;
}

- (BOOL)endSent
{
  return self->_endSent;
}

- (void)setEndSent:(BOOL)a3
{
  self->_endSent = a3;
}

- (void).cxx_destruct
{
}

- (void)endSuccessfullyWithQSSSessionId:.cold.1()
{
  OUTLINED_FUNCTION_2_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_0(&dword_24639B000, v0, v1, "Invocation [%{public}@] has ended already, so ignoring successful end of event with QSS Session ID of %{public}@");
}

- (void)endWithError:qssSessionId:.cold.1()
{
  OUTLINED_FUNCTION_2_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_0(&dword_24639B000, v0, v1, "Invocation [%{public}@] has ended already so ignoring end with error of event with QSS Session ID of %{public}@");
}

- (void)cancelWithReason:qssSessionId:.cold.1()
{
  OUTLINED_FUNCTION_2_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_0(&dword_24639B000, v0, v1, "Invocation [%{public}@] has ended already so ignoring cancel with reason of event with QSS Session ID of %{public}@");
}

- (void)sendUserEndedTypingEventWithPayload:localePair:type:.cold.1()
{
  OUTLINED_FUNCTION_2_1(*MEMORY[0x263EF8340]);
  int v2 = 138543362;
  uint64_t v3 = v0;
  _os_log_debug_impl(&dword_24639B000, v1, OS_LOG_TYPE_DEBUG, "Invocation [%{public}@] has ended already, so ignoring successful end with user ending typing", (uint8_t *)&v2, 0xCu);
}

@end