@interface DUGlobalTopicSetIdentifierObjC
- (DUGlobalTopicSetIdentifierObjC)init;
- (int64_t)topicSetName;
- (int64_t)topicSetVersion;
- (void)setTopicSetName:(int64_t)a3;
- (void)setTopicSetVersion:(int64_t)a3;
@end

@implementation DUGlobalTopicSetIdentifierObjC

- (void).cxx_destruct
{
}

- (void)setTopicSetVersion:(int64_t)a3
{
  objc_msgSend_setTopicSetVersion_(self->_underlying, a2, a3, v3, v4);
}

- (int64_t)topicSetVersion
{
  return objc_msgSend_topicSetVersion(self->_underlying, a2, v2, v3, v4);
}

- (void)setTopicSetName:(int64_t)a3
{
  objc_msgSend_setTopicSetName_(self->_underlying, a2, a3, v3, v4);
}

- (int64_t)topicSetName
{
  return objc_msgSend_topicSetName(self->_underlying, a2, v2, v3, v4);
}

- (DUGlobalTopicSetIdentifierObjC)init
{
  v7.receiver = self;
  v7.super_class = (Class)DUGlobalTopicSetIdentifierObjC;
  uint64_t v2 = [(DUGlobalTopicSetIdentifierObjC *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(_TtC21DocumentUnderstanding26DUGlobalTopicSetIdentifier);
    underlying = v2->_underlying;
    v2->_underlying = v3;

    v5 = v2;
  }

  return v2;
}

@end