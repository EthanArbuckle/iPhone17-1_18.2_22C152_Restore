@interface LiveFSFPClusterItem
+ (id)newWithName:(id)a3 extension:(id)a4;
- (LiveFSFPClusterItem)initWithName:(id)a3 extension:(id)a4;
- (LiveFSFPExtensionHelper)extension;
- (NSString)filename;
- (NSString)fp_domainIdentifier;
- (NSString)fp_parentDomainIdentifier;
- (NSString)itemIdentifier;
- (NSString)parentItemIdentifier;
- (UTType)contentType;
@end

@implementation LiveFSFPClusterItem

- (LiveFSFPClusterItem)initWithName:(id)a3 extension:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)LiveFSFPClusterItem;
  v9 = [(LiveFSFPClusterItem *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_extension, a4);
    objc_storeStrong((id *)&v10->_filename, a3);
    v11 = [(NSFileProviderExtension *)v10->_extension domain];
    v12 = [v11 identifier];
    uint64_t v13 = [v12 stringByAppendingString:v7];
    fp_domainIdentifier = v10->_fp_domainIdentifier;
    v10->_fp_domainIdentifier = (NSString *)v13;
  }
  return v10;
}

+ (id)newWithName:(id)a3 extension:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithName:v7 extension:v6];

  return v8;
}

- (UTType)contentType
{
  return (UTType *)(id)*MEMORY[0x263F1DAB0];
}

- (NSString)itemIdentifier
{
  return (NSString *)(id)*MEMORY[0x263F053F0];
}

- (NSString)parentItemIdentifier
{
  return (NSString *)(id)*MEMORY[0x263F053F0];
}

- (NSString)fp_parentDomainIdentifier
{
  v2 = [(NSFileProviderExtension *)self->_extension domain];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (LiveFSFPExtensionHelper)extension
{
  return (LiveFSFPExtensionHelper *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)fp_domainIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)filename
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_fp_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

@end