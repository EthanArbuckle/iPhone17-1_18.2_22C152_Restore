@interface DUStructuredEntityLabelObjC
- (DUStructuredEntityLabelObjC)init;
- (NSString)labelName;
- (double)confidenceScore;
- (void)setConfidenceScore:(double)a3;
- (void)setLabelName:(id)a3;
@end

@implementation DUStructuredEntityLabelObjC

- (void).cxx_destruct
{
}

- (void)setConfidenceScore:(double)a3
{
  objc_msgSend_setConfidenceScore_(self->_underlying, a2, v3, v4, v5, a3);
}

- (double)confidenceScore
{
  objc_msgSend_confidenceScore(self->_underlying, a2, v2, v3, v4);
  return result;
}

- (void)setLabelName:(id)a3
{
  objc_msgSend_setLabelName_(self->_underlying, a2, (uint64_t)a3, v3, v4);
}

- (NSString)labelName
{
  return (NSString *)objc_msgSend_labelName(self->_underlying, a2, v2, v3, v4);
}

- (DUStructuredEntityLabelObjC)init
{
  v7.receiver = self;
  v7.super_class = (Class)DUStructuredEntityLabelObjC;
  uint64_t v2 = [(DUStructuredEntityLabelObjC *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(_TtC21DocumentUnderstanding27DUStructuredExtractionLabel);
    underlying = v2->_underlying;
    v2->_underlying = v3;

    uint64_t v5 = v2;
  }

  return v2;
}

@end