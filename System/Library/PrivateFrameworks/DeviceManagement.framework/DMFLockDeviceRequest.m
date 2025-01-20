@interface DMFLockDeviceRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (id)permittedPlatforms;
- (DMFLockDeviceRequest)initWithCoder:(id)a3;
- (NSString)message;
- (NSString)phoneNumber;
- (NSString)pin;
- (void)encodeWithCoder:(id)a3;
- (void)setMessage:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setPin:(id)a3;
@end

@implementation DMFLockDeviceRequest

+ (id)permittedPlatforms
{
  return &unk_1F18AB988;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFLockDeviceRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DMFLockDeviceRequest;
  v5 = [(CATTaskRequest *)&v16 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"message"];
    message = v5->_message;
    v5->_message = (NSString *)v7;

    v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"phoneNumber"];
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v10;

    v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"pin"];
    pin = v5->_pin;
    v5->_pin = (NSString *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)DMFLockDeviceRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v8 encodeWithCoder:v4];
  v5 = [(DMFLockDeviceRequest *)self message];
  [v4 encodeObject:v5 forKey:@"message"];

  v6 = [(DMFLockDeviceRequest *)self phoneNumber];
  [v4 encodeObject:v6 forKey:@"phoneNumber"];

  uint64_t v7 = [(DMFLockDeviceRequest *)self pin];
  [v4 encodeObject:v7 forKey:@"pin"];
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSString)pin
{
  return self->_pin;
}

- (void)setPin:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pin, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end