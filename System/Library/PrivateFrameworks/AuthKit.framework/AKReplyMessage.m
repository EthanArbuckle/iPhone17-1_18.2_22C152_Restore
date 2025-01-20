@interface AKReplyMessage
- (AKReplyMessage)init;
- (BOOL)didSucceed;
- (NSData)returnData;
- (NSError)error;
- (NSString)replyToID;
- (id)description;
- (void)setDidSucceed:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setReplyToID:(id)a3;
- (void)setReturnData:(id)a3;
@end

@implementation AKReplyMessage

- (AKReplyMessage)init
{
  v5.receiver = self;
  v5.super_class = (Class)AKReplyMessage;
  v2 = [(_AKMessage *)&v5 init];
  v3 = v2;
  if (v2) {
    [(NSMutableDictionary *)v2->super._properties setObject:&off_10023AF78 forKeyedSubscript:@"aktyp"];
  }
  return v3;
}

- (NSString)replyToID
{
  return (NSString *)[(NSMutableDictionary *)self->super._properties objectForKeyedSubscript:@"akrid"];
}

- (void)setReplyToID:(id)a3
{
}

- (BOOL)didSucceed
{
  v2 = [(NSMutableDictionary *)self->super._properties objectForKeyedSubscript:@"aksuc"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setDidSucceed:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(NSMutableDictionary *)self->super._properties setObject:v4 forKeyedSubscript:@"aksuc"];
}

- (NSError)error
{
  v2 = [(NSMutableDictionary *)self->super._properties objectForKeyedSubscript:@"akerd"];
  if (v2)
  {
    unsigned __int8 v3 = +[NSSet setWithObject:objc_opt_class()];
    id v4 = +[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:v3 fromData:v2 error:0];
  }
  else
  {
    id v4 = 0;
  }

  return (NSError *)v4;
}

- (void)setError:(id)a3
{
  if (a3)
  {
    id v4 = objc_msgSend(a3, "ac_secureCodingError");
    id v6 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];

    [(NSMutableDictionary *)self->super._properties setObject:v6 forKeyedSubscript:@"akerd"];
  }
  else
  {
    properties = self->super._properties;
    [(NSMutableDictionary *)properties removeObjectForKey:@"akerd"];
  }
}

- (NSData)returnData
{
  return (NSData *)[(NSMutableDictionary *)self->super._properties objectForKeyedSubscript:@"akret"];
}

- (void)setReturnData:(id)a3
{
  properties = self->super._properties;
  if (a3) {
    [(NSMutableDictionary *)properties setObject:a3 forKeyedSubscript:@"akret"];
  }
  else {
    [(NSMutableDictionary *)properties removeObjectForKey:@"akret"];
  }
}

- (id)description
{
  unsigned __int8 v3 = [(NSMutableDictionary *)self->super._properties objectForKeyedSubscript:@"akret"];
  id v4 = v3;
  if (v3)
  {
    objc_super v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 length]);
    id v6 = +[NSString stringWithFormat:@"NSData <%@ bytes>", v5];
  }
  else
  {
    id v6 = @"(none)";
  }
  v7 = [(_AKMessage *)self identifier];
  v8 = [(AKReplyMessage *)self replyToID];
  if ([(AKReplyMessage *)self didSucceed]) {
    CFStringRef v9 = @"YES";
  }
  else {
    CFStringRef v9 = @"NO";
  }
  v10 = [(AKReplyMessage *)self error];
  v11 = +[NSString stringWithFormat:@"\nAKReplyMessage <%p> {\nInternal ID: %@,\nReply-To: %@,\nSuccess: %@,\nError: %@,\nRD: %@ }", self, v7, v8, v9, v10, v6];

  return v11;
}

@end