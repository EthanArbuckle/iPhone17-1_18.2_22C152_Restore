@interface _SFActivityItemCustomizationController
- (BOOL)canPrint;
- (BOOL)canShareAsDownload;
- (BOOL)canShareAsLink;
- (BOOL)canShareAsPDF;
- (BOOL)canShareAsStandaloneImage;
- (BOOL)canShareAsWebArchive;
- (_SFActivityItemCustomizationController)init;
- (_SFActivityItemCustomizationDelegate)delegate;
- (id)_allowedContentTypes;
- (id)_customizationGroupsForActivityViewController:(id)a3;
- (int64_t)_contentTypeForAllowedContentAtIndex:(int64_t)a3;
- (int64_t)_selectedIndex;
- (int64_t)selectedContentType;
- (void)_customizationsDidChange;
- (void)_ensureSelectedContentTypeIsAllowed;
- (void)setDelegate:(id)a3;
@end

@implementation _SFActivityItemCustomizationController

- (_SFActivityItemCustomizationController)init
{
  v6.receiver = self;
  v6.super_class = (Class)_SFActivityItemCustomizationController;
  v2 = [(_SFActivityItemCustomizationController *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_contentTypeAllowedMap[4] = 1;
    *(_DWORD *)v2->_contentTypeAllowedMap = 16843009;
    v2->_selectedContentType = 0;
    v4 = v2;
  }

  return v3;
}

- (id)_customizationGroupsForActivityViewController:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v4 = [(_SFActivityItemCustomizationController *)self _allowedContentTypes];
  v5 = objc_msgSend(v4, "safari_mapObjectsUsingBlock:", &__block_literal_global_38);

  if ((unint64_t)[v5 count] >= 2)
  {
    v7 = (void *)MEMORY[0x1E4F43088];
    int64_t v8 = [(_SFActivityItemCustomizationController *)self _selectedIndex];
    v9 = _WBSLocalizedString();
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __88___SFActivityItemCustomizationController__customizationGroupsForActivityViewController___block_invoke_2;
    v16[3] = &unk_1E5C76760;
    v16[4] = self;
    v10 = [v7 pickerCustomizationWithIdentifier:@"SFActivityFormatPicker" options:v5 selectedOptionIndex:v8 footerText:v9 valueChangedHandler:v16];

    id v11 = objc_alloc(MEMORY[0x1E4F43090]);
    v12 = _WBSLocalizedString();
    v18[0] = v10;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    v14 = (void *)[v11 _initGroupWithName:v12 identifier:@"SFActivityFormatGroup" customizations:v13];

    v17 = v14;
    objc_super v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  }
  else
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  objc_storeWeak((id *)&self->_delegate, v4);
  if (objc_opt_respondsToSelector())
  {
    v5 = [v4 webViewForCustomizationController:self];
    if (objc_opt_respondsToSelector()) {
      int v6 = [v4 isContentObscuredByDigitalHealthForCustomizationController:self];
    }
    else {
      int v6 = 0;
    }
    if (objc_opt_respondsToSelector()) {
      int v7 = [v4 isDisplayingQuickLookDocumentForCustomizationController:self] ^ 1;
    }
    else {
      int v7 = 1;
    }
    if (objc_opt_respondsToSelector()) {
      char v8 = [v4 isReaderAvailableForCustomizationController:self];
    }
    else {
      char v8 = 0;
    }
    if (objc_opt_respondsToSelector()) {
      char v9 = [v4 isShowingReaderForCustomizationController:self];
    }
    else {
      char v9 = 0;
    }
    int v10 = [v5 _isDisplayingStandaloneImageDocument];
    char v11 = v10;
    if ((v6 | v10))
    {
      char v12 = 0;
    }
    else
    {
      int v13 = [v5 _isDisplayingStandaloneMediaDocument];
      if ((v13 | v7)) {
        char v12 = v13 ^ 1;
      }
      else {
        char v12 = [v5 _isDisplayingPDF];
      }
    }
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __54___SFActivityItemCustomizationController_setDelegate___block_invoke;
    v20 = &unk_1E5C76788;
    char v22 = v12;
    char v23 = v9;
    char v24 = v8;
    id v14 = v5;
    id v21 = v14;
    char v25 = v6;
    char v26 = v11;
    v15 = (uint64_t (**)(void, void))MEMORY[0x1AD0C36A0](&v17);
    for (uint64_t i = 0; i != 5; ++i)
      self->_contentTypeAllowedMap[i] = v15[2](v15, i);
    [(_SFActivityItemCustomizationController *)self _ensureSelectedContentTypeIsAllowed];
  }
}

- (BOOL)canShareAsLink
{
  return (unint64_t)(self->_selectedContentType - 6) < 0xFFFFFFFFFFFFFFFBLL;
}

- (BOOL)canPrint
{
  return ((self->_selectedContentType - 3) & 0xFFFFFFFFFFFFFFFDLL) != 0;
}

- (BOOL)canShareAsDownload
{
  return (unint64_t)(self->_selectedContentType - 6) < 0xFFFFFFFFFFFFFFFCLL;
}

- (BOOL)canShareAsWebArchive
{
  return self->_selectedContentType > 5uLL || (self->_selectedContentType & 0x3F) == 3;
}

- (BOOL)canShareAsStandaloneImage
{
  return (self->_selectedContentType > 5uLL) | (0x11u >> self->_selectedContentType) & 1;
}

- (BOOL)canShareAsPDF
{
  return (self->_selectedContentType > 5uLL) | (6u >> self->_selectedContentType) & 1;
}

- (int64_t)_contentTypeForAllowedContentAtIndex:(int64_t)a3
{
  id v4 = [(_SFActivityItemCustomizationController *)self _allowedContentTypes];
  v5 = [v4 objectAtIndexedSubscript:a3];
  int64_t v6 = [v5 integerValue];

  return v6;
}

- (int64_t)_selectedIndex
{
  v3 = [(_SFActivityItemCustomizationController *)self _allowedContentTypes];
  id v4 = [NSNumber numberWithInteger:self->_selectedContentType];
  int64_t v5 = [v3 indexOfObject:v4];

  return v5;
}

- (id)_allowedContentTypes
{
  v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:5];
  uint64_t v4 = 0;
  contentTypeAllowedMap = self->_contentTypeAllowedMap;
  do
  {
    if (contentTypeAllowedMap[v4])
    {
      int64_t v6 = [NSNumber numberWithInteger:v4];
      [v3 addObject:v6];
    }
    ++v4;
  }
  while (v4 != 5);
  int v7 = (void *)[v3 copy];

  return v7;
}

- (void)_customizationsDidChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained customizationControllerCustomizationsDidChange:self];
  }
}

- (void)_ensureSelectedContentTypeIsAllowed
{
  if (!self->_contentTypeAllowedMap[self->_selectedContentType])
  {
    v3 = [(_SFActivityItemCustomizationController *)self _allowedContentTypes];
    int64_t v6 = [v3 firstObject];

    uint64_t v4 = v6;
    if (v6)
    {
      int64_t v5 = [v6 integerValue];
      uint64_t v4 = v6;
    }
    else
    {
      int64_t v5 = 0;
    }
    self->_selectedContentType = v5;
  }
}

- (_SFActivityItemCustomizationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_SFActivityItemCustomizationDelegate *)WeakRetained;
}

- (int64_t)selectedContentType
{
  return self->_selectedContentType;
}

- (void).cxx_destruct
{
}

@end