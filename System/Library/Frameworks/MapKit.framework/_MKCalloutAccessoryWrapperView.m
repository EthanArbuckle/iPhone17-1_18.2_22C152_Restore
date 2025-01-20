@interface _MKCalloutAccessoryWrapperView
- (CGSize)intrinsicContentSize;
- (_MKCalloutAccessoryWrapperView)initWithView:(id)a3;
- (id)_mapkit_accessoryControlToExtendWithCallout;
@end

@implementation _MKCalloutAccessoryWrapperView

- (_MKCalloutAccessoryWrapperView)initWithView:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_MKCalloutAccessoryWrapperView;
  v6 = [(_MKCalloutAccessoryWrapperView *)&v16 init];
  v7 = v6;
  if (v6)
  {
    p_view = (id *)&v6->_view;
    objc_storeStrong((id *)&v6->_view, a3);
    id v9 = *p_view;
    if (*p_view)
    {
      [v9 bounds];
      objc_msgSend(*p_view, "setFrame:");
      [(_MKCalloutAccessoryWrapperView *)v7 addSubview:*p_view];
      id v9 = *p_view;
    }
    [v9 bounds];
    -[_MKCalloutAccessoryWrapperView setBounds:](v7, "setBounds:");
    LODWORD(v10) = 1148846080;
    [(UIView *)v7 _mapkit_setContentCompressionResistancePriority:1 forAxis:v10];
    LODWORD(v11) = 1148846080;
    [(UIView *)v7 _mapkit_setContentCompressionResistancePriority:0 forAxis:v11];
    LODWORD(v12) = 1148846080;
    [(UIView *)v7 _mapkit_setContentHuggingPriority:1 forAxis:v12];
    LODWORD(v13) = 1148846080;
    [(UIView *)v7 _mapkit_setContentHuggingPriority:0 forAxis:v13];
    [(_MKCalloutAccessoryWrapperView *)v7 setClipsToBounds:!_MKLinkedOnOrAfterReleaseSet(2310)];
    v14 = v7;
  }

  return v7;
}

- (CGSize)intrinsicContentSize
{
  [(_MKCalloutAccessoryView *)self->_view bounds];
  double v3 = v2;
  double v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (id)_mapkit_accessoryControlToExtendWithCallout
{
  return (id)[(_MKCalloutAccessoryView *)self->_view _mapkit_accessoryControlToExtendWithCallout];
}

- (void).cxx_destruct
{
}

@end