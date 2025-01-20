@interface NSURLPromisePair
+ (BOOL)supportsSecureCoding;
+ (id)pairWithLogicalURL:(id)a3 physicalURL:(id)a4;
+ (id)pairWithURL:(id)a3;
- (NSURL)URL;
- (NSURL)logicalURL;
- (NSURL)physicalURL;
- (NSURLPromisePair)initWithCoder:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSURLPromisePair

- (NSURLPromisePair)initWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"_NSURLPromisePair should only ever be decoded by XPC" userInfo:0]);
  }
  self->_logicalURL = (NSURL *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSLogicalURL"];
  self->_physicalURL = (NSURL *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSPhysicalURL"];
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"NSFileAccessClaims should only ever be encoded by XPC" userInfo:0]);
  }
  [a3 encodeObject:self->_logicalURL forKey:@"NSLogicalURL"];
  physicalURL = self->_physicalURL;

  [a3 encodeObject:physicalURL forKey:@"NSPhysicalURL"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURL)URL
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CB10]), "initWithString:", -[NSURL absoluteString](self->_logicalURL, "absoluteString"));
  if (v2) {
    _CFURLPromiseSetPhysicalURL();
  }

  return (NSURL *)v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSURLPromisePair;
  [(NSURLPromisePair *)&v3 dealloc];
}

+ (id)pairWithURL:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    v5 = (const void *)_CFURLPromiseCopyPhysicalURL();
    id v3 = (id)[a1 pairWithLogicalURL:v3 physicalURL:v5];
    if (v5) {
      CFRelease(v5);
    }
  }
  return v3;
}

+ (id)pairWithLogicalURL:(id)a3 physicalURL:(id)a4
{
  if (!a3) {
    return 0;
  }
  v6 = objc_alloc_init((Class)a1);
  if (v6)
  {
    v6[1] = [a3 copy];
    v6[2] = [a4 copy];
  }

  return v6;
}

- (NSURL)logicalURL
{
  return self->_logicalURL;
}

- (NSURL)physicalURL
{
  return self->_physicalURL;
}

@end