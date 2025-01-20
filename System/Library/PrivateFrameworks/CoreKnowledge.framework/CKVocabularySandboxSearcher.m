@interface CKVocabularySandboxSearcher
- (CKVocabularySandboxSearcher)initWithSandbox:(id)a3 userId:(id)a4 prewarm:(BOOL)a5;
- (id)_searcher;
@end

@implementation CKVocabularySandboxSearcher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_sandbox, 0);
}

- (id)_searcher
{
  return (id)[(SEMSandbox *)self->_sandbox appCustomVocabularySearcherWithUserId:self->_userId];
}

- (CKVocabularySandboxSearcher)initWithSandbox:(id)a3 userId:(id)a4 prewarm:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v11 = [v9 indexMatcher];
  v14.receiver = self;
  v14.super_class = (Class)CKVocabularySandboxSearcher;
  v12 = [(CKVocabularySearcher *)&v14 initWithUserId:v10 spanMatcher:v11 prewarm:v5];

  if (v12)
  {
    objc_storeStrong((id *)&v12->_sandbox, a3);
    objc_storeStrong((id *)&v12->_userId, a4);
  }

  return v12;
}

@end