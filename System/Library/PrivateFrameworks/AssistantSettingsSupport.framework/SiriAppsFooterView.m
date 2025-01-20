@interface SiriAppsFooterView
- (SiriAppsFooterView)initWithSpecifier:(id)a3;
- (SiriAppsFooterViewDelegate)delegate;
- (void)didTapLearnMore:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SiriAppsFooterView

- (SiriAppsFooterView)initWithSpecifier:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SiriAppsFooterView;
  v5 = [(PSFooterHyperlinkView *)&v16 initWithSpecifier:v4];
  if (v5)
  {
    v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"INTENTS_LEARN_LINK" value:&stru_26D2AB140 table:@"Assistant_Intents"];

    v8 = [v4 propertyForKey:*MEMORY[0x263F600F8]];
    [(PSFooterHyperlinkView *)v5 setText:v8];

    v9 = [(PSFooterHyperlinkView *)v5 text];
    uint64_t v10 = [v9 rangeOfString:v7];
    -[PSFooterHyperlinkView setLinkRange:](v5, "setLinkRange:", v10, v11);

    v12 = [v4 target];
    int v13 = [v12 conformsToProtocol:&unk_26D2CD730];

    if (v13)
    {
      v14 = [v4 target];
      [(SiriAppsFooterView *)v5 setDelegate:v14];
    }
    [(PSFooterHyperlinkView *)v5 setTarget:v5];
    [(PSFooterHyperlinkView *)v5 setAction:sel_didTapLearnMore_];
  }
  return v5;
}

- (void)didTapLearnMore:(id)a3
{
  id v4 = [(SiriAppsFooterView *)self delegate];
  [v4 viewDidTapLearnMore:self];
}

- (SiriAppsFooterViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SiriAppsFooterViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end