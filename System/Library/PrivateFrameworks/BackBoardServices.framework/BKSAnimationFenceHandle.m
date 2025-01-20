@interface BKSAnimationFenceHandle
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)newFenceHandleForCAFenceHandle:(id)a3;
+ (id)newFenceHandleForContext:(id)a3;
- (BKSAnimationFenceHandle)init;
- (BKSAnimationFenceHandle)initWithBSXPCCoder:(id)a3;
- (BKSAnimationFenceHandle)initWithCoder:(id)a3;
- (BKSAnimationFenceHandle)initWithXPCDictionary:(id)a3;
- (BOOL)isUsable;
- (NSString)description;
- (id)CAFenceHandle;
- (id)_initWithCAFenceHandle:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)fenceName;
- (unsigned)CAPort;
- (void)dealloc;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)invalidate;
@end

@implementation BKSAnimationFenceHandle

- (id)CAFenceHandle
{
  return self->_caFence;
}

- (void)invalidate
{
}

- (void).cxx_destruct
{
}

- (BOOL)isUsable
{
  return [(CAFenceHandle *)self->_caFence isUsable];
}

- (BKSAnimationFenceHandle)initWithBSXPCCoder:(id)a3
{
  v4 = [a3 decodeXPCObjectOfType:MEMORY[0x1E4F14590] forKey:@"f"];
  v5 = [getCAFenceHandleClass() handleFromXPCRepresentation:v4];
  v6 = [(BKSAnimationFenceHandle *)self _initWithCAFenceHandle:v5];

  return v6;
}

+ (id)newFenceHandleForCAFenceHandle:(id)a3
{
  id v3 = a3;
  id v4 = [[BKSAnimationFenceHandle alloc] _initWithCAFenceHandle:v3];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [BKSAnimationFenceHandle alloc];
  v6 = (void *)[(CAFenceHandle *)self->_caFence copyWithZone:a3];
  id v7 = [(BKSAnimationFenceHandle *)v5 _initWithCAFenceHandle:v6];

  return v7;
}

- (id)_initWithCAFenceHandle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKSAnimationFenceHandle;
  v6 = [(BKSAnimationFenceHandle *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_caFence, a3);
  }

  return v7;
}

- (void)dealloc
{
  [(CAFenceHandle *)self->_caFence invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BKSAnimationFenceHandle;
  [(BKSAnimationFenceHandle *)&v3 dealloc];
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v5 = a3;
  id v4 = (void *)[(CAFenceHandle *)self->_caFence createXPCRepresentation];
  if (v4) {
    [v5 encodeXPCObject:v4 forKey:@"f"];
  }
}

- (void)encodeWithCoder:(id)a3
{
}

- (BKSAnimationFenceHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  getCAFenceHandleClass();
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"f"];

  v6 = [(BKSAnimationFenceHandle *)self _initWithCAFenceHandle:v5];
  return v6;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    xpc_object_t xdict = v4;
    id v5 = (void *)[(CAFenceHandle *)self->_caFence createXPCRepresentation];
    if (v5) {
      xpc_dictionary_set_value(xdict, "f", v5);
    }

    id v4 = xdict;
  }
}

- (BKSAnimationFenceHandle)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  id CAFenceHandleClass = getCAFenceHandleClass();
  if (v4)
  {
    v6 = xpc_dictionary_get_value(v4, "f");
  }
  else
  {
    v6 = 0;
  }
  id v7 = [CAFenceHandleClass handleFromXPCRepresentation:v6];
  v8 = [(BKSAnimationFenceHandle *)self _initWithCAFenceHandle:v7];

  if (v4) {
  return v8;
  }
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<BKSAnimationFenceHandle:%p -> %@>", self, self->_caFence];
}

- (unsigned)CAPort
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  caFence = self->_caFence;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__BKSAnimationFenceHandle_CAPort__block_invoke;
  v5[3] = &unk_1E5441168;
  v5[4] = &v6;
  [(CAFenceHandle *)caFence accessMachPort:v5];
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __33__BKSAnimationFenceHandle_CAPort__block_invoke(uint64_t result, int a2, char a3)
{
  if ((a3 & 1) == 0) {
    *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  }
  return result;
}

- (unint64_t)fenceName
{
  return 0;
}

- (BKSAnimationFenceHandle)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"BKSAnimationFence.m", 27, @"you can't instantiate %@ directly", objc_opt_class() object file lineNumber description];

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newFenceHandleForContext:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    int v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"BKSAnimationFence.m", 45, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  uint64_t v6 = (void *)[getCAFenceHandleClass() newFenceFromDefaultServer];
  [v5 addFence:v6];
  id v7 = +[BKSAnimationFenceHandle newFenceHandleForCAFenceHandle:v6];

  return v7;
}

@end