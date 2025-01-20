@interface NSInvocation
+ (NSInvocation)invocationWithMethodSignature:(NSMethodSignature *)sig;
+ (id)_invocationWithMethodSignature:(id)a3 frame:(void *)a4;
+ (uint64_t)requiredStackSizeForSignature:(uint64_t)a1;
- (BOOL)argumentsRetained;
- (NSInvocation)init;
- (NSMethodSignature)methodSignature;
- (SEL)selector;
- (id)copyWithZone:(_NSZone *)a3;
- (id)target;
- (uint64_t)_initWithMethodSignature:(const void *)a3 frame:(void *)a4 buffer:(size_t)a5 size:;
- (void)_addAttachedObject:(id)a3;
- (void)dealloc;
- (void)getArgument:(void *)argumentLocation atIndex:(NSInteger)idx;
- (void)getReturnValue:(void *)retLoc;
- (void)invoke;
- (void)invokeUsingIMP:(IMP)imp;
- (void)invokeWithTarget:(id)target;
- (void)retainArguments;
- (void)setArgument:(void *)argumentLocation atIndex:(NSInteger)idx;
- (void)setReturnValue:(void *)retLoc;
- (void)setSelector:(SEL)selector;
- (void)setTarget:(id)target;
@end

@implementation NSInvocation

- (NSMethodSignature)methodSignature
{
  return self->_signature;
}

- (void)getReturnValue:(void *)retLoc
{
}

+ (NSInvocation)invocationWithMethodSignature:(NSMethodSignature *)sig
{
  return (NSInvocation *)[a1 _invocationWithMethodSignature:sig frame:0];
}

- (BOOL)argumentsRetained
{
  return self->_retainedArgs != 0;
}

- (void)invokeUsingIMP:(IMP)imp
{
  v14[1] = *(void *)off_1ECE0A5B0;
  unsigned int magic = self->_magic;
  if (magic_cookie_oGuard != -1) {
    dispatch_once(&magic_cookie_oGuard, &__block_literal_global_29);
  }
  if (magic != magic_cookie_oValue) {
    -[NSInvocation invokeUsingIMP:]();
  }
  v14[0] = 0;
  [(NSInvocation *)self getArgument:v14 atIndex:0];
  if (v14[0])
  {
    v6 = [(NSMethodSignature *)self->_signature _frameDescriptor];
    uint64_t var0 = (uint64_t)v6->var0;
    if ((*((_WORD *)v6->var0 + 17) & 0x80) != 0
      && !*(void *)((char *)self->_frame + *(_DWORD *)(var0 + 28) + *(unsigned __int8 *)(var0 + 32)))
    {
      __NSICreateBackingForArgumentIfNeeded((uint64_t)self, var0, -1, 0);
    }
    [(NSMethodSignature *)self->_signature numberOfArguments];
    objc_opt_class();
    NSUInteger v8 = [(NSMethodSignature *)self->_signature frameLength];
    if (v8)
    {
      if ((v8 & 7) != 0) {
        -[NSInvocation invokeUsingIMP:]();
      }
      for (uint64_t i = 0; i != 64; i += 8)
        ;
    }
    if (v9 != self->_pac_signature) {
      _NSIPoisoned();
    }
    __invoking___((uint64_t (*)(unint64_t, unint64_t, unint64_t, unint64_t, unint64_t, unint64_t, unint64_t, unint64_t, __n128, __n128, __n128, __n128, __n128, __n128, __n128, __n128))imp, (uint64_t)self->_retdata, (__n128 *)self->_frame, [(NSMethodSignature *)self->_signature frameLength]);
    if (self->_retainedArgs)
    {
      v11 = (const UInt8 *)v6->var0;
      uint64_t v12 = 8;
      if ((*((_WORD *)v6->var0 + 17) & 0x80) == 0) {
        uint64_t v12 = 16;
      }
      frame = *(Class *)((char *)&self->super.isa + v12);
LABEL_17:
      __NSI3(v11, (uint64_t)frame, (id *)&self->_container, 1);
      while (1)
      {
        v6 = (NSMethodFrameDescriptor *)v6->var1;
        if (!v6) {
          break;
        }
        if ((WORD1(v6[1].var1) & 3) != 1)
        {
          frame = self->_frame;
          v11 = (const UInt8 *)v6;
          goto LABEL_17;
        }
      }
    }
  }
}

- (id)target
{
  v3[1] = *(void *)off_1ECE0A5B0;
  v3[0] = 0;
  [(NSInvocation *)self getArgument:v3 atIndex:0];
  return (id)v3[0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  unsigned int magic = self->_magic;
  if (magic_cookie_oGuard != -1) {
    dispatch_once(&magic_cookie_oGuard, &__block_literal_global_29);
  }
  if (magic != magic_cookie_oValue) {
    -[NSInvocation copyWithZone:]();
  }
  id v5 = objc_alloc((Class)objc_opt_class());
  *((void *)v5 + 3) = self->_signature;
  v6 = (char *)malloc_type_calloc(1uLL, [(NSMethodSignature *)self->_signature frameLength] + 320, 0xDB3134BDuLL);
  *((void *)v5 + 1) = v6 + 320;
  *((void *)v5 + 2) = v6;
  *((void *)v5 + 4) = 0;
  *((_DWORD *)v5 + 14) = self->_magic;
  if (self->_retainedArgs) {
    [v5 retainArguments];
  }
  [(NSMethodSignature *)self->_signature numberOfArguments];
  objc_opt_class();
  NSUInteger v7 = [(NSMethodSignature *)self->_signature frameLength];
  if (v7)
  {
    if ((v7 & 7) != 0) {
      -[NSInvocation copyWithZone:]();
    }
    for (uint64_t i = 0; i != 64; i += 8)
      ;
  }
  if (v8 != self->_pac_signature) {
    _NSIPoisoned();
  }
  [*((id *)v5 + 3) numberOfArguments];
  objc_opt_class();
  uint64_t v10 = [*((id *)v5 + 3) frameLength];
  if (v10)
  {
    if ((v10 & 7) != 0) {
      -[NSInvocation copyWithZone:]();
    }
    for (uint64_t j = 0; j != 64; j += 8)
      ;
  }
  *((void *)v5 + 6) = v11;
  return v5;
}

- (void)_addAttachedObject:(id)a3
{
  if (a3)
  {
    container = self->_container;
    if (!container)
    {
      container = (NSMutableArray *)objc_opt_new();
      self->_container = container;
    }
    [(NSMutableArray *)container addObject:a3];
  }
}

- (SEL)selector
{
  v3[1] = *(void *)off_1ECE0A5B0;
  v3[0] = 0;
  [(NSInvocation *)self getArgument:v3 atIndex:1];
  return (SEL)v3[0];
}

- (void)retainArguments
{
  qword_1EC093AA8 = (uint64_t)"Corrupt NSInvocation detected.";
  __break(1u);
}

+ (id)_invocationWithMethodSignature:(id)a3 frame:(void *)a4
{
  if (!a3)
  {
    uint64_t v20 = __CFExceptionProem((objc_class *)a1, a2);
    CFStringRef v18 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: method signature argument cannot be nil", v20);
    goto LABEL_17;
  }
  unint64_t v8 = [a3 frameLength];
  size_t v9 = v8 + 320;
  uint64_t v10 = v8 >= 0xFFFFFFFFFFFFFEC0;
  uint64_t v11 = v10 << 63 >> 63;
  if (v11 != v10 || v11 < 0)
  {
    uint64_t v21 = __CFExceptionProem((objc_class *)a1, a2);
    CFStringRef v18 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"Overflow while allocating space for method signature %@", v21);
LABEL_17:
    v19 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v18) userInfo:0];
    objc_exception_throw(v19);
  }
  id v12 = objc_alloc((Class)a1);
  *((void *)v12 + 3) = a3;
  v13 = (char *)malloc_type_calloc(1uLL, v9, 0x1E404CA8uLL);
  *((void *)v12 + 1) = v13 + 320;
  *((void *)v12 + 2) = v13;
  *((void *)v12 + 4) = 0;
  if (magic_cookie_oGuard != -1) {
    dispatch_once(&magic_cookie_oGuard, &__block_literal_global_29);
  }
  *((_DWORD *)v12 + 14) = magic_cookie_oValue;
  if (a4) {
    memmove(*((void **)v12 + 1), a4, [a3 frameLength]);
  }
  *((unsigned char *)v12 + 60) = 0;
  [*((id *)v12 + 3) numberOfArguments];
  objc_opt_class();
  uint64_t v14 = [*((id *)v12 + 3) frameLength];
  if (v14)
  {
    if ((v14 & 7) != 0) {
      +[NSInvocation _invocationWithMethodSignature:frame:]();
    }
    for (uint64_t i = 0; i != 64; i += 8)
      ;
  }
  *((void *)v12 + 6) = v15;

  return v12;
}

- (void)invoke
{
  qword_1EC093AA8 = (uint64_t)"Corrupt NSInvocation detected.";
  __break(1u);
}

- (void)setArgument:(void *)argumentLocation atIndex:(NSInteger)idx
{
  NSInteger v8 = [(NSMethodSignature *)self->_signature numberOfArguments];
  NSInteger v9 = v8;
  if (idx < -1 || v8 <= idx)
  {
    uint64_t v23 = __CFExceptionProem((objc_class *)self, a2);
    CFStringRef v21 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: index (%ld) out of bounds [-1, %ld]", v23, idx, v9 - 1);
    goto LABEL_28;
  }
  [(NSMethodSignature *)self->_signature numberOfArguments];
  objc_opt_class();
  NSUInteger v10 = [(NSMethodSignature *)self->_signature frameLength];
  if (v10)
  {
    if ((v10 & 7) != 0) {
      -[NSInvocation setArgument:atIndex:]();
    }
    for (uint64_t i = 0; i != 64; i += 8)
      ;
  }
  if (v11 != self->_pac_signature) {
    _NSIPoisoned();
  }
  v13 = [(NSMethodSignature *)self->_signature _argInfo:idx];
  if (!argumentLocation)
  {
    uint64_t v24 = __CFExceptionProem((objc_class *)self, a2);
    CFStringRef v21 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: NULL address argument", v24);
LABEL_28:
    v22 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v21) userInfo:0];
    objc_exception_throw(v22);
  }
  uint64_t v14 = (const UInt8 *)v13;
  if ((idx & 0x8000000000000000) == 0)
  {
    frame = self->_frame;
LABEL_11:
    __NSICreateBackingForArgumentIfNeeded((uint64_t)self, (uint64_t)v13, idx, 0);
    goto LABEL_16;
  }
  __int16 v16 = *((_WORD *)v13 + 17);
  uint64_t v17 = 8;
  if ((v16 & 0x80) == 0) {
    uint64_t v17 = 16;
  }
  frame = *(Class *)((char *)&self->super.isa + v17);
  if ((v16 & 0x80) != 0 && !*(void *)((char *)self->_frame + v13->var5 + v13->var6)) {
    goto LABEL_11;
  }
LABEL_16:
  __NSI2((uint64_t)v14, (uint64_t)frame, (__int16 *)argumentLocation, 1);
  if (self->_retainedArgs || idx == -1 && !_CFExecutableLinkedOnOrAfter(5uLL)) {
    __NSI3(v14, (uint64_t)frame, (id *)&self->_container, 1);
  }
  [(NSMethodSignature *)self->_signature numberOfArguments];
  objc_opt_class();
  NSUInteger v18 = [(NSMethodSignature *)self->_signature frameLength];
  if (v18)
  {
    if ((v18 & 7) != 0) {
      -[NSInvocation setArgument:atIndex:]();
    }
    for (uint64_t j = 0; j != 64; j += 8)
      ;
  }
  self->_pac_signature = v19;
}

- (void)getArgument:(void *)argumentLocation atIndex:(NSInteger)idx
{
  retdata = self->_retdata;
  signature = self->_signature;
  frame = self->_frame;
  NSInteger v10 = [(NSMethodSignature *)signature numberOfArguments];
  if (idx < -1 || v10 <= idx)
  {
    NSInteger v12 = v10;
    uint64_t v15 = __CFExceptionProem((objc_class *)self, sel_getArgument_atIndex_);
    CFStringRef v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: index (%ld) out of bounds [-1, %ld]", v15, idx, v12 - 1);
    goto LABEL_10;
  }
  if (!argumentLocation)
  {
    uint64_t v16 = __CFExceptionProem((objc_class *)self, sel_getArgument_atIndex_);
    CFStringRef v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: NULL address argument", v16);
LABEL_10:
    uint64_t v14 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v13) userInfo:0];
    objc_exception_throw(v14);
  }
  uint64_t v11 = [(NSMethodSignature *)signature _argInfo:idx];
  if ((idx & 0x8000000000000000) == 0 || (*(_WORD *)(v11 + 34) & 0x80) != 0) {
    retdata = frame;
  }
  __NSI1(v11, (uint64_t)retdata, argumentLocation, 1);
}

- (void)dealloc
{
  uint64_t v5 = *(void *)off_1ECE0A5B0;
  if (self->_stackAllocated == 1)
  {

    objc_destructInstance(self);
  }
  else
  {
    retdata = self->_retdata;
    if (retdata) {
      free(retdata);
    }
    self->_frame = 0;
    self->_retdata = 0;

    v4.receiver = self;
    v4.super_class = (Class)NSInvocation;
    [(NSInvocation *)&v4 dealloc];
  }
}

- (uint64_t)_initWithMethodSignature:(const void *)a3 frame:(void *)a4 buffer:(size_t)a5 size:
{
  if (a1)
  {
    if ([a2 frameLength] + 320 > a5)
    {
      __break(1u);
    }
    else
    {
      *(void *)(a1 + 24) = a2;
      *(void *)(a1 + 32) = 0;
      *(void *)(a1 + 16) = a4;
      bzero(a4, a5);
      *(void *)(a1 + 8) = *(void *)(a1 + 16) + 320;
      if (magic_cookie_oGuard != -1) {
        dispatch_once(&magic_cookie_oGuard, &__block_literal_global_29);
      }
      *(_DWORD *)(a1 + 56) = magic_cookie_oValue;
      if (a3) {
        memmove(*(void **)(a1 + 8), a3, [a2 frameLength]);
      }
      *(_WORD *)(a1 + 60) = 256;
      [*(id *)(a1 + 24) numberOfArguments];
      objc_opt_class();
      uint64_t v10 = [*(id *)(a1 + 24) frameLength];
      if (!v10) {
        goto LABEL_11;
      }
      if ((v10 & 7) == 0)
      {
        for (uint64_t i = 0; i != 64; i += 8)
          ;
LABEL_11:
        *(void *)(a1 + 48) = v11;
        return a1;
      }
    }
    -[NSInvocation _initWithMethodSignature:frame:buffer:size:]();
  }
  return a1;
}

- (void)setReturnValue:(void *)retLoc
{
}

- (void)setSelector:(SEL)selector
{
  v3[1] = *(void *)off_1ECE0A5B0;
  v3[0] = selector;
  [(NSInvocation *)self setArgument:v3 atIndex:1];
}

- (void)invokeWithTarget:(id)target
{
  v4[1] = *(void *)off_1ECE0A5B0;
  v4[0] = target;
  [(NSInvocation *)self setArgument:v4 atIndex:0];
  [(NSInvocation *)self invoke];
}

- (void)setTarget:(id)target
{
  v3[1] = *(void *)off_1ECE0A5B0;
  v3[0] = target;
  [(NSInvocation *)self setArgument:v3 atIndex:0];
}

+ (uint64_t)requiredStackSizeForSignature:(uint64_t)a1
{
  return [a2 frameLength] + 320;
}

- (NSInvocation)init
{
  return 0;
}

- (void)_initWithMethodSignature:frame:buffer:size:.cold.1()
{
  qword_1EC093AA8 = (uint64_t)"Corrupt NSInvocation detected. Contract violation. frameLength not a multiple of uintptr_t.";
  __break(1u);
}

+ (void)_invocationWithMethodSignature:frame:.cold.1()
{
  qword_1EC093AA8 = (uint64_t)"Corrupt NSInvocation detected. Contract violation. frameLength not a multiple of uintptr_t.";
  __break(1u);
}

- (void)copyWithZone:.cold.1()
{
  qword_1EC093AA8 = (uint64_t)"Corrupt NSInvocation detected. Contract violation. frameLength not a multiple of uintptr_t.";
  __break(1u);
}

- (void)copyWithZone:.cold.2()
{
  qword_1EC093AA8 = (uint64_t)"Corrupt NSInvocation detected. Contract violation. frameLength not a multiple of uintptr_t.";
  __break(1u);
}

- (void)copyWithZone:.cold.3()
{
  qword_1EC093AA8 = (uint64_t)"Corrupt NSInvocation detected.";
  __break(1u);
}

- (void)setArgument:atIndex:.cold.1()
{
  qword_1EC093AA8 = (uint64_t)"Corrupt NSInvocation detected. Contract violation. frameLength not a multiple of uintptr_t.";
  __break(1u);
}

- (void)setArgument:atIndex:.cold.2()
{
  qword_1EC093AA8 = (uint64_t)"Corrupt NSInvocation detected. Contract violation. frameLength not a multiple of uintptr_t.";
  __break(1u);
}

- (void)invokeUsingIMP:.cold.1()
{
  qword_1EC093AA8 = (uint64_t)"Corrupt NSInvocation detected. Contract violation. frameLength not a multiple of uintptr_t.";
  __break(1u);
}

- (void)invokeUsingIMP:.cold.2()
{
  qword_1EC093AA8 = (uint64_t)"Corrupt NSInvocation detected.";
  __break(1u);
}

@end