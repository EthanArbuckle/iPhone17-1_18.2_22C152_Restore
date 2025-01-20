@interface _SFAnalyzerClientInfo
+ (BOOL)supportsSecureCoding;
- (NSString)applicationName;
- (NSString)clientID;
- (NSString)dictationUIInteractionID;
- (NSString)inputOrigin;
- (NSString)source;
- (NSUUID)asrID;
- (NSUUID)requestID;
- (_SFAnalyzerClientInfo)initWithCoder:(id)a3;
- (_SFAnalyzerClientInfo)initWithID:(id)a3 source:(id)a4 applicationName:(id)a5 inputOrigin:(id)a6 asrID:(id)a7 requestID:(id)a8 dictationUIInteractionID:(id)a9;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _SFAnalyzerClientInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictationUIInteractionID, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_asrID, 0);
  objc_storeStrong((id *)&self->_inputOrigin, 0);
  objc_storeStrong((id *)&self->_applicationName, 0);
  objc_storeStrong((id *)&self->_source, 0);

  objc_storeStrong((id *)&self->_clientID, 0);
}

- (NSString)dictationUIInteractionID
{
  return self->_dictationUIInteractionID;
}

- (NSUUID)requestID
{
  return self->_requestID;
}

- (NSUUID)asrID
{
  return self->_asrID;
}

- (NSString)inputOrigin
{
  return self->_inputOrigin;
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (NSString)source
{
  return self->_source;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (_SFAnalyzerClientInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_SFAnalyzerClientInfo;
  v5 = [(_SFAnalyzerClientInfo *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_clientID"];
    clientID = v5->_clientID;
    v5->_clientID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_applicationName"];
    applicationName = v5->_applicationName;
    v5->_applicationName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_source"];
    source = v5->_source;
    v5->_source = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_inputOrigin"];
    inputOrigin = v5->_inputOrigin;
    v5->_inputOrigin = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_asrID"];
    asrID = v5->_asrID;
    v5->_asrID = (NSUUID *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_requestID"];
    requestID = v5->_requestID;
    v5->_requestID = (NSUUID *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_dictationUIInteractionID"];
    dictationUIInteractionID = v5->_dictationUIInteractionID;
    v5->_dictationUIInteractionID = (NSString *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  clientID = self->_clientID;
  id v5 = a3;
  [v5 encodeObject:clientID forKey:@"_clientID"];
  [v5 encodeObject:self->_applicationName forKey:@"_applicationName"];
  [v5 encodeObject:self->_source forKey:@"_source"];
  [v5 encodeObject:self->_inputOrigin forKey:@"_inputOrigin"];
  [v5 encodeObject:self->_asrID forKey:@"_asrID"];
  [v5 encodeObject:self->_requestID forKey:@"_requestID"];
  [v5 encodeObject:self->_dictationUIInteractionID forKey:@"_dictationUIInteractionID"];
}

- (_SFAnalyzerClientInfo)initWithID:(id)a3 source:(id)a4 applicationName:(id)a5 inputOrigin:(id)a6 asrID:(id)a7 requestID:(id)a8 dictationUIInteractionID:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v38.receiver = self;
  v38.super_class = (Class)_SFAnalyzerClientInfo;
  v22 = [(_SFAnalyzerClientInfo *)&v38 init];
  if (v22)
  {
    uint64_t v23 = [v15 copy];
    clientID = v22->_clientID;
    v22->_clientID = (NSString *)v23;

    uint64_t v25 = [v17 copy];
    applicationName = v22->_applicationName;
    v22->_applicationName = (NSString *)v25;

    uint64_t v27 = [v16 copy];
    source = v22->_source;
    v22->_source = (NSString *)v27;

    uint64_t v29 = [v18 copy];
    inputOrigin = v22->_inputOrigin;
    v22->_inputOrigin = (NSString *)v29;

    uint64_t v31 = [v19 copy];
    asrID = v22->_asrID;
    v22->_asrID = (NSUUID *)v31;

    uint64_t v33 = [v20 copy];
    requestID = v22->_requestID;
    v22->_requestID = (NSUUID *)v33;

    uint64_t v35 = [v21 copy];
    dictationUIInteractionID = v22->_dictationUIInteractionID;
    v22->_dictationUIInteractionID = (NSString *)v35;
  }
  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end