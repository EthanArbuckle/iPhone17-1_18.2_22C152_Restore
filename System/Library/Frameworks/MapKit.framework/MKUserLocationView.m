@interface MKUserLocationView
- (BOOL)_allowedToShowCallout;
- (BOOL)_allowsAccuracyRing;
- (BOOL)_allowsPulse;
- (BOOL)_canShowHeadingIndicator;
- (BOOL)_isStale;
- (BOOL)_rotateInnerImageToMatchCourse;
- (BOOL)_shouldDisplayHeading;
- (BOOL)_shouldInnerPulse;
- (BOOL)_shouldShowOuterRing;
- (BOOL)canShowCallout;
- (BOOL)isDraggable;
- (BOOL)isSelected;
- (CGPoint)calloutOffset;
- (CGPoint)centerOffset;
- (CGPoint)leftCalloutOffset;
- (CGPoint)rightCalloutOffset;
- (CGRect)_mapkit_visibleRect;
- (MKUserLocationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4;
- (UIEdgeInsets)_annotationTrackingInsets;
- (_MKUserLocationView)_mkUserLocationView;
- (double)_accuracyRingAlpha;
- (double)_heading;
- (double)_maxRadiusToShowAccuracyRing;
- (double)_puckAlpha;
- (float)_selectionPriority;
- (id)_innerImageMask;
- (id)_lastLocation;
- (id)detailCalloutAccessoryView;
- (id)leftCalloutAccessoryView;
- (id)rightCalloutAccessoryView;
- (int64_t)_headingIndicatorStyle;
- (void)_locationManagerFailedToUpdateLocation;
- (void)_setAccuracyRingAlpha:(double)a3;
- (void)_setAllowsAccuracyRing:(BOOL)a3;
- (void)_setAllowsPulse:(BOOL)a3;
- (void)_setCanShowHeadingIndicator:(BOOL)a3;
- (void)_setHeading:(double)a3;
- (void)_setHeadingIndicatorStyle:(int64_t)a3;
- (void)_setInnerImageMask:(id)a3;
- (void)_setMKUserLocationView:(id)a3;
- (void)_setMapDisplayStyle:(id)a3;
- (void)_setMapPitchRadians:(double)a3;
- (void)_setMapRotationRadians:(double)a3;
- (void)_setMapType:(unint64_t)a3;
- (void)_setMaxRadiusToShowAccuracyRing:(double)a3;
- (void)_setPuckAlpha:(double)a3;
- (void)_setPuckScale:(double)a3;
- (void)_setRotateInnerImageToMatchCourse:(BOOL)a3;
- (void)_setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)_setSelectionPriority:(float)a3;
- (void)_setShouldDisplayHeading:(BOOL)a3;
- (void)_setShouldInnerPulse:(BOOL)a3;
- (void)_setShouldShowOuterRing:(BOOL)a3;
- (void)_updateFromMap;
- (void)_updateStateFromLocation:(id)a3 duration:(double)a4;
- (void)prepareForDisplay;
- (void)prepareForReuse;
- (void)setAnnotation:(id)a3;
- (void)setCalloutOffset:(CGPoint)a3;
- (void)setCanShowCallout:(BOOL)a3;
- (void)setCenterOffset:(CGPoint)a3;
- (void)setDetailCalloutAccessoryView:(id)a3;
- (void)setLeftCalloutAccessoryView:(id)a3;
- (void)setLeftCalloutOffset:(CGPoint)a3;
- (void)setRightCalloutAccessoryView:(id)a3;
- (void)setRightCalloutOffset:(CGPoint)a3;
@end

@implementation MKUserLocationView

- (MKUserLocationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MKUserLocationView;
  v7 = [(MKAnnotationView *)&v12 initWithAnnotation:v6 reuseIdentifier:a4];
  if (v7)
  {
    v8 = [(_MKUserLocationView *)[_MKUserLocationInternalView alloc] initWithAnnotation:v6 reuseIdentifier:0];
    [(_MKUserLocationInternalView *)v8 bounds];
    -[_MKUserLocationInternalView setFrame:](v8, "setFrame:");
    [(_MKUserLocationInternalView *)v8 setParentView:v7];
    mkUserLocationView = v7->_mkUserLocationView;
    v7->_mkUserLocationView = &v8->super;
    v10 = v8;

    v7->super._collisionMode = 2;
    [(_MKUserLocationView *)v7->_mkUserLocationView bounds];
    -[MKUserLocationView setFrame:](v7, "setFrame:");
    [(MKUserLocationView *)v7 addSubview:v7->_mkUserLocationView];
  }
  return v7;
}

- (void)setAnnotation:(id)a3
{
  mkUserLocationView = self->_mkUserLocationView;
  id v5 = a3;
  [(_MKUserLocationView *)mkUserLocationView setAnnotation:v5];
  v6.receiver = self;
  v6.super_class = (Class)MKUserLocationView;
  [(MKAnnotationView *)&v6 setAnnotation:v5];
}

- (float)_selectionPriority
{
  [(_MKPuckAnnotationView *)self->_mkUserLocationView _selectionPriority];
  return result;
}

- (void)_setSelectionPriority:(float)a3
{
}

- (CGPoint)centerOffset
{
  [(MKAnnotationView *)self->_mkUserLocationView centerOffset];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setCenterOffset:(CGPoint)a3
{
}

- (BOOL)canShowCallout
{
  return [(MKAnnotationView *)self->_mkUserLocationView canShowCallout];
}

- (void)setCanShowCallout:(BOOL)a3
{
}

- (CGPoint)calloutOffset
{
  [(_MKPuckAnnotationView *)self->_mkUserLocationView calloutOffset];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setCalloutOffset:(CGPoint)a3
{
}

- (CGPoint)leftCalloutOffset
{
  [(MKAnnotationView *)self->_mkUserLocationView leftCalloutOffset];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setLeftCalloutOffset:(CGPoint)a3
{
}

- (CGPoint)rightCalloutOffset
{
  [(MKAnnotationView *)self->_mkUserLocationView rightCalloutOffset];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setRightCalloutOffset:(CGPoint)a3
{
}

- (id)leftCalloutAccessoryView
{
  return [(MKAnnotationView *)self->_mkUserLocationView leftCalloutAccessoryView];
}

- (void)setLeftCalloutAccessoryView:(id)a3
{
}

- (id)rightCalloutAccessoryView
{
  return [(MKAnnotationView *)self->_mkUserLocationView rightCalloutAccessoryView];
}

- (void)setRightCalloutAccessoryView:(id)a3
{
}

- (id)detailCalloutAccessoryView
{
  return [(MKAnnotationView *)self->_mkUserLocationView detailCalloutAccessoryView];
}

- (void)setDetailCalloutAccessoryView:(id)a3
{
}

- (BOOL)_allowedToShowCallout
{
  return 0;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)_setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  self->_selected = a3;
  -[MKAnnotationView _setSelected:animated:](self->_mkUserLocationView, "_setSelected:animated:");
  v7.receiver = self;
  v7.super_class = (Class)MKUserLocationView;
  [(MKAnnotationView *)&v7 _setSelected:v5 animated:v4];
}

- (BOOL)isDraggable
{
  return 0;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)MKUserLocationView;
  [(MKAnnotationView *)&v3 prepareForReuse];
  [(MKAnnotationView *)self->_mkUserLocationView prepareForReuse];
}

- (void)prepareForDisplay
{
  v3.receiver = self;
  v3.super_class = (Class)MKUserLocationView;
  [(MKAnnotationView *)&v3 prepareForDisplay];
  [(MKAnnotationView *)self->_mkUserLocationView prepareForDisplay];
}

- (void)_setMapType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MKUserLocationView;
  -[MKAnnotationView _setMapType:](&v5, sel__setMapType_);
  [(_MKPuckAnnotationView *)self->_mkUserLocationView _setMapType:a3];
}

- (void)_setMapDisplayStyle:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MKUserLocationView;
  uint64_t v4 = *(void *)&a3.var0 & 0xFFFFFFFFFFFFLL;
  [(MKAnnotationView *)&v5 _setMapDisplayStyle:*(void *)&a3.var0 & 0xFFFFFFFFFFFFLL];
  [(_MKPuckAnnotationView *)self->_mkUserLocationView _setMapDisplayStyle:v4];
}

- (void)_updateFromMap
{
  v3.receiver = self;
  v3.super_class = (Class)MKUserLocationView;
  [(MKAnnotationView *)&v3 _updateFromMap];
  [(_MKPuckAnnotationView *)self->_mkUserLocationView _updateFromMap];
}

- (void)_setMapPitchRadians:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MKUserLocationView;
  -[MKAnnotationView _setMapPitchRadians:](&v5, sel__setMapPitchRadians_);
  [(_MKPuckAnnotationView *)self->_mkUserLocationView _setMapPitchRadians:a3];
}

- (void)_setMapRotationRadians:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MKUserLocationView;
  -[MKAnnotationView _setMapRotationRadians:](&v5, sel__setMapRotationRadians_);
  [(_MKPuckAnnotationView *)self->_mkUserLocationView _setMapRotationRadians:a3];
}

- (CGRect)_mapkit_visibleRect
{
  [(_MKPuckAnnotationView *)self->_mkUserLocationView _mapkit_visibleRect];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)_lastLocation
{
  return [(_MKPuckAnnotationView *)self->_mkUserLocationView lastLocation];
}

- (void)_updateStateFromLocation:(id)a3 duration:(double)a4
{
}

- (void)_locationManagerFailedToUpdateLocation
{
}

- (BOOL)_isStale
{
  return [(_MKPuckAnnotationView *)self->_mkUserLocationView isStale];
}

- (BOOL)_shouldDisplayHeading
{
  return [(_MKPuckAnnotationView *)self->_mkUserLocationView shouldDisplayHeading];
}

- (void)_setShouldDisplayHeading:(BOOL)a3
{
}

- (BOOL)_canShowHeadingIndicator
{
  return [(_MKPuckAnnotationView *)self->_mkUserLocationView canShowHeadingIndicator];
}

- (void)_setCanShowHeadingIndicator:(BOOL)a3
{
}

- (double)_heading
{
  [(_MKPuckAnnotationView *)self->_mkUserLocationView heading];
  return result;
}

- (void)_setHeading:(double)a3
{
}

- (UIEdgeInsets)_annotationTrackingInsets
{
  [(_MKPuckAnnotationView *)self->_mkUserLocationView _annotationTrackingInsets];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (int64_t)_headingIndicatorStyle
{
  return [(_MKPuckAnnotationView *)self->_mkUserLocationView headingIndicatorStyle];
}

- (void)_setHeadingIndicatorStyle:(int64_t)a3
{
}

- (BOOL)_allowsPulse
{
  return [(_MKPuckAnnotationView *)self->_mkUserLocationView allowsPulse];
}

- (void)_setAllowsPulse:(BOOL)a3
{
}

- (BOOL)_shouldInnerPulse
{
  return [(_MKPuckAnnotationView *)self->_mkUserLocationView shouldInnerPulse];
}

- (void)_setShouldInnerPulse:(BOOL)a3
{
}

- (BOOL)_shouldShowOuterRing
{
  return [(_MKPuckAnnotationView *)self->_mkUserLocationView shouldShowOuterRing];
}

- (void)_setShouldShowOuterRing:(BOOL)a3
{
}

- (BOOL)_allowsAccuracyRing
{
  return [(_MKPuckAnnotationView *)self->_mkUserLocationView allowsAccuracyRing];
}

- (void)_setAllowsAccuracyRing:(BOOL)a3
{
}

- (double)_maxRadiusToShowAccuracyRing
{
  [(_MKPuckAnnotationView *)self->_mkUserLocationView maxRadiusToShowAccuracyRing];
  return result;
}

- (void)_setMaxRadiusToShowAccuracyRing:(double)a3
{
}

- (double)_puckAlpha
{
  [(_MKPuckAnnotationView *)self->_mkUserLocationView puckAlpha];
  return result;
}

- (void)_setPuckAlpha:(double)a3
{
}

- (double)_accuracyRingAlpha
{
  [(_MKPuckAnnotationView *)self->_mkUserLocationView accuracyRingAlpha];
  return result;
}

- (void)_setAccuracyRingAlpha:(double)a3
{
}

- (void)_setPuckScale:(double)a3
{
}

- (id)_innerImageMask
{
  return [(_MKPuckAnnotationView *)self->_mkUserLocationView innerImageMask];
}

- (void)_setInnerImageMask:(id)a3
{
}

- (BOOL)_rotateInnerImageToMatchCourse
{
  return [(_MKPuckAnnotationView *)self->_mkUserLocationView rotateInnerImageToMatchCourse];
}

- (void)_setRotateInnerImageToMatchCourse:(BOOL)a3
{
}

- (_MKUserLocationView)_mkUserLocationView
{
  return self->_mkUserLocationView;
}

- (void)_setMKUserLocationView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end