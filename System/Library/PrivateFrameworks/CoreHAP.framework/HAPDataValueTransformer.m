@interface HAPDataValueTransformer
+ (BOOL)isValidFormat:(unint64_t)a3;
+ (Class)expectedTransformedClassForFormat:(unint64_t)a3;
+ (id)defaultDataValueTransformer;
+ (void)initialize;
- (id)reverseTransformedValue:(id)a3 format:(unint64_t)a4 error:(id *)a5;
- (id)transformedValue:(id)a3 format:(unint64_t)a4 error:(id *)a5;
@end

@implementation HAPDataValueTransformer

- (id)reverseTransformedValue:(id)a3 format:(unint64_t)a4 error:(id *)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (v8
    && (v34.receiver = self,
        v34.super_class = (Class)HAPDataValueTransformer,
        -[HAPValueTransformer reverseTransformedValue:format:error:](&v34, sel_reverseTransformedValue_format_error_, v8, a4, a5), v9 = objc_claimAutoreleasedReturnValue(), int v10 = [v8 isEqual:v9], v9, !v10))
  {
    id v18 = 0;
  }
  else if (+[HAPDataValueTransformer isValidFormat:a4])
  {
    id v11 = v8;
    v12 = v11;
    switch(a4)
    {
      case 1uLL:
        if ([v11 length] != 1) {
          goto LABEL_34;
        }
        v13 = (unsigned __int8 *)[v12 bytes];
        id v14 = [NSNumber numberWithUnsignedChar:*v13];
        goto LABEL_41;
      case 2uLL:
        if ([v11 length] != 2) {
          goto LABEL_34;
        }
        v19 = (unsigned __int16 *)[v12 bytes];
        id v14 = [NSNumber numberWithUnsignedShort:*v19];
        goto LABEL_41;
      case 3uLL:
        if ([v11 length] != 4) {
          goto LABEL_34;
        }
        v20 = (unsigned int *)[v12 bytes];
        id v14 = [NSNumber numberWithUnsignedInt:*v20];
        goto LABEL_41;
      case 4uLL:
        if ([v11 length] != 8) {
          goto LABEL_34;
        }
        v21 = (void *)[v12 bytes];
        id v14 = [NSNumber numberWithUnsignedLongLong:*v21];
        goto LABEL_41;
      case 5uLL:
        if ([v11 length] != 1) {
          goto LABEL_34;
        }
        v22 = (char *)[v12 bytes];
        id v14 = [NSNumber numberWithChar:*v22];
        goto LABEL_41;
      case 6uLL:
        if ([v11 length] != 2) {
          goto LABEL_34;
        }
        v23 = (__int16 *)[v12 bytes];
        id v14 = [NSNumber numberWithShort:*v23];
        goto LABEL_41;
      case 7uLL:
        if ([v11 length] != 4) {
          goto LABEL_34;
        }
        v24 = (unsigned int *)[v12 bytes];
        id v14 = [NSNumber numberWithInt:*v24];
        goto LABEL_41;
      case 8uLL:
        if ([v11 length] != 8) {
          goto LABEL_34;
        }
        v25 = (void *)[v12 bytes];
        id v14 = [NSNumber numberWithLongLong:*v25];
        goto LABEL_41;
      case 9uLL:
        if ([v11 length] != 1) {
          goto LABEL_34;
        }
        if (*(unsigned char *)[v12 bytes] == 1) {
          v26 = (void *)MEMORY[0x1E4F1CC38];
        }
        else {
          v26 = (void *)MEMORY[0x1E4F1CC28];
        }
        id v14 = v26;
        goto LABEL_41;
      case 0xAuLL:
        if ([v11 length] != 4) {
          goto LABEL_34;
        }
        LODWORD(v27) = *(_DWORD *)[v12 bytes];
        id v14 = [NSNumber numberWithFloat:v27];
        goto LABEL_41;
      case 0xBuLL:
        id v14 = (id)[[NSString alloc] initWithData:v11 encoding:4];
        goto LABEL_41;
      default:
        if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
        {
          id v14 = v11;
LABEL_41:
          id v18 = v14;
        }
        else
        {
          if (![v12 length]) {
            goto LABEL_39;
          }
LABEL_34:
          v28 = (void *)MEMORY[0x1D944E080]();
          v29 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            v30 = HMFGetLogIdentifier();
            v31 = HAPCharacteristicFormatToString(a4);
            v32 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "length"));
            *(_DWORD *)buf = 138543874;
            v36 = v30;
            __int16 v37 = 2112;
            unint64_t v38 = (unint64_t)v31;
            __int16 v39 = 2112;
            v40 = v32;
            _os_log_impl(&dword_1D4758000, v29, OS_LOG_TYPE_ERROR, "%{public}@[HAPDataValueTransformer] Invalid format/data length (%@/%@) combination.", buf, 0x20u);
          }
          if (a5)
          {
            [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:-6737 userInfo:0];
            id v18 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
LABEL_39:
            id v18 = 0;
          }
        }

        break;
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x1D944E080]();
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v36 = v17;
      __int16 v37 = 2048;
      unint64_t v38 = a4;
      _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@[HAPDataValueTransformer] Invalid format '%tu', returning value unchanged", buf, 0x16u);
    }
    id v18 = v8;
  }

  return v18;
}

- (id)transformedValue:(id)a3 format:(unint64_t)a4 error:(id *)a5
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!v8)
  {
    if (+[HAPDataValueTransformer isValidFormat:a4])
    {
      id v11 = [MEMORY[0x1E4F1C9B8] data];
LABEL_11:
      v12 = v11;
      goto LABEL_18;
    }
    goto LABEL_9;
  }
  v36.receiver = self;
  v36.super_class = (Class)HAPDataValueTransformer;
  v9 = [(HAPValueTransformer *)&v36 transformedValue:v8 format:a4 error:a5];
  char v10 = [v8 isEqual:v9];

  if ((v10 & 1) == 0) {
    goto LABEL_17;
  }
  if (!+[HAPDataValueTransformer isValidFormat:a4])
  {
LABEL_9:
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
LABEL_10:
      id v11 = v8;
      goto LABEL_11;
    }
    v13 = NSString;
    id v14 = HAPCharacteristicFormatToString(a4);
    v15 = [v13 stringWithFormat:@"Invalid format type '%@' for value of class '%@'", v14, objc_opt_class()];

    v16 = (void *)MEMORY[0x1D944E080]();
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v18;
      __int16 v38 = 2112;
      __int16 v39 = v15;
      _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_ERROR, "%{public}@[HAPDataValueTransformer] %@", buf, 0x16u);
    }
    if (a5)
    {
      v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v42 = *MEMORY[0x1E4F28568];
      v43[0] = v15;
      v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];
      *a5 = [v19 errorWithDomain:@"HAPErrorDomain" code:-6717 userInfo:v20];
    }
LABEL_17:
    v12 = 0;
    goto LABEL_18;
  }
  switch(a4)
  {
    case 1uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_71;
      }
      id v22 = v8;
      if ([v22 compare:&unk_1F2C807D8] == 1 || objc_msgSend(v22, "compare:", &unk_1F2C807F0) == -1) {
        goto LABEL_67;
      }
      char v23 = [v22 unsignedCharValue];
      goto LABEL_41;
    case 2uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_71;
      }
      id v22 = v8;
      if ([v22 compare:&unk_1F2C80808] == 1 || objc_msgSend(v22, "compare:", &unk_1F2C807F0) == -1) {
        goto LABEL_67;
      }
      __int16 v24 = [v22 unsignedShortValue];
      goto LABEL_46;
    case 3uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_71;
      }
      id v22 = v8;
      if ([v22 compare:&unk_1F2C80820] == 1 || objc_msgSend(v22, "compare:", &unk_1F2C807F0) == -1) {
        goto LABEL_67;
      }
      int v25 = [v22 unsignedIntValue];
      goto LABEL_51;
    case 4uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_71;
      }
      id v22 = v8;
      if ([v22 compare:&unk_1F2C80838] == 1 || objc_msgSend(v22, "compare:", &unk_1F2C807F0) == -1) {
        goto LABEL_67;
      }
      uint64_t v26 = [v22 unsignedLongLongValue];
      goto LABEL_56;
    case 5uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_71;
      }
      id v22 = v8;
      if ([v22 compare:&unk_1F2C80718] == 1 || objc_msgSend(v22, "compare:", &unk_1F2C80730) == -1) {
        goto LABEL_67;
      }
      char v23 = [v22 charValue];
LABEL_41:
      buf[0] = v23;
      double v27 = (void *)MEMORY[0x1E4F1C9B8];
      uint64_t v28 = 1;
      goto LABEL_66;
    case 6uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_71;
      }
      id v22 = v8;
      if ([v22 compare:&unk_1F2C80748] == 1 || objc_msgSend(v22, "compare:", &unk_1F2C80760) == -1) {
        goto LABEL_67;
      }
      __int16 v24 = [v22 shortValue];
LABEL_46:
      *(_WORD *)buf = v24;
      double v27 = (void *)MEMORY[0x1E4F1C9B8];
      uint64_t v28 = 2;
      goto LABEL_66;
    case 7uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_71;
      }
      id v22 = v8;
      if ([v22 compare:&unk_1F2C80778] == 1 || objc_msgSend(v22, "compare:", &unk_1F2C80790) == -1) {
        goto LABEL_67;
      }
      int v25 = [v22 intValue];
LABEL_51:
      *(_DWORD *)buf = v25;
      goto LABEL_65;
    case 8uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_71;
      }
      id v22 = v8;
      if ([v22 compare:&unk_1F2C807A8] == 1 || objc_msgSend(v22, "compare:", &unk_1F2C807C0) == -1) {
        goto LABEL_67;
      }
      uint64_t v26 = [v22 longLongValue];
LABEL_56:
      *(void *)buf = v26;
      double v27 = (void *)MEMORY[0x1E4F1C9B8];
      uint64_t v28 = 8;
      goto LABEL_66;
    case 9uLL:
      buf[0] = 0;
      if ([v8 isEqual:MEMORY[0x1E4F1CC28]]) {
        goto LABEL_60;
      }
      if (![v8 isEqual:MEMORY[0x1E4F1CC38]]) {
        goto LABEL_17;
      }
      buf[0] = 1;
LABEL_60:
      id v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:buf length:1];
      goto LABEL_11;
    case 0xAuLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_71;
      }
      id v22 = v8;
      if ([v22 compare:&unk_1F2C80D90] == 1 || objc_msgSend(v22, "compare:", &unk_1F2C80DA0) == -1)
      {
LABEL_67:
        v12 = 0;
      }
      else
      {
        [v22 floatValue];
        *(_DWORD *)buf = v29;
LABEL_65:
        double v27 = (void *)MEMORY[0x1E4F1C9B8];
        uint64_t v28 = 4;
LABEL_66:
        v12 = [v27 dataWithBytes:buf length:v28];
      }

      break;
    case 0xBuLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_71;
      }
      id v11 = [v8 dataUsingEncoding:4];
      goto LABEL_11;
    case 0xCuLL:
    case 0xDuLL:
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_10;
      }
      goto LABEL_71;
    default:
LABEL_71:
      v30 = (void *)MEMORY[0x1D944E080]();
      v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = HMFGetLogIdentifier();
        v33 = HAPCharacteristicFormatToString(a4);
        objc_super v34 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v32;
        __int16 v38 = 2112;
        __int16 v39 = v33;
        __int16 v40 = 2112;
        uint64_t v41 = v34;
        id v35 = v34;
        _os_log_impl(&dword_1D4758000, v31, OS_LOG_TYPE_ERROR, "%{public}@[HAPDataValueTransformer] Invalid format/class (%@/%@) combination.", buf, 0x20u);
      }
      if (!a5) {
        goto LABEL_17;
      }
      [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:-6737 userInfo:0];
      v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      break;
  }
LABEL_18:

  return v12;
}

+ (void)initialize
{
  if (!defaultDataValueTransformer)
  {
    defaultDataValueTransformer = objc_alloc_init(HAPDataValueTransformer);
    MEMORY[0x1F41817F8]();
  }
}

+ (id)defaultDataValueTransformer
{
  return (id)defaultDataValueTransformer;
}

+ (BOOL)isValidFormat:(unint64_t)a3
{
  return (a3 < 0x10) & (0x3FFEu >> a3);
}

+ (Class)expectedTransformedClassForFormat:(unint64_t)a3
{
  if (a3 - 1 > 0xC)
  {
    v4 = 0;
  }
  else
  {
    v4 = objc_opt_class();
  }
  return (Class)v4;
}

@end