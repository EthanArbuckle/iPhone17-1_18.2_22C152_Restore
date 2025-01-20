@interface NSObject(AXPropertyListCoersion)
- (id)_axRecursivelyPropertyListCoercedRepresentationWithError:()AXPropertyListCoersion;
- (uint64_t)_axDictionaryKeyReplacementRepresentation;
- (uint64_t)_axReconstitutedRepresentationForDictionaryKeyReplacement;
- (uint64_t)_axRecursivelyReconstitutedRepresentationFromPropertyListWithError:()AXPropertyListCoersion;
@end

@implementation NSObject(AXPropertyListCoersion)

- (id)_axRecursivelyPropertyListCoercedRepresentationWithError:()AXPropertyListCoersion
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (smugglingDictionaryForCoreFoundationObject_onceToken != -1) {
    dispatch_once(&smugglingDictionaryForCoreFoundationObject_onceToken, &__block_literal_global_13);
  }
  CFTypeID v5 = CFGetTypeID(cf);
  if (v5 == smugglingDictionaryForCoreFoundationObject_CFBooleanTypeID)
  {
    *(void *)&long long valuePtr = AXSerializeSmuggledTypeCFBoolean;
    v31 = @"SmugType";
    v32 = @"Value";
    v6 = [NSNumber numberWithUnsignedChar:CFBooleanGetValue((CFBooleanRef)cf)];
    *((void *)&valuePtr + 1) = v6;
LABEL_10:
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&valuePtr forKeys:&v31 count:2];
LABEL_11:

    goto LABEL_12;
  }
  if (v5 == smugglingDictionaryForCoreFoundationObject_CFUUIDTypeID)
  {
    uint64_t v7 = smugglingDictionaryForCFUUID((const __CFUUID *)cf);
LABEL_7:
    v8 = (void *)v7;
    goto LABEL_12;
  }
  if (v5 == smugglingDictionaryForCoreFoundationObject_AXUIElementTypeID)
  {
    unint64_t v9 = *(void *)(cf + 20);
    unint64_t v10 = *(void *)(cf + 28);
    LODWORD(v26) = bswap32(*((_DWORD *)cf + 4));
    unint64_t v27 = bswap64(v10);
    unint64_t v28 = bswap64(v9);
    v6 = [MEMORY[0x1E4F1CA58] data];
    [v6 appendBytes:&v26 length:4];
    [v6 appendBytes:&v28 length:8];
    [v6 appendBytes:&v27 length:8];
    v31 = @"SmugType";
    v32 = @"Value";
    *(void *)&long long valuePtr = AXSerializeSmuggledTypeAXUIElement;
    *((void *)&valuePtr + 1) = v6;
    goto LABEL_10;
  }
  if (v5 == smugglingDictionaryForCoreFoundationObject_AXValueTypeID)
  {
    uint64_t Type = AXValueGetType((AXValueRef)cf);
    v6 = [MEMORY[0x1E4F1CA58] data];
    switch((int)Type)
    {
      case 1:
        long long valuePtr = 0uLL;
        v13 = (const __AXValue *)cf;
        AXValueType v14 = kAXValueTypeCGPoint;
        goto LABEL_37;
      case 2:
        long long valuePtr = 0uLL;
        v13 = (const __AXValue *)cf;
        AXValueType v14 = kAXValueTypeCGSize;
        goto LABEL_37;
      case 3:
        long long valuePtr = 0u;
        long long v30 = 0u;
        AXValueGetValue((AXValueRef)cf, kAXValueTypeCGRect, &valuePtr);
        v31 = (__CFString *)bswap64(valuePtr);
        unint64_t v27 = bswap64(v30);
        unint64_t v28 = bswap64(*((unint64_t *)&valuePtr + 1));
        unint64_t v26 = bswap64(*((unint64_t *)&v30 + 1));
        [v6 appendBytes:&v31 length:8];
        [v6 appendBytes:&v28 length:8];
        [v6 appendBytes:&v27 length:8];
        v22 = &v26;
        goto LABEL_38;
      case 4:
        long long valuePtr = 0uLL;
        v13 = (const __AXValue *)cf;
        AXValueType v14 = kAXValueTypeCFRange;
LABEL_37:
        AXValueGetValue(v13, v14, &valuePtr);
        v31 = (__CFString *)bswap64(valuePtr);
        unint64_t v28 = bswap64(*((unint64_t *)&valuePtr + 1));
        [v6 appendBytes:&v31 length:8];
        v22 = &v28;
LABEL_38:
        v23 = v6;
        uint64_t v24 = 8;
        goto LABEL_39;
      case 5:
        LODWORD(valuePtr) = 0;
        AXValueGetValue((AXValueRef)cf, kAXValueTypeAXError, &valuePtr);
        LODWORD(v31) = bswap32(valuePtr);
        v22 = (unint64_t *)&v31;
        v23 = v6;
        uint64_t v24 = 4;
LABEL_39:
        [v23 appendBytes:v22 length:v24];
        break;
      default:
        break;
    }
    uint64_t v21 = AXSerializeSmuggledTypeAXValue;
LABEL_41:
    *(void *)&long long valuePtr = v21;
    v31 = @"SmugType";
    v32 = @"ValueType";
    v25 = [NSNumber numberWithInt:Type];
    v33 = @"Value";
    *((void *)&valuePtr + 1) = v25;
    *(void *)&long long v30 = v6;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&valuePtr forKeys:&v31 count:3];

    goto LABEL_11;
  }
  if (v5 == smugglingDictionaryForCoreFoundationObject_CGColorTypeID)
  {
    ColorSpace = CGColorGetColorSpace((CGColorRef)cf);
    uint64_t Model = CGColorSpaceGetModel(ColorSpace);
    if (Model >= 3)
    {
      if (a3)
      {
        [MEMORY[0x1E4F28C58] errorWithDomain:@"AXSerialize3ErrorDomain" code:3 userInfo:0];
        v8 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }
LABEL_12:
      if (v8) {
        goto LABEL_16;
      }
      goto LABEL_13;
    }
    uint64_t Type = Model;
    size_t NumberOfComponents = CGColorGetNumberOfComponents((CGColorRef)cf);
    v6 = [MEMORY[0x1E4F1CA58] data];
    Components = CGColorGetComponents((CGColorRef)cf);
    if (NumberOfComponents)
    {
      v19 = (unint64_t *)Components;
      do
      {
        unint64_t v20 = *v19++;
        *(void *)&long long valuePtr = bswap64(v20);
        [v6 appendBytes:&valuePtr length:8];
        --NumberOfComponents;
      }
      while (NumberOfComponents);
    }
    uint64_t v21 = AXSerializeSmuggledTypeCGColor;
    goto LABEL_41;
  }
  if (v5 == smugglingDictionaryForCoreFoundationObject_CGPathTypeID)
  {
    uint64_t v7 = smugglingDictionaryForCGPath((const CGPath *)cf);
    goto LABEL_7;
  }
  if (v5 == smugglingDictionaryForCoreFoundationObject_CTFontTypeID)
  {
    uint64_t v7 = smugglingDictionaryForCTFont((const __CTFont *)cf, (uint64_t)a3);
    goto LABEL_7;
  }
  if (v5 == smugglingDictionaryForCoreFoundationObject_CFNullTypeID)
  {
    uint64_t v7 = smugglingDictionaryForCFNull();
    goto LABEL_7;
  }
  if (v5 == smugglingDictionaryForCoreFoundationObject_CFURLTypeID)
  {
    uint64_t v7 = smugglingDictionaryForCFURL((const __CFURL *)cf);
    goto LABEL_7;
  }
LABEL_13:
  if (*a3)
  {
    v8 = 0;
  }
  else
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"AXSerialize3ErrorDomain" code:1 userInfo:0];
    v8 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_16:
  return v8;
}

- (uint64_t)_axRecursivelyReconstitutedRepresentationFromPropertyListWithError:()AXPropertyListCoersion
{
  if (a3)
  {
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AXSerialize3ErrorDomain" code:1 userInfo:0];
  }
  return 0;
}

- (uint64_t)_axDictionaryKeyReplacementRepresentation
{
  return 0;
}

- (uint64_t)_axReconstitutedRepresentationForDictionaryKeyReplacement
{
  return 0;
}

@end