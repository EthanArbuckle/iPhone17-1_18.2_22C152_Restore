@interface SGConversationHistory
- (NSArray)messages;
- (NSString)likelyLanguage;
- (SGConversationHistory)initWithMessages:(id)a3;
@end

@implementation SGConversationHistory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_likelyLanguage, 0);
  objc_storeStrong((id *)&self->_messages, 0);
}

- (NSString)likelyLanguage
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)messages
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (SGConversationHistory)initWithMessages:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SGConversationHistory;
  v6 = [(SGConversationHistory *)&v12 init];
  if (v6)
  {
    v7 = (void *)MEMORY[0x1CB79B230]();
    v8 = sgMapAndFilter();
    objc_storeStrong((id *)&v6->_messages, a3);
    uint64_t v9 = [MEMORY[0x1E4F89D60] detectLanguageFromLanguageTags:v8];
    likelyLanguage = v6->_likelyLanguage;
    v6->_likelyLanguage = (NSString *)v9;
  }

  return v6;
}

uint64_t __42__SGConversationHistory_initWithMessages___block_invoke(uint64_t a1, void *a2)
{
  return [a2 language];
}

@end