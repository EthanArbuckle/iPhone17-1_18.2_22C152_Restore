@interface ATMessage
+ (BOOL)supportsSecureCoding;
- (ATCodableStream)stream;
- (ATMessage)initWithCoder:(id)a3;
- (NSDictionary)parameters;
- (NSInputStream)dataStream;
- (double)timestamp;
- (id)additionalDescription;
- (id)description;
- (id)parameterForKey:(id)a3;
- (unsigned)messageID;
- (unsigned)options;
- (unsigned)sessionID;
- (void)encodeWithCoder:(id)a3;
- (void)setDataStream:(id)a3;
- (void)setMessageID:(unsigned int)a3;
- (void)setOptions:(unsigned int)a3;
- (void)setParameters:(id)a3;
- (void)setSessionID:(unsigned int)a3;
- (void)setStream:(id)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation ATMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->_dataStream, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

- (void)setStream:(id)a3
{
}

- (ATCodableStream)stream
{
  return self->_stream;
}

- (void)setDataStream:(id)a3
{
}

- (NSInputStream)dataStream
{
  return self->_dataStream;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setParameters:(id)a3
{
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setSessionID:(unsigned int)a3
{
  self->_sessionID = a3;
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (void)setMessageID:(unsigned int)a3
{
  self->_messageID = a3;
}

- (unsigned)messageID
{
  return self->_messageID;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt64:self->_messageID forKey:@"messageID"];
  [v4 encodeDouble:@"timestamp" forKey:self->_timestamp];
  parameters = self->_parameters;
  if (parameters)
  {
    id v12 = 0;
    v6 = [MEMORY[0x263F08AC0] dataWithPropertyList:parameters format:200 options:0 error:&v12];
    id v7 = v12;
    if (!v6)
    {
      id v11 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"unable to encode params data" userInfo:0];
      objc_exception_throw(v11);
    }
    v8 = v7;
    [v4 encodeObject:v6 forKey:@"parameters"];
  }
  if (self->_dataStream)
  {
    v9 = [[ATCodableStream alloc] initWithInputStream:self->_dataStream];
    stream = self->_stream;
    self->_stream = v9;

    [v4 encodeObject:self->_stream forKey:@"dataStream"];
  }
}

- (ATMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ATMessage;
  v5 = [(ATMessage *)&v18 init];
  if (v5)
  {
    v5->_messageID = [v4 decodeInt64ForKey:@"messageID"];
    [v4 decodeDoubleForKey:@"timestamp"];
    v5->_timestamp = v6;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dataStream"];
    stream = v5->_stream;
    v5->_stream = (ATCodableStream *)v7;

    uint64_t v9 = [(ATCodableStream *)v5->_stream inputStream];
    dataStream = v5->_dataStream;
    v5->_dataStream = (NSInputStream *)v9;

    id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameters"];
    if (v11)
    {
      id v17 = 0;
      uint64_t v12 = [MEMORY[0x263F08AC0] propertyListWithData:v11 options:0 format:0 error:&v17];
      id v13 = v17;
      parameters = v5->_parameters;
      v5->_parameters = (NSDictionary *)v12;

      if (!v5->_parameters)
      {
        id v16 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"unable to decode params data" userInfo:0];
        objc_exception_throw(v16);
      }
    }
  }

  return v5;
}

- (id)additionalDescription
{
  return &stru_26C70EB40;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(ATMessage *)self messageID];
  double v6 = [(ATMessage *)self additionalDescription];
  uint64_t v7 = [v3 stringWithFormat:@"<%@: %p id=%d %@>", v4, self, v5, v6];

  return v7;
}

- (void)setOptions:(unsigned int)a3
{
  uint64_t v5 = [(ATMessage *)self parameters];
  if (v5)
  {
    double v6 = [(ATMessage *)self parameters];
    id v8 = (id)[v6 mutableCopy];
  }
  else
  {
    id v8 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:1];
  }

  uint64_t v7 = [NSNumber numberWithUnsignedInteger:a3];
  [v8 setValue:v7 forKey:@"_Options"];
  [(ATMessage *)self setParameters:v8];
}

- (unsigned)options
{
  v2 = [(ATMessage *)self parameterForKey:@"_Options"];
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (id)parameterForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ATMessage *)self parameters];
  double v6 = [v5 objectForKey:v4];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end