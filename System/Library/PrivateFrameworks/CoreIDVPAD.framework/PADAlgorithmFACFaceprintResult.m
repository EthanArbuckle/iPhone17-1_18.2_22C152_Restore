@interface PADAlgorithmFACFaceprintResult
- (NSArray)faceprint;
- (unint64_t)index;
- (void)setFaceprint:(id)a3;
- (void)setIndex:(unint64_t)a3;
@end

@implementation PADAlgorithmFACFaceprintResult

- (NSArray)faceprint
{
  return self->_faceprint;
}

- (void)setFaceprint:(id)a3
{
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (void).cxx_destruct
{
}

@end