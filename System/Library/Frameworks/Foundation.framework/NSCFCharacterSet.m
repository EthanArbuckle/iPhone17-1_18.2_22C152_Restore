@interface NSCFCharacterSet
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (BOOL)allowsWeakReference;
- (BOOL)characterIsMember:(unsigned __int16)a3;
- (BOOL)hasMemberInPlane:(unsigned __int8)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSupersetOfSet:(id)a3;
- (BOOL)longCharacterIsMember:(unsigned int)a3;
- (BOOL)retainWeakReference;
- (Class)classForArchiver;
- (NSCFCharacterSet)retain;
- (id)bitmapRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)invertedSet;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)addCharactersInRange:(_NSRange)a3;
- (void)addCharactersInString:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)formIntersectionWithCharacterSet:(id)a3;
- (void)formUnionWithCharacterSet:(id)a3;
- (void)makeCharacterSetCompact;
- (void)makeCharacterSetFast;
- (void)removeCharactersInRange:(_NSRange)a3;
- (void)removeCharactersInString:(id)a3;
@end

@implementation NSCFCharacterSet

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (self == a3) {
    return 1;
  }
  return _CFNonObjCEqual() != 0;
}

- (unint64_t)hash
{
  return MEMORY[0x1F40D8EB0](self, a2);
}

- (NSCFCharacterSet)retain
{
  return (NSCFCharacterSet *)MEMORY[0x1F40D8EC0](self, a2);
}

- (BOOL)allowsWeakReference
{
  return _CFIsDeallocating() == 0;
}

- (BOOL)retainWeakReference
{
  return _CFTryRetain() != 0;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return CFCharacterSetCreateCopy(0, (CFCharacterSetRef)self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return CFCharacterSetCreateMutableCopy(0, (CFCharacterSetRef)self);
}

- (BOOL)characterIsMember:(unsigned __int16)a3
{
  return CFCharacterSetIsCharacterMember((CFCharacterSetRef)self, a3) != 0;
}

- (BOOL)longCharacterIsMember:(unsigned int)a3
{
  return CFCharacterSetIsLongCharacterMember((CFCharacterSetRef)self, a3) != 0;
}

- (BOOL)isSupersetOfSet:(id)a3
{
  return CFCharacterSetIsSupersetOfSet((CFCharacterSetRef)self, (CFCharacterSetRef)a3) != 0;
}

- (BOOL)hasMemberInPlane:(unsigned __int8)a3
{
  return CFCharacterSetHasMemberInPlane((CFCharacterSetRef)self, a3) != 0;
}

- (id)bitmapRepresentation
{
  CFDataRef BitmapRepresentation = CFCharacterSetCreateBitmapRepresentation(0, (CFCharacterSetRef)self);

  return BitmapRepresentation;
}

- (id)invertedSet
{
  CFCharacterSetRef InvertedSet = CFCharacterSetCreateInvertedSet(0, (CFCharacterSetRef)self);

  return InvertedSet;
}

- (void)addCharactersInRange:(_NSRange)a3
{
}

- (void)removeCharactersInRange:(_NSRange)a3
{
}

- (void)addCharactersInString:(id)a3
{
}

- (void)removeCharactersInString:(id)a3
{
}

- (void)formUnionWithCharacterSet:(id)a3
{
}

- (void)formIntersectionWithCharacterSet:(id)a3
{
}

- (void)makeCharacterSetCompact
{
}

- (void)makeCharacterSetFast
{
}

- (Class)classForArchiver
{
  _CFCharacterSetIsMutable();

  return (Class)self;
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    int IsInverted = _CFCharacterSetIsInverted();
    switch(_CFCharacterSetGetKeyedCodingType())
    {
      case 2:
        [a3 encodeInteger:_CFCharacterSetGetKeyedCodingBuiltinType() forKey:@"NSBuiltinID"];
        if (IsInverted) {
          goto LABEL_20;
        }
        break;
      case 3:
        uint64_t KeyedCodingRange = _CFCharacterSetGetKeyedCodingRange();
        [a3 encodeInt64:v7 | (KeyedCodingRange << 32) forKey:@"NSRange"];
        if (IsInverted) {
          goto LABEL_20;
        }
        break;
      case 4:
        KeyedCodingString = (const void *)_CFCharacterSetCreateKeyedCodingString();
        if (object_getClass(a3) == (Class)NSKeyedArchiver) {
          [a3 _encodePropertyList:KeyedCodingString forKey:@"NSString"];
        }
        else {
          [a3 encodeObject:KeyedCodingString forKey:@"NSStringObject"];
        }
        CFRelease(KeyedCodingString);
        if (IsInverted)
        {
LABEL_20:
          [a3 encodeBool:1 forKey:@"NSIsInverted"];
        }
        break;
      case 5:
        [a3 encodeInteger:_CFCharacterSetGetKeyedCodingBuiltinType() forKey:@"NSBuiltinID2"];
        if (IsInverted) {
          [a3 encodeBool:1 forKey:@"NSIsInverted2"];
        }
        goto LABEL_11;
      default:
LABEL_11:
        Class = (__objc2_class *)object_getClass(a3);
        id v10 = [(NSCFCharacterSet *)self bitmapRepresentation];
        if (Class == NSKeyedArchiver)
        {
          [a3 _encodePropertyList:v10 forKey:@"NSBitmap"];
        }
        else
        {
          [a3 encodeObject:v10 forKey:@"NSBitmapObject"];
        }
        break;
    }
  }
}

@end