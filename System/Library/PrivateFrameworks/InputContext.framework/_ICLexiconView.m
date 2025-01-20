@interface _ICLexiconView
- (BOOL)contains:(id)a3;
- (NSString)name;
- (_ICLexiconView)initWithName:(id)a3 typeFlags:(unsigned __int8)a4;
- (_LXEntry)copyEntryForString:(id)a3;
- (_LXLexicon)getLexiconImplementation;
- (id)getSortKeyEquivalents:(id)a3;
- (unsigned)typeFlags;
- (void)dealloc;
@end

@implementation _ICLexiconView

- (void)dealloc
{
  CFRelease(self->_lexicon);
  v3.receiver = self;
  v3.super_class = (Class)_ICLexiconView;
  [(_ICLexiconView *)&v3 dealloc];
}

- (_ICLexiconView)initWithName:(id)a3 typeFlags:(unsigned __int8)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_ICLexiconView;
  v8 = [(_ICLexiconView *)&v14 init];
  v9 = v8;
  if (v8
    && (objc_storeStrong((id *)&v8->_name, a3),
        v9->_typeFlags = a4,
        uint64_t View = LXLexiconRepositoryCreateView(),
        (v9->_lexicon = (_LXLexicon *)View) == 0))
  {
    v12 = _ICPersNamedEntityOSLogFacility();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[_ICLexiconView initWithName:typeFlags:]((uint64_t)v7, v12);
    }

    v11 = 0;
  }
  else
  {
    v11 = v9;
  }

  return v11;
}

- (BOOL)contains:(id)a3
{
  return +[_ICLexiconUtilities lexiconContainsEntry:self->_lexicon forString:a3];
}

- (id)getSortKeyEquivalents:(id)a3
{
  return +[_ICLexiconUtilities sortKeyEquivalents:self->_lexicon forString:a3];
}

- (_LXEntry)copyEntryForString:(id)a3
{
  return +[_ICLexiconUtilities copyEntry:self->_lexicon forString:a3];
}

- (_LXLexicon)getLexiconImplementation
{
  return self->_lexicon;
}

- (unsigned)typeFlags
{
  return self->_typeFlags;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

- (void)initWithName:(uint64_t)a1 typeFlags:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_235496000, a2, OS_LOG_TYPE_ERROR, "Error creating lexicon view (name = %@)", (uint8_t *)&v2, 0xCu);
}

@end