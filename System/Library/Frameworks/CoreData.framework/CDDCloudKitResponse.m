@interface CDDCloudKitResponse
+ (BOOL)supportsSecureCoding;
- (CDDCloudKitResponse)initWithCoder:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)initWithMessage:(char)a3 success:(void *)a4 error:;
@end

@implementation CDDCloudKitResponse

- (void)initWithMessage:(char)a3 success:(void *)a4 error:
{
  if (!a1) {
    return 0;
  }
  v9.receiver = a1;
  v9.super_class = (Class)CDDCloudKitResponse;
  v7 = objc_msgSendSuper2(&v9, sel_init);
  if (v7)
  {
    v7[2] = a2;
    *((unsigned char *)v7 + 8) = a3;
    v7[3] = a4;
  }
  return v7;
}

- (void)dealloc
{
  self->_error = 0;
  v3.receiver = self;
  v3.super_class = (Class)CDDCloudKitResponse;
  [(CDDCloudKitResponse *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CDDCloudKitResponse)initWithCoder:(id)a3
{
  v5 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"message"];
  char v6 = [a3 decodeBoolForKey:@"success"];
  self;
  if (qword_1EB270728 != -1) {
    dispatch_once(&qword_1EB270728, &__block_literal_global_16);
  }
  v7 = (void *)[a3 decodeObjectOfClasses:_MergedGlobals_79 forKey:@"error"];

  return (CDDCloudKitResponse *)-[CDDCloudKitResponse initWithMessage:success:error:](self, v5, v6, v7);
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_message forKey:@"message"];
  [a3 encodeBool:self->_success forKey:@"success"];
  error = self->_error;

  [a3 encodeObject:error forKey:@"error"];
}

uint64_t __44__CDDCloudKitResponse_supportedErrorClasses__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t result = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, v5, objc_opt_class(), 0);
  _MergedGlobals_79 = result;
  return result;
}

@end