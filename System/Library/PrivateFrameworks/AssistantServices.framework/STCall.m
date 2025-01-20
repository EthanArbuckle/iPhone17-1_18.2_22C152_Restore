@interface STCall
+ (BOOL)supportsSecureCoding;
- (STCall)initWithCoder:(id)a3;
- (id)_aceContextObjectValue;
- (id)description;
- (id)initiatorAddress;
- (id)recipientAddress;
- (int64_t)service;
- (void)encodeWithCoder:(id)a3;
- (void)setInitiatorAddress:(id)a3;
- (void)setRecipientAddress:(id)a3;
- (void)setService:(int64_t)a3;
@end

@implementation STCall

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientAddress, 0);
  objc_storeStrong((id *)&self->_initiatorAddress, 0);
}

- (STCall)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STCall;
  v5 = [(STSiriModelObject *)&v11 initWithCoder:v4];
  if (v5)
  {
    v5->_service = [v4 decodeIntegerForKey:@"_service"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_initiatorAddress"];
    initiatorAddress = v5->_initiatorAddress;
    v5->_initiatorAddress = (STContactAddress *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_recipientAddress"];
    recipientAddress = v5->_recipientAddress;
    v5->_recipientAddress = (STContactAddress *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STCall;
  id v4 = a3;
  [(STSiriModelObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_service, @"_service", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_initiatorAddress forKey:@"_initiatorAddress"];
  [v4 encodeObject:self->_recipientAddress forKey:@"_recipientAddress"];
}

- (id)_aceContextObjectValue
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F968C8]);
  id v4 = [(STCall *)self initiatorAddress];
  if ([v4 type] == 2)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F96630]);
    uint64_t v6 = [v4 stringValue];
    [v5 setEmailAddress:v6];

    v11[0] = v5;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [v3 setEmails:v7];
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F968D8]);
    uint64_t v8 = [v4 stringValue];
    [v5 setNumber:v8];

    id v10 = v5;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
    [v3 setPhones:v7];
  }

  return v3;
}

- (id)description
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"<"];
  id v4 = [(id)objc_opt_class() description];
  [v3 appendString:v4];

  objc_msgSend(v3, "appendFormat:", @": %p", self);
  [v3 appendString:@"; service="];
  unint64_t service = self->_service;
  if (service > 3) {
    uint64_t v6 = @"FaceTime";
  }
  else {
    uint64_t v6 = off_1E59297D0[service];
  }
  [v3 appendString:v6];
  [v3 appendString:@"; initiatorAddress="];
  initiatorAddress = self->_initiatorAddress;
  if (initiatorAddress)
  {
    uint64_t v8 = [(STContactAddress *)initiatorAddress description];
    [v3 appendString:v8];
  }
  else
  {
    [v3 appendString:@"nil"];
  }
  [v3 appendString:@"; recipientAddress="];
  recipientAddress = self->_recipientAddress;
  if (recipientAddress)
  {
    id v10 = [(STContactAddress *)recipientAddress description];
    [v3 appendString:v10];
  }
  else
  {
    [v3 appendString:@"nil"];
  }
  [v3 appendString:@">"];
  return v3;
}

- (void)setRecipientAddress:(id)a3
{
}

- (id)recipientAddress
{
  return self->_recipientAddress;
}

- (void)setInitiatorAddress:(id)a3
{
}

- (id)initiatorAddress
{
  return self->_initiatorAddress;
}

- (void)setService:(int64_t)a3
{
  self->_unint64_t service = a3;
}

- (int64_t)service
{
  return self->_service;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end