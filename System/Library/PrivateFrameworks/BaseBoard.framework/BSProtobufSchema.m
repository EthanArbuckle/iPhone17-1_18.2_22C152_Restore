@interface BSProtobufSchema
- (BSProtobufSchema)init;
- (uint64_t)_addSubclassesForField:(void *)a3 allowedSubclasses:(int)a4 assertSubclassRelationship:;
- (void)addField:(const char *)a3;
- (void)addField:(const char *)a3 allowedClasses:(id)a4;
- (void)addField:(const char *)a3 forTag:(int64_t)a4;
- (void)addRepeatingField:(const char *)a3 containsClass:(Class)a4;
- (void)addRepeatingField:(const char *)a3 containsClass:(Class)a4 forTag:(int64_t)a5;
- (void)addRepeatingField:(const char *)a3 containsClasses:(id)a4;
- (void)addRepeatingField:(uint64_t)a3 forTag:(void *)a4 allowedClasses:;
- (void)dealloc;
- (void)setAcceptableConcreteSubclasses:(id)a3;
@end

@implementation BSProtobufSchema

- (void)addField:(const char *)a3 forTag:(int64_t)a4
{
  unsigned int v4 = a4;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  BSProtobufValidateIncomingTag((uint64_t)self, a4);
  if (self)
  {
    [(NSMutableData *)self->_memoryData increaseLengthBy:96];
    v8 = [(NSMutableData *)self->_memoryData mutableBytes];
    self->_entries = v8;
    int64_t fieldCount = self->_fieldCount;
    v10 = &v8[fieldCount];
    self->_int64_t fieldCount = fieldCount + 1;
  }
  else
  {
    v10 = 0;
  }
  v10->var0 = v4;
  rootClass = self->_rootClass;
  InstanceVariable = class_getInstanceVariable(rootClass, a3);
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  TypeEncoding = ivar_getTypeEncoding(InstanceVariable);
  if (!InstanceVariable)
  {
    v30 = (void *)[NSString stringWithFormat:@"missing ivar on class %@: %s", rootClass, a3];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      uint64_t v35 = objc_msgSend(NSString, "stringWithUTF8String:", "void _BSProtobufGetIvarDetails(Class, const char * _Nonnull, Ivar * _Nonnull, ptrdiff_t * _Nonnull, const char ** _Nonnull)");
      __int16 v36 = 2114;
      v37 = @"BSProtobufSerialization.m";
      __int16 v38 = 1024;
      *(_DWORD *)v39 = 335;
      *(_WORD *)&v39[4] = 2114;
      *(void *)&v39[6] = v30;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1E911F420 = [v30 UTF8String];
    __break(0);
    JUMPOUT(0x18AADC7B8);
  }
  if (!Offset)
  {
    v31 = objc_msgSend(NSString, "stringWithFormat:", @"missing offset for %s", a3);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      uint64_t v35 = objc_msgSend(NSString, "stringWithUTF8String:", "void _BSProtobufGetIvarDetails(Class, const char * _Nonnull, Ivar * _Nonnull, ptrdiff_t * _Nonnull, const char ** _Nonnull)");
      __int16 v36 = 2114;
      v37 = @"BSProtobufSerialization.m";
      __int16 v38 = 1024;
      *(_DWORD *)v39 = 336;
      *(_WORD *)&v39[4] = 2114;
      *(void *)&v39[6] = v31;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1E911F420 = [v31 UTF8String];
    __break(0);
    JUMPOUT(0x18AADC874);
  }
  v15 = TypeEncoding;
  if (!TypeEncoding)
  {
    v32 = (void *)[NSString stringWithFormat:@"missing encoding for ivar %@: %s", rootClass, a3];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      uint64_t v35 = objc_msgSend(NSString, "stringWithUTF8String:", "void _BSProtobufGetIvarDetails(Class, const char * _Nonnull, Ivar * _Nonnull, ptrdiff_t * _Nonnull, const char ** _Nonnull)");
      __int16 v36 = 2114;
      v37 = @"BSProtobufSerialization.m";
      __int16 v38 = 1024;
      *(_DWORD *)v39 = 337;
      *(_WORD *)&v39[4] = 2114;
      *(void *)&v39[6] = v32;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1E911F420 = [v32 UTF8String];
    __break(0);
    JUMPOUT(0x18AADC930);
  }
  v10->var2 = Offset;
  v10->var3 = InstanceVariable;
  v10->var1 = (char *)TypeEncoding;
  size_t v16 = strlen(TypeEncoding);
  int v17 = *(unsigned __int8 *)v15;
  if (v16 < 4 || v17 != 64)
  {
    uint64_t v24 = ((char)v17 - 66);
    if (v24 <= 0x39
      && (((1 << v24) & 0x2849600028483) != 0
       || v24 == 57
       && (!strncmp("{CGPoint=", v15, 9uLL)
        || !strncmp("{CGRect=", v15, 8uLL)
        || !strncmp("{CGSize=", v15, 8uLL)
        || !strncmp("{CGAffineTransform=", v15, 0x13uLL)
        || !strncmp("{CATransform3D=", v15, 0xFuLL))))
    {
      v10->var6 = _BSProtobufEncodePOD;
      v10->var7 = _BSProtobufDecodePOD;
      v10->var4 = 0;
      return;
    }
LABEL_35:
    v27 = objc_msgSend(NSString, "stringWithFormat:", @"%s: Unsupported encoding type %s", a3, v15);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v28 = NSStringFromSelector(a2);
      v29 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 138544642;
      uint64_t v35 = (uint64_t)v28;
      __int16 v36 = 2114;
      v37 = (__CFString *)NSStringFromClass(v29);
      __int16 v38 = 2048;
      *(void *)v39 = self;
      *(_WORD *)&v39[8] = 2114;
      *(void *)&v39[10] = @"BSProtobufSerialization.m";
      __int16 v40 = 1024;
      int v41 = 405;
      __int16 v42 = 2114;
      v43 = v27;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v27 UTF8String];
    __break(0);
    JUMPOUT(0x18AADC6FCLL);
  }
  if (v15[1] != 34 || v15[v16 - 1] != 34) {
    goto LABEL_35;
  }
  v18 = (NSString *)[[NSString alloc] initWithBytes:v15 + 2 length:v16 - 3 encoding:4];
  Class v19 = NSClassFromString(v18);
  if (!v19)
  {
    v33 = (void *)[NSString stringWithFormat:@"cannot find class: %@", v18];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      uint64_t v35 = [NSString stringWithUTF8String:"Class  _Nullable _BSGetClassFromEncoding(const char *)"];
      __int16 v36 = 2114;
      v37 = @"BSProtobufSerialization.m";
      __int16 v38 = 1024;
      *(_DWORD *)v39 = 255;
      *(_WORD *)&v39[4] = 2114;
      *(void *)&v39[6] = v33;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1E911F420 = [v33 UTF8String];
    __break(0);
    JUMPOUT(0x18AADC9E8);
  }
  Class v20 = v19;

  if (v20 == (Class)objc_opt_class())
  {
    v10->var6 = _BSProtobufEncodeString;
    v25 = _BSProtobufDecodeString;
LABEL_22:
    v10->var7 = v25;
    v10->var4 = v20;
    return;
  }
  if (v20 == (Class)objc_opt_class())
  {
    v10->var6 = _BSProtobufEncodeData;
    v25 = _BSProtobufDecodeData;
    goto LABEL_22;
  }
  v21 = _BSProtobufValidateClassForEncoding((uint64_t)a3, v20);
  v10->var6 = _BSProtobufEncodeObject;
  v10->var7 = _BSProtobufDecodeObject;
  v10->var4 = v21;
  uint64_t v22 = [(objc_class *)v21 protobufSchema];
  v23 = (void *)v22;
  while (1)
  {
    v23 = (void *)v23[2];
    if (!v23) {
      break;
    }
    if (v23[7]) {
      goto LABEL_25;
    }
  }
  v23 = (void *)v22;
LABEL_25:
  v26 = (void *)v23[8];
  if (v26)
  {
    -[BSProtobufSchema _addSubclassesForField:allowedSubclasses:assertSubclassRelationship:]((uint64_t)self, (uint64_t)a3, v26, 1);
  }
}

- (void)addField:(const char *)a3 allowedClasses:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  int64_t autotagIndex = self->_autotagIndex;
  int64_t fieldCount = self->_fieldCount;
  unsigned int v7 = autotagIndex + 1;
  self->_int64_t autotagIndex = autotagIndex + 1;
  [(NSMutableData *)self->_memoryData increaseLengthBy:96];
  v8 = [(NSMutableData *)self->_memoryData mutableBytes];
  self->_entries = v8;
  int64_t v9 = self->_fieldCount;
  v10 = &v8[v9];
  self->_int64_t fieldCount = v9 + 1;
  v10->var0 = v7;
  rootClass = self->_rootClass;
  InstanceVariable = class_getInstanceVariable(rootClass, a3);
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  TypeEncoding = ivar_getTypeEncoding(InstanceVariable);
  if (!InstanceVariable)
  {
    uint64_t v22 = (void *)[NSString stringWithFormat:@"missing ivar on class %@: %s", rootClass, a3];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      uint64_t v33 = objc_msgSend(NSString, "stringWithUTF8String:", "void _BSProtobufGetIvarDetails(Class, const char * _Nonnull, Ivar * _Nonnull, ptrdiff_t * _Nonnull, const char ** _Nonnull)");
      __int16 v34 = 2114;
      uint64_t v35 = @"BSProtobufSerialization.m";
      __int16 v36 = 1024;
      *(_DWORD *)v37 = 335;
      *(_WORD *)&v37[4] = 2114;
      *(void *)&v37[6] = v22;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1E911F420 = [v22 UTF8String];
    __break(0);
    JUMPOUT(0x18AAF9F78);
  }
  if (!Offset)
  {
    v23 = objc_msgSend(NSString, "stringWithFormat:", @"missing offset for %s", a3);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      uint64_t v33 = objc_msgSend(NSString, "stringWithUTF8String:", "void _BSProtobufGetIvarDetails(Class, const char * _Nonnull, Ivar * _Nonnull, ptrdiff_t * _Nonnull, const char ** _Nonnull)");
      __int16 v34 = 2114;
      uint64_t v35 = @"BSProtobufSerialization.m";
      __int16 v36 = 1024;
      *(_DWORD *)v37 = 336;
      *(_WORD *)&v37[4] = 2114;
      *(void *)&v37[6] = v23;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1E911F420 = [v23 UTF8String];
    __break(0);
    JUMPOUT(0x18AAFA034);
  }
  v15 = TypeEncoding;
  if (!TypeEncoding)
  {
    uint64_t v24 = (void *)[NSString stringWithFormat:@"missing encoding for ivar %@: %s", rootClass, a3];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      uint64_t v33 = objc_msgSend(NSString, "stringWithUTF8String:", "void _BSProtobufGetIvarDetails(Class, const char * _Nonnull, Ivar * _Nonnull, ptrdiff_t * _Nonnull, const char ** _Nonnull)");
      __int16 v34 = 2114;
      uint64_t v35 = @"BSProtobufSerialization.m";
      __int16 v36 = 1024;
      *(_DWORD *)v37 = 337;
      *(_WORD *)&v37[4] = 2114;
      *(void *)&v37[6] = v24;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1E911F420 = [v24 UTF8String];
    __break(0);
    JUMPOUT(0x18AAFA0F0);
  }
  v10->var3 = InstanceVariable;
  v10->var2 = Offset;
  v10->var1 = (char *)TypeEncoding;
  size_t v16 = strlen(TypeEncoding);
  if (v16 < 4 || *v15 != 64 || v15[1] != 34 || v15[v16 - 1] != 34)
  {
    v26 = objc_msgSend(NSString, "stringWithFormat:", @"ivar '%s' is not a class type and cannot be subclassed", a3);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v27 = NSStringFromSelector(a2);
      v28 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 138544642;
      uint64_t v33 = (uint64_t)v27;
      __int16 v34 = 2114;
      uint64_t v35 = (__CFString *)NSStringFromClass(v28);
      __int16 v36 = 2048;
      *(void *)v37 = self;
      *(_WORD *)&v37[8] = 2114;
      *(void *)&v37[10] = @"BSProtobufSerialization.m";
      __int16 v38 = 1024;
      int v39 = 492;
      __int16 v40 = 2114;
      int v41 = v26;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v26 UTF8String];
    __break(0);
    JUMPOUT(0x18AAFA280);
  }
  int v17 = (NSString *)[[NSString alloc] initWithBytes:v15 + 2 length:v16 - 3 encoding:4];
  Class v18 = NSClassFromString(v17);
  if (!v18)
  {
    v25 = (void *)[NSString stringWithFormat:@"cannot find class: %@", v17];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      uint64_t v33 = [NSString stringWithUTF8String:"Class  _Nullable _BSGetClassFromEncoding(const char *)"];
      __int16 v34 = 2114;
      uint64_t v35 = @"BSProtobufSerialization.m";
      __int16 v36 = 1024;
      *(_DWORD *)v37 = 255;
      *(_WORD *)&v37[4] = 2114;
      *(void *)&v37[6] = v25;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1E911F420 = [v25 UTF8String];
    __break(0);
    JUMPOUT(0x18AAFA1A8);
  }
  Class v19 = v18;

  Class v20 = _BSProtobufValidateClassForEncoding((uint64_t)a3, v19);
  v21 = &v8[v9];
  v21->var4 = v20;
  v21->var6 = _BSProtobufEncodeObject;
  v21->var7 = _BSProtobufDecodeObject;
  -[BSProtobufSchema _addSubclassesForField:allowedSubclasses:assertSubclassRelationship:]((uint64_t)self, (uint64_t)a3, a4, 1);
  if (([a4 containsObject:v19] & 1) == 0) {
    self->_entries[fieldCount].var9 = 1;
  }
}

- (uint64_t)_addSubclassesForField:(void *)a3 allowedSubclasses:(int)a4 assertSubclassRelationship:
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)(result + 24) - 1;
    size_t v6 = [a3 count];
    [*(id *)(v4 + 48) increaseLengthBy:96 * v6];
    uint64_t v7 = [*(id *)(v4 + 48) mutableBytes];
    *(void *)(v4 + 40) = v7;
    uint64_t v8 = *(void *)(v4 + 24);
    *(void *)(v4 + 24) = v8 + v6;
    uint64_t v9 = v7 + 96 * v5;
    *(void *)(v9 + 64) = v6;
    uint64_t v34 = v9;
    *(void *)(v9 + 72) = malloc_type_calloc(v6, 8uLL, 0x2004093837F09uLL);
    uint64_t v33 = (void *)(v9 + 72);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    result = [a3 countByEnumeratingWithState:&v37 objects:v53 count:16];
    if (result)
    {
      uint64_t v10 = result;
      uint64_t v11 = 0;
      uint64_t v32 = *(void *)v38;
      uint64_t v12 = v7 + 96 * v5;
      v28 = (void *)(v12 + 32);
      v31 = (_OWORD *)(v12 + 40);
      v30 = (void *)(v12 + 24);
      v13 = (void *)(v12 + 16);
      v14 = (void *)(v12 + 8);
      v15 = (void *)(v12 + 56);
      uint64_t v27 = v7 + 96 * v8 + 88;
      do
      {
        uint64_t v16 = 0;
        int v17 = (unsigned char *)(v27 + 96 * v11);
        do
        {
          if (*(void *)v38 != v32) {
            objc_enumerationMutation(a3);
          }
          Class v18 = *(void **)(*((void *)&v37 + 1) + 8 * v16);
          uint64_t v19 = *(void *)(v4 + 32);
          int v20 = v19 + 1;
          *(void *)(v4 + 32) = v19 + 1;
          BSProtobufValidateIncomingTag(v4, (v19 + 1));
          if (a4 && ([v18 isSubclassOfClass:*v28] & 1) == 0)
          {
            v23 = (void *)[NSString stringWithFormat:@"'%@' must be a subclass of '%@'", v18, *v28];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              uint64_t v24 = NSStringFromSelector(sel__addSubclassesForField_allowedSubclasses_assertSubclassRelationship_);
              v25 = (objc_class *)objc_opt_class();
              v26 = NSStringFromClass(v25);
              *(_DWORD *)buf = 138544642;
              uint64_t v42 = v24;
              __int16 v43 = 2114;
              uint64_t v44 = v26;
              __int16 v45 = 2048;
              uint64_t v46 = v4;
              __int16 v47 = 2114;
              v48 = @"BSProtobufSerialization.m";
              __int16 v49 = 1024;
              int v50 = 454;
              __int16 v51 = 2114;
              v52 = v23;
              _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
            }
            qword_1E911F420 = [v23 UTF8String];
            __break(0);
            JUMPOUT(0x18AAFA5CCLL);
          }
          v21 = _BSProtobufValidateClassForEncoding(a2, v18);
          *((_DWORD *)v17 - 22) = v20;
          uint64_t v22 = v17 - 88;
          *((void *)v17 - 7) = v21;
          *((void *)v17 - 8) = *v30;
          *((void *)v17 - 9) = *v13;
          *((void *)v17 - 10) = *v14;
          *((_OWORD *)v17 - 3) = *v31;
          *((void *)v17 - 4) = *v15;
          *((void *)v17 - 1) = v34;
          *int v17 = 1;
          v17 += 96;
          *(void *)(*v33 + 8 * v11++) = v22;
          ++v16;
        }
        while (v10 != v16);
        result = [a3 countByEnumeratingWithState:&v37 objects:v53 count:16];
        uint64_t v10 = result;
      }
      while (result);
    }
  }
  return result;
}

- (BSProtobufSchema)init
{
  v4.receiver = self;
  v4.super_class = (Class)BSProtobufSchema;
  v2 = [(BSProtobufSchema *)&v4 init];
  if (v2) {
    v2->_memoryData = (NSMutableData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
  }
  return v2;
}

- (void)dealloc
{
  int64_t fieldCount = self->_fieldCount;
  if (fieldCount >= 1)
  {
    uint64_t v4 = 72;
    do
    {
      uint64_t v5 = *(void **)((char *)&self->_entries->var0 + v4);
      if (v5) {
        free(v5);
      }
      v4 += 96;
      --fieldCount;
    }
    while (fieldCount);
  }

  v6.receiver = self;
  v6.super_class = (Class)BSProtobufSchema;
  [(BSProtobufSchema *)&v6 dealloc];
}

- (void)addField:(const char *)a3
{
}

- (void)addRepeatingField:(const char *)a3 containsClass:(Class)a4
{
  v5[1] = *MEMORY[0x1E4F143B8];
  int64_t v4 = self->_autotagIndex + 1;
  self->_int64_t autotagIndex = v4;
  v5[0] = a4;
  -[BSProtobufSchema addRepeatingField:forTag:allowedClasses:]((uint64_t)self, a3, v4, (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1]);
}

- (void)addRepeatingField:(uint64_t)a3 forTag:(void *)a4 allowedClasses:
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  uint64_t v8 = (objc_class *)[a4 firstObject];
  if (v8 != (objc_class *)objc_opt_class()
    && v8 != (objc_class *)objc_opt_class()
    && v8 != (objc_class *)objc_opt_class()
    && v8 != (objc_class *)objc_opt_class())
  {
    uint64_t v8 = _BSProtobufValidateClassForEncoding((uint64_t)a2, v8);
  }
  if (a3 < 1)
  {
    long long v39 = @"tag must be > 0";
    goto LABEL_68;
  }
  if ((unint64_t)(a3 - 19000) < 0x3E8)
  {
    long long v39 = @"tag must not be between 19000 and 19999, inclusive";
    goto LABEL_68;
  }
  uint64_t v44 = v8;
  if ((unint64_t)a3 >> 29)
  {
    long long v39 = @"tag must be <= ((2^29) - 1)";
LABEL_68:
    long long v40 = (void *)[NSString stringWithFormat:@"%@", v39];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v41 = NSStringFromSelector(sel_addRepeatingField_forTag_allowedClasses_);
      uint64_t v42 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 138544642;
      uint64_t v51 = (uint64_t)v41;
      __int16 v52 = 2114;
      v53 = (__CFString *)NSStringFromClass(v42);
      __int16 v54 = 2048;
      *(void *)v55 = a1;
      *(_WORD *)&v55[8] = 2114;
      *(void *)&v55[10] = @"BSProtobufSerialization.m";
      __int16 v56 = 1024;
      int v57 = 531;
      __int16 v58 = 2114;
      v59 = v40;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v40 UTF8String];
    __break(0);
    JUMPOUT(0x18AB3A96CLL);
  }
  [*(id *)(a1 + 48) increaseLengthBy:96];
  uint64_t v9 = [*(id *)(a1 + 48) mutableBytes];
  *(void *)(a1 + 40) = v9;
  uint64_t v10 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = v10 + 1;
  uint64_t v11 = *(objc_class **)(a1 + 8);
  uint64_t v43 = (uint64_t)a2;
  InstanceVariable = class_getInstanceVariable(v11, a2);
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  TypeEncoding = ivar_getTypeEncoding(InstanceVariable);
  if (!InstanceVariable)
  {
    uint64_t v32 = (void *)[NSString stringWithFormat:@"missing ivar on class %@: %s", v11, v43];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      uint64_t v51 = objc_msgSend(NSString, "stringWithUTF8String:", "void _BSProtobufGetIvarDetails(Class, const char * _Nonnull, Ivar * _Nonnull, ptrdiff_t * _Nonnull, const char ** _Nonnull)");
      __int16 v52 = 2114;
      v53 = @"BSProtobufSerialization.m";
      __int16 v54 = 1024;
      *(_DWORD *)v55 = 335;
      *(_WORD *)&v55[4] = 2114;
      *(void *)&v55[6] = v32;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1E911F420 = [v32 UTF8String];
    __break(0);
    JUMPOUT(0x18AB3A54CLL);
  }
  if (!Offset)
  {
    uint64_t v33 = objc_msgSend(NSString, "stringWithFormat:", @"missing offset for %s", v43);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      uint64_t v51 = objc_msgSend(NSString, "stringWithUTF8String:", "void _BSProtobufGetIvarDetails(Class, const char * _Nonnull, Ivar * _Nonnull, ptrdiff_t * _Nonnull, const char ** _Nonnull)");
      __int16 v52 = 2114;
      v53 = @"BSProtobufSerialization.m";
      __int16 v54 = 1024;
      *(_DWORD *)v55 = 336;
      *(_WORD *)&v55[4] = 2114;
      *(void *)&v55[6] = v33;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1E911F420 = [v33 UTF8String];
    __break(0);
    JUMPOUT(0x18AB3A610);
  }
  v15 = TypeEncoding;
  if (!TypeEncoding)
  {
    uint64_t v34 = (void *)[NSString stringWithFormat:@"missing encoding for ivar %@: %s", v11, v43];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      uint64_t v51 = objc_msgSend(NSString, "stringWithUTF8String:", "void _BSProtobufGetIvarDetails(Class, const char * _Nonnull, Ivar * _Nonnull, ptrdiff_t * _Nonnull, const char ** _Nonnull)");
      __int16 v52 = 2114;
      v53 = @"BSProtobufSerialization.m";
      __int16 v54 = 1024;
      *(_DWORD *)v55 = 337;
      *(_WORD *)&v55[4] = 2114;
      *(void *)&v55[6] = v34;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1E911F420 = [v34 UTF8String];
    __break(0);
    JUMPOUT(0x18AB3A6D4);
  }
  uint64_t v16 = v9 + 96 * v10;
  *(void *)(v16 + 24) = InstanceVariable;
  *(void *)(v16 + 16) = Offset;
  *(void *)(v16 + 8) = TypeEncoding;
  size_t v17 = strlen(TypeEncoding);
  if (v17 >= 4 && *v15 == 64 && v15[1] == 34 && v15[v17 - 1] == 34)
  {
    Class v18 = (NSString *)[[NSString alloc] initWithBytes:v15 + 2 length:v17 - 3 encoding:4];
    Class v19 = NSClassFromString(v18);
    if (!v19)
    {
      long long v38 = (void *)[NSString stringWithFormat:@"cannot find class: %@", v18];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138544130;
        uint64_t v51 = [NSString stringWithUTF8String:"Class  _Nullable _BSGetClassFromEncoding(const char *)"];
        __int16 v52 = 2114;
        v53 = @"BSProtobufSerialization.m";
        __int16 v54 = 1024;
        *(_DWORD *)v55 = 255;
        *(_WORD *)&v55[4] = 2114;
        *(void *)&v55[6] = v38;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
      }
      qword_1E911F420 = [v38 UTF8String];
      __break(0);
      JUMPOUT(0x18AB3A870);
    }
    uint64_t v20 = (uint64_t)v19;
  }
  else
  {
    uint64_t v20 = 0;
  }
  if (v20 != objc_opt_class()
    && v20 != objc_opt_class()
    && v20 != objc_opt_class()
    && v20 != objc_opt_class()
    && v20 != objc_opt_class()
    && v20 != objc_opt_class())
  {
    uint64_t v35 = (void *)[NSString stringWithFormat:@"repeating field must be an array or set type"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v36 = NSStringFromSelector(sel_addRepeatingField_forTag_allowedClasses_);
      long long v37 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 138544642;
      uint64_t v51 = (uint64_t)v36;
      __int16 v52 = 2114;
      v53 = (__CFString *)NSStringFromClass(v37);
      __int16 v54 = 2048;
      *(void *)v55 = a1;
      *(_WORD *)&v55[8] = 2114;
      *(void *)&v55[10] = @"BSProtobufSerialization.m";
      __int16 v56 = 1024;
      int v57 = 542;
      __int16 v58 = 2114;
      v59 = v35;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v35 UTF8String];
    __break(0);
    JUMPOUT(0x18AB3A7ACLL);
  }
  if (v20 == objc_opt_class())
  {
    v21 = v44;
  }
  else if (v20 == objc_opt_class())
  {
    v21 = v44;
  }
  else
  {
    v21 = v44;
    if (v20 != objc_opt_class()) {
      goto LABEL_33;
    }
  }
  uint64_t v20 = objc_opt_class();
LABEL_33:
  uint64_t v22 = (void *)(v9 + 96 * v10);
  v22[4] = v21;
  v22[5] = v20;
  *(_DWORD *)uint64_t v16 = a3;
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = v22 + 6;
  v25 = v22 + 7;
  if (v21 == (objc_class *)v23)
  {
    *uint64_t v24 = _BSProtobufEncodeRepeatFieldString;
    void *v25 = _BSProtobufDecodeRepeatFieldString;
  }
  else
  {
    *uint64_t v24 = _BSProtobufEncodeRepeatFieldObject;
    void *v25 = _BSProtobufDecodeRepeatFieldObject;
    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v27 = [a4 countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v46 != v29) {
            objc_enumerationMutation(a4);
          }
          v31 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          if (*(void *)([v31 protobufSchema] + 64)) {
            objc_msgSend(v26, "addObjectsFromArray:");
          }
          else {
            [v26 addObject:v31];
          }
        }
        uint64_t v28 = [a4 countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v28);
    }
    if ((unint64_t)[v26 count] > 1 || (objc_class *)objc_msgSend(v26, "firstObject") != v21) {
      -[BSProtobufSchema _addSubclassesForField:allowedSubclasses:assertSubclassRelationship:](a1, v43, v26, 0);
    }
  }
}

- (void)addRepeatingField:(const char *)a3 containsClasses:(id)a4
{
  int64_t v5 = self->_autotagIndex + 1;
  self->_int64_t autotagIndex = v5;
  -[BSProtobufSchema addRepeatingField:forTag:allowedClasses:]((uint64_t)self, a3, v5, a4);
}

- (void)addRepeatingField:(const char *)a3 containsClass:(Class)a4 forTag:(int64_t)a5
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = a4;
  -[BSProtobufSchema addRepeatingField:forTag:allowedClasses:]((uint64_t)self, a3, a5, (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1]);
}

- (void)setAcceptableConcreteSubclasses:(id)a3
{
  int64_t v5 = objc_alloc_init(BSProtobufSchema);
  int64_t autotagIndex = v5->_autotagIndex;
  int v7 = autotagIndex + 1;
  v5->_int64_t autotagIndex = autotagIndex + 1;
  [(NSMutableData *)v5->_memoryData increaseLengthBy:96];
  uint64_t v8 = [(NSMutableData *)v5->_memoryData mutableBytes];
  v5->_entries = (_BSProtobufFieldEntry *)v8;
  int64_t fieldCount = v5->_fieldCount;
  uint64_t v10 = v8 + 96 * fieldCount;
  v5->_int64_t fieldCount = fieldCount + 1;
  *(_DWORD *)uint64_t v10 = v7;
  *(void *)(v10 + 8) = "@";
  *(void *)(v10 + 16) = 0;
  *(void *)(v10 + 24) = 0;
  *(void *)(v10 + 32) = self->_rootClass;
  *(void *)(v10 + 48) = _BSProtobufEncodeObject;
  *(void *)(v10 + 56) = _BSProtobufDecodeObject;
  if (([a3 containsObject:self->_rootClass] & 1) == 0) {
    *(unsigned char *)(v8 + 96 * fieldCount + 88) = 1;
  }
  -[BSProtobufSchema _addSubclassesForField:allowedSubclasses:assertSubclassRelationship:]((uint64_t)v5, (uint64_t)"<concreteMulticlass>", a3, 1);
  self->_allowedConcreteSubclassesSchema = v5;
  self->_allowedConcreteSubclassesClasses = (NSArray *)[a3 copy];
}

@end