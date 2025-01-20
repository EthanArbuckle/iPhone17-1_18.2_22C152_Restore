@interface SiriFooterView
- (SiriFooterView)initWithSpecifier:(id)a3;
@end

@implementation SiriFooterView

- (SiriFooterView)initWithSpecifier:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SiriFooterView;
  v5 = [(PSFooterHyperlinkView *)&v14 initWithSpecifier:v4];
  if (v5)
  {
    v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"ASSISTANT_ABOUT" value:&stru_26D2AB140 table:@"AssistantShared"];

    v8 = [v4 propertyForKey:*MEMORY[0x263F600F8]];
    [(PSFooterHyperlinkView *)v5 setText:v8];

    v9 = [(PSFooterHyperlinkView *)v5 text];
    uint64_t v10 = [v9 rangeOfString:v7];
    -[PSFooterHyperlinkView setLinkRange:](v5, "setLinkRange:", v10, v11);

    v12 = [v4 target];
    [(PSFooterHyperlinkView *)v5 setTarget:v12];

    [(PSFooterHyperlinkView *)v5 setAction:sel_showAboutAssistantSheet_];
  }

  return v5;
}

@end