@interface CDMEmbeddingGraphRequestCommand
+ (BOOL)supportsSecureCoding;
+ (id)serviceGraphName;
- (CDMEmbeddingGraphRequestCommand)initWithCoder:(id)a3;
- (CDMEmbeddingGraphRequestCommand)initWithText:(id)a3;
- (CDMEmbeddingGraphRequestCommand)initWithText:(id)a3 requestId:(id)a4;
- (NSString)text;
- (SIRINLUEXTERNALRequestID)requestId;
- (id)loggingRequestID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CDMEmbeddingGraphRequestCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (SIRINLUEXTERNALRequestID)requestId
{
  return self->_requestId;
}

- (NSString)text
{
  return self->_text;
}

- (id)loggingRequestID
{
  return self->_requestId;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CDMEmbeddingGraphRequestCommand;
  id v4 = a3;
  [(CDMServiceGraphCommand *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_text, @"text", v6.receiver, v6.super_class);
  v5 = [(SIRINLUEXTERNALRequestID *)self->_requestId data];
  [v4 encodeObject:v5 forKey:@"requestId"];
}

- (CDMEmbeddingGraphRequestCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CDMEmbeddingGraphRequestCommand;
  v5 = [(CDMServiceGraphCommand *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
    text = v5->_text;
    v5->_text = (NSString *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestId"];
    uint64_t v9 = [objc_alloc(MEMORY[0x263F71D18]) initWithData:v8];
    requestId = v5->_requestId;
    v5->_requestId = (SIRINLUEXTERNALRequestID *)v9;
  }
  return v5;
}

- (CDMEmbeddingGraphRequestCommand)initWithText:(id)a3 requestId:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CDMEmbeddingGraphRequestCommand;
  uint64_t v9 = [(CDMBaseCommand *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_text, a3);
    if (!v8)
    {
      id v8 = objc_alloc_init(MEMORY[0x263F71D18]);
      v11 = NSString;
      objc_super v12 = [MEMORY[0x263F08C38] UUID];
      v13 = [v12 UUIDString];
      v14 = [v11 stringWithFormat:@"%@:0", v13];
      [v8 setIdA:v14];

      v15 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v17 = [v8 idA];
        *(_DWORD *)buf = 136315394;
        v20 = "-[CDMEmbeddingGraphRequestCommand initWithText:requestId:]";
        __int16 v21 = 2112;
        v22 = v17;
        _os_log_debug_impl(&dword_2263A0000, v15, OS_LOG_TYPE_DEBUG, "%s Request ID not set, generated request id with UUID: %@", buf, 0x16u);
      }
    }
    objc_storeStrong((id *)&v10->_requestId, v8);
  }

  return v10;
}

- (CDMEmbeddingGraphRequestCommand)initWithText:(id)a3
{
  return [(CDMEmbeddingGraphRequestCommand *)self initWithText:a3 requestId:0];
}

+ (id)serviceGraphName
{
  return @"CDMEmbeddingServiceGraph";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end