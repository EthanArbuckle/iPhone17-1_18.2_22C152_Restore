@interface FPProvider
+ (BOOL)supportsSecureCoding;
+ (id)beginMonitoringProviderChangesWithHandler:(id)a3;
+ (void)endMonitoringProviderChanges:(id)a3;
+ (void)fetchProviderForItem:(id)a3 completionHandler:(id)a4;
- (FPProvider)initWithCoder:(id)a3;
- (NSArray)supportedSortDescriptors;
- (NSURL)storageURL;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FPProvider

- (void).cxx_destruct
{
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FPProvider;
  [(FPProviderDomain *)&v3 encodeWithCoder:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FPProvider)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FPProvider;
  return [(FPProviderDomain *)&v4 initWithCoder:a3];
}

+ (id)beginMonitoringProviderChangesWithHandler:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___FPProvider;
  objc_super v3 = objc_msgSendSuper2(&v5, sel_beginMonitoringProviderDomainChangesWithHandler_, a3);

  return v3;
}

+ (void)endMonitoringProviderChanges:(id)a3
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___FPProvider;
  objc_msgSendSuper2(&v3, sel_endMonitoringProviderDomainChanges_, a3);
}

+ (void)fetchProviderForItem:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__FPProvider_fetchProviderForItem_completionHandler___block_invoke;
  v8[3] = &unk_1E5AF1790;
  id v9 = v6;
  id v7 = v6;
  [a1 fetchProviderDomainForItem:a3 completionHandler:v8];
}

uint64_t __53__FPProvider_fetchProviderForItem_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSURL)storageURL
{
  v2 = [(FPProviderDomain *)self storageURLs];
  objc_super v3 = [v2 firstObject];

  return (NSURL *)v3;
}

- (NSArray)supportedSortDescriptors
{
  return self->_supportedSortDescriptors;
}

- (int64_t)type
{
  return self->_type;
}

@end