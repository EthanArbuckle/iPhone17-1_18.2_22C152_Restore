@interface NSFileProvidingResponse
+ (BOOL)supportsSecureCoding;
+ (id)responseWithError:(id)a3;
- (NSError)error;
- (NSFileProvidingResponse)initWithCoder:(id)a3;
- (NSString)sandboxToken;
- (unint64_t)providedItemRecursiveGenerationCount;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setError:(id)a3;
- (void)setProvidedItemRecursiveGenerationCount:(unint64_t)a3;
- (void)setSandboxToken:(id)a3;
@end

@implementation NSFileProvidingResponse

+ (id)responseWithError:(id)a3
{
  v4 = objc_alloc_init(NSFileProvidingResponse);
  v4->error = (NSError *)a3;

  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSFileProvidingResponse;
  [(NSFileProvidingResponse *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"NSFileProvidingResponse instances should only ever be encoded by XPC" userInfo:0]);
  }
  objc_msgSend(a3, "encodeObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->providedItemRecursiveGenerationCount), @"gencount");
  [a3 encodeObject:self->error forKey:@"error"];
  sandboxToken = self->sandboxToken;

  [a3 encodeObject:sandboxToken forKey:@"sandboxtoken"];
}

- (NSFileProvidingResponse)initWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"NSFileProvidingResponse should only ever be decoded by XPC" userInfo:0]);
  }
  self->providedItemRecursiveGenerationCount = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"gencount"), "unsignedIntegerValue");
  self->error = (NSError *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
  self->sandboxToken = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"sandboxtoken"];
  return self;
}

- (unint64_t)providedItemRecursiveGenerationCount
{
  return self->providedItemRecursiveGenerationCount;
}

- (void)setProvidedItemRecursiveGenerationCount:(unint64_t)a3
{
  self->providedItemRecursiveGenerationCount = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void)setError:(id)a3
{
}

- (NSString)sandboxToken
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSandboxToken:(id)a3
{
}

@end