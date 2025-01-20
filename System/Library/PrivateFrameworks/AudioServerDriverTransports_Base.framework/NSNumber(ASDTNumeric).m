@interface NSNumber(ASDTNumeric)
+ (id)asdtNumberFromData:()ASDTNumeric withNumericType:;
+ (uint64_t)asdtDataSizeForNumericType:()ASDTNumeric;
- (uint64_t)asdtNumberToData:()ASDTNumeric withNumericType:andSize:;
@end

@implementation NSNumber(ASDTNumeric)

+ (uint64_t)asdtDataSizeForNumericType:()ASDTNumeric
{
  if (a3 > 0xA) {
    return 0;
  }
  else {
    return byte_248A06888[a3];
  }
}

+ (id)asdtNumberFromData:()ASDTNumeric withNumericType:
{
  switch(a5)
  {
    case 0:
      v7 = objc_msgSend(NSNumber, "numberWithBool:", *(unsigned char *)a4 & 1, v5);
      goto LABEL_16;
    case 1:
      LODWORD(a1) = *a4;
      v7 = objc_msgSend(NSNumber, "numberWithFloat:", a1, v5);
      goto LABEL_16;
    case 2:
      v7 = objc_msgSend(NSNumber, "numberWithDouble:", *(double *)a4, v5);
      goto LABEL_16;
    case 3:
      v7 = objc_msgSend(NSNumber, "numberWithChar:", *(char *)a4, v5);
      goto LABEL_16;
    case 4:
      v7 = objc_msgSend(NSNumber, "numberWithShort:", *(__int16 *)a4, v5);
      goto LABEL_16;
    case 5:
      v7 = objc_msgSend(NSNumber, "numberWithInt:", *a4, v5);
      goto LABEL_16;
    case 6:
      v7 = objc_msgSend(NSNumber, "numberWithLongLong:", *(void *)a4, v5);
      goto LABEL_16;
    case 7:
      v7 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", *(unsigned __int8 *)a4, v5);
      goto LABEL_16;
    case 8:
      v7 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", *(unsigned __int16 *)a4, v5);
      goto LABEL_16;
    case 9:
      v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", *a4, v5);
      goto LABEL_16;
    case 10:
      v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", *(void *)a4, v5);
LABEL_16:
      break;
    default:
      v7 = 0;
      break;
  }
  return v7;
}

- (uint64_t)asdtNumberToData:()ASDTNumeric withNumericType:andSize:
{
  switch(a4)
  {
    case 0:
    case 3:
    case 7:
      if (a5) {
        goto LABEL_14;
      }
      v7 = ASDTBaseLogType();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[NSNumber(ASDTNumeric) asdtNumberToData:withNumericType:andSize:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
      goto LABEL_18;
    case 1:
    case 5:
    case 9:
      if (a5 > 3) {
        goto LABEL_14;
      }
      v7 = ASDTBaseLogType();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[NSNumber(ASDTNumeric) asdtNumberToData:withNumericType:andSize:].cold.4();
      }
      goto LABEL_18;
    case 2:
    case 6:
    case 10:
      if (a5 > 7) {
        goto LABEL_14;
      }
      v7 = ASDTBaseLogType();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[NSNumber(ASDTNumeric) asdtNumberToData:withNumericType:andSize:].cold.5();
      }
      goto LABEL_18;
    case 4:
    case 8:
      if (a5 > 1)
      {
LABEL_14:
        switch(a4)
        {
          case 0:
            char v15 = [a1 BOOLValue];
            goto LABEL_26;
          case 1:
            [a1 floatValue];
            *a3 = v17;
            return 1;
          case 2:
            [a1 doubleValue];
            *(void *)a3 = v18;
            return 1;
          case 3:
            char v15 = [a1 charValue];
            goto LABEL_26;
          case 4:
            __int16 v19 = [a1 shortValue];
            goto LABEL_28;
          case 5:
            int v20 = [a1 intValue];
            goto LABEL_30;
          case 6:
            uint64_t v21 = [a1 longLongValue];
            goto LABEL_32;
          case 7:
            char v15 = [a1 unsignedCharValue];
LABEL_26:
            *(unsigned char *)a3 = v15;
            break;
          case 8:
            __int16 v19 = [a1 unsignedShortValue];
LABEL_28:
            *(_WORD *)a3 = v19;
            break;
          case 9:
            int v20 = [a1 unsignedIntValue];
LABEL_30:
            *a3 = v20;
            break;
          case 10:
            uint64_t v21 = [a1 unsignedLongLongValue];
LABEL_32:
            *(void *)a3 = v21;
            break;
          default:
            return 1;
        }
        return 1;
      }
      else
      {
        v7 = ASDTBaseLogType();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          -[NSNumber(ASDTNumeric) asdtNumberToData:withNumericType:andSize:]();
        }
LABEL_18:

        return 0;
      }
    default:
      v7 = ASDTBaseLogType();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[NSNumber(ASDTNumeric) asdtNumberToData:withNumericType:andSize:](a4, v7);
      }
      goto LABEL_18;
  }
}

- (void)asdtNumberToData:()ASDTNumeric withNumericType:andSize:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_2489BC000, a2, OS_LOG_TYPE_ERROR, "Bad numeric type: %u", (uint8_t *)v2, 8u);
}

- (void)asdtNumberToData:()ASDTNumeric withNumericType:andSize:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)asdtNumberToData:()ASDTNumeric withNumericType:andSize:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_2489BC000, v0, v1, "Bad size for %d-bit numeric type: %zu", v2, v3, v4, v5, 0);
}

- (void)asdtNumberToData:()ASDTNumeric withNumericType:andSize:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_2489BC000, v0, v1, "Bad size for %d-bit numeric type: %zu", v2, v3, v4, v5, 0);
}

- (void)asdtNumberToData:()ASDTNumeric withNumericType:andSize:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_2489BC000, v0, v1, "Bad size for %d-bit numeric type: %zu", v2, v3, v4, v5, 0);
}

@end