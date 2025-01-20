@interface NSKeyValueIvarSetter
- (NSKeyValueIvarSetter)initWithContainerClassID:(id)a3 key:(id)a4 containerIsa:(Class)a5 ivar:(objc_ivar *)a6;
@end

@implementation NSKeyValueIvarSetter

- (NSKeyValueIvarSetter)initWithContainerClassID:(id)a3 key:(id)a4 containerIsa:(Class)a5 ivar:(objc_ivar *)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  TypeEncoding = (char *)ivar_getTypeEncoding(a6);
  int v12 = *TypeEncoding;
  if (v12 > 82)
  {
    switch(*TypeEncoding)
    {
      case 'c':
        v14 = _NSSetCharValueForKeyInIvar;
        goto LABEL_34;
      case 'd':
        v14 = _NSSetDoubleValueForKeyInIvar;
        goto LABEL_34;
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
        goto LABEL_26;
      case 'f':
        v14 = _NSSetFloatValueForKeyInIvar;
        goto LABEL_34;
      case 'i':
        v14 = _NSSetIntValueForKeyInIvar;
        goto LABEL_34;
      case 'l':
        v14 = _NSSetLongValueForKeyInIvar;
        goto LABEL_34;
      case 'q':
        v14 = _NSSetLongLongValueForKeyInIvar;
        goto LABEL_34;
      case 's':
        v14 = _NSSetShortValueForKeyInIvar;
        goto LABEL_34;
      default:
        if (v12 == 83)
        {
          v14 = _NSSetUnsignedShortValueForKeyInIvar;
          goto LABEL_34;
        }
        if (v12 != 123) {
          goto LABEL_26;
        }
        v15 = TypeEncoding;
        v16 = strchr(TypeEncoding, 61);
        v14 = _NSSetValueInIvar;
        if (!v16) {
          goto LABEL_34;
        }
        size_t v17 = v16 - v15;
        int v18 = strncmp(v15, "{CGPoint=dd}", v16 - v15);
        v14 = _NSSetPointValueForKeyInIvar;
        if (!v18) {
          goto LABEL_34;
        }
        int v19 = strncmp(v15, "{_NSPoint=ff}", v17);
        v14 = _NSSetPointValueForKeyInIvar;
        if (!v19) {
          goto LABEL_34;
        }
        int v20 = strncmp(v15, "{_NSRange=QQ}", v17);
        v14 = _NSSetRangeValueForKeyInIvar;
        if (!v20) {
          goto LABEL_34;
        }
        int v21 = strncmp(v15, "{CGRect={CGPoint=dd}{CGSize=dd}}", v17);
        v14 = _NSSetRectValueForKeyInIvar;
        if (!v21) {
          goto LABEL_34;
        }
        int v22 = strncmp(v15, "{_NSRect={_NSPoint=ff}{_NSSize=ff}}", v17);
        v14 = _NSSetRectValueForKeyInIvar;
        if (!v22) {
          goto LABEL_34;
        }
        int v23 = strncmp(v15, "{CGSize=dd}", v17);
        v14 = _NSSetSizeValueForKeyInIvar;
        if (!v23) {
          goto LABEL_34;
        }
        int v24 = strncmp(v15, "{_NSSize=ff}", v17);
        v13 = _NSSetValueInIvar;
        v14 = _NSSetSizeValueForKeyInIvar;
        if (!v24) {
          goto LABEL_34;
        }
        goto LABEL_35;
    }
  }
  if (v12 > 75)
  {
    if (v12 == 76)
    {
      v14 = _NSSetUnsignedLongValueForKeyInIvar;
    }
    else
    {
      if (v12 != 81)
      {
LABEL_26:

        return 0;
      }
      v14 = _NSSetUnsignedLongLongValueForKeyInIvar;
    }
  }
  else
  {
    v13 = _NSSetBoolValueForKeyInIvar;
    switch(*TypeEncoding)
    {
      case '@':
        break;
      case 'A':
      case 'D':
      case 'E':
      case 'F':
      case 'G':
      case 'H':
        goto LABEL_26;
      case 'B':
        goto LABEL_35;
      case 'C':
        v14 = _NSSetUnsignedCharValueForKeyInIvar;
        goto LABEL_34;
      case 'I':
        v14 = _NSSetUnsignedIntValueForKeyInIvar;
        goto LABEL_34;
      default:
        if (v12 != 35) {
          goto LABEL_26;
        }
        break;
    }
    unsigned int IvarMemoryManagement = _class_getIvarMemoryManagement();
    v14 = _NSSetObjectSetIvarValueForKeyInIvar;
    if (IvarMemoryManagement < 4)
    {
      v13 = *(&off_1ECA5C068 + (int)IvarMemoryManagement);
      goto LABEL_35;
    }
  }
LABEL_34:
  v13 = v14;
LABEL_35:
  if (_NSKVONotifyingMutatorsShouldNotifyForIsaAndKey(a5, a4)) {
    return -[NSKeyValueAccessor initWithContainerClassID:key:implementation:selector:extraArguments:count:](&v28, sel_initWithContainerClassID_key_implementation_selector_extraArguments_count_, a3, a4, _NSSetValueAndNotifyForKeyInIvar, 0, &v29, 3, v27.receiver, v27.super_class, self, NSKeyValueIvarSetter, a4, a6, v13, v30);
  }
  else {
    return -[NSKeyValueAccessor initWithContainerClassID:key:implementation:selector:extraArguments:count:](&v27, sel_initWithContainerClassID_key_implementation_selector_extraArguments_count_, a3, a4, v13, 0, &v29, 2, self, NSKeyValueIvarSetter, v28.receiver, v28.super_class, a4, a6, 0, v30);
  }
}

@end