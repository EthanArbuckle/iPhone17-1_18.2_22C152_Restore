@interface IKJSNavigationDocument
- (IKAppNavigationController)navigationControllerDelegate;
- (IKJSNavigationDocument)initWithAppContext:(id)a3 navigationController:(id)a4;
- (NSArray)documents;
- (NSString)OPTION_RETAIN_CONTEXT;
- (id)_makeAppDocumentWithDocument:(id)a3;
- (void)_migrateMediaControllerFromDocument:(id)a3 toDocument:(id)a4;
- (void)clear;
- (void)dismissModal;
- (void)insertBeforeDocument:(id)a3 :(id)a4 :(id)a5;
- (void)popDocument;
- (void)popToDocument:(id)a3;
- (void)popToRootDocument;
- (void)presentModal:(id)a3 :(id)a4;
- (void)pushDocument:(id)a3 :(id)a4;
- (void)removeDocument:(id)a3;
- (void)replaceDocument:(id)a3 :(id)a4 :(id)a5;
- (void)setDocuments:(id)a3 :(id)a4;
@end

@implementation IKJSNavigationDocument

- (IKJSNavigationDocument)initWithAppContext:(id)a3 navigationController:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)IKJSNavigationDocument;
  v7 = [(IKJSObject *)&v10 initWithAppContext:a3];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_navigationControllerDelegate, v6);
    v8->_delegateSelectors.hasClear = objc_opt_respondsToSelector() & 1;
    v8->_delegateSelectors.hasSetDocuments = objc_opt_respondsToSelector() & 1;
    v8->_delegateSelectors.hasPresentModal = objc_opt_respondsToSelector() & 1;
    v8->_delegateSelectors.hasDismissModal = objc_opt_respondsToSelector() & 1;
  }

  return v8;
}

- (NSArray)documents
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  objc_super v10 = __Block_byref_object_copy__25;
  v11 = __Block_byref_object_dispose__25;
  id v12 = 0;
  v3 = [(IKJSObject *)self appContext];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__IKJSNavigationDocument_documents__block_invoke;
  v6[3] = &unk_1E6DE3860;
  v6[4] = self;
  v6[5] = &v7;
  [v3 evaluateDelegateBlockSync:v6];

  v4 = [(id)v8[5] valueForKey:@"jsDocument"];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __35__IKJSNavigationDocument_documents__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) navigationControllerDelegate];
  uint64_t v2 = [v5 documents];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setDocuments:(id)a3 :(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_delegateSelectors.hasSetDocuments)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [(IKJSNavigationDocument *)self _makeAppDocumentWithDocument:*(void *)(*((void *)&v20 + 1) + 8 * v13)];
          [v8 addObject:v14];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    v15 = [(IKJSObject *)self appContext];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __40__IKJSNavigationDocument_setDocuments::__block_invoke;
    v17[3] = &unk_1E6DE4378;
    v17[4] = self;
    id v18 = v8;
    id v19 = v7;
    id v16 = v8;
    [v15 evaluateDelegateBlockSync:v17];
  }
}

void __40__IKJSNavigationDocument_setDocuments::__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationControllerDelegate];
  [v2 setDocuments:*(void *)(a1 + 40) options:*(void *)(a1 + 48)];
}

- (void)pushDocument:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  kdebug_trace();
  id v8 = [v7 objectForKey:@"TransitionOptionRetainContext"];
  int v9 = [v8 BOOLValue];

  if (v9)
  {
    uint64_t v10 = [(IKJSNavigationDocument *)self documents];
    uint64_t v11 = [v10 lastObject];
    [(IKJSNavigationDocument *)self _migrateMediaControllerFromDocument:v11 toDocument:v6];
  }
  uint64_t v12 = [(IKJSNavigationDocument *)self _makeAppDocumentWithDocument:v6];
  uint64_t v13 = [(IKJSObject *)self appContext];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __40__IKJSNavigationDocument_pushDocument::__block_invoke;
  v16[3] = &unk_1E6DE4378;
  v16[4] = self;
  id v17 = v12;
  id v18 = v7;
  id v14 = v7;
  id v15 = v12;
  [v13 evaluateDelegateBlockSync:v16];
}

void __40__IKJSNavigationDocument_pushDocument::__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationControllerDelegate];
  [v2 pushDocument:*(void *)(a1 + 40) options:*(void *)(a1 + 48)];
}

- (void)presentModal:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_delegateSelectors.hasPresentModal)
  {
    int v9 = [v7 objectForKey:@"TransitionOptionRetainContext"];
    int v10 = [v9 BOOLValue];

    if (v10)
    {
      uint64_t v11 = [(IKJSNavigationDocument *)self documents];
      uint64_t v12 = [v11 lastObject];
      [(IKJSNavigationDocument *)self _migrateMediaControllerFromDocument:v12 toDocument:v6];
    }
    uint64_t v13 = [(IKJSNavigationDocument *)self _makeAppDocumentWithDocument:v6];
    id v14 = [(IKJSObject *)self appContext];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __40__IKJSNavigationDocument_presentModal::__block_invoke;
    v16[3] = &unk_1E6DE4378;
    v16[4] = self;
    id v17 = v13;
    id v18 = v8;
    id v15 = v13;
    [v14 evaluateDelegateBlockSync:v16];
  }
}

void __40__IKJSNavigationDocument_presentModal::__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationControllerDelegate];
  [v2 presentModal:*(void *)(a1 + 40) options:*(void *)(a1 + 48)];
}

- (void)dismissModal
{
  if (self->_delegateSelectors.hasDismissModal)
  {
    uint64_t v3 = [(IKJSObject *)self appContext];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __38__IKJSNavigationDocument_dismissModal__block_invoke;
    v4[3] = &unk_1E6DE42D8;
    v4[4] = self;
    [v3 evaluateDelegateBlockSync:v4];
  }
}

void __38__IKJSNavigationDocument_dismissModal__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) navigationControllerDelegate];
  [v1 dismissModal];
}

- (void)insertBeforeDocument:(id)a3 :(id)a4 :(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v9)
  {
    uint64_t v12 = [v10 objectForKey:@"TransitionOptionRetainContext"];
    int v13 = [v12 BOOLValue];

    if (v13) {
      [(IKJSNavigationDocument *)self _migrateMediaControllerFromDocument:v9 toDocument:v8];
    }
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__25;
    v27 = __Block_byref_object_dispose__25;
    id v28 = 0;
    id v14 = [(IKJSNavigationDocument *)self _makeAppDocumentWithDocument:v8];
    id v15 = [(IKJSObject *)self appContext];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __49__IKJSNavigationDocument_insertBeforeDocument_::__block_invoke;
    v18[3] = &unk_1E6DE6A88;
    v18[4] = self;
    id v19 = v9;
    id v16 = v14;
    id v20 = v16;
    id v21 = v11;
    long long v22 = &v23;
    [v15 evaluateDelegateBlockSync:v18];

    if ([(id)v24[5] length])
    {
      id v17 = [(IKJSObject *)self appContext];
      [v17 setException:0 withErrorMessage:v24[5]];
    }
    _Block_object_dispose(&v23, 8);
  }
  else
  {
    [(IKJSNavigationDocument *)self pushDocument:v8 :v10];
  }
}

void __49__IKJSNavigationDocument_insertBeforeDocument_::__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) navigationControllerDelegate];
  uint64_t v3 = [v2 documents];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v16 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
      id v10 = objc_msgSend(v9, "jsDocument", (void)v15);
      char v11 = [v10 isEqual:*(void *)(a1 + 40)];

      if (v11) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v12 = v9;

    if (!v12) {
      goto LABEL_12;
    }
    int v13 = [*(id *)(a1 + 32) navigationControllerDelegate];
    [v13 insertDocument:*(void *)(a1 + 48) beforeDocument:v12 options:*(void *)(a1 + 56)];
  }
  else
  {
LABEL_9:

LABEL_12:
    uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
    id v12 = *(id *)(v14 + 40);
    *(void *)(v14 + 40) = @"Before document not found on stack";
  }
}

- (void)replaceDocument:(id)a3 :(id)a4 :(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  kdebug_trace();
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__25;
  v26 = __Block_byref_object_dispose__25;
  v27 = 0;
  if (v8 && v9)
  {
    char v11 = [v10 objectForKey:@"TransitionOptionRetainContext"];
    int v12 = [v11 BOOLValue];

    if (v12) {
      [(IKJSNavigationDocument *)self _migrateMediaControllerFromDocument:v9 toDocument:v8];
    }
    int v13 = [(IKJSNavigationDocument *)self _makeAppDocumentWithDocument:v8];
    uint64_t v14 = [(IKJSObject *)self appContext];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __44__IKJSNavigationDocument_replaceDocument_::__block_invoke;
    v17[3] = &unk_1E6DE6A88;
    v17[4] = self;
    id v18 = v9;
    id v15 = v13;
    id v19 = v15;
    id v20 = v10;
    id v21 = &v22;
    [v14 evaluateDelegateBlockSync:v17];
  }
  else
  {
    id v15 = 0;
    v27 = @"Invalid arguments";
  }

  if ([(id)v23[5] length])
  {
    long long v16 = [(IKJSObject *)self appContext];
    [v16 setException:0 withErrorMessage:v23[5]];
  }
  _Block_object_dispose(&v22, 8);
}

void __44__IKJSNavigationDocument_replaceDocument_::__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) navigationControllerDelegate];
  uint64_t v3 = [v2 documents];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v16 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
      id v10 = objc_msgSend(v9, "jsDocument", (void)v15);
      char v11 = [v10 isEqual:*(void *)(a1 + 40)];

      if (v11) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v12 = v9;

    if (!v12) {
      goto LABEL_12;
    }
    int v13 = [*(id *)(a1 + 32) navigationControllerDelegate];
    [v13 replaceDocument:v12 withDocument:*(void *)(a1 + 48) options:*(void *)(a1 + 56)];
  }
  else
  {
LABEL_9:

LABEL_12:
    uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
    id v12 = *(id *)(v14 + 40);
    *(void *)(v14 + 40) = @"Document not found on stack";
  }
}

- (void)popDocument
{
  uint64_t v3 = [(IKJSObject *)self appContext];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__IKJSNavigationDocument_popDocument__block_invoke;
  v4[3] = &unk_1E6DE42D8;
  v4[4] = self;
  [v3 evaluateDelegateBlockSync:v4];
}

void __37__IKJSNavigationDocument_popDocument__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) navigationControllerDelegate];
  [v1 popDocument];
}

- (void)popToDocument:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IKJSObject *)self appContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__IKJSNavigationDocument_popToDocument___block_invoke;
  v7[3] = &unk_1E6DE3A98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 evaluateDelegateBlockSync:v7];
}

void __40__IKJSNavigationDocument_popToDocument___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) navigationControllerDelegate];
  uint64_t v3 = [v2 documents];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  id v6 = v4;
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v4);
      }
      id v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
      char v11 = objc_msgSend(v10, "jsDocument", (void)v14);
      char v12 = [v11 isEqual:*(void *)(a1 + 40)];

      if (v12) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        id v6 = v4;
        goto LABEL_12;
      }
    }
    id v6 = v10;

    if (!v6) {
      goto LABEL_13;
    }
    int v13 = [*(id *)(a1 + 32) navigationControllerDelegate];
    [v13 popToDocument:v6];
  }
LABEL_12:

LABEL_13:
}

- (void)popToRootDocument
{
  uint64_t v3 = [(IKJSObject *)self appContext];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__IKJSNavigationDocument_popToRootDocument__block_invoke;
  v4[3] = &unk_1E6DE42D8;
  v4[4] = self;
  [v3 evaluateDelegateBlockSync:v4];
}

void __43__IKJSNavigationDocument_popToRootDocument__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) navigationControllerDelegate];
  [v1 popToRootDocument];
}

- (void)removeDocument:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  char v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__25;
  long long v15 = __Block_byref_object_dispose__25;
  id v16 = 0;
  uint64_t v5 = [(IKJSObject *)self appContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__IKJSNavigationDocument_removeDocument___block_invoke;
  v8[3] = &unk_1E6DE5AE8;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  id v10 = &v11;
  [v5 evaluateDelegateBlockSync:v8];

  if ([(id)v12[5] length])
  {
    uint64_t v7 = [(IKJSObject *)self appContext];
    [v7 setException:0 withErrorMessage:v12[5]];
  }
  _Block_object_dispose(&v11, 8);
}

void __41__IKJSNavigationDocument_removeDocument___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) navigationControllerDelegate];
  uint64_t v3 = [v2 documents];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v16 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
      id v10 = objc_msgSend(v9, "jsDocument", (void)v15);
      char v11 = [v10 isEqual:*(void *)(a1 + 40)];

      if (v11) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v12 = v9;

    if (!v12) {
      goto LABEL_12;
    }
    uint64_t v13 = [*(id *)(a1 + 32) navigationControllerDelegate];
    [v13 removeDocument:v12];
  }
  else
  {
LABEL_9:

LABEL_12:
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    id v12 = *(id *)(v14 + 40);
    *(void *)(v14 + 40) = @"Document not found on stack";
  }
}

- (void)clear
{
  if (self->_delegateSelectors.hasClear)
  {
    uint64_t v3 = [(IKJSObject *)self appContext];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __31__IKJSNavigationDocument_clear__block_invoke;
    v4[3] = &unk_1E6DE42D8;
    v4[4] = self;
    [v3 evaluateDelegateBlockSync:v4];
  }
}

void __31__IKJSNavigationDocument_clear__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) navigationControllerDelegate];
  [v1 clear];
}

- (id)_makeAppDocumentWithDocument:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [v4 setNavigationDocument:self];
    uint64_t v5 = [IKAppDocument alloc];
    uint64_t v6 = [(IKJSObject *)self appContext];
    uint64_t v7 = [(IKAppDocument *)v5 initWithAppContext:v6 document:v4 owner:self];
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (void)_migrateMediaControllerFromDocument:(id)a3 toDocument:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [NSString stringWithFormat:@"//*[substring(name(), string-length(name()) - string-length('%@') +1) = '%@']/background/mediaContent", @"Template", @"Template"];
  id v19 = 0;
  uint64_t v8 = [v5 nodesForXPath:v7 error:&v19];
  id v9 = v19;
  if (v8)
  {
    id v10 = [v8 lastObject];
    if (!v10) {
      id v10 = v5;
    }
  }
  else
  {
    char v11 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[IKJSNavigationDocument _migrateMediaControllerFromDocument:toDocument:]((uint64_t)v9, v11);
    }

    id v10 = 0;
  }
  id v18 = v9;
  id v12 = [v6 nodesForXPath:v7 error:&v18];
  id v13 = v18;

  if (v12)
  {
    uint64_t v14 = [v12 lastObject];
    long long v15 = v14;
    BOOL v16 = v14 != 0;
    if (v10 && v14) {
      goto LABEL_17;
    }
  }
  else
  {
    long long v17 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[IKJSNavigationDocument _migrateMediaControllerFromDocument:toDocument:]((uint64_t)v13, v17);
    }

    BOOL v16 = 0;
    long long v15 = 0;
  }
  if (v10 && !v16)
  {
    uint64_t v14 = v6;
LABEL_17:
    [v14 adoptFeatureWithName:@"Player" fromDOMNode:v10];
  }
}

- (NSString)OPTION_RETAIN_CONTEXT
{
  return (NSString *)@"TransitionOptionRetainContext";
}

- (IKAppNavigationController)navigationControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationControllerDelegate);
  return (IKAppNavigationController *)WeakRetained;
}

- (void).cxx_destruct
{
}

- (void)_migrateMediaControllerFromDocument:(uint64_t)a1 toDocument:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1E2ACE000, a2, OS_LOG_TYPE_DEBUG, "Unable to get targetNodes: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_migrateMediaControllerFromDocument:(uint64_t)a1 toDocument:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1E2ACE000, a2, OS_LOG_TYPE_DEBUG, "Unable to get sourceNodes: %@", (uint8_t *)&v2, 0xCu);
}

@end