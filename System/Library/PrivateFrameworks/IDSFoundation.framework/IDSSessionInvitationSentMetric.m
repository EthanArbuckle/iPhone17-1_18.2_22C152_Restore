@interface IDSSessionInvitationSentMetric
- (IDSSessionInvitationSentMetric)initWithGuid:(id)a3 numberOfRecipients:(id)a4;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)numberOfRecipients;
- (NSString)guid;
- (NSString)name;
@end

@implementation IDSSessionInvitationSentMetric

- (NSString)name
{
  return (NSString *)@"IDSSessionInvitationSent";
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

  return (NSDictionary *)v3;
}

- (IDSSessionInvitationSentMetric)initWithGuid:(id)a3 numberOfRecipients:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSSessionInvitationSentMetric;
  uint64_t v9 = [(IDSSessionInvitationSentMetric *)&v12 init];
  double v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_guid, a3);
    objc_storeStrong((id *)&v10->_numberOfRecipients, a4);
  }

  return v10;
}

- (NSString)guid
{
  return self->_guid;
}

- (NSNumber)numberOfRecipients
{
  return self->_numberOfRecipients;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberOfRecipients, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end