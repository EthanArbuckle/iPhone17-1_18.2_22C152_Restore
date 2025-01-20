@interface NSKeyValueMethodSetter
- (NSKeyValueMethodSetter)initWithContainerClassID:(id)a3 key:(id)a4 method:(objc_method *)a5;
- (objc_method)method;
@end

@implementation NSKeyValueMethodSetter

- (NSKeyValueMethodSetter)initWithContainerClassID:(id)a3 key:(id)a4 method:(objc_method *)a5
{
  v25[3] = *MEMORY[0x1E4F143B8];
  if (method_getNumberOfArguments(a5) != 3) {
    goto LABEL_28;
  }
  SEL Name = method_getName(a5);
  v10 = method_copyArgumentType(a5, 2u);
  v11 = v10;
  int v12 = *v10;
  if (v12 > 82)
  {
    switch(*v10)
    {
      case 'c':
        v14 = _NSSetCharValueForKeyWithMethod;
        goto LABEL_36;
      case 'd':
        v14 = _NSSetDoubleValueForKeyWithMethod;
        goto LABEL_36;
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
        goto LABEL_27;
      case 'f':
        v14 = _NSSetFloatValueForKeyWithMethod;
        goto LABEL_36;
      case 'i':
        v14 = _NSSetIntValueForKeyWithMethod;
        goto LABEL_36;
      case 'l':
        v14 = _NSSetLongValueForKeyWithMethod;
        goto LABEL_36;
      case 'q':
        v14 = _NSSetLongLongValueForKeyWithMethod;
        goto LABEL_36;
      case 's':
        v14 = _NSSetShortValueForKeyWithMethod;
        goto LABEL_36;
      default:
        if (v12 == 83)
        {
          v14 = _NSSetUnsignedShortValueForKeyWithMethod;
          goto LABEL_36;
        }
        if (v12 != 123) {
          goto LABEL_27;
        }
        int v15 = strcmp(v10, "{CGPoint=dd}");
        v14 = _NSSetPointValueForKeyWithMethod;
        if (!v15) {
          goto LABEL_36;
        }
        int v16 = strcmp(v11, "{_NSPoint=ff}");
        v14 = _NSSetPointValueForKeyWithMethod;
        if (!v16) {
          goto LABEL_36;
        }
        int v17 = strcmp(v11, "{_NSRange=QQ}");
        v14 = _NSSetRangeValueForKeyWithMethod;
        if (!v17) {
          goto LABEL_36;
        }
        int v18 = strcmp(v11, "{CGRect={CGPoint=dd}{CGSize=dd}}");
        v14 = _NSSetRectValueForKeyWithMethod;
        if (!v18) {
          goto LABEL_36;
        }
        int v19 = strcmp(v11, "{_NSRect={_NSPoint=ff}{_NSSize=ff}}");
        v14 = _NSSetRectValueForKeyWithMethod;
        if (!v19) {
          goto LABEL_36;
        }
        int v20 = strcmp(v11, "{CGSize=dd}");
        v14 = _NSSetSizeValueForKeyWithMethod;
        if (!v20) {
          goto LABEL_36;
        }
        if (!strcmp(v11, "{_NSSize=ff}")) {
          Implementation = _NSSetSizeValueForKeyWithMethod;
        }
        else {
          Implementation = _NSSetValueWithMethod;
        }
        break;
    }
  }
  else
  {
    if (v12 <= 75)
    {
      Implementation = _NSSetBoolValueForKeyWithMethod;
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
          goto LABEL_37;
        case 'C':
          v14 = _NSSetUnsignedCharValueForKeyWithMethod;
          goto LABEL_36;
        case 'I':
          v14 = _NSSetUnsignedIntValueForKeyWithMethod;
          goto LABEL_36;
        default:
          if (v12 != 35) {
            goto LABEL_27;
          }
          break;
      }
      Implementation = method_getImplementation(a5);
      free(v11);
      if (Implementation)
      {
        v21 = 0;
        uint64_t v22 = 0;
        goto LABEL_38;
      }
LABEL_28:

      return 0;
    }
    if (v12 == 76)
    {
      v14 = _NSSetUnsignedLongValueForKeyWithMethod;
    }
    else
    {
      if (v12 != 81)
      {
LABEL_27:
        free(v10);
        goto LABEL_28;
      }
      v14 = _NSSetUnsignedLongLongValueForKeyWithMethod;
    }
LABEL_36:
    Implementation = v14;
  }
LABEL_37:
  free(v11);
  uint64_t v22 = 2;
  v21 = a5;
LABEL_38:
  v25[0] = a4;
  v25[1] = v21;
  v25[2] = 0;
  v24.receiver = self;
  v24.super_class = (Class)NSKeyValueMethodSetter;
  result = [(NSKeyValueAccessor *)&v24 initWithContainerClassID:a3 key:a4 implementation:Implementation selector:Name extraArguments:v25 count:v22];
  if (result) {
    result->_method = a5;
  }
  return result;
}

- (objc_method)method
{
  return self->_method;
}

@end