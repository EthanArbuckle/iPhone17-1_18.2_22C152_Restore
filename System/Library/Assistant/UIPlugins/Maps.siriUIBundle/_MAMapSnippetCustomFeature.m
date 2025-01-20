@interface _MAMapSnippetCustomFeature
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (BOOL)showsBalloonCallout;
- (_MAMapSnippetCustomFeature)initWithCustomFeature:(id)a3 coordinate:(id)a4;
- (id)feature;
- (void)setShowsBalloonCallout:(BOOL)a3;
@end

@implementation _MAMapSnippetCustomFeature

- (_MAMapSnippetCustomFeature)initWithCustomFeature:(id)a3 coordinate:(id)a4
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_MAMapSnippetCustomFeature;
  v9 = [(_MAMapSnippetCustomFeature *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_feature, a3);
    v10->_coordinate.latitude = var0;
    v10->_coordinate.longitude = var1;
    v10->_showsBalloonCallout = 1;
    v11 = v10;
  }

  return v10;
}

- (id)feature
{
  return self->_feature;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double var1 = longitude;
  result.double var0 = latitude;
  return result;
}

- (BOOL)showsBalloonCallout
{
  return self->_showsBalloonCallout;
}

- (void)setShowsBalloonCallout:(BOOL)a3
{
  self->_showsBalloonCallout = a3;
}

- (void).cxx_destruct
{
}

@end