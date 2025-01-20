@interface NSInvocation
+ (const)_typeWithoutQualifiers:(const char *)a3;
- (id)BOOLDescriptionAtIndex:(int64_t)a3;
- (id)argumentDescriptionForIndex:(int64_t)a3 classifier:(id)a4;
- (id)blockDescriptionAtIndex:(int64_t)a3;
- (id)blockInvocationDescriptionWithClassifier:(id)a3;
- (id)cStringDescriptionAtIndex:(int64_t)a3;
- (id)charDescriptionAtIndex:(int64_t)a3;
- (id)doubleDescriptionAtIndex:(int64_t)a3;
- (id)floatDescriptionAtIndex:(int64_t)a3;
- (id)intDescriptionAtIndex:(int64_t)a3;
- (id)invocationDescriptionWithClassifier:(id)a3;
- (id)longDescriptionAtIndex:(int64_t)a3;
- (id)longDoubleDescriptionAtIndex:(int64_t)a3;
- (id)longLongDescriptionAtIndex:(int64_t)a3;
- (id)objectDescriptionAtIndex:(int64_t)a3 classifier:(id)a4;
- (id)optionalFeatureSettingDescriptionAtIndex:(int64_t)a3;
- (id)pointerDescriptionAtIndex:(int64_t)a3;
- (id)selectorDescriptionAtIndex:(int64_t)a3;
- (id)shortDescriptionAtIndex:(int64_t)a3;
- (id)unsignedCharDescriptionAtIndex:(int64_t)a3;
- (id)unsignedIntDescriptionAtIndex:(int64_t)a3;
- (id)unsignedLongDescriptionAtIndex:(int64_t)a3;
- (id)unsignedLongLongDescriptionAtIndex:(int64_t)a3;
- (id)unsignedShortDescriptionAtIndex:(int64_t)a3;
- (int64_t)getBlockArgumentIndex;
@end

@implementation NSInvocation

- (id)invocationDescriptionWithClassifier:(id)a3
{
  id v4 = a3;
  v5 = [(NSInvocation *)self methodSignature];
  id v6 = [v5 numberOfArguments];
  if (v6 == (id)2)
  {
    NSStringFromSelector([(NSInvocation *)self selector]);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = NSStringFromSelector([(NSInvocation *)self selector]);
    v9 = [v8 componentsSeparatedByString:@":"];

    id v7 = objc_alloc_init((Class)NSMutableString);
    if ((unint64_t)v6 >= 3)
    {
      for (unint64_t i = 2; (id)i != v6; ++i)
      {
        uint64_t v11 = [v9 objectAtIndex:i - 2];
        v12 = (void *)v11;
        if (i <= 2) {
          CFStringRef v13 = &stru_101AC1B28;
        }
        else {
          CFStringRef v13 = @" ";
        }
        [v7 appendFormat:@"%@%@:", v13, v11];

        v14 = [(NSInvocation *)self argumentDescriptionForIndex:i classifier:v4];
        [v7 appendString:v14];
      }
    }
  }

  return v7;
}

- (id)argumentDescriptionForIndex:(int64_t)a3 classifier:(id)a4
{
  id v6 = a4;
  id v7 = [(NSInvocation *)self methodSignature];
  id v8 = [v7 getArgumentTypeAtIndex:a3];

  int v9 = *(unsigned __int8 *)[(id)objc_opt_class() _typeWithoutQualifiers:v8];
  if (v9 <= 0x5D)
  {
    if (v9 > 80)
    {
      if (v9 == 81)
      {
        uint64_t v10 = [(NSInvocation *)self unsignedLongDescriptionAtIndex:a3];
      }
      else if (v9 == 83)
      {
        uint64_t v10 = [(NSInvocation *)self unsignedShortDescriptionAtIndex:a3];
      }
      else
      {
LABEL_15:
        uint64_t v10 = [@"<??" stringByAppendingString:@">"];
      }
    }
    else
    {
      switch(v9)
      {
        case '@':
          uint64_t v10 = [(NSInvocation *)self objectDescriptionAtIndex:a3 classifier:v6];
          break;
        case 'A':
        case 'E':
        case 'F':
        case 'G':
        case 'H':
          goto LABEL_15;
        case 'B':
          uint64_t v10 = [(NSInvocation *)self BOOLDescriptionAtIndex:a3];
          break;
        case 'C':
          uint64_t v10 = [(NSInvocation *)self unsignedCharDescriptionAtIndex:a3];
          break;
        case 'D':
          uint64_t v10 = [(NSInvocation *)self longDoubleDescriptionAtIndex:a3];
          break;
        case 'I':
          uint64_t v10 = [(NSInvocation *)self unsignedIntDescriptionAtIndex:a3];
          break;
        default:
          if (v9 != 58) {
            goto LABEL_15;
          }
          uint64_t v10 = [(NSInvocation *)self selectorDescriptionAtIndex:a3];
          break;
      }
    }
  }
  else
  {
    switch(v9)
    {
      case 'c':
        uint64_t v10 = [(NSInvocation *)self charDescriptionAtIndex:a3];
        break;
      case 'd':
        uint64_t v10 = [(NSInvocation *)self doubleDescriptionAtIndex:a3];
        break;
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
      case 'l':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
        goto LABEL_15;
      case 'f':
        uint64_t v10 = [(NSInvocation *)self floatDescriptionAtIndex:a3];
        break;
      case 'i':
        uint64_t v10 = [(NSInvocation *)self intDescriptionAtIndex:a3];
        break;
      case 'q':
        uint64_t v10 = [(NSInvocation *)self longDescriptionAtIndex:a3];
        break;
      case 'r':
        uint64_t v10 = [(NSInvocation *)self cStringDescriptionAtIndex:a3];
        break;
      case 's':
        uint64_t v10 = [(NSInvocation *)self shortDescriptionAtIndex:a3];
        break;
      default:
        if (v9 == 94)
        {
          uint64_t v10 = [(NSInvocation *)self pointerDescriptionAtIndex:a3];
        }
        else
        {
          if (v9 != 123) {
            goto LABEL_15;
          }
          uint64_t v10 = [(NSInvocation *)self optionalFeatureSettingDescriptionAtIndex:a3];
        }
        break;
    }
  }
  uint64_t v11 = (void *)v10;

  return v11;
}

+ (const)_typeWithoutQualifiers:(const char *)a3
{
  v3 = a3 - 1;
  do
    int v4 = *++v3;
  while (memchr("rnNoORV", v4, 8uLL));
  return v3;
}

- (id)objectDescriptionAtIndex:(int64_t)a3 classifier:(id)a4
{
  id v6 = a4;
  id v13 = 0;
  [(NSInvocation *)self getArgument:&v13 atIndex:a3];
  if (v13)
  {
    if (([v13 isProxy] & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      [v6 classifyObject:v13];
      uint64_t v9 = [v13 description];
      id v7 = (void *)v9;
      uint64_t v10 = @"<nil description>";
      if (v9) {
        uint64_t v10 = (__CFString *)v9;
      }
      id v8 = v10;
    }
    else
    {
      id v7 = [v13 description];
      id v8 = +[NSString stringWithFormat:@"@\"%@\"", v7];
    }
    uint64_t v11 = v8;
  }
  else
  {
    uint64_t v11 = @"nil";
  }

  return v11;
}

- (int64_t)getBlockArgumentIndex
{
  v2 = [(NSInvocation *)self methodSignature];
  id v3 = [v2 numberOfArguments];
  if ((unint64_t)v3 < 3)
  {
LABEL_5:
    int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    int64_t v4 = 2;
    while (strcmp((const char *)[v2 getArgumentTypeAtIndex:v4], "@?"))
    {
      if (v3 == (id)++v4) {
        goto LABEL_5;
      }
    }
  }

  return v4;
}

- (id)blockInvocationDescriptionWithClassifier:(id)a3
{
  id v4 = a3;
  v5 = [(NSInvocation *)self methodSignature];
  id v6 = [v5 numberOfArguments];
  if (v6 == (id)1)
  {
    id v7 = @"block(void)";
  }
  else
  {
    id v7 = (__CFString *)objc_msgSend(objc_alloc((Class)NSMutableString), "initWithString:", @"block(");
    if ((unint64_t)v6 >= 2)
    {
      for (unint64_t i = 1; (id)i != v6; ++i)
      {
        if (i <= 1) {
          CFStringRef v9 = &stru_101AC1B28;
        }
        else {
          CFStringRef v9 = @", ";
        }
        [(__CFString *)v7 appendFormat:@"%@", v9];
        uint64_t v10 = [(NSInvocation *)self argumentDescriptionForIndex:i classifier:v4];
        [(__CFString *)v7 appendString:v10];
      }
    }
    [(__CFString *)v7 appendString:@""]);
  }

  return v7;
}

- (id)longDescriptionAtIndex:(int64_t)a3
{
  uint64_t v5 = 0;
  [(NSInvocation *)self getArgument:&v5 atIndex:a3];
  id v3 = +[NSString stringWithFormat:@"%ld", v5];

  return v3;
}

- (id)intDescriptionAtIndex:(int64_t)a3
{
  unsigned int v5 = 0;
  [(NSInvocation *)self getArgument:&v5 atIndex:a3];
  id v3 = +[NSString stringWithFormat:@"%d", v5];

  return v3;
}

- (id)BOOLDescriptionAtIndex:(int64_t)a3
{
  char v6 = 0;
  [(NSInvocation *)self getArgument:&v6 atIndex:a3];
  if (v6) {
    id v3 = @"YES";
  }
  else {
    id v3 = @"NO";
  }
  id v4 = v3;

  return v4;
}

- (id)charDescriptionAtIndex:(int64_t)a3
{
  memset(v6, 0, sizeof(v6));
  [(NSInvocation *)self getArgument:v6 atIndex:a3];
  if (BYTE1(v6[0]) || LOBYTE(v6[0]) > 1u)
  {
    id v4 = +[NSString stringWithFormat:@"'%c'", LOBYTE(v6[0])];
  }
  else
  {
    id v3 = @"NO";
    if (LOBYTE(v6[0]) == 1) {
      id v3 = @"YES";
    }
    id v4 = v3;
  }

  return v4;
}

- (id)unsignedCharDescriptionAtIndex:(int64_t)a3
{
  memset(v5, 0, sizeof(v5));
  [(NSInvocation *)self getArgument:v5 atIndex:a3];
  id v3 = +[NSString stringWithFormat:@"'%c'", LOBYTE(v5[0])];

  return v3;
}

- (id)unsignedIntDescriptionAtIndex:(int64_t)a3
{
  unsigned int v5 = 0;
  [(NSInvocation *)self getArgument:&v5 atIndex:a3];
  id v3 = +[NSString stringWithFormat:@"%d", v5];

  return v3;
}

- (id)shortDescriptionAtIndex:(int64_t)a3
{
  __int16 v5 = 0;
  [(NSInvocation *)self getArgument:&v5 atIndex:a3];
  id v3 = +[NSString stringWithFormat:@"%hi", v5];

  return v3;
}

- (id)unsignedShortDescriptionAtIndex:(int64_t)a3
{
  unsigned __int16 v5 = 0;
  [(NSInvocation *)self getArgument:&v5 atIndex:a3];
  id v3 = +[NSString stringWithFormat:@"%hu", v5];

  return v3;
}

- (id)unsignedLongDescriptionAtIndex:(int64_t)a3
{
  uint64_t v5 = 0;
  [(NSInvocation *)self getArgument:&v5 atIndex:a3];
  id v3 = +[NSString stringWithFormat:@"%lu", v5];

  return v3;
}

- (id)longLongDescriptionAtIndex:(int64_t)a3
{
  uint64_t v5 = 0;
  [(NSInvocation *)self getArgument:&v5 atIndex:a3];
  id v3 = +[NSString stringWithFormat:@"%qi", v5];

  return v3;
}

- (id)unsignedLongLongDescriptionAtIndex:(int64_t)a3
{
  uint64_t v5 = 0;
  [(NSInvocation *)self getArgument:&v5 atIndex:a3];
  id v3 = +[NSString stringWithFormat:@"%qu", v5];

  return v3;
}

- (id)doubleDescriptionAtIndex:(int64_t)a3
{
  uint64_t v5 = 0;
  [(NSInvocation *)self getArgument:&v5 atIndex:a3];
  id v3 = +[NSString stringWithFormat:@"%f", v5];

  return v3;
}

- (id)floatDescriptionAtIndex:(int64_t)a3
{
  float v5 = 0.0;
  [(NSInvocation *)self getArgument:&v5 atIndex:a3];
  id v3 = +[NSString stringWithFormat:@"%f", v5];

  return v3;
}

- (id)longDoubleDescriptionAtIndex:(int64_t)a3
{
  uint64_t v5 = 0;
  [(NSInvocation *)self getArgument:&v5 atIndex:a3];
  id v3 = +[NSString stringWithFormat:@"%Lf", v5];

  return v3;
}

- (id)pointerDescriptionAtIndex:(int64_t)a3
{
  uint64_t v5 = 0;
  [(NSInvocation *)self getArgument:&v5 atIndex:a3];
  id v3 = +[NSString stringWithFormat:@"%p", v5];

  return v3;
}

- (id)cStringDescriptionAtIndex:(int64_t)a3
{
  uint64_t v12 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  *(_OWORD *)__dst = 0u;
  long long v7 = 0u;
  __source = 0;
  [(NSInvocation *)self getArgument:&__source atIndex:a3];
  strlcpy(__dst, __source, 0x68uLL);
  HIDWORD(v12) = 3026478;
  id v3 = +[NSString stringWithFormat:@"\"%s\"", __dst];

  return v3;
}

- (id)selectorDescriptionAtIndex:(int64_t)a3
{
  SEL aSelector = 0;
  [(NSInvocation *)self getArgument:&aSelector atIndex:a3];
  id v3 = NSStringFromSelector(aSelector);
  id v4 = +[NSString stringWithFormat:@"@selector(%@)", v3];

  return v4;
}

- (id)blockDescriptionAtIndex:(int64_t)a3
{
  uint64_t v5 = 0;
  [(NSInvocation *)self getArgument:&v5 atIndex:a3];
  id v3 = +[NSString stringWithFormat:@"%@", v5];

  return v3;
}

- (id)optionalFeatureSettingDescriptionAtIndex:(int64_t)a3
{
  __int16 v7 = 0;
  [(NSInvocation *)self getArgument:&v7 atIndex:a3];
  id v3 = "YES";
  if ((_BYTE)v7) {
    id v4 = "YES";
  }
  else {
    id v4 = "NO";
  }
  if (!HIBYTE(v7)) {
    id v3 = "NO";
  }
  uint64_t v5 = +[NSString stringWithFormat:@"Feature Enabled (%s) User Enabled (%s)", v4, v3];

  return v5;
}

@end