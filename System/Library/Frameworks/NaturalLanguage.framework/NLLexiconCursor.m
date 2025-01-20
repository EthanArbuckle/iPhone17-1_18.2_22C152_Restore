@interface NLLexiconCursor
- (BOOL)hasChildren;
- (BOOL)hasEntries;
- (NLLexiconCursor)initWithLexicon:(id)a3 cursor:(_LXCursor *)a4;
- (NLLexiconCursor)initWithLexicon:(id)a3 string:(id)a4;
- (NSString)traversedString;
- (double)prefixProbability;
- (double)terminationProbability;
- (id)cursorByAdvancingWithString:(id)a3;
- (void)_enumerateEntriesUsingBlock:(id)a3;
- (void)dealloc;
- (void)enumerateChildrenUsingBlock:(id)a3;
- (void)enumerateCompletionsUsingBlock:(id)a3;
- (void)enumerateEntriesUsingBlock:(id)a3;
@end

@implementation NLLexiconCursor

- (NLLexiconCursor)initWithLexicon:(id)a3 cursor:(_LXCursor *)a4
{
  id v7 = a3;
  v8 = 0;
  if (v7 && a4)
  {
    v12.receiver = self;
    v12.super_class = (Class)NLLexiconCursor;
    v9 = [(NLLexiconCursor *)&v12 init];
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_lexicon, a3);
      v10->_cursor = (_LXCursor *)CFRetain(a4);
    }
    self = v10;
    v8 = self;
  }

  return v8;
}

- (NLLexiconCursor)initWithLexicon:(id)a3 string:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 lexicon])
  {
    RootCursor = (const void *)LXLexiconCreateRootCursor();
    if ([v7 length] && RootCursor)
    {
      uint64_t v9 = LXCursorCreateByAdvancing();
      CFRelease(RootCursor);
      RootCursor = (const void *)v9;
    }
  }
  else
  {
    RootCursor = 0;
  }
  v10 = [(NLLexiconCursor *)self initWithLexicon:v6 cursor:RootCursor];
  if (RootCursor) {
    CFRelease(RootCursor);
  }

  return v10;
}

- (void)dealloc
{
  cursor = self->_cursor;
  if (cursor) {
    CFRelease(cursor);
  }
  v4.receiver = self;
  v4.super_class = (Class)NLLexiconCursor;
  [(NLLexiconCursor *)&v4 dealloc];
}

- (id)cursorByAdvancingWithString:(id)a3
{
  id v4 = a3;
  if ([v4 length] && self->_cursor && (uint64_t v5 = LXCursorCreateByAdvancing()) != 0)
  {
    id v6 = (const void *)v5;
    id v7 = [[NLLexiconCursor alloc] initWithLexicon:self->_lexicon cursor:v5];
    CFRelease(v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)hasEntries
{
  cursor = self->_cursor;
  if (cursor) {
    LOBYTE(cursor) = LXCursorHasEntries() != 0;
  }
  return (char)cursor;
}

- (BOOL)hasChildren
{
  cursor = self->_cursor;
  if (cursor) {
    LOBYTE(cursor) = LXCursorHasChildren() != 0;
  }
  return (char)cursor;
}

- (double)prefixProbability
{
  cursor = self->_cursor;
  if (!cursor) {
    return -30.0;
  }
  MEMORY[0x1F412A670](cursor, a2);
  return result;
}

- (double)terminationProbability
{
  cursor = self->_cursor;
  if (!cursor) {
    return -30.0;
  }
  MEMORY[0x1F412A680](cursor, a2);
  return result;
}

- (NSString)traversedString
{
  if (self->_cursor) {
    v2 = (__CFString *)LXCursorCopyTraversedCharacters();
  }
  else {
    v2 = &stru_1EFB303D0;
  }

  return (NSString *)v2;
}

- (void)enumerateChildrenUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_cursor)
  {
    id v6 = v4;
    LXCursorEnumerateChildren();
  }
}

void __47__NLLexiconCursor_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [[NLLexiconCursor alloc] initWithLexicon:*(void *)(*(void *)(a1 + 32) + 8) cursor:a2];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_enumerateEntriesUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_cursor)
  {
    id v6 = v4;
    LXCursorEnumerateEntries();
  }
}

void __47__NLLexiconCursor__enumerateEntriesUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = LXEntryCopyString();
  if (v2)
  {
    v3 = (const void *)v2;
    LXEntryGetTokenID();
    LXEntryGetMetaFlags();
    LXEntryGetProbability();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    CFRelease(v3);
  }
}

- (void)enumerateEntriesUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__NLLexiconCursor_enumerateEntriesUsingBlock___block_invoke;
  v6[3] = &unk_1E5C539E0;
  id v7 = v4;
  id v5 = v4;
  [(NLLexiconCursor *)self _enumerateEntriesUsingBlock:v6];
}

void __46__NLLexiconCursor_enumerateEntriesUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = +[NLLexiconEntry entryWithString:tokenID:flags:probability:](NLLexiconEntry, "entryWithString:tokenID:flags:probability:", a2, a3, a4);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateCompletionsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_cursor)
  {
    id v6 = v4;
    LXCursorEnumerateEntriesRecursively();
  }
}

void __50__NLLexiconCursor_enumerateCompletionsUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = LXEntryCopyString();
  if (v2)
  {
    v3 = (const void *)v2;
    uint64_t TokenID = LXEntryGetTokenID();
    unsigned int MetaFlags = LXEntryGetMetaFlags();
    LXEntryGetProbability();
    id v6 = +[NLLexiconEntry entryWithString:tokenID:flags:probability:](NLLexiconEntry, "entryWithString:tokenID:flags:probability:", v3, TokenID, MetaFlags);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    CFRelease(v3);
  }
}

- (void).cxx_destruct
{
}

@end