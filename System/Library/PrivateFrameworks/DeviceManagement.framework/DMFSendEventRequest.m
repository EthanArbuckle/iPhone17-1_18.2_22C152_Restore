@interface DMFSendEventRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (id)permittedPlatforms;
- (DMFSendEventRequest)initWithCoder:(id)a3;
- (NSDictionary)details;
- (NSString)eventType;
- (NSString)inReplyTo;
- (NSString)organizationIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setDetails:(id)a3;
- (void)setEventType:(id)a3;
- (void)setInReplyTo:(id)a3;
- (void)setOrganizationIdentifier:(id)a3;
@end

@implementation DMFSendEventRequest

+ (id)permittedPlatforms
{
  return &unk_1F18ABB80;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFSendEventRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)DMFSendEventRequest;
  v5 = [(CATTaskRequest *)&v30 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"organizationIdentifier"];
    organizationIdentifier = v5->_organizationIdentifier;
    v5->_organizationIdentifier = (NSString *)v7;

    v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"inReplyTo"];
    inReplyTo = v5->_inReplyTo;
    v5->_inReplyTo = (NSString *)v10;

    v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"eventType"];
    eventType = v5->_eventType;
    v5->_eventType = (NSString *)v13;

    v29 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v28 = objc_opt_class();
    uint64_t v27 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    v23 = objc_msgSend(v29, "setWithObjects:", v28, v27, v15, v16, v17, v18, v19, v20, v21, v22, objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"details"];
    details = v5->_details;
    v5->_details = (NSDictionary *)v24;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DMFSendEventRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v9 encodeWithCoder:v4];
  v5 = [(DMFSendEventRequest *)self organizationIdentifier];
  [v4 encodeObject:v5 forKey:@"organizationIdentifier"];

  v6 = [(DMFSendEventRequest *)self inReplyTo];
  [v4 encodeObject:v6 forKey:@"inReplyTo"];

  uint64_t v7 = [(DMFSendEventRequest *)self eventType];
  [v4 encodeObject:v7 forKey:@"eventType"];

  v8 = [(DMFSendEventRequest *)self details];
  [v4 encodeObject:v8 forKey:@"details"];
}

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (void)setOrganizationIdentifier:(id)a3
{
}

- (NSString)inReplyTo
{
  return self->_inReplyTo;
}

- (void)setInReplyTo:(id)a3
{
}

- (NSString)eventType
{
  return self->_eventType;
}

- (void)setEventType:(id)a3
{
}

- (NSDictionary)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
  objc_storeStrong((id *)&self->_inReplyTo, 0);
  objc_storeStrong((id *)&self->_organizationIdentifier, 0);
}

@end