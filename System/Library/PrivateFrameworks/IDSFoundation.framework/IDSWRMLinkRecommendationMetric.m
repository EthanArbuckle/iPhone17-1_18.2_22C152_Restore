@interface IDSWRMLinkRecommendationMetric
- (IDSWRMLinkRecommendationMetric)initWithRecommendedLinkType:(unsigned int)a3 primaryLinkType:(unsigned int)a4 magnetState:(unsigned int)a5 infraWiFiState:(unsigned int)a6;
- (NSDictionary)dictionaryRepresentation;
- (NSString)name;
- (unsigned)infraWiFiState;
- (unsigned)magnetState;
- (unsigned)primaryLinkType;
- (unsigned)recommendedLinkType;
@end

@implementation IDSWRMLinkRecommendationMetric

- (NSString)name
{
  return (NSString *)@"WRMLinkRecommendation";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = NSNumber;
  uint64_t v8 = objc_msgSend_recommendedLinkType(self, v5, v6, v7);
  v11 = objc_msgSend_numberWithUnsignedInt_(v4, v9, v8, v10);
  if (v11) {
    CFDictionarySetValue(v3, @"recommendedLinkType", v11);
  }

  v12 = NSNumber;
  uint64_t v16 = objc_msgSend_primaryLinkType(self, v13, v14, v15);
  v19 = objc_msgSend_numberWithUnsignedInt_(v12, v17, v16, v18);
  if (v19) {
    CFDictionarySetValue(v3, @"primaryLinkType", v19);
  }

  v20 = NSNumber;
  uint64_t v24 = objc_msgSend_magnetState(self, v21, v22, v23);
  v27 = objc_msgSend_numberWithUnsignedInt_(v20, v25, v24, v26);
  if (v27) {
    CFDictionarySetValue(v3, @"magnetState", v27);
  }

  v28 = NSNumber;
  uint64_t v32 = objc_msgSend_infraWiFiState(self, v29, v30, v31);
  v35 = objc_msgSend_numberWithUnsignedInt_(v28, v33, v32, v34);
  if (v35) {
    CFDictionarySetValue(v3, @"infraWiFiState", v35);
  }

  return (NSDictionary *)v3;
}

- (IDSWRMLinkRecommendationMetric)initWithRecommendedLinkType:(unsigned int)a3 primaryLinkType:(unsigned int)a4 magnetState:(unsigned int)a5 infraWiFiState:(unsigned int)a6
{
  v11.receiver = self;
  v11.super_class = (Class)IDSWRMLinkRecommendationMetric;
  result = [(IDSWRMLinkRecommendationMetric *)&v11 init];
  if (result)
  {
    result->_recommendedLinkType = a3;
    result->_primaryLinkType = a4;
    result->_magnetState = a5;
    result->_infraWiFiState = a6;
  }
  return result;
}

- (unsigned)recommendedLinkType
{
  return self->_recommendedLinkType;
}

- (unsigned)primaryLinkType
{
  return self->_primaryLinkType;
}

- (unsigned)magnetState
{
  return self->_magnetState;
}

- (unsigned)infraWiFiState
{
  return self->_infraWiFiState;
}

@end