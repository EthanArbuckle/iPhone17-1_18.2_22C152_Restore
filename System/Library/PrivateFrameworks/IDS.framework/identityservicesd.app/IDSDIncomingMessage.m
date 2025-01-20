@interface IDSDIncomingMessage
- (BOOL)isLocal;
- (IDSDIncomingMessage)initWithMessage:(id)a3 fromID:(id)a4 topic:(id)a5 guid:(id)a6 isLocal:(BOOL)a7;
- (NSDictionary)message;
- (NSString)fromID;
- (NSString)guid;
- (NSString)topic;
- (int64_t)expirationDate;
- (unsigned)controlCategory;
- (void)setControlCategory:(unsigned int)a3;
- (void)setExpirationDate:(int64_t)a3;
- (void)setFromID:(id)a3;
- (void)setGuid:(id)a3;
- (void)setIsLocal:(BOOL)a3;
- (void)setMessage:(id)a3;
- (void)setTopic:(id)a3;
@end

@implementation IDSDIncomingMessage

- (IDSDIncomingMessage)initWithMessage:(id)a3 fromID:(id)a4 topic:(id)a5 guid:(id)a6 isLocal:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)IDSDIncomingMessage;
  v16 = [(IDSDIncomingMessage *)&v19 init];
  v17 = v16;
  if (v16)
  {
    [(IDSDIncomingMessage *)v16 setMessage:v12];
    [(IDSDIncomingMessage *)v17 setFromID:v13];
    [(IDSDIncomingMessage *)v17 setTopic:v14];
    [(IDSDIncomingMessage *)v17 setGuid:v15];
    [(IDSDIncomingMessage *)v17 setIsLocal:v7];
    [(IDSDIncomingMessage *)v17 setExpirationDate:0];
    [(IDSDIncomingMessage *)v17 setControlCategory:0];
  }

  return v17;
}

- (NSDictionary)message
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMessage:(id)a3
{
}

- (NSString)fromID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFromID:(id)a3
{
}

- (NSString)topic
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTopic:(id)a3
{
}

- (NSString)guid
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setGuid:(id)a3
{
}

- (BOOL)isLocal
{
  return self->_isLocal;
}

- (void)setIsLocal:(BOOL)a3
{
  self->_isLocal = a3;
}

- (int64_t)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(int64_t)a3
{
  self->_expirationDate = a3;
}

- (unsigned)controlCategory
{
  return self->_controlCategory;
}

- (void)setControlCategory:(unsigned int)a3
{
  self->_controlCategory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_fromID, 0);
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_guid, 0);
}

@end