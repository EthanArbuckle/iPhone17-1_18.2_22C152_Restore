@interface AFUtteranceSuggestions
- (AFUtteranceSuggestions)initWithLanguageCode:(id)a3 delegate:(id)a4;
- (AFUtteranceSuggestionsDelegate)delegate;
- (NSString)languageCode;
- (id)_suggestionsFilePath;
- (void)getSuggestedUtterancesWithCompletion:(id)a3;
- (void)setSuggestedUtterances:(id)a3;
@end

@implementation AFUtteranceSuggestions

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_suggestedUtterances, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (AFUtteranceSuggestionsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AFUtteranceSuggestionsDelegate *)WeakRetained;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setSuggestedUtterances:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__AFUtteranceSuggestions_setSuggestedUtterances___block_invoke;
  v7[3] = &unk_1E592C710;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __49__AFUtteranceSuggestions_setSuggestedUtterances___block_invoke(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 16) isEqualToArray:*(void *)(a1 + 40)] & 1) == 0)
  {
    uint64_t v2 = [*(id *)(a1 + 40) copy];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = v2;

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
    [WeakRetained suggestionsDidChange:*(void *)(a1 + 32)];

    id v6 = *(void **)(a1 + 32);
    v7 = (void *)v6[2];
    id v8 = [v6 _suggestionsFilePath];
    [v7 writeToFile:v8 atomically:1];
  }
}

- (void)getSuggestedUtterancesWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__AFUtteranceSuggestions_getSuggestedUtterancesWithCompletion___block_invoke;
  v7[3] = &unk_1E592C6E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __63__AFUtteranceSuggestions_getSuggestedUtterancesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2[2])
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
    id v4 = [v2 _suggestionsFilePath];
    uint64_t v5 = [v3 arrayWithContentsOfFile:v4];
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 16);
    *(void *)(v6 + 16) = v5;
  }
  id v8 = *(void **)(a1 + 40);
  if (v8)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __63__AFUtteranceSuggestions_getSuggestedUtterancesWithCompletion___block_invoke_2;
    v10[3] = &unk_1E592C6E8;
    id v9 = v8;
    v10[4] = *(void *)(a1 + 32);
    id v11 = v9;
    dispatch_async(MEMORY[0x1E4F14428], v10);
  }
}

uint64_t __63__AFUtteranceSuggestions_getSuggestedUtterancesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 16));
}

- (id)_suggestionsFilePath
{
  uint64_t v3 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  id v4 = [v3 firstObject];

  uint64_t v5 = [NSString stringWithFormat:@"com.apple.siri.suggestions-%@.plist", self->_languageCode];
  uint64_t v6 = [v4 stringByAppendingPathComponent:v5];

  return v6;
}

- (AFUtteranceSuggestions)initWithLanguageCode:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AFUtteranceSuggestions;
  id v8 = [(AFUtteranceSuggestions *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    languageCode = v8->_languageCode;
    v8->_languageCode = (NSString *)v9;

    objc_storeWeak((id *)&v8->_delegate, v7);
    id v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("Siri Utterance Suggestions Queue", v11);

    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v12;
  }
  return v8;
}

@end