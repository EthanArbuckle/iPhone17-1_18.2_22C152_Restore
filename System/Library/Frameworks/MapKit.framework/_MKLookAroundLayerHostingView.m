@interface _MKLookAroundLayerHostingView
+ (Class)layerClass;
- (VKMapView)lookAroundView;
- (_MKLookAroundLayerHostingView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setLookAroundView:(id)a3;
@end

@implementation _MKLookAroundLayerHostingView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (_MKLookAroundLayerHostingView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_MKLookAroundLayerHostingView;
  v3 = -[_MKLookAroundLayerHostingView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(_MKLookAroundLayerHostingView *)v3 layer];
    [v5 setHostView:v4];
    v6 = v4;
  }
  return v4;
}

- (void)dealloc
{
  v3 = [(_MKLookAroundLayerHostingView *)self layer];
  [v3 setHostView:0];

  v4.receiver = self;
  v4.super_class = (Class)_MKLookAroundLayerHostingView;
  [(_MKLookAroundLayerHostingView *)&v4 dealloc];
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_MKLookAroundLayerHostingView;
  -[_MKLookAroundLayerHostingView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_MKLookAroundLayerHostingView *)self bounds];
  -[VKMapView setFrame:](self->_lookAroundView, "setFrame:");
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_MKLookAroundLayerHostingView;
  -[_MKLookAroundLayerHostingView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_MKLookAroundLayerHostingView *)self bounds];
  -[VKMapView setFrame:](self->_lookAroundView, "setFrame:");
}

- (VKMapView)lookAroundView
{
  return self->_lookAroundView;
}

- (void)setLookAroundView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end