@interface MKCalloutView
- (BOOL)hasPendingVisibility;
- (BOOL)isVisible;
- (BOOL)parallaxEnabled;
- (MKAnnotationView)annotationView;
- (MKCalloutView)initWithAnnotationView:(id)a3;
- (MKCalloutView)initWithCoder:(id)a3;
- (MKCalloutView)initWithFrame:(CGRect)a3;
- (int64_t)anchorPosition;
- (void)dismissAnimated:(BOOL)a3 completionBlock:(id)a4;
- (void)setParallaxEnabled:(BOOL)a3;
- (void)showAnimated:(BOOL)a3 completionBlock:(id)a4;
@end

@implementation MKCalloutView

- (MKCalloutView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (MKCalloutView)initWithCoder:(id)a3
{
  return 0;
}

- (MKCalloutView)initWithAnnotationView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MKCalloutView;
  v5 = -[MKCalloutView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_annotationView, v4);
  }
  [(MKCalloutView *)v6 setAccessibilityIdentifier:@"MKCalloutView"];

  return v6;
}

- (void)showAnimated:(BOOL)a3 completionBlock:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v8 = NSStringFromSelector(a2);
  [v5 raise:v6, @"Subclass must implement -[%@ %@]", v9, v8 format];
}

- (void)dismissAnimated:(BOOL)a3 completionBlock:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v8 = NSStringFromSelector(a2);
  [v5 raise:v6, @"Subclass must implement -[%@ %@]", v9, v8 format];
}

- (BOOL)isVisible
{
  v2 = [(MKCalloutView *)self superview];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)hasPendingVisibility
{
  return 0;
}

- (int64_t)anchorPosition
{
  return 2;
}

- (MKAnnotationView)annotationView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_annotationView);

  return (MKAnnotationView *)WeakRetained;
}

- (BOOL)parallaxEnabled
{
  return self->_parallaxEnabled;
}

- (void)setParallaxEnabled:(BOOL)a3
{
  self->_parallaxEnabled = a3;
}

- (void).cxx_destruct
{
}

@end