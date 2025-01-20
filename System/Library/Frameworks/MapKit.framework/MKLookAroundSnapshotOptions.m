@interface MKLookAroundSnapshotOptions
- (CGSize)size;
- (MKLookAroundSnapshotOptions)init;
- (MKMapSnapshotOptions)_options;
- (MKPointOfInterestFilter)pointOfInterestFilter;
- (UITraitCollection)traitCollection;
- (void)_setOptions:(id)a3;
- (void)setPointOfInterestFilter:(MKPointOfInterestFilter *)pointOfInterestFilter;
- (void)setSize:(CGSize)size;
- (void)setTraitCollection:(UITraitCollection *)traitCollection;
@end

@implementation MKLookAroundSnapshotOptions

- (MKLookAroundSnapshotOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)MKLookAroundSnapshotOptions;
  v2 = [(MKLookAroundSnapshotOptions *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(MKMapSnapshotOptions);
    options = v2->_options;
    v2->_options = v3;

    [(MKMapSnapshotOptions *)v2->_options setMapType:107];
  }
  return v2;
}

- (MKPointOfInterestFilter)pointOfInterestFilter
{
  return [(MKMapSnapshotOptions *)self->_options pointOfInterestFilter];
}

- (void)setPointOfInterestFilter:(MKPointOfInterestFilter *)pointOfInterestFilter
{
}

- (CGSize)size
{
  [(MKMapSnapshotOptions *)self->_options size];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setSize:(CGSize)size
{
}

- (UITraitCollection)traitCollection
{
  return [(MKMapSnapshotOptions *)self->_options traitCollection];
}

- (void)setTraitCollection:(UITraitCollection *)traitCollection
{
}

- (MKMapSnapshotOptions)_options
{
  return self->_options;
}

- (void)_setOptions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end