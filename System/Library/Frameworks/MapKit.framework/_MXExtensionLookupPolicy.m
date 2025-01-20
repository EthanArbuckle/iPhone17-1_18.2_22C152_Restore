@interface _MXExtensionLookupPolicy
- (NSPredicate)extensionPredicate;
- (_MXExtensionLookupPolicy)initWithPredicate:(id)a3;
- (void)setExtensionPredicate:(id)a3;
@end

@implementation _MXExtensionLookupPolicy

- (NSPredicate)extensionPredicate
{
  return self->_extensionPredicate;
}

- (_MXExtensionLookupPolicy)initWithPredicate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MXExtensionLookupPolicy;
  v6 = [(_MXExtensionLookupPolicy *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_extensionPredicate, a3);
  }

  return v7;
}

- (void)setExtensionPredicate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end