@interface SRCompactTextRequestSiriSuggestionsButton
- (SRCompactTextRequestSiriSuggestionsButton)initWithFrame:(CGRect)a3;
- (SRCompactTextRequestSiriSuggestionsButtonDelegate)delegate;
- (void)_buttonTapped:(id)a3;
- (void)_setUpIcons;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
@end

@implementation SRCompactTextRequestSiriSuggestionsButton

- (SRCompactTextRequestSiriSuggestionsButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SRCompactTextRequestSiriSuggestionsButton;
  v3 = -[SRCompactTextRequestSiriSuggestionsButton initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SRCompactTextRequestSiriSuggestionsButton *)v3 _setUpIcons];
    [(SRCompactTextRequestSiriSuggestionsButton *)v4 setSelected:1];
    v4->_suggestionsEnabled = 1;
    [(SRCompactTextRequestSiriSuggestionsButton *)v4 addTarget:v4 action:"_buttonTapped:" forControlEvents:64];
  }
  return v4;
}

- (void)_setUpIcons
{
  id v3 = objc_alloc((Class)BSUICAPackageView);
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = (BSUICAPackageView *)[v3 initWithPackageName:@"SuggestionsGlyph" inBundle:v4];
  iconsView = self->_iconsView;
  self->_iconsView = v5;

  v7 = self->_iconsView;
  v8 = +[UIColor clearColor];
  [(BSUICAPackageView *)v7 setBackgroundColor:v8];

  [(BSUICAPackageView *)self->_iconsView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(BSUICAPackageView *)self->_iconsView setHidden:0];
  [(BSUICAPackageView *)self->_iconsView setUserInteractionEnabled:0];
  [(BSUICAPackageView *)self->_iconsView setExclusiveTouch:0];
  v9 = self->_iconsView;

  [(SRCompactTextRequestSiriSuggestionsButton *)self addSubview:v9];
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)SRCompactTextRequestSiriSuggestionsButton;
  [(SRCompactTextRequestSiriSuggestionsButton *)&v6 layoutSubviews];
  iconsView = self->_iconsView;
  [(SRCompactTextRequestSiriSuggestionsButton *)self bounds];
  double v5 = v4;
  [(SRCompactTextRequestSiriSuggestionsButton *)self bounds];
  -[BSUICAPackageView setFrame:](iconsView, "setFrame:", 0.0, 0.0, v5);
}

- (void)_buttonTapped:(id)a3
{
  BOOL suggestionsEnabled = self->_suggestionsEnabled;
  self->_BOOL suggestionsEnabled = !suggestionsEnabled;
  if (suggestionsEnabled) {
    CFStringRef v5 = @"State 1";
  }
  else {
    CFStringRef v5 = @"State 2";
  }
  [(BSUICAPackageView *)self->_iconsView setState:v5 animated:1 transitionSpeed:0 completion:1.0];
  [(SRCompactTextRequestSiriSuggestionsButton *)self setSelected:self->_suggestionsEnabled];
  id v6 = [(SRCompactTextRequestSiriSuggestionsButton *)self delegate];
  [v6 textRequestSuggestionsButton:self didEnableSuggestions:self->_suggestionsEnabled];
}

- (SRCompactTextRequestSiriSuggestionsButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SRCompactTextRequestSiriSuggestionsButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_iconsView, 0);
}

@end