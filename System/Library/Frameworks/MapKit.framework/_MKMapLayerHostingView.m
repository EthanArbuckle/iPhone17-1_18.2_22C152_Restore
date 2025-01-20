@interface _MKMapLayerHostingView
+ (Class)layerClass;
- (VKMapView)mapView;
- (_MKMapLayerHostingView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setMapView:(id)a3;
@end

@implementation _MKMapLayerHostingView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setMapView:(id)a3
{
}

- (_MKMapLayerHostingView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_MKMapLayerHostingView;
  v3 = -[_MKMapLayerHostingView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(_MKMapLayerHostingView *)v3 layer];
    [v5 setHostView:v4];
    v6 = v4;
  }
  return v4;
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_MKMapLayerHostingView;
  -[_MKMapLayerHostingView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_MKMapLayerHostingView *)self bounds];
  -[VKMapView setFrame:](self->_mapView, "setFrame:");
}

- (void)dealloc
{
  v3 = [(_MKMapLayerHostingView *)self layer];
  [v3 setHostView:0];

  v4.receiver = self;
  v4.super_class = (Class)_MKMapLayerHostingView;
  [(_MKMapLayerHostingView *)&v4 dealloc];
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_MKMapLayerHostingView;
  -[_MKMapLayerHostingView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_MKMapLayerHostingView *)self bounds];
  -[VKMapView setFrame:](self->_mapView, "setFrame:");
}

- (VKMapView)mapView
{
  return self->_mapView;
}

- (void).cxx_destruct
{
}

@end