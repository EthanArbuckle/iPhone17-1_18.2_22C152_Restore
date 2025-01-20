@interface _MKLookAroundLayerHostingLayer
- (_MKLookAroundLayerHostingView)hostView;
- (void)setHostView:(id)a3;
@end

@implementation _MKLookAroundLayerHostingLayer

- (_MKLookAroundLayerHostingView)hostView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostView);

  return (_MKLookAroundLayerHostingView *)WeakRetained;
}

- (void)setHostView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end