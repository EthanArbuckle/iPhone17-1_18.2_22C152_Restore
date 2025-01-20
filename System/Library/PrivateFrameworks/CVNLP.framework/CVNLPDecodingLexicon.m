@interface CVNLPDecodingLexicon
+ (_LXLexicon)_createLexiconForLocale:(id)a3;
+ (id)decodingLexiconForLocale:(id)a3;
+ (id)decodingLexiconForLocale:(id)a3 priority:(unint64_t)a4;
- (CVNLPDecodingLexicon)initWithLexicon:(_LXLexicon *)a3;
- (CVNLPDecodingLexicon)initWithLexicon:(_LXLexicon *)a3 priority:(unint64_t)a4;
- (_LXCursor)_rootCursor;
- (_LXLexicon)lexicon;
- (unint64_t)priority;
- (void)dealloc;
@end

@implementation CVNLPDecodingLexicon

- (CVNLPDecodingLexicon)initWithLexicon:(_LXLexicon *)a3 priority:(unint64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CVNLPDecodingLexicon;
  v6 = [(CVNLPDecodingLexicon *)&v8 init];
  if (v6)
  {
    v6->_lexicon = (_LXLexicon *)CFRetain(a3);
    v6->_priority = a4;
    v6->__rootCursor = (_LXCursor *)LXLexiconCreateRootCursor();
  }
  return v6;
}

- (CVNLPDecodingLexicon)initWithLexicon:(_LXLexicon *)a3
{
  return (CVNLPDecodingLexicon *)objc_msgSend_initWithLexicon_priority_(self, a2, (uint64_t)a3, 0);
}

- (void)dealloc
{
  CFRelease(self->_lexicon);
  rootCursor = self->__rootCursor;
  if (rootCursor)
  {
    CFRelease(rootCursor);
    self->__rootCursor = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CVNLPDecodingLexicon;
  [(CVNLPDecodingLexicon *)&v4 dealloc];
}

+ (_LXLexicon)_createLexiconForLocale:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v7 = objc_msgSend_localeIdentifier(v3, v4, v5, v6, 0, *MEMORY[0x1E4F72458]);
  v13[0] = v7;
  v9 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v8, (uint64_t)v13, (uint64_t)&v12, 1);

  v10 = (_LXLexicon *)LXLexiconCreate();
  return v10;
}

+ (id)decodingLexiconForLocale:(id)a3
{
  id v3 = a3;
  objc_super v4 = objc_opt_class();
  LexiconForLocale = (const void *)objc_msgSend__createLexiconForLocale_(v4, v5, (uint64_t)v3, v6);
  if (LexiconForLocale)
  {
    objc_super v8 = [CVNLPDecodingLexicon alloc];
    v11 = objc_msgSend_initWithLexicon_(v8, v9, (uint64_t)LexiconForLocale, v10);
    CFRelease(LexiconForLocale);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)decodingLexiconForLocale:(id)a3 priority:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  LexiconForLocale = (const void *)objc_msgSend__createLexiconForLocale_(v6, v7, (uint64_t)v5, v8);
  if (LexiconForLocale)
  {
    uint64_t v10 = [CVNLPDecodingLexicon alloc];
    uint64_t v12 = objc_msgSend_initWithLexicon_priority_(v10, v11, (uint64_t)LexiconForLocale, a4);
    CFRelease(LexiconForLocale);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (_LXLexicon)lexicon
{
  return self->_lexicon;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (_LXCursor)_rootCursor
{
  return self->__rootCursor;
}

@end