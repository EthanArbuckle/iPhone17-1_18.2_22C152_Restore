@interface JavaLangStringBuilder
+ (const)__metadata;
- (JavaLangStringBuilder)init;
- (JavaLangStringBuilder)initWithInt:(int)a3;
- (JavaLangStringBuilder)initWithJavaLangCharSequence:(id)a3;
- (JavaLangStringBuilder)initWithNSString:(id)a3;
- (NSString)description;
- (id)appendCodePointWithInt:(int)a3;
- (id)appendWithBoolean:(BOOL)a3;
- (id)appendWithChar:(unsigned __int16)a3;
- (id)appendWithCharArray:(id)a3;
- (id)appendWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)appendWithDouble:(double)a3;
- (id)appendWithFloat:(float)a3;
- (id)appendWithId:(id)a3;
- (id)appendWithInt:(int)a3;
- (id)appendWithJavaLangCharSequence:(id)a3;
- (id)appendWithJavaLangCharSequence:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)appendWithJavaLangStringBuffer:(id)a3;
- (id)appendWithLong:(int64_t)a3;
- (id)appendWithNSString:(id)a3;
- (id)deleteCharAtWithInt:(int)a3;
- (id)delete__WithInt:(int)a3 withInt:(int)a4;
- (id)insertWithInt:(int)a3 withBoolean:(BOOL)a4;
- (id)insertWithInt:(int)a3 withChar:(unsigned __int16)a4;
- (id)insertWithInt:(int)a3 withCharArray:(id)a4;
- (id)insertWithInt:(int)a3 withCharArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (id)insertWithInt:(int)a3 withDouble:(double)a4;
- (id)insertWithInt:(int)a3 withFloat:(float)a4;
- (id)insertWithInt:(int)a3 withId:(id)a4;
- (id)insertWithInt:(int)a3 withInt:(int)a4;
- (id)insertWithInt:(int)a3 withJavaLangCharSequence:(id)a4;
- (id)insertWithInt:(int)a3 withJavaLangCharSequence:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (id)insertWithInt:(int)a3 withLong:(int64_t)a4;
- (id)insertWithInt:(int)a3 withNSString:(id)a4;
- (id)replaceWithInt:(int)a3 withInt:(int)a4 withNSString:(id)a5;
- (id)reverse;
- (id)subSequenceFrom:(int)a3 to:(int)a4;
- (int)length;
- (void)readObjectWithJavaIoObjectInputStream:(id)a3;
- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3;
@end

@implementation JavaLangStringBuilder

- (JavaLangStringBuilder)init
{
  return self;
}

- (JavaLangStringBuilder)initWithInt:(int)a3
{
  return self;
}

- (JavaLangStringBuilder)initWithJavaLangCharSequence:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  JavaLangStringBuilder_initWithNSString_(self, [a3 description]);
  return self;
}

- (JavaLangStringBuilder)initWithNSString:(id)a3
{
  return self;
}

- (id)appendWithBoolean:(BOOL)a3
{
  p_delegate = &self->super.delegate_;
  if (a3) {
    CFStringRef v5 = @"true";
  }
  else {
    CFStringRef v5 = @"false";
  }
  JreStringBuilder_appendString((uint64_t)p_delegate, v5);
  return self;
}

- (id)appendWithChar:(unsigned __int16)a3
{
  return self;
}

- (id)appendWithInt:(int)a3
{
  return self;
}

- (id)appendWithLong:(int64_t)a3
{
  return self;
}

- (id)appendWithFloat:(float)a3
{
  return self;
}

- (id)appendWithDouble:(double)a3
{
  return self;
}

- (id)appendWithId:(id)a3
{
  if (a3) {
    JreStringBuilder_appendString((uint64_t)&self->super.delegate_, (CFStringRef)[a3 description]);
  }
  else {
    JreStringBuilder_appendNull((uint64_t)&self->super.delegate_);
  }
  return self;
}

- (id)appendWithNSString:(id)a3
{
  return self;
}

- (id)appendWithJavaLangStringBuffer:(id)a3
{
  p_delegate = &self->super.delegate_;
  if (a3) {
    JreStringBuilder_appendBuffer((uint64_t)p_delegate, *((void **)a3 + 1), *((_DWORD *)a3 + 5));
  }
  else {
    JreStringBuilder_appendNull((uint64_t)p_delegate);
  }
  return self;
}

- (id)appendWithCharArray:(id)a3
{
  return self;
}

- (id)appendWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return self;
}

- (id)appendWithJavaLangCharSequence:(id)a3
{
  if (a3) {
    JreStringBuilder_appendCharSequence((uint64_t)&self->super.delegate_, (__CFString *)a3, 0, (int)[a3 length]);
  }
  else {
    JreStringBuilder_appendNull((uint64_t)&self->super.delegate_);
  }
  return self;
}

- (id)appendWithJavaLangCharSequence:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return self;
}

- (id)appendCodePointWithInt:(int)a3
{
  p_delegate = &self->super.delegate_;
  v10 = JavaLangCharacter_toCharsWithInt_(*(uint64_t *)&a3, (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
  JreStringBuilder_appendCharArray((uint64_t)p_delegate, (uint64_t)v10);
  return self;
}

- (id)delete__WithInt:(int)a3 withInt:(int)a4
{
  return self;
}

- (id)deleteCharAtWithInt:(int)a3
{
  return self;
}

- (id)insertWithInt:(int)a3 withBoolean:(BOOL)a4
{
  uint64_t v4 = *(void *)&a3;
  p_delegate = &self->super.delegate_;
  if (a4) {
    uint64_t v7 = @"true";
  }
  else {
    uint64_t v7 = @"false";
  }
  JreStringBuilder_insertString((uint64_t)p_delegate, v4, v7);
  return self;
}

- (id)insertWithInt:(int)a3 withChar:(unsigned __int16)a4
{
  return self;
}

- (id)insertWithInt:(int)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a3;
  p_delegate = &self->super.delegate_;
  uint64_t v7 = (__CFString *)JavaLangInteger_toStringWithInt_(a4);
  JreStringBuilder_insertString((uint64_t)p_delegate, v4, v7);
  return self;
}

- (id)insertWithInt:(int)a3 withLong:(int64_t)a4
{
  uint64_t v4 = *(void *)&a3;
  p_delegate = &self->super.delegate_;
  uint64_t v7 = (__CFString *)JavaLangLong_toStringWithLong_(a4);
  JreStringBuilder_insertString((uint64_t)p_delegate, v4, v7);
  return self;
}

- (id)insertWithInt:(int)a3 withFloat:(float)a4
{
  uint64_t v4 = *(void *)&a3;
  p_delegate = &self->super.delegate_;
  uint64_t v7 = (__CFString *)JavaLangFloat_toStringWithFloat_(a4);
  JreStringBuilder_insertString((uint64_t)p_delegate, v4, v7);
  return self;
}

- (id)insertWithInt:(int)a3 withDouble:(double)a4
{
  uint64_t v4 = *(void *)&a3;
  p_delegate = &self->super.delegate_;
  uint64_t v7 = (__CFString *)JavaLangDouble_toStringWithDouble_(a4);
  JreStringBuilder_insertString((uint64_t)p_delegate, v4, v7);
  return self;
}

- (id)insertWithInt:(int)a3 withId:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  if (a4) {
    uint64_t v6 = (__CFString *)[a4 description];
  }
  else {
    uint64_t v6 = @"null";
  }
  JreStringBuilder_insertString((uint64_t)&self->super.delegate_, v4, v6);
  return self;
}

- (id)insertWithInt:(int)a3 withNSString:(id)a4
{
  return self;
}

- (id)insertWithInt:(int)a3 withCharArray:(id)a4
{
  return self;
}

- (id)insertWithInt:(int)a3 withCharArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  return self;
}

- (id)insertWithInt:(int)a3 withJavaLangCharSequence:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  if (a4) {
    uint64_t v6 = (__CFString *)[a4 description];
  }
  else {
    uint64_t v6 = @"null";
  }
  JreStringBuilder_insertString((uint64_t)&self->super.delegate_, v4, v6);
  return self;
}

- (id)insertWithInt:(int)a3 withJavaLangCharSequence:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  return self;
}

- (id)replaceWithInt:(int)a3 withInt:(int)a4 withNSString:(id)a5
{
  return self;
}

- (id)reverse
{
  return self;
}

- (NSString)description
{
  return (NSString *)JreStringBuilder_toString((uint64_t)&self->super.delegate_);
}

- (int)length
{
  v3.receiver = self;
  v3.super_class = (Class)JavaLangStringBuilder;
  return [(JavaLangAbstractStringBuilder *)&v3 length];
}

- (id)subSequenceFrom:(int)a3 to:(int)a4
{
  v5.receiver = self;
  v5.super_class = (Class)JavaLangStringBuilder;
  return [(JavaLangAbstractStringBuilder *)&v5 substringWithInt:*(void *)&a3 withInt:*(void *)&a4];
}

- (void)readObjectWithJavaIoObjectInputStream:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  [a3 defaultReadObject];
  id v5 = [a3 readInt];
  id v6 = [a3 readObject];
  objc_opt_class();
  if (v6 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  [(JavaLangAbstractStringBuilder *)self setWithCharArray:v6 withInt:v5];
}

- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  [a3 defaultWriteObject];
  objc_msgSend(a3, "writeIntWithInt:", -[JavaLangStringBuilder length](self, "length"));
  id v5 = [(JavaLangAbstractStringBuilder *)self getValue];
  [a3 writeObjectWithId:v5];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004619F0;
}

@end