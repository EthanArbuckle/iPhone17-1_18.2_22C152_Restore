@interface NSFileProviderPresenterInfo
+ (BOOL)supportsSecureCoding;
+ (id)infoWithPresenterID:(id)a3 auditToken:(id *)a4 observedUbiquityAttributes:(id)a5;
- ($115C4C562B26FF47E01F9F4EA65B5887)presenterAuditToken;
- (NSFileProviderPresenterInfo)initWithCoder:(id)a3;
- (NSSet)observedUbiquityAttributes;
- (NSString)presenterID;
- (NSURL)changedURL;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setChangedURL:(id)a3;
@end

@implementation NSFileProviderPresenterInfo

+ (id)infoWithPresenterID:(id)a3 auditToken:(id *)a4 observedUbiquityAttributes:(id)a5
{
  v8 = objc_alloc_init(NSFileProviderPresenterInfo);
  long long v9 = *(_OWORD *)&a4->var0[4];
  *(_OWORD *)v8->presenterAuditToken.val = *(_OWORD *)a4->var0;
  *(_OWORD *)&v8->presenterAuditToken.val[4] = v9;
  v8->presenterID = (NSString *)[a3 copy];
  v8->observedUbiquityAttributes = (NSSet *)a5;

  return v8;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSFileProviderPresenterInfo;
  [(NSFileProviderPresenterInfo *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"NSFileProviderPresenterInfo instances should only ever be encoded by XPC" userInfo:0]);
  }
  [a3 encodeBytes:&self->presenterAuditToken length:32 forKey:@"audittoken"];
  [a3 encodeObject:self->presenterID forKey:@"presenterid"];
  [a3 encodeObject:self->observedUbiquityAttributes forKey:@"ubiquityattrs"];
  changedURL = self->changedURL;

  [a3 encodeObject:changedURL forKey:@"newurl"];
}

- (NSFileProviderPresenterInfo)initWithCoder:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"NSFileProviderPresenterInfo should only ever be decoded by XPC" userInfo:0]);
  }
  uint64_t v10 = 0;
  v5 = (_OWORD *)[a3 decodeBytesForKey:@"audittoken" returnedLength:&v10];
  if (v5 && v10 == 32)
  {
    long long v6 = v5[1];
    *(_OWORD *)self->presenterAuditToken.val = *v5;
    *(_OWORD *)&self->presenterAuditToken.val[4] = v6;
    self->presenterID = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"presenterid"];
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    self->observedUbiquityAttributes = (NSSet *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0), @"ubiquityattrs");
    self->changedURL = (NSURL *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"newurl"];
  }
  else
  {

    v11 = @"NSDebugDescription";
    v12[0] = @"Audit token is missing or invalid";
    objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 4864, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1)));
    return 0;
  }
  return self;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)presenterAuditToken
{
  objc_copyStruct(retstr, &self->presenterAuditToken, 32, 1, 0);
  return result;
}

- (NSString)presenterID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSSet)observedUbiquityAttributes
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)changedURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setChangedURL:(id)a3
{
}

@end