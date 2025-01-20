@interface MKLookAroundSnapshot
- (MKLookAroundSnapshot)initWithSnapshot:(id)a3;
- (UIImage)image;
@end

@implementation MKLookAroundSnapshot

- (MKLookAroundSnapshot)initWithSnapshot:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKLookAroundSnapshot;
  v6 = [(MKLookAroundSnapshot *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_snapshot, a3);
  }

  return v7;
}

- (UIImage)image
{
  return [(MKMapSnapshot *)self->_snapshot image];
}

- (void).cxx_destruct
{
}

@end