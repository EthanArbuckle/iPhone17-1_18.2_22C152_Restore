@interface _AXMSemanticTextCursor
- (BOOL)isCustomPattern;
- (BOOL)isDataDetector;
- (BOOL)isFinished;
- (BOOL)isInLexicon;
- (BOOL)isOtherWord;
- (BOOL)isProperNoun;
- (BOOL)isPunctuation;
- (BOOL)isSentenceTerminator;
- (BOOL)isWhitespace;
- (BOOL)processAttribute:(id)a3 getSubstring:(id *)a4 advanceCursor:(BOOL)a5 markAsSemanticError:(BOOL)a6 error:(id *)a7;
- (NSDictionary)currentAttributes;
- (_AXMSemanticTextCursor)initWithText:(id)a3 semanticText:(id)a4;
- (_NSRange)remainingRange;
- (void)advance;
- (void)markCurrentIndexAsSemanticErrorAndAdvanceCursor;
@end

@implementation _AXMSemanticTextCursor

- (_AXMSemanticTextCursor)initWithText:(id)a3 semanticText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_AXMSemanticTextCursor;
  v8 = [(_AXMSemanticTextCursor *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_text, v6);
    objc_storeWeak((id *)&v9->_semanticText, v7);
    v9->_currentIndex = 0;
    v9->_length = [v6 length];
  }

  return v9;
}

- (_NSRange)remainingRange
{
  if ([(_AXMSemanticTextCursor *)self isFinished])
  {
    NSUInteger v3 = 0;
    NSUInteger currentIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    NSUInteger currentIndex = self->_currentIndex;
    NSUInteger v3 = self->_length - currentIndex;
  }
  result.length = v3;
  result.location = currentIndex;
  return result;
}

- (BOOL)isFinished
{
  return self->_currentIndex >= self->_length;
}

- (void)advance
{
}

- (BOOL)processAttribute:(id)a3 getSubstring:(id *)a4 advanceCursor:(BOOL)a5 markAsSemanticError:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  v43[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_text);
  unint64_t currentIndex = self->_currentIndex;
  uint64_t v15 = [(_AXMSemanticTextCursor *)self remainingRange];
  v17 = objc_msgSend(WeakRetained, "attribute:atIndex:longestEffectiveRange:inRange:", v12, currentIndex, &v40, v15, v16);

  if (!v17)
  {
    v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F281F8];
    uint64_t v42 = *MEMORY[0x1E4F28578];
    v24 = NSString;
    v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_AXMSemanticTextCursor remainingRange](self, "remainingRange"));
    v26 = NSNumber;
    [(_AXMSemanticTextCursor *)self remainingRange];
    v28 = [v26 numberWithUnsignedInteger:v27];
    v29 = [v24 stringWithFormat:@"Failed to advance cursor. No value for attribute: %@. remaining:[%@ %@]", v12, v25, v28];
    v43[0] = v29;
    v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];
    v31 = [v22 errorWithDomain:v23 code:1 userInfo:v30];

    goto LABEL_13;
  }
  if (a4)
  {
    id v18 = objc_loadWeakRetained((id *)&self->_text);
    v19 = [v18 string];
    objc_msgSend(v19, "substringWithRange:", v40, v41);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    if ([v17 isEqual:@"DD:Address"])
    {
      id v20 = objc_loadWeakRetained((id *)&self->_semanticText);
      v39 = [v20 locale];
      v21 = [v39 localeIdentifier];
      if ([v21 isEqual:@"en_US"])
      {

LABEL_8:
        +[AXMAddressFormatter replaceDirectionalAbbreviations:a4];
        goto LABEL_9;
      }
      id v37 = objc_loadWeakRetained((id *)&self->_semanticText);
      v32 = [v37 locale];
      [v32 localeIdentifier];
      v33 = v38 = v20;
      int v36 = [v33 isEqual:@"en_CA"];

      if (v36) {
        goto LABEL_8;
      }
    }
  }
LABEL_9:
  if (v8)
  {
    id v34 = objc_loadWeakRetained((id *)&self->_semanticText);
    objc_msgSend(v34, "addSemanticErrorWithRange:", v40, v41);
  }
  v31 = 0;
  if (v9) {
    self->_currentIndex += v41;
  }
LABEL_13:
  if (a7) {
    *a7 = v31;
  }

  return v31 == 0;
}

- (void)markCurrentIndexAsSemanticErrorAndAdvanceCursor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_semanticText);
  objc_msgSend(WeakRetained, "addSemanticErrorWithRange:", self->_currentIndex, 1);

  [(_AXMSemanticTextCursor *)self advance];
}

- (NSDictionary)currentAttributes
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_text);
  v4 = [WeakRetained attributesAtIndex:self->_currentIndex effectiveRange:0];

  return (NSDictionary *)v4;
}

- (BOOL)isOtherWord
{
  v2 = [(_AXMSemanticTextCursor *)self currentAttributes];
  NSUInteger v3 = [v2 objectForKeyedSubscript:@"NLPToken"];
  BOOL v4 = v3 == @"NLP:OtherWord";

  return v4;
}

- (BOOL)isProperNoun
{
  v2 = [(_AXMSemanticTextCursor *)self currentAttributes];
  NSUInteger v3 = [v2 objectForKeyedSubscript:@"NLPToken"];

  BOOL v6 = v3 == @"NLP:PlaceName" || v3 == @"NLP:PersonalName" || v3 == @"NLP:OrganizationName";
  return v6;
}

- (BOOL)isWhitespace
{
  v2 = [(_AXMSemanticTextCursor *)self currentAttributes];
  NSUInteger v3 = [v2 objectForKeyedSubscript:@"NLPToken"];
  BOOL v4 = v3 == @"NLP:Whitespace";

  return v4;
}

- (BOOL)isPunctuation
{
  v2 = [(_AXMSemanticTextCursor *)self currentAttributes];
  NSUInteger v3 = [v2 objectForKeyedSubscript:@"NLPToken"];
  BOOL v4 = v3 == @"NLP:Punctuation";

  return v4;
}

- (BOOL)isSentenceTerminator
{
  v2 = [(_AXMSemanticTextCursor *)self currentAttributes];
  NSUInteger v3 = [v2 objectForKeyedSubscript:@"NLPToken"];
  BOOL v4 = v3 == @"NLP:SentenceTerminator";

  return v4;
}

- (BOOL)isInLexicon
{
  v2 = [(_AXMSemanticTextCursor *)self currentAttributes];
  NSUInteger v3 = [v2 objectForKeyedSubscript:@"IsInLexicon"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isCustomPattern
{
  v2 = [(_AXMSemanticTextCursor *)self currentAttributes];
  NSUInteger v3 = [v2 objectForKeyedSubscript:@"CustomPattern"];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isDataDetector
{
  v2 = [(_AXMSemanticTextCursor *)self currentAttributes];
  NSUInteger v3 = [v2 objectForKeyedSubscript:@"DataDetector"];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_semanticText);

  objc_destroyWeak((id *)&self->_text);
}

@end