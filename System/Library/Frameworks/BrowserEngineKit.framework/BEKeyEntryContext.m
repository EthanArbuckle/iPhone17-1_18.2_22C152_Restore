@interface BEKeyEntryContext
- (BEKeyEntry)keyEntry;
- (BEKeyEntryContext)initWithKeyEntry:(id)a3;
- (BOOL)isDocumentEditable;
- (BOOL)shouldEvaluateForInputSystemHandling;
- (BOOL)shouldInsertCharacter;
- (UIKeyEventContext)backingKeyEventContext;
- (id)_uikitKeyEventContext;
- (void)setDocumentEditable:(BOOL)a3;
- (void)setShouldEvaluateForInputSystemHandling:(BOOL)a3;
- (void)setShouldInsertCharacter:(BOOL)a3;
@end

@implementation BEKeyEntryContext

- (BEKeyEntryContext)initWithKeyEntry:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BEKeyEntryContext;
  v5 = [(BEKeyEntryContext *)&v11 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F82898]);
    v7 = [v4 _uikitKeyEvent];
    uint64_t v8 = [v6 initWithKeyEvent:v7];
    backingKeyEventContext = v5->_backingKeyEventContext;
    v5->_backingKeyEventContext = (UIKeyEventContext *)v8;
  }
  return v5;
}

- (id)_uikitKeyEventContext
{
  return self->_backingKeyEventContext;
}

- (void)setDocumentEditable:(BOOL)a3
{
}

- (void)setShouldInsertCharacter:(BOOL)a3
{
}

- (void)setShouldEvaluateForInputSystemHandling:(BOOL)a3
{
}

- (BEKeyEntry)keyEntry
{
  return self->_keyEntry;
}

- (BOOL)isDocumentEditable
{
  return self->_documentEditable;
}

- (BOOL)shouldInsertCharacter
{
  return self->_shouldInsertCharacter;
}

- (BOOL)shouldEvaluateForInputSystemHandling
{
  return self->_shouldEvaluateForInputSystemHandling;
}

- (UIKeyEventContext)backingKeyEventContext
{
  return self->_backingKeyEventContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingKeyEventContext, 0);

  objc_storeStrong((id *)&self->_keyEntry, 0);
}

@end