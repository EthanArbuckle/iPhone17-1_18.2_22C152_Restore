@interface _MXExtensionContainingAppProxy
- (NSMutableSet)extensionNonUIIdentifiers;
- (NSMutableSet)extensionUIIdentifiers;
- (NSString)containingAppIdentifer;
- (_MXExtensionContainingAppProxy)initWithContainingAppIdentifer:(id)a3;
- (void)setExtensionNonUIIdentifiers:(id)a3;
- (void)setExtensionUIIdentifiers:(id)a3;
@end

@implementation _MXExtensionContainingAppProxy

- (_MXExtensionContainingAppProxy)initWithContainingAppIdentifer:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_MXExtensionContainingAppProxy;
  v5 = [(_MXExtensionContainingAppProxy *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    containingAppIdentifer = v5->_containingAppIdentifer;
    v5->_containingAppIdentifer = (NSString *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    extensionNonUIIdentifiers = v5->_extensionNonUIIdentifiers;
    v5->_extensionNonUIIdentifiers = (NSMutableSet *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
    extensionUIIdentifiers = v5->_extensionUIIdentifiers;
    v5->_extensionUIIdentifiers = (NSMutableSet *)v10;
  }
  return v5;
}

- (NSMutableSet)extensionUIIdentifiers
{
  return self->_extensionUIIdentifiers;
}

- (void)setExtensionUIIdentifiers:(id)a3
{
}

- (NSMutableSet)extensionNonUIIdentifiers
{
  return self->_extensionNonUIIdentifiers;
}

- (void)setExtensionNonUIIdentifiers:(id)a3
{
}

- (NSString)containingAppIdentifer
{
  return self->_containingAppIdentifer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containingAppIdentifer, 0);
  objc_storeStrong((id *)&self->_extensionNonUIIdentifiers, 0);

  objc_storeStrong((id *)&self->_extensionUIIdentifiers, 0);
}

@end