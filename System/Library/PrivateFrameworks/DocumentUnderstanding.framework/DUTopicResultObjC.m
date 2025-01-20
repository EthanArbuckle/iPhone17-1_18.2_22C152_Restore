@interface DUTopicResultObjC
- (DUGlobalTopicSetIdentifierObjC)topicSet;
- (DUTopicResultObjC)init;
- (NSArray)topicNames;
- (NSString)topicIdentifier;
- (double)topicConfidence;
- (void)setTopicConfidence:(double)a3;
- (void)setTopicIdentifier:(id)a3;
- (void)setTopicNames:(id)a3;
- (void)setTopicSet:(id)a3;
@end

@implementation DUTopicResultObjC

- (void).cxx_destruct
{
}

- (void)setTopicNames:(id)a3
{
}

- (NSArray)topicNames
{
  return (NSArray *)((uint64_t (*)(_TtC21DocumentUnderstanding13DUTopicResult *, char *))MEMORY[0x270F9A6D0])(self->_underlying, sel_topicNames);
}

- (void)setTopicConfidence:(double)a3
{
  objc_msgSend_setTopicConfidence_(self->_underlying, a2, v3, v4, v5, a3);
}

- (double)topicConfidence
{
  objc_msgSend_topicConfidence(self->_underlying, a2, v2, v3, v4);
  return result;
}

- (void)setTopicIdentifier:(id)a3
{
  objc_msgSend_setTopicIdentifier_(self->_underlying, a2, (uint64_t)a3, v3, v4);
}

- (NSString)topicIdentifier
{
  return (NSString *)objc_msgSend_topicIdentifier(self->_underlying, a2, v2, v3, v4);
}

- (void)setTopicSet:(id)a3
{
  objc_msgSend_globalTopicSetIdentifierForObjCGlobalTopicSetIdentifier_(DUObjCCompatibilityUtils, a2, (uint64_t)a3, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTopicSet_(self->_underlying, v6, (uint64_t)v9, v7, v8);
}

- (DUGlobalTopicSetIdentifierObjC)topicSet
{
  uint64_t v5 = objc_msgSend_topicSet(self->_underlying, a2, v2, v3, v4);
  id v9 = objc_msgSend_objCGlobalTopicSetIdentifierForGlobalTopicSetIdentifier_(DUObjCCompatibilityUtils, v6, (uint64_t)v5, v7, v8);

  return (DUGlobalTopicSetIdentifierObjC *)v9;
}

- (DUTopicResultObjC)init
{
  v7.receiver = self;
  v7.super_class = (Class)DUTopicResultObjC;
  uint64_t v2 = [(DUTopicResultObjC *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(_TtC21DocumentUnderstanding13DUTopicResult);
    underlying = v2->_underlying;
    v2->_underlying = v3;

    uint64_t v5 = v2;
  }

  return v2;
}

@end