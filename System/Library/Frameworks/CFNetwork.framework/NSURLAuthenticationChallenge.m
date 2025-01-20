@interface NSURLAuthenticationChallenge
+ (BOOL)supportsSecureCoding;
+ (id)_authenticationChallengeForCFAuthChallenge:(_CFURLAuthChallenge *)a3 sender:(id)a4;
+ (id)_createAuthenticationChallengeForCFAuthChallenge:(_CFURLAuthChallenge *)a3 sender:(id)a4;
- (NSError)error;
- (NSInteger)previousFailureCount;
- (NSURLAuthenticationChallenge)init;
- (NSURLAuthenticationChallenge)initWithAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge sender:(id)sender;
- (NSURLAuthenticationChallenge)initWithCoder:(id)a3;
- (NSURLAuthenticationChallenge)initWithProtectionSpace:(NSURLProtectionSpace *)space proposedCredential:(NSURLCredential *)credential previousFailureCount:(NSInteger)previousFailureCount failureResponse:(NSURLResponse *)response error:(NSError *)error sender:(id)sender;
- (NSURLCredential)proposedCredential;
- (NSURLProtectionSpace)protectionSpace;
- (NSURLResponse)failureResponse;
- (_CFURLAuthChallenge)_createCFAuthChallenge;
- (id)_initWithListOfProtectionSpaces:(id)a3 CurrentProtectionSpace:(id)a4 proposedCredential:(id)a5 previousFailureCount:(int64_t)a6 failureResponse:(id)a7 error:(id)a8 sender:(id)a9;
- (id)sender;
- (uint64_t)_initWithCFAuthChallenge:(uint64_t)a3 sender:;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setSender:(id)a3;
@end

@implementation NSURLAuthenticationChallenge

- (_CFURLAuthChallenge)_createCFAuthChallenge
{
  internal = self->_internal;
  space = internal->space;
  if (space)
  {
    v5 = [(NSURLProtectionSpace *)space _cfurlprtotectionspace];
    internal = self->_internal;
  }
  else
  {
    v5 = 0;
  }
  proposedCredential = internal->proposedCredential;
  if (proposedCredential)
  {
    v7 = [(NSURLCredential *)proposedCredential _cfurlcredential];
    internal = self->_internal;
  }
  else
  {
    v7 = 0;
  }
  failureResponse = internal->failureResponse;
  if (failureResponse)
  {
    v9 = [(NSURLResponse *)failureResponse _CFURLResponse];
    internal = self->_internal;
  }
  else
  {
    v9 = 0;
  }
  uint64_t v10 = CFURLAuthChallengeCreate(0, v5, v7, internal->previousFailureCount, v9, internal->error);
  protectionSpacesForChallenge = self->_internal->protectionSpacesForChallenge;
  if (v10) {
    BOOL v12 = protectionSpacesForChallenge == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12)
  {
    if (URLAuthChallenge::Class(void)::sOnce_URLAuthChallenge != -1) {
      dispatch_once(&URLAuthChallenge::Class(void)::sOnce_URLAuthChallenge, &__block_literal_global_10199);
    }
    URLAuthChallenge::setListOfProtectionSpaces((URLAuthChallenge *)(v10 + 16), protectionSpacesForChallenge);
  }
  if (URLAuthChallenge::Class(void)::sOnce_URLAuthChallenge != -1) {
    dispatch_once(&URLAuthChallenge::Class(void)::sOnce_URLAuthChallenge, &__block_literal_global_10199);
  }
  uint64_t v13 = v10 + 16;
  if (!v10) {
    uint64_t v13 = 0;
  }
  *(void *)(v13 + 72) = self->_internal->preferredProtSpaceIndex;
  return (_CFURLAuthChallenge *)v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSURLAuthenticationChallenge;
  [(NSURLAuthenticationChallenge *)&v3 dealloc];
}

+ (id)_authenticationChallengeForCFAuthChallenge:(_CFURLAuthChallenge *)a3 sender:(id)a4
{
  v4 = (void *)-[NSURLAuthenticationChallenge _initWithCFAuthChallenge:sender:]([NSURLAuthenticationChallenge alloc], (uint64_t)a3, (uint64_t)a4);

  return v4;
}

- (uint64_t)_initWithCFAuthChallenge:(uint64_t)a3 sender:
{
  if (!a1) {
    return 0;
  }
  if (URLAuthChallenge::Class(void)::sOnce_URLAuthChallenge != -1) {
    dispatch_once(&URLAuthChallenge::Class(void)::sOnce_URLAuthChallenge, &__block_literal_global_10199);
  }
  if (a2) {
    v6 = (void *)(a2 + 16);
  }
  else {
    v6 = 0;
  }
  id v7 = (id)v6[3];
  if (v7)
  {
    id v7 = [[NSURLProtectionSpace alloc] _initWithCFURLProtectionSpace:v7];
    if (URLAuthChallenge::Class(void)::sOnce_URLAuthChallenge != -1) {
      dispatch_once(&URLAuthChallenge::Class(void)::sOnce_URLAuthChallenge, &__block_literal_global_10199);
    }
  }
  id v8 = (id)v6[4];
  if (v8)
  {
    id v8 = [[NSURLCredential alloc] _initWithCFURLCredential:v8];
    if (URLAuthChallenge::Class(void)::sOnce_URLAuthChallenge != -1) {
      dispatch_once(&URLAuthChallenge::Class(void)::sOnce_URLAuthChallenge, &__block_literal_global_10199);
    }
  }
  if (v6[6])
  {
    id v9 = +[NSURLResponse _responseWithCFURLResponse:](NSURLResponse, "_responseWithCFURLResponse:");
    if (URLAuthChallenge::Class(void)::sOnce_URLAuthChallenge != -1) {
      dispatch_once(&URLAuthChallenge::Class(void)::sOnce_URLAuthChallenge, &__block_literal_global_10199);
    }
  }
  else
  {
    id v9 = 0;
  }
  uint64_t v10 = [a1 _initWithListOfProtectionSpaces:v6[8] CurrentProtectionSpace:v7 proposedCredential:v8 previousFailureCount:v6[5] failureResponse:v9 error:v6[7] sender:a3];
  if (URLAuthChallenge::Class(void)::sOnce_URLAuthChallenge != -1) {
    dispatch_once(&URLAuthChallenge::Class(void)::sOnce_URLAuthChallenge, &__block_literal_global_10199);
  }
  *(void *)(*(void *)(v10 + 8) + 64) = v6[9];
  return v10;
}

- (id)_initWithListOfProtectionSpaces:(id)a3 CurrentProtectionSpace:(id)a4 proposedCredential:(id)a5 previousFailureCount:(int64_t)a6 failureResponse:(id)a7 error:(id)a8 sender:(id)a9
{
  uint64_t v10 = [(NSURLAuthenticationChallenge *)self initWithProtectionSpace:a4 proposedCredential:a5 previousFailureCount:a6 failureResponse:a7 error:a8 sender:a9];
  if (a3) {
    v10->_internal->protectionSpacesForChallenge = (NSArray *)[a3 copy];
  }
  return v10;
}

- (NSURLAuthenticationChallenge)initWithProtectionSpace:(NSURLProtectionSpace *)space proposedCredential:(NSURLCredential *)credential previousFailureCount:(NSInteger)previousFailureCount failureResponse:(NSURLResponse *)response error:(NSError *)error sender:(id)sender
{
  v16.receiver = self;
  v16.super_class = (Class)NSURLAuthenticationChallenge;
  v14 = [(NSURLAuthenticationChallenge *)&v16 init];
  if (v14) {
    v14->_internal = (NSURLAuthenticationChallengeInternal *)-[NSURLAuthenticationChallengeInternal initWithProtectionSpace:proposedCredential:previousFailureCount:failureResponse:error:sender:]([NSURLAuthenticationChallengeInternal alloc], space, credential, previousFailureCount, response, error, sender);
  }
  return v14;
}

- (NSURLProtectionSpace)protectionSpace
{
  v2 = self->_internal->space;

  return v2;
}

- (NSInteger)previousFailureCount
{
  return self->_internal->previousFailureCount;
}

- (NSURLAuthenticationChallenge)initWithCoder:(id)a3
{
  if ([a3 requiresSecureCoding] && objc_msgSend(a3, "allowsKeyedCoding"))
  {
    v19 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = (const void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v19, "setWithObjects:", v18, v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0), @"__nsurlauthenticationchallenge_proto_plist");
  }
  else
  {
    uint64_t v13 = (const void *)[a3 decodeObject];
  }
  if (!v13) {
    return 0;
  }
  uint64_t v14 = _CFURLAuthChallengeCreateFromArchive((const __CFAllocator *)*MEMORY[0x1E4F1CF80], v13);
  if (!v14) {
    return 0;
  }
  v15 = (const void *)v14;
  objc_super v16 = (NSURLAuthenticationChallenge *)-[NSURLAuthenticationChallenge _initWithCFAuthChallenge:sender:](self, v14, 0);
  CFRelease(v15);
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = [(NSURLAuthenticationChallenge *)self _createCFAuthChallenge];
  if (!v4) {
    return;
  }
  uint64_t v5 = v4;
  CFTypeRef cf = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (URLAuthChallenge::Class(void)::sOnce_URLAuthChallenge != -1) {
    dispatch_once(&URLAuthChallenge::Class(void)::sOnce_URLAuthChallenge, &__block_literal_global_10199);
  }
  if (!(*(unsigned int (**)(void *, CFTypeRef *))(*((void *)v5 + 2) + 64))((void *)v5 + 2, &cf))
  {
    CFTypeRef v6 = 0;
    goto LABEL_9;
  }
  if (cf)
  {
    CFTypeRef v6 = CFRetain(cf);
LABEL_9:
    if (cf) {
      CFRelease(cf);
    }
    if (v6)
    {
      if (objc_msgSend(a3, "requiresSecureCoding", &unk_1ECFA59E8)
        && [a3 allowsKeyedCoding])
      {
        [a3 encodeObject:v6 forKey:@"__nsurlauthenticationchallenge_proto_plist"];
      }
      else
      {
        [a3 encodeObject:v6];
      }
      CFRelease(v6);
    }
  }

  CFRelease(v5);
}

- (id)sender
{
  v2 = self->_internal->sender;

  return v2;
}

- (NSURLResponse)failureResponse
{
  v2 = self->_internal->failureResponse;

  return v2;
}

- (NSError)error
{
  v2 = self->_internal->error;

  return v2;
}

- (NSURLCredential)proposedCredential
{
  v2 = self->_internal->proposedCredential;

  return v2;
}

- (NSURLAuthenticationChallenge)initWithAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge sender:(id)sender
{
  v8.receiver = self;
  v8.super_class = (Class)NSURLAuthenticationChallenge;
  CFTypeRef v6 = [(NSURLAuthenticationChallenge *)&v8 init];
  if (v6) {
    v6->_internal = (NSURLAuthenticationChallengeInternal *)-[NSURLAuthenticationChallengeInternal initWithProtectionSpace:proposedCredential:previousFailureCount:failureResponse:error:sender:]([NSURLAuthenticationChallengeInternal alloc], [(NSURLAuthenticationChallenge *)challenge protectionSpace], [(NSURLAuthenticationChallenge *)challenge proposedCredential], [(NSURLAuthenticationChallenge *)challenge previousFailureCount], [(NSURLAuthenticationChallenge *)challenge failureResponse], [(NSURLAuthenticationChallenge *)challenge error], sender);
  }
  return v6;
}

- (NSURLAuthenticationChallenge)init
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setSender:(id)a3
{
  sender = self->_internal->sender;
  if (sender != a3)
  {

    self->_internal->sender = (NSURLAuthenticationChallengeSender *)a3;
  }
}

+ (id)_createAuthenticationChallengeForCFAuthChallenge:(_CFURLAuthChallenge *)a3 sender:(id)a4
{
  CFTypeRef v6 = [NSURLAuthenticationChallenge alloc];

  return (id)-[NSURLAuthenticationChallenge _initWithCFAuthChallenge:sender:](v6, (uint64_t)a3, (uint64_t)a4);
}

@end