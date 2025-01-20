@interface XRConstantEngineeringValue
+ (BOOL)supportsSecureCoding;
+ (id)engineeringValueOfType:(id)a3 value:(id)a4;
+ (id)engineeringValueWithTypeID:(unsigned __int16)a3 value:(id)a4;
- (BOOL)getLengthOfUint64Representation:(unint64_t *)a3;
- (BOOL)getValue:(id *)a3 fieldIndex:(unsigned __int16)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConstantEngineeringValue:(id)a3;
- (BOOL)isValid;
- (NSString)engineeringTypeMnemonic;
- (NSString)string;
- (XRConstantEngineeringValue)initWithCoder:(id)a3;
- (double)fixedDecimal;
- (id)copyWithZone:(_NSZone *)a3;
- (id)objectValue;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (unint64_t)uint64;
- (unsigned)engineeringType;
- (unsigned)implClass;
- (unsigned)uint32;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateUint64Values:(id)a3;
@end

@implementation XRConstantEngineeringValue

- (XRConstantEngineeringValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v12 = [self initWithValue:v5 unit:v6 format:v7 formatString:v8];
  if (v12)
  {
    v12->_implClass = [v4 _implClass];
    uint64_t v13 = objc_opt_class();
    uint64_t v16 = [v4 _mnemonic];
    mnemonic = v12->_mnemonic;
    v12->_mnemonic = (NSString *)v16;

    v12->_resolvedEtypeID = XREngineeringTypeIDForMnemonic(v12->_mnemonic);
    v18 = (void *)MEMORY[0x263EFFA08];
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    v26 = [v18 setWithObjects:v23, v19, v24, v25, v20, v21, v22, nil];
    uint64_t v29 = [v4 _value];
    id value = v12->_value;
    v12->_id value = (id)v29;
  }
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t implClass = self->_implClass;
  id v11 = a3;
  [v11 setValue:v5 forKey:@"_implClass"];
  [v11 setObject:self->_mnemonic forKey:@"_mnemonic"];
  [v11 encodeObject:self->_value forKey:@"_value"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t resolvedEtypeID = self->_resolvedEtypeID;
  uint64_t v6 = [self->_value copyWithZone:a2];
  v9 = [XRConstantEngineeringValue engineeringValueWithTypeID:v7 value:resolvedEtypeID value:(uint64_t)v6];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)engineeringValueOfType:(id)a3 value:(id)a4
{
  id v6 = a4;
  uint64_t v7 = XREngineeringTypeIDForMnemonic(a3);
  uint64_t v10 = [a1 engineeringValueWithTypeID:v8 value:v7 engineeringValue:v6];

  return v10;
}

+ (id)engineeringValueWithTypeID:(unsigned __int16)a3 value:(id)a4
{
  int v4 = a3;
  id v5 = a4;
  uint64_t v6 = objc_opt_new();
  objc_storeStrong((id *)(v6 + 8), XR_ENGINEERING_MNEMONIC_BY_ETYPE[v4]);
  *(_WORD *)(v6 + 16) = v4;
  *(unsigned char *)(v6 + 18) = XR_IMPLEMENTATION_CLASS_ID_BY_ETYPE[v4];
  uint64_t v11 = [v5 copyWithZone:v7];

  v12 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v11;

  return (id)v6;
}

- (BOOL)isValid
{
  return self->_value != 0;
}

- (unsigned)implClass
{
  return self->_implClass;
}

- (NSString)engineeringTypeMnemonic
{
  return self->_mnemonic;
}

- (unsigned)engineeringType
{
  return self->_resolvedEtypeID;
}

- (unint64_t)uint64
{
  return [self->_value unsignedLongLongValueWithObject:v2 selector:a2 arguments:v3, v4];
}

- (unsigned)uint32
{
  return ((uint64_t (*)(id, char *))MEMORY[0x270F9A6D0])(self->_value, sel_unsignedIntValue);
}

- (NSString)string
{
  return (NSString *)self->_value;
}

- (double)fixedDecimal
{
  [self->_value doubleValue:a2:v2:v3:v4];
  return result;
}

- (BOOL)getValue:(id *)a3 fieldIndex:(unsigned __int16)a4
{
  unsigned int v4 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v7 = self->_value;
  if ([v7 count:v8, v9, v10, v11] <= v4)
  {
    BOOL v19 = 0;
  }
  else
  {
    uint64_t v15 = [v7 objectAtIndexedSubscript:v12];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || [v15 conformsToProtocol:v16]
    {
      objc_storeStrong(a3, v15);
      BOOL v19 = 1;
    }
    else
    {
      BOOL v19 = 0;
    }
  }
  return v19;
}

- (BOOL)getLengthOfUint64Representation:(unint64_t *)a3
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  char v10 = isKindOfClass;
  if (a3 && (isKindOfClass & 1) != 0) {
    *a3 = [self->_value countWithOptions:v6 range:v7 subrange:v8 inString:v9];
  }
  return v10 & 1;
}

- (void)enumerateUint64Values:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  unsigned int v4 = (void (**)(id, void, uint64_t))a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = self->_value;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:v6 objects:&v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v19;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v5);
          }
          v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
          if (objc_opt_respondsToSelector())
          {
            uint64_t v17 = [v12 v13:v14 v15:v16];
            v4[2](v4, v9 + v11, v17);
          }
          ++v11;
        }
        while (v8 != v11);
        uint64_t v8 = [v5 countByEnumeratingWithState:v13 objects:&v18 count:16];
        v9 += v11;
      }
      while (v8);
    }
  }
}

- (id)objectValue
{
  return self->_value;
}

- (BOOL)isEqualToConstantEngineeringValue:(id)a3
{
  uint64_t v8 = (unsigned __int16 *)a3;
  if (self->_resolvedEtypeID == v8[8])
  {
    unsigned int v9 = [self v4:v5 v6:v6 v7:v7];
    BOOL v14 = 0;
    if (v9 <= 6)
    {
      if (((1 << v9) & 0x46) != 0)
      {
        uint64_t v15 = [self objectValue:v10 with:v11 with:v12 with:v13];
        long long v20 = [v8 objectValue:v25, v26, v27, v28];
        char isEqualToNumber = [v15 isEqualToNumber:v29 withValue:v20 andType:v30 andType:v31];
        goto LABEL_10;
      }
      if (((1 << v9) & 0x30) != 0)
      {
        uint64_t v15 = [self objectValue:v10 value:v11 value:v12 value:v13];
        long long v20 = [v8 objectValue:v16, v17, v18, v19];
        char isEqualToNumber = [v15 isEqualToArray:v21 withCount:(uint64_t)v20 withOptions:v22 withRange:v23];
LABEL_10:
        BOOL v14 = isEqualToNumber;

        goto LABEL_11;
      }
      if (v9 == 3)
      {
        uint64_t v15 = [self objectValue:v10 withValue:v11 withValue:v12 withValue:v13];
        long long v20 = [v8 objectValueWithKey:v32 value:v33 value:v34 value:v35];
        char isEqualToNumber = [v15 isEqualToString:v36];
        goto LABEL_10;
      }
    }
  }
  else
  {
    BOOL v14 = 0;
  }
LABEL_11:

  return v14;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  int v9 = [self v5:v6 v7:v8];
  int v14 = [v4 performSelector:v10 withObject:v11 withObject:v12 withObject:v13];
  unsigned int v19 = [self v15:v16 v17:v18];
  if (v9 == v14)
  {
    int64_t v24 = 0;
    if (v19 <= 6)
    {
      if (((1 << v19) & 0x46) != 0) {
        goto LABEL_17;
      }
      if (((1 << v19) & 0x30) != 0)
      {
        uint64_t v25 = [self objectValue:v20 withValue:v21 withValue:v22 withValue:v23];
        uint64_t v30 = [v4 objectValue:v26, v27, v28, v29];
        uint64_t v35 = [v25 v31:v32:v33:v34];
        uint64_t v40 = [v30 v36:v37:v38:v39];
        unint64_t v45 = [v25 v41:v42:v43:v44];
        int64_t v24 = v45;
        if (v35 == v40)
        {
          if (v45)
          {
            uint64_t v50 = 0;
            while (1)
            {
              v51 = [v25 objectAtIndexedSubscript:v46];
              v55 = [v30 objectAtIndexedSubscript:v52];
              int64_t v24 = [v51 compare:v56];

              if (v24) {
                break;
              }
              if ([v25 count:v59, v60, v61, v62] <= (unint64_t)++v50)
              {
                int64_t v24 = 0;
                goto LABEL_21;
              }
            }
          }
        }
        else if (v45 < [v30 count:v46, v47, v48, v49])
        {
          int64_t v24 = -1;
        }
        else
        {
          int64_t v24 = 1;
        }
        goto LABEL_21;
      }
      if (v19 == 3)
      {
LABEL_17:
        uint64_t v25 = [self objectValue:v20 withValue:v21 withValue:v22 withValue:v23];
        uint64_t v30 = [v4 objectValue:v72, v73, v74, v75];
        int64_t v24 = [v25 compare:v76 withOptions:(uint64_t)v30 usingComparator:v77];
LABEL_21:
      }
    }
  }
  else if (v19 == [v4 _implClass:v20 with:v21 with:v22 with:v23])
  {
    int64_t v24 = 0;
  }
  else
  {
    unsigned int v67 = [self v63:v64 v65:v66];
    if (v67 < [v4 v68:v69 v70:v71]) {
      int64_t v24 = -1;
    }
    else {
      int64_t v24 = 1;
    }
  }

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (XRConstantEngineeringValue *)a3;
  if (self == v4)
  {
    char isEqualToConstantEngineeringValue = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char isEqualToConstantEngineeringValue = [self isEqualToConstantEngineeringValue:v5 value:v4 unit:v6];
    }
    else {
      char isEqualToConstantEngineeringValue = 0;
    }
  }

  return isEqualToConstantEngineeringValue;
}

- (unint64_t)hash
{
  uint64_t v5 = [self objectValue:a2 withValue:v2 forKey:v3 withKey:v4];
  unint64_t v10 = [v5 hash:v6, v7, v8, v9];

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);

  objc_storeStrong((id *)&self->_mnemonic, 0);
}

@end