@interface DOCDateParser
- (DOCDateParser)init;
- (id)parse:(id)a3;
- (void)dealloc;
@end

@implementation DOCDateParser

- (DOCDateParser)init
{
  v6.receiver = self;
  v6.super_class = (Class)DOCDateParser;
  v2 = [(DOCDateParser *)&v6 init];
  if (v2)
  {
    v3 = objc_opt_new();
    v2->_searchParser = (void *)NLSearchParserCreate();
    NLSearchParserSetContext();
    NLSearchParserSetIndex();
    v4 = v2;
  }
  return v2;
}

- (id)parse:(id)a3
{
  id v3 = a3;
  NLSearchParserSetString();
  v4 = (const void *)NLSearchParserCopyParseWithOptions();
  v5 = (void *)NLSearchParseCandidateCopyAttributedInput();
  CFRelease(v4);
  objc_super v6 = [v5 firstObject];
  v7 = (NSObject **)MEMORY[0x263F3AC88];
  v8 = *MEMORY[0x263F3AC88];
  if (!*MEMORY[0x263F3AC88])
  {
    DOCInitLogging();
    v8 = *v7;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    [(DOCDateParser *)(uint64_t)v3 parse:v8];
  }

  return v6;
}

- (void)dealloc
{
  searchParser = self->_searchParser;
  if (searchParser) {
    CFRelease(searchParser);
  }
  v4.receiver = self;
  v4.super_class = (Class)DOCDateParser;
  [(DOCDateParser *)&v4 dealloc];
}

- (void)parse:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = @"YES";
  if (a2) {
    id v3 = @"NO";
  }
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  v7 = v3;
  _os_log_debug_impl(&dword_222E2D000, log, OS_LOG_TYPE_DEBUG, "DOCDateParser: Did find an NLP annotation in the current input '%@': %@", (uint8_t *)&v4, 0x16u);
}

@end