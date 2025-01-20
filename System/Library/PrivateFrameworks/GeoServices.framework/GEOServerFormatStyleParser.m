@interface GEOServerFormatStyleParser
- (BOOL)_handleClosingResult:(id)a3;
- (BOOL)_handleOpeningResult:(id)a3;
- (GEOServerFormatStyleParser)init;
- (GEOServerFormatStyleParser)initWithString:(id)a3;
- (NSArray)styles;
- (NSArray)tokenRanges;
- (_NSRange)rangeForStyleAtIndex:(unint64_t)a3;
- (id)attributedStringWithStyleAttributes:(id)a3 defaultAttributes:(id)a4;
- (void)_parse;
- (void)_parseIfNeeded;
- (void)_removeTokensFromAttributedString:(id)a3;
- (void)enumerateStylesWithBlock:(id)a3;
- (void)enumerateTokenRangesForRemoval:(id)a3;
@end

@implementation GEOServerFormatStyleParser

- (GEOServerFormatStyleParser)init
{
  result = (GEOServerFormatStyleParser *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOServerFormatStyleParser)initWithString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOServerFormatStyleParser;
  v5 = [(GEOServerFormatStyleParser *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    string = v5->_string;
    v5->_string = (NSString *)v6;
  }
  return v5;
}

- (NSArray)styles
{
  [(GEOServerFormatStyleParser *)self _parseIfNeeded];
  v3 = (void *)[(NSMutableArray *)self->_styleNames copy];
  id v4 = v3;
  if (!v3) {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v5 = v3;

  return v5;
}

- (_NSRange)rangeForStyleAtIndex:(unint64_t)a3
{
  [(GEOServerFormatStyleParser *)self _parseIfNeeded];
  if ([(NSMutableArray *)self->_styleRanges count] <= a3)
  {
    NSUInteger v9 = 0x7FFFFFFFFFFFFFFFLL;
    NSUInteger v10 = 0;
  }
  else
  {
    v5 = [(NSMutableArray *)self->_styleRanges objectAtIndexedSubscript:a3];
    uint64_t v6 = [v5 rangeValue];
    NSUInteger v8 = v7;

    NSUInteger v9 = v6;
    NSUInteger v10 = v8;
  }
  result.length = v10;
  result.location = v9;
  return result;
}

- (void)enumerateStylesWithBlock:(id)a3
{
  id v4 = a3;
  [(GEOServerFormatStyleParser *)self _parseIfNeeded];
  v5 = [(GEOServerFormatStyleParser *)self styles];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__GEOServerFormatStyleParser_enumerateStylesWithBlock___block_invoke;
  v7[3] = &unk_1E53E15D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __55__GEOServerFormatStyleParser_enumerateStylesWithBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) rangeForStyleAtIndex:a3] != 0x7FFFFFFFFFFFFFFFLL) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (NSArray)tokenRanges
{
  [(GEOServerFormatStyleParser *)self _parseIfNeeded];
  v3 = (void *)[(NSMutableArray *)self->_tokenRanges copy];
  id v4 = v3;
  if (!v3) {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v3;

  return v5;
}

- (void)enumerateTokenRangesForRemoval:(id)a3
{
  id v4 = a3;
  id v5 = [(GEOServerFormatStyleParser *)self tokenRanges];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__GEOServerFormatStyleParser_enumerateTokenRangesForRemoval___block_invoke;
  v7[3] = &unk_1E53E1600;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsWithOptions:2 usingBlock:v7];
}

uint64_t __61__GEOServerFormatStyleParser_enumerateTokenRangesForRemoval___block_invoke(uint64_t a1, void *a2)
{
  [a2 rangeValue];
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

- (id)attributedStringWithStyleAttributes:(id)a3 defaultAttributes:(id)a4
{
  id v6 = a3;
  NSUInteger v7 = (objc_class *)MEMORY[0x1E4F28E48];
  id v8 = a4;
  NSUInteger v9 = (void *)[[v7 alloc] initWithString:self->_string attributes:v8];

  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __84__GEOServerFormatStyleParser_attributedStringWithStyleAttributes_defaultAttributes___block_invoke;
  v17 = &unk_1E53E1628;
  id v18 = v6;
  id v19 = v9;
  id v10 = v9;
  id v11 = v6;
  [(GEOServerFormatStyleParser *)self enumerateStylesWithBlock:&v14];
  -[GEOServerFormatStyleParser _removeTokensFromAttributedString:](self, "_removeTokensFromAttributedString:", v10, v14, v15, v16, v17);
  v12 = (void *)[v10 copy];

  return v12;
}

void __84__GEOServerFormatStyleParser_attributedStringWithStyleAttributes_defaultAttributes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSUInteger v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (v7)
  {
    id v8 = v7;
    objc_msgSend(*(id *)(a1 + 40), "addAttributes:range:", v7, a3, a4);
    NSUInteger v7 = v8;
  }
}

- (void)_parseIfNeeded
{
  if (!self->_parsed) {
    [(GEOServerFormatStyleParser *)self _parse];
  }
}

- (void)_parse
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (qword_1EB29FA18 != -1) {
    dispatch_once(&qword_1EB29FA18, &__block_literal_global_76);
  }
  objc_msgSend((id)_MergedGlobals_230, "matchesInString:options:range:", self->_string, 0, 0, -[NSString length](self->_string, "length"));
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  results = self->_results;
  self->_results = v3;

  id v5 = GEOGetFormatStyleParserLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    NSUInteger v6 = [(NSArray *)self->_results count];
    string = self->_string;
    *(_DWORD *)buf = 134218243;
    NSUInteger v33 = v6;
    __int16 v34 = 2113;
    v35 = string;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "Found %lu tokens in string: %{private}@", buf, 0x16u);
  }

  id v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  styleNames = self->_styleNames;
  self->_styleNames = v8;

  id v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  styleRanges = self->_styleRanges;
  self->_styleRanges = v10;

  v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  tokenRanges = self->_tokenRanges;
  self->_tokenRanges = v12;

  uint64_t v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  openStyleNames = self->_openStyleNames;
  self->_openStyleNames = v14;

  v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  openStyleLocations = self->_openStyleLocations;
  self->_openStyleLocations = v16;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v18 = self->_results;
  uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        if (!-[GEOServerFormatStyleParser _handleOpeningResult:](self, "_handleOpeningResult:", v23, (void)v27)
          && ![(GEOServerFormatStyleParser *)self _handleClosingResult:v23])
        {
          v24 = GEOGetFormatStyleParserLog();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_188D96000, v24, OS_LOG_TYPE_ERROR, "Received parsing result, but no opening or closing token found within", buf, 2u);
          }
        }
      }
      uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v20);
  }

  v25 = self->_openStyleNames;
  self->_openStyleNames = 0;

  v26 = self->_openStyleLocations;
  self->_openStyleLocations = 0;

  self->_parsed = 1;
}

void __36__GEOServerFormatStyleParser__parse__block_invoke()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = 0;
  uint64_t v0 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"(\\{s:(\\w+)\\})|(\\{\\/s:(\\w+)\\})" options:0 error:&v4];
  id v1 = v4;
  v2 = (void *)_MergedGlobals_230;
  _MergedGlobals_230 = v0;

  if (!_MergedGlobals_230)
  {
    v3 = GEOGetFormatStyleParserLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      NSUInteger v6 = @"(\\{s:(\\w+)\\})|(\\{\\/s:(\\w+)\\})";
      __int16 v7 = 2112;
      id v8 = v1;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_ERROR, "Couldn't create regex for pattern \"%@\", error: %@", buf, 0x16u);
    }
  }
}

- (BOOL)_handleOpeningResult:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 rangeAtIndex:1];
  uint64_t v6 = [v4 rangeAtIndex:2];
  BOOL v8 = v5 == 0x7FFFFFFFFFFFFFFFLL || v6 == 0x7FFFFFFFFFFFFFFFLL;
  BOOL v9 = !v8;
  if (!v8)
  {
    id v10 = -[NSString substringWithRange:](self->_string, "substringWithRange:", v6, v7);
    [(NSMutableArray *)self->_openStyleNames addObject:v10];
    uint64_t v11 = [v4 range];
    uint64_t v13 = v12;
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v11, v12);
    [(NSMutableArray *)self->_tokenRanges addObject:v14];
    openStyleLocations = self->_openStyleLocations;
    v16 = [NSNumber numberWithUnsignedInteger:v11 + v13];
    [(NSMutableArray *)openStyleLocations addObject:v16];

    v17 = GEOGetFormatStyleParserLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v25.location = [v4 range];
      id v18 = NSStringFromRange(v25);
      int v20 = 138412546;
      uint64_t v21 = v10;
      __int16 v22 = 2112;
      uint64_t v23 = v18;
      _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_DEBUG, " {start style \"%@\" %@}", (uint8_t *)&v20, 0x16u);
    }
  }

  return v9;
}

- (BOOL)_handleClosingResult:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 rangeAtIndex:3];
  uint64_t v6 = [v4 rangeAtIndex:4];
  BOOL v8 = 0;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = v6;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = v7;
      uint64_t v11 = [v4 range];
      tokenRanges = self->_tokenRanges;
      uint64_t v14 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v11, v13);
      [(NSMutableArray *)tokenRanges addObject:v14];

      uint64_t v15 = -[NSString substringWithRange:](self->_string, "substringWithRange:", v9, v10);
      openStyleNames = self->_openStyleNames;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __51__GEOServerFormatStyleParser__handleClosingResult___block_invoke;
      v30[3] = &unk_1E53E1650;
      id v17 = v15;
      id v31 = v17;
      uint64_t v18 = [(NSMutableArray *)openStyleNames indexOfObjectWithOptions:2 passingTest:v30];
      if (v18 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v19 = GEOGetFormatStyleParserLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v39.location = [v4 range];
          int v20 = NSStringFromRange(v39);
          *(_DWORD *)buf = 138412546;
          id v33 = v17;
          __int16 v34 = 2112;
          v35 = v20;
          uint64_t v21 = "Found closing token for \"%@\" at %@ before any opening token";
LABEL_12:
          _os_log_impl(&dword_188D96000, v19, OS_LOG_TYPE_ERROR, v21, buf, 0x16u);
        }
      }
      else
      {
        unint64_t v22 = v18;
        [(NSMutableArray *)self->_openStyleNames removeObjectAtIndex:v18];
        if (v22 < [(NSMutableArray *)self->_openStyleLocations count])
        {
          [(NSMutableArray *)self->_styleNames insertObject:v17 atIndex:0];
          uint64_t v19 = [(NSMutableArray *)self->_openStyleLocations objectAtIndexedSubscript:v22];
          [(NSMutableArray *)self->_openStyleLocations removeObjectAtIndex:v22];
          NSUInteger v23 = [v19 unsignedIntegerValue];
          NSUInteger v24 = v11 - v23;
          NSRange v25 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v23, v11 - v23);
          [(NSMutableArray *)self->_styleRanges insertObject:v25 atIndex:0];
          v26 = GEOGetFormatStyleParserLog();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            v40.location = [v4 range];
            long long v27 = NSStringFromRange(v40);
            v41.location = v23;
            v41.length = v24;
            long long v28 = NSStringFromRange(v41);
            *(_DWORD *)buf = 138412802;
            id v33 = v17;
            __int16 v34 = 2112;
            v35 = v27;
            __int16 v36 = 2112;
            v37 = v28;
            _os_log_impl(&dword_188D96000, v26, OS_LOG_TYPE_DEBUG, " {end style \"%@\" %@, range: %@}", buf, 0x20u);
          }
          BOOL v8 = 1;
          goto LABEL_14;
        }
        uint64_t v19 = GEOGetFormatStyleParserLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v42.location = [v4 range];
          int v20 = NSStringFromRange(v42);
          *(_DWORD *)buf = 138412546;
          id v33 = v17;
          __int16 v34 = 2112;
          v35 = v20;
          uint64_t v21 = "Found closing token for \"%@\" at %@ but no opening range";
          goto LABEL_12;
        }
      }
      BOOL v8 = 0;
LABEL_14:
    }
  }

  return v8;
}

uint64_t __51__GEOServerFormatStyleParser__handleClosingResult___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isEqualToString:*(void *)(a1 + 32)];
  if (result) {
    *a4 = 1;
  }
  return result;
}

- (void)_removeTokensFromAttributedString:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(GEOServerFormatStyleParser *)self _parseIfNeeded];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __64__GEOServerFormatStyleParser__removeTokensFromAttributedString___block_invoke;
    v5[3] = &unk_1E53E1678;
    id v6 = v4;
    [(GEOServerFormatStyleParser *)self enumerateTokenRangesForRemoval:v5];
  }
}

uint64_t __64__GEOServerFormatStyleParser__removeTokensFromAttributedString___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteCharactersInRange:", a2, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openStyleLocations, 0);
  objc_storeStrong((id *)&self->_openStyleNames, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_tokenRanges, 0);
  objc_storeStrong((id *)&self->_styleRanges, 0);
  objc_storeStrong((id *)&self->_styleNames, 0);

  objc_storeStrong((id *)&self->_string, 0);
}

@end