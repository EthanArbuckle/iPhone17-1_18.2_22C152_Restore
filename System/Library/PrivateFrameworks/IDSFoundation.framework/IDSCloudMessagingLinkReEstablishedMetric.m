@interface IDSCloudMessagingLinkReEstablishedMetric
- (IDSCloudMessagingLinkReEstablishedMetric)initWithInactiveTime:(double)a3 linkType:(unint64_t)a4 priorLinkType:(unint64_t)a5;
- (NSCopying)awdRepresentation;
- (NSDictionary)dictionaryRepresentation;
- (NSString)name;
- (double)inactiveTime;
- (unint64_t)linkType;
- (unint64_t)priorLinkType;
- (unsigned)awdIdentifier;
@end

@implementation IDSCloudMessagingLinkReEstablishedMetric

- (IDSCloudMessagingLinkReEstablishedMetric)initWithInactiveTime:(double)a3 linkType:(unint64_t)a4 priorLinkType:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)IDSCloudMessagingLinkReEstablishedMetric;
  result = [(IDSCloudMessagingLinkReEstablishedMetric *)&v9 init];
  if (result)
  {
    result->_inactiveTime = a3;
    result->_linkType = a4;
    result->_priorLinkType = a5;
  }
  return result;
}

- (NSString)name
{
  return (NSString *)@"CloudMessagingLinkReEstablished";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = NSNumber;
  objc_msgSend_inactiveTime(self, v5, v6, v7);
  v11 = objc_msgSend_numberWithDouble_(v4, v8, v9, v10);
  if (v11) {
    CFDictionarySetValue(v3, @"inactiveTime", v11);
  }

  v12 = NSNumber;
  uint64_t v16 = objc_msgSend_linkType(self, v13, v14, v15);
  v19 = objc_msgSend_numberWithUnsignedLongLong_(v12, v17, v16, v18);
  if (v19) {
    CFDictionarySetValue(v3, @"linkType", v19);
  }

  v20 = NSNumber;
  uint64_t v24 = objc_msgSend_priorLinkType(self, v21, v22, v23);
  v27 = objc_msgSend_numberWithUnsignedLongLong_(v20, v25, v24, v26);
  if (v27) {
    CFDictionarySetValue(v3, @"priorLinkType", v27);
  }

  return (NSDictionary *)v3;
}

- (unsigned)awdIdentifier
{
  return 2588690;
}

- (NSCopying)awdRepresentation
{
  id v3 = objc_alloc_init((Class)CUTWeakLinkClass());
  objc_msgSend_inactiveTime(self, v4, v5, v6);
  objc_msgSend_setLinkTimeDelta_(v3, v8, (unint64_t)v7, v7);
  uint64_t v12 = objc_msgSend_linkType(self, v9, v10, v11);
  objc_msgSend_setLinkType_(v3, v13, v12, v14);
  uint64_t v18 = objc_msgSend_priorLinkType(self, v15, v16, v17);
  objc_msgSend_setPriorLinkType_(v3, v19, v18, v20);
  return (NSCopying *)v3;
}

- (double)inactiveTime
{
  return self->_inactiveTime;
}

- (unint64_t)linkType
{
  return self->_linkType;
}

- (unint64_t)priorLinkType
{
  return self->_priorLinkType;
}

@end