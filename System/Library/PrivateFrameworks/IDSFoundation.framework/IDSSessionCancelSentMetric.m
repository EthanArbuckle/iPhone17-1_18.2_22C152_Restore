@interface IDSSessionCancelSentMetric
- (IDSSessionCancelSentMetric)initWithGuid:(id)a3 numberOfRecipients:(id)a4 remoteSessionEndReason:(unsigned int)a5;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)numberOfRecipients;
- (NSString)guid;
- (NSString)name;
- (unsigned)remoteSessionEndReason;
@end

@implementation IDSSessionCancelSentMetric

- (NSString)name
{
  return (NSString *)@"SessionCancelSent";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7 = objc_msgSend_guid(self, v4, v5, v6);
  if (v7) {
    CFDictionarySetValue(v3, @"guid", v7);
  }

  v11 = objc_msgSend_numberOfRecipients(self, v8, v9, v10);
  if (v11) {
    CFDictionarySetValue(v3, @"numberOfRecipients", v11);
  }

  v12 = NSNumber;
  uint64_t v16 = objc_msgSend_remoteSessionEndReason(self, v13, v14, v15);
  v19 = objc_msgSend_numberWithUnsignedInt_(v12, v17, v16, v18);
  if (v19) {
    CFDictionarySetValue(v3, @"remoteSessionEndReason", v19);
  }

  return (NSDictionary *)v3;
}

- (IDSSessionCancelSentMetric)initWithGuid:(id)a3 numberOfRecipients:(id)a4 remoteSessionEndReason:(unsigned int)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IDSSessionCancelSentMetric;
  v11 = [(IDSSessionCancelSentMetric *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_guid, a3);
    objc_storeStrong((id *)&v12->_numberOfRecipients, a4);
    v12->_remoteSessionEndReason = a5;
  }

  return v12;
}

- (NSString)guid
{
  return self->_guid;
}

- (NSNumber)numberOfRecipients
{
  return self->_numberOfRecipients;
}

- (unsigned)remoteSessionEndReason
{
  return self->_remoteSessionEndReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberOfRecipients, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end