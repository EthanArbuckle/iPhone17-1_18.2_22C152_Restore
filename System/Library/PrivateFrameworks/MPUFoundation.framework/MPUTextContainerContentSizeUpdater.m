@interface MPUTextContainerContentSizeUpdater
- (MPUTextContainer)textContainer;
- (MPUTextContainerContentSizeUpdater)init;
- (NSString)lastSeenPreferredContentSizeCategory;
- (void)_updateTextStyleFonts;
- (void)dealloc;
- (void)ensureTextStyleFontsMatchPreferredTextStyleFonts;
- (void)setLastSeenPreferredContentSizeCategory:(id)a3;
- (void)setTextContainer:(id)a3;
@end

@implementation MPUTextContainerContentSizeUpdater

- (MPUTextContainerContentSizeUpdater)init
{
  v7.receiver = self;
  v7.super_class = (Class)MPUTextContainerContentSizeUpdater;
  v2 = [(MPUTextContainerContentSizeUpdater *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F1C408] sharedApplication];
    v4 = [v3 preferredContentSizeCategory];
    [(MPUTextContainerContentSizeUpdater *)v2 setLastSeenPreferredContentSizeCategory:v4];

    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v2 selector:sel__preferredContentSizeCategoryDidChange_ name:*MEMORY[0x263F1D158] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1D158] object:0];

  v4.receiver = self;
  v4.super_class = (Class)MPUTextContainerContentSizeUpdater;
  [(MPUTextContainerContentSizeUpdater *)&v4 dealloc];
}

- (void)ensureTextStyleFontsMatchPreferredTextStyleFonts
{
  v3 = [(MPUTextContainerContentSizeUpdater *)self lastSeenPreferredContentSizeCategory];
  objc_super v4 = [MEMORY[0x263F1C408] sharedApplication];
  v5 = [v4 preferredContentSizeCategory];
  char v6 = [v3 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    [(MPUTextContainerContentSizeUpdater *)self _updateTextStyleFonts];
  }
}

- (void)_updateTextStyleFonts
{
  id v15 = [(MPUTextContainerContentSizeUpdater *)self textContainer];
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    v3 = [v15 attributedText];
    objc_super v4 = (void *)[v3 copy];
  }
  else
  {
    objc_super v4 = 0;
  }
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    v5 = [v15 font];
    char v6 = [v5 fontDescriptor];

    objc_super v7 = [v6 objectForKey:*MEMORY[0x263F1D208]];
    if (v7)
    {
      v8 = (void *)MEMORY[0x263F1C658];
      v9 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:v7];
      v10 = objc_msgSend(v9, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v6, "symbolicTraits"));
      v11 = [v8 fontWithDescriptor:v10 size:0.0];
      [v15 setFont:v11];
    }
  }
  if (v4)
  {
    v12 = objc_msgSend(v4, "MPU_attributedStringByUpdatingTextStyleFontsToPreferredTextStyleFonts");
    [v15 setAttributedText:v12];
  }
  v13 = [MEMORY[0x263F1C408] sharedApplication];
  v14 = [v13 preferredContentSizeCategory];
  [(MPUTextContainerContentSizeUpdater *)self setLastSeenPreferredContentSizeCategory:v14];
}

- (MPUTextContainer)textContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textContainer);

  return (MPUTextContainer *)WeakRetained;
}

- (void)setTextContainer:(id)a3
{
}

- (NSString)lastSeenPreferredContentSizeCategory
{
  return self->_lastSeenPreferredContentSizeCategory;
}

- (void)setLastSeenPreferredContentSizeCategory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSeenPreferredContentSizeCategory, 0);

  objc_destroyWeak((id *)&self->_textContainer);
}

@end