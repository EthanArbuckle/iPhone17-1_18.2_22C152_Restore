@interface NSMutableCharacterSet
+ (BOOL)supportsSecureCoding;
+ (NSMutableCharacterSet)alphanumericCharacterSet;
+ (NSMutableCharacterSet)capitalizedLetterCharacterSet;
+ (NSMutableCharacterSet)characterSetWithBitmapRepresentation:(NSData *)data;
+ (NSMutableCharacterSet)characterSetWithCharactersInString:(NSString *)aString;
+ (NSMutableCharacterSet)characterSetWithContentsOfFile:(NSString *)fName;
+ (NSMutableCharacterSet)characterSetWithRange:(NSRange)aRange;
+ (NSMutableCharacterSet)controlCharacterSet;
+ (NSMutableCharacterSet)decimalDigitCharacterSet;
+ (NSMutableCharacterSet)decomposableCharacterSet;
+ (NSMutableCharacterSet)illegalCharacterSet;
+ (NSMutableCharacterSet)letterCharacterSet;
+ (NSMutableCharacterSet)lowercaseLetterCharacterSet;
+ (NSMutableCharacterSet)newlineCharacterSet;
+ (NSMutableCharacterSet)nonBaseCharacterSet;
+ (NSMutableCharacterSet)punctuationCharacterSet;
+ (NSMutableCharacterSet)symbolCharacterSet;
+ (NSMutableCharacterSet)uppercaseLetterCharacterSet;
+ (NSMutableCharacterSet)whitespaceAndNewlineCharacterSet;
+ (NSMutableCharacterSet)whitespaceCharacterSet;
- (BOOL)isMutable;
- (NSMutableCharacterSet)init;
- (NSMutableCharacterSet)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)addCharactersInRange:(NSRange)aRange;
- (void)addCharactersInString:(NSString *)aString;
- (void)formIntersectionWithCharacterSet:(NSCharacterSet *)otherSet;
- (void)formUnionWithCharacterSet:(NSCharacterSet *)otherSet;
- (void)invert;
- (void)removeCharactersInRange:(NSRange)aRange;
- (void)removeCharactersInString:(NSString *)aString;
@end

@implementation NSMutableCharacterSet

- (NSMutableCharacterSet)init
{
  if (!init___NSMutableCharacterSetClass) {
    init___NSMutableCharacterSetClass = objc_opt_class();
  }
  if (!-[NSMutableCharacterSet isMemberOfClass:](self, "isMemberOfClass:")) {
    return self;
  }
  Mutable = (NSMutableCharacterSet *)CFCharacterSetCreateMutable(0);

  return Mutable;
}

+ (NSMutableCharacterSet)alphanumericCharacterSet
{
  id v2 = [+[NSCharacterSet alphanumericCharacterSet] mutableCopyWithZone:0];

  return (NSMutableCharacterSet *)v2;
}

+ (NSMutableCharacterSet)decimalDigitCharacterSet
{
  id v2 = [+[NSCharacterSet decimalDigitCharacterSet] mutableCopyWithZone:0];

  return (NSMutableCharacterSet *)v2;
}

+ (NSMutableCharacterSet)whitespaceCharacterSet
{
  id v2 = [+[NSCharacterSet whitespaceCharacterSet] mutableCopyWithZone:0];

  return (NSMutableCharacterSet *)v2;
}

+ (NSMutableCharacterSet)characterSetWithRange:(NSRange)aRange
{
  CFIndex length = aRange.length;
  CFIndex location = aRange.location;
  Mutable = CFCharacterSetCreateMutable(0);
  v8.CFIndex location = location;
  v8.CFIndex length = length;
  CFCharacterSetAddCharactersInRange(Mutable, v8);

  return (NSMutableCharacterSet *)Mutable;
}

+ (NSMutableCharacterSet)characterSetWithCharactersInString:(NSString *)aString
{
  Mutable = CFCharacterSetCreateMutable(0);
  CFCharacterSetAddCharactersInString(Mutable, (CFStringRef)aString);

  return (NSMutableCharacterSet *)Mutable;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(NSMutableCharacterSet *)self mutableCopyWithZone:a3];
  [v3 makeImmutable];
  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  Name = sel_getName(a2);
  NSLog((NSString *)@"Abstract class %@ does not implement method %s; it must be implemented in subclasses.",
    v5,
    Name);
  [(NSMutableCharacterSet *)self doesNotRecognizeSelector:a2];
  return 0;
}

- (void)addCharactersInRange:(NSRange)aRange
{
  uint64_t v5 = objc_opt_class();
  Name = sel_getName(a2);
  NSLog((NSString *)@"Abstract class %@ does not implement method %s; it must be implemented in subclasses.",
    v5,
    Name);

  [(NSMutableCharacterSet *)self doesNotRecognizeSelector:a2];
}

- (void)removeCharactersInRange:(NSRange)aRange
{
  uint64_t v5 = objc_opt_class();
  Name = sel_getName(a2);
  NSLog((NSString *)@"Abstract class %@ does not implement method %s; it must be implemented in subclasses.",
    v5,
    Name);

  [(NSMutableCharacterSet *)self doesNotRecognizeSelector:a2];
}

- (void)addCharactersInString:(NSString *)aString
{
  uint64_t v5 = objc_opt_class();
  Name = sel_getName(a2);
  NSLog((NSString *)@"Abstract class %@ does not implement method %s; it must be implemented in subclasses.",
    v5,
    Name);

  [(NSMutableCharacterSet *)self doesNotRecognizeSelector:a2];
}

- (void)removeCharactersInString:(NSString *)aString
{
  uint64_t v5 = objc_opt_class();
  Name = sel_getName(a2);
  NSLog((NSString *)@"Abstract class %@ does not implement method %s; it must be implemented in subclasses.",
    v5,
    Name);

  [(NSMutableCharacterSet *)self doesNotRecognizeSelector:a2];
}

- (void)formUnionWithCharacterSet:(NSCharacterSet *)otherSet
{
  uint64_t v5 = objc_opt_class();
  Name = sel_getName(a2);
  NSLog((NSString *)@"Abstract class %@ does not implement method %s; it must be implemented in subclasses.",
    v5,
    Name);

  [(NSMutableCharacterSet *)self doesNotRecognizeSelector:a2];
}

- (void)formIntersectionWithCharacterSet:(NSCharacterSet *)otherSet
{
  uint64_t v5 = objc_opt_class();
  Name = sel_getName(a2);
  NSLog((NSString *)@"Abstract class %@ does not implement method %s; it must be implemented in subclasses.",
    v5,
    Name);

  [(NSMutableCharacterSet *)self doesNotRecognizeSelector:a2];
}

- (void)invert
{
  uint64_t v4 = objc_opt_class();
  Name = sel_getName(a2);
  NSLog((NSString *)@"Abstract class %@ does not implement method %s; it must be implemented in subclasses.",
    v4,
    Name);

  [(NSMutableCharacterSet *)self doesNotRecognizeSelector:a2];
}

- (BOOL)isMutable
{
  return 1;
}

+ (NSMutableCharacterSet)controlCharacterSet
{
  id v2 = [+[NSCharacterSet controlCharacterSet] mutableCopyWithZone:0];

  return (NSMutableCharacterSet *)v2;
}

+ (NSMutableCharacterSet)whitespaceAndNewlineCharacterSet
{
  id v2 = [+[NSCharacterSet whitespaceAndNewlineCharacterSet] mutableCopyWithZone:0];

  return (NSMutableCharacterSet *)v2;
}

+ (NSMutableCharacterSet)letterCharacterSet
{
  id v2 = [+[NSCharacterSet letterCharacterSet] mutableCopyWithZone:0];

  return (NSMutableCharacterSet *)v2;
}

+ (NSMutableCharacterSet)lowercaseLetterCharacterSet
{
  id v2 = [+[NSCharacterSet lowercaseLetterCharacterSet] mutableCopyWithZone:0];

  return (NSMutableCharacterSet *)v2;
}

+ (NSMutableCharacterSet)uppercaseLetterCharacterSet
{
  id v2 = [+[NSCharacterSet uppercaseLetterCharacterSet] mutableCopyWithZone:0];

  return (NSMutableCharacterSet *)v2;
}

+ (NSMutableCharacterSet)nonBaseCharacterSet
{
  id v2 = [+[NSCharacterSet nonBaseCharacterSet] mutableCopyWithZone:0];

  return (NSMutableCharacterSet *)v2;
}

+ (NSMutableCharacterSet)decomposableCharacterSet
{
  id v2 = [+[NSCharacterSet decomposableCharacterSet] mutableCopyWithZone:0];

  return (NSMutableCharacterSet *)v2;
}

+ (NSMutableCharacterSet)illegalCharacterSet
{
  id v2 = [+[NSCharacterSet illegalCharacterSet] mutableCopyWithZone:0];

  return (NSMutableCharacterSet *)v2;
}

+ (NSMutableCharacterSet)punctuationCharacterSet
{
  id v2 = [+[NSCharacterSet punctuationCharacterSet] mutableCopyWithZone:0];

  return (NSMutableCharacterSet *)v2;
}

+ (NSMutableCharacterSet)capitalizedLetterCharacterSet
{
  id v2 = [+[NSCharacterSet capitalizedLetterCharacterSet] mutableCopyWithZone:0];

  return (NSMutableCharacterSet *)v2;
}

+ (NSMutableCharacterSet)symbolCharacterSet
{
  id v2 = [+[NSCharacterSet symbolCharacterSet] mutableCopyWithZone:0];

  return (NSMutableCharacterSet *)v2;
}

+ (NSMutableCharacterSet)newlineCharacterSet
{
  id v2 = [+[NSCharacterSet newlineCharacterSet] mutableCopyWithZone:0];

  return (NSMutableCharacterSet *)v2;
}

+ (NSMutableCharacterSet)characterSetWithBitmapRepresentation:(NSData *)data
{
  id v3 = [+[NSCharacterSet characterSetWithBitmapRepresentation:data] mutableCopyWithZone:0];

  return (NSMutableCharacterSet *)v3;
}

+ (NSMutableCharacterSet)characterSetWithContentsOfFile:(NSString *)fName
{
  id v3 = [+[NSCharacterSet characterSetWithContentsOfFile:fName] mutableCopyWithZone:0];

  return (NSMutableCharacterSet *)v3;
}

- (NSMutableCharacterSet)initWithCoder:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)NSMutableCharacterSet;
  uint64_t v4 = -[NSCharacterSet initWithCoder:](&v8, sel_initWithCoder_);
  uint64_t v5 = [(NSMutableCharacterSet *)v4 mutableCopyWithZone:0];
  if (v5)
  {
  }
  else
  {
    v6 = +[NSString stringWithFormat:@"Unable to create mutable copy of the character set %p!", v4];

    v9 = @"NSLocalizedDescription";
    v10[0] = v6;
    objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 4864, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1)));
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end