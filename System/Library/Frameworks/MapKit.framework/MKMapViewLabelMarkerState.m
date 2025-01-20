@interface MKMapViewLabelMarkerState
+ (id)stateForLabelMarker:(id)a3;
- (BOOL)isVisible;
- (unsigned)balloonBehavior;
- (void)setBalloonBehavior:(unsigned __int8)a3;
- (void)setVisible:(BOOL)a3;
@end

@implementation MKMapViewLabelMarkerState

+ (id)stateForLabelMarker:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_alloc_init(MKMapViewLabelMarkerState);
    -[MKMapViewLabelMarkerState setVisible:](v4, "setVisible:", [v3 isVisible]);
    uint64_t v5 = [v3 pickedLabelBalloonBehavior];

    [(MKMapViewLabelMarkerState *)v4 setBalloonBehavior:v5];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (unsigned)balloonBehavior
{
  return self->_balloonBehavior;
}

- (void)setBalloonBehavior:(unsigned __int8)a3
{
  self->_balloonBehavior = a3;
}

@end