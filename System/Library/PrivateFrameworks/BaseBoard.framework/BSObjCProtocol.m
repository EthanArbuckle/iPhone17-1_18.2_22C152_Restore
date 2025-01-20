@interface BSObjCProtocol
+ (id)_gatherMethodMetadataForProtocol:(BOOL)a3 required:;
+ (id)_gatherPropertyMetadataForProtocol:(BOOL)a3 required:;
+ (id)protocolForProtocol:(id)a3;
+ (id)protocolForProtocol:(id)a3 interpreter:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BSObjCProtocol)init;
- (NSArray)inheritedProtocols;
- (NSArray)methods;
- (NSArray)properties;
- (NSString)description;
- (NSString)name;
- (Protocol)protocol;
- (id)_initWithName:(void *)a3 protocol:(void *)a4 inherited:(void *)a5 methods:(void *)a6 properties:(char)a7 virtual:;
- (id)_unionMethodsIgnoringObjCProtocols:(void *)a1;
- (id)_unionPropertiesIgnoringObjCProtocols:(void *)a1;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)flattenWithIgnoredInheritedProtocols:(id)a3;
- (id)inheritedProtocolForProtocol:(id)a3;
- (id)methodForSelector:(SEL)a3;
- (id)propertyWithName:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
@end

@implementation BSObjCProtocol

- (id)methodForSelector:(SEL)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = NSStringFromSelector(a3);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_methods;
  id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "name", (void)v13);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (id)flattenWithIgnoredInheritedProtocols:(id)a3
{
  id v4 = a3;
  if ([(NSArray *)self->_inheritedProtocols count])
  {
    v5 = [BSObjCProtocol alloc];
    name = self->_name;
    protocol = self->_protocol;
    v8 = -[BSObjCProtocol _unionMethodsIgnoringObjCProtocols:](self, v4);
    v9 = [v8 allObjects];
    v10 = -[BSObjCProtocol _unionPropertiesIgnoringObjCProtocols:](self, v4);
    char v11 = [v10 allObjects];
    v12 = (BSObjCProtocol *)-[BSObjCProtocol _initWithName:protocol:inherited:methods:properties:virtual:]((id *)&v5->super.isa, name, protocol, 0, v9, v11, self->_virtual);
  }
  else
  {
    v12 = self;
  }

  return v12;
}

- (id)_unionMethodsIgnoringObjCProtocols:(void *)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = [MEMORY[0x1E4F1CA80] set];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v5 = objc_msgSend(a1, "inheritedProtocols", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v10 = [v9 protocol];
          char v11 = [v3 containsObject:v10];

          if ((v11 & 1) == 0)
          {
            v12 = -[BSObjCProtocol _unionMethodsIgnoringObjCProtocols:](v9, v3);
            [v4 unionSet:v12];
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v6);
    }

    long long v13 = (void *)MEMORY[0x1E4F1CAD0];
    long long v14 = [a1 methods];
    long long v15 = [v13 setWithArray:v14];

    [v4 minusSet:v15];
    [v4 unionSet:v15];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (NSArray)methods
{
  return self->_methods;
}

- (id)_unionPropertiesIgnoringObjCProtocols:(void *)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = [MEMORY[0x1E4F1CA80] set];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v5 = objc_msgSend(a1, "inheritedProtocols", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v10 = [v9 protocol];
          char v11 = [v3 containsObject:v10];

          if ((v11 & 1) == 0)
          {
            v12 = -[BSObjCProtocol _unionPropertiesIgnoringObjCProtocols:](v9, v3);
            [v4 unionSet:v12];
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v6);
    }

    long long v13 = (void *)MEMORY[0x1E4F1CAD0];
    long long v14 = [a1 properties];
    long long v15 = [v13 setWithArray:v14];

    [v4 minusSet:v15];
    [v4 unionSet:v15];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (NSArray)inheritedProtocols
{
  if (self->_inheritedProtocols) {
    return self->_inheritedProtocols;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (Protocol)protocol
{
  return self->_protocol;
}

- (NSArray)properties
{
  return self->_properties;
}

+ (id)protocolForProtocol:(id)a3
{
  id v3 = [a1 protocolForProtocol:a3 interpreter:0];
  return v3;
}

+ (id)protocolForProtocol:(id)a3 interpreter:(id)a4
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (Protocol *)a3;
  v74 = (void (**)(id, void))a4;
  v70 = v7;
  if (!v7)
  {
    v66 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"protocol != ((void *)0)", 0];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v67 = (id)objc_claimAutoreleasedReturnValue();
      v68 = (objc_class *)objc_opt_class();
      v69 = NSStringFromClass(v68);
      *(_DWORD *)buf = 138544642;
      id v90 = v67;
      __int16 v91 = 2114;
      uint64_t v92 = (uint64_t)v69;
      __int16 v93 = 2048;
      id v94 = a1;
      __int16 v95 = 2114;
      v96 = @"BSObjCRuntime.m";
      __int16 v97 = 1024;
      int v98 = 1146;
      __int16 v99 = 2114;
      v100 = v66;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v66 UTF8String];
    __break(0);
    JUMPOUT(0x18AABF0D0);
  }
  v73 = NSStringFromProtocol(v7);
  v72 = v7;
  self;
  v8 = [MEMORY[0x1E4F1CA48] array];
  v9 = +[BSObjCProtocol _gatherMethodMetadataForProtocol:required:]((uint64_t)BSObjCProtocol, v72, 1);
  [v8 addObjectsFromArray:v9];

  v10 = +[BSObjCProtocol _gatherMethodMetadataForProtocol:required:]((uint64_t)BSObjCProtocol, v72, 0);
  [v8 addObjectsFromArray:v10];

  if (v74)
  {
    char v11 = (void *)[v8 mutableCopy];
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v12 = v8;
    id obj = v12;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v83 objects:v88 count:16];
    char v71 = v13 != 0;
    if (v13)
    {
      id v77 = a1;
      char v14 = 0;
      uint64_t v15 = *(void *)v84;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v84 != v15) {
            objc_enumerationMutation(obj);
          }
          long long v17 = *(void **)(*((void *)&v83 + 1) + 8 * i);
          long long v18 = ((void (**)(id, void *))v74)[2](v74, v17);
          long long v19 = v18;
          if (!v18)
          {
            v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"newMethod != nil", v70];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(a2);
              id v22 = (id)objc_claimAutoreleasedReturnValue();
              v23 = (objc_class *)objc_opt_class();
              v24 = NSStringFromClass(v23);
              *(_DWORD *)buf = 138544642;
              id v90 = v22;
              __int16 v91 = 2114;
              uint64_t v92 = (uint64_t)v24;
              __int16 v93 = 2048;
              id v94 = v77;
              __int16 v95 = 2114;
              v96 = @"BSObjCRuntime.m";
              __int16 v97 = 1024;
              int v98 = 1156;
              __int16 v99 = 2114;
              v100 = v21;
              _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
            }
            qword_1E911F420 = [v21 UTF8String];
            __break(0);
            JUMPOUT(0x18AABE9B8);
          }
          uint64_t v20 = [v18 selector];
          if (v20 != [v19 selector])
          {
            v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[newMethod selector] == [newMethod selector]", v70];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(a2);
              id v26 = (id)objc_claimAutoreleasedReturnValue();
              v27 = (objc_class *)objc_opt_class();
              v28 = NSStringFromClass(v27);
              *(_DWORD *)buf = 138544642;
              id v90 = v26;
              __int16 v91 = 2114;
              uint64_t v92 = (uint64_t)v28;
              __int16 v93 = 2048;
              id v94 = v77;
              __int16 v95 = 2114;
              v96 = @"BSObjCRuntime.m";
              __int16 v97 = 1024;
              int v98 = 1157;
              __int16 v99 = 2114;
              v100 = v25;
              _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
            }
            qword_1E911F420 = [v25 UTF8String];
            __break(0);
            JUMPOUT(0x18AABEAC4);
          }
          if (v19 != v17)
          {
            objc_msgSend(v11, "replaceObjectAtIndex:withObject:", objc_msgSend(obj, "indexOfObjectIdenticalTo:", v17), v19);
            char v14 = 1;
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v83 objects:v88 count:16];
      }
      while (v13);

      if ((v14 & 1) == 0)
      {
        char v71 = 0;
LABEL_25:

        v8 = obj;
        goto LABEL_26;
      }
      id v12 = v11;
    }

    id obj = v12;
    goto LABEL_25;
  }
  char v71 = 0;
LABEL_26:
  v78 = [MEMORY[0x1E4F1CA80] set];
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v29 = v8;
  id obja = v29;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v79 objects:v87 count:16];
  if (!v30) {
    goto LABEL_66;
  }
  uint64_t v31 = *(void *)v80;
  do
  {
    uint64_t v32 = 0;
    do
    {
      if (*(void *)v80 != v31) {
        objc_enumerationMutation(obja);
      }
      uint64_t v33 = *(void *)(*((void *)&v79 + 1) + 8 * v32);
      v34 = [v78 member:v33];
      v35 = v34;
      if (!v34)
      {
        [v78 addObject:v33];
        goto LABEL_60;
      }
      v36 = v34;
      if (!v33
        || ![(id)v33 isEqual:v36]
        || (CFArrayRef v37 = *(const __CFArray **)(v33 + 24), v38 = v36[3], v37 != v38)
        && (v37 ? (BOOL v39 = v38 == 0) : (BOOL v39 = 1),
            v39 || (-[__CFArray isEqualToString:](v37, "isEqualToString:") & 1) == 0)
        || (CFArrayRef v40 = *(const __CFArray **)(v33 + 16), v41 = v36[2], v40 != v41)
        && (v40 ? (BOOL v42 = v41 == 0) : (BOOL v42 = 1),
            v42 || !-[__CFArray isEqualToString:](v40, "isEqualToString:")))
      {
LABEL_56:

        goto LABEL_57;
      }
      uint64_t v43 = *(void *)(v33 + 48);
      CFArrayRef v44 = v36[6];
      if (v43)
      {
        if (!v44 || !-[BSObjCValue _isIndistinguishableFromValue:](v43, v44)) {
          goto LABEL_56;
        }
      }
      else if (v44)
      {
        goto LABEL_56;
      }
      if (!BSEqualArrays(*(CFArrayRef *)(v33 + 40), v36[5])) {
        goto LABEL_56;
      }
      unint64_t v45 = 0;
      while (v45 < [*(id *)(v33 + 40) count])
      {
        v46 = [*(id *)(v33 + 40) objectAtIndex:v45];
        v47 = [(__CFArray *)v36[5] objectAtIndex:v45];
        BOOL v48 = -[BSObjCValue _isIndistinguishableFromValue:]((uint64_t)v46, v47);

        ++v45;
        if (!v48) {
          goto LABEL_56;
        }
      }
      BOOL v50 = *(void *)(v33 + 8) == (void)v36[1];

      if (v50)
      {
        v49 = BSLogCommon();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543874;
          id v90 = v73;
          __int16 v91 = 2114;
          uint64_t v92 = v33;
          __int16 v93 = 2114;
          id v94 = v36;
          _os_log_debug_impl(&dword_18AAA8000, v49, OS_LOG_TYPE_DEBUG, "BSObjCProtocol '%{public}@' : dropping duplicated method : method=%{public}@ existing=%{public}@", buf, 0x20u);
        }
        goto LABEL_59;
      }
LABEL_57:
      v49 = BSLogCommon();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543874;
        id v90 = v73;
        __int16 v91 = 2114;
        uint64_t v92 = v33;
        __int16 v93 = 2114;
        id v94 = v36;
        _os_log_fault_impl(&dword_18AAA8000, v49, OS_LOG_TYPE_FAULT, "BSObjCProtocol '%{public}@' : dropping distinguishable method due to selector collision : method=%{public}@ existing=%{public}@", buf, 0x20u);
      }
LABEL_59:

LABEL_60:
      ++v32;
    }
    while (v32 != v30);
    id v29 = obja;
    uint64_t v51 = [obja countByEnumeratingWithState:&v79 objects:v87 count:16];
    uint64_t v30 = v51;
  }
  while (v51);
LABEL_66:

  v52 = [BSObjCProtocol alloc];
  v53 = v72;
  self;
  v54 = [MEMORY[0x1E4F1CA48] array];
  *(_DWORD *)buf = 0;
  v55 = protocol_copyProtocolList(v53, (unsigned int *)buf);
  if (v55)
  {
    if (*(_DWORD *)buf)
    {
      unint64_t v56 = 0;
      do
      {
        if (qword_1EB21B118 != -1) {
          dispatch_once(&qword_1EB21B118, &__block_literal_global_565);
        }
        v57 = v55[v56];
        if (v57 != (Protocol *)qword_1EB21B120)
        {
          v58 = +[BSObjCProtocol protocolForProtocol:v57];
          [v54 addObject:v58];
        }
        ++v56;
      }
      while (v56 < *(unsigned int *)buf);
    }
    free(v55);
  }

  v59 = [v78 allObjects];
  v60 = v53;
  self;
  v61 = [MEMORY[0x1E4F1CA48] array];
  v62 = +[BSObjCProtocol _gatherPropertyMetadataForProtocol:required:]((uint64_t)BSObjCProtocol, v60, 1);
  [v61 addObjectsFromArray:v62];

  v63 = +[BSObjCProtocol _gatherPropertyMetadataForProtocol:required:]((uint64_t)BSObjCProtocol, v60, 0);
  [v61 addObjectsFromArray:v63];

  v64 = -[BSObjCProtocol _initWithName:protocol:inherited:methods:properties:virtual:]((id *)&v52->super.isa, v73, v60, v54, v59, v61, v71);
  return v64;
}

+ (id)_gatherPropertyMetadataForProtocol:(BOOL)a3 required:
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  proto = a2;
  self;
  id v29 = [MEMORY[0x1E4F1CA48] array];
  unsigned int outCount = 0;
  uint64_t v31 = protocol_copyPropertyList2(proto, &outCount, a3, 1);
  if (v31)
  {
    if (outCount)
    {
      unint64_t v4 = 0;
      v5 = @"optional --> required";
      BOOL isRequiredMethod = !a3;
      if (a3) {
        v5 = @"required --> optional";
      }
      v27 = v5;
      do
      {
        uint64_t v6 = (void *)MEMORY[0x18C125360]();
        uint64_t v7 = v31[v4];
        uint64_t v8 = self;
        if (!v7)
        {
          uint64_t v22 = v8;
          v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"aProperty != ((void *)0)"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(sel_propertyWithProperty_required_);
            id v24 = (id)objc_claimAutoreleasedReturnValue();
            v25 = (objc_class *)objc_opt_class();
            NSStringFromClass(v25);
            id v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544642;
            id v34 = v24;
            __int16 v35 = 2114;
            v36 = v26;
            __int16 v37 = 2048;
            uint64_t v38 = v22;
            __int16 v39 = 2114;
            CFArrayRef v40 = @"BSObjCRuntime.m";
            __int16 v41 = 1024;
            int v42 = 581;
            __int16 v43 = 2114;
            CFArrayRef v44 = v23;
            _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          qword_1E911F420 = [v23 UTF8String];
          __break(0);
          JUMPOUT(0x18AABF7C0);
        }
        v9 = objc_msgSend(NSString, "bs_stringWithUTF8String:", property_getName(v7));
        v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "bsobjc_attributesForProperty:", v7);
        char v11 = v10;
        if (!a3) {
          [v10 setObject:&stru_1ED76E928 forKey:@"?"];
        }
        id v12 = v9;
        id v13 = v11;
        uint64_t v14 = self;
        uint64_t v15 = [v13 objectForKey:@"T"];
        if ([v15 length])
        {
          long long v16 = +[BSObjCValue _valueWithEncoding:]((uint64_t)BSObjCValue, v15);
          +[BSObjCProperty propertyWithName:value:attributes:](v14, v12, v16, v13);
          long long v17 = (unsigned char *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          long long v16 = BSLogCommon();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v34 = v12;
            _os_log_impl(&dword_18AAA8000, v16, OS_LOG_TYPE_DEFAULT, "Attributes for property \"%{public}@\" contained no type information.", buf, 0xCu);
          }
          long long v17 = 0;
        }

        if (v17)
        {
          long long v18 = -[BSObjCProperty _getSelector]((uint64_t)v17);
          if (!(unint64_t)protocol_getMethodDescription(proto, v18, a3, 1).name
            && (unint64_t)protocol_getMethodDescription(proto, v18, isRequiredMethod, 1).name)
          {
            v17[32] = isRequiredMethod;
            long long v19 = BSLogCommon();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v20 = [v17 name];
              *(_DWORD *)buf = 138412546;
              id v34 = v20;
              __int16 v35 = 2112;
              v36 = v27;
              _os_log_debug_impl(&dword_18AAA8000, v19, OS_LOG_TYPE_DEBUG, "[rdar://100354962] Fixing incorrect property returned by protocol_copyPropertyList2() for \"%@\": %@", buf, 0x16u);
            }
          }
          [v29 addObject:v17];
        }

        ++v4;
      }
      while (v4 < outCount);
    }
    free(v31);
  }

  return v29;
}

+ (id)_gatherMethodMetadataForProtocol:(BOOL)a3 required:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = a2;
  self;
  id v15 = [MEMORY[0x1E4F1CA48] array];
  unsigned int outCount = 0;
  v5 = protocol_copyMethodDescriptionList(v4, a3, 1, &outCount);
  if (v5)
  {
    uint64_t v14 = v5;
    if (outCount)
    {
      unint64_t v6 = 0;
      p_name = &v5->name;
      do
      {
        uint64_t v8 = (void *)MEMORY[0x18C125360]();
        v9 = *p_name;
        uint64_t MethodTypeEncoding = _protocol_getMethodTypeEncoding();
        if (!MethodTypeEncoding) {
          uint64_t MethodTypeEncoding = (uint64_t)protocol_getMethodDescription(v4, v9, a3, 1).types;
        }
        uint64_t v11 = +[BSObjCMethod methodWithSelector:typeEncoding:]((uint64_t)BSObjCMethod, v9, MethodTypeEncoding);
        id v12 = (void *)v11;
        if (v11)
        {
          *(void *)(v11 + 8) = a3;
          [v15 addObject:v11];
        }

        ++v6;
        p_name += 2;
      }
      while (v6 < outCount);
    }
    free(v14);
  }

  return v15;
}

- (id)_initWithName:(void *)a3 protocol:(void *)a4 inherited:(void *)a5 methods:(void *)a6 properties:(char)a7 virtual:
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v43 = a2;
  id v42 = a3;
  id v44 = a4;
  id v45 = a5;
  id v13 = a6;
  if (a1)
  {
    v50.receiver = a1;
    v50.super_class = (Class)BSObjCProtocol;
    a1 = (id *)objc_msgSendSuper2(&v50, sel_init, v42);
    if (a1)
    {
      uint64_t v14 = [v43 copy];
      id v15 = a1[3];
      a1[3] = (id)v14;

      objc_storeStrong(a1 + 4, a3);
      uint64_t v16 = [v44 copy];
      id v17 = a1[1];
      a1[1] = (id)v16;

      uint64_t v18 = [v45 copy];
      id v19 = a1[5];
      a1[5] = (id)v18;

      uint64_t v20 = [v13 copy];
      id v21 = a1[6];
      a1[6] = (id)v20;

      *((unsigned char *)a1 + 16) = a7;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v22 = a1[6];
      uint64_t v23 = [v22 countByEnumeratingWithState:&v46 objects:v51 count:16];
      if (!v23) {
        goto LABEL_21;
      }
      uint64_t v24 = *(void *)v47;
      while (1)
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v47 != v24) {
            objc_enumerationMutation(v22);
          }
          uint64_t v26 = *(void *)(*((void *)&v46 + 1) + 8 * v25);
          if (!*(void *)(v26 + 16))
          {
            uint64_t v27 = [a1 methodForSelector:-[BSObjCProperty _getSelector](*(void *)(*((void *)&v46 + 1) + 8 * v25))];
            v28 = *(void **)(v26 + 16);
            *(void *)(v26 + 16) = v27;

            if (!*(void *)(v26 + 16))
            {
              uint64_t v33 = *(void **)(v26 + 8);
              id v34 = -[BSObjCProperty _getSelector](v26);
              uint64_t v35 = +[BSObjCMethod _propertyGetterForValue:withSelector:]((uint64_t)BSObjCMethod, v33, v34);
              uint64_t v32 = *(void **)(v26 + 16);
              *(void *)(v26 + 16) = v35;
              goto LABEL_14;
            }
            if ([*(id *)(v26 + 8) isBlock])
            {
              id v29 = [*(id *)(v26 + 8) blockReturnValue];
              BOOL v30 = v29 == 0;

              if (v30)
              {
                uint64_t v31 = [*(id *)(v26 + 16) returnValue];
                uint64_t v32 = *(void **)(v26 + 8);
                *(void *)(v26 + 8) = v31;
LABEL_14:
              }
            }
          }
          v36 = -[BSObjCProperty _setSelector]((id *)v26);
          if (v36)
          {
            if (!*(void *)(v26 + 24))
            {
              uint64_t v37 = [a1 methodForSelector:v36];
              uint64_t v38 = *(void **)(v26 + 24);
              *(void *)(v26 + 24) = v37;

              if (!*(void *)(v26 + 24))
              {
                uint64_t v39 = +[BSObjCMethod _propertySetterForValue:withSelector:]((uint64_t)BSObjCMethod, *(void **)(v26 + 8), v36);
                CFArrayRef v40 = *(void **)(v26 + 24);
                *(void *)(v26 + 24) = v39;
              }
            }
          }
          ++v25;
        }
        while (v23 != v25);
        uint64_t v23 = [v22 countByEnumeratingWithState:&v46 objects:v51 count:16];
        if (!v23)
        {
LABEL_21:

          break;
        }
      }
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_methods, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_inheritedProtocols, 0);
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (BSObjCProtocol *)a3;
  if (self == v4) {
    goto LABEL_18;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class() || self->_virtual || v4->_virtual) {
    goto LABEL_5;
  }
  name = self->_name;
  uint64_t v8 = v4->_name;
  if (name != v8)
  {
    char v6 = 0;
    if (!name || !v8) {
      goto LABEL_19;
    }
    if (!-[NSString isEqualToString:](name, "isEqualToString:")) {
      goto LABEL_5;
    }
  }
  inheritedProtocols = self->_inheritedProtocols;
  v10 = v4->_inheritedProtocols;
  if (inheritedProtocols != v10)
  {
    char v6 = 0;
    if (!inheritedProtocols || !v10) {
      goto LABEL_19;
    }
    if (!-[NSArray isEqual:](inheritedProtocols, "isEqual:"))
    {
LABEL_5:
      char v6 = 0;
      goto LABEL_19;
    }
  }
  methods = self->_methods;
  id v12 = v4->_methods;
  if (methods == v12)
  {
LABEL_18:
    char v6 = 1;
    goto LABEL_19;
  }
  char v6 = 0;
  if (methods && v12) {
    char v6 = -[NSArray isEqual:](methods, "isEqual:");
  }
LABEL_19:

  return v6;
}

void __53__BSObjCProtocol__gatherAdoptedProtocolsForProtocol___block_invoke()
{
  uint64_t v0 = objc_getProtocol("NSObject");
  v1 = (void *)qword_1EB21B120;
  qword_1EB21B120 = v0;
}

- (BSObjCProtocol)init
{
  unint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"BSObjCRuntime.m" lineNumber:1100 description:@"init is not allowed on BSObjCProtocol"];

  return 0;
}

- (id)propertyWithName:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_properties;
  id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "name", (void)v13);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)inheritedProtocolForProtocol:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = NSStringFromProtocol((Protocol *)a3);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_inheritedProtocols;
  id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "name", (void)v13);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  inheritedProtocols = self->_inheritedProtocols;
  if (inheritedProtocols) {
    uint64_t v5 = [(NSArray *)inheritedProtocols count] + 117991;
  }
  else {
    uint64_t v5 = 108109;
  }
  return v5 ^ v3;
}

- (NSString)description
{
  return (NSString *)[(BSObjCProtocol *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(BSObjCProtocol *)self succinctDescriptionBuilder];
  NSUInteger v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  NSUInteger v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_name withName:@"name"];
  if (self->_virtual) {
    id v5 = (id)[v3 appendObject:@"VIRTUAL" withName:0];
  }
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  NSUInteger v3 = [(BSObjCProtocol *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(BSObjCProtocol *)self succinctDescriptionBuilder];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__BSObjCProtocol_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E54456B8;
  v10[4] = self;
  id v6 = v5;
  id v11 = v6;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v10];
  uint64_t v7 = v11;
  id v8 = v6;

  return v8;
}

void __56__BSObjCProtocol_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) methods];
  NSUInteger v3 = (void *)[v2 mutableCopy];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = [*(id *)(a1 + 32) properties];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v9 = [v8 getter];
        [v3 removeObject:v9];

        v10 = [v8 setter];
        [v3 removeObject:v10];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v5);
  }

  id v11 = [*(id *)(a1 + 32) properties];
  [v3 addObjectsFromArray:v11];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = v3;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v12);
        }
        id v16 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", *(void *)(*((void *)&v19 + 1) + 8 * j), 0, (void)v19);
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v13);
  }

  id v17 = *(void **)(a1 + 40);
  uint64_t v18 = [*(id *)(a1 + 32) inheritedProtocols];
  [v17 appendArraySection:v18 withName:@"inheritedProtocols" skipIfEmpty:1];
}

@end