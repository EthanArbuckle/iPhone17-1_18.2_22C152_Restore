@interface NSFileProviderMovingInfo
+ (BOOL)supportsSecureCoding;
+ (id)infoWithDestinationDirectoryURL:(id)a3;
- (NSFileProviderMovingInfo)initWithCoder:(id)a3;
- (NSURL)destinationDirectoryURL;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSFileProviderMovingInfo

+ (id)infoWithDestinationDirectoryURL:(id)a3
{
  v4 = objc_opt_new();
  v4[1] = a3;

  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSFileProviderMovingInfo;
  [(NSFileProviderMovingInfo *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"NSFileProviderMovingInfo instances should only ever be encoded by XPC" userInfo:0]);
  }
  destinationDirectoryURL = self->destinationDirectoryURL;

  [a3 encodeObject:destinationDirectoryURL forKey:@"destinationDirectoryURL"];
}

- (NSFileProviderMovingInfo)initWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"NSFileProviderMovingInfo should only ever be decoded by XPC" userInfo:0]);
  }
  self->destinationDirectoryURL = (NSURL *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"destinationDirectoryURL"];
  return self;
}

- (NSURL)destinationDirectoryURL
{
  return self->destinationDirectoryURL;
}

@end