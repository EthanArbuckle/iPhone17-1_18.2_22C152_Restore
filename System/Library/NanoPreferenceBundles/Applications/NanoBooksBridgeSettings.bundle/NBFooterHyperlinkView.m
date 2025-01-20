@interface NBFooterHyperlinkView
- (NBFooterHyperlinkView)initWithReuseIdentifier:(id)a3;
@end

@implementation NBFooterHyperlinkView

- (NBFooterHyperlinkView)initWithReuseIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NBFooterHyperlinkView;
  v3 = [(NBFooterHyperlinkView *)&v6 initWithReuseIdentifier:a3];
  if (v3)
  {
    v4 = +[UIColor secondarySystemGroupedBackgroundColor];
    [(NBFooterHyperlinkView *)v3 setTintColor:v4];
  }
  return v3;
}

@end