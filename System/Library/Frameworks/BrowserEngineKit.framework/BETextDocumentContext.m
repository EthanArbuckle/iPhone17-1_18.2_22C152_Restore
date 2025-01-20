@interface BETextDocumentContext
- (BETextDocumentContext)initWithAttributedSelectedText:(id)a3 contextBefore:(id)a4 contextAfter:(id)a5 markedText:(id)a6 selectedRangeInMarkedText:(_NSRange)a7;
- (BETextDocumentContext)initWithSelectedText:(id)a3 contextBefore:(id)a4 contextAfter:(id)a5 markedText:(id)a6 selectedRangeInMarkedText:(_NSRange)a7;
- (NSArray)autocorrectedRanges;
- (id)_uikitDocumentContext;
- (id)annotatedText;
- (void)addTextRect:(CGRect)a3 forCharacterRange:(_NSRange)a4;
- (void)setAnnotatedText:(id)a3;
- (void)setAutocorrectedRanges:(id)a3;
@end

@implementation BETextDocumentContext

- (BETextDocumentContext)initWithSelectedText:(id)a3 contextBefore:(id)a4 contextAfter:(id)a5 markedText:(id)a6 selectedRangeInMarkedText:(_NSRange)a7
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v30.receiver = self;
  v30.super_class = (Class)BETextDocumentContext;
  v17 = [(BETextDocumentContext *)&v30 init];
  if (v17)
  {
    v18 = (objc_class *)MEMORY[0x263F82E60];
    id v19 = v13;
    id v20 = v14;
    NSUInteger v28 = length;
    id v29 = v13;
    id v21 = v15;
    NSUInteger v22 = location;
    id v23 = v16;
    id v24 = objc_alloc_init(v18);
    [v24 setSelectedText:v19];

    [v24 setContextBefore:v20];
    [v24 setContextAfter:v21];

    [v24 setMarkedText:v23];
    NSUInteger v25 = v22;
    id v13 = v29;
    objc_msgSend(v24, "setSelectedRangeInMarkedText:", v25, v28);
    backingContext = v17->_backingContext;
    v17->_backingContext = (UIWKDocumentContext *)v24;
  }
  return v17;
}

- (BETextDocumentContext)initWithAttributedSelectedText:(id)a3 contextBefore:(id)a4 contextAfter:(id)a5 markedText:(id)a6 selectedRangeInMarkedText:(_NSRange)a7
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v30.receiver = self;
  v30.super_class = (Class)BETextDocumentContext;
  v17 = [(BETextDocumentContext *)&v30 init];
  if (v17)
  {
    v18 = (objc_class *)MEMORY[0x263F82E60];
    id v19 = v13;
    id v20 = v14;
    NSUInteger v28 = length;
    id v29 = v13;
    id v21 = v15;
    NSUInteger v22 = location;
    id v23 = v16;
    id v24 = objc_alloc_init(v18);
    [v24 setSelectedText:v19];

    [v24 setContextBefore:v20];
    [v24 setContextAfter:v21];

    [v24 setMarkedText:v23];
    NSUInteger v25 = v22;
    id v13 = v29;
    objc_msgSend(v24, "setSelectedRangeInMarkedText:", v25, v28);
    backingContext = v17->_backingContext;
    v17->_backingContext = (UIWKDocumentContext *)v24;
  }
  return v17;
}

- (id)_uikitDocumentContext
{
  return self->_backingContext;
}

- (void)addTextRect:(CGRect)a3 forCharacterRange:(_NSRange)a4
{
}

- (void)setAutocorrectedRanges:(id)a3
{
}

- (void)setAnnotatedText:(id)a3
{
}

- (NSArray)autocorrectedRanges
{
  return (NSArray *)[(UIWKDocumentContext *)self->_backingContext autocorrectedRanges];
}

- (id)annotatedText
{
  return (id)[(UIWKDocumentContext *)self->_backingContext annotatedText];
}

- (void).cxx_destruct
{
}

@end