@interface BSObjCValue
+ (BSObjCValue)_valueWithEncoding:(uint64_t)a1;
+ (id)BOOLValue;
+ (id)doubleValue;
+ (id)integerValue;
+ (id)unsignedIntegerValue;
+ (id)valueWithBuilder:(id)a3;
+ (id)valueWithBuilder:(id)a3 error:(id *)a4;
+ (id)valueWithCEncoding:(uint64_t)a1;
+ (id)valueWithEncoding:(id)a3;
+ (id)valueWithEncoding:(id)a3 error:(id *)a4;
+ (id)voidValue;
+ (void)valueForArgumentAtIndex:(void *)a3 inSignature:;
- (BOOL)_isIndistinguishableFromValue:(uint64_t)a1;
- (BOOL)hasQualifier:(char)a3;
- (BOOL)isBlock;
- (BOOL)isBoolean;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFloatingPoint;
- (BOOL)isObject;
- (BOOL)isObjectNonnull;
- (BOOL)isObjectNullabilitySpecified;
- (BOOL)isObjectNullable;
- (BOOL)isOneWay;
- (BOOL)isPointer;
- (BOOL)isStruct;
- (BOOL)isVoid;
- (BOOL)isVoidPointer;
- (BOOL)isXPCObject;
- (Class)objectClass;
- (NSString)encoding;
- (char)type;
- (char)typeQualifier;
- (id)_prettyTypeString;
- (id)argumentName;
- (id)blockArguments;
- (id)blockReturnValue;
- (id)debugDescription;
- (id)description;
- (id)objectContainedClasses;
- (id)objectProtocols;
- (id)pointerValue;
- (id)structFlattenedMembers;
- (id)structMembers;
- (id)structName;
- (int64_t)argumentIndex;
- (unint64_t)hash;
- (unint64_t)size;
- (unsigned)typeQualifiers;
@end

@implementation BSObjCValue

- (char)type
{
  return self->_type;
}

- (Class)objectClass
{
  return self->_objectClass;
}

- (int64_t)argumentIndex
{
  return self->_argumentIndex;
}

- (BOOL)isPointer
{
  return self->_type == 94;
}

- (unint64_t)size
{
  return self->_size;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encoding, 0);
  objc_storeStrong((id *)&self->_blockArguments, 0);
  objc_storeStrong((id *)&self->_blockReturnValue, 0);
  objc_storeStrong((id *)&self->_argumentName, 0);
  objc_storeStrong((id *)&self->_objectContainedClasses, 0);
  objc_storeStrong((id *)&self->_objectProtocols, 0);
  objc_storeStrong((id *)&self->_unqualifiedEncoding, 0);
}

+ (id)valueWithEncoding:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = v6;
  if (v6 && [v6 rangeOfString:@"("]
  {
    v10 = @"unions or types containing unions are not supported";
  }
  else
  {
    if ([v7 length])
    {
      id v8 = v7;
      NSGetSizeAndAlignment((const char *)[v8 UTF8String], 0, 0);
      v9 = +[BSObjCValue _valueWithEncoding:]((uint64_t)a1, v8);
      v10 = 0;
      goto LABEL_10;
    }
    v10 = @"type encoding is nil or empty";
  }
  v9 = 0;
  if (a4 && v10)
  {
    v11 = (void *)MEMORY[0x1E4F28C58];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__BSObjCValue_ExternalCreation__valueWithEncoding_error___block_invoke;
    v13[3] = &unk_1E5445DF0;
    v10 = v10;
    v14 = v10;
    id v15 = v7;
    objc_msgSend(v11, "bs_errorWithDomain:code:configuration:", @"BSObjCRuntime", 1, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v9 = 0;
  }
LABEL_10:

  return v9;
}

+ (BSObjCValue)_valueWithEncoding:(uint64_t)a1
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = self;
  if (!v2)
  {
    v45 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"encoding"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__valueWithEncoding_);
      id v46 = (id)objc_claimAutoreleasedReturnValue();
      v47 = (objc_class *)objc_opt_class();
      v48 = NSStringFromClass(v47);
      *(_DWORD *)sizep = 138544642;
      *(void *)&sizep[4] = v46;
      __int16 v69 = 2114;
      v70 = v48;
      __int16 v71 = 2048;
      uint64_t v72 = v3;
      __int16 v73 = 2114;
      v74 = @"BSObjCRuntime.m";
      __int16 v75 = 1024;
      int v76 = 155;
      __int16 v77 = 2114;
      v78 = v45;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", sizep, 0x3Au);
    }
    qword_1E911F420 = [v45 UTF8String];
    __break(0);
    JUMPOUT(0x18AAAB718);
  }
  id v63 = v2;
  v4 = +[NSString bsobjc_typeQualifiers]();
  uint64_t v5 = [v63 rangeOfCharacterFromSet:v4 options:10];

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = 0;
    v7 = v63;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28FE8] scannerWithString:v63];
    v9 = +[NSString bsobjc_typeQualifiers]();
    *(void *)sizep = 0;
    int v10 = [v8 scanCharactersFromSet:v9 intoString:sizep];
    id v11 = *(id *)sizep;

    if (v10)
    {
      v7 = objc_msgSend(v63, "substringFromIndex:", objc_msgSend(v11, "length"));

      id v6 = v11;
    }
    else
    {
      id v6 = 0;
      v7 = v63;
    }
  }
  id v12 = v6;
  if (![v7 length])
  {
    v49 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[unqualifiedEncoding length] > 0"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__valueWithEncoding_);
      id v50 = (id)objc_claimAutoreleasedReturnValue();
      v51 = (objc_class *)objc_opt_class();
      v52 = NSStringFromClass(v51);
      *(_DWORD *)sizep = 138544642;
      *(void *)&sizep[4] = v50;
      __int16 v69 = 2114;
      v70 = v52;
      __int16 v71 = 2048;
      uint64_t v72 = v3;
      __int16 v73 = 2114;
      v74 = @"BSObjCRuntime.m";
      __int16 v75 = 1024;
      int v76 = 158;
      __int16 v77 = 2114;
      v78 = v49;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", sizep, 0x3Au);
    }
    qword_1E911F420 = [v49 UTF8String];
    __break(0);
    JUMPOUT(0x18AAAB81CLL);
  }
  id v64 = v7;
  v13 = (const char *)[v64 UTF8String];
  int v14 = 0;
  for (unint64_t i = 0; i < [v12 length]; ++i)
  {
    int v16 = [v12 characterAtIndex:i];
    if (v16 > 109)
    {
      int v17 = v14 | 8;
      int v18 = v14 | 1;
      if (v16 != 114) {
        int v18 = v14;
      }
      if (v16 != 111) {
        int v17 = v18;
      }
      if (v16 == 110) {
        v14 |= 2u;
      }
      else {
        int v14 = v17;
      }
    }
    else
    {
      switch(v16)
      {
        case 'N':
          v14 |= 4u;
          break;
        case 'O':
          v14 |= 0x10u;
          break;
        case 'R':
          v14 |= 0x20u;
          break;
        case 'V':
          v14 |= 0x40u;
          break;
        default:
          continue;
      }
    }
  }
  v65 = objc_alloc_init(BSObjCValue);
  uint64_t v19 = [v63 copy];
  encoding = v65->_encoding;
  v65->_encoding = (NSString *)v19;

  objc_storeStrong((id *)&v65->_unqualifiedEncoding, v64);
  if ([v12 length]) {
    char v21 = *(unsigned char *)[v12 UTF8String];
  }
  else {
    char v21 = 0;
  }
  v65->_typeQualifier = v21;
  v65->_typeQualifiers = v14;
  v65->_int type = *v13;
  *(void *)sizep = 0;
  NSGetSizeAndAlignment(v13, (NSUInteger *)sizep, 0);
  v65->_size = *(void *)sizep;
  v65->_argumentIndex = 0x7FFFFFFFFFFFFFFFLL;
  v65->_block = [v64 hasPrefix:@"@?"];
  v65->_nullability = -1;
  int type = v65->_type;
  if (type == 94 || type == 64)
  {
    v23 = [MEMORY[0x1E4F28FE8] scannerWithString:v65->_unqualifiedEncoding];
    [v23 scanUpToString:@"\"" intoString:0];
    if ([v23 scanString:@"\"" intoString:0])
    {
      v24 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"<\""];
      id v67 = 0;
      int v25 = [v23 scanUpToCharactersFromSet:v24 intoString:&v67];
      v26 = (NSString *)v67;

      if (v25) {
        v65->_objectClass = NSClassFromString(v26);
      }
    }
    int v62 = 0;
    v27 = 0;
    v61 = 0;
    while (1)
    {
      v28 = (void *)MEMORY[0x18C125360]();
      [v23 scanUpToString:@"<" intoString:0];
      int v29 = [v23 scanString:@"<" intoString:0];
      char v30 = v29;
      if (v29) {
        break;
      }
LABEL_52:
      if ((v30 & 1) == 0)
      {
        uint64_t v39 = [v61 copy];
        objectContainedClasses = v65->_objectContainedClasses;
        v65->_objectContainedClasses = (NSArray *)v39;

        uint64_t v41 = [v27 copy];
        objectProtocols = v65->_objectProtocols;
        v65->_objectProtocols = (NSArray *)v41;

        v65->_nullability = v62;
        BOOL v43 = [(BSObjCValue *)v65 isXPCObject];
        if (v43
          && ([(objc_class *)v65->_objectClass isSubclassOfClass:BSXPCObjectBaseClass()] & 1) == 0)
        {
          v65->_objectClass = (Class)BSXPCObjectBaseClass();
        }

        goto LABEL_62;
      }
    }
    id v66 = 0;
    int v31 = [v23 scanUpToString:@">" intoString:&v66];
    id v32 = v66;
    v33 = v32;
    if (!v31)
    {
LABEL_51:

      goto LABEL_52;
    }
    if (![v32 hasPrefix:@"__"]
      || ![v33 hasSuffix:@"__"])
    {
      NSProtocolFromString((NSString *)v33);
      v34 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        v36 = v27;
        if (!v27)
        {
          v36 = [MEMORY[0x1E4F1CA48] array];
        }
        v27 = v36;
        [v36 addObject:v34];
      }
      goto LABEL_50;
    }
    objc_msgSend(v33, "substringWithRange:", 2, objc_msgSend(v33, "length") - 4);
    v34 = (NSString *)objc_claimAutoreleasedReturnValue();
    if ([(NSString *)v34 isEqualToString:@"nullable"])
    {
      if (v62)
      {
        v53 = [NSString stringWithFormat:@"cannot declare nullability more than once"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__populateClassesAndNullability);
          id v54 = (id)objc_claimAutoreleasedReturnValue();
          v55 = (objc_class *)objc_opt_class();
          v56 = NSStringFromClass(v55);
          *(_DWORD *)sizep = 138544642;
          *(void *)&sizep[4] = v54;
          __int16 v69 = 2114;
          v70 = v56;
          __int16 v71 = 2048;
          uint64_t v72 = (uint64_t)v65;
          __int16 v73 = 2114;
          v74 = @"BSObjCRuntime.m";
          __int16 v75 = 1024;
          int v76 = 265;
          __int16 v77 = 2114;
          v78 = v53;
          _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", sizep, 0x3Au);
        }
        qword_1E911F420 = [v53 UTF8String];
        __break(0);
        JUMPOUT(0x18AAAB918);
      }
      int v35 = 2;
    }
    else
    {
      if (![(NSString *)v34 isEqualToString:@"nonnull"])
      {
        Class v37 = NSClassFromString(v34);
        if (v37)
        {
          v38 = v61;
          if (!v61)
          {
            v38 = [MEMORY[0x1E4F1CA48] array];
          }
          v61 = v38;
          [v38 addObject:v37];
        }
        goto LABEL_50;
      }
      if (v62)
      {
        v57 = [NSString stringWithFormat:@"cannot declare nullability more than once"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__populateClassesAndNullability);
          id v58 = (id)objc_claimAutoreleasedReturnValue();
          v59 = (objc_class *)objc_opt_class();
          v60 = NSStringFromClass(v59);
          *(_DWORD *)sizep = 138544642;
          *(void *)&sizep[4] = v58;
          __int16 v69 = 2114;
          v70 = v60;
          __int16 v71 = 2048;
          uint64_t v72 = (uint64_t)v65;
          __int16 v73 = 2114;
          v74 = @"BSObjCRuntime.m";
          __int16 v75 = 1024;
          int v76 = 268;
          __int16 v77 = 2114;
          v78 = v57;
          _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", sizep, 0x3Au);
        }
        qword_1E911F420 = [v57 UTF8String];
        __break(0);
        JUMPOUT(0x18AAABA14);
      }
      int v35 = 1;
    }
    int v62 = v35;
LABEL_50:

    goto LABEL_51;
  }
LABEL_62:

  return v65;
}

+ (void)valueForArgumentAtIndex:(void *)a3 inSignature:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  if (a2 < -1)
  {
    v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"index >= -1"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_valueForArgumentAtIndex_inSignature_);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      v22 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v22);
      *(_DWORD *)buf = 138544642;
      id v29 = v21;
      __int16 v30 = 2114;
      int v31 = v23;
      __int16 v32 = 2048;
      uint64_t v33 = v5;
      __int16 v34 = 2114;
      int v35 = @"BSObjCRuntime.m";
      __int16 v36 = 1024;
      int v37 = 193;
      __int16 v38 = 2114;
      uint64_t v39 = v20;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v20 UTF8String];
    __break(0);
    JUMPOUT(0x18AAABEC8);
  }
  if ([v4 numberOfArguments] <= a2)
  {
    v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"index < (NSInteger)[signature numberOfArguments]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_valueForArgumentAtIndex_inSignature_);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      v26 = (objc_class *)objc_opt_class();
      v27 = NSStringFromClass(v26);
      *(_DWORD *)buf = 138544642;
      id v29 = v25;
      __int16 v30 = 2114;
      int v31 = v27;
      __int16 v32 = 2048;
      uint64_t v33 = v5;
      __int16 v34 = 2114;
      int v35 = @"BSObjCRuntime.m";
      __int16 v36 = 1024;
      int v37 = 194;
      __int16 v38 = 2114;
      uint64_t v39 = v24;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v24 UTF8String];
    __break(0);
    JUMPOUT(0x18AAABFCCLL);
  }
  id v6 = v4;
  v7 = v6;
  if (a2 == -1) {
    uint64_t v8 = [v6 methodReturnType];
  }
  else {
    uint64_t v8 = [v6 getArgumentTypeAtIndex:a2];
  }
  v9 = +[BSObjCValue valueWithCEncoding:](v5, v8);
  if ([v9 isBlock])
  {
    int v10 = [v7 _signatureForBlockAtArgumentIndex:a2];
    if (v10)
    {
      id v11 = [MEMORY[0x1E4F1CA48] array];
      for (unint64_t i = 1; i < [v10 numberOfArguments]; ++i)
      {
        uint64_t v13 = +[BSObjCValue valueForArgumentAtIndex:inSignature:](v5, i, v10);
        int v14 = (void *)v13;
        if (v13)
        {
          *(void *)(v13 + 48) = i - 1;
          [v11 addObject:v13];
        }
      }
      uint64_t v15 = [v11 copy];
      int v16 = (void *)v9[10];
      v9[10] = v15;

      uint64_t v17 = +[BSObjCValue valueForArgumentAtIndex:inSignature:](v5, -1, v10);
      int v18 = (void *)v9[9];
      v9[9] = v17;
    }
  }

  return v9;
}

- (BOOL)isBlock
{
  return self->_block;
}

- (id)objectContainedClasses
{
  return self->_objectContainedClasses;
}

- (id)blockArguments
{
  return self->_blockArguments;
}

- (BOOL)isObjectNonnull
{
  return self->_nullability == 1;
}

- (BOOL)isStruct
{
  return self->_type == 123;
}

- (BOOL)isFloatingPoint
{
  return (self->_type & 0xFD) == 100;
}

- (unint64_t)hash
{
  return self->_type;
}

- (BOOL)isXPCObject
{
  if (qword_1EB21B130 != -1) {
    dispatch_once(&qword_1EB21B130, &__block_literal_global_670);
  }
  int v3 = [(BSObjCValue *)self isObject];
  if (v3)
  {
    if ([(NSArray *)self->_objectProtocols containsObject:qword_1EB21B128])
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      Class objectClass = self->_objectClass;
      LOBYTE(v3) = [(objc_class *)objectClass bs_isXPCObject];
    }
  }
  return v3;
}

- (BOOL)isObject
{
  return self->_type == 64;
}

- (BOOL)isEqual:(id)a3
{
  return [(NSString *)self->_encoding isEqual:*((void *)a3 + 12)];
}

- (id)structFlattenedMembers
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v3 = objc_opt_new();
  id v4 = [(BSObjCValue *)self structMembers];
  if ([v4 count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "structFlattenedMembers", (void)v14);
          if ([v9 count]) {
            [v3 addObjectsFromArray:v9];
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v6);
    }

    if ([v3 count]) {
      int v10 = v3;
    }
    else {
      int v10 = 0;
    }
    id v11 = v10;
  }
  else
  {
    int v18 = self;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  }
  id v12 = v11;

  return v12;
}

- (id)structMembers
{
  if (self->_type == 123)
  {
    int v3 = objc_opt_new();
    id v4 = -[NSString substringWithRange:](self->_encoding, "substringWithRange:", 1, [(NSString *)self->_encoding length] - 2);
    v23 = v3;
    while (1)
    {
      unint64_t v5 = [v4 rangeOfString:@"{" options:0];
      unint64_t v6 = [v4 rangeOfString:@"=" options:0];
      if (v5 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v6 == 0x7FFFFFFFFFFFFFFFLL)
        {
          id v8 = v4;
          uint64_t v9 = 0;
        }
        else
        {
          [v4 substringFromIndex:v6 + v7];
          uint64_t v9 = 0;
          id v8 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        if (!v5 || v6 <= v5)
        {
          unint64_t v12 = v5;
          uint64_t v13 = 1;
          do
          {
            unint64_t v14 = v12 + 1;
            uint64_t v15 = [v4 length] + ~v12;
            unint64_t v16 = objc_msgSend(v4, "rangeOfString:options:range:", @"{", 0, v14, v15);
            unint64_t v17 = objc_msgSend(v4, "rangeOfString:options:range:", @"}", 0, v14, v15);
            if (v16 < v17) {
              ++v13;
            }
            else {
              --v13;
            }
            if (v16 >= v17) {
              unint64_t v12 = v17;
            }
            else {
              unint64_t v12 = v16;
            }
          }
          while (v13);
          int v3 = v23;
          objc_msgSend(v4, "substringWithRange:", v5, v12 - v5 + 1);
          id v8 = (id)objc_claimAutoreleasedReturnValue();
          int v18 = +[BSObjCValue _valueWithEncoding:]((uint64_t)BSObjCValue, v8);
          [v23 addObject:v18];

          uint64_t v19 = [v4 substringFromIndex:v12 + 1];

          id v4 = (void *)v19;
          goto LABEL_20;
        }
        uint64_t v10 = [v4 substringToIndex:v5];
        [v4 substringFromIndex:v5];
        v9 = id v8 = (id)v10;
      }

      uint64_t v11 = [v8 length];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __43__BSObjCValue_StructSupport__structMembers__block_invoke;
      v25[3] = &unk_1E5445DC8;
      SEL v27 = a2;
      v25[4] = self;
      id v26 = v3;
      objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", 0, v11, 2, v25);

      id v4 = (void *)v9;
LABEL_20:

      if (![v4 length])
      {
        if ([v3 count]) {
          uint64_t v20 = v3;
        }
        else {
          uint64_t v20 = 0;
        }
        id v21 = v20;

        goto LABEL_26;
      }
    }
  }
  id v21 = 0;
LABEL_26:
  return v21;
}

+ (id)valueWithCEncoding:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int v3 = self;
  if (!a2)
  {
    uint64_t v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"encoding"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_valueWithCEncoding_);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138544642;
      id v12 = v8;
      __int16 v13 = 2114;
      unint64_t v14 = v10;
      __int16 v15 = 2048;
      unint64_t v16 = v3;
      __int16 v17 = 2114;
      int v18 = @"BSObjCRuntime.m";
      __int16 v19 = 1024;
      int v20 = 150;
      __int16 v21 = 2114;
      v22 = v7;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v7 UTF8String];
    __break(0);
    JUMPOUT(0x18AAC0000);
  }
  id v4 = objc_msgSend(NSString, "bs_stringWithUTF8String:", a2);
  unint64_t v5 = [v3 valueWithEncoding:v4];

  return v5;
}

+ (id)valueWithEncoding:(id)a3
{
  int v3 = [a1 valueWithEncoding:a3 error:0];
  return v3;
}

- (BOOL)isVoid
{
  return self->_type == 118;
}

- (BOOL)isOneWay
{
  return (self->_typeQualifiers >> 6) & 1;
}

- (NSString)encoding
{
  return self->_encoding;
}

- (BOOL)hasQualifier:(char)a3
{
  if (a3 <= 109)
  {
    switch(a3)
    {
      case 'N':
        char v3 = 4;
        return (v3 & self->_typeQualifiers) != 0;
      case 'O':
        char v3 = 16;
        return (v3 & self->_typeQualifiers) != 0;
      case 'R':
        char v3 = 32;
        return (v3 & self->_typeQualifiers) != 0;
      case 'V':
        char v3 = 64;
        return (v3 & self->_typeQualifiers) != 0;
      default:
        return self->_typeQualifiers == 0;
    }
  }
  switch(a3)
  {
    case 'r':
      char v3 = 1;
      return (v3 & self->_typeQualifiers) != 0;
    case 'o':
      char v3 = 8;
      return (v3 & self->_typeQualifiers) != 0;
    case 'n':
      char v3 = 2;
      return (v3 & self->_typeQualifiers) != 0;
  }
  return self->_typeQualifiers == 0;
}

- (BOOL)isBoolean
{
  return self->_type == 66;
}

void __43__BSObjCValue_StructSupport__structMembers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v37 = a2;
  if ([v37 length])
  {
    id v3 = v37;
    unsigned int v4 = *(unsigned __int8 *)[v3 UTF8String];
    if (v4 <= 0x5A)
    {
      switch(v4)
      {
        case '(':
          __int16 v17 = [NSString stringWithFormat:@"union members are not supported"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(*(SEL *)(a1 + 48));
            id v18 = (id)objc_claimAutoreleasedReturnValue();
            __int16 v19 = (objc_class *)objc_opt_class();
            int v20 = NSStringFromClass(v19);
            uint64_t v21 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138544642;
            id v39 = v18;
            __int16 v40 = 2114;
            uint64_t v41 = v20;
            __int16 v42 = 2048;
            uint64_t v43 = v21;
            __int16 v44 = 2114;
            v45 = @"BSObjCRuntime.m";
            __int16 v46 = 1024;
            int v47 = 1525;
            __int16 v48 = 2114;
            v49 = v17;
            _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          qword_1E911F420 = [v17 UTF8String];
          __break(0);
          JUMPOUT(0x18AAE9C8CLL);
        case '*':
          SEL v27 = [NSString stringWithFormat:@"char * members are not supported"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(*(SEL *)(a1 + 48));
            id v28 = (id)objc_claimAutoreleasedReturnValue();
            id v29 = (objc_class *)objc_opt_class();
            __int16 v30 = NSStringFromClass(v29);
            uint64_t v31 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138544642;
            id v39 = v28;
            __int16 v40 = 2114;
            uint64_t v41 = v30;
            __int16 v42 = 2048;
            uint64_t v43 = v31;
            __int16 v44 = 2114;
            v45 = @"BSObjCRuntime.m";
            __int16 v46 = 1024;
            int v47 = 1528;
            __int16 v48 = 2114;
            v49 = v27;
            _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          qword_1E911F420 = [v27 UTF8String];
          __break(0);
          JUMPOUT(0x18AAE9E84);
        case '?':
          __int16 v32 = [NSString stringWithFormat:@"unknown members are not supported"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(*(SEL *)(a1 + 48));
            id v33 = (id)objc_claimAutoreleasedReturnValue();
            __int16 v34 = (objc_class *)objc_opt_class();
            int v35 = NSStringFromClass(v34);
            uint64_t v36 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138544642;
            id v39 = v33;
            __int16 v40 = 2114;
            uint64_t v41 = v35;
            __int16 v42 = 2048;
            uint64_t v43 = v36;
            __int16 v44 = 2114;
            v45 = @"BSObjCRuntime.m";
            __int16 v46 = 1024;
            int v47 = 1529;
            __int16 v48 = 2114;
            v49 = v32;
            _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          qword_1E911F420 = [v32 UTF8String];
          __break(0);
          JUMPOUT(0x18AAE9F80);
      }
    }
    else
    {
      switch(v4)
      {
        case '^':
          id v12 = [NSString stringWithFormat:@"pointer members are not supported"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(*(SEL *)(a1 + 48));
            id v13 = (id)objc_claimAutoreleasedReturnValue();
            unint64_t v14 = (objc_class *)objc_opt_class();
            __int16 v15 = NSStringFromClass(v14);
            uint64_t v16 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138544642;
            id v39 = v13;
            __int16 v40 = 2114;
            uint64_t v41 = v15;
            __int16 v42 = 2048;
            uint64_t v43 = v16;
            __int16 v44 = 2114;
            v45 = @"BSObjCRuntime.m";
            __int16 v46 = 1024;
            int v47 = 1524;
            __int16 v48 = 2114;
            v49 = v12;
            _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          qword_1E911F420 = [v12 UTF8String];
          __break(0);
          JUMPOUT(0x18AAE9B90);
        case 'b':
          v22 = [NSString stringWithFormat:@"bitfield members are not supported"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(*(SEL *)(a1 + 48));
            id v23 = (id)objc_claimAutoreleasedReturnValue();
            v24 = (objc_class *)objc_opt_class();
            id v25 = NSStringFromClass(v24);
            uint64_t v26 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138544642;
            id v39 = v23;
            __int16 v40 = 2114;
            uint64_t v41 = v25;
            __int16 v42 = 2048;
            uint64_t v43 = v26;
            __int16 v44 = 2114;
            v45 = @"BSObjCRuntime.m";
            __int16 v46 = 1024;
            int v47 = 1526;
            __int16 v48 = 2114;
            v49 = v22;
            _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          qword_1E911F420 = [v22 UTF8String];
          __break(0);
          JUMPOUT(0x18AAE9D88);
        case '[':
          unint64_t v5 = [NSString stringWithFormat:@"array members are not supported"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(*(SEL *)(a1 + 48));
            id v6 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v7 = (objc_class *)objc_opt_class();
            id v8 = NSStringFromClass(v7);
            uint64_t v9 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138544642;
            id v39 = v6;
            __int16 v40 = 2114;
            uint64_t v41 = v8;
            __int16 v42 = 2048;
            uint64_t v43 = v9;
            __int16 v44 = 2114;
            v45 = @"BSObjCRuntime.m";
            __int16 v46 = 1024;
            int v47 = 1527;
            __int16 v48 = 2114;
            v49 = v5;
            _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          qword_1E911F420 = [v5 UTF8String];
          __break(0);
          JUMPOUT(0x18AAE9A10);
      }
    }
    uint64_t v10 = *(void **)(a1 + 40);
    uint64_t v11 = +[BSObjCValue _valueWithEncoding:]((uint64_t)BSObjCValue, v3);
    [v10 addObject:v11];
  }
}

void __41__BSObjCValue_ObjectSupport__isXPCObject__block_invoke()
{
  v0 = (objc_class *)BSXPCObjectBaseClass();
  NSStringFromClass(v0);
  id v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = NSProtocolFromString(v3);
  id v2 = (void *)qword_1EB21B128;
  qword_1EB21B128 = v1;
}

- (id)description
{
  id v2 = NSString;
  id v3 = -[BSObjCValue _prettyTypeString](self);
  unsigned int v4 = [v2 stringWithFormat:@"<%@>", v3];

  return v4;
}

- (id)_prettyTypeString
{
  id v1 = a1;
  if (!a1) {
    goto LABEL_82;
  }
  if ([a1 isBlock])
  {
    id v2 = [MEMORY[0x1E4F28E78] stringWithString:&stru_1ED76E928];
    uint64_t v3 = -[BSObjCValue _prettyTypeString](*((void *)v1 + 9));
    unsigned int v4 = (void *)v3;
    if (v3) {
      unint64_t v5 = (__CFString *)v3;
    }
    else {
      unint64_t v5 = @"?";
    }
    [v2 appendString:v5];

    objc_msgSend(v2, "appendString:", @"(^)(");
    uint64_t v6 = [*((id *)v1 + 10) count];
    uint64_t v7 = (void *)*((void *)v1 + 10);
    if (v6)
    {
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __32__BSObjCValue__prettyTypeString__block_invoke;
      v62[3] = &unk_1E5445D28;
      id v63 = v2;
      [v7 enumerateObjectsUsingBlock:v62];
    }
    else
    {
      if (v7) {
        id v18 = @"void";
      }
      else {
        id v18 = @"?";
      }
      [v2 appendString:v18];
    }
    [v2 appendString:@""]);
    id v1 = (id)[v2 copy];

    goto LABEL_82;
  }
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__3;
  v60 = __Block_byref_object_dispose__3;
  id v61 = 0;
  id v8 = *((id *)v1 + 1);
  uint64_t v9 = 0;
  while ([v8 rangeOfString:@"^" options:10] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = [v8 substringFromIndex:1];
    ++v9;

    id v8 = (id)v10;
  }
  if ([v8 hasPrefix:@"@"])
  {
    uint64_t v11 = NSStringFromClass(*((Class *)v1 + 2));
    id v12 = v11;
    id v13 = v57;
    if (v11) {
      unint64_t v14 = v11;
    }
    else {
      unint64_t v14 = @"id";
    }
    id v23 = (void *)v13[5];
    v13[5] = (uint64_t)v14;

    if ([*((id *)v1 + 4) count])
    {
      uint64_t v24 = [(id)v57[5] stringByAppendingString:@"<"];
      id v25 = (void *)v57[5];
      v57[5] = v24;

      uint64_t v26 = (void *)*((void *)v1 + 4);
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __32__BSObjCValue__prettyTypeString__block_invoke_132;
      v55[3] = &unk_1E5445D50;
      v55[4] = &v56;
      [v26 enumerateObjectsUsingBlock:v55];
      uint64_t v27 = [(id)v57[5] stringByAppendingString:@">"];
      id v28 = (void *)v57[5];
      v57[5] = v27;
    }
    if (v12)
    {
      uint64_t v29 = [(id)v57[5] stringByAppendingString:@" *"];
      __int16 v30 = (void *)v57[5];
      v57[5] = v29;
    }
    goto LABEL_67;
  }
  if (![v8 hasPrefix:@"{"])
  {
    __int16 v19 = [v8 substringToIndex:1];
    int v20 = [v19 characterAtIndex:0];

    if (v20 > 90)
    {
      switch(v20)
      {
        case '^':
          uint64_t v21 = v57;
          id v12 = (void *)v57[5];
          v22 = @"pointer";
          goto LABEL_66;
        case '_':
        case 'a':
        case 'e':
        case 'g':
        case 'h':
        case 'j':
        case 'k':
        case 'm':
        case 'n':
        case 'o':
        case 'p':
        case 'r':
        case 't':
        case 'u':
          goto LABEL_48;
        case 'b':
          uint64_t v21 = v57;
          id v12 = (void *)v57[5];
          v22 = @"bitfield";
          goto LABEL_66;
        case 'c':
          uint64_t v21 = v57;
          id v12 = (void *)v57[5];
          v22 = @"char";
          goto LABEL_66;
        case 'd':
          uint64_t v21 = v57;
          id v12 = (void *)v57[5];
          v22 = @"double";
          goto LABEL_66;
        case 'f':
          uint64_t v21 = v57;
          id v12 = (void *)v57[5];
          v22 = @"float";
          goto LABEL_66;
        case 'i':
          uint64_t v21 = v57;
          id v12 = (void *)v57[5];
          v22 = @"int";
          goto LABEL_66;
        case 'l':
          uint64_t v21 = v57;
          id v12 = (void *)v57[5];
          v22 = @"long";
          goto LABEL_66;
        case 'q':
          uint64_t v21 = v57;
          id v12 = (void *)v57[5];
          v22 = @"long long";
          goto LABEL_66;
        case 's':
          uint64_t v21 = v57;
          id v12 = (void *)v57[5];
          v22 = @"short";
          goto LABEL_66;
        case 'v':
          uint64_t v21 = v57;
          id v12 = (void *)v57[5];
          v22 = @"void";
          goto LABEL_66;
        default:
          if (v20 == 91)
          {
            uint64_t v21 = v57;
            id v12 = (void *)v57[5];
            v22 = @"array";
          }
          else
          {
            if (v20 != 123) {
              goto LABEL_48;
            }
            uint64_t v21 = v57;
            id v12 = (void *)v57[5];
            v22 = @"struct";
          }
          break;
      }
      goto LABEL_66;
    }
    if (v20 > 72)
    {
      if (v20 > 80)
      {
        if (v20 == 81)
        {
          uint64_t v21 = v57;
          id v12 = (void *)v57[5];
          v22 = @"unsigned long long";
          goto LABEL_66;
        }
        if (v20 == 83)
        {
          uint64_t v21 = v57;
          id v12 = (void *)v57[5];
          v22 = @"unsigned short";
          goto LABEL_66;
        }
      }
      else
      {
        if (v20 == 73)
        {
          uint64_t v21 = v57;
          id v12 = (void *)v57[5];
          v22 = @"unsigned int";
          goto LABEL_66;
        }
        if (v20 == 76)
        {
          uint64_t v21 = v57;
          id v12 = (void *)v57[5];
          v22 = @"unsigned long";
LABEL_66:
          v21[5] = (uint64_t)v22;
          goto LABEL_67;
        }
      }
    }
    else
    {
      if (v20 > 57)
      {
        switch(v20)
        {
          case ':':
            uint64_t v21 = v57;
            id v12 = (void *)v57[5];
            v22 = @"SEL";
            break;
          case '@':
            uint64_t v21 = v57;
            id v12 = (void *)v57[5];
            v22 = @"Object";
            break;
          case 'B':
            uint64_t v21 = v57;
            id v12 = (void *)v57[5];
            v22 = @"BOOL";
            break;
          case 'C':
            uint64_t v21 = v57;
            id v12 = (void *)v57[5];
            v22 = @"unsigned char";
            break;
          default:
            goto LABEL_48;
        }
        goto LABEL_66;
      }
      switch(v20)
      {
        case '#':
          uint64_t v21 = v57;
          id v12 = (void *)v57[5];
          v22 = @"Class";
          goto LABEL_66;
        case '(':
          uint64_t v21 = v57;
          id v12 = (void *)v57[5];
          v22 = @"union";
          goto LABEL_66;
        case '*':
          uint64_t v21 = v57;
          id v12 = (void *)v57[5];
          v22 = @"char *";
          goto LABEL_66;
      }
    }
LABEL_48:
    uint64_t v21 = v57;
    id v12 = (void *)v57[5];
    v22 = @"(unknown)";
    goto LABEL_66;
  }
  uint64_t v15 = -[NSString bsobjc_structName](v8);
  uint64_t v16 = (void *)v57[5];
  v57[5] = v15;

  if (![(id)v57[5] isEqualToString:@"?"]) {
    goto LABEL_68;
  }
  uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"struct[%zu]", *((void *)v1 + 13));
  id v12 = (void *)v57[5];
  v57[5] = v17;
LABEL_67:

LABEL_68:
  uint64_t v49 = 0;
  uint64_t v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__3;
  v53 = __Block_byref_object_dispose__3;
  id v54 = 0;
  unsigned int v31 = [v1 typeQualifiers];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  __int16 v46 = __32__BSObjCValue__prettyTypeString__block_invoke_2;
  int v47 = &unk_1E5445D78;
  __int16 v48 = &v49;
  __int16 v32 = v45;
  if (v31)
  {
    uint64_t v33 = v31;
    char v64 = 0;
    uint8x8_t v34 = (uint8x8_t)vcnt_s8((int8x8_t)v31);
    v34.i16[0] = vaddlv_u8(v34);
    int v35 = v34.i32[0];
    if (v34.i32[0])
    {
      unint64_t v36 = 0;
      do
      {
        if (((1 << v36) & v33) != 0)
        {
          ((void (*)(void *))v46)(v32);
          if (v64) {
            break;
          }
          --v35;
        }
        if (v36 > 0x3E) {
          break;
        }
        ++v36;
      }
      while (v35 > 0);
    }
  }

  id v37 = (void *)v50[5];
  if (v37)
  {
    uint64_t v38 = [v37 stringByAppendingFormat:@" %@", v57[5]];
    id v39 = (void *)v57[5];
    v57[5] = v38;
  }
  if (v9)
  {
    uint64_t v40 = [(id)v57[5] stringByAppendingString:@" "];
    uint64_t v41 = (void *)v57[5];
    v57[5] = v40;

    do
    {
      uint64_t v42 = [(id)v57[5] stringByAppendingString:@"*"];
      uint64_t v43 = (void *)v57[5];
      v57[5] = v42;

      --v9;
    }
    while (v9);
  }
  id v1 = (id)v57[5];
  _Block_object_dispose(&v49, 8);

  _Block_object_dispose(&v56, 8);
LABEL_82:
  return v1;
}

- (id)debugDescription
{
  uint64_t v3 = NSString;
  unsigned int v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = -[BSObjCValue _prettyTypeString](self);
  uint64_t v7 = [v3 stringWithFormat:@"<%@: %p; %@ (%@)>", v5, self, v6, self->_encoding];

  return v7;
}

- (BOOL)_isIndistinguishableFromValue:(uint64_t)a1
{
  uint64_t v3 = a2;
  unsigned int v4 = v3;
  if (!a1) {
    goto LABEL_35;
  }
  if ((unsigned __int8 *)a1 == v3)
  {
    BOOL v8 = 1;
    goto LABEL_36;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class() || *(void *)(a1 + 48) != *((void *)v4 + 6)) {
    goto LABEL_35;
  }
  uint64_t v6 = *(void **)(a1 + 56);
  uint64_t v7 = (void *)*((void *)v4 + 7);
  if (v6 != v7)
  {
    BOOL v8 = 0;
    if (!v6 || !v7) {
      goto LABEL_36;
    }
    if (!objc_msgSend(v6, "isEqualToString:")) {
      goto LABEL_35;
    }
  }
  uint64_t v9 = *(void **)(a1 + 96);
  uint64_t v10 = (void *)*((void *)v4 + 12);
  if (v9 != v10)
  {
    BOOL v8 = 0;
    if (!v9 || !v10) {
      goto LABEL_36;
    }
    if (!objc_msgSend(v9, "isEqualToString:")) {
      goto LABEL_35;
    }
  }
  uint64_t v11 = *(void **)(a1 + 8);
  id v12 = (void *)*((void *)v4 + 1);
  if (v11 != v12)
  {
    BOOL v8 = 0;
    if (!v11 || !v12) {
      goto LABEL_36;
    }
    if (!objc_msgSend(v11, "isEqualToString:")) {
      goto LABEL_35;
    }
  }
  if (*(unsigned __int8 *)(a1 + 88) != v4[88]
    || *(unsigned __int8 *)(a1 + 90) != v4[90]
    || *(void *)(a1 + 104) != *((void *)v4 + 13)
    || *(void *)(a1 + 16) != *((void *)v4 + 2)
    || !BSEqualArrays(*(CFArrayRef *)(a1 + 24), *((const __CFArray **)v4 + 3))
    || !BSEqualArrays(*(CFArrayRef *)(a1 + 32), *((const __CFArray **)v4 + 4))
    || *(unsigned __int8 *)(a1 + 64) != v4[64])
  {
    goto LABEL_35;
  }
  uint64_t v13 = *((void *)v4 + 9);
  if (!*(void *)(a1 + 72))
  {
    if (!v13) {
      goto LABEL_30;
    }
LABEL_35:
    BOOL v8 = 0;
    goto LABEL_36;
  }
  if (!v13 || (((uint64_t (*)(void))-[BSObjCValue _isIndistinguishableFromValue:])() & 1) == 0) {
    goto LABEL_35;
  }
LABEL_30:
  if (!BSEqualArrays(*(CFArrayRef *)(a1 + 80), *((const __CFArray **)v4 + 10))) {
    goto LABEL_35;
  }
  unint64_t v14 = 0;
  do
  {
    unint64_t v15 = [*(id *)(a1 + 80) count];
    BOOL v8 = v14 >= v15;
    if (v14 >= v15) {
      break;
    }
    uint64_t v16 = [*(id *)(a1 + 80) objectAtIndex:v14];
    uint64_t v17 = [*((id *)v4 + 10) objectAtIndex:v14];
    char v18 = -[BSObjCValue _isIndistinguishableFromValue:](v16, v17);

    ++v14;
  }
  while ((v18 & 1) != 0);
LABEL_36:

  return v8;
}

void __32__BSObjCValue__prettyTypeString__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  id v8 = v5;
  -[BSObjCValue _prettyTypeString]();
  if (a3) {
    uint64_t v7 = {;
  }
    [v6 appendFormat:@", %@", v7];
  }
  else {
    uint64_t v7 = {;
  }
    [v6 appendString:v7];
  }
}

void __32__BSObjCValue__prettyTypeString__block_invoke_132(uint64_t a1, Class aClass, uint64_t a3)
{
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v6 = NSStringFromClass(aClass);
  id v10 = (id)v6;
  if (a3) {
    [v5 stringByAppendingFormat:@", %@ *", v6];
  }
  else {
  uint64_t v7 = [v5 stringByAppendingFormat:@"%@ *", v6];
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void __32__BSObjCValue__prettyTypeString__block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2 > 15)
  {
    switch(a2)
    {
      case 16:
        uint64_t v3 = @"bycopy";
        break;
      case 32:
        uint64_t v3 = @"byref";
        break;
      case 64:
        uint64_t v3 = @"oneway";
        break;
      default:
        return;
    }
LABEL_12:
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    id v5 = *(void **)(v4 + 40);
    if (v5)
    {
      uint64_t v6 = [v5 stringByAppendingFormat:@" %@", v3];
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
    else
    {
      uint64_t v8 = 0;
      *(void *)(v4 + 40) = v3;
    }
  }
  else
  {
    uint64_t v3 = @"const";
    switch(a2)
    {
      case 1:
        goto LABEL_12;
      case 2:
        uint64_t v3 = @"in";
        goto LABEL_12;
      case 4:
        uint64_t v3 = @"inout";
        goto LABEL_12;
      case 8:
        uint64_t v3 = @"out";
        goto LABEL_12;
      default:
        return;
    }
  }
}

- (char)typeQualifier
{
  return self->_typeQualifier;
}

- (unsigned)typeQualifiers
{
  return self->_typeQualifiers;
}

- (id)structName
{
  id v2 = -[NSString bsobjc_structName](self->_encoding);
  if ([v2 isEqualToString:@"?"])
  {

    id v2 = 0;
  }
  return v2;
}

- (id)blockReturnValue
{
  return self->_blockReturnValue;
}

- (id)objectProtocols
{
  return self->_objectProtocols;
}

- (BOOL)isObjectNullabilitySpecified
{
  return self->_nullability > 0;
}

- (BOOL)isObjectNullable
{
  return self->_nullability == 2;
}

- (id)argumentName
{
  return self->_argumentName;
}

- (id)pointerValue
{
  if ([(BSObjCValue *)self type] == 94)
  {
    if ([(NSString *)self->_unqualifiedEncoding length] < 2)
    {
      uint64_t v4 = +[BSObjCValue _valueWithEncoding:]((uint64_t)BSObjCValue, @"?");
    }
    else
    {
      uint64_t v3 = [(NSString *)self->_unqualifiedEncoding substringFromIndex:1];
      uint64_t v4 = +[BSObjCValue _valueWithEncoding:]((uint64_t)BSObjCValue, v3);
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (BOOL)isVoidPointer
{
  return [(NSString *)self->_unqualifiedEncoding isEqualToString:@"^v"];
}

+ (id)voidValue
{
  return +[BSObjCValue valueWithCEncoding:]((uint64_t)a1, (uint64_t)"v");
}

+ (id)BOOLValue
{
  return +[BSObjCValue valueWithCEncoding:]((uint64_t)a1, (uint64_t)"B");
}

+ (id)doubleValue
{
  return +[BSObjCValue valueWithCEncoding:]((uint64_t)a1, (uint64_t)"d");
}

+ (id)integerValue
{
  return +[BSObjCValue valueWithCEncoding:]((uint64_t)a1, (uint64_t)"q");
}

+ (id)unsignedIntegerValue
{
  return +[BSObjCValue valueWithCEncoding:]((uint64_t)a1, (uint64_t)"Q");
}

void __57__BSObjCValue_ExternalCreation__valueWithEncoding_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setFailureDescription:@"Unable to create value from type encoding"];
  [v4 setFailureReason:*(void *)(a1 + 32)];
  if (*(void *)(a1 + 40)) {
    uint64_t v3 = *(__CFString **)(a1 + 40);
  }
  else {
    uint64_t v3 = @"(nil)";
  }
  [v4 setUserInfoValue:v3 forKey:@"BSObjCEncoding"];
}

+ (id)valueWithBuilder:(id)a3
{
  id v4 = (void (**)(id, id *))a3;
  id v5 = (id *)objc_opt_new();
  v4[2](v4, v5);
  uint64_t v6 = -[BSCompoundAssertion _identifier](v5);
  uint64_t v7 = [a1 valueWithEncoding:v6 error:0];

  return v7;
}

+ (id)valueWithBuilder:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void (**)(id, id *))a3;
  uint64_t v7 = (id *)objc_opt_new();
  v6[2](v6, v7);
  uint64_t v8 = -[BSCompoundAssertion _identifier](v7);
  uint64_t v9 = [a1 valueWithEncoding:v8 error:a4];

  return v9;
}

@end