@interface CSBackgroundContentView
- (CSBackgroundContentView)initWithPresentationView:(id)a3;
- (UIScenePresentation)presentationView;
- (void)layoutSubviews;
@end

@implementation CSBackgroundContentView

- (CSBackgroundContentView)initWithPresentationView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSBackgroundContentView;
  v6 = [(CSBackgroundContentView *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_presentationView, a3);
    [(CSBackgroundContentView *)v7 addSubview:v7->_presentationView];
  }

  return v7;
}

- (void)layoutSubviews
{
  presentationView = self->_presentationView;
  [(CSBackgroundContentView *)self bounds];

  -[UIScenePresentation setFrame:](presentationView, "setFrame:");
}

- (UIScenePresentation)presentationView
{
  return self->_presentationView;
}

- (void).cxx_destruct
{
}

@end