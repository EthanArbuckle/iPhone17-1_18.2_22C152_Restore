@interface AXSSDocumentIssue
- (AXSSDocumentIssue)init;
- (AXSSDocumentNode)node;
- (BOOL)autoMatchSuggestionAttributes;
- (NSArray)suggestions;
- (NSAttributedString)offendingText;
- (NSString)note;
- (_NSRange)range;
- (id)description;
- (int64_t)severity;
- (unint64_t)kind;
- (void)_updateSuggestionStyleIfNeeded;
- (void)setAutoMatchSuggestionAttributes:(BOOL)a3;
- (void)setKind:(unint64_t)a3;
- (void)setNode:(id)a3;
- (void)setNote:(id)a3;
- (void)setOffendingText:(id)a3;
- (void)setRange:(_NSRange)a3;
- (void)setSeverity:(int64_t)a3;
- (void)setSuggestions:(id)a3;
@end

@implementation AXSSDocumentIssue

- (AXSSDocumentIssue)init
{
  v3.receiver = self;
  v3.super_class = (Class)AXSSDocumentIssue;
  result = [(AXSSDocumentIssue *)&v3 init];
  if (result) {
    result->_autoMatchSuggestionAttributes = 1;
  }
  return result;
}

- (id)description
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)AXSSDocumentIssue;
  objc_super v3 = [(AXSSDocumentIssue *)&v20 description];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(AXSSDocumentIssue *)self offendingText];
  v6 = [v5 string];
  v7 = AXDocumentConsoleString(v6);

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v8 = [(AXSSDocumentIssue *)self suggestions];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [*(id *)(*((void *)&v16 + 1) + 8 * i) string];
        v14 = AXDocumentConsoleString(v13);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v10);
  }

  [v4 appendString:@"}"];
  return v4;
}

- (void)_updateSuggestionStyleIfNeeded
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if ([(AXSSDocumentIssue *)self autoMatchSuggestionAttributes])
  {
    id v19 = [(AXSSDocumentIssue *)self suggestions];
    if ([v19 count])
    {
      objc_super v3 = [(AXSSDocumentIssue *)self offendingText];
      uint64_t v4 = [v3 length];

      if (v4)
      {
        v5 = [(AXSSDocumentIssue *)self offendingText];
        v6 = [v5 attributesAtIndex:0 effectiveRange:0];

        v7 = objc_opt_new();
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        objc_super v20 = self;
        v8 = [(AXSSDocumentIssue *)self suggestions];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v22;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v22 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
              id v14 = objc_alloc(MEMORY[0x263F086A0]);
              v15 = [v13 string];
              long long v16 = (void *)[v14 initWithString:v15 attributes:v6];

              if (v16) {
                [v7 addObject:v16];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
          }
          while (v10);
        }

        uint64_t v17 = [v7 copy];
        suggestions = v20->_suggestions;
        v20->_suggestions = (NSArray *)v17;
      }
    }
    else
    {
    }
  }
}

- (void)setSuggestions:(id)a3
{
  uint64_t v4 = (NSArray *)[a3 copy];
  suggestions = self->_suggestions;
  self->_suggestions = v4;

  [(AXSSDocumentIssue *)self _updateSuggestionStyleIfNeeded];
}

- (void)setOffendingText:(id)a3
{
  uint64_t v4 = (NSAttributedString *)[a3 copy];
  offendingText = self->_offendingText;
  self->_offendingText = v4;

  [(AXSSDocumentIssue *)self _updateSuggestionStyleIfNeeded];
}

- (AXSSDocumentNode)node
{
  return self->_node;
}

- (void)setNode:(id)a3
{
}

- (NSAttributedString)offendingText
{
  return self->_offendingText;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (NSString)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
}

- (int64_t)severity
{
  return self->_severity;
}

- (void)setSeverity:(int64_t)a3
{
  self->_severity = a3;
}

- (unint64_t)kind
{
  return self->_kind;
}

- (void)setKind:(unint64_t)a3
{
  self->_kind = a3;
}

- (BOOL)autoMatchSuggestionAttributes
{
  return self->_autoMatchSuggestionAttributes;
}

- (void)setAutoMatchSuggestionAttributes:(BOOL)a3
{
  self->_autoMatchSuggestionAttributes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_offendingText, 0);
  objc_storeStrong((id *)&self->_node, 0);
}

@end