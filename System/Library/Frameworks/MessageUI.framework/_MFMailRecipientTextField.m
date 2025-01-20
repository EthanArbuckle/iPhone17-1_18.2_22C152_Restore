@interface _MFMailRecipientTextField
- (BOOL)isShowingDictationPlaceholder;
- (id)_previousKeyResponder;
- (id)customOverlayContainer;
- (id)insertDictationResultPlaceholder;
- (void)_handleKeyUIEvent:(id)a3;
- (void)paste:(id)a3;
- (void)removeDictationResultPlaceholder:(id)a3 willInsertResult:(BOOL)a4;
@end

@implementation _MFMailRecipientTextField

- (id)insertDictationResultPlaceholder
{
  self->_isShowingDictationPlaceholder = 1;
  v4.receiver = self;
  v4.super_class = (Class)_MFMailRecipientTextField;
  v2 = [(_MFMailRecipientTextField *)&v4 insertDictationResultPlaceholder];

  return v2;
}

- (void)removeDictationResultPlaceholder:(id)a3 willInsertResult:(BOOL)a4
{
  self->_isShowingDictationPlaceholder = 0;
  v4.receiver = self;
  v4.super_class = (Class)_MFMailRecipientTextField;
  [(_MFMailRecipientTextField *)&v4 removeDictationResultPlaceholder:a3 willInsertResult:a4];
}

- (id)_previousKeyResponder
{
  MFComposeRecipientTextViewIsCollectingPreviousKeyResponder = 1;
  v4.receiver = self;
  v4.super_class = (Class)_MFMailRecipientTextField;
  v2 = [(_MFMailRecipientTextField *)&v4 _previousKeyResponder];
  MFComposeRecipientTextViewIsCollectingPreviousKeyResponder = 0;

  return v2;
}

- (id)customOverlayContainer
{
  return (id)[MEMORY[0x1E4FB1D68] sharedTextEffectsWindow];
}

- (void)_handleKeyUIEvent:(id)a3
{
  id v4 = a3;
  if ([v4 type] != 4) {
    goto LABEL_20;
  }
  v5 = [(_MFMailRecipientTextField *)self delegate];
  v6 = [v4 _modifiedInput];
  v7 = v6;
  v8 = (void *)*MEMORY[0x1E4FB2AF8];
  if (v6 == (void *)*MEMORY[0x1E4FB2AF8] || v6 == (void *)*MEMORY[0x1E4FB2B98])
  {
    if (objc_msgSend(v5, "mf_textFieldShowingSearchResults:", self))
    {
      if (([v4 _isKeyDown] & 1) == 0)
      {
        if (v7 == v8) {
          objc_msgSend(v5, "mf_selectNextSearchResultForTextField:", self);
        }
        else {
          objc_msgSend(v5, "mf_selectPreviousSearchResultForTextField:", self);
        }
      }
      goto LABEL_23;
    }
    if (v7 != v8 || ![v4 _isKeyDown]) {
      goto LABEL_19;
    }
    char v10 = objc_msgSend(v5, "mf_presentSearchResultsForTextField:", self);
  }
  else
  {
    if ([v6 length] != 1
      || [v7 characterAtIndex:0] != 13
      || !objc_msgSend(v5, "mf_textFieldShowingSearchResults:", self))
    {
      goto LABEL_19;
    }
    char v10 = objc_msgSend(v5, "mf_chooseSelectedSearchResultForTextField:", self);
  }
  if (v10)
  {
LABEL_23:

    goto LABEL_21;
  }
LABEL_19:

LABEL_20:
  v11.receiver = self;
  v11.super_class = (Class)_MFMailRecipientTextField;
  [(_MFMailRecipientTextField *)&v11 _handleKeyUIEvent:v4];
LABEL_21:
}

- (void)paste:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v26 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v25 = [(id)*MEMORY[0x1E4F44470] identifier];
  uint64_t v26 = [(id)*MEMORY[0x1E4F444F0] identifier];
  v5 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  uint64_t v6 = 0;
  char v7 = 1;
  do
  {
    v8 = [v5 valueForPasteboardType:*(&v25 + v6)];
    char v9 = (v8 == 0) & v7;
    uint64_t v6 = 1;
    char v7 = 0;
  }
  while ((v9 & 1) != 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v10 = [(_MFMailRecipientTextField *)self delegate];
    objc_super v11 = [v8 stringByReplacingOccurrencesOfString:@"\n", @", " withString];

    v12 = [MEMORY[0x1E4F73508] addressListFromEncodedString:v11];
    if ((unint64_t)[v12 count] > 1)
    {
      objc_msgSend(v10, "mf_dismissSearchResults:", self);
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v20 != v15) {
              objc_enumerationMutation(v13);
            }
            objc_msgSend(v10, "mf_recipientTextField:didAddRecipientAddress:", self, *(void *)(*((void *)&v19 + 1) + 8 * i));
          }
          uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v14);
      }
    }
    else
    {
      v23.receiver = self;
      v23.super_class = (Class)_MFMailRecipientTextField;
      [(_MFMailRecipientTextField *)&v23 paste:v4];
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)_MFMailRecipientTextField;
    [(_MFMailRecipientTextField *)&v18 paste:v4];
    objc_super v11 = v8;
  }

  for (uint64_t j = 8; j != -8; j -= 8)
}

- (BOOL)isShowingDictationPlaceholder
{
  return self->_isShowingDictationPlaceholder;
}

@end