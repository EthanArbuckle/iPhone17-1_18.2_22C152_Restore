@interface CPLResetFeedbackMessage
+ (id)feedbackType;
- (CPLResetFeedbackMessage)initWithResetType:(id)a3 reason:(id)a4 uuid:(id)a5 libraryIdentifier:(id)a6;
- (NSString)reason;
- (NSString)resetType;
- (NSString)uuid;
- (id)serverMessage;
@end

@implementation CPLResetFeedbackMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_resetType, 0);
}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSString)resetType
{
  return self->_resetType;
}

- (id)serverMessage
{
  v9.receiver = self;
  v9.super_class = (Class)CPLResetFeedbackMessage;
  v3 = [(CPLFeedbackMessage *)&v9 serverMessage];
  v4 = objc_alloc_init(CPLServerFeedbackKeyAndValue);
  [(CPLServerFeedbackKeyAndValue *)v4 setKey:@"resetType"];
  [(CPLServerFeedbackKeyAndValue *)v4 setValue:self->_resetType];
  [v3 addKeysAndValues:v4];
  v5 = objc_alloc_init(CPLServerFeedbackKeyAndValue);

  [(CPLServerFeedbackKeyAndValue *)v5 setKey:@"reason"];
  [(CPLServerFeedbackKeyAndValue *)v5 setValue:self->_reason];
  [v3 addKeysAndValues:v5];
  v6 = objc_alloc_init(CPLServerFeedbackKeyAndValue);

  [(CPLServerFeedbackKeyAndValue *)v6 setKey:@"resetUUID"];
  if (self->_uuid) {
    uuid = (__CFString *)self->_uuid;
  }
  else {
    uuid = @"none";
  }
  [(CPLServerFeedbackKeyAndValue *)v6 setValue:uuid];
  [v3 addKeysAndValues:v6];

  return v3;
}

- (CPLResetFeedbackMessage)initWithResetType:(id)a3 reason:(id)a4 uuid:(id)a5 libraryIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CPLResetFeedbackMessage;
  v13 = [(CPLFeedbackMessage *)&v21 initWithLibraryIdentifier:a6];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    resetType = v13->_resetType;
    v13->_resetType = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    reason = v13->_reason;
    v13->_reason = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    uuid = v13->_uuid;
    v13->_uuid = (NSString *)v18;
  }
  return v13;
}

+ (id)feedbackType
{
  return @"reset";
}

@end