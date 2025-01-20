@interface HTMLToSuper_SPAN_Frame
- (void)parser:(id)a3 context:(id)a4 didEndElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7;
- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8;
@end

@implementation HTMLToSuper_SPAN_Frame

- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8
{
  id v15 = (id)IMCopyNormalizedAttributes(a8, 1, 0);
  id v10 = IMCreateDictionaryFromCSSString((void *)[v15 objectForKey:@"style"], 1);
  uint64_t v11 = [v10 objectForKey:@"font-family"];
  v12 = (void *)[v10 objectForKey:@"font-style"];
  v13 = (void *)[v10 objectForKey:@"font-weight"];
  v14 = (void *)[v10 objectForKey:@"text-decoration"];
  if (v11)
  {
    [a4 pushFontFamily:v11];
    self->_shouldPopFontFamily = 1;
  }
  if (v13
    && ([v13 rangeOfString:@"bold" options:1] != 0x7FFFFFFFFFFFFFFFLL
     || [v13 integerValue] >= 700))
  {
    [a4 incrementBoldCount];
    self->_shouldDecrementBoldCount = 1;
  }
  if (v12
    && ([v12 rangeOfString:@"italic" options:1] != 0x7FFFFFFFFFFFFFFFLL
     || [v12 rangeOfString:@"oblique" options:1] != 0x7FFFFFFFFFFFFFFFLL))
  {
    [a4 incrementItalicCount];
    self->_shouldDecrementItalicCount = 1;
  }
  if (v14)
  {
    if ([v14 rangeOfString:@"under" options:1] != 0x7FFFFFFFFFFFFFFFLL)
    {
      [a4 incrementUnderlineCount];
      self->_shouldDecrementUnderlineCount = 1;
    }
    if ([v14 rangeOfString:@"line-through" options:1] != 0x7FFFFFFFFFFFFFFFLL)
    {
      [a4 incrementStrikethroughCount];
      self->_shouldDecrementStrikeCount = 1;
    }
  }
}

- (void)parser:(id)a3 context:(id)a4 didEndElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7
{
  if (self->_shouldPopFontFamily) {
    objc_msgSend(a4, "popFontFamily", a3, a4, a5, a6, a7);
  }
  if (self->_shouldDecrementBoldCount) {
    objc_msgSend(a4, "decrementBoldCount", a3, a4, a5, a6, a7);
  }
  if (self->_shouldDecrementItalicCount) {
    objc_msgSend(a4, "decrementItalicCount", a3, a4, a5, a6, a7);
  }
  if (self->_shouldDecrementUnderlineCount) {
    objc_msgSend(a4, "decrementUnderlineCount", a3, a4, a5, a6, a7);
  }
  if (self->_shouldDecrementStrikeCount)
  {
    MEMORY[0x1F4181798](a4, sel_decrementStrikethroughCount);
  }
}

@end