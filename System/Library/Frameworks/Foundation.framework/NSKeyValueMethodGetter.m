@interface NSKeyValueMethodGetter
- (NSKeyValueMethodGetter)initWithContainerClassID:(id)a3 key:(id)a4 method:(objc_method *)a5;
@end

@implementation NSKeyValueMethodGetter

- (NSKeyValueMethodGetter)initWithContainerClassID:(id)a3 key:(id)a4 method:(objc_method *)a5
{
  v5 = a5;
  v24[3] = *MEMORY[0x1E4F143B8];
  if (method_getNumberOfArguments(a5) != 2) {
    goto LABEL_28;
  }
  SEL Name = method_getName(v5);
  v10 = method_copyReturnType(v5);
  v11 = v10;
  int v12 = *v10;
  if (v12 > 82)
  {
    switch(*v10)
    {
      case 'c':
        v13 = _NSGetCharValueWithMethod;
        goto LABEL_37;
      case 'd':
        v13 = _NSGetDoubleValueWithMethod;
        goto LABEL_37;
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
        goto LABEL_27;
      case 'f':
        v13 = _NSGetFloatValueWithMethod;
        goto LABEL_37;
      case 'i':
        v13 = _NSGetIntValueWithMethod;
        goto LABEL_37;
      case 'l':
        v13 = _NSGetLongValueWithMethod;
        goto LABEL_37;
      case 'q':
        v13 = _NSGetLongLongValueWithMethod;
        goto LABEL_37;
      case 's':
        v13 = _NSGetShortValueWithMethod;
        goto LABEL_37;
      case 'v':
        v13 = _NSGetVoidValueWithMethod;
        goto LABEL_37;
      default:
        if (v12 == 83)
        {
          v13 = _NSGetUnsignedShortValueWithMethod;
          goto LABEL_37;
        }
        if (v12 != 123) {
          goto LABEL_27;
        }
        int v15 = strcmp(v10, "{CGPoint=dd}");
        v13 = _NSGetPointValueWithMethod;
        if (!v15) {
          goto LABEL_37;
        }
        int v16 = strcmp(v11, "{_NSPoint=ff}");
        v13 = _NSGetPointValueWithMethod;
        if (!v16) {
          goto LABEL_37;
        }
        int v17 = strcmp(v11, "{_NSRange=QQ}");
        v13 = _NSGetRangeValueWithMethod;
        if (!v17) {
          goto LABEL_37;
        }
        int v18 = strcmp(v11, "{CGRect={CGPoint=dd}{CGSize=dd}}");
        v13 = _NSGetRectValueWithMethod;
        if (!v18) {
          goto LABEL_37;
        }
        int v19 = strcmp(v11, "{_NSRect={_NSPoint=ff}{_NSSize=ff}}");
        v13 = _NSGetRectValueWithMethod;
        if (!v19) {
          goto LABEL_37;
        }
        int v20 = strcmp(v11, "{CGSize=dd}");
        v13 = _NSGetSizeValueWithMethod;
        if (!v20) {
          goto LABEL_37;
        }
        if (!strcmp(v11, "{_NSSize=ff}")) {
          Implementation = _NSGetSizeValueWithMethod;
        }
        else {
          Implementation = _NSGetValueWithMethod;
        }
        break;
    }
    goto LABEL_38;
  }
  if (v12 > 75)
  {
    if (v12 == 76)
    {
      v13 = _NSGetUnsignedLongValueWithMethod;
      goto LABEL_37;
    }
    if (v12 == 81)
    {
      v13 = _NSGetUnsignedLongLongValueWithMethod;
LABEL_37:
      Implementation = v13;
LABEL_38:
      free(v11);
      uint64_t v21 = 1;
      goto LABEL_39;
    }
LABEL_27:
    free(v10);
LABEL_28:

    return 0;
  }
  Implementation = _NSGetBoolValueWithMethod;
  switch(*v10)
  {
    case '@':
      break;
    case 'A':
    case 'D':
    case 'E':
    case 'F':
    case 'G':
    case 'H':
      goto LABEL_27;
    case 'B':
      goto LABEL_38;
    case 'C':
      v13 = _NSGetUnsignedCharValueWithMethod;
      goto LABEL_37;
    case 'I':
      v13 = _NSGetUnsignedIntValueWithMethod;
      goto LABEL_37;
    default:
      if (v12 != 35) {
        goto LABEL_27;
      }
      break;
  }
  Implementation = method_getImplementation(v5);
  free(v11);
  if (!Implementation) {
    goto LABEL_28;
  }
  v5 = 0;
  uint64_t v21 = 0;
LABEL_39:
  v24[1] = 0;
  v24[2] = 0;
  v23.receiver = self;
  v23.super_class = (Class)NSKeyValueMethodGetter;
  v24[0] = v5;
  return [(NSKeyValueAccessor *)&v23 initWithContainerClassID:a3 key:a4 implementation:Implementation selector:Name extraArguments:v24 count:v21];
}

@end