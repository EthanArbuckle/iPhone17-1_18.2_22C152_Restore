@interface NSKeyValueIvarGetter
- (NSKeyValueIvarGetter)initWithContainerClassID:(id)a3 key:(id)a4 containerIsa:(Class)a5 ivar:(objc_ivar *)a6;
@end

@implementation NSKeyValueIvarGetter

- (NSKeyValueIvarGetter)initWithContainerClassID:(id)a3 key:(id)a4 containerIsa:(Class)a5 ivar:(objc_ivar *)a6
{
  v27[3] = *MEMORY[0x1E4F143B8];
  TypeEncoding = (char *)ivar_getTypeEncoding(a6);
  int v11 = *TypeEncoding;
  if (v11 > 82)
  {
    switch(*TypeEncoding)
    {
      case 'c':
        v13 = (uint64_t (*)(int, int, Ivar))_NSGetCharValueInIvar;
        goto LABEL_34;
      case 'd':
        v13 = (uint64_t (*)(int, int, Ivar))_NSGetDoubleValueInIvar;
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
        v13 = (uint64_t (*)(int, int, Ivar))_NSGetFloatValueInIvar;
        goto LABEL_34;
      case 'i':
        v13 = (uint64_t (*)(int, int, Ivar))_NSGetIntValueInIvar;
        goto LABEL_34;
      case 'l':
        v13 = (uint64_t (*)(int, int, Ivar))_NSGetLongValueInIvar;
        goto LABEL_34;
      case 'q':
        v13 = (uint64_t (*)(int, int, Ivar))_NSGetLongLongValueInIvar;
        goto LABEL_34;
      case 's':
        v13 = (uint64_t (*)(int, int, Ivar))_NSGetShortValueInIvar;
        goto LABEL_34;
      default:
        if (v11 == 83)
        {
          v13 = (uint64_t (*)(int, int, Ivar))_NSGetUnsignedShortValueInIvar;
          goto LABEL_34;
        }
        if (v11 != 123) {
          goto LABEL_26;
        }
        v14 = TypeEncoding;
        v15 = strchr(TypeEncoding, 61);
        v13 = (uint64_t (*)(int, int, Ivar))_NSGetValueInIvar;
        if (!v15) {
          goto LABEL_34;
        }
        size_t v16 = v15 - v14;
        int v17 = strncmp(v14, "{CGPoint=dd}", v15 - v14);
        v13 = (uint64_t (*)(int, int, Ivar))_NSGetPointValueInIvar;
        if (!v17) {
          goto LABEL_34;
        }
        int v18 = strncmp(v14, "{_NSPoint=ff}", v16);
        v13 = (uint64_t (*)(int, int, Ivar))_NSGetPointValueInIvar;
        if (!v18) {
          goto LABEL_34;
        }
        int v19 = strncmp(v14, "{_NSRange=QQ}", v16);
        v13 = (uint64_t (*)(int, int, Ivar))_NSGetRangeValueInIvar;
        if (!v19) {
          goto LABEL_34;
        }
        int v20 = strncmp(v14, "{CGRect={CGPoint=dd}{CGSize=dd}}", v16);
        v13 = (uint64_t (*)(int, int, Ivar))_NSGetRectValueInIvar;
        if (!v20) {
          goto LABEL_34;
        }
        int v21 = strncmp(v14, "{_NSRect={_NSPoint=ff}{_NSSize=ff}}", v16);
        v13 = (uint64_t (*)(int, int, Ivar))_NSGetRectValueInIvar;
        if (!v21) {
          goto LABEL_34;
        }
        int v22 = strncmp(v14, "{CGSize=dd}", v16);
        v13 = (uint64_t (*)(int, int, Ivar))_NSGetSizeValueInIvar;
        if (!v22) {
          goto LABEL_34;
        }
        int v23 = strncmp(v14, "{_NSSize=ff}", v16);
        v12 = (uint64_t (*)(int, int, Ivar))_NSGetValueInIvar;
        v13 = (uint64_t (*)(int, int, Ivar))_NSGetSizeValueInIvar;
        if (!v23) {
          goto LABEL_34;
        }
        goto LABEL_35;
    }
  }
  if (v11 > 75)
  {
    if (v11 == 76)
    {
      v13 = (uint64_t (*)(int, int, Ivar))_NSGetUnsignedLongValueInIvar;
    }
    else
    {
      if (v11 != 81)
      {
LABEL_26:

        return 0;
      }
      v13 = (uint64_t (*)(int, int, Ivar))_NSGetUnsignedLongLongValueInIvar;
    }
    goto LABEL_34;
  }
  v12 = (uint64_t (*)(int, int, Ivar))_NSGetBoolValueInIvar;
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
      v13 = (uint64_t (*)(int, int, Ivar))_NSGetUnsignedCharValueInIvar;
      goto LABEL_34;
    case 'I':
      v13 = (uint64_t (*)(int, int, Ivar))_NSGetUnsignedIntValueInIvar;
      goto LABEL_34;
    default:
      if (v11 != 35) {
        goto LABEL_26;
      }
      break;
  }
  unsigned int IvarMemoryManagement = _class_getIvarMemoryManagement();
  v13 = (uint64_t (*)(int, int, Ivar))_NSGetObjectGetIvarValueInIvar;
  if (IvarMemoryManagement >= 4)
  {
LABEL_34:
    v12 = v13;
    goto LABEL_35;
  }
  v12 = off_1ECA5C048[IvarMemoryManagement];
LABEL_35:
  v27[1] = 0;
  v27[2] = 0;
  v26.receiver = self;
  v26.super_class = (Class)NSKeyValueIvarGetter;
  v27[0] = a6;
  return [(NSKeyValueAccessor *)&v26 initWithContainerClassID:a3 key:a4 implementation:v12 selector:0 extraArguments:v27 count:1];
}

@end