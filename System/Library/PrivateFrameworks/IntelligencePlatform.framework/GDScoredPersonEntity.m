@interface GDScoredPersonEntity
- (GDScoredPersonEntity)initWithIDValue:(int64_t)a3 score:(double)a4;
- (double)score;
- (int64_t)idValue;
@end

@implementation GDScoredPersonEntity

- (void).cxx_destruct
{
}

- (double)score
{
  objc_msgSend_score(self->inner, a2, v2, v3, v4);
  return result;
}

- (int64_t)idValue
{
  return objc_msgSend_idValue(self->inner, a2, v2, v3, v4);
}

- (GDScoredPersonEntity)initWithIDValue:(int64_t)a3 score:(double)a4
{
  v13.receiver = self;
  v13.super_class = (Class)GDScoredPersonEntity;
  v6 = [(GDScoredPersonEntity *)&v13 init];
  if (v6)
  {
    v7 = [GDScoredPersonInner alloc];
    uint64_t v10 = objc_msgSend_initWithIdValue_score_inferenceEventIdValue_(v7, v8, a3, 0, v9, a4);
    inner = v6->inner;
    v6->inner = (GDScoredPersonInner *)v10;
  }
  return v6;
}

@end