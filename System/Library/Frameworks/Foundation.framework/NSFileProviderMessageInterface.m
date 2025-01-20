@interface NSFileProviderMessageInterface
+ (BOOL)supportsSecureCoding;
- (NSFileProviderMessageInterface)initWithCoder:(id)a3;
- (NSFileProviderMessageInterface)initWithName:(id)a3 itemIdentifier:(id)a4 providerIdentifier:(id)a5;
- (NSString)itemIdentifier;
- (NSString)name;
- (NSString)providerIdentifier;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setProviderIdentifier:(id)a3;
@end

@implementation NSFileProviderMessageInterface

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSFileProviderMessageInterface;
  [(NSFileProviderMessageInterface *)&v3 dealloc];
}

- (NSFileProviderMessageInterface)initWithName:(id)a3 itemIdentifier:(id)a4 providerIdentifier:(id)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)NSFileProviderMessageInterface;
  v8 = [(NSFileProviderMessageInterface *)&v10 init];
  if (v8)
  {
    v8->_name = (NSString *)[a3 copy];
    v8->_itemIdentifier = (NSString *)[a4 copy];
    v8->_providerIdentifier = (NSString *)[a5 copy];
  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_name forKey:@"NSInterfaceName"];
  [a3 encodeObject:self->_itemIdentifier forKey:@"NSItemIdentifier"];
  providerIdentifier = self->_providerIdentifier;

  [a3 encodeObject:providerIdentifier forKey:@"NSProviderIdentifier"];
}

- (NSFileProviderMessageInterface)initWithCoder:(id)a3
{
  self->_name = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSInterfaceName"];
  self->_itemIdentifier = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSItemIdentifier"];
  self->_providerIdentifier = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSProviderIdentifier"];
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)itemIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setItemIdentifier:(id)a3
{
}

- (NSString)providerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setProviderIdentifier:(id)a3
{
}

@end