@interface IDSGFTMetricsAnonymizer
- (IDSGFTMetricsAnonymizer)init;
- (id)anonymizeID:(id)a3;
@end

@implementation IDSGFTMetricsAnonymizer

- (IDSGFTMetricsAnonymizer)init
{
  v7.receiver = self;
  v7.super_class = (Class)IDSGFTMetricsAnonymizer;
  v2 = [(IDSGFTMetricsAnonymizer *)&v7 init];
  v3 = v2;
  if (v2)
  {
    if (!v2->_assignedIDs)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      assignedIDs = v3->_assignedIDs;
      v3->_assignedIDs = (NSMutableDictionary *)Mutable;
    }
    v3->_nextAnonymizedID = 0;
  }
  return v3;
}

- (id)anonymizeID:(id)a3
{
  v4 = (__CFString *)a3;
  objc_super v7 = v4;
  if (@"IDSGFTMetricsWildcard" == v4)
  {
    v13 = v4;
    objc_super v7 = v13;
  }
  else
  {
    uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(self->_assignedIDs, v5, (uint64_t)v4, v6);
    if (v8)
    {
      v12 = (void *)v8;
    }
    else
    {
      if (!v7)
      {
        objc_super v7 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v9, v10, v11);
      }
      v12 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v9, self->_nextAnonymizedID, v11);
      objc_msgSend_setObject_forKeyedSubscript_(self->_assignedIDs, v14, (uint64_t)v12, v15, v7);
      ++self->_nextAnonymizedID;
    }
    v13 = v12;
  }
  return v13;
}

- (void).cxx_destruct
{
}

@end