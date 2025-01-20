@interface GDScoredPersonEntityTagType
- (GDScoredPersonEntityTagType)initWithTag:(int64_t)a3 score:(double)a4;
- (double)score;
- (int64_t)tag;
@end

@implementation GDScoredPersonEntityTagType

- (void).cxx_destruct
{
}

- (double)score
{
  objc_msgSend_score(self->inner, a2, v2, v3, v4);
  return result;
}

- (int64_t)tag
{
  return objc_msgSend_gdTag(self->inner, a2, v2, v3, v4);
}

- (GDScoredPersonEntityTagType)initWithTag:(int64_t)a3 score:(double)a4
{
  v13.receiver = self;
  v13.super_class = (Class)GDScoredPersonEntityTagType;
  v6 = [(GDScoredPersonEntityTagType *)&v13 init];
  if (v6)
  {
    v7 = [GDScoredPersonEntityTagInner alloc];
    uint64_t v10 = objc_msgSend_initWithGdTag_score_inferenceEventIdValue_(v7, v8, a3, 0, v9, a4);
    inner = v6->inner;
    v6->inner = (GDScoredPersonEntityTagInner *)v10;
  }
  return v6;
}

@end