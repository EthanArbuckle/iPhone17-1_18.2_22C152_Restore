@interface AXMSpeechComponent
+ (BOOL)isSupported;
- (AVSpeechSynthesizer)synthesizer;
- (AXMSpeechComponent)init;
- (BOOL)canHandleRequest:(id)a3;
- (id)currentRequestCompletionBlock;
- (void)handleRequest:(id)a3 completion:(id)a4;
- (void)setCurrentRequestCompletionBlock:(id)a3;
- (void)setSynthesizer:(id)a3;
- (void)speechSynthesizer:(id)a3 didCancelSpeechUtterance:(id)a4;
- (void)speechSynthesizer:(id)a3 didContinueSpeechUtterance:(id)a4;
- (void)speechSynthesizer:(id)a3 didFinishSpeechUtterance:(id)a4;
- (void)speechSynthesizer:(id)a3 didPauseSpeechUtterance:(id)a4;
- (void)speechSynthesizer:(id)a3 didStartSpeechUtterance:(id)a4;
- (void)stopSpeakingAtNextWord;
- (void)stopSpeakingImmediately;
@end

@implementation AXMSpeechComponent

- (AXMSpeechComponent)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXMSpeechComponent;
  v2 = [(AXMOutputComponent *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F15480]);
    [(AXMSpeechComponent *)v2 setSynthesizer:v3];

    v4 = [(AXMSpeechComponent *)v2 synthesizer];
    [v4 setDelegate:v2];
  }
  return v2;
}

+ (BOOL)isSupported
{
  return 1;
}

- (BOOL)canHandleRequest:(id)a3
{
  id v3 = [a3 speechActions];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)handleRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = [a3 speechActions];
  v8 = [v7 firstObject];
  v9 = [v8 text];

  v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v9 attributes:0];
  v11 = [(AXMSpeechComponent *)self currentRequestCompletionBlock];

  if (v11)
  {
    v12 = AXMediaLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[AXMSpeechComponent handleRequest:completion:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  v20 = [MEMORY[0x1E4F15490] speechUtteranceWithAttributedString:v10];
  [(AXMSpeechComponent *)self setCurrentRequestCompletionBlock:v6];

  v21 = [(AXMSpeechComponent *)self synthesizer];
  [v21 speakUtterance:v20];
}

- (void)stopSpeakingImmediately
{
  id v2 = [(AXMSpeechComponent *)self synthesizer];
  [v2 stopSpeakingAtBoundary:0];
}

- (void)stopSpeakingAtNextWord
{
  id v2 = [(AXMSpeechComponent *)self synthesizer];
  [v2 stopSpeakingAtBoundary:1];
}

- (void)speechSynthesizer:(id)a3 didStartSpeechUtterance:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  v5 = AXMediaLogSpeech();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 attributedSpeechString];
    v7 = [v6 string];
    int v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1B57D5000, v5, OS_LOG_TYPE_DEFAULT, "speech started: '%@'", (uint8_t *)&v8, 0xCu);
  }
}

- (void)speechSynthesizer:(id)a3 didFinishSpeechUtterance:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = AXMediaLogSpeech();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [v5 attributedSpeechString];
    int v8 = [v7 string];
    int v19 = 138412290;
    v20 = v8;
    _os_log_impl(&dword_1B57D5000, v6, OS_LOG_TYPE_DEFAULT, "speech finished: '%@'", (uint8_t *)&v19, 0xCu);
  }
  v9 = [(AXMSpeechComponent *)self currentRequestCompletionBlock];

  if (!v9)
  {
    uint64_t v10 = AXMediaLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[AXMSpeechComponent speechSynthesizer:didFinishSpeechUtterance:](v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  uint64_t v18 = [(AXMSpeechComponent *)self currentRequestCompletionBlock];
  [(AXMSpeechComponent *)self setCurrentRequestCompletionBlock:0];
  if (v18) {
    v18[2](v18);
  }
}

- (void)speechSynthesizer:(id)a3 didCancelSpeechUtterance:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = AXMediaLogSpeech();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [v5 attributedSpeechString];
    int v8 = [v7 string];
    int v19 = 138412290;
    v20 = v8;
    _os_log_impl(&dword_1B57D5000, v6, OS_LOG_TYPE_DEFAULT, "speech canceled: '%@'", (uint8_t *)&v19, 0xCu);
  }
  v9 = [(AXMSpeechComponent *)self currentRequestCompletionBlock];

  if (!v9)
  {
    uint64_t v10 = AXMediaLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[AXMSpeechComponent speechSynthesizer:didCancelSpeechUtterance:](v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  uint64_t v18 = [(AXMSpeechComponent *)self currentRequestCompletionBlock];
  [(AXMSpeechComponent *)self setCurrentRequestCompletionBlock:0];
  if (v18) {
    v18[2](v18);
  }
}

- (void)speechSynthesizer:(id)a3 didPauseSpeechUtterance:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = AXMediaLogSpeech();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 attributedSpeechString];
    v7 = [v6 string];
    int v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1B57D5000, v5, OS_LOG_TYPE_DEFAULT, "speech paused: '%@'", (uint8_t *)&v8, 0xCu);
  }
}

- (void)speechSynthesizer:(id)a3 didContinueSpeechUtterance:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = AXMediaLogSpeech();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 attributedSpeechString];
    v7 = [v6 string];
    int v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1B57D5000, v5, OS_LOG_TYPE_DEFAULT, "speech resumed: '%@'", (uint8_t *)&v8, 0xCu);
  }
}

- (AVSpeechSynthesizer)synthesizer
{
  return self->_synthesizer;
}

- (void)setSynthesizer:(id)a3
{
}

- (id)currentRequestCompletionBlock
{
  return self->_currentRequestCompletionBlock;
}

- (void)setCurrentRequestCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_currentRequestCompletionBlock, 0);

  objc_storeStrong((id *)&self->_synthesizer, 0);
}

- (void)handleRequest:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)speechSynthesizer:(uint64_t)a3 didFinishSpeechUtterance:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)speechSynthesizer:(uint64_t)a3 didCancelSpeechUtterance:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end