@interface PHHandsetDialerDeleteButton
- (void)setHighlighted:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateImageViewAlpha;
@end

@implementation PHHandsetDialerDeleteButton

- (void)updateImageViewAlpha
{
  if ([(PHHandsetDialerDeleteButton *)self isHighlighted]) {
    +[PHHandsetDialerNumberPadButton highlightedCircleViewAlpha];
  }
  else {
    +[PHHandsetDialerNumberPadButton unhighlightedCircleViewAlpha];
  }
  double v4 = v3;
  id v5 = [(PHHandsetDialerDeleteButton *)self imageView];
  [v5 setAlpha:v4];
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PHHandsetDialerDeleteButton;
  [(PHHandsetDialerDeleteButton *)&v4 setHighlighted:a3];
  [(PHHandsetDialerDeleteButton *)self updateImageViewAlpha];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PHHandsetDialerDeleteButton;
  [(PHHandsetDialerDeleteButton *)&v4 traitCollectionDidChange:a3];
  [(PHHandsetDialerDeleteButton *)self updateImageViewAlpha];
}

@end