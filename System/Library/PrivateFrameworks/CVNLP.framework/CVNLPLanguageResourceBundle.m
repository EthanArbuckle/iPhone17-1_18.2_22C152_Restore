@interface CVNLPLanguageResourceBundle
- (CVNLPDecodingLanguageModel)characterLanguageModel;
- (CVNLPDecodingLanguageModel)wordLanguageModel;
- (CVNLPDecodingLexicons)lexicons;
- (CVNLPLanguageResourceBundle)initWithLexicons:(id)a3 characterLanguageModel:(id)a4 wordLanguageModel:(id)a5;
- (id)packagedLexiconCursorsUsingContext:(id)a3;
- (id)packagedLexiconRootCursors;
@end

@implementation CVNLPLanguageResourceBundle

- (CVNLPLanguageResourceBundle)initWithLexicons:(id)a3 characterLanguageModel:(id)a4 wordLanguageModel:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CVNLPLanguageResourceBundle;
  v12 = [(CVNLPLanguageResourceBundle *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_characterLanguageModel, a4);
    objc_storeStrong((id *)&v13->_wordLanguageModel, a5);
    objc_storeStrong((id *)&v13->_lexicons, a3);
  }

  return v13;
}

- (id)packagedLexiconCursorsUsingContext:(id)a3
{
  v4 = objc_msgSend_packagedLexiconCursorsUsingTextDecodingContext_(self->_lexicons, a2, (uint64_t)a3, v3);
  return v4;
}

- (id)packagedLexiconRootCursors
{
  return (id)objc_msgSend_packagedLexiconRootCursors(self->_lexicons, a2, v2, v3);
}

- (CVNLPDecodingLexicons)lexicons
{
  return self->_lexicons;
}

- (CVNLPDecodingLanguageModel)characterLanguageModel
{
  return self->_characterLanguageModel;
}

- (CVNLPDecodingLanguageModel)wordLanguageModel
{
  return self->_wordLanguageModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wordLanguageModel, 0);
  objc_storeStrong((id *)&self->_characterLanguageModel, 0);
  objc_storeStrong((id *)&self->_lexicons, 0);
}

@end