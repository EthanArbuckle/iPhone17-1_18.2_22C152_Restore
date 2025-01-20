@interface HDFHIRExtensionElementResult
- (BOOL)isModifierExtension;
- (HDFHIRExtensionElement)extensionElement;
- (HDFHIRExtensionElementResult)init;
- (HDFHIRExtensionElementResult)initWithExtensionElement:(id)a3 keyPath:(id)a4 isModifierExtension:(BOOL)a5;
- (NSString)keyPath;
@end

@implementation HDFHIRExtensionElementResult

- (HDFHIRExtensionElementResult)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDFHIRExtensionElementResult)initWithExtensionElement:(id)a3 keyPath:(id)a4 isModifierExtension:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HDFHIRExtensionElementResult;
  v10 = [(HDFHIRExtensionElementResult *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    extensionElement = v10->_extensionElement;
    v10->_extensionElement = (HDFHIRExtensionElement *)v11;

    uint64_t v13 = [v9 copy];
    keyPath = v10->_keyPath;
    v10->_keyPath = (NSString *)v13;

    v10->_isModifierExtension = a5;
  }

  return v10;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (HDFHIRExtensionElement)extensionElement
{
  return self->_extensionElement;
}

- (BOOL)isModifierExtension
{
  return self->_isModifierExtension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionElement, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
}

@end