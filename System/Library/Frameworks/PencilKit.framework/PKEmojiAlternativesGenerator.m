@interface PKEmojiAlternativesGenerator
+ (id)sharedInstance;
- (PKEmojiAlternativesGenerator)init;
- (uint64_t)cancelScheduledTasks;
- (void)_connectToRemoteServiceIfNecessary;
- (void)_generateAlternatives;
- (void)_generateAlternativesForWebKit;
- (void)clearExistingAlternativesForTextInput:(void *)a1;
- (void)scheduleGenerateAlternativesForTextInput:(void *)a3 localeIdentifiers:;
@end

@implementation PKEmojiAlternativesGenerator

+ (id)sharedInstance
{
  self;
  if (_MergedGlobals_167 != -1) {
    dispatch_once(&_MergedGlobals_167, &__block_literal_global_96);
  }
  v0 = (void *)qword_1EB3C63A8;

  return v0;
}

void __46__PKEmojiAlternativesGenerator_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PKEmojiAlternativesGenerator);
  v1 = (void *)qword_1EB3C63A8;
  qword_1EB3C63A8 = (uint64_t)v0;
}

- (PKEmojiAlternativesGenerator)init
{
  v5.receiver = self;
  v5.super_class = (Class)PKEmojiAlternativesGenerator;
  v2 = [(PKEmojiAlternativesGenerator *)&v5 init];
  v3 = v2;
  if (v2) {
    -[PKEmojiAlternativesGenerator _connectToRemoteServiceIfNecessary]((uint64_t)v2);
  }
  return v3;
}

- (void)_connectToRemoteServiceIfNecessary
{
  if (a1)
  {
    if (!*(void *)(a1 + 8))
    {
      v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
      dispatch_queue_t v3 = dispatch_queue_create("com.apple.pencilkit.emoji.xpc", v2);
      uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.TextInput.rdt" options:4096];
      objc_super v5 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v4;

      v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F20A75A8];
      [*(id *)(a1 + 8) setRemoteObjectInterface:v6];

      objc_initWeak(&location, (id)a1);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __66__PKEmojiAlternativesGenerator__connectToRemoteServiceIfNecessary__block_invoke;
      v11[3] = &unk_1E64C5998;
      objc_copyWeak(&v12, &location);
      [*(id *)(a1 + 8) setInterruptionHandler:v11];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __66__PKEmojiAlternativesGenerator__connectToRemoteServiceIfNecessary__block_invoke_2;
      v9[3] = &unk_1E64C5998;
      objc_copyWeak(&v10, &location);
      [*(id *)(a1 + 8) setInvalidationHandler:v9];
      [*(id *)(a1 + 8) _setQueue:v3];
      [*(id *)(a1 + 8) resume];
      uint64_t v7 = [*(id *)(a1 + 8) remoteObjectProxyWithErrorHandler:&__block_literal_global_20];
      v8 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v7;

      objc_destroyWeak(&v10);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
}

void __66__PKEmojiAlternativesGenerator__connectToRemoteServiceIfNecessary__block_invoke(uint64_t a1)
{
  v2 = os_log_create("com.apple.pencilkit", "emoji");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEFAULT, "xpc for emoji alternatives interrupted. Retrying connection.", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__PKEmojiAlternativesGenerator__connectToRemoteServiceIfNecessary__block_invoke_15;
  block[3] = &unk_1E64C5998;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v4);
}

void __66__PKEmojiAlternativesGenerator__connectToRemoteServiceIfNecessary__block_invoke_15(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[1] invalidate];
    WeakRetained = v2;
  }
}

void __66__PKEmojiAlternativesGenerator__connectToRemoteServiceIfNecessary__block_invoke_2(uint64_t a1)
{
  v2 = os_log_create("com.apple.pencilkit", "emoji");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEFAULT, "xpc for emoji alternatives invalidated.", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__PKEmojiAlternativesGenerator__connectToRemoteServiceIfNecessary__block_invoke_16;
  block[3] = &unk_1E64C5998;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v4);
}

void __66__PKEmojiAlternativesGenerator__connectToRemoteServiceIfNecessary__block_invoke_16(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
    id v4 = WeakRetained;

    dispatch_queue_t v3 = (void *)v4[2];
    v4[2] = 0;

    WeakRetained = v4;
  }
}

void __66__PKEmojiAlternativesGenerator__connectToRemoteServiceIfNecessary__block_invoke_2_17(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  dispatch_queue_t v3 = os_log_create("com.apple.pencilkit", "emoji");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_error_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_ERROR, "Error creating xpc connection for emoji alternatives: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)clearExistingAlternativesForTextInput:(void *)a1
{
  if (a1)
  {
    +[PKTextInputUtilities removeTextAlternativesForTextInput:a2];
    dispatch_queue_t v3 = (void *)a1[3];
    a1[3] = 0;

    int v4 = (void *)a1[4];
    a1[4] = 0;

    id v5 = (void *)a1[6];
    a1[6] = 0;

    uint64_t v6 = (void *)a1[5];
    a1[5] = 0;

    uint64_t v7 = (void *)a1[7];
    a1[7] = 0;

    v8 = (void *)a1[8];
    a1[8] = 0;

    v9 = (void *)a1[9];
    a1[9] = 0;
  }
}

- (void)scheduleGenerateAlternativesForTextInput:(void *)a3 localeIdentifiers:
{
  id v21 = a2;
  id v6 = a3;
  if (a1)
  {
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:a1 selector:sel__generateAlternatives object:0];
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:a1 selector:sel__generateAlternativesForWebKit object:0];
    id v7 = v21;
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {

      self;
      goto LABEL_9;
    }
    uint64_t v8 = [v7 keyboardType];

    self;
    if ((unint64_t)(v8 - 1) >= 8 && v8 != 11 && v8 != 13 && v8 != 123)
    {
LABEL_9:
      id v9 = v7;
      if ([v9 conformsToProtocol:&unk_1F20A7BD8])
      {
        id v10 = v9;

        if (v10)
        {
          id v11 = v10;
          id v12 = v6;
          objc_storeStrong((id *)(a1 + 64), a2);
          objc_storeStrong((id *)(a1 + 40), a3);
          id v13 = objc_alloc_init(MEMORY[0x1E4FB1F08]);
          [v13 setFlags:2];
          [v13 setSurroundingGranularity:4];
          [v13 setGranularityCount:1];
          objc_initWeak(&location, (id)a1);
          uint64_t v14 = *(void *)(a1 + 64);
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __89__PKEmojiAlternativesGenerator__scheduleGenerateAlternativesForWebKit_localeIdentifiers___block_invoke;
          v22[3] = &unk_1E64CB8E8;
          objc_copyWeak(&v23, &location);
          +[PKTextInputUtilities requestDocumentContext:v13 forWebDocumentSourceView:v14 completionHandler:v22];
          objc_destroyWeak(&v23);
          objc_destroyWeak(&location);

LABEL_14:
          goto LABEL_15;
        }
      }
      else
      {
      }
      objc_storeStrong((id *)(a1 + 24), a2);
      objc_storeStrong((id *)(a1 + 40), a3);
      v15 = +[PKTextInputSettings sharedSettings];
      [v15 emojiConversionDelay];
      double v17 = v16;

      v18 = [MEMORY[0x1E4FAE2A8] documentStateOfDocumentWithParagraph:v9];
      v19 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v18;
      id v20 = v18;

      [(id)a1 performSelector:sel__generateAlternatives withObject:0 afterDelay:v17];
      id v11 = 0;
      goto LABEL_14;
    }
  }
LABEL_15:
}

- (uint64_t)cancelScheduledTasks
{
  if (result)
  {
    uint64_t v1 = result;
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:result selector:sel__generateAlternatives object:0];
    id v2 = (void *)MEMORY[0x1E4FBA8A8];
    return [v2 cancelPreviousPerformRequestsWithTarget:v1 selector:sel__generateAlternativesForWebKit object:0];
  }
  return result;
}

- (void)_generateAlternatives
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  -[PKEmojiAlternativesGenerator _connectToRemoteServiceIfNecessary]((uint64_t)self);
  if (!self->_connection)
  {
    int v4 = os_log_create("com.apple.pencilkit", "emoji");
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 138412290;
    v18 = self;
    id v9 = "Error: missing XPC connection for %@";
LABEL_13:
    _os_log_error_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_ERROR, v9, buf, 0xCu);
    goto LABEL_17;
  }
  if (!self->_localeIdentifiers)
  {
    int v4 = os_log_create("com.apple.pencilkit", "emoji");
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 138412290;
    v18 = self;
    id v9 = "Error: Missing locale identifiers for %@";
    goto LABEL_13;
  }
  dispatch_queue_t v3 = [(TIDocumentState *)self->_documentState contextBeforeInput];
  int v4 = v3;
  if (v3 && [v3 length])
  {
    id v5 = self->_textInput;
    [(TIEmojiAlternativesProtocol *)self->_remoteObject updateForActiveLocaleIdentifiers:self->_localeIdentifiers];
    remoteObject = self->_remoteObject;
    id v7 = v5;
    if (objc_opt_respondsToSelector()) {
      uint64_t v8 = [(UITextInput *)v7 keyboardType];
    }
    else {
      uint64_t v8 = 0;
    }

    id v11 = [MEMORY[0x1E4F28B50] mainBundle];
    id v12 = [v11 bundleIdentifier];
    [(TIEmojiAlternativesProtocol *)remoteObject updateKeyboardType:v8 appIdentifier:v12];

    objc_initWeak((id *)buf, self);
    id v13 = self->_remoteObject;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __53__PKEmojiAlternativesGenerator__generateAlternatives__block_invoke;
    v14[3] = &unk_1E64CB8C0;
    objc_copyWeak(&v16, (id *)buf);
    os_log_t v10 = v7;
    os_log_t v15 = v10;
    [(TIEmojiAlternativesProtocol *)v13 alternativesForText:v4 completionHandler:v14];

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    os_log_t v10 = os_log_create("com.apple.pencilkit", "emoji");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = self;
      _os_log_error_impl(&dword_1C44F8000, v10, OS_LOG_TYPE_ERROR, "Error: Attempting to find alternatives for nil or empty text. %@", buf, 0xCu);
    }
  }

LABEL_17:
}

void __53__PKEmojiAlternativesGenerator__generateAlternatives__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __53__PKEmojiAlternativesGenerator__generateAlternatives__block_invoke_2;
    v8[3] = &unk_1E64CB898;
    objc_copyWeak(&v12, (id *)(a1 + 40));
    id v9 = *(id *)(a1 + 32);
    id v10 = v5;
    id v11 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v8);

    objc_destroyWeak(&v12);
  }
}

void __53__PKEmojiAlternativesGenerator__generateAlternatives__block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v23 = WeakRetained;
    dispatch_queue_t v3 = *(void **)(a1 + 40);
    int v4 = *(void **)(a1 + 48);
    id v5 = *(id *)(a1 + 32);
    id v6 = v3;
    id v7 = v4;
    if (!v6 || ![v6 length] || !objc_msgSend(v7, "count"))
    {
      uint64_t v8 = os_log_create("com.apple.pencilkit", "emoji");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_DEFAULT, "No results for emoji conversion.", buf, 2u);
      }
      goto LABEL_10;
    }
    if (v23[3] != v5)
    {
      uint64_t v8 = os_log_create("com.apple.pencilkit", "emoji");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_ERROR, "Unexpected error. UITextInput changed while waiting for remote operation.", buf, 2u);
      }
LABEL_10:

      id WeakRetained = v23;
      goto LABEL_11;
    }
    uint64_t v8 = [MEMORY[0x1E4FAE2A8] documentStateOfDocumentWithParagraph:v5];
    if ((unint64_t)[v7 count] >= 4)
    {
      uint64_t v9 = objc_msgSend(v7, "subarrayWithRange:", 0, 3);

      id v7 = (id)v9;
    }
    id v10 = v6;
    id v7 = v7;
    if (v7)
    {
      if (!v23[3])
      {
        id v11 = os_log_create("com.apple.pencilkit", "emoji");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_ERROR, "Unexpected error. No UITextInput to populate with emoji alternatives.", buf, 2u);
        }
        goto LABEL_37;
      }
      if (objc_opt_respondsToSelector())
      {
        id v11 = [objc_alloc(MEMORY[0x1E4FB0868]) initWithPrimaryString:v10 alternativeStrings:v7 isLowConfidence:1];
        [v23[3] addTextAlternatives:v11];
LABEL_37:

        goto LABEL_38;
      }
      if (objc_opt_respondsToSelector())
      {
        id v12 = v23[3];
        id v13 = [v12 selectedTextRange];
        uint64_t v14 = [v13 start];
        id v11 = objc_msgSend(v12, "positionFromPosition:offset:", v14, --[NSObject length](v10, "length"));

        os_log_t v15 = [v23[3] selectedTextRange];
        id v16 = [v15 start];

        if (v11 && v16)
        {
          double v17 = [v23[3] textRangeFromPosition:v11 toPosition:v16];
          if (v17)
          {
            v18 = [v23[3] textInRange:v17];
            if ([v18 isEqualToString:v10])
            {
              [v23[3] setSelectedTextRange:v17];
              [v23[3] insertText:v10 alternatives:v7 style:1];
              objc_storeStrong(v23 + 6, v3);
              objc_storeStrong(v23 + 7, v17);
            }
            else
            {
              uint64_t v19 = os_log_create("com.apple.pencilkit", "emoji");
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138740227;
                v25 = v18;
                __int16 v26 = 2117;
                v27 = v10;
                _os_log_error_impl(&dword_1C44F8000, v19, OS_LOG_TYPE_ERROR, "Unexpected error. Trying to replace \"%{sensitive}@\" with \"%{sensitive}@\"", buf, 0x16u);
              }
            }
          }
          else
          {
            v18 = os_log_create("com.apple.pencilkit", "emoji");
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1C44F8000, v18, OS_LOG_TYPE_ERROR, "Unexpected error. Could not find the text replacement range to populate with emoji alternatives.", buf, 2u);
            }
          }
        }
        else
        {
          double v17 = os_log_create("com.apple.pencilkit", "emoji");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1C44F8000, v17, OS_LOG_TYPE_ERROR, "Unexpected error. Could not find the start and and/or end position in the text to populate with emoji alternatives.", buf, 2u);
          }
        }

        goto LABEL_37;
      }
    }
LABEL_38:

    if (!v23[4] || (-[NSObject isEqualIgnoringMarkedText:](v8, "isEqualIgnoringMarkedText:") & 1) == 0)
    {
      id v20 = os_log_create("com.apple.pencilkit", "emoji");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C44F8000, v20, OS_LOG_TYPE_ERROR, "Either no existing document state or document state changed while waiting for remote operation.", buf, 2u);
      }

      id v21 = os_log_create("com.apple.pencilkit", "emoji");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = v23[4];
        *(_DWORD *)buf = 138740227;
        v25 = v22;
        __int16 v26 = 2117;
        v27 = v8;
        _os_log_error_impl(&dword_1C44F8000, v21, OS_LOG_TYPE_ERROR, "document state - cached: %{sensitive}@; current: %{sensitive}@",
          buf,
          0x16u);
      }
    }
    goto LABEL_10;
  }
LABEL_11:
}

void __89__PKEmojiAlternativesGenerator__scheduleGenerateAlternativesForWebKit_localeIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 9, a2);
    id v6 = +[PKTextInputSettings sharedSettings];
    [v6 emojiConversionDelay];
    double v8 = v7;

    [v5 performSelector:sel__generateAlternativesForWebKit withObject:0 afterDelay:v8];
  }
}

- (void)_generateAlternativesForWebKit
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  -[PKEmojiAlternativesGenerator _connectToRemoteServiceIfNecessary]((uint64_t)self);
  if (!self->_connection)
  {
    id v6 = os_log_create("com.apple.pencilkit", "emoji");
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 138412290;
    id v20 = self;
    double v7 = "Error: missing XPC connection for %@";
LABEL_9:
    _os_log_error_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_ERROR, v7, buf, 0xCu);
    goto LABEL_12;
  }
  if (!self->_localeIdentifiers)
  {
    id v6 = os_log_create("com.apple.pencilkit", "emoji");
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 138412290;
    id v20 = self;
    double v7 = "Error: Missing locale identifiers for %@";
    goto LABEL_9;
  }
  -[TIEmojiAlternativesProtocol updateForActiveLocaleIdentifiers:](self->_remoteObject, "updateForActiveLocaleIdentifiers:");
  remoteObject = self->_remoteObject;
  int v4 = self->_wkInteractionView;
  if (objc_opt_respondsToSelector()) {
    uint64_t v5 = [(UIWKInteractionViewProtocol *)v4 keyboardType];
  }
  else {
    uint64_t v5 = 0;
  }

  double v8 = [MEMORY[0x1E4F28B50] mainBundle];
  id v9 = [v8 bundleIdentifier];
  [(TIEmojiAlternativesProtocol *)remoteObject updateKeyboardType:v5 appIdentifier:v9];

  id v10 = self->_wkInteractionView;
  uint64_t v11 = objc_opt_class();
  id v12 = [(UIWKDocumentContext *)self->_wkDocumentContext contextBefore];
  id v13 = PKDynamicCast(v11, v12);

  objc_initWeak((id *)buf, self);
  uint64_t v14 = self->_remoteObject;
  os_log_t v15 = [v13 string];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __62__PKEmojiAlternativesGenerator__generateAlternativesForWebKit__block_invoke;
  v16[3] = &unk_1E64CB8C0;
  objc_copyWeak(&v18, (id *)buf);
  id v6 = v10;
  double v17 = v6;
  [(TIEmojiAlternativesProtocol *)v14 alternativesForText:v15 completionHandler:v16];

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);

LABEL_12:
}

void __62__PKEmojiAlternativesGenerator__generateAlternativesForWebKit__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__PKEmojiAlternativesGenerator__generateAlternativesForWebKit__block_invoke_2;
  v9[3] = &unk_1E64CB898;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v10 = *(id *)(a1 + 32);
  id v11 = v5;
  id v12 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(&v13);
}

void __62__PKEmojiAlternativesGenerator__generateAlternativesForWebKit__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v2 = *(void **)(a1 + 40);
  dispatch_queue_t v3 = *(void **)(a1 + 48);
  id v4 = *(id *)(a1 + 32);
  id v5 = v2;
  id v6 = v3;
  if (WeakRetained && v5 && [v6 count] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if ((unint64_t)[v6 count] >= 4)
    {
      uint64_t v7 = objc_msgSend(v6, "subarrayWithRange:", 0, 3);

      id v6 = (id)v7;
    }
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB0868]) initWithPrimaryString:v5 alternativeStrings:v6 isLowConfidence:1];
    [v4 addTextAlternatives:v8];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wkDocumentContext, 0);
  objc_storeStrong((id *)&self->_wkInteractionView, 0);
  objc_storeStrong((id *)&self->_rangeWithAlternatives, 0);
  objc_storeStrong((id *)&self->_textWithAlternatives, 0);
  objc_storeStrong((id *)&self->_localeIdentifiers, 0);
  objc_storeStrong((id *)&self->_documentState, 0);
  objc_storeStrong((id *)&self->_textInput, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end