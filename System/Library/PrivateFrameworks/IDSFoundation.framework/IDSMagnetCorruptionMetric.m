@interface IDSMagnetCorruptionMetric
- (IDSMagnetCorruptionMetric)initWithCorrectFramesSinceLastCorruption:(unint64_t)a3 correctRawBytesSinceLastCorruption:(unint64_t)a4 discardedRawBytes:(unint64_t)a5 recoveryTimeInMs:(unint64_t)a6 linkType:(unint64_t)a7;
- (NSDictionary)dictionaryRepresentation;
- (NSString)name;
- (unint64_t)correctFramesSinceLastCorruption;
- (unint64_t)correctRawBytesSinceLastCorruption;
- (unint64_t)discardedRawBytes;
- (unint64_t)linkType;
- (unint64_t)recoveryTimeInMs;
@end

@implementation IDSMagnetCorruptionMetric

- (NSString)name
{
  return (NSString *)@"MagnetCorruption";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = NSNumber;
  uint64_t Corruption = objc_msgSend_correctFramesSinceLastCorruption(self, v5, v6, v7);
  v11 = objc_msgSend_numberWithUnsignedLongLong_(v4, v9, Corruption, v10);
  if (v11) {
    CFDictionarySetValue(v3, @"correctFramesSinceLastCorruption", v11);
  }

  v12 = NSNumber;
  uint64_t v16 = objc_msgSend_correctRawBytesSinceLastCorruption(self, v13, v14, v15);
  v19 = objc_msgSend_numberWithUnsignedLongLong_(v12, v17, v16, v18);
  if (v19) {
    CFDictionarySetValue(v3, @"correctRawBytesSinceLastCorruption", v19);
  }

  v20 = NSNumber;
  uint64_t v24 = objc_msgSend_discardedRawBytes(self, v21, v22, v23);
  v27 = objc_msgSend_numberWithUnsignedLongLong_(v20, v25, v24, v26);
  if (v27) {
    CFDictionarySetValue(v3, @"discardedRawBytes", v27);
  }

  v28 = NSNumber;
  uint64_t v32 = objc_msgSend_recoveryTimeInMs(self, v29, v30, v31);
  v35 = objc_msgSend_numberWithUnsignedLongLong_(v28, v33, v32, v34);
  if (v35) {
    CFDictionarySetValue(v3, @"recoveryTimeInMs", v35);
  }

  v36 = NSNumber;
  uint64_t v40 = objc_msgSend_linkType(self, v37, v38, v39);
  v43 = objc_msgSend_numberWithUnsignedLongLong_(v36, v41, v40, v42);
  if (v43) {
    CFDictionarySetValue(v3, @"linkType", v43);
  }

  return (NSDictionary *)v3;
}

- (IDSMagnetCorruptionMetric)initWithCorrectFramesSinceLastCorruption:(unint64_t)a3 correctRawBytesSinceLastCorruption:(unint64_t)a4 discardedRawBytes:(unint64_t)a5 recoveryTimeInMs:(unint64_t)a6 linkType:(unint64_t)a7
{
  v13.receiver = self;
  v13.super_class = (Class)IDSMagnetCorruptionMetric;
  result = [(IDSMagnetCorruptionMetric *)&v13 init];
  if (result)
  {
    result->_correctFramesSinceLastuint64_t Corruption = a3;
    result->_correctRawBytesSinceLastuint64_t Corruption = a4;
    result->_discardedRawBytes = a5;
    result->_recoveryTimeInMs = a6;
    result->_linkType = a7;
  }
  return result;
}

- (unint64_t)correctFramesSinceLastCorruption
{
  return self->_correctFramesSinceLastCorruption;
}

- (unint64_t)correctRawBytesSinceLastCorruption
{
  return self->_correctRawBytesSinceLastCorruption;
}

- (unint64_t)discardedRawBytes
{
  return self->_discardedRawBytes;
}

- (unint64_t)recoveryTimeInMs
{
  return self->_recoveryTimeInMs;
}

- (unint64_t)linkType
{
  return self->_linkType;
}

@end