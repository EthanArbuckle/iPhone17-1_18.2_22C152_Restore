@interface IPCLoadDirectionsReply
- (IPCLoadDirectionsReply)initWithDictionary:(id)a3;
- (NSError)error;
- (id)description;
- (id)dictionaryValue;
- (unint64_t)navigationState;
- (unint64_t)safetyWarningType;
- (void)setError:(id)a3;
- (void)setNavigationState:(unint64_t)a3;
- (void)setSafetyWarningType:(unint64_t)a3;
@end

@implementation IPCLoadDirectionsReply

- (IPCLoadDirectionsReply)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IPCLoadDirectionsReply;
  v5 = [(IPCMessageObject *)&v12 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"kIPCLoadDirectionsReplyState"];
    -[IPCLoadDirectionsReply setNavigationState:](v5, "setNavigationState:", [v6 unsignedIntegerValue]);

    v7 = [v4 objectForKeyedSubscript:@"kIPCLoadDirectionsReplySafetyWarningType"];
    -[IPCLoadDirectionsReply setSafetyWarningType:](v5, "setSafetyWarningType:", [v7 unsignedIntegerValue]);

    v8 = [v4 objectForKeyedSubscript:@"kIPCLoadDirectionsReplyError"];

    if (v8)
    {
      v9 = [v4 objectForKeyedSubscript:@"kIPCLoadDirectionsReplyError"];
      v10 = _geo_NSErrorFromDictionaryRepresentationCopy();
      [(IPCLoadDirectionsReply *)v5 setError:v10];
    }
  }

  return v5;
}

- (id)dictionaryValue
{
  v12.receiver = self;
  v12.super_class = (Class)IPCLoadDirectionsReply;
  v3 = [(IPCMessageObject *)&v12 dictionaryValue];
  id v4 = [v3 mutableCopy];

  v5 = +[NSNumber numberWithUnsignedInteger:[(IPCLoadDirectionsReply *)self navigationState]];
  [v4 setObject:v5 forKeyedSubscript:@"kIPCLoadDirectionsReplyState"];

  v6 = +[NSNumber numberWithUnsignedInteger:[(IPCLoadDirectionsReply *)self safetyWarningType]];
  [v4 setObject:v6 forKeyedSubscript:@"kIPCLoadDirectionsReplySafetyWarningType"];

  v7 = [(IPCLoadDirectionsReply *)self error];

  if (v7)
  {
    v8 = [(IPCLoadDirectionsReply *)self error];
    v9 = _geo_NSErrorDictionaryRepresentationCopy();
    [v4 setObject:v9 forKeyedSubscript:@"kIPCLoadDirectionsReplyError"];
  }
  id v10 = [v4 copy];

  return v10;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)IPCLoadDirectionsReply;
  v3 = [(IPCLoadDirectionsReply *)&v7 description];
  id v4 = [(IPCLoadDirectionsReply *)self dictionaryValue];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (unint64_t)navigationState
{
  return self->_navigationState;
}

- (void)setNavigationState:(unint64_t)a3
{
  self->_navigationState = a3;
}

- (unint64_t)safetyWarningType
{
  return self->_safetyWarningType;
}

- (void)setSafetyWarningType:(unint64_t)a3
{
  self->_safetyWarningType = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end