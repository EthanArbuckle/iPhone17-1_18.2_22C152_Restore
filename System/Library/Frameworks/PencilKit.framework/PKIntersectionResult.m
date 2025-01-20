@interface PKIntersectionResult
+ (id)noResult;
- (NSOrderedSet)intersectedStrokes;
- (int64_t)contentType;
- (int64_t)intersectionAlgorithmType;
- (void)setContentType:(int64_t)a3;
- (void)setIntersectedStrokes:(id)a3;
- (void)setIntersectionAlgorithmType:(int64_t)a3;
@end

@implementation PKIntersectionResult

+ (id)noResult
{
  if (_MergedGlobals_165 != -1) {
    dispatch_once(&_MergedGlobals_165, &__block_literal_global_92);
  }
  v2 = (void *)qword_1EB3C6388;

  return v2;
}

uint64_t __32__PKIntersectionResult_noResult__block_invoke()
{
  v0 = objc_alloc_init(PKIntersectionResult);
  v1 = (void *)qword_1EB3C6388;
  qword_1EB3C6388 = (uint64_t)v0;

  v2 = [MEMORY[0x1E4F1CAA0] orderedSet];
  [(id)qword_1EB3C6388 setIntersectedStrokes:v2];

  [(id)qword_1EB3C6388 setIntersectionAlgorithmType:0];
  v3 = (void *)qword_1EB3C6388;

  return [v3 setContentType:0];
}

- (NSOrderedSet)intersectedStrokes
{
  return self->_intersectedStrokes;
}

- (void)setIntersectedStrokes:(id)a3
{
}

- (int64_t)intersectionAlgorithmType
{
  return self->_intersectionAlgorithmType;
}

- (void)setIntersectionAlgorithmType:(int64_t)a3
{
  self->_intersectionAlgorithmType = a3;
}

- (int64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(int64_t)a3
{
  self->_contentType = a3;
}

- (void).cxx_destruct
{
}

@end