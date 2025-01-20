@interface CTMessage
- (BOOL)bypassSupportedMessageModesCheck;
- (BOOL)replyEnabled;
- (CTMessage)init;
- (CTMessage)initWithDate:(id)a3;
- (CTMessageAddress)sender;
- (CTPhoneNumber)serviceCenter;
- (CTXPCServiceSubscriptionContext)context;
- (NSArray)items;
- (NSArray)recipients;
- (NSDate)date;
- (NSDictionary)rawHeaders;
- (NSString)contentType;
- (NSString)countryCode;
- (NSString)subject;
- (NSUUID)uniqueIdentifier;
- (id)addData:(id)a3 withContentType:(id)a4;
- (id)addPart:(id)a3;
- (id)addText:(id)a3;
- (id)allContentTypeParameterNames;
- (id)contentTypeParameterWithName:(id)a3;
- (id)description;
- (int)messageType;
- (int)smsType;
- (unsigned)messageId;
- (unsigned)replaceMessage;
- (void)addContentTypeParameterWithName:(id)a3 value:(id)a4;
- (void)addEmailRecipient:(id)a3;
- (void)addPhoneRecipient:(id)a3;
- (void)addRecipient:(id)a3;
- (void)removePartAtIndex:(unint64_t)a3;
- (void)removeRecipient:(id)a3;
- (void)removeRecipientsInArray:(id)a3;
- (void)setBypassSupportedMessageModesCheck:(BOOL)a3;
- (void)setContentType:(id)a3;
- (void)setContext:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setMessageId:(unsigned int)a3;
- (void)setMessageType:(int)a3;
- (void)setRawHeaders:(id)a3;
- (void)setRecipient:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setReplaceMessage:(unsigned int)a3;
- (void)setReplyEnabled:(BOOL)a3;
- (void)setSender:(id)a3;
- (void)setServiceCenter:(id)a3;
- (void)setSmsType:(int)a3;
- (void)setSubject:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation CTMessage

- (CTMessage)init
{
  v19.receiver = self;
  v19.super_class = (Class)CTMessage;
  v2 = [(CTMessage *)&v19 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    recipients = v2->_recipients;
    v2->_recipients = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    items = v2->_items;
    v2->_items = v5;

    sender = v2->_sender;
    v2->_sender = 0;

    v8 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    date = v2->_date;
    v2->_date = v8;

    *(void *)&v2->_messageId = 0xFFFFFFFFLL;
    serviceCenter = v2->_serviceCenter;
    v2->_serviceCenter = 0;

    subject = v2->_subject;
    v2->_subject = 0;

    rawHeaders = v2->_rawHeaders;
    v2->_rawHeaders = 0;

    contentType = v2->_contentType;
    v2->_contentType = 0;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    contentTypeParams = v2->_contentTypeParams;
    v2->_contentTypeParams = v14;

    countryCode = v2->_countryCode;
    v2->_countryCode = 0;

    v2->_bypassSupportedMessageModesCheck = 0;
    context = v2->_context;
    v2->_context = 0;

    v2->_replyEnabled = 0;
    v2->_smsType = 0;
  }
  return v2;
}

- (CTMessage)initWithDate:(id)a3
{
  id v4 = a3;
  v5 = [(CTMessage *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    date = v5->_date;
    v5->_date = (NSDate *)v6;
  }
  return v5;
}

- (void)setRawHeaders:(id)a3
{
  v5 = (NSDictionary *)a3;
  rawHeaders = self->_rawHeaders;
  p_rawHeaders = &self->_rawHeaders;
  if (rawHeaders != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_rawHeaders, a3);
    v5 = v8;
  }
}

- (void)setReplaceMessage:(unsigned int)a3
{
  self->_replaceMessage = a3;
}

- (void)addRecipient:(id)a3
{
  id v7 = a3;
  if ([v7 isMemberOfClass:objc_opt_class()])
  {
    [(CTMessage *)self addPhoneRecipient:v7];
  }
  else if ([v7 rangeOfString:@"@"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = [CTPhoneNumber alloc];
    v5 = [(CTMessage *)self context];
    uint64_t v6 = -[CTPhoneNumber initWithDigits:digits:countryCode:](v4, "initWithDigits:digits:countryCode:", [v5 slotID], v7, @"1");

    [(CTMessage *)self addPhoneRecipient:v6];
  }
  else
  {
    [(CTMessage *)self addEmailRecipient:v7];
  }
}

- (void)removeRecipient:(id)a3
{
  uint64_t v4 = [(NSMutableArray *)self->_recipients indexOfObject:a3];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = v4;
    recipients = self->_recipients;
    [(NSMutableArray *)recipients removeObjectAtIndex:v5];
  }
}

- (void)removeRecipientsInArray:(id)a3
{
  if (a3) {
    -[NSMutableArray removeObjectsInArray:](self->_recipients, "removeObjectsInArray:");
  }
}

- (void)setRecipient:(id)a3
{
  if (a3)
  {
    recipients = self->_recipients;
    id v5 = a3;
    [(NSMutableArray *)recipients removeAllObjects];
    [(NSMutableArray *)self->_recipients addObject:v5];
  }
}

- (void)setRecipients:(id)a3
{
  id v5 = a3;
  [(NSMutableArray *)self->_recipients removeAllObjects];
  uint64_t v4 = v5;
  if (v5)
  {
    [(NSMutableArray *)self->_recipients addObjectsFromArray:v5];
    uint64_t v4 = v5;
  }
}

- (void)addPhoneRecipient:(id)a3
{
  id v4 = (id)[a3 copy];
  [(NSMutableArray *)self->_recipients addObject:v4];
}

- (void)addEmailRecipient:(id)a3
{
  id v4 = a3;
  id v5 = [[CTEmailAddress alloc] initWithAddress:v4];

  [(NSMutableArray *)self->_recipients addObject:v5];
  self->_messageType = 2;
}

- (id)addText:(id)a3
{
  id v4 = a3;
  id v5 = [CTMessagePart alloc];
  uint64_t v6 = [v4 dataUsingEncoding:4];

  id v7 = [(CTMessagePart *)v5 initWithData:v6 contentType:@"text/plain"];
  [(NSMutableArray *)self->_items addObject:v7];

  return v7;
}

- (id)addData:(id)a3 withContentType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[CTMessagePart alloc] initWithData:v7 contentType:v6];

  [(NSMutableArray *)self->_items addObject:v8];

  return v8;
}

- (id)addPart:(id)a3
{
  id v4 = a3;
  [(NSMutableArray *)self->_items addObject:v4];

  return v4;
}

- (void)removePartAtIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_items count] > a3)
  {
    items = self->_items;
    [(NSMutableArray *)items removeObjectAtIndex:a3];
  }
}

- (id)contentTypeParameterWithName:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_contentTypeParams objectForKey:a3];
}

- (void)addContentTypeParameterWithName:(id)a3 value:(id)a4
{
  if (a3)
  {
    if (a4) {
      [(NSMutableDictionary *)self->_contentTypeParams setObject:a4 forKey:a3];
    }
  }
}

- (id)allContentTypeParameterNames
{
  return (id)[(NSMutableDictionary *)self->_contentTypeParams allKeys];
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = [(CTMessageAddress *)self->_sender encodedString];
  id v5 = (void *)[v3 initWithFormat:@"<[CTMessageAddress: %@]\n\t[Recipients: %@]\n\t[Items: %@]\n\t[Raw Headers: %@]\n\t[Date: %@]\n\t[message ID: %d]\n\t[message Type: %d]\n\t[service center: %@]\n\t[Content-type: %@]\n\t[Content-type params: %@]\n\t[replace message: %d]\n [reply enabled: %d]", v4, self->_recipients, self->_items, self->_rawHeaders, self->_date, self->_messageId, self->_messageType, self->_serviceCenter, self->_contentType, self->_contentTypeParams, self->_replaceMessage, self->_replyEnabled];

  return v5;
}

- (void)setCountryCode:(id)a3
{
}

- (void)setReplyEnabled:(BOOL)a3
{
  self->_replyEnabled = a3;
}

- (NSArray)recipients
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (unsigned)messageId
{
  return self->_messageId;
}

- (void)setMessageId:(unsigned int)a3
{
  self->_messageId = a3;
}

- (NSArray)items
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (int)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(int)a3
{
  self->_messageType = a3;
}

- (CTPhoneNumber)serviceCenter
{
  return self->_serviceCenter;
}

- (void)setServiceCenter:(id)a3
{
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
}

- (CTMessageAddress)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
}

- (NSDictionary)rawHeaders
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
}

- (unsigned)replaceMessage
{
  return self->_replaceMessage;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uuid;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (BOOL)bypassSupportedMessageModesCheck
{
  return self->_bypassSupportedMessageModesCheck;
}

- (void)setBypassSupportedMessageModesCheck:(BOOL)a3
{
  self->_bypassSupportedMessageModesCheck = a3;
}

- (CTXPCServiceSubscriptionContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (BOOL)replyEnabled
{
  return self->_replyEnabled;
}

- (int)smsType
{
  return self->_smsType;
}

- (void)setSmsType:(int)a3
{
  self->_smsType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_lazuliGUID, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_contentTypeParams, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_serviceCenter, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_rawHeaders, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_recipients, 0);

  objc_storeStrong((id *)&self->_sender, 0);
}

@end