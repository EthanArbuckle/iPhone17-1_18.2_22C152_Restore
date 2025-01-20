@interface NSConcreteValue
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BOOL)_matchType:(const char *)a3 size:(unint64_t)a4 strict:(BOOL)a5;
- (BOOL)isEqualToValue:(id)a3;
- (const)objCType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)getValue:(void *)a3;
- (void)getValue:(void *)a3 size:(unint64_t)a4;
@end

@implementation NSConcreteValue

- (unint64_t)hash
{
  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  unint64_t v4 = *(void *)self->typeInfo;
  if (v4 <= 7)
  {
    unint64_t v5 = 0;
    if (v4)
    {
      unint64_t v8 = v4 + 1;
      do
      {
        unsigned int v9 = *(unsigned __int8 *)IndexedIvars;
        IndexedIvars = (uint64_t *)((char *)IndexedIvars + 1);
        unint64_t v5 = v9 | (v5 << 8);
        --v8;
      }
      while (v8 > 1);
    }
  }
  else
  {
    unint64_t v5 = 0;
    if (v4 >= 0x20) {
      unint64_t v4 = 32;
    }
    unint64_t v6 = v4 + 8;
    do
    {
      uint64_t v7 = *IndexedIvars++;
      v5 ^= v7;
      v6 -= 8;
    }
    while (v6 > 0xF);
  }
  return v5;
}

- (id)description
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  switch(self->_specialFlags)
  {
    case 0uLL:
      v3 = [(NSConcreteValue *)self objCType];
      if (!strcmp(v3, "{CGRect={CGPoint=dd}{CGSize=dd}}")) {
        goto LABEL_17;
      }
      if (!strcmp(v3, "{CGPoint=dd}")) {
        goto LABEL_18;
      }
      if (!strcmp(v3, "{CGSize=dd}")) {
        goto LABEL_19;
      }
      if (!strcmp(v3, "{_NSRange=QQ}")) {
        goto LABEL_21;
      }
      if (!strcmp(v3, "{CGAffineTransform=ffffff}") || !strcmp(v3, "{CGAffineTransform=dddddd}")) {
        goto LABEL_20;
      }
      if (!strcmp(v3, "{UIEdgeInsets=ffff}") || !strcmp(v3, "{UIEdgeInsets=dddd}")) {
        goto LABEL_22;
      }
      if (!strcmp(v3, "{NSEdgeInsets=ffff}") || !strcmp(v3, "{NSEdgeInsets=dddd}")) {
        goto LABEL_23;
      }
      if (!strcmp(v3, "{NSDirectionalEdgeInsets=ffff}") || !strcmp(v3, "{NSDirectionalEdgeInsets=dddd}")) {
        goto LABEL_24;
      }
      if (!strcmp(v3, "{UIOffset=ff}") || !strcmp(v3, "{UIOffset=dd}")) {
        goto LABEL_25;
      }
      goto LABEL_16;
    case 1uLL:
LABEL_18:
      [(NSValue *)self pointValue];
      id result = +[NSString stringWithFormat:@"NSPoint: %@", NSStringFromPoint(v11)];
      break;
    case 2uLL:
LABEL_19:
      [(NSValue *)self sizeValue];
      id result = +[NSString stringWithFormat:@"NSSize: %@", NSStringFromSize(v12)];
      break;
    case 3uLL:
LABEL_17:
      [(NSValue *)self rectValue];
      id result = +[NSString stringWithFormat:@"NSRect: %@", NSStringFromRect(v13)];
      break;
    case 4uLL:
LABEL_21:
      v10.location = [(NSValue *)self rangeValue];
      id result = +[NSString stringWithFormat:@"NSRange: %@", NSStringFromRange(v10)];
      break;
    case 0xAuLL:
LABEL_20:
      long long v7 = 0u;
      long long v8 = 0u;
      long long v6 = 0u;
      [(NSConcreteValue *)self getValue:&v6];
      id result = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"CGAffineTransform: %@", +[NSString stringWithFormat:@"{{%.*g, %.*g, %.*g, %.*g}, {%.*g, %.*g}}", 17, (void)v6, 17, *((void *)&v6 + 1), 17, (void)v7, 17, *((void *)&v7 + 1), 17, (void)v8, 17, *((void *)&v8 + 1)]);
      break;
    case 0xBuLL:
LABEL_22:
      id result = +[NSString stringWithFormat:@"UIEdgeInsets: %@", _stringFromEdgeInsets(self)];
      break;
    case 0xCuLL:
LABEL_23:
      id result = +[NSString stringWithFormat:@"NSEdgeInsets: %@", _stringFromEdgeInsets(self)];
      break;
    case 0xDuLL:
LABEL_25:
      long long v6 = 0uLL;
      [(NSConcreteValue *)self getValue:&v6];
      id result = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"UIOffset: %@", +[NSString stringWithFormat:@"{%.*g, %.*g}", 17, (void)v6, 17, *((void *)&v6 + 1)]);
      break;
    case 0xEuLL:
LABEL_24:
      id result = +[NSString stringWithFormat:@"NSDirectionalEdgeInsets: %@", _stringFromEdgeInsets(self)];
      break;
    default:
LABEL_16:
      v5.receiver = self;
      v5.super_class = (Class)NSConcreteValue;
      id result = [(NSValue *)&v5 description];
      break;
  }
  return result;
}

- (void)getValue:(void *)a3 size:(unint64_t)a4
{
  if (*(void *)self->typeInfo != a4)
  {
    long long v7 = +[NSString stringWithFormat:@"Cannot get value with size %zu. The type encoded as %s is expected to be %zu bytes", a4, [(NSConcreteValue *)self objCType], *(void *)self->typeInfo];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v7 userInfo:0]);
  }
  IndexedIvars = object_getIndexedIvars(self);

  memmove(a3, IndexedIvars, a4);
}

- (BOOL)isEqualToValue:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self == a3) {
    return 1;
  }
  if (strcmp(*((const char **)self->typeInfo + 1), (const char *)[a3 objCType])) {
    return 0;
  }
  size_t v6 = *(void *)self->typeInfo;
  uint64_t v7 = objc_opt_class();
  if (v7 == objc_opt_class() || (objc_opt_isKindOfClass() & 1) != 0)
  {
    IndexedIvars = object_getIndexedIvars(self);
    int v9 = memcmp(IndexedIvars, (const void *)[a3 _value], v6);
  }
  else
  {
    if (v6 < 0x401) {
      NSRange v10 = &v12;
    }
    else {
      NSRange v10 = (char *)malloc_type_malloc(v6, 0x13938C8FuLL);
    }
    [a3 getValue:v10];
    NSPoint v11 = object_getIndexedIvars(self);
    int v9 = memcmp(v11, v10, v6);
    if (v6 >= 0x401) {
      free(v10);
    }
  }
  return v9 == 0;
}

- (const)objCType
{
  return (const char *)*((void *)self->typeInfo + 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (NSShouldRetainWithZone(self, a3))
  {
    return self;
  }
  else
  {
    IndexedIvars = (float64x2_t *)object_getIndexedIvars(self);
    size_t v6 = (char *)*((void *)self->typeInfo + 1);
    return _NSNewValue(IndexedIvars, v6, a3);
  }
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_specialFlags && [a3 allowsKeyedCoding])
  {
    [a3 encodeInteger:self->_specialFlags forKey:@"NS.special"];
    switch(self->_specialFlags)
    {
      case 1uLL:
        [(NSValue *)self pointValue];
        objc_msgSend(a3, "encodePoint:forKey:", @"NS.pointval");
        return;
      case 2uLL:
        [(NSValue *)self sizeValue];
        objc_msgSend(a3, "encodeSize:forKey:", @"NS.sizeval");
        return;
      case 3uLL:
        [(NSValue *)self rectValue];
        objc_msgSend(a3, "encodeRect:forKey:", @"NS.rectval");
        return;
      case 4uLL:
        uint64_t v7 = [(NSValue *)self rangeValue];
        objc_msgSend(a3, "encodeObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v8), @"NS.rangeval.length");
        int v9 = +[NSNumber numberWithUnsignedInteger:v7];
        [a3 encodeObject:v9 forKey:@"NS.rangeval.location"];
        return;
      case 0xAuLL:
        long long v13 = 0u;
        *(_OWORD *)v14 = 0u;
        long long v12 = 0u;
        [(NSConcreteValue *)self getValue:&v12];
        [a3 encodeDouble:@"NS.atval.a" forKey:*(double *)&v12];
        [a3 encodeDouble:@"NS.atval.b" forKey:*((double *)&v12 + 1)];
        [a3 encodeDouble:@"NS.atval.c" forKey:*(double *)&v13];
        [a3 encodeDouble:@"NS.atval.d" forKey:*((double *)&v13 + 1)];
        [a3 encodeDouble:@"NS.atval.tx" forKey:v14[0]];
        double v5 = v14[1];
        size_t v6 = @"NS.atval.ty";
        goto LABEL_21;
      case 0xBuLL:
      case 0xCuLL:
        long long v12 = 0u;
        long long v13 = 0u;
        [(NSConcreteValue *)self getValue:&v12];
        [a3 encodeDouble:@"NS.edgeval.top" forKey:*(double *)&v12];
        [a3 encodeDouble:@"NS.edgeval.left" forKey:*((double *)&v12 + 1)];
        [a3 encodeDouble:@"NS.edgeval.bottom" forKey:*(double *)&v13];
        double v5 = *((double *)&v13 + 1);
        size_t v6 = @"NS.edgeval.right";
        goto LABEL_21;
      case 0xDuLL:
        long long v12 = 0uLL;
        [(NSConcreteValue *)self getValue:&v12];
        [a3 encodeDouble:@"NS.offset.h" forKey:*(double *)&v12];
        double v5 = *((double *)&v12 + 1);
        size_t v6 = @"NS.offset.v";
        goto LABEL_21;
      case 0xEuLL:
        long long v12 = 0u;
        long long v13 = 0u;
        [(NSConcreteValue *)self getValue:&v12];
        [a3 encodeDouble:@"NS.dirEdgeVal.top" forKey:*(double *)&v12];
        [a3 encodeDouble:@"NS.dirEdgeVal.leading" forKey:*((double *)&v12 + 1)];
        [a3 encodeDouble:@"NS.dirEdgeVal.bottom" forKey:*(double *)&v13];
        double v5 = *((double *)&v13 + 1);
        size_t v6 = @"NS.dirEdgeVal.trailing";
LABEL_21:
        [a3 encodeDouble:v6 forKey:v5];
        break;
      default:
        NSRange v10 = +[NSString stringWithFormat:@"cannot encode special type '%ld'", self->_specialFlags];
        objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v10 userInfo:0]);
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)NSConcreteValue;
    [(NSValue *)&v11 encodeWithCoder:a3];
  }
}

- (void)getValue:(void *)a3
{
  IndexedIvars = object_getIndexedIvars(self);
  size_t v6 = *(void *)self->typeInfo;

  memmove(a3, IndexedIvars, v6);
}

- (BOOL)_matchType:(const char *)a3 size:(unint64_t)a4 strict:(BOOL)a5
{
  typeInfo = (char **)self->typeInfo;
  BOOL result = *typeInfo == (char *)a4 && !a5;
  if (a5 && *typeInfo == (char *)a4) {
    return matchTypeEncoding(typeInfo[1], (char *)a3, a4);
  }
  return result;
}

+ (void)initialize
{
  v2[1] = *MEMORY[0x1E4F143B8];
  if ((id)objc_opt_class() == a1)
  {
    v2[0] = 0;
    NSGetSizeAndAlignment("{CGRect={CGPoint=dd}{CGSize=dd}}", v2, 0);
    if (v2[0] != 32) {
      NSLog((NSString *)@"*** Inconsistency in NSValue type strings for NSRect types!");
    }
    v2[0] = 0;
    NSGetSizeAndAlignment("{CGPoint=dd}", v2, 0);
    if (v2[0] != 16) {
      NSLog((NSString *)@"*** Inconsistency in NSValue type strings for NSPoint types!");
    }
    v2[0] = 0;
    NSGetSizeAndAlignment("{CGSize=dd}", v2, 0);
    if (v2[0] != 16) {
      NSLog((NSString *)@"*** Inconsistency in NSValue type strings for NSSize types!");
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end