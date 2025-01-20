@interface _LTTextToSpeechTranslationRequest
- (NSString)text;
- (_LTSpeechTranslationDelegate)delegate;
- (_LTTextToSpeechTranslationRequest)initWithLocalePair:(id)a3;
- (_LTTextToSpeechTranslationRequest)initWithLocalePair:(id)a3 suggestedUniqueID:(id)a4;
- (_LTTextToSpeechTranslationRequest)initWithSourceLocale:(id)a3 targetLocale:(id)a4;
- (_LTTextToSpeechTranslationRequest)initWithSourceLocale:(id)a3 targetLocale:(id)a4 suggestedUniqueID:(id)a5;
- (id)loggingType;
- (id)nativeAudioFormat;
- (id)requestContext;
- (void)_startTranslationWithService:(id)a3 done:(id)a4;
- (void)_translationFailedWithError:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setText:(id)a3;
- (void)translationDidFinishWithError:(id)a3;
- (void)translatorDidTranslate:(id)a3;
@end

@implementation _LTTextToSpeechTranslationRequest

- (id)loggingType
{
  return @"textToSpeech";
}

- (id)requestContext
{
  v7.receiver = self;
  v7.super_class = (Class)_LTTextToSpeechTranslationRequest;
  v3 = [(_LTTranslationRequest *)&v7 requestContext];
  v4 = [(_LTTranslationRequest *)self outputFileURL];
  [v3 setOutputFileURL:v4];

  uint64_t v5 = 1;
  [v3 setCancelOnCleanup:1];
  [v3 setRoute:0];
  if (![(_LTTranslationRequest *)self forcedOfflineTranslation])
  {
    if (![(_LTTranslationRequest *)self _forcedOnlineTranslation]) {
      goto LABEL_5;
    }
    uint64_t v5 = 2;
  }
  [v3 setRoute:v5];
LABEL_5:

  return v3;
}

- (_LTTextToSpeechTranslationRequest)initWithSourceLocale:(id)a3 targetLocale:(id)a4
{
  return [(_LTTextToSpeechTranslationRequest *)self initWithSourceLocale:a3 targetLocale:a4 suggestedUniqueID:0];
}

- (_LTTextToSpeechTranslationRequest)initWithSourceLocale:(id)a3 targetLocale:(id)a4 suggestedUniqueID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[_LTLocalePair alloc] initWithSourceLocale:v10 targetLocale:v9];

  v12 = [(_LTTextToSpeechTranslationRequest *)self initWithLocalePair:v11 suggestedUniqueID:v8];
  return v12;
}

- (_LTTextToSpeechTranslationRequest)initWithLocalePair:(id)a3
{
  return [(_LTTextToSpeechTranslationRequest *)self initWithLocalePair:a3 suggestedUniqueID:0];
}

- (_LTTextToSpeechTranslationRequest)initWithLocalePair:(id)a3 suggestedUniqueID:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_LTTextToSpeechTranslationRequest;
  v4 = [(_LTTranslationRequest *)&v9 initWithLocalePair:a3 suggestedUniqueID:a4];
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.siri.translation.speechrequest", 0);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v5;

    objc_super v7 = v4;
  }

  return v4;
}

- (id)nativeAudioFormat
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EF9388]) initWithStreamDescription:&SupportedASBD];

  return v2;
}

- (void)_startTranslationWithService:(id)a3 done:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_24639B000, v8, OS_LOG_TYPE_DEFAULT, "Start text to speech translation with service", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71___LTTextToSpeechTranslationRequest__startTranslationWithService_done___block_invoke;
  block[3] = &unk_2651DB9F8;
  objc_copyWeak(&v15, buf);
  id v13 = v6;
  id v14 = v7;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(queue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(buf);
}

- (void)_translationFailedWithError:(id)a3
{
  id v7 = a3;
  v4 = [(_LTTextToSpeechTranslationRequest *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(_LTTextToSpeechTranslationRequest *)self delegate];
    [v6 translationDidFinishWithError:v7];
  }
}

- (void)translatorDidTranslate:(id)a3
{
  id v4 = a3;
  char v5 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v9 = 0;
    _os_log_impl(&dword_24639B000, v5, OS_LOG_TYPE_INFO, "TextToSpeechTranslation did receive translation result", v9, 2u);
  }
  id v6 = [(_LTTextToSpeechTranslationRequest *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(_LTTextToSpeechTranslationRequest *)self delegate];
    [v8 translatorDidTranslate:v4];
  }
}

- (void)translationDidFinishWithError:(id)a3
{
  id v8 = a3;
  id v4 = [(_LTTextToSpeechTranslationRequest *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(_LTTextToSpeechTranslationRequest *)self delegate];
    [v6 translationDidFinishWithError:v8];
  }
  done = (void (**)(void))self->_done;
  if (done) {
    done[2]();
  }
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (_LTSpeechTranslationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_LTSpeechTranslationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong(&self->_done, 0);
  objc_storeStrong((id *)&self->_service, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end