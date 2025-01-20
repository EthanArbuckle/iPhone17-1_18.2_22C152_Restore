@interface DUFoundInEventClassificationResultObjC
- (DUFoundInEventClassificationResultObjC)init;
- (NSNumber)containsDataDetectors;
- (NSNumber)isClassifiedAsEvent;
- (NSNumber)isEventCandidate;
- (NSNumber)isHumanHeaders;
- (NSNumber)isHumanSender;
- (NSNumber)isSupportedLocale;
- (void)setContainsDataDetectors:(id)a3;
- (void)setIsClassifiedAsEvent:(id)a3;
- (void)setIsEventCandidate:(id)a3;
- (void)setIsHumanHeaders:(id)a3;
- (void)setIsHumanSender:(id)a3;
- (void)setIsSupportedLocale:(id)a3;
@end

@implementation DUFoundInEventClassificationResultObjC

- (void).cxx_destruct
{
}

- (void)setIsEventCandidate:(id)a3
{
  objc_msgSend_setIsEventCandidate_(self->_underlying, a2, (uint64_t)a3, v3, v4);
}

- (NSNumber)isEventCandidate
{
  return (NSNumber *)objc_msgSend_isEventCandidate(self->_underlying, a2, v2, v3, v4);
}

- (void)setIsClassifiedAsEvent:(id)a3
{
  objc_msgSend_setIsClassifiedAsEvent_(self->_underlying, a2, (uint64_t)a3, v3, v4);
}

- (NSNumber)isClassifiedAsEvent
{
  return (NSNumber *)objc_msgSend_isClassifiedAsEvent(self->_underlying, a2, v2, v3, v4);
}

- (void)setContainsDataDetectors:(id)a3
{
  objc_msgSend_setContainsDataDetectors_(self->_underlying, a2, (uint64_t)a3, v3, v4);
}

- (NSNumber)containsDataDetectors
{
  return (NSNumber *)objc_msgSend_containsDataDetectors(self->_underlying, a2, v2, v3, v4);
}

- (void)setIsHumanHeaders:(id)a3
{
  objc_msgSend_setIsHumanHeaders_(self->_underlying, a2, (uint64_t)a3, v3, v4);
}

- (NSNumber)isHumanHeaders
{
  return (NSNumber *)objc_msgSend_isHumanHeaders(self->_underlying, a2, v2, v3, v4);
}

- (void)setIsHumanSender:(id)a3
{
  objc_msgSend_setIsHumanSender_(self->_underlying, a2, (uint64_t)a3, v3, v4);
}

- (NSNumber)isHumanSender
{
  return (NSNumber *)objc_msgSend_isHumanSender(self->_underlying, a2, v2, v3, v4);
}

- (void)setIsSupportedLocale:(id)a3
{
  objc_msgSend_setIsSupportedLocale_(self->_underlying, a2, (uint64_t)a3, v3, v4);
}

- (NSNumber)isSupportedLocale
{
  return (NSNumber *)objc_msgSend_isSupportedLocale(self->_underlying, a2, v2, v3, v4);
}

- (DUFoundInEventClassificationResultObjC)init
{
  v7.receiver = self;
  v7.super_class = (Class)DUFoundInEventClassificationResultObjC;
  uint64_t v2 = [(DUFoundInEventClassificationResultObjC *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(_TtC21DocumentUnderstanding34DUFoundInEventClassificationResult);
    underlying = v2->_underlying;
    v2->_underlying = v3;

    v5 = v2;
  }

  return v2;
}

@end