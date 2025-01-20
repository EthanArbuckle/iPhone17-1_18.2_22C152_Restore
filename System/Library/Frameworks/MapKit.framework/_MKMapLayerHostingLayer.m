@interface _MKMapLayerHostingLayer
- (_MKMapLayerHostingView)hostView;
- (void)setHostView:(id)a3;
@end

@implementation _MKMapLayerHostingLayer

- (void)setHostView:(id)a3
{
}

- (_MKMapLayerHostingView)hostView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostView);

  return (_MKMapLayerHostingView *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end