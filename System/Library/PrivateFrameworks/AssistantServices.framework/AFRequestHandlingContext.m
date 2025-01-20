@interface AFRequestHandlingContext
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFRequestHandlingContext)init;
- (AFRequestHandlingContext)initWithBuilder:(id)a3;
- (AFRequestHandlingContext)initWithCoder:(id)a3;
- (AFRequestHandlingContext)initWithDictionaryRepresentation:(id)a3;
- (AFRequestHandlingContext)initWithRequestID:(id)a3 inputDeviceID:(id)a4 inputAssistantID:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)inputAssistantID;
- (NSString)inputDeviceID;
- (NSString)requestID;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFRequestHandlingContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputAssistantID, 0);
  objc_storeStrong((id *)&self->_inputDeviceID, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
}

- (NSString)inputAssistantID
{
  return self->_inputAssistantID;
}

- (NSString)inputDeviceID
{
  return self->_inputDeviceID;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (id)buildDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  requestID = self->_requestID;
  if (requestID) {
    [v3 setObject:requestID forKey:@"requestID"];
  }
  inputDeviceID = self->_inputDeviceID;
  if (inputDeviceID) {
    [v4 setObject:inputDeviceID forKey:@"inputDeviceID"];
  }
  inputAssistantID = self->_inputAssistantID;
  if (inputAssistantID) {
    [v4 setObject:inputAssistantID forKey:@"inputAssistantID"];
  }
  v8 = (void *)[v4 copy];

  return v8;
}

- (AFRequestHandlingContext)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKey:@"requestID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    v9 = [v5 objectForKey:@"inputDeviceID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    v11 = [v5 objectForKey:@"inputAssistantID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    self = [(AFRequestHandlingContext *)self initWithRequestID:v7 inputDeviceID:v10 inputAssistantID:v12];
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  requestID = self->_requestID;
  id v5 = a3;
  [v5 encodeObject:requestID forKey:@"AFRequestHandlingContext::requestID"];
  [v5 encodeObject:self->_inputDeviceID forKey:@"AFRequestHandlingContext::inputDeviceID"];
  [v5 encodeObject:self->_inputAssistantID forKey:@"AFRequestHandlingContext::inputAssistantID"];
}

- (AFRequestHandlingContext)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFRequestHandlingContext::requestID"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFRequestHandlingContext::inputDeviceID"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFRequestHandlingContext::inputAssistantID"];

  v8 = [(AFRequestHandlingContext *)self initWithRequestID:v5 inputDeviceID:v6 inputAssistantID:v7];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFRequestHandlingContext *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(AFRequestHandlingContext *)v5 requestID];
      requestID = self->_requestID;
      if (requestID == v6 || [(NSString *)requestID isEqual:v6])
      {
        v8 = [(AFRequestHandlingContext *)v5 inputDeviceID];
        inputDeviceID = self->_inputDeviceID;
        if (inputDeviceID == v8 || [(NSString *)inputDeviceID isEqual:v8])
        {
          id v10 = [(AFRequestHandlingContext *)v5 inputAssistantID];
          inputAssistantID = self->_inputAssistantID;
          BOOL v12 = inputAssistantID == v10 || [(NSString *)inputAssistantID isEqual:v10];
        }
        else
        {
          BOOL v12 = 0;
        }
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_requestID hash];
  NSUInteger v4 = [(NSString *)self->_inputDeviceID hash] ^ v3;
  return v4 ^ [(NSString *)self->_inputAssistantID hash];
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)AFRequestHandlingContext;
  id v5 = [(AFRequestHandlingContext *)&v8 description];
  v6 = (void *)[v4 initWithFormat:@"%@ {requestID = %@, inputDeviceID = %@, inputAssistantID = %@}", v5, self->_requestID, self->_inputDeviceID, self->_inputAssistantID];

  return v6;
}

- (NSString)description
{
  return (NSString *)[(AFRequestHandlingContext *)self _descriptionWithIndent:0];
}

- (AFRequestHandlingContext)initWithRequestID:(id)a3 inputDeviceID:(id)a4 inputAssistantID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __77__AFRequestHandlingContext_initWithRequestID_inputDeviceID_inputAssistantID___block_invoke;
  v16[3] = &unk_1E59280C0;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  v14 = [(AFRequestHandlingContext *)self initWithBuilder:v16];

  return v14;
}

void __77__AFRequestHandlingContext_initWithRequestID_inputDeviceID_inputAssistantID___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setRequestID:v3];
  [v4 setInputDeviceID:a1[5]];
  [v4 setInputAssistantID:a1[6]];
}

- (AFRequestHandlingContext)init
{
  return [(AFRequestHandlingContext *)self initWithBuilder:0];
}

- (AFRequestHandlingContext)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFRequestHandlingContextMutation *))a3;
  v18.receiver = self;
  v18.super_class = (Class)AFRequestHandlingContext;
  id v5 = [(AFRequestHandlingContext *)&v18 init];
  v6 = v5;
  if (v4 && v5)
  {
    id v7 = [[_AFRequestHandlingContextMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFRequestHandlingContextMutation *)v7 isDirty])
    {
      id v8 = [(_AFRequestHandlingContextMutation *)v7 getRequestID];
      uint64_t v9 = [v8 copy];
      requestID = v6->_requestID;
      v6->_requestID = (NSString *)v9;

      id v11 = [(_AFRequestHandlingContextMutation *)v7 getInputDeviceID];
      uint64_t v12 = [v11 copy];
      inputDeviceID = v6->_inputDeviceID;
      v6->_inputDeviceID = (NSString *)v12;

      v14 = [(_AFRequestHandlingContextMutation *)v7 getInputAssistantID];
      uint64_t v15 = [v14 copy];
      inputAssistantID = v6->_inputAssistantID;
      v6->_inputAssistantID = (NSString *)v15;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFRequestHandlingContextMutation *))a3;
  if (v4)
  {
    id v5 = [[_AFRequestHandlingContextMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFRequestHandlingContextMutation *)v5 isDirty])
    {
      v6 = objc_alloc_init(AFRequestHandlingContext);
      id v7 = [(_AFRequestHandlingContextMutation *)v5 getRequestID];
      uint64_t v8 = [v7 copy];
      requestID = v6->_requestID;
      v6->_requestID = (NSString *)v8;

      id v10 = [(_AFRequestHandlingContextMutation *)v5 getInputDeviceID];
      uint64_t v11 = [v10 copy];
      inputDeviceID = v6->_inputDeviceID;
      v6->_inputDeviceID = (NSString *)v11;

      id v13 = [(_AFRequestHandlingContextMutation *)v5 getInputAssistantID];
      uint64_t v14 = [v13 copy];
      inputAssistantID = v6->_inputAssistantID;
      v6->_inputAssistantID = (NSString *)v14;
    }
    else
    {
      v6 = (AFRequestHandlingContext *)[(AFRequestHandlingContext *)self copy];
    }
  }
  else
  {
    v6 = (AFRequestHandlingContext *)[(AFRequestHandlingContext *)self copy];
  }

  return v6;
}

@end