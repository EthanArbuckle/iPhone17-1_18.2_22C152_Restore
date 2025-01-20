@interface _UTConstantType
+ (BOOL)supportsSecureCoding;
+ (Ivar)_validateThisClass;
+ (id)allocWithZone:(_NSZone *)a3;
+ (objc_ivar)_validateThisClass;
+ (void)_validateThisClass;
- (BOOL)_isRealized;
- (BOOL)conformsToType:(id)a3;
- (BOOL)isDeclared;
- (BOOL)isDynamic;
- (BOOL)isPublicType;
- (Class)classForCoder;
- (id)_preferredTagOfClass:(id)a3;
- (id)_typeRecord;
- (id)debugDescription;
- (id)identifier;
- (id)supertypes;
- (id)tags;
- (unint64_t)_getEnclosureColors:(UTHardwareColor *)a3 count:(unint64_t)a4;
- (void)_unrealize;
@end

@implementation _UTConstantType

- (Class)classForCoder
{
  v2 = UTType;
  return (Class)UTType;
}

- (id)_preferredTagOfClass:(id)a3
{
  if ([a3 isEqual:@"public.filename-extension"])
  {
    if (_UTAlwaysUseSlowPathForPreferredExtension)
    {
      v14 = self;
      v9 = (objc_super *)&v14;
LABEL_20:
      v9->super_class = (Class)_UTConstantType;
      -[objc_super _preferredTagOfClass:](v9, sel__preferredTagOfClass_, a3, v11.receiver, v11.super_class, v12.receiver, v12.super_class, v13.receiver);
      goto LABEL_21;
    }
    if ((*((unsigned char *)&self->_fields + 8) & 3) != 1 && (*((unsigned char *)&self->_fields + 8) & 4) == 0)
    {
      preferredExtension = self->_fields.preferredExtension;
      if (strncmp(self->_fields.preferredExtension, "\x01none", 7uLL))
      {
        if (*preferredExtension)
        {
          v7 = objc_msgSend([NSString alloc], "initWithBytesNoCopy:length:encoding:freeWhenDone:", preferredExtension, strnlen(preferredExtension, 7uLL), 4, 0);
          goto LABEL_22;
        }
        v13.receiver = self;
        v9 = &v13;
        goto LABEL_20;
      }
    }
LABEL_16:
    v7 = 0;
    goto LABEL_22;
  }
  if ([a3 isEqual:@"public.mime-type"])
  {
    if ((*((unsigned char *)&self->_fields + 8) & 3) == 1 || (*((unsigned char *)&self->_fields + 8) & 4) != 0) {
      goto LABEL_16;
    }
    -[UTType _preferredTagOfClass:](&v12, sel__preferredTagOfClass_, a3, v11.receiver, v11.super_class, self, _UTConstantType, v13.receiver);
  }
  else
  {
    -[UTType _preferredTagOfClass:](&v11, sel__preferredTagOfClass_, a3, self, _UTConstantType, v12.receiver, v12.super_class, v13.receiver);
  }
  v7 = LABEL_21:;
LABEL_22:

  return v7;
}

- (BOOL)isDeclared
{
  return UTTypeIsDynamic((CFStringRef)self->_fields.identifier) == 0;
}

- (BOOL)isDynamic
{
  return UTTypeIsDynamic((CFStringRef)self->_fields.identifier) != 0;
}

- (BOOL)conformsToType:(id)a3
{
  if (self == a3) {
    return 1;
  }
  if ((*((unsigned char *)&self->_fields + 8) & 8) != 0)
  {
    identifier = (__CFString *)self->_fields.identifier;
    v5 = [a3 identifier];
    BOOL v3 = _UTIdentifiersAreEqual(identifier, v5);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UTConstantType;
    return -[UTType conformsToType:](&v7, sel_conformsToType_);
  }
  return v3;
}

- (id)identifier
{
  return self->_fields.identifier;
}

- (id)_typeRecord
{
  os_unfair_recursive_lock_lock_with_options();
  p_typeRecord = &self->super._typeRecord;
  typeRecord = self->super._typeRecord;
  v5 = (id *)MEMORY[0x1E4F1D260];
  if (!typeRecord)
  {
    uint64_t v6 = [MEMORY[0x1E4F22490] typeRecordWithIdentifier:self->_fields.identifier];
    objc_super v7 = *p_typeRecord;
    *p_typeRecord = (UTTypeRecord *)v6;

    _UTDetachTypeRecords((uint64_t)&self->super._typeRecord, 1);
    typeRecord = *p_typeRecord;
    if (!*p_typeRecord)
    {
      __UNIFORM_TYPE_IDENTIFIERS_FAILED_TO_REALIZE_A_COMPILE_TIME_CONSTANT_TYPE_OBJECT__(self);
      objc_storeStrong((id *)&self->super._typeRecord, *v5);
      typeRecord = *p_typeRecord;
    }
  }
  v8 = typeRecord;
  v9 = v8;
  if (v8 == *v5)
  {

    v9 = 0;
  }
  os_unfair_recursive_lock_unlock();

  return v9;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return +[UTType allocWithZone:a3];
}

+ (void)_validateThisClass
{
  *(void *)&v44[13] = *MEMORY[0x1E4F143B8];
  BOOL v3 = UniformTypeIdentifiers::CoreTypes::log((UniformTypeIdentifiers::CoreTypes *)a1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    Name = class_getName((Class)a1);
    __int16 v43 = 2082;
    *(void *)v44 = "{Constant=^v{Fields=@b2b1b1b4[7c]}}";
    _os_log_impl(&dword_19B02E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s instance C structure encoding: %{public}s", buf, 0x16u);
  }
  cls = (objc_class *)a1;

  v4 = 0;
  v5 = 0;
  uint64_t v6 = 0;
  for (i = (objc_class *)a1; i && i != (objc_class *)objc_opt_class(); i = class_getSuperclass(i))
  {
    *(_DWORD *)buf = 0;
    v8 = class_copyIvarList(i, (unsigned int *)buf);
    if (v8)
    {
      unint64_t v9 = *(unsigned int *)buf;
      if (*(_DWORD *)buf)
      {
        unint64_t v10 = 0;
        do
        {
          if (v5 >= v6)
          {
            uint64_t v12 = v5 - v4;
            unint64_t v13 = v12 + 1;
            if ((unint64_t)(v12 + 1) >> 61) {
              std::vector<UTTypeRecord *>::__throw_length_error[abi:ne180100]();
            }
            if (((char *)v6 - (char *)v4) >> 2 > v13) {
              unint64_t v13 = ((char *)v6 - (char *)v4) >> 2;
            }
            if ((unint64_t)((char *)v6 - (char *)v4) >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v14 = v13;
            }
            if (v14)
            {
              if (v14 >> 61) {
                std::__throw_bad_array_new_length[abi:ne180100]();
              }
              v15 = (char *)operator new(8 * v14);
            }
            else
            {
              v15 = 0;
            }
            v16 = (Ivar *)&v15[8 * v12];
            Ivar *v16 = v8[v10];
            objc_super v11 = v16 + 1;
            while (v5 != v4)
            {
              v17 = *--v5;
              *--v16 = v17;
            }
            uint64_t v6 = (Ivar *)&v15[8 * v14];
            if (v4)
            {
              operator delete(v4);
              unint64_t v9 = *(unsigned int *)buf;
            }
            v4 = v16;
          }
          else
          {
            Ivar *v5 = v8[v10];
            objc_super v11 = v5 + 1;
          }
          ++v10;
          v5 = v11;
        }
        while (v10 < v9);
      }
      else
      {
        objc_super v11 = v5;
      }
      free(v8);
      v5 = v11;
    }
  }
  if ((char *)v5 - (char *)v4 < 1025)
  {
LABEL_36:
    v22 = 0;
    unint64_t v19 = 0;
  }
  else
  {
    v18 = (const std::nothrow_t *)MEMORY[0x1E4FBA2D0];
    unint64_t v19 = v5 - v4;
    while (1)
    {
      v20 = (objc_ivar **)operator new(8 * v19, v18);
      if (v20) {
        break;
      }
      BOOL v21 = v19 > 1;
      v19 >>= 1;
      if (!v21) {
        goto LABEL_36;
      }
    }
    v22 = v20;
  }
  v23 = std::__stable_sort<std::_ClassicAlgPolicy,+[_UTConstantType _validateThisClass];
  if (v22) {
    operator delete(v22);
  }
  v24 = UniformTypeIdentifiers::CoreTypes::log((UniformTypeIdentifiers::CoreTypes *)v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = class_getName(cls);
    *(_DWORD *)buf = 136446210;
    Name = v25;
    _os_log_impl(&dword_19B02E000, v24, OS_LOG_TYPE_DEFAULT, "%{public}s subclass ivar encoding:", buf, 0xCu);
  }

  if (v4 != v5)
  {
    v27 = v4;
    do
    {
      v28 = *v27;
      v29 = UniformTypeIdentifiers::CoreTypes::log(v26);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = ivar_getName(v28);
        int Offset = ivar_getOffset(v28);
        TypeEncoding = ivar_getTypeEncoding(v28);
        *(_DWORD *)buf = 136446722;
        Name = v30;
        __int16 v43 = 1024;
        *(_DWORD *)v44 = Offset;
        v44[2] = 2082;
        *(void *)&v44[3] = TypeEncoding;
        _os_log_impl(&dword_19B02E000, v29, OS_LOG_TYPE_DEFAULT, "   %{public}s @ %u: %{public}s", buf, 0x1Cu);
      }

      ++v27;
    }
    while (v27 != v5);
  }
  v33 = UniformTypeIdentifiers::CoreTypes::log(v26);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    size_t InstanceSize = class_getInstanceSize(cls);
    *(_DWORD *)buf = 134217984;
    Name = (const char *)InstanceSize;
    _os_log_impl(&dword_19B02E000, v33, OS_LOG_TYPE_DEFAULT, "   Size: %zu bytes", buf, 0xCu);
  }

  InstanceVariable = class_getInstanceVariable(cls, "_fields");
  if (!InstanceVariable)
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, cls, @"UTCoreTypes.mm", 356, @"Failed to find %s::_fields ivar description.", class_getName(cls));
  }
  ptrdiff_t v36 = ivar_getOffset(InstanceVariable);
  if (v36 != 16)
  {
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, cls, @"UTCoreTypes.mm", 362, @"Offset of %s::_fields is %zu at runtime, but we expected %zu during compilation. UTType may have had ivars added unintentionally.", class_getName(cls), v36, 16 object file lineNumber description];
  }
  if (v4) {
    operator delete(v4);
  }
}

- (BOOL)isPublicType
{
  return (unint64_t)CFStringFind((CFStringRef)self->_fields.identifier, @"public.", 9uLL).location == 0;
}

- (id)supertypes
{
  if ((*((unsigned char *)&self->_fields + 8) & 8) != 0)
  {
    v2 = [MEMORY[0x1E4F1CAD0] set];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)_UTConstantType;
    v2 = [(UTType *)&v4 supertypes];
  }

  return v2;
}

- (id)tags
{
  if ((*((unsigned char *)&self->_fields + 8) & 4) != 0)
  {
    v2 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)_UTConstantType;
    v2 = [(UTType *)&v4 tags];
  }

  return v2;
}

- (unint64_t)_getEnclosureColors:(UTHardwareColor *)a3 count:(unint64_t)a4
{
  if ((*((unsigned char *)&self->_fields + 8) & 3) == 2 || (*((unsigned char *)&self->_fields + 8) & 4) != 0) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)_UTConstantType;
  return [(UTType *)&v6 _getEnclosureColors:a3 count:a4];
}

- (BOOL)_isRealized
{
  os_unfair_recursive_lock_lock_with_options();
  typeRecord = self->super._typeRecord;
  os_unfair_recursive_lock_unlock();
  return typeRecord != 0;
}

- (void)_unrealize
{
  os_unfair_recursive_lock_lock_with_options();
  typeRecord = self->super._typeRecord;
  self->super._typeRecord = 0;

  os_unfair_recursive_lock_unlock();
}

- (id)debugDescription
{
  if (qword_1EB20A688 != -1) {
    dispatch_once(&qword_1EB20A688, &__block_literal_global_44);
  }
  if (_MergedGlobals_3)
  {
    int v3 = *((unsigned char *)&self->_fields + 8) & 3;
    objc_super v4 = &stru_1EEABA4F8;
    if (v3 == 2) {
      objc_super v4 = @"hw=no, ";
    }
    if (v3 == 1) {
      v5 = @"hw=yes, ";
    }
    else {
      v5 = v4;
    }
    id v6 = [NSString alloc];
    Class Class = object_getClass(self);
    identifier = self->_fields.identifier;
    BOOL v9 = [(_UTConstantType *)self _isRealized];
    char v10 = *((unsigned char *)&self->_fields + 8);
    int64_t v11 = [(UTType *)self _constantIndex];
    uint64_t v12 = @"yes";
    if ((v10 & 8) != 0) {
      unint64_t v13 = @"yes";
    }
    else {
      unint64_t v13 = @"no";
    }
    if ((v10 & 4) != 0) {
      unint64_t v14 = @"no";
    }
    else {
      unint64_t v14 = @"yes";
    }
    if (!v9) {
      uint64_t v12 = @"no";
    }
    v15 = (void *)[v6 initWithFormat:@"<%@ %p> { id=%@, r=%@, t=%@, r=%@, %@idx=%li }", Class, self, identifier, v12, v14, v13, v5, v11];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)_UTConstantType;
    v15 = [(UTType *)&v17 debugDescription];
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Ivar)_validateThisClass
{
  uint64_t v96 = a5;
  if (a5)
  {
    uint64_t v12 = result;
    while (a4 > a7 && v96 > a7)
    {
      if (!a4) {
        return result;
      }
      unint64_t v13 = 0;
      uint64_t v14 = -a4;
      while (1)
      {
        v15 = v12[v13 / 8];
        ptrdiff_t Offset = ivar_getOffset(*a2);
        result = (Ivar *)ivar_getOffset(v15);
        if (Offset < (uint64_t)result) {
          break;
        }
        v13 += 8;
        if (__CFADD__(v14++, 1)) {
          return result;
        }
      }
      uint64_t v18 = -v14;
      v93 = &v12[v13 / 8];
      uint64_t v94 = a7;
      uint64_t v19 = v96;
      v95 = a3;
      if (-v14 >= v96)
      {
        if (v14 == -1)
        {
          v87 = v12[v13 / 8];
          v12[v13 / 8] = *a2;
          *a2 = v87;
          return result;
        }
        if (v14 > 0) {
          uint64_t v18 = 1 - v14;
        }
        uint64_t v29 = v18 >> 1;
        v23 = (Ivar *)((char *)&v12[v18 >> 1] + v13);
        v30 = a3;
        v22 = a2;
        if (a2 != v30)
        {
          uint64_t v90 = v29;
          v91 = v12;
          unint64_t v31 = v95 - a2;
          v22 = a2;
          do
          {
            v32 = &v22[v31 >> 1];
            v34 = *v32;
            v33 = v32 + 1;
            v35 = *v23;
            ptrdiff_t v36 = ivar_getOffset(v34);
            ptrdiff_t v37 = ivar_getOffset(v35);
            if (v36 >= v37) {
              v31 >>= 1;
            }
            else {
              v31 += ~(v31 >> 1);
            }
            if (v36 < v37) {
              v22 = v33;
            }
          }
          while (v31);
          uint64_t v12 = v91;
          uint64_t v19 = v96;
          uint64_t v29 = v90;
        }
        uint64_t v21 = v22 - a2;
      }
      else
      {
        if (v96 >= 0) {
          uint64_t v20 = v96;
        }
        else {
          uint64_t v20 = v96 + 1;
        }
        uint64_t v21 = v20 >> 1;
        v22 = &a2[v20 >> 1];
        v23 = a2;
        if ((char *)a2 - (char *)v12 != v13)
        {
          uint64_t v89 = v20 >> 1;
          v92 = a6;
          unint64_t v24 = (uint64_t)((char *)a2 - (char *)v12 - v13) >> 3;
          v23 = &v12[v13 / 8];
          do
          {
            v25 = &v23[v24 >> 1];
            v27 = *v25;
            v26 = v25 + 1;
            ptrdiff_t v28 = ivar_getOffset(*v22);
            if (v28 < ivar_getOffset(v27))
            {
              v24 >>= 1;
            }
            else
            {
              v23 = v26;
              v24 += ~(v24 >> 1);
            }
          }
          while (v24);
          a6 = v92;
          uint64_t v19 = v96;
          uint64_t v21 = v89;
        }
        uint64_t v29 = (uint64_t)((char *)v23 - (char *)v12 - v13) >> 3;
      }
      if (v23 == a2)
      {
        a2 = v22;
      }
      else
      {
        uint64_t v38 = (char *)v22 - (char *)a2;
        if (v22 == a2)
        {
          a2 = v23;
        }
        else
        {
          v39 = v23 + 1;
          if (v23 + 1 == a2)
          {
            v44 = *v23;
            v45 = a2;
            size_t v46 = (char *)v22 - (char *)a2;
            uint64_t v47 = v29;
            uint64_t v48 = v21;
            memmove(v23, v45, v46);
            uint64_t v21 = v48;
            uint64_t v29 = v47;
            uint64_t v19 = v96;
            a2 = (Ivar *)((char *)v23 + v38);
            *(Ivar *)((char *)v23 + v38) = v44;
          }
          else
          {
            v40 = a2 + 1;
            if (a2 + 1 == v22)
            {
              v49 = *(v22 - 1);
              a2 = v23 + 1;
              if (v22 - 1 != v23)
              {
                uint64_t v50 = v29;
                uint64_t v51 = v21;
                memmove(v23 + 1, v23, (char *)(v22 - 1) - (char *)v23);
                uint64_t v21 = v51;
                uint64_t v29 = v50;
                uint64_t v19 = v96;
              }
              Ivar *v23 = v49;
            }
            else
            {
              uint64_t v41 = a2 - v23;
              if (v41 == v38 >> 3)
              {
                do
                {
                  v42 = *(v39 - 1);
                  *(v39 - 1) = *(v40 - 1);
                  *(v40 - 1) = v42;
                  if (v39 == a2) {
                    break;
                  }
                  ++v39;
                }
                while (v40++ != v22);
              }
              else
              {
                uint64_t v52 = v38 >> 3;
                uint64_t v53 = a2 - v23;
                do
                {
                  uint64_t v54 = v53;
                  uint64_t v53 = v52;
                  uint64_t v52 = v54 % v52;
                }
                while (v52);
                if (v53)
                {
                  v55 = &v23[v53];
                  do
                  {
                    v57 = *--v55;
                    v56 = v57;
                    v58 = &v55[v41];
                    v59 = v55;
                    do
                    {
                      v60 = v58;
                      Ivar *v59 = *v58;
                      v61 = &v58[v41];
                      BOOL v62 = __OFSUB__(v41, v22 - v58);
                      uint64_t v63 = v41 - (v22 - v58);
                      char v76 = (v63 < 0) ^ v62;
                      v58 = &v23[v63];
                      if (v76) {
                        v58 = v61;
                      }
                      v59 = v60;
                    }
                    while (v58 != v55);
                    Ivar *v60 = v56;
                  }
                  while (v55 != v23);
                }
                a2 = &v23[v38 >> 3];
              }
            }
          }
        }
      }
      a4 = -(v29 + v14);
      uint64_t v64 = v19 - v21;
      if (v29 + v21 >= v19 - (v29 + v21) - v14)
      {
        v66 = a2;
        v67 = v22;
        uint64_t v68 = v29;
        uint64_t v69 = v21;
        result = (Ivar *)std::__inplace_merge<std::_ClassicAlgPolicy,+[_UTConstantType _validateThisClass];
        a2 = v23;
        a7 = v94;
        uint64_t v64 = v69;
        a4 = v68;
        a3 = v66;
        uint64_t v12 = v93;
      }
      else
      {
        v65 = v23;
        a7 = v94;
        result = (Ivar *)std::__inplace_merge<std::_ClassicAlgPolicy,+[_UTConstantType _validateThisClass];
        uint64_t v12 = a2;
        a2 = v22;
        a3 = v95;
      }
      uint64_t v96 = v64;
      if (!v64) {
        return result;
      }
    }
    if (a4 <= v96)
    {
      if (v12 != a2)
      {
        uint64_t v78 = 0;
        do
        {
          a6[v78] = v12[v78];
          ++v78;
        }
        while (&v12[v78] != a2);
        if (v78 * 8)
        {
          v79 = a6;
          while (a2 != a3)
          {
            v80 = a3;
            v81 = v12;
            v82 = *v79;
            ptrdiff_t v83 = ivar_getOffset(*a2);
            v84 = v82;
            v85 = v81;
            a3 = v80;
            result = (Ivar *)ivar_getOffset(v84);
            if (v83 >= (uint64_t)result) {
              v86 = v79;
            }
            else {
              v86 = a2;
            }
            a2 += v83 < (uint64_t)result;
            v79 += v83 >= (uint64_t)result;
            Ivar *v85 = *v86;
            uint64_t v12 = v85 + 1;
            if (&a6[v78] == v79) {
              return result;
            }
          }
          return (Ivar *)memmove(v12, v79, (char *)a6 - (char *)v79 + v78 * 8);
        }
      }
    }
    else if (a3 != a2)
    {
      uint64_t v70 = 0;
      do
      {
        a6[v70] = a2[v70];
        ++v70;
      }
      while (&a2[v70] != a3);
      if (v70 * 8)
      {
        v71 = &a6[v70];
        v72 = a3 - 1;
        while (a2 != v12)
        {
          v73 = *(a2 - 1);
          v74 = v12;
          ptrdiff_t v75 = ivar_getOffset(*(v71 - 1));
          result = (Ivar *)ivar_getOffset(v73);
          char v76 = v75 < (uint64_t)result;
          uint64_t v12 = v74;
          if (v76) {
            v77 = a2;
          }
          else {
            v77 = v71;
          }
          if (v76) {
            --a2;
          }
          else {
            --v71;
          }
          *v72-- = *(v77 - 1);
          if (v71 == a6) {
            return result;
          }
        }
        uint64_t v88 = 0;
        do
        {
          v72[v88] = v71[v88 - 1];
          --v88;
        }
        while (&v71[v88] != a6);
      }
    }
  }
  return result;
}

+ (objc_ivar)_validateThisClass
{
  if (a3)
  {
    objc_super v4 = a4;
    id v6 = result;
    if (a3 == 1)
    {
LABEL_9:
      __CFString *v4 = *v6;
      return result;
    }
    if (a3 == 2)
    {
      v8 = a2 - 1;
      BOOL v9 = *result;
      ptrdiff_t Offset = ivar_getOffset(*(a2 - 1));
      result = (objc_ivar **)ivar_getOffset(v9);
      if (Offset >= (uint64_t)result) {
        int64_t v11 = v6;
      }
      else {
        int64_t v11 = v8;
      }
      *v4++ = *v11;
      if (Offset >= (uint64_t)result) {
        id v6 = v8;
      }
      goto LABEL_9;
    }
    if ((uint64_t)a3 > 8)
    {
      v23 = &result[a3 >> 1];
      std::__stable_sort<std::_ClassicAlgPolicy,+[_UTConstantType _validateThisClass];
      result = (objc_ivar **)std::__stable_sort<std::_ClassicAlgPolicy,+[_UTConstantType _validateThisClass];
      unint64_t v24 = &v6[a3 >> 1];
      while (v24 != a2)
      {
        v25 = v24;
        v26 = *v6;
        ptrdiff_t v27 = ivar_getOffset(*v24);
        result = (objc_ivar **)ivar_getOffset(v26);
        if (v27 >= (uint64_t)result) {
          ptrdiff_t v28 = v6;
        }
        else {
          ptrdiff_t v28 = v25;
        }
        unint64_t v24 = &v25[v27 < (uint64_t)result];
        v6 += v27 >= (uint64_t)result;
        *v4++ = *v28;
        if (v6 == v23)
        {
          if (v24 != a2)
          {
            uint64_t v29 = 0;
            v30 = &v25[v27 < (uint64_t)result];
            do
            {
              v4[v29] = v30[v29];
              ++v29;
            }
            while (&v30[v29] != a2);
          }
          return result;
        }
      }
      if (v6 != v23)
      {
        uint64_t v31 = 0;
        do
        {
          v4[v31] = v6[v31];
          ++v31;
        }
        while (&v6[v31] != v23);
      }
    }
    else if (result != a2)
    {
      uint64_t v12 = result + 1;
      *a4 = *result;
      if (result + 1 != a2)
      {
        uint64_t v13 = 0;
        uint64_t v14 = a4;
        do
        {
          v15 = v14;
          v16 = *v14++;
          ptrdiff_t v17 = ivar_getOffset(*v12);
          result = (objc_ivar **)ivar_getOffset(v16);
          uint64_t v18 = v14;
          if (v17 < (uint64_t)result)
          {
            v15[1] = *v15;
            uint64_t v18 = v4;
            if (v15 != v4)
            {
              uint64_t v19 = v13;
              while (1)
              {
                uint64_t v18 = (objc_ivar **)((char *)v4 + v19);
                uint64_t v20 = *(objc_ivar **)((char *)v4 + v19 - 8);
                ptrdiff_t v21 = ivar_getOffset(*v12);
                result = (objc_ivar **)ivar_getOffset(v20);
                if (v21 >= (uint64_t)result) {
                  break;
                }
                const std::nothrow_t *v18 = *(v18 - 1);
                v19 -= 8;
                if (!v19)
                {
                  uint64_t v18 = v4;
                  break;
                }
              }
            }
          }
          Ivar v22 = *v12++;
          const std::nothrow_t *v18 = v22;
          v13 += 8;
        }
        while (v12 != a2);
      }
    }
  }
  return result;
}

@end