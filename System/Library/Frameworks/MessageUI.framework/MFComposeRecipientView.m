@interface MFComposeRecipientView
- (BOOL)_addable;
- (BOOL)_shouldShowCorecipientsIndicatorAtom;
- (BOOL)allowsDragAndDrop;
- (BOOL)becomeFirstResponder;
- (BOOL)containsAddress:(id)a3;
- (BOOL)didIgnoreFirstResponderResign;
- (BOOL)editable;
- (BOOL)expanded;
- (BOOL)finishEnteringRecipient;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasContent;
- (BOOL)isSeparatorHidden;
- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5;
- (BOOL)keyboardInputShouldDelete:(id)a3;
- (BOOL)mf_chooseSelectedSearchResultForTextField:(id)a3;
- (BOOL)mf_presentSearchResultsForTextField:(id)a3;
- (BOOL)mf_textFieldShowingSearchResults:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (MFComposeRecipient)placeholderRecipient;
- (MFComposeRecipientView)initWithFrame:(CGRect)a3;
- (MFComposeRecipientViewDelegate)delegate;
- (MFCorecipientsIndicatorAtom)corecipientsIndicator;
- (NSArray)addresses;
- (NSArray)recipients;
- (NSMutableDictionary)atoms;
- (NSString)text;
- (UIFont)baseFont;
- (UITextField)textField;
- (UIView)addButton;
- (double)_topRowTextWidth;
- (double)inputDelay;
- (double)offsetForRowWithTextField;
- (double)textFieldOffsetForNumberOfRowsToScroll:(unint64_t)a3 numberOfRowsAboveField:(int64_t)a4;
- (id)uncommentedAddresses;
- (int64_t)hideLastAtomComma;
- (int64_t)maxRecipients;
- (int64_t)numberOfRowsOfTextInField;
- (unint64_t)_addressAtomPresentationOptionsForRecipient:(id)a3;
- (unint64_t)defaultAtomPresentationOptions;
- (void)_addRecord:(void *)a3 identifier:(int)a4;
- (void)_addUncommentedAddress:(id)a3;
- (void)_cancelDelayTimer;
- (void)_delayTimerFired:(id)a3;
- (void)_deleteSelectedAtom;
- (void)_deselectAtom;
- (void)_reflowAnimated:(BOOL)a3;
- (void)_removeAddressAtomPresentationOptionsForRecipient:(id)a3;
- (void)_removeAllRecipients;
- (void)_removeUncommentedAddress:(id)a3;
- (void)_setNeedsLayoutConstraintUpdate;
- (void)_setNeedsReflow;
- (void)_tapGestureRecognized:(id)a3;
- (void)_updateLayoutConstraintsAndGetNumberOfRows:(unint64_t *)a3 textFieldWillBeLastRow:(BOOL *)a4;
- (void)addAddress:(id)a3;
- (void)addButtonClicked:(id)a3;
- (void)addRecipient:(id)a3;
- (void)addRecipient:(id)a3 index:(unint64_t)a4 animate:(BOOL)a5;
- (void)addRecord:(void *)a3 property:(int)a4 identifier:(int)a5;
- (void)clearAllAddressAtomPresentationOptions;
- (void)clearText;
- (void)composeRecipientAtomSelectNext:(id)a3;
- (void)composeRecipientAtomSelectPrevious:(id)a3;
- (void)composeRecipientAtomShowPersonCard:(id)a3;
- (void)dealloc;
- (void)deselectComposeRecipientAtom:(id)a3;
- (void)didMoveToSuperview;
- (void)didTapShowCorecipientsForIndicatorAtom:(id)a3 recipients:(id)a4;
- (void)keyboardInputChangedSelection:(id)a3;
- (void)mf_dismissSearchResults:(id)a3;
- (void)mf_recipientTextField:(id)a3 didAddRecipientAddress:(id)a4;
- (void)mf_selectNextSearchResultForTextField:(id)a3;
- (void)mf_selectPreviousSearchResultForTextField:(id)a3;
- (void)parentDidClose;
- (void)parentWillClose;
- (void)reflow;
- (void)refreshPreferredContentSize;
- (void)removeRecipient:(id)a3;
- (void)selectComposeRecipientAtom:(id)a3;
- (void)setAddressAtomPresentationOptions:(unint64_t)a3 forRecipient:(id)a4;
- (void)setAddresses:(id)a3;
- (void)setAllowsDragAndDrop:(BOOL)a3;
- (void)setAtoms:(id)a3;
- (void)setBaseFont:(id)a3;
- (void)setCorecipientsIndicator:(id)a3;
- (void)setDefaultAtomPresentationOptions:(unint64_t)a3;
- (void)setDidIgnoreFirstResponderResign:(BOOL)a3;
- (void)setEditable:(BOOL)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setHideLastAtomComma:(int64_t)a3;
- (void)setInputDelay:(double)a3;
- (void)setLabel:(id)a3;
- (void)setMaxRecipients:(int64_t)a3;
- (void)setPlaceholderRecipient:(id)a3;
- (void)setProperties:(id)a3;
- (void)setProperty:(int)a3;
- (void)setSeparatorHidden:(BOOL)a3;
- (void)showCorecipientIndicator:(BOOL)a3 withCorecipients:(id)a4 animated:(BOOL)a5;
- (void)textChanged:(id)a3;
- (void)textFieldDidBecomeFirstResponder:(id)a3;
- (void)textFieldDidResignFirstResponder:(id)a3;
@end

@implementation MFComposeRecipientView

- (MFComposeRecipientView)initWithFrame:(CGRect)a3
{
  double width = a3.size.width;
  v27.receiver = self;
  v27.super_class = (Class)MFComposeRecipientView;
  v4 = -[MFComposeHeaderView initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    recipients = v4->_recipients;
    v4->_recipients = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    atoms = v4->_atoms;
    v4->_atoms = v7;

    v9 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    uncommentedAddresses = v4->_uncommentedAddresses;
    v4->_uncommentedAddresses = v9;

    v11 = -[_MFMailRecipientTextField initWithFrame:]([_MFMailRecipientTextField alloc], "initWithFrame:", 0.0, 0.0, width, 25.0);
    textField = v4->_textField;
    v4->_textField = v11;

    [(_MFMailRecipientTextField *)v4->_textField setAutoresizingMask:0];
    [(_MFMailRecipientTextField *)v4->_textField setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_MFMailRecipientTextField *)v4->_textField setDelegate:v4];
    [(_MFMailRecipientTextField *)v4->_textField setBorderStyle:0];
    v13 = v4->_textField;
    v14 = [(MFComposeRecipientView *)v4 baseFont];
    [(_MFMailRecipientTextField *)v13 setFont:v14];

    [(_MFMailRecipientTextField *)v4->_textField setForceEnableDictation:1];
    [(_MFMailRecipientTextField *)v4->_textField setKeyboardType:7];
    [(_MFMailRecipientTextField *)v4->_textField setAutocapitalizationType:0];
    [(_MFMailRecipientTextField *)v4->_textField setAutocorrectionType:1];
    [(MFComposeRecipientView *)v4 addSubview:v4->_textField];
    [(MFComposeRecipientView *)v4 setProperty:*MEMORY[0x1E4F498D0]];
    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v4 selector:sel_textChanged_ name:*MEMORY[0x1E4FB3018] object:v4->_textField];
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v4 action:sel__tapGestureRecognized_];
    tapGestureRecognizer = v4->_tapGestureRecognizer;
    v4->_tapGestureRecognizer = (UITapGestureRecognizer *)v16;

    [(UITapGestureRecognizer *)v4->_tapGestureRecognizer setDelegate:v4];
    [(MFComposeRecipientView *)v4 addGestureRecognizer:v4->_tapGestureRecognizer];
    uint64_t v18 = [MEMORY[0x1E4FB14D0] buttonWithType:5];
    addButton = v4->_addButton;
    v4->_addButton = (UIButton *)v18;

    v20 = v4->_addButton;
    v21 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v22 = [v21 localizedStringForKey:@"ADD_CONTACT_ACCESSIBILITY_LABEL" value:&stru_1F0817A00 table:@"Main"];
    [(UIButton *)v20 setAccessibilityLabel:v22];

    [(UIButton *)v4->_addButton setAutoresizingMask:0];
    [(UIButton *)v4->_addButton setAutoresizesSubviews:0];
    [(UIButton *)v4->_addButton setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v23) = 1148846080;
    [(UIButton *)v4->_addButton setContentHuggingPriority:0 forAxis:v23];
    LODWORD(v24) = 1148846080;
    [(UIButton *)v4->_addButton setContentCompressionResistancePriority:0 forAxis:v24];
    LODWORD(v25) = 1148846080;
    [(UIButton *)v4->_addButton setContentCompressionResistancePriority:1 forAxis:v25];
    [(UIButton *)v4->_addButton addTarget:v4 action:sel_addButtonClicked_ forControlEvents:64];
    [(MFComposeRecipientView *)v4 addSubview:v4->_addButton];
    [(MFComposeRecipientView *)v4 setAllowsDragAndDrop:0];
    v4->_editable = 1;
    [(MFComposeRecipientView *)v4 setHideLastAtomComma:1];
  }
  return v4;
}

- (void)dealloc
{
  [(MFComposeRecipientView *)self _cancelDelayTimer];
  atomPresentationOptionsByRecipient = self->_atomPresentationOptionsByRecipient;
  if (atomPresentationOptionsByRecipient) {
    CFRelease(atomPresentationOptionsByRecipient);
  }
  v4.receiver = self;
  v4.super_class = (Class)MFComposeRecipientView;
  [(MFComposeRecipientView *)&v4 dealloc];
}

- (MFComposeRecipientViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->super._delegate);

  return (MFComposeRecipientViewDelegate *)WeakRetained;
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MFComposeRecipientView;
  [(MFComposeHeaderView *)&v5 setLabel:v4];
  [(MFComposeRecipientView *)self _setNeedsReflow];
}

- (void)setEditable:(BOOL)a3
{
  if (self->_editable != a3)
  {
    BOOL v3 = a3;
    self->_editable = a3;
    objc_super v5 = [(NSMutableDictionary *)self->_atoms allValues];
    [v5 makeObjectsPerformSelector:sel_removeFromSuperview];

    if (v3) {
      [(MFComposeRecipientView *)self clearText];
    }
    [(MFComposeRecipientView *)self _reflowAnimated:0];
  }
}

- (void)setExpanded:(BOOL)a3
{
  if (self->_expanded != a3)
  {
    self->_expanded = a3;
    [(MFComposeRecipientView *)self _setNeedsReflow];
  }
}

- (NSString)text
{
  v2 = [(_MFMailRecipientTextField *)self->_textField searchText];
  BOOL v3 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  id v4 = [v2 stringByTrimmingCharactersInSet:v3];

  return (NSString *)v4;
}

- (double)offsetForRowWithTextField
{
  [(MFComposeRecipientView *)self bounds];
  double v3 = v2;
  [(id)objc_opt_class() preferredHeight];
  return v3 - v4;
}

- (int64_t)numberOfRowsOfTextInField
{
  [(MFComposeRecipientView *)self bounds];
  double v3 = v2 + -20.0;
  [(id)objc_opt_class() preferredHeight];
  return llround(v3 / (v4 + -20.0));
}

- (void)clearText
{
}

- (BOOL)hasContent
{
  double v3 = [(MFComposeRecipientView *)self recipients];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    objc_super v5 = [(MFComposeRecipientView *)self text];
    BOOL v4 = [v5 length] != 0;
  }
  return v4;
}

- (void)setProperty:(int)a3
{
  BOOL v4 = (void *)MEMORY[0x1E4F1C978];
  id v6 = [NSNumber numberWithInt:*(void *)&a3];
  objc_super v5 = objc_msgSend(v4, "arrayWithObject:");
  [(MFComposeRecipientView *)self setProperties:v5];
}

- (void)setProperties:(id)a3
{
}

- (NSArray)addresses
{
  return (NSArray *)[(NSMutableArray *)self->_recipients arrayByApplyingSelector:sel_commentedAddress];
}

- (id)uncommentedAddresses
{
  return (id)[(NSMutableArray *)self->_recipients arrayByApplyingSelector:sel_uncommentedAddress];
}

- (void)setAddresses:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  [(MFComposeRecipientView *)self layoutIfNeeded];
  v20 = self->_recipients;
  [(MFComposeRecipientView *)self _removeAllRecipients];
  BOOL v4 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v21, "count"));
  recipients = self->_recipients;
  self->_recipients = v4;

  double v23 = [(MFComposeRecipientView *)self delegate];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v21;
  uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v10 = [v23 composeRecipientView:self composeRecipientForAddress:v9];
        if (([(NSMutableArray *)self->_recipients containsObject:v10] & 1) == 0)
        {
          id v11 = v9;
          v12 = [v11 emailAddressValue];
          v13 = [v12 simpleAddress];
          v14 = v13;
          if (v13)
          {
            id v15 = v13;
          }
          else
          {
            id v15 = [v11 stringValue];
          }
          uint64_t v16 = v15;

          [(MFComposeRecipientView *)self _addUncommentedAddress:v16];
          [(NSMutableArray *)self->_recipients addObject:v10];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v6);
  }

  if (objc_opt_respondsToSelector())
  {
    if ([(NSMutableArray *)v20 count]) {
      v17 = v20;
    }
    else {
      v17 = 0;
    }
    if ([(NSMutableArray *)self->_recipients count]) {
      uint64_t v18 = self->_recipients;
    }
    else {
      uint64_t v18 = 0;
    }
    id WeakRetained = objc_loadWeakRetained(&self->super._delegate);
    [WeakRetained composeRecipientView:self didReplaceRecipients:v17 withRecipients:v18];
  }
  [(MFComposeRecipientView *)self _setNeedsReflow];
}

- (void)removeRecipient:(id)a3
{
  id v4 = a3;
  recipients = self->_recipients;
  if (recipients)
  {
    id v16 = v4;
    uint64_t v6 = -[NSMutableArray indexOfObject:](recipients, "indexOfObject:");
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v7 = [(MFComposeRecipientView *)self firstResponder];
      v8 = [v7 undoManager];

      [v8 registerUndoWithTarget:self selector:sel_addRecipient_ object:v16];
      if (([v8 isUndoing] & 1) == 0)
      {
        v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v10 = [v9 localizedStringForKey:@"ADDRESS_DELETION" value:&stru_1F0817A00 table:@"Main"];
        [v8 setActionName:v10];
      }
      id v11 = v16;
      [(MFComposeRecipientView *)self _removeAddressAtomPresentationOptionsForRecipient:v11];
      v12 = [(NSMutableDictionary *)self->_atoms objectForKey:v11];
      [v12 removeFromSuperview];

      [(NSMutableDictionary *)self->_atoms removeObjectForKey:v11];
      v13 = [v11 uncommentedAddress];
      [(MFComposeRecipientView *)self _removeUncommentedAddress:v13];

      [(NSMutableArray *)self->_recipients removeObjectAtIndex:v6];
      v14 = [(MFComposeRecipientView *)self delegate];
      if (objc_opt_respondsToSelector()) {
        [v14 composeRecipientView:self didRemoveRecipient:v11];
      }
      [(MFComposeRecipientView *)self _setNeedsReflow];
      id v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v15 postNotificationName:@"MFComposeRecipientTextViewDidChangeNotification" object:self userInfo:0];
    }
  }

  MEMORY[0x1F4181820]();
}

- (void)addRecipient:(id)a3
{
  id v4 = a3;
  [(MFComposeRecipientView *)self addRecipient:v4 index:[(NSMutableArray *)self->_recipients count] animate:0];
}

- (void)addRecipient:(id)a3 index:(unint64_t)a4 animate:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ([v8 isGroup])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v9 = objc_msgSend(v8, "children", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v9);
          }
          [(MFComposeRecipientView *)self addRecipient:*(void *)(*((void *)&v20 + 1) + 8 * i) index:a4 animate:v5];
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v10);
    }
LABEL_24:

    goto LABEL_25;
  }
  if (v8)
  {
    if (([(NSMutableArray *)self->_recipients containsObject:v8] & 1) == 0)
    {
      [(NSMutableArray *)self->_recipients insertObject:v8 atIndex:a4];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v13 = [(MFComposeRecipientView *)self firstResponder];
        v14 = [v13 undoManager];

        [v14 registerUndoWithTarget:self selector:sel_removeRecipient_ object:v8];
        if (([v14 isUndoing] & 1) == 0)
        {
          id v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          id v16 = [v15 localizedStringForKey:@"ADDRESS_ADDITION" value:&stru_1F0817A00 table:@"Main"];
          [v14 setActionName:v16];
        }
        v17 = [v8 uncommentedAddress];
        [(MFComposeRecipientView *)self _addUncommentedAddress:v17];

        uint64_t v18 = [(MFComposeRecipientView *)self delegate];
        if (objc_opt_respondsToSelector())
        {
          id v24 = v8;
          v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
          [v18 composeRecipientView:self didAddRecipients:v19];
        }
        else if (objc_opt_respondsToSelector())
        {
          [v18 composeRecipientView:self didAddRecipient:v8];
        }
      }
    }
    if (v5) {
      [(MFComposeRecipientView *)self _reflowAnimated:1];
    }
    else {
      [(MFComposeRecipientView *)self _setNeedsReflow];
    }
    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 postNotificationName:@"MFComposeRecipientTextViewDidChangeNotification" object:self userInfo:0];
    goto LABEL_24;
  }
LABEL_25:
}

- (void)addAddress:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  BOOL v5 = [WeakRetained composeRecipientView:self composeRecipientForAddress:v6];

  [(MFComposeRecipientView *)self addRecipient:v5];
}

- (void)_addRecord:(void *)a3 identifier:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  id v8 = [WeakRetained composeRecipientView:self composeRecipientForRecord:a3 identifier:v4];

  [(MFComposeRecipientView *)self addRecipient:v8];
}

- (void)addRecord:(void *)a3 property:(int)a4 identifier:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v10 = [(MFComposeRecipientView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v9 = [v10 composeRecipientView:self composeRecipientForRecord:a3 property:v6 identifier:v5];
    [(MFComposeRecipientView *)self addRecipient:v9];
  }
  else
  {
    [(MFComposeRecipientView *)self _addRecord:a3 identifier:v5];
  }
}

- (void)setPlaceholderRecipient:(id)a3
{
  uint64_t v4 = (MFComposeRecipient *)a3;
  if (self->_placeholderRecipient)
  {
    atoms = self->_atoms;
    uint64_t v6 = [(MFComposeRecipientView *)self placeholderRecipient];
    uint64_t v7 = [(NSMutableDictionary *)atoms objectForKey:v6];
    [v7 removeFromSuperview];

    id v8 = self->_atoms;
    v9 = [(MFComposeRecipientView *)self placeholderRecipient];
    [(NSMutableDictionary *)v8 removeObjectForKey:v9];

    recipients = self->_recipients;
    uint64_t v11 = [(MFComposeRecipientView *)self placeholderRecipient];
    [(NSMutableArray *)recipients removeObject:v11];
  }
  placeholderRecipient = self->_placeholderRecipient;
  self->_placeholderRecipient = v4;
}

- (MFComposeRecipient)placeholderRecipient
{
  return self->_placeholderRecipient;
}

- (void)setAddressAtomPresentationOptions:(unint64_t)a3 forRecipient:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    key = v6;
    atomPresentationOptionsByRecipient = self->_atomPresentationOptionsByRecipient;
    if (!atomPresentationOptionsByRecipient)
    {
      atomPresentationOptionsByRecipient = CFDictionaryCreateMutable(0, 0, 0, 0);
      self->_atomPresentationOptionsByRecipient = atomPresentationOptionsByRecipient;
    }
    CFDictionarySetValue(atomPresentationOptionsByRecipient, key, (const void *)a3);
    id v8 = [(NSMutableDictionary *)self->_atoms objectForKey:key];
    v9 = v8;
    if (v8) {
      [v8 setPresentationOptions:a3];
    }

    id v6 = key;
  }
}

- (void)_removeAddressAtomPresentationOptionsForRecipient:(id)a3
{
  id key = a3;
  atomPresentationOptionsByRecipient = self->_atomPresentationOptionsByRecipient;
  if (atomPresentationOptionsByRecipient) {
    CFDictionaryRemoveValue(atomPresentationOptionsByRecipient, key);
  }
}

- (unint64_t)_addressAtomPresentationOptionsForRecipient:(id)a3
{
  id v4 = a3;
  defaultAtomPresentationOptions = (void *)self->_defaultAtomPresentationOptions;
  value = defaultAtomPresentationOptions;
  atomPresentationOptionsByRecipient = self->_atomPresentationOptionsByRecipient;
  if (atomPresentationOptionsByRecipient)
  {
    CFDictionaryGetValueIfPresent(atomPresentationOptionsByRecipient, v4, (const void **)&value);
    defaultAtomPresentationOptions = value;
  }

  return (unint64_t)defaultAtomPresentationOptions;
}

- (void)clearAllAddressAtomPresentationOptions
{
  atomPresentationOptionsByRecipient = self->_atomPresentationOptionsByRecipient;
  if (atomPresentationOptionsByRecipient)
  {
    CFRelease(atomPresentationOptionsByRecipient);
    self->_atomPresentationOptionsByRecipient = 0;
  }
}

- (BOOL)containsAddress:(id)a3
{
  id v4 = a3;
  uncommentedAddresses = self->_uncommentedAddresses;
  id v6 = v4;
  uint64_t v7 = [v6 emailAddressValue];
  id v8 = [v7 simpleAddress];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [v6 stringValue];
  }
  uint64_t v11 = v10;

  BOOL v12 = [(NSCountedSet *)uncommentedAddresses countForObject:v11] != 0;
  return v12;
}

- (void)_addUncommentedAddress:(id)a3
{
  id v4 = a3;
  if (v4) {
    [(NSCountedSet *)self->_uncommentedAddresses addObject:v4];
  }
}

- (void)_removeUncommentedAddress:(id)a3
{
  id v4 = a3;
  if (v4) {
    [(NSCountedSet *)self->_uncommentedAddresses removeObject:v4];
  }
}

- (void)_removeAllRecipients
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  double v3 = [(NSMutableDictionary *)self->_atoms allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v6++) removeFromSuperview];
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  [(NSMutableDictionary *)self->_atoms removeAllObjects];
  [(MFComposeRecipientView *)self clearAllAddressAtomPresentationOptions];
  [(NSCountedSet *)self->_uncommentedAddresses removeAllObjects];
  recipients = self->_recipients;
  self->_recipients = 0;
}

- (BOOL)_addable
{
  return !self->_maxRecipients
      || (unint64_t)[(NSMutableArray *)self->_recipients count] < self->_maxRecipients;
}

- (void)keyboardInputChangedSelection:(id)a3
{
  if (self->_selectedAtom && self->_deselectOnNextKeyboardInput) {
    [(MFComposeRecipientView *)self _deselectAtom];
  }
  else {
    self->_deselectOnNextKeyboardInput = 1;
  }
}

- (void)selectComposeRecipientAtom:(id)a3
{
  uint64_t v5 = (MFModernComposeRecipientAtom *)a3;
  if (self->_selectedAtom != v5)
  {
    if (([(_MFMailRecipientTextField *)self->_textField isFirstResponder] & 1) == 0)
    {
      self->_deselectOnNextKeyboardInput = 0;
      uint64_t v6 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __53__MFComposeRecipientView_selectComposeRecipientAtom___block_invoke;
      v8[3] = &unk_1E5F79088;
      v8[4] = self;
      id v7 = (id)[v6 afterDelay:v8 performBlock:0.1];
    }
    [(MFComposeRecipientView *)self finishEnteringRecipient];
    [(MFComposeRecipientView *)self _deselectAtom];
    [(_MFMailRecipientTextField *)self->_textField _clearSelectionUI];
    [(MFModernAtomView *)v5 setSelected:1 animated:1];
    objc_storeStrong((id *)&self->_selectedAtom, a3);
  }
}

uint64_t __53__MFComposeRecipientView_selectComposeRecipientAtom___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 456) becomeFirstResponder];
}

- (void)deselectComposeRecipientAtom:(id)a3
{
  if (self->_selectedAtom == a3) {
    [(MFComposeRecipientView *)self _deselectAtom];
  }
}

- (BOOL)_shouldShowCorecipientsIndicatorAtom
{
  return 0;
}

- (void)reflow
{
}

- (void)_reflowAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(MFComposeRecipientView *)self _addable];
  BOOL v7 = !+[MFAddressBookManager isAuthorizedToUseAddressBook]|| !self->_expanded;
  [(UIButton *)self->_addButton setHidden:v7];
  if (self->_editable)
  {
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    v28[3] = 0xAAAAAAAAAAAAAAAALL;
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x2020000000;
    char v27 = -86;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __42__MFComposeRecipientView__reflowAnimated___block_invoke;
    aBlock[3] = &unk_1E5F79E80;
    aBlock[4] = self;
    aBlock[5] = v28;
    aBlock[6] = v26;
    long long v8 = _Block_copy(aBlock);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __42__MFComposeRecipientView__reflowAnimated___block_invoke_2;
    v24[3] = &unk_1E5F79EA8;
    v24[4] = self;
    v24[5] = v28;
    v24[6] = v26;
    long long v9 = _Block_copy(v24);
    double v10 = 0.200000003;
    if (!v3) {
      double v10 = 0.0;
    }
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v8 animations:v9 completion:v10];

    _Block_object_dispose(v26, 8);
    _Block_object_dispose(v28, 8);
  }
  else
  {
    [(MFComposeRecipientView *)self frame];
    double v12 = v11;
    [(id)objc_opt_class() preferredHeight];
    double v14 = v13;
    if ([(MFComposeRecipientView *)self isSeparatorHidden])
    {
      +[MFComposeHeaderView separatorHeight];
      double v14 = v14 - v15;
    }
    v28[0] = 0xAAAAAAAAAAAAAAAALL;
    LOBYTE(v26[0]) = -86;
    [(MFComposeRecipientView *)self _updateLayoutConstraintsAndGetNumberOfRows:v28 textFieldWillBeLastRow:v26];
    [(MFComposeHeaderView *)self layoutSubviews];
    recipients = self->_recipients;
    [(MFComposeRecipientView *)self _topRowTextWidth];
    double v18 = v17;
    v19 = [(MFComposeRecipientView *)self baseFont];
    long long v20 = [(NSMutableArray *)recipients mf_commaSeparatedRecipientListWithWidth:v19 forFont:&__block_literal_global_12 usingBlock:v18];

    textField = self->_textField;
    long long v22 = [(MFComposeRecipientView *)self tintColor];
    [(_MFMailRecipientTextField *)textField setTextColor:v22];

    [(_MFMailRecipientTextField *)self->_textField setText:v20];
    id WeakRetained = objc_loadWeakRetained(&self->super._delegate);
    objc_msgSend(WeakRetained, "composeRecipientView:didChangeSize:", self, v12, v14);
  }
  self->_needsReflow = 0;
}

uint64_t __42__MFComposeRecipientView__reflowAnimated___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(*(void *)(a1 + 32) + 456);
  BOOL v3 = [MEMORY[0x1E4FB1618] mailModernLabelledAtomDefaultTextColor];
  [v2 setTextColor:v3];

  uint64_t v4 = [*(id *)(a1 + 32) recipients];
  uint64_t v5 = [v4 count];

  unsigned int v22 = [MEMORY[0x1E4FB1EB0] areAnimationsEnabled];
  [MEMORY[0x1E4FB1EB0] setAnimationsEnabled:0];
  if (v5)
  {
    uint64_t v6 = 0;
    double v7 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    do
    {
      double v11 = [*(id *)(a1 + 32) recipients];
      double v12 = [v11 objectAtIndexedSubscript:v6];

      double v13 = [*(id *)(a1 + 32) atoms];
      double v14 = [v13 objectForKeyedSubscript:v12];

      if (!v14)
      {
        double v15 = -[MFModernComposeRecipientAtom initWithFrame:recipient:presentationOptions:]([MFModernComposeRecipientAtom alloc], "initWithFrame:recipient:presentationOptions:", v12, 0, v7, v8, v9, v10);
        [(MFModernComposeRecipientAtom *)v15 setDelegate:*(void *)(a1 + 32)];
        id v16 = [*(id *)(a1 + 32) atoms];
        [v16 setObject:v15 forKeyedSubscript:v12];

        objc_opt_class();
        double v14 = v15;
        if (objc_opt_isKindOfClass()) {
          [(MFModernComposeRecipientAtom *)v15 setHidden:1];
        }
      }
      BOOL v18 = 0;
      if (v5 - 1 == v6)
      {
        double v17 = *(unsigned char **)(a1 + 32);
        if (!v17[538] || ![v17 hideLastAtomComma]) {
          BOOL v18 = 1;
        }
      }
      [v14 setSeparatorHidden:v18];
      [v14 tintColorDidChange];
      [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
      objc_msgSend(v14, "setPresentationOptions:", objc_msgSend(*(id *)(a1 + 32), "_addressAtomPresentationOptionsForRecipient:", v12));
      if (*(void *)(*(void *)(a1 + 32) + 600)) {
        objc_msgSend(v14, "setTitleFont:");
      }
      v19 = [v14 superview];

      if (!v19) {
        [*(id *)(a1 + 32) addSubview:v14];
      }

      ++v6;
    }
    while (v5 != v6);
  }
  [MEMORY[0x1E4FB1EB0] setAnimationsEnabled:v22];
  [*(id *)(a1 + 32) _updateLayoutConstraintsAndGetNumberOfRows:*(void *)(*(void *)(a1 + 40) + 8) + 24 textFieldWillBeLastRow:*(void *)(*(void *)(a1 + 48) + 8) + 24];
  long long v20 = *(void **)(a1 + 32);

  return [v20 layoutIfNeeded];
}

void __42__MFComposeRecipientView__reflowAnimated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) frame];
  double v3 = v2;
  uint64_t v4 = *(unsigned char **)(a1 + 32);
  if (!v4[538])
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    unint64_t v6 = *(void *)(v5 + 24);
    if (v6 >= 2)
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
      {
        *(void *)(v5 + 24) = v6 - 1;
        uint64_t v4 = *(unsigned char **)(a1 + 32);
      }
    }
  }
  [v4 labelTopPadding];
  double v8 = v7;
  [*(id *)(*(void *)(a1 + 32) + 416) frame];
  double v10 = v8 + v9;
  [*(id *)(*(void *)(a1 + 32) + 416) _baselineOffsetFromBottom];
  double v12 = v10 - v11;
  [(id)objc_opt_class() preferredHeight];
  double v14 = v13 + (double)(unint64_t)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) - 1) * v12;
  if ([*(id *)(a1 + 32) isSeparatorHidden])
  {
    +[MFComposeHeaderView separatorHeight];
    double v14 = v14 - v15;
  }
  id v18 = [*(id *)(a1 + 32) delegate];
  id v16 = [*(id *)(a1 + 32) superview];
  if (v16)
  {
    char v17 = objc_opt_respondsToSelector();

    if (v17) {
      objc_msgSend(v18, "composeRecipientView:didChangeSize:", *(void *)(a1 + 32), v3, v14);
    }
  }
}

id __42__MFComposeRecipientView__reflowAnimated___block_invoke_3(uint64_t a1, void *a2)
{
  double v2 = [a2 displayString];

  return v2;
}

- (void)showCorecipientIndicator:(BOOL)a3 withCorecipients:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  id v8 = a4;
  if ([(MFComposeRecipientView *)self _shouldShowCorecipientsIndicatorAtom])
  {
    if (v6)
    {
      uint64_t v9 = [v8 count];
      p_corecipientsIndicatorAtom = (id *)&self->_corecipientsIndicatorAtom;
      corecipientsIndicatorAtom = self->_corecipientsIndicatorAtom;
      if (!v9)
      {
        [(MFCorecipientsIndicatorAtom *)corecipientsIndicatorAtom setRecipients:0];
        goto LABEL_11;
      }
      if (!corecipientsIndicatorAtom)
      {
        double v12 = objc_alloc_init(MFCorecipientsIndicatorAtom);
        id v13 = *p_corecipientsIndicatorAtom;
        id *p_corecipientsIndicatorAtom = v12;

        [*p_corecipientsIndicatorAtom setDelegate:self];
        [(MFComposeRecipientView *)self addSubview:*p_corecipientsIndicatorAtom];
        corecipientsIndicatorAtom = (MFCorecipientsIndicatorAtom *)*p_corecipientsIndicatorAtom;
      }
      [(MFCorecipientsIndicatorAtom *)corecipientsIndicatorAtom setRecipients:v8];
      [*p_corecipientsIndicatorAtom setTitle:@" ..."];
      [*p_corecipientsIndicatorAtom setAlpha:0.649999976];
      if (v5 && [*p_corecipientsIndicatorAtom isHidden])
      {
        [*p_corecipientsIndicatorAtom setAlpha:0.0];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __77__MFComposeRecipientView_showCorecipientIndicator_withCorecipients_animated___block_invoke;
        v14[3] = &unk_1E5F79088;
        v14[4] = self;
        [MEMORY[0x1E4FB1EB0] animateWithDuration:v14 animations:0.319999993];
      }
    }
    else
    {
      p_corecipientsIndicatorAtom = (id *)&self->_corecipientsIndicatorAtom;
      [(MFCorecipientsIndicatorAtom *)self->_corecipientsIndicatorAtom setRecipients:0];
    }
    [*p_corecipientsIndicatorAtom setHidden:!v6];
LABEL_11:
    [(MFComposeRecipientView *)self _reflowAnimated:v5];
  }
}

uint64_t __77__MFComposeRecipientView_showCorecipientIndicator_withCorecipients_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 616) setAlpha:0.649999976];
}

- (void)addButtonClicked:(id)a3
{
  id v4 = [(MFComposeRecipientView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 composeRecipientViewRequestAddRecipient:self];
  }
}

- (void)setSeparatorHidden:(BOOL)a3
{
  if (self->_separatorHidden != a3)
  {
    self->_separatorHidden = a3;
    -[UIView setHidden:](self->super._separator, "setHidden:");
  }
}

- (void)refreshPreferredContentSize
{
  v6.receiver = self;
  v6.super_class = (Class)MFComposeRecipientView;
  [(MFComposeHeaderView *)&v6 refreshPreferredContentSize];
  textField = self->_textField;
  id v4 = [(MFComposeRecipientView *)self baseFont];
  [(_MFMailRecipientTextField *)textField setFont:v4];

  [(MFComposeRecipientView *)self setEditable:0];
  if (self->_textFieldConstraints)
  {
    -[MFComposeRecipientView removeConstraints:](self, "removeConstraints:");
    textFieldConstraints = self->_textFieldConstraints;
    self->_textFieldConstraints = 0;
  }
  [(MFComposeHeaderView *)self layoutSubviews];
  [(MFComposeRecipientView *)self reflow];
}

- (void)setBaseFont:(id)a3
{
  p_baseFont = &self->_baseFont;
  id v6 = a3;
  if ((-[UIFont isEqual:](*p_baseFont, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_baseFont, a3);
    [(_MFMailRecipientTextField *)self->_textField setFont:*p_baseFont];
    [(MFComposeRecipientView *)self _setNeedsReflow];
  }
}

- (UIFont)baseFont
{
  double v2 = self->_baseFont;
  if (!v2)
  {
    double v2 = [(id)objc_opt_class() defaultFont];
  }

  return v2;
}

- (BOOL)mf_textFieldShowingSearchResults:(id)a3
{
  id v4 = [(MFComposeRecipientView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v5 = [v4 composeRecipientViewShowingSearchResults:self];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (void)mf_selectNextSearchResultForTextField:(id)a3
{
  id v4 = [(MFComposeRecipientView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 selectNextSearchResultForComposeRecipientView:self];
  }
}

- (void)mf_selectPreviousSearchResultForTextField:(id)a3
{
  id v4 = [(MFComposeRecipientView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 selectPreviousSearchResultForComposeRecipientView:self];
  }
}

- (BOOL)mf_presentSearchResultsForTextField:(id)a3
{
  id v4 = [(MFComposeRecipientView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v5 = [v4 presentSearchResultsForComposeRecipientView:self];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)mf_chooseSelectedSearchResultForTextField:(id)a3
{
  id v4 = [(MFComposeRecipientView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v5 = [v4 chooseSelectedSearchResultForComposeRecipientView:self];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (void)mf_dismissSearchResults:(id)a3
{
  id v4 = [(MFComposeRecipientView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 dismissSearchResultsForComposeRecipientView:self];
  }
}

- (void)mf_recipientTextField:(id)a3 didAddRecipientAddress:(id)a4
{
  id v6 = a4;
  char v5 = [(MFComposeRecipientView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 composeRecipientView:self didFinishEnteringAddress:v6];
  }
}

- (void)textFieldDidBecomeFirstResponder:(id)a3
{
  [(MFComposeRecipientView *)self setDidIgnoreFirstResponderResign:0];
  id v6 = [(MFComposeRecipientView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 recipientViewDidBecomeFirstResponder:self];
  }
  if (objc_opt_respondsToSelector()) {
    [v6 composeRecipientViewDidBecomeFirstResponder:self];
  }
  if (![(MFComposeRecipientView *)self _addable])
  {
    id v4 = [(NSMutableArray *)self->_recipients lastObject];
    char v5 = [(NSMutableDictionary *)self->_atoms objectForKey:v4];
    [(MFComposeRecipientView *)self selectComposeRecipientAtom:v5];
  }
  if (self->_clearSelectionUIAfterFirstResponder)
  {
    self->_clearSelectionUIAfterFirstResponder = 0;
    [(_MFMailRecipientTextField *)self->_textField _clearSelectionUI];
  }
  if ([(MFComposeRecipientView *)self editable]) {
    [(MFComposeRecipientView *)self setExpanded:1];
  }
}

- (void)textFieldDidResignFirstResponder:(id)a3
{
  id v4 = [(MFComposeRecipientView *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [v4 recipientViewShouldIgnoreFirstResponderChanges:self])
  {
    [(MFComposeRecipientView *)self setDidIgnoreFirstResponderResign:1];
  }
  else
  {
    [(MFComposeRecipientView *)self finishEnteringRecipient];
    if (objc_opt_respondsToSelector()) {
      [v4 recipientViewDidResignFirstResponder:self];
    }
    [(MFComposeRecipientView *)self _deselectAtom];
    [(MFComposeRecipientView *)self setExpanded:0];
  }
}

- (void)composeRecipientAtomShowPersonCard:(id)a3
{
  id v5 = a3;
  id v4 = [(MFComposeRecipientView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 composeRecipientView:self showPersonCardForAtom:v5];
  }
}

- (void)didTapShowCorecipientsForIndicatorAtom:(id)a3 recipients:(id)a4
{
  id v6 = a4;
  id v5 = [(MFComposeRecipientView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 composeRecipientView:self showCorecipients:v6];
  }
}

- (BOOL)becomeFirstResponder
{
  return [(_MFMailRecipientTextField *)self->_textField becomeFirstResponder];
}

- (void)_cancelDelayTimer
{
  [(NSTimer *)self->_delayTimer invalidate];
  delayTimer = self->_delayTimer;
  self->_delayTimer = 0;
}

- (void)_delayTimerFired:(id)a3
{
  [(MFComposeRecipientView *)self _cancelDelayTimer];
  id WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  id v4 = [(MFComposeRecipientView *)self text];
  [WeakRetained composeRecipientView:self textDidChange:v4];
}

- (void)composeRecipientAtomSelectPrevious:(id)a3
{
  id v4 = a3;
  recipients = self->_recipients;
  id v12 = v4;
  id v6 = [v4 recipient];
  uint64_t v7 = [(NSMutableArray *)recipients indexOfObject:v6];

  if (v7) {
    BOOL v8 = v7 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    atoms = self->_atoms;
    double v10 = [(NSMutableArray *)self->_recipients objectAtIndex:v7 - 1];
    double v11 = [(NSMutableDictionary *)atoms objectForKey:v10];
    [v11 becomeFirstResponder];
  }
}

- (void)composeRecipientAtomSelectNext:(id)a3
{
  id v4 = a3;
  recipients = self->_recipients;
  id v11 = v4;
  id v6 = [v4 recipient];
  unint64_t v7 = [(NSMutableArray *)recipients indexOfObject:v6];

  if (v7 >= [(NSMutableArray *)self->_recipients count] - 1)
  {
    [(MFComposeRecipientView *)self becomeFirstResponder];
  }
  else
  {
    atoms = self->_atoms;
    uint64_t v9 = [(NSMutableArray *)self->_recipients objectAtIndex:v7 + 1];
    double v10 = [(NSMutableDictionary *)atoms objectForKey:v9];
    [v10 becomeFirstResponder];
  }
}

- (void)textChanged:(id)a3
{
  id v7 = a3;
  if (self->_inputDelay <= 0.0)
  {
    id WeakRetained = objc_loadWeakRetained(&self->super._delegate);
    id v5 = [(MFComposeRecipientView *)self text];
    [WeakRetained composeRecipientView:self textDidChange:v5];
  }
  else if (self->_delayTimer)
  {
    id WeakRetained = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:self->_inputDelay];
    [(NSTimer *)self->_delayTimer setFireDate:WeakRetained];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1CB00], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__delayTimerFired_, 0, 0);
    id v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    id WeakRetained = self->_delayTimer;
    self->_delayTimer = v6;
  }
}

- (void)_deselectAtom
{
  selectedAtom = self->_selectedAtom;
  if (selectedAtom)
  {
    [(MFModernAtomView *)selectedAtom setSelected:0 animated:1];
    id v4 = self->_selectedAtom;
    self->_selectedAtom = 0;
  }
}

- (void)_deleteSelectedAtom
{
  double v3 = [(MFModernComposeRecipientAtom *)self->_selectedAtom recipient];
  [(MFComposeRecipientView *)self removeRecipient:v3];

  [(MFComposeRecipientView *)self _deselectAtom];
  textField = self->_textField;

  [(_MFMailRecipientTextField *)textField _resetSelectionUI];
}

- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5
{
  id v6 = a4;
  if ([v6 isEqual:@","])
  {
    BOOL v7 = ![(MFComposeRecipientView *)self finishEnteringRecipient];
  }
  else
  {
    if (self->_selectedAtom) {
      [(MFComposeRecipientView *)self _deleteSelectedAtom];
    }
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (BOOL)keyboardInputShouldDelete:(id)a3
{
  id v4 = [(_MFMailRecipientTextField *)self->_textField text];
  uint64_t v5 = [v4 length];
  BOOL v6 = v5 != 0;
  if (!v5)
  {
    BOOL v7 = [(_MFMailRecipientTextField *)self->_textField isShowingDictationPlaceholder];

    if (v7) {
      return 1;
    }
    if (self->_selectedAtom)
    {
      [(MFComposeRecipientView *)self _deleteSelectedAtom];
      return 0;
    }
    atoms = self->_atoms;
    id v4 = [(NSMutableArray *)self->_recipients lastObject];
    double v10 = [(NSMutableDictionary *)atoms objectForKey:v4];
    [(MFComposeRecipientView *)self selectComposeRecipientAtom:v10];
  }
  return v6;
}

- (double)textFieldOffsetForNumberOfRowsToScroll:(unint64_t)a3 numberOfRowsAboveField:(int64_t)a4
{
  unint64_t v6 = [(MFComposeRecipientView *)self numberOfRowsOfTextInField];
  if (a4 >= a3) {
    uint64_t v7 = a3;
  }
  else {
    uint64_t v7 = a4;
  }
  unint64_t v8 = a3 - v7;
  if (v6 < a3 - v7) {
    unint64_t v8 = v6;
  }
  if (a4 >= a3) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = v8;
  }
  double v10 = 0.0;
  double v11 = 0.0;
  if (v7 >= 1)
  {
    double v12 = (double)v7;
    [(id)objc_opt_class() preferredHeight];
    double v11 = v13 * v12;
  }
  if (v9 >= 1)
  {
    [(id)objc_opt_class() preferredHeight];
    double v10 = (v14 + -20.0) * (double)v9;
  }
  return v11 + v10;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = [(MFComposeRecipientView *)self delegate];
  if (![(MFComposeRecipientView *)self finishEnteringRecipient]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v4 composeRecipientViewReturnPressed:self];
  }

  return 0;
}

- (void)parentWillClose
{
  self->_parentIsClosing = 1;
}

- (void)parentDidClose
{
  self->_parentIsClosing = 0;
}

- (BOOL)finishEnteringRecipient
{
  if (self->_parentIsClosing) {
    return 0;
  }
  if (!self->_editable) {
    return 0;
  }
  id v4 = [(MFComposeRecipientView *)self text];
  uint64_t v5 = [v4 length];

  if (!v5) {
    return 0;
  }
  unint64_t v6 = [(MFComposeRecipientView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [(MFComposeRecipientView *)self text];
    [v6 composeRecipientView:self didFinishEnteringAddress:v7];
  }
  return 1;
}

- (double)_topRowTextWidth
{
  textField = self->_textField;
  [(_MFMailRecipientTextField *)textField frame];
  -[_MFMailRecipientTextField alignmentRectForFrame:](textField, "alignmentRectForFrame:");
  double Width = CGRectGetWidth(v7);
  if (self->_editable)
  {
    [(UIButton *)self->_addButton frame];
    return Width - v5;
  }
  return Width;
}

- (void)_updateLayoutConstraintsAndGetNumberOfRows:(unint64_t *)a3 textFieldWillBeLastRow:(BOOL *)a4
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v4 = [(MFComposeRecipientView *)self superview];

  if (!v4) {
    return;
  }
  p_textFieldConstraints = &self->_textFieldConstraints;
  if (self->_textFieldConstraints)
  {
    -[MFComposeRecipientView removeConstraints:](self, "removeConstraints:");
    unint64_t v6 = *p_textFieldConstraints;
    *p_textFieldConstraints = 0;
  }
  location = (id *)&self->_textFieldConstraints;
  id v82 = [MEMORY[0x1E4F1CA48] array];
  CGRect v7 = self;
  firstValue = self->super._labelView;
  [(MFComposeRecipientView *)self bounds];
  double v9 = v8;
  double v10 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v11 = [v10 userInterfaceLayoutDirection];

  [(MFHeaderLabelView *)self->super._labelView frame];
  if (v11) {
    double MaxX = v9 - CGRectGetMinX(*(CGRect *)&v12);
  }
  else {
    double MaxX = CGRectGetMaxX(*(CGRect *)&v12);
  }
  unint64_t v17 = 0x1E4F28000;
  if (![(NSMutableArray *)self->_recipients count])
  {
    uint64_t v58 = 1;
    goto LABEL_35;
  }
  -[UIButton sizeThatFits:](self->_addButton, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v19 = v18;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id obj = self->_recipients;
  uint64_t v20 = [(NSMutableArray *)obj countByEnumeratingWithState:&v87 objects:v97 count:16];
  long long v21 = 0;
  if (!v20)
  {
    uint64_t v23 = 1;
    double v24 = MaxX;
    goto LABEL_34;
  }
  uint64_t v83 = *(void *)v88;
  double v22 = v19 + 15.0;
  uint64_t v23 = 1;
  double v24 = MaxX;
  do
  {
    uint64_t v84 = v20;
    for (uint64_t i = 0; i != v84; ++i)
    {
      if (*(void *)v88 != v83) {
        objc_enumerationMutation(obj);
      }
      uint64_t v26 = [(NSMutableDictionary *)v7->_atoms objectForKey:*(void *)(*((void *)&v87 + 1) + 8 * i)];
      [v26 setTranslatesAutoresizingMaskIntoConstraints:0];
      LODWORD(v27) = 1148846080;
      [v26 setContentHuggingPriority:0 forAxis:v27];
      LODWORD(v28) = 1148846080;
      [v26 setContentCompressionResistancePriority:1 forAxis:v28];
      [v26 layoutIfNeeded];
      uint64_t v29 = [v26 superview];
      BOOL v30 = v29 == 0;

      if (!v30)
      {
        v31 = self;
        v32 = self->super._labelView;
        v33 = v32;
        if (v23 == 1) {
          double v34 = v22;
        }
        else {
          double v34 = 0.0;
        }
        double v35 = v9 - v34 - v24;
        if (v21)
        {
          [v26 preferredWidth];
          if (v36 > v35)
          {

            unint64_t v37 = v23 + 1;
            double v24 = MaxX;
            double v35 = v9 - MaxX;
            v31 = self;
            goto LABEL_22;
          }
          v49 = v21;

          v33 = v49;
          v31 = self;
LABEL_24:
          if (v33 == v31->super._labelView)
          {
            double v51 = 0.0;
          }
          else
          {
            [v26 edgeInsets];
            double v51 = -v50;
          }
          v52 = (void *)MEMORY[0x1E4F28DC8];
          v95[0] = @"PADDING";
          v38 = [NSNumber numberWithDouble:v51];
          v95[1] = @"maximumAtomWidth";
          v96[0] = v38;
          v47 = [NSNumber numberWithDouble:v35];
          v96[1] = v47;
          v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v96 forKeys:v95 count:2];
          v54 = _NSDictionaryOfVariableBindings(&cfstr_AlignmentviewA.isa, v33, v26, 0);
          v48 = [v52 constraintsWithVisualFormat:@"[alignmentView]-(PADDING)-[atomView(<=maximumAtomWidth)]" options:2048 metrics:v53 views:v54];
        }
        else
        {
          if (v32) {
            goto LABEL_24;
          }
          unint64_t v37 = v23;
LABEL_22:
          uint64_t v23 = v37;
          v38 = [MEMORY[0x1E4F28DC8] constraintWithItem:v26 attribute:11 relatedBy:0 toItem:v31->super._labelView attribute:11 multiplier:(double)v37 constant:0.0];
          [v26 edgeInsets];
          double v40 = v39;
          [(MFComposeRecipientView *)v31 layoutMargins];
          v42 = (void *)MEMORY[0x1E4F28DC8];
          v93[0] = @"PADDING";
          v43 = [NSNumber numberWithDouble:v41 + 0.0 - v40];
          v93[1] = @"maximumAtomWidth";
          v94[0] = v43;
          v44 = [NSNumber numberWithDouble:v35];
          v94[1] = v44;
          v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v94 forKeys:v93 count:2];
          v46 = _NSDictionaryOfVariableBindings(&cfstr_Atomview.isa, v26, 0);
          v47 = [v42 constraintsWithVisualFormat:@"|-(PADDING)-[atomView(<=maximumAtomWidth)]" options:2 metrics:v45 views:v46];

          v48 = [v47 arrayByAddingObject:v38];
          v33 = 0;
        }

        [v26 preferredWidth];
        double v56 = v55;
        [v82 addObjectsFromArray:v48];
        id v57 = v26;

        long long v21 = (MFHeaderLabelView *)v57;
        double v24 = v24 + v56;
        firstValue = v21;
      }

      CGRect v7 = self;
    }
    uint64_t v20 = [(NSMutableArray *)obj countByEnumeratingWithState:&v87 objects:v97 count:16];
  }
  while (v20);
LABEL_34:

  double MaxX = v24;
  uint64_t v58 = v23;
  CGRect v7 = self;
  unint64_t v17 = 0x1E4F28000uLL;
LABEL_35:
  if (firstValue == v7->super._labelView) {
    double v59 = 4.0;
  }
  else {
    double v59 = 0.0;
  }
  v91[0] = @"HORIZ_INSET";
  v60 = *(void **)(v17 + 3792);
  [(MFComposeRecipientView *)v7 layoutMargins];
  v62 = [v60 numberWithDouble:v61];
  v92[0] = v62;
  v91[1] = @"PADDING";
  v63 = [*(id *)(v17 + 3792) numberWithDouble:v59];
  v92[1] = v63;
  v92[2] = &unk_1F0841A58;
  v91[2] = @"BUTTON_PADDING";
  v91[3] = @"SPACE";
  v92[3] = &unk_1F0841A68;
  v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:v91 count:4];

  double v65 = MaxX + 80.0;
  if (v58 == 1 && v65 <= v9)
  {
    unint64_t v66 = 1;
    v67 = @"%@-[_textField]-(SPACE)-[_addButton]-(BUTTON_PADDING)-|";
  }
  else
  {
    v68 = (void *)MEMORY[0x1E4F28DC8];
    v69 = _NSDictionaryOfVariableBindings(&cfstr_Addbutton.isa, self->_addButton, 0);
    v70 = [v68 constraintsWithVisualFormat:@"[_addButton]-(BUTTON_PADDING)-|" options:0 metrics:v64 views:v69];
    [v82 addObjectsFromArray:v70];

    v67 = @"%@-[_textField]-(BUTTON_PADDING)-|";
    unint64_t v66 = v58;
  }
  v71 = _NSDictionaryOfVariableBindings(&cfstr_Textfieldbuddy.isa, firstValue, self->_textField, self->_addButton, 0);
  if (v65 <= v9)
  {
    v72 = @"[textFieldBuddy]-(PADDING)";
    if (a4)
    {
      BOOL v73 = 0;
LABEL_47:
      *a4 = v73;
    }
  }
  else
  {
    ++v66;
    v72 = @"H:|-(HORIZ_INSET)";
    if (a4)
    {
      BOOL v73 = 1;
      goto LABEL_47;
    }
  }
  v74 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_textField attribute:11 relatedBy:0 toItem:self->super._labelView attribute:11 multiplier:(double)v66 constant:0.0];
  [v82 addObject:v74];
  v75 = objc_msgSend(NSString, "stringWithFormat:", v67, v72);
  v76 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:v75 options:0 metrics:v64 views:v71];
  [v82 addObjectsFromArray:v76];
  v77 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_addButton attribute:10 relatedBy:0 toItem:self->super._labelView attribute:10 multiplier:1.0 constant:1.0];
  [v82 addObject:v77];
  if (a3) {
    *a3 = v66;
  }
  if (v82)
  {
    objc_storeStrong(location, v82);
    [(MFComposeRecipientView *)self addConstraints:*location];
  }
  self->_needsLayoutConstraintUpdate = 0;
}

- (void)_setNeedsReflow
{
  if (!self->_needsReflow)
  {
    self->_needsReflow = 1;
    objc_msgSend(MEMORY[0x1E4F60F28], "__mui_nextRunLoopMainThreadScheduler");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    double v3 = -[MFComposeRecipientView ef_onScheduler:](self, "ef_onScheduler:");
    [v3 _reflowAnimated:0];
  }
}

- (void)_setNeedsLayoutConstraintUpdate
{
  if (!self->_needsLayoutConstraintUpdate)
  {
    self->_needsLayoutConstraintUpdate = 1;
    objc_msgSend(MEMORY[0x1E4F60F28], "__mui_nextRunLoopMainThreadScheduler");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    double v3 = -[MFComposeRecipientView ef_onScheduler:](self, "ef_onScheduler:");
    [v3 _updateLayoutConstraintsAndGetNumberOfRows:0 textFieldWillBeLastRow:0];
  }
}

- (void)didMoveToSuperview
{
  v2.receiver = self;
  v2.super_class = (Class)MFComposeRecipientView;
  [(MFComposeRecipientView *)&v2 viewDidMoveToSuperview];
}

- (void)_tapGestureRecognized:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 3) {
    [(_MFMailRecipientTextField *)self->_textField becomeFirstResponder];
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [a3 locationInView:self];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v8 = [(NSMutableDictionary *)self->_atoms allValues];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * i) frame];
        v20.x = v5;
        v20.y = v7;
        if (CGRectContainsPoint(v21, v20))
        {
          BOOL v12 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_11:

  return v12;
}

- (BOOL)editable
{
  return self->_editable;
}

- (int64_t)maxRecipients
{
  return self->_maxRecipients;
}

- (void)setMaxRecipients:(int64_t)a3
{
  self->_maxRecipients = a3;
}

- (double)inputDelay
{
  return self->_inputDelay;
}

- (void)setInputDelay:(double)a3
{
  self->_inputDelay = a3;
}

- (UITextField)textField
{
  return &self->_textField->super;
}

- (NSArray)recipients
{
  return &self->_recipients->super;
}

- (UIView)addButton
{
  return &self->_addButton->super.super;
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (unint64_t)defaultAtomPresentationOptions
{
  return self->_defaultAtomPresentationOptions;
}

- (void)setDefaultAtomPresentationOptions:(unint64_t)a3
{
  self->_defaultAtomPresentationOptions = a3;
}

- (MFCorecipientsIndicatorAtom)corecipientsIndicator
{
  return self->_corecipientsIndicatorAtom;
}

- (void)setCorecipientsIndicator:(id)a3
{
}

- (BOOL)didIgnoreFirstResponderResign
{
  return self->_didIgnoreFirstResponderResign;
}

- (void)setDidIgnoreFirstResponderResign:(BOOL)a3
{
  self->_didIgnoreFirstResponderResign = a3;
}

- (BOOL)allowsDragAndDrop
{
  return self->_allowsDragAndDrop;
}

- (void)setAllowsDragAndDrop:(BOOL)a3
{
  self->_allowsDragAndDrop = a3;
}

- (BOOL)isSeparatorHidden
{
  return self->_separatorHidden;
}

- (int64_t)hideLastAtomComma
{
  return self->_hideLastAtomComma;
}

- (void)setHideLastAtomComma:(int64_t)a3
{
  self->_hideLastAtomComma = a3;
}

- (NSMutableDictionary)atoms
{
  return self->_atoms;
}

- (void)setAtoms:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_atoms, 0);
  objc_storeStrong((id *)&self->_corecipientsIndicatorAtom, 0);
  objc_storeStrong((id *)&self->_baseFont, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_delayTimer, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_addButton, 0);
  objc_storeStrong((id *)&self->_placeholderRecipient, 0);
  objc_storeStrong((id *)&self->_selectedAtom, 0);
  objc_storeStrong((id *)&self->_uncommentedAddresses, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_textFieldConstraints, 0);

  objc_storeStrong((id *)&self->_textField, 0);
}

@end