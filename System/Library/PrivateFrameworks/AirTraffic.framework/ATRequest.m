@interface ATRequest
+ (BOOL)supportsSecureCoding;
- (ATRequest)initWithCoder:(id)a3;
- (ATRequest)initWithCommand:(id)a3 dataClass:(id)a4 parameters:(id)a5;
- (NSString)command;
- (NSString)dataClass;
- (id)additionalDescription;
- (id)partialResponseWithParameters:(id)a3;
- (id)responseWithError:(id)a3 parameters:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setCommand:(id)a3;
- (void)setDataClass:(id)a3;
@end

@implementation ATRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataClass, 0);
  objc_storeStrong((id *)&self->_command, 0);
}

- (void)setDataClass:(id)a3
{
}

- (NSString)dataClass
{
  return self->_dataClass;
}

- (void)setCommand:(id)a3
{
}

- (NSString)command
{
  return self->_command;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ATRequest;
  id v4 = a3;
  [(ATMessage *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_command, @"command", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_dataClass forKey:@"dataClass"];
}

- (ATRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATRequest;
  objc_super v5 = [(ATMessage *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"command"];
    command = v5->_command;
    v5->_command = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dataClass"];
    dataClass = v5->_dataClass;
    v5->_dataClass = (NSString *)v8;
  }
  return v5;
}

- (id)additionalDescription
{
  v3 = NSString;
  id v4 = [(ATRequest *)self command];
  objc_super v5 = [(ATRequest *)self dataClass];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)partialResponseWithParameters:(id)a3
{
  id v4 = a3;
  objc_super v5 = objc_alloc_init(ATResponse);
  [(ATMessage *)v5 setMessageID:[(ATMessage *)self messageID]];
  [(ATMessage *)v5 setSessionID:[(ATMessage *)self sessionID]];
  [(ATResponse *)v5 setPartial:1];
  [(ATMessage *)v5 setParameters:v4];

  return v5;
}

- (id)responseWithError:(id)a3 parameters:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_alloc_init(ATResponse);
  [(ATMessage *)v8 setMessageID:[(ATMessage *)self messageID]];
  [(ATMessage *)v8 setSessionID:[(ATMessage *)self sessionID]];
  [(ATResponse *)v8 setError:v7];

  [(ATMessage *)v8 setParameters:v6];
  return v8;
}

- (ATRequest)initWithCommand:(id)a3 dataClass:(id)a4 parameters:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ATRequest;
  objc_super v11 = [(ATRequest *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(ATRequest *)v11 setCommand:v8];
    [(ATRequest *)v12 setDataClass:v9];
    [(ATMessage *)v12 setParameters:v10];
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end