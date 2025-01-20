@interface MADRemoveBackgroundCachedMaskState
- (BOOL)matchesImageAsset:(id)a3;
- (CGRect)regionOfInterest;
- (MADRemoveBackgroundCachedMaskState)initWithImageAsset:(id)a3 instanceMaskObservation:(id)a4 regionOfInterest:(CGRect)a5;
- (VNInstanceMaskObservation)instanceMaskObservation;
@end

@implementation MADRemoveBackgroundCachedMaskState

- (MADRemoveBackgroundCachedMaskState)initWithImageAsset:(id)a3 instanceMaskObservation:(id)a4 regionOfInterest:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v11 = a3;
  id v12 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MADRemoveBackgroundCachedMaskState;
  v13 = [(MADRemoveBackgroundCachedMaskState *)&v17 init];
  if (v13)
  {
    uint64_t v14 = [v11 identifier];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    objc_storeStrong((id *)&v13->_instanceMaskObservation, a4);
    v13->_regionOfInterest.origin.CGFloat x = x;
    v13->_regionOfInterest.origin.CGFloat y = y;
    v13->_regionOfInterest.size.CGFloat width = width;
    v13->_regionOfInterest.size.CGFloat height = height;
  }

  return v13;
}

- (BOOL)matchesImageAsset:(id)a3
{
  identifier = self->_identifier;
  v4 = [a3 identifier];
  LOBYTE(identifier) = [(NSString *)identifier isEqualToString:v4];

  return (char)identifier;
}

- (VNInstanceMaskObservation)instanceMaskObservation
{
  return self->_instanceMaskObservation;
}

- (CGRect)regionOfInterest
{
  double x = self->_regionOfInterest.origin.x;
  double y = self->_regionOfInterest.origin.y;
  double width = self->_regionOfInterest.size.width;
  double height = self->_regionOfInterest.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceMaskObservation, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end