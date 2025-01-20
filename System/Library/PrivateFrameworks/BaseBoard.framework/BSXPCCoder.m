@interface BSXPCCoder
+ (BOOL)supportsBSXPCSecureCoding;
+ (id)_testEncodeAndDecodeObject:(id)a3 ofClass:(Class)a4;
+ (id)coder;
+ (id)coderWithMessage:(id)a3;
- (BOOL)containsValueForKey:(id)a3;
- (BOOL)decodeBoolForKey:(id)a3;
- (BSXPCCoder)init;
- (BSXPCCoder)initWithBSXPCCoder:(id)a3;
- (BSXPCCoder)initWithMessage:(id)a3;
- (CGPoint)decodeCGPointForKey:(id)a3;
- (CGRect)decodeCGRectForKey:(id)a3;
- (CGSize)decodeCGSizeForKey:(id)a3;
- (NSString)description;
- (OS_xpc_object)XPCConnection;
- (OS_xpc_object)message;
- (double)decodeDoubleForKey:(id)a3;
- (id)_finishCoding;
- (id)_implicitDecodeXPCObjectForKey:(id)a3;
- (id)decodeCollectionOfClass:(Class)a3 containingClass:(Class)a4 forKey:(id)a5;
- (id)decodeDictionaryOfClass:(Class)a3 forKey:(id)a4;
- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4;
- (id)decodeStringForKey:(id)a3;
- (id)decodeXPCObjectOfType:(_xpc_type_s *)a3 forKey:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)decodeInt64ForKey:(id)a3;
- (unint64_t)decodeUInt64ForKey:(id)a3;
- (void)_appendXPCObject:(uint64_t)a3 withName:(void *)a4 toBuilder:;
- (void)_removeValueForKey:(id)a3;
- (void)dealloc;
- (void)encodeBool:(BOOL)a3 forKey:(id)a4;
- (void)encodeCGPoint:(CGPoint)a3 forKey:(id)a4;
- (void)encodeCGRect:(CGRect)a3 forKey:(id)a4;
- (void)encodeCGSize:(CGSize)a3 forKey:(id)a4;
- (void)encodeCollection:(id)a3 forKey:(id)a4;
- (void)encodeDictionary:(id)a3 forKey:(id)a4;
- (void)encodeDouble:(double)a3 forKey:(id)a4;
- (void)encodeInt64:(int64_t)a3 forKey:(id)a4;
- (void)encodeObject:(id)a3 forKey:(id)a4;
- (void)encodeUInt64:(unint64_t)a3 forKey:(id)a4;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation BSXPCCoder

- (OS_xpc_object)message
{
  return self->_message;
}

- (OS_xpc_object)XPCConnection
{
  return self->_xpcConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codingContext, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  uint64_t v6 = [a4 UTF8String];
  if (v6)
  {
    v7 = (const char *)v6;
    codingContext = self->_codingContext;
    if (!codingContext) {
      codingContext = self->_message;
    }
    xpc_dictionary_set_BOOL(codingContext, v7, a3);
  }
}

- (BOOL)decodeBoolForKey:(id)a3
{
  uint64_t v4 = [a3 UTF8String];
  if (v4)
  {
    v5 = (const char *)v4;
    codingContext = self->_codingContext;
    if (!codingContext) {
      codingContext = self->_message;
    }
    LOBYTE(v4) = xpc_dictionary_get_BOOL(codingContext, v5);
  }
  return v4;
}

- (id)_implicitDecodeXPCObjectForKey:(id)a3
{
  codingContext = self->_codingContext;
  if (!codingContext) {
    codingContext = self->_message;
  }
  v5 = codingContext;
  uint64_t v6 = (const char *)[a3 UTF8String];
  v7 = v5;
  if (!v6)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = objc_msgSend(NSString, "stringWithUTF8String:", "xpc_object_t  _Nullable BSXPCDictionaryGetValue(xpc_object_t  _Nullable __strong, const char * _Nonnull, xpc_type_t _Nullable)");
    [v15 handleFailureInFunction:v16 file:@"BSXPCObjectUtilities.h" lineNumber:50 description:@"key must not be nil"];
  }
  v8 = v7;
  v9 = v8;
  if (v8
    && (Class Class = object_getClass(v8),
        v11 = (objc_class *)MEMORY[0x1E4F14590],
        v9,
        v9,
        Class == v11))
  {
    v12 = xpc_dictionary_get_value(v9, v6);
  }
  else
  {
    v12 = 0;
  }

  if (v12 && (BSXPCObjectBaseClass(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  return v13;
}

- (void)dealloc
{
  if (self->_codingContext)
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"BSXPCCoder.m" lineNumber:154 description:@"cannot dealloc while the coding context is in flight"];
  }
  v5.receiver = self;
  v5.super_class = (Class)BSXPCCoder;
  [(BSXPCCoder *)&v5 dealloc];
}

- (id)_finishCoding
{
  int v2 = 0;
  atomic_compare_exchange_strong_explicit(&self->_finalized, (unsigned int *)&v2, 1u, memory_order_relaxed, memory_order_relaxed);
  return self->_message;
}

- (id)decodeStringForKey:(id)a3
{
  codingContext = self->_codingContext;
  if (!codingContext) {
    codingContext = self->_message;
  }
  objc_super v5 = codingContext;
  uint64_t v6 = (const char *)[a3 UTF8String];
  v7 = v5;
  if (!v6)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    v21 = objc_msgSend(NSString, "stringWithUTF8String:", "xpc_object_t  _Nullable BSXPCDictionaryGetValue(xpc_object_t  _Nullable __strong, const char * _Nonnull, xpc_type_t _Nullable)");
    [v20 handleFailureInFunction:v21 file:@"BSXPCObjectUtilities.h" lineNumber:50 description:@"key must not be nil"];
  }
  v8 = v7;
  v9 = v8;
  if (v8
    && (Class v10 = object_getClass(v8),
        v11 = (objc_class *)MEMORY[0x1E4F14590],
        v9,
        v9,
        v10 == v11))
  {
    xpc_dictionary_get_value(v9, v6);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    v12 = v17;
    if (v17)
    {
      Class Class = object_getClass(v17);
      v19 = (objc_class *)MEMORY[0x1E4F145F0];

      if (Class == v19) {
        id v13 = v12;
      }
      else {
        id v13 = 0;
      }
      goto LABEL_9;
    }
  }
  else
  {
    v12 = 0;
  }
  id v13 = 0;
LABEL_9:
  id v14 = v13;

  if (v14) {
    v15 = (void *)[[NSString alloc] initWithUTF8String:xpc_string_get_string_ptr(v14)];
  }
  else {
    v15 = 0;
  }

  return v15;
}

- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4
{
  return _BSXPCDecodeObjectForKey((uint64_t)self, a4, a3, 0);
}

+ (id)coder
{
  int v2 = (void *)[objc_alloc((Class)a1) initWithMessage:0];
  return v2;
}

+ (id)coderWithMessage:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithMessage:a3];
  return v3;
}

- (BSXPCCoder)initWithMessage:(id)a3
{
  if (a3 && object_getClass(a3) != (Class)MEMORY[0x1E4F14590])
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"BSXPCCoder.m", 138, @"Invalid parameter not satisfying: %@", @"!message || (xpc_get_type(message) == XPC_TYPE_DICTIONARY)" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)BSXPCCoder;
  uint64_t v6 = [(BSXPCCoder *)&v13 init];
  v7 = v6;
  if (v6)
  {
    v6->_finalized = 0;
    if (a3)
    {
      objc_storeStrong((id *)&v6->_message, a3);
      uint64_t v8 = xpc_dictionary_get_remote_connection(a3);
      xpcConnection = v7->_xpcConnection;
      v7->_xpcConnection = (OS_xpc_object *)v8;
    }
    else
    {
      Class v10 = (OS_xpc_object *)xpc_dictionary_create(0, 0, 0);
      xpcConnection = v7->_message;
      v7->_message = v10;
    }
  }
  return v7;
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  unsigned int v8 = 1;
  atomic_compare_exchange_strong_explicit(&self->_finalized, &v8, v8, memory_order_relaxed, memory_order_relaxed);
  if (v8 != 1)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_8:
    Class v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"BSXPCCoder.m", 175, @"Invalid parameter not satisfying: %@", @"key != nil" object file lineNumber description];

    if (!a3) {
      return;
    }
    goto LABEL_4;
  }
  v9 = [MEMORY[0x1E4F28B00] currentHandler];
  [v9 handleFailureInMethod:a2 object:self file:@"BSXPCCoder.m" lineNumber:174 description:@"cannot continue encoding after finalizing"];

  if (!a4) {
    goto LABEL_8;
  }
LABEL_3:
  if (!a3) {
    return;
  }
LABEL_4:
  _BSXPCEncodeObjectForKey((uint64_t)self, a3, a4);
}

- (void)encodeCollection:(id)a3 forKey:(id)a4
{
  if (a3
    && ([a3 isNSArray] & 1) == 0
    && ([a3 isNSSet] & 1) == 0
    && ([a3 isNSOrderedSet] & 1) == 0)
  {
    unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"BSXPCCoder.m", 183, @"Collection class %@ not supported", objc_msgSend(a3, "classForCoder") object file lineNumber description];
  }
  [(BSXPCCoder *)self encodeObject:a3 forKey:a4];
}

- (id)decodeCollectionOfClass:(Class)a3 containingClass:(Class)a4 forKey:(id)a5
{
  return _BSXPCDecodeObjectForKey((uint64_t)self, a5, a3, a4);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (BSXPCCoder)init
{
  return [(BSXPCCoder *)self initWithMessage:0];
}

- (BOOL)containsValueForKey:(id)a3
{
  codingContext = self->_codingContext;
  if (!codingContext) {
    codingContext = self->_message;
  }
  objc_super v5 = codingContext;
  uint64_t v6 = (const char *)[a3 UTF8String];
  v7 = v5;
  if (!v6)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = objc_msgSend(NSString, "stringWithUTF8String:", "xpc_object_t  _Nullable BSXPCDictionaryGetValue(xpc_object_t  _Nullable __strong, const char * _Nonnull, xpc_type_t _Nullable)");
    [v14 handleFailureInFunction:v15 file:@"BSXPCObjectUtilities.h" lineNumber:50 description:@"key must not be nil"];
  }
  unsigned int v8 = v7;
  v9 = v8;
  if (v8
    && (Class Class = object_getClass(v8),
        v11 = (objc_class *)MEMORY[0x1E4F14590],
        v9,
        v9,
        Class == v11))
  {
    v12 = xpc_dictionary_get_value(v9, v6);
  }
  else
  {
    v12 = 0;
  }

  return v12 != 0;
}

- (unint64_t)decodeUInt64ForKey:(id)a3
{
  unint64_t result = [a3 UTF8String];
  if (result)
  {
    objc_super v5 = (const char *)result;
    codingContext = self->_codingContext;
    if (!codingContext) {
      codingContext = self->_message;
    }
    return xpc_dictionary_get_uint64(codingContext, v5);
  }
  return result;
}

- (void)encodeUInt64:(unint64_t)a3 forKey:(id)a4
{
  uint64_t v6 = [a4 UTF8String];
  if (v6)
  {
    v7 = (const char *)v6;
    codingContext = self->_codingContext;
    if (!codingContext) {
      codingContext = self->_message;
    }
    xpc_dictionary_set_uint64(codingContext, v7, a3);
  }
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = [(BSXPCCoder *)self createMessage];
  objc_msgSend(a3, "encodeXPCObject:forKey:");
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  int64_t result = [a3 UTF8String];
  if (result)
  {
    objc_super v5 = (const char *)result;
    codingContext = self->_codingContext;
    if (!codingContext) {
      codingContext = self->_message;
    }
    return xpc_dictionary_get_int64(codingContext, v5);
  }
  return result;
}

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
  uint64_t v6 = [a4 UTF8String];
  if (v6)
  {
    v7 = (const char *)v6;
    codingContext = self->_codingContext;
    if (!codingContext) {
      codingContext = self->_message;
    }
    xpc_dictionary_set_int64(codingContext, v7, a3);
  }
}

- (BSXPCCoder)initWithBSXPCCoder:(id)a3
{
  id v4 = [a3 decodeXPCObjectOfType:MEMORY[0x1E4F14590] forKey:@"message"];
  objc_super v5 = [(BSXPCCoder *)self initWithMessage:v4];

  return v5;
}

- (id)decodeXPCObjectOfType:(_xpc_type_s *)a3 forKey:(id)a4
{
  if (a3) {
    uint64_t class4NSXPC = xpc_get_class4NSXPC();
  }
  else {
    uint64_t class4NSXPC = (uint64_t)BSXPCObjectBaseClass();
  }
  return [(BSXPCCoder *)self decodeObjectOfClass:class4NSXPC forKey:a4];
}

- (void)encodeDictionary:(id)a3 forKey:(id)a4
{
  if (a3 && ([a3 isNSDictionary] & 1) == 0)
  {
    unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"BSXPCCoder.m" lineNumber:188 description:@"Object is not an NSDictionary"];
  }
  [(BSXPCCoder *)self encodeObject:a3 forKey:a4];
}

- (void)encodeCGPoint:(CGPoint)a3 forKey:(id)a4
{
  objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGPoint:", a3.x, a3.y);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  -[BSXPCCoder encodeObject:forKey:](self, "encodeObject:forKey:");
}

- (void)encodeCGSize:(CGSize)a3 forKey:(id)a4
{
  objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGSize:", a3.width, a3.height);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  -[BSXPCCoder encodeObject:forKey:](self, "encodeObject:forKey:");
}

- (void)encodeCGRect:(CGRect)a3 forKey:(id)a4
{
  objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  -[BSXPCCoder encodeObject:forKey:](self, "encodeObject:forKey:");
}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  codingContext = self->_codingContext;
  if (!codingContext) {
    codingContext = self->_message;
  }
  v7 = codingContext;
  BSSerializeDoubleToXPCDictionaryWithKey(v7, (const char *)[a4 UTF8String], a3);
}

- (id)decodeDictionaryOfClass:(Class)a3 forKey:(id)a4
{
  v7 = (objc_class *)objc_opt_class();
  return _BSXPCDecodeObjectForKey((uint64_t)self, a4, v7, a3);
}

- (CGPoint)decodeCGPointForKey:(id)a3
{
  v3 = [(BSXPCCoder *)self decodeObjectOfClass:objc_opt_class() forKey:a3];
  objc_msgSend(v3, "bs_CGPointValue");
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGSize)decodeCGSizeForKey:(id)a3
{
  v3 = [(BSXPCCoder *)self decodeObjectOfClass:objc_opt_class() forKey:a3];
  objc_msgSend(v3, "bs_CGSizeValue");
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGRect)decodeCGRectForKey:(id)a3
{
  v3 = [(BSXPCCoder *)self decodeObjectOfClass:objc_opt_class() forKey:a3];
  objc_msgSend(v3, "bs_CGRectValue");
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (double)decodeDoubleForKey:(id)a3
{
  codingContext = self->_codingContext;
  if (!codingContext) {
    codingContext = self->_message;
  }
  double v5 = codingContext;
  double v6 = BSDeserializeDoubleFromXPCDictionaryWithKey(v5, (const char *)[a3 UTF8String]);

  return v6;
}

- (void)_removeValueForKey:(id)a3
{
  if (a3)
  {
    codingContext = self->_codingContext;
    if (!codingContext) {
      codingContext = self->_message;
    }
    double v5 = codingContext;
    double v6 = (const char *)[a3 UTF8String];
    double v7 = v5;
    xdict = v7;
    if (v6)
    {
      if (v7)
      {
        double v8 = xpc_dictionary_get_value(v7, v6);

        if (v8) {
          xpc_dictionary_set_value(xdict, v6, 0);
        }
      }
    }
    else
    {
      double v9 = [MEMORY[0x1E4F28B00] currentHandler];
      double v10 = objc_msgSend(NSString, "stringWithUTF8String:", "void BSXPCDictionarySetValue(xpc_object_t  _Nullable __strong, const char * _Nonnull, xpc_object_t  _Nullable __strong, xpc_type_t _Nullable)");
      [v9 handleFailureInFunction:v10 file:@"BSXPCObjectUtilities.h" lineNumber:61 description:@"key must not be nil"];
    }
  }
}

+ (id)_testEncodeAndDecodeObject:(id)a3 ofClass:(Class)a4
{
  double v6 = +[BSXPCCoder coder];
  [v6 encodeObject:a3 forKey:@"test"];
  double v7 = [v6 createMessage];
  double v8 = +[BSXPCCoder coderWithMessage:v7];

  double v9 = [v8 decodeObjectOfClass:a4 forKey:@"test"];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(BSXPCCoder *)self descriptionWithMultilinePrefix:0];
}

- (void)_appendXPCObject:(uint64_t)a3 withName:(void *)a4 toBuilder:
{
  if (a1)
  {
    if (a3)
    {
      double v7 = objc_msgSend(NSString, "stringWithUTF8String:");
    }
    else
    {
      double v7 = 0;
    }
    id v8 = a2;
    double v9 = v8;
    if (!v8) {
      goto LABEL_8;
    }
    Class Class = object_getClass(v8);
    double v11 = (objc_class *)MEMORY[0x1E4F14590];

    if (Class == v11)
    {
      double v13 = [a4 activeMultilinePrefix];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __50__BSXPCCoder__appendXPCObject_withName_toBuilder___block_invoke;
      v15[3] = &unk_1E5446E40;
      v15[4] = v9;
      v15[5] = a1;
      v15[6] = a4;
      [a4 appendBodySectionWithName:v7 multilinePrefix:v13 block:v15];
    }
    else
    {
      if (object_getClass(v9) != (Class)MEMORY[0x1E4F14568])
      {
LABEL_8:
        id v12 = (id)[a4 appendObject:v9 withName:v7 skipIfNil:0];
LABEL_12:

        return;
      }
      double v13 = [a4 activeMultilinePrefix];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __50__BSXPCCoder__appendXPCObject_withName_toBuilder___block_invoke_3;
      v14[3] = &unk_1E5446E40;
      v14[4] = v9;
      v14[5] = a1;
      v14[6] = a4;
      [a4 appendBodySectionWithName:v7 multilinePrefix:v13 block:v14];
    }

    goto LABEL_12;
  }
}

BOOL __50__BSXPCCoder__appendXPCObject_withName_toBuilder___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__BSXPCCoder__appendXPCObject_withName_toBuilder___block_invoke_2;
  v3[3] = &unk_1E5446E18;
  long long v4 = *(_OWORD *)(a1 + 40);
  return xpc_dictionary_apply(v1, v3);
}

uint64_t __50__BSXPCCoder__appendXPCObject_withName_toBuilder___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return 1;
}

BOOL __50__BSXPCCoder__appendXPCObject_withName_toBuilder___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__BSXPCCoder__appendXPCObject_withName_toBuilder___block_invoke_4;
  v3[3] = &unk_1E5446E68;
  long long v4 = *(_OWORD *)(a1 + 40);
  return xpc_array_apply(v1, v3);
}

uint64_t __50__BSXPCCoder__appendXPCObject_withName_toBuilder___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  objc_msgSend(NSString, "stringWithFormat:", @"%lu", a2);
  id v6 = objc_claimAutoreleasedReturnValue();
  -[BSXPCCoder _appendXPCObject:withName:toBuilder:](v5, a3, [v6 UTF8String], *(void *)(a1 + 40));

  return 1;
}

- (id)succinctDescription
{
  int v2 = [(BSXPCCoder *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = (id)[v3 appendUnsignedInteger:xpc_dictionary_get_count(self->_message) withName:@"valueCount"];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(BSXPCCoder *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(BSXPCCoder *)self succinctDescriptionBuilder];
  if (xpc_dictionary_get_count(self->_message)) {
    -[BSXPCCoder _appendXPCObject:withName:toBuilder:]((uint64_t)self, self->_message, 0, v4);
  }
  return v4;
}

@end