@interface LSClaimBindingConfiguration
- (BOOL)addClaimRecordIfMissing;
- (LSClaimBindingConfiguration)initWithTypeIdentifier:(id)a3;
- (NSString)typeIdentifier;
- (unint64_t)bundleClassMask;
- (void)setAddClaimRecordIfMissing:(BOOL)a3;
- (void)setBundleClassMask:(unint64_t)a3;
@end

@implementation LSClaimBindingConfiguration

- (LSClaimBindingConfiguration)initWithTypeIdentifier:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)LSClaimBindingConfiguration;
  v4 = [(LSClaimBindingConfiguration *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [a3 copy];
    typeIdentifier = v4->_typeIdentifier;
    v4->_typeIdentifier = (NSString *)v5;

    v4->_bundleClassMask = 4;
  }
  return v4;
}

- (NSString)typeIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)bundleClassMask
{
  return self->_bundleClassMask;
}

- (void)setBundleClassMask:(unint64_t)a3
{
  self->_bundleClassMask = a3;
}

- (BOOL)addClaimRecordIfMissing
{
  return self->_addClaimRecordIfMissing;
}

- (void)setAddClaimRecordIfMissing:(BOOL)a3
{
  self->_addClaimRecordIfMissing = a3;
}

- (void).cxx_destruct
{
}

@end