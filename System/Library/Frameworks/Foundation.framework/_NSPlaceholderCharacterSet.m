@interface _NSPlaceholderCharacterSet
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (BOOL)hasMemberInPlane:(unsigned __int8)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSupersetOfSet:(id)a3;
- (BOOL)longCharacterIsMember:(unsigned int)a3;
- (_NSPlaceholderCharacterSet)autorelease;
- (_NSPlaceholderCharacterSet)initWithSet:(id)a3 options:(unint64_t)a4;
- (_NSPlaceholderCharacterSet)retain;
- (__CFCharacterSet)_expandedCFCharacterSet;
- (id)bitmapRepresentation;
- (id)invertedSet;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)replacementObjectForCoder:(id)a3;
- (id)replacementObjectForKeyedArchiver:(id)a3;
- (unint64_t)retainCount;
- (void)_expandInverted;
- (void)dealloc;
- (void)release;
@end

@implementation _NSPlaceholderCharacterSet

- (_NSPlaceholderCharacterSet)initWithSet:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)_NSPlaceholderCharacterSet;
  id v6 = [(NSCharacterSet *)&v11 init];
  unsigned int v7 = *((_DWORD *)v6 + 6) & 0xFFFFFFFC | v4 & 3;
  *((_DWORD *)v6 + 6) = v7;
  if (v4)
  {
    int v8 = 0;
  }
  else
  {
    if (objc_opt_isKindOfClass()) {
      int v8 = 4;
    }
    else {
      int v8 = 0;
    }
    unsigned int v7 = *((_DWORD *)v6 + 6);
  }
  *((_DWORD *)v6 + 6) = v7 & 0xFFFFFFFB | v8;
  if ((v7 & 1) != 0 && [a3 isMutable])
  {
    v9 = (_NSPlaceholderCharacterSet *)[a3 mutableCopyWithZone:0];
    [(_NSPlaceholderCharacterSet *)v9 invert];
    [(NSCharacterSet *)v9 makeImmutable];

    return v9;
  }
  else
  {
    *((void *)v6 + 1) = a3;
  }
  return (_NSPlaceholderCharacterSet *)v6;
}

- (__CFCharacterSet)_expandedCFCharacterSet
{
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    return (__CFCharacterSet *)self->_original;
  }
  else {
    return 0;
  }
}

- (void)_expandInverted
{
  if ((*(unsigned char *)&self->_flags & 1) != 0 && !self->_invertedSet)
  {
    id v4 = [(NSCharacterSet *)self->_original mutableCopyWithZone:0];
    [v4 invert];
    uint64_t v3 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_invertedSet, (unint64_t *)&v3, (unint64_t)v4);
    if (v3)
    {
    }
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  invertedSet = self->_invertedSet;
  if (invertedSet)
  {
    return [(NSCharacterSet *)invertedSet mutableCopyWithZone:0];
  }
  else
  {
    id v6 = [(NSCharacterSet *)self->_original mutableCopyWithZone:0];
    unsigned int v7 = v6;
    if (*(unsigned char *)&self->_flags) {
      [v6 invert];
    }
    return v7;
  }
}

- (BOOL)longCharacterIsMember:(unsigned int)a3
{
  return ((CFCharacterSetIsLongCharacterMember((CFCharacterSetRef)self->_original, a3) != 0) ^ *(unsigned char *)&self->_flags) & 1;
}

- (BOOL)isSupersetOfSet:(id)a3
{
  invertedSet = self->_invertedSet;
  if (invertedSet) {
    return CFCharacterSetIsSupersetOfSet((CFCharacterSetRef)invertedSet, (CFCharacterSetRef)a3) != 0;
  }
  int IsSupersetOfSet = CFCharacterSetIsSupersetOfSet((CFCharacterSetRef)self->_original, (CFCharacterSetRef)a3);
  int v7 = IsSupersetOfSet;
  $37465DDE4F5514DE4D52F8519CE55D34 flags = self->_flags;
  BOOL result = (*(unsigned char *)&flags & 1) == 0 && IsSupersetOfSet != 0;
  if ((*(unsigned char *)&flags & 1) != 0 && !v7)
  {
    [(_NSPlaceholderCharacterSet *)self _expandInverted];
    invertedSet = self->_invertedSet;
    return CFCharacterSetIsSupersetOfSet((CFCharacterSetRef)invertedSet, (CFCharacterSetRef)a3) != 0;
  }
  return result;
}

- (BOOL)hasMemberInPlane:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  v5 = &OBJC_IVAR____NSPlaceholderCharacterSet__original;
  if (*(unsigned char *)&self->_flags)
  {
    [(_NSPlaceholderCharacterSet *)self _expandInverted];
    v5 = &OBJC_IVAR____NSPlaceholderCharacterSet__invertedSet;
  }
  return CFCharacterSetHasMemberInPlane(*(CFCharacterSetRef *)((char *)&self->super.super.isa + *v5), v3) != 0;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  original = self->_original;
  $37465DDE4F5514DE4D52F8519CE55D34 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if (original == (NSCharacterSet *)[a3 _expandedCFCharacterSet]) {
      return 1;
    }
    $37465DDE4F5514DE4D52F8519CE55D34 flags = self->_flags;
  }
  if (*(unsigned char *)&flags)
  {
    [(_NSPlaceholderCharacterSet *)self _expandInverted];
    original = self->_invertedSet;
  }
  return CFEqual(original, a3) != 0;
}

- (id)bitmapRepresentation
{
  unsigned int v3 = &OBJC_IVAR____NSPlaceholderCharacterSet__original;
  if (*(unsigned char *)&self->_flags)
  {
    [(_NSPlaceholderCharacterSet *)self _expandInverted];
    unsigned int v3 = &OBJC_IVAR____NSPlaceholderCharacterSet__invertedSet;
  }
  CFDataRef BitmapRepresentation = CFCharacterSetCreateBitmapRepresentation(0, *(CFCharacterSetRef *)((char *)&self->super.super.isa + *v3));

  return BitmapRepresentation;
}

- (BOOL)isEmpty
{
  if ((*(unsigned char *)&self->_flags & 1) == 0 || [(NSCharacterSet *)self->_original isEmpty]) {
    return 0;
  }
  [(_NSPlaceholderCharacterSet *)self _expandInverted];
  invertedSet = self->_invertedSet;

  return [(NSCharacterSet *)invertedSet isEmpty];
}

- (id)invertedSet
{
  id result = self->_original;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    return (id)[result invertedSet];
  }
  return result;
}

- (_NSPlaceholderCharacterSet)autorelease
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    v2.receiver = self;
    v2.super_class = (Class)_NSPlaceholderCharacterSet;
    return [(_NSPlaceholderCharacterSet *)&v2 autorelease];
  }
  return self;
}

- (_NSPlaceholderCharacterSet)retain
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    v2.receiver = self;
    v2.super_class = (Class)_NSPlaceholderCharacterSet;
    return [(_NSPlaceholderCharacterSet *)&v2 retain];
  }
  return self;
}

- (unint64_t)retainCount
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return -1;
  }
  v3.receiver = self;
  v3.super_class = (Class)_NSPlaceholderCharacterSet;
  return [(_NSPlaceholderCharacterSet *)&v3 retainCount];
}

- (void)release
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    v2.receiver = self;
    v2.super_class = (Class)_NSPlaceholderCharacterSet;
    [(_NSPlaceholderCharacterSet *)&v2 release];
  }
}

- (BOOL)_isDeallocating
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)_NSPlaceholderCharacterSet;
  return [(_NSPlaceholderCharacterSet *)&v3 _isDeallocating];
}

- (BOOL)_tryRetain
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return 1;
  }
  v3.receiver = self;
  v3.super_class = (Class)_NSPlaceholderCharacterSet;
  return [(_NSPlaceholderCharacterSet *)&v3 _tryRetain];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {

    v3.receiver = self;
    v3.super_class = (Class)_NSPlaceholderCharacterSet;
    [(_NSPlaceholderCharacterSet *)&v3 dealloc];
  }
}

- (id)replacementObjectForKeyedArchiver:(id)a3
{
  uint64_t v4 = &OBJC_IVAR____NSPlaceholderCharacterSet__original;
  if (*(unsigned char *)&self->_flags)
  {
    [(_NSPlaceholderCharacterSet *)self _expandInverted];
    uint64_t v4 = &OBJC_IVAR____NSPlaceholderCharacterSet__invertedSet;
  }
  return *(Class *)((char *)&self->super.super.isa + *v4);
}

- (id)replacementObjectForCoder:(id)a3
{
  uint64_t v4 = &OBJC_IVAR____NSPlaceholderCharacterSet__original;
  if (*(unsigned char *)&self->_flags)
  {
    [(_NSPlaceholderCharacterSet *)self _expandInverted];
    uint64_t v4 = &OBJC_IVAR____NSPlaceholderCharacterSet__invertedSet;
  }
  return *(Class *)((char *)&self->super.super.isa + *v4);
}

@end