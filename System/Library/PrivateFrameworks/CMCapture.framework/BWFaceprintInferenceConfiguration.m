@interface BWFaceprintInferenceConfiguration
- (unint64_t)maximumNumberOfFaces;
- (void)setMaximumNumberOfFaces:(unint64_t)a3;
@end

@implementation BWFaceprintInferenceConfiguration

- (unint64_t)maximumNumberOfFaces
{
  return self->_maximumNumberOfFaces;
}

- (void)setMaximumNumberOfFaces:(unint64_t)a3
{
  self->_maximumNumberOfFaces = a3;
}

@end