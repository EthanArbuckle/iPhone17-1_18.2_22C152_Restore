@interface CPSPointOfInterestClusterView
- (BOOL)isAccessibilityElement;
- (CPSPointOfInterestClusterView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4;
- (void)_configure;
- (void)prepareForDisplay;
- (void)prepareForReuse;
- (void)setAnnotation:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)update;
@end

@implementation CPSPointOfInterestClusterView

- (CPSPointOfInterestClusterView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  v4 = v12;
  v12 = 0;
  v9.receiver = v4;
  v9.super_class = (Class)CPSPointOfInterestClusterView;
  v8 = [(MKMarkerAnnotationView *)&v9 initWithAnnotation:location[0] reuseIdentifier:v10];
  v12 = v8;
  objc_storeStrong((id *)&v12, v8);
  if (v8) {
    [(CPSPointOfInterestClusterView *)v12 _configure];
  }
  v6 = v12;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v12, 0);
  return v6;
}

- (void)traitCollectionDidChange:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSPointOfInterestClusterView;
  [(CPSPointOfInterestClusterView *)&v3 traitCollectionDidChange:location[0]];
  [(CPSPointOfInterestClusterView *)v5 update];
  objc_storeStrong(location, 0);
}

- (void)setAnnotation:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSPointOfInterestClusterView;
  [(MKMarkerAnnotationView *)&v3 setAnnotation:location[0]];
  [(CPSPointOfInterestClusterView *)v5 update];
  objc_storeStrong(location, 0);
}

- (void)prepareForDisplay
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSPointOfInterestClusterView;
  [(MKMarkerAnnotationView *)&v2 prepareForDisplay];
  [(CPSPointOfInterestClusterView *)v4 _configure];
}

- (void)prepareForReuse
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSPointOfInterestClusterView;
  [(MKMarkerAnnotationView *)&v2 prepareForReuse];
  [(CPSPointOfInterestClusterView *)v4 _configure];
}

- (void)update
{
  objc_super v9 = self;
  v8[1] = (id)a2;
  objc_super v2 = NSString;
  v4 = [(MKAnnotationView *)self annotation];
  id v3 = (id)[(MKAnnotation *)v4 memberAnnotations];
  v8[0] = (id)objc_msgSend(v2, "stringWithFormat:", @"%ld", objc_msgSend(v3, "count"));

  id v5 = v8[0];
  id v7 = (id)[(CPSPointOfInterestClusterView *)v9 traitCollection];
  id v6 = +[CPSPointOfInterestAnnotationView balloonWithText:traitCollection:](CPSPointOfInterestAnnotationView, "balloonWithText:traitCollection:", v5);
  -[MKAnnotationView setImage:](v9, "setImage:");

  objc_storeStrong(v8, 0);
}

- (void)_configure
{
  -[MKAnnotationView setCollisionMode:](self, "setCollisionMode:");
  [(MKAnnotationView *)self setCanShowCallout:0];
  LODWORD(v2) = 1148846080;
  [(MKAnnotationView *)self setDisplayPriority:v2];
  id v3 = (id)[MEMORY[0x263F1C550] clearColor];
  -[MKMarkerAnnotationView setMarkerTintColor:](self, "setMarkerTintColor:");

  id v4 = (id)[MEMORY[0x263F1C550] clearColor];
  -[MKMarkerAnnotationView setGlyphTintColor:](self, "setGlyphTintColor:");

  [(MKMarkerAnnotationView *)self setTitleVisibility:1];
  [(MKMarkerAnnotationView *)self setSubtitleVisibility:1];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v16 = self;
  SEL v15 = a2;
  BOOL v14 = a3;
  BOOL v13 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CPSPointOfInterestClusterView;
  [(MKAnnotationView *)&v12 setSelected:a3 animated:a4];
  id v4 = (void *)MEMORY[0x263F1CB60];
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  v8 = __54__CPSPointOfInterestClusterView_setSelected_animated___block_invoke;
  objc_super v9 = &unk_2648A4748;
  BOOL v11 = v14;
  id v10 = v16;
  objc_msgSend(v4, "animateWithDuration:animations:completion:", 0.300000012);
  objc_storeStrong((id *)&v10, 0);
}

uint64_t __54__CPSPointOfInterestClusterView_setSelected_animated___block_invoke(uint64_t a1)
{
  uint64_t v10 = a1;
  uint64_t v9 = a1;
  if (*(unsigned char *)(a1 + 40))
  {
    CGAffineTransformMakeScale(&v8, 1.5, 1.5);
    id v3 = *(void **)(a1 + 32);
    memcpy(__dst, &v8, sizeof(__dst));
    return [v3 setTransform:__dst];
  }
  else
  {
    memcpy(v6, MEMORY[0x263F000D0], sizeof(v6));
    double v2 = *(void **)(a1 + 32);
    memcpy(v5, v6, sizeof(v5));
    return [v2 setTransform:v5];
  }
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end