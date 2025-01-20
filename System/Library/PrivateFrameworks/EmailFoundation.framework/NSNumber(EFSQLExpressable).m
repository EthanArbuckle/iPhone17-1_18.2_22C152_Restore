@interface NSNumber(EFSQLExpressable)
- (id)ef_SQLExpression;
- (void)ef_renderSQLExpressionInto:()EFSQLExpressable;
@end

@implementation NSNumber(EFSQLExpressable)

- (void)ef_renderSQLExpressionInto:()EFSQLExpressable
{
  id v16 = a3;
  id v4 = a1;
  int v5 = *(char *)[v4 objCType];
  if (v5 <= 80)
  {
    if (v5 > 72)
    {
      if (v5 == 73)
      {
        uint64_t v8 = [v4 unsignedIntValue];
        goto LABEL_16;
      }
      if (v5 == 76)
      {
        uint64_t v8 = [v4 unsignedLongValue];
        v9 = @"%lu";
        goto LABEL_26;
      }
    }
    else
    {
      if (v5 == 66)
      {
LABEL_11:
        uint64_t v8 = [v4 charValue];
LABEL_21:
        v9 = @"%d";
        goto LABEL_26;
      }
      if (v5 == 67)
      {
        uint64_t v8 = [v4 unsignedCharValue];
LABEL_16:
        v9 = @"%u";
        goto LABEL_26;
      }
    }
LABEL_30:
    v11 = (void *)MEMORY[0x1E4F1CA00];
    v12 = NSString;
    id v13 = v4;
    v14 = [v12 stringWithFormat:@"%@: unexpected type '%s'", v13, objc_msgSend(v13, "objCType")];
    id v15 = [v11 exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v14 userInfo:0];

    objc_exception_throw(v15);
  }
  switch(v5)
  {
    case 'c':
      goto LABEL_11;
    case 'd':
      [v4 doubleValue];
      v7 = @"%0.16g";
      goto LABEL_24;
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
      goto LABEL_30;
    case 'f':
      [v4 floatValue];
      double v6 = v10;
      v7 = @"%0.7g";
LABEL_24:
      objc_msgSend(v16, "appendFormat:", v7, *(void *)&v6);
      goto LABEL_27;
    case 'i':
      uint64_t v8 = [v4 intValue];
      goto LABEL_21;
    case 'l':
      uint64_t v8 = [v4 longValue];
      v9 = @"%ld";
      break;
    case 'q':
      uint64_t v8 = [v4 longLongValue];
      v9 = @"%lld";
      break;
    case 's':
      uint64_t v8 = [v4 shortValue];
      v9 = @"%hi";
      break;
    default:
      if (v5 == 81)
      {
        uint64_t v8 = [v4 unsignedLongLongValue];
        v9 = @"%llu";
        break;
      }
      if (v5 != 83) {
        goto LABEL_30;
      }
      uint64_t v8 = [v4 unsignedShortValue];
      v9 = @"%hu";
      break;
  }
LABEL_26:
  objc_msgSend(v16, "appendFormat:", v9, v8);
LABEL_27:
}

- (id)ef_SQLExpression
{
  v2 = [MEMORY[0x1E4F28E78] string];
  objc_msgSend(a1, "ef_renderSQLExpressionInto:", v2);
  return v2;
}

@end