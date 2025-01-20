@interface IDSBlastDoorMessageContext
- (BOOL)isInvitationService;
- (IDSBlastDoorMessageContext)initWithService:(id)a3 command:(id)a4;
- (NSNumber)command;
- (NSString)topic;
- (id)description;
- (id)dictionaryRepresentation;
- (unsigned)payloadType;
- (void)setPayloadType:(unsigned int)a3;
@end

@implementation IDSBlastDoorMessageContext

- (IDSBlastDoorMessageContext)initWithService:(id)a3 command:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)IDSBlastDoorMessageContext;
  v10 = [(IDSBlastDoorMessageContext *)&v18 init];
  if (v10)
  {
    uint64_t v12 = objc_msgSend_pushTopic(v6, v8, v9, v11);
    topic = v10->_topic;
    v10->_topic = (NSString *)v12;

    v10->_isInvitationService = objc_msgSend_isInvitationService(v6, v14, v15, v16);
    objc_storeStrong((id *)&v10->_command, a4);
  }

  return v10;
}

- (id)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = self->_topic;
  if (v4)
  {
    CFDictionarySetValue(v3, @"topic", v4);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_19DB762FC();
  }

  id v7 = objc_msgSend_numberWithBool_(NSNumber, v5, self->_isInvitationService, v6);
  if (v7)
  {
    CFDictionarySetValue(v3, @"is-invitation-service", v7);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_19DB76274();
  }

  v8 = self->_command;
  if (v8)
  {
    CFDictionarySetValue(v3, @"command", v8);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_19DB761EC();
  }

  double v11 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v9, self->_payloadType, v10);
  if (v11) {
    CFDictionarySetValue(v3, @"payload-type", v11);
  }

  return v3;
}

- (id)description
{
  v5 = NSString;
  double v6 = objc_msgSend_topic(self, a2, v2, v3);
  double v10 = objc_msgSend_command(self, v7, v8, v9);
  if (objc_msgSend_isInvitationService(self, v11, v12, v13)) {
    v17 = @"YES";
  }
  else {
    v17 = @"NO";
  }
  unsigned int v18 = objc_msgSend_payloadType(self, v14, v15, v16);
  v21 = objc_msgSend_stringWithFormat_(v5, v19, @"<IDSBlastDoorMessageContext %p>: topic %@ command %@ isInviationService %@ payloadType %ld", v20, self, v6, v10, v17, v18);

  return v21;
}

- (NSString)topic
{
  return self->_topic;
}

- (BOOL)isInvitationService
{
  return self->_isInvitationService;
}

- (NSNumber)command
{
  return self->_command;
}

- (unsigned)payloadType
{
  return self->_payloadType;
}

- (void)setPayloadType:(unsigned int)a3
{
  self->_payloadType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_topic, 0);
}

@end