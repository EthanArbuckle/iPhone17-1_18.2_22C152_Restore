@interface AXMSemanticText
- (AXMSemanticText)initWithText:(id)a3 locale:(id)a4;
- (BOOL)isSemanticallyComplete;
- (NSLocale)locale;
- (NSString)preprocessedText;
- (NSString)transformedSpeechText;
- (_NSRange)textRange;
- (id)makeCursor;
- (id)substringWithRange:(_NSRange)a3;
- (int64_t)tokenizedLength;
- (void)addCustomPattern:(id)a3 withRange:(_NSRange)a4;
- (void)addDataDetector:(id)a3 withRange:(_NSRange)a4;
- (void)addIsInLexionMarker:(BOOL)a3 withRange:(_NSRange)a4;
- (void)addNLPToken:(id)a3 withRange:(_NSRange)a4;
- (void)addNumericToken:(id)a3 withRange:(_NSRange)a4;
- (void)addSemanticErrorWithRange:(_NSRange)a3;
- (void)enumerateCustomPatterns:(id)a3;
- (void)enumerateDataDetectors:(id)a3;
- (void)enumerateLexiconMarkers:(id)a3;
- (void)enumerateNLPTokens:(id)a3;
- (void)enumerateNumericTokens:(id)a3;
- (void)enumerateSemanticErrors:(id)a3;
- (void)setLocale:(id)a3;
- (void)setTokenizedLength:(int64_t)a3;
- (void)setTransformedSpeechText:(id)a3;
@end

@implementation AXMSemanticText

- (AXMSemanticText)initWithText:(id)a3 locale:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AXMSemanticText;
  v8 = [(AXMSemanticText *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v6];
    text = v8->_text;
    v8->_text = (NSMutableAttributedString *)v9;

    objc_storeStrong((id *)&v8->_locale, a4);
  }

  return v8;
}

- (int64_t)tokenizedLength
{
  if (![(NSMutableAttributedString *)self->_text length]) {
    return 0;
  }
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F38908]) initWithUnit:0];
  v4 = [(NSMutableAttributedString *)self->_text string];
  [v3 setString:v4];

  v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [(NSMutableAttributedString *)self->_text length];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  objc_super v12 = __34__AXMSemanticText_tokenizedLength__block_invoke;
  v13 = &unk_1E6118148;
  v14 = self;
  id v15 = v5;
  id v7 = v5;
  objc_msgSend(v3, "enumerateTokensInRange:usingBlock:", 0, v6, &v10);
  int64_t v8 = objc_msgSend(v7, "count", v10, v11, v12, v13, v14);
  self->_tokenizedLength = v8;

  return v8;
}

void __34__AXMSemanticText_tokenizedLength__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 8) string];
  objc_msgSend(v6, "substringWithRange:", a2, a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 40) addObject:v7];
}

- (NSString)preprocessedText
{
  return (NSString *)[(NSMutableAttributedString *)self->_text string];
}

- (void)enumerateNLPTokens:(id)a3
{
  id v4 = a3;
  text = self->_text;
  uint64_t v6 = [(AXMSemanticText *)self textRange];
  uint64_t v8 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38__AXMSemanticText_enumerateNLPTokens___block_invoke;
  v10[3] = &unk_1E6118170;
  id v11 = v4;
  id v9 = v4;
  [(NSMutableAttributedString *)text enumerateAttribute:@"NLPToken", v6, v8, 0, v10 inRange options usingBlock];
}

uint64_t __38__AXMSemanticText_enumerateNLPTokens___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)enumerateLexiconMarkers:(id)a3
{
  id v4 = a3;
  text = self->_text;
  uint64_t v6 = [(AXMSemanticText *)self textRange];
  uint64_t v8 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__AXMSemanticText_enumerateLexiconMarkers___block_invoke;
  v10[3] = &unk_1E6118170;
  id v11 = v4;
  id v9 = v4;
  [(NSMutableAttributedString *)text enumerateAttribute:@"IsInLexicon", v6, v8, 0, v10 inRange options usingBlock];
}

uint64_t __43__AXMSemanticText_enumerateLexiconMarkers___block_invoke(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    uint64_t v6 = *(void *)(result + 32);
    uint64_t v7 = [a2 BOOLValue];
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 16);
    return v8(v6, v7, a3, a4);
  }
  return result;
}

- (void)enumerateNumericTokens:(id)a3
{
  id v4 = a3;
  text = self->_text;
  uint64_t v6 = [(AXMSemanticText *)self textRange];
  uint64_t v8 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__AXMSemanticText_enumerateNumericTokens___block_invoke;
  v10[3] = &unk_1E6118170;
  id v11 = v4;
  id v9 = v4;
  [(NSMutableAttributedString *)text enumerateAttribute:@"NumericToken", v6, v8, 0, v10 inRange options usingBlock];
}

uint64_t __42__AXMSemanticText_enumerateNumericTokens___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)enumerateDataDetectors:(id)a3
{
  id v4 = a3;
  text = self->_text;
  uint64_t v6 = [(AXMSemanticText *)self textRange];
  uint64_t v8 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__AXMSemanticText_enumerateDataDetectors___block_invoke;
  v10[3] = &unk_1E6118170;
  id v11 = v4;
  id v9 = v4;
  [(NSMutableAttributedString *)text enumerateAttribute:@"DataDetector", v6, v8, 0, v10 inRange options usingBlock];
}

uint64_t __42__AXMSemanticText_enumerateDataDetectors___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)enumerateCustomPatterns:(id)a3
{
  id v4 = a3;
  text = self->_text;
  uint64_t v6 = [(AXMSemanticText *)self textRange];
  uint64_t v8 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__AXMSemanticText_enumerateCustomPatterns___block_invoke;
  v10[3] = &unk_1E6118170;
  id v11 = v4;
  id v9 = v4;
  [(NSMutableAttributedString *)text enumerateAttribute:@"CustomPattern", v6, v8, 0, v10 inRange options usingBlock];
}

uint64_t __43__AXMSemanticText_enumerateCustomPatterns___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)enumerateSemanticErrors:(id)a3
{
  id v4 = a3;
  text = self->_text;
  uint64_t v6 = [(AXMSemanticText *)self textRange];
  uint64_t v8 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__AXMSemanticText_enumerateSemanticErrors___block_invoke;
  v10[3] = &unk_1E6118170;
  id v11 = v4;
  id v9 = v4;
  [(NSMutableAttributedString *)text enumerateAttribute:@"SemanticError", v6, v8, 0, v10 inRange options usingBlock];
}

uint64_t __43__AXMSemanticText_enumerateSemanticErrors___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 BOOLValue];
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v4();
  }
  return result;
}

- (BOOL)isSemanticallyComplete
{
  if (![(NSMutableAttributedString *)self->_text length]) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  text = self->_text;
  uint64_t v4 = [(AXMSemanticText *)self textRange];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__AXMSemanticText_isSemanticallyComplete__block_invoke;
  v8[3] = &unk_1E6118198;
  v8[4] = &v9;
  [(NSMutableAttributedString *)text enumerateAttribute:@"SemanticError", v4, v5, 0, v8 inRange options usingBlock];
  BOOL v6 = *((unsigned char *)v10 + 24) == 0;
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __41__AXMSemanticText_isSemanticallyComplete__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = [a2 BOOLValue];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

- (_NSRange)textRange
{
  v2 = [(NSMutableAttributedString *)self->_text string];
  uint64_t v3 = [v2 length];

  NSUInteger v4 = 0;
  NSUInteger v5 = v3;
  result.length = v5;
  result.location = v4;
  return result;
}

- (id)substringWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v5 = [(NSMutableAttributedString *)self->_text string];
  BOOL v6 = objc_msgSend(v5, "substringWithRange:", location, length);

  return v6;
}

- (void)addNLPToken:(id)a3 withRange:(_NSRange)a4
{
}

- (void)addDataDetector:(id)a3 withRange:(_NSRange)a4
{
}

- (void)addCustomPattern:(id)a3 withRange:(_NSRange)a4
{
}

- (void)addIsInLexionMarker:(BOOL)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  text = self->_text;
  id v7 = [NSNumber numberWithBool:a3];
  [(NSMutableAttributedString *)text addAttribute:@"IsInLexicon", v7, location, length value range];
}

- (void)addSemanticErrorWithRange:(_NSRange)a3
{
}

- (void)addNumericToken:(id)a3 withRange:(_NSRange)a4
{
}

- (id)makeCursor
{
  v2 = [[_AXMSemanticTextCursor alloc] initWithText:self->_text semanticText:self];

  return v2;
}

- (NSString)transformedSpeechText
{
  return self->_transformedSpeechText;
}

- (void)setTransformedSpeechText:(id)a3
{
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (void)setTokenizedLength:(int64_t)a3
{
  self->_tokenizedLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_transformedSpeechText, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end