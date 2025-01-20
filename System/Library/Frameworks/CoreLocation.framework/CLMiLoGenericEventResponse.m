@interface CLMiLoGenericEventResponse
+ (BOOL)supportsSecureCoding;
- (CLMiLoGenericEventResponse)initWithCoder:(id)a3;
- (CLMiLoGenericEventResponse)initWithEventType:(unint64_t)a3 withDescription:(id)a4 withError:(id)a5;
- (NSError)error;
- (NSString)genericEventDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)eventType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLMiLoGenericEventResponse

- (CLMiLoGenericEventResponse)initWithEventType:(unint64_t)a3 withDescription:(id)a4 withError:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)CLMiLoGenericEventResponse;
  v8 = [(CLMiLoGenericEventResponse *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_eventType = a3;
    v8->_genericEventDescription = (NSString *)a4;
    v9->_error = (NSError *)a5;
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLMiLoGenericEventResponse;
  [(CLMiLoGenericEventResponse *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = [(id)objc_opt_class() allocWithZone:a3];

  return (id)MEMORY[0x1F4181798](v3, sel_initWithEventType_withDescription_withError_);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoGenericEventResponse)initWithCoder:(id)a3
{
  [a3 decodeIntegerForKey:@"kCLMiLoConnectionCodingKeyGenericEventType"];
  [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyGenericEventDescription"];
  [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyGenericEventError"];

  return (CLMiLoGenericEventResponse *)MEMORY[0x1F4181798](self, sel_initWithEventType_withDescription_withError_);
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInteger:self->_eventType forKey:@"kCLMiLoConnectionCodingKeyGenericEventType"];
  [a3 encodeObject:self->_genericEventDescription forKey:@"kCLMiLoConnectionCodingKeyGenericEventDescription"];
  error = self->_error;

  [a3 encodeObject:error forKey:@"kCLMiLoConnectionCodingKeyGenericEventError"];
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (NSString)genericEventDescription
{
  return self->_genericEventDescription;
}

- (NSError)error
{
  return self->_error;
}

@end