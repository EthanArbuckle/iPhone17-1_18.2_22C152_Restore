@interface CKXAtomBindingImplementation
- (CKXAtomBindingImplementation)init;
- (CKXSchema)schema;
- (Class)mutableProxyClassForStructToken:(unint64_t)a3;
- (Class)proxyClassForStructToken:(unint64_t)a3;
- (id)orcHelpers;
- (unint64_t)structTokenForClass:(Class)a3;
- (unint64_t)topLevelStructToken;
- (void)setSchema:(id)a3;
@end

@implementation CKXAtomBindingImplementation

- (CKXAtomBindingImplementation)init
{
  v6.receiver = self;
  v6.super_class = (Class)CKXAtomBindingImplementation;
  v2 = [(CKXAtomBindingImplementation *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    schema = v2->_schema;
    v2->_schema = (CKXSchema *)v3;
  }
  return v2;
}

- (unint64_t)topLevelStructToken
{
  return self->tokens.topLevelContainer;
}

- (unint64_t)structTokenForClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3 || (Class)objc_opt_class() == a3) {
    return self->tokens.siteIdentifier;
  }
  if ((Class)objc_opt_class() == a3 || (Class)objc_opt_class() == a3) {
    return self->tokens.timestamp;
  }
  if ((Class)objc_opt_class() == a3 || (Class)objc_opt_class() == a3) {
    return self->tokens.location;
  }
  if ((Class)objc_opt_class() == a3 || (Class)objc_opt_class() == a3) {
    return self->tokens.reference;
  }
  if ((Class)objc_opt_class() == a3 || (Class)objc_opt_class() == a3) {
    return self->tokens.atom;
  }
  if ((Class)objc_opt_class() == a3 || (Class)objc_opt_class() == a3) {
    return self->tokens.topLevelContainer;
  }
  v8 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v6, v7);
  v9 = NSStringFromClass(a3);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v10, (uint64_t)a2, self, @"CKAtomSerialization.mm", 90, @"Unexpected class %@", v9);

  return -1;
}

- (Class)proxyClassForStructToken:(unint64_t)a3
{
  if (self->tokens.siteIdentifier == a3
    || self->tokens.timestamp == a3
    || self->tokens.location == a3
    || self->tokens.reference == a3
    || self->tokens.atom == a3
    || self->tokens.topLevelContainer == a3)
  {
    v5 = objc_opt_class();
  }
  else
  {
    v8 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, self, @"CKAtomSerialization.mm", 108, @"Unexpected struct token %ld", a3);

    v5 = 0;
  }
  return (Class)v5;
}

- (Class)mutableProxyClassForStructToken:(unint64_t)a3
{
  if (self->tokens.siteIdentifier == a3
    || self->tokens.timestamp == a3
    || self->tokens.location == a3
    || self->tokens.reference == a3
    || self->tokens.atom == a3
    || self->tokens.topLevelContainer == a3)
  {
    v5 = objc_opt_class();
  }
  else
  {
    v8 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, self, @"CKAtomSerialization.mm", 126, @"Unexpected struct token %ld", a3);

    v5 = 0;
  }
  return (Class)v5;
}

- (id)orcHelpers
{
  v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v5, v6, (uint64_t)a2, self, @"CKAtomSerialization.mm", 131, @"Should be implemented by subclass");

  return 0;
}

- (CKXSchema)schema
{
  return self->_schema;
}

- (void)setSchema:(id)a3
{
}

- (void).cxx_destruct
{
}

@end