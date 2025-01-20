@interface IKJSViewModelLink
- (IKDOMDocument)document;
- (IKJSViewModelLink)init;
- (IKJSViewModelLinkDelegate)delegate;
- (NSDictionary)responseDictionary;
- (id)asPrivateIKJSViewModelLink;
- (void)_unhandled;
- (void)cancel;
- (void)close:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setDocument:(id)a3;
- (void)setResponseDictionary:(id)a3;
@end

@implementation IKJSViewModelLink

- (id)asPrivateIKJSViewModelLink
{
  if ([(IKJSViewModelLink *)self conformsToProtocol:&unk_1F3E54AA8]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (IKJSViewModelLink)init
{
  v3 = +[IKAppContext currentAppContext];
  v6.receiver = self;
  v6.super_class = (Class)IKJSViewModelLink;
  v4 = [(IKJSObject *)&v6 initWithAppContext:v3];

  return v4;
}

- (void)dealloc
{
  if (!self->_isClosed) {
    [(IKJSViewModelLink *)self _unhandled];
  }
  v3.receiver = self;
  v3.super_class = (Class)IKJSViewModelLink;
  [(IKJSViewModelLink *)&v3 dealloc];
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v9 = a3;
  id v5 = objc_storeWeak((id *)p_delegate, v9);
  char v6 = objc_opt_respondsToSelector();

  p_delegateFlags = &self->_delegateFlags;
  self->_delegateFlags.hasDocumentDidChange = v6 & 1;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  p_delegateFlags->hasResponseDictionaryDidChange = objc_opt_respondsToSelector() & 1;
}

- (void)cancel
{
  self->_isClosed = 1;
  [(IKJSEventListenerObject *)self invokeListeners:@"cancel" extraInfo:0];
}

- (void)setResponseDictionary:(id)a3
{
  if (!self->_isClosed)
  {
    v4 = (NSDictionary *)[a3 copy];
    responseDictionary = self->_responseDictionary;
    self->_responseDictionary = v4;

    if (self->_delegateFlags.hasResponseDictionaryDidChange)
    {
      id v6 = [(IKJSViewModelLink *)self delegate];
      [v6 responseDictionaryDidChangeForViewModelLink:self];
    }
  }
}

- (void)setDocument:(id)a3
{
  id v5 = a3;
  if (!self->_isClosed)
  {
    id v12 = v5;
    id v6 = [MEMORY[0x1E4F30920] currentContext];
    v7 = v6;
    p_document = &self->_document;
    if (self->_document)
    {
      id v9 = [v6 virtualMachine];
      [v9 removeManagedReference:*p_document withOwner:self];
    }
    objc_storeStrong((id *)&self->_document, a3);
    if (*p_document)
    {
      v10 = [v7 virtualMachine];
      [v10 addManagedReference:*p_document withOwner:self];
    }
    if (self->_delegateFlags.hasDocumentDidChange)
    {
      v11 = [(IKJSViewModelLink *)self delegate];
      [v11 documentDidChangeForViewModelLink:self];
    }
    id v5 = v12;
  }
}

- (void)close:(id)a3
{
  id v4 = a3;
  if (!self->_isClosed)
  {
    self->_isClosed = 1;
    id v5 = [(IKJSObject *)self appContext];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __27__IKJSViewModelLink_close___block_invoke;
    v6[3] = &unk_1E6DE4238;
    v6[4] = self;
    id v7 = v4;
    [v5 addPostEvaluateBlock:v6];
  }
}

void __27__IKJSViewModelLink_close___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 didCloseViewModelLink:*(void *)(a1 + 32) withErrorDictionary:*(void *)(a1 + 40)];
}

- (void)_unhandled
{
  id v3 = [(IKJSViewModelLink *)self delegate];
  [v3 didCloseViewModelLink:self withErrorDictionary:&unk_1F3E3E0A0];
}

- (IKDOMDocument)document
{
  return self->_document;
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (IKJSViewModelLinkDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (IKJSViewModelLinkDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
  objc_storeStrong((id *)&self->_document, 0);
}

@end