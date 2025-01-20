@interface JavaLangStringBuffer
+ (const)__metadata;
- (JavaLangStringBuffer)init;
- (JavaLangStringBuffer)initWithInt:(int)a3;
- (JavaLangStringBuffer)initWithJavaLangCharSequence:(id)a3;
- (JavaLangStringBuffer)initWithNSString:(id)a3;
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
- (id)substringWithInt:(int)a3;
- (id)substringWithInt:(int)a3 withInt:(int)a4;
- (int)codePointAtWithInt:(int)a3;
- (int)codePointBeforeWithInt:(int)a3;
- (int)codePointCountWithInt:(int)a3 withInt:(int)a4;
- (int)indexOfWithNSString:(id)a3 withInt:(int)a4;
- (int)lastIndexOfWithNSString:(id)a3 withInt:(int)a4;
- (int)length;
- (int)offsetByCodePointsWithInt:(int)a3 withInt:(int)a4;
- (unsigned)charAtWithInt:(int)a3;
- (void)ensureCapacityWithInt:(int)a3;
- (void)getCharsWithInt:(int)a3 withInt:(int)a4 withCharArray:(id)a5 withInt:(int)a6;
- (void)setCharAtWithInt:(int)a3 withChar:(unsigned __int16)a4;
- (void)setLengthWithInt:(int)a3;
- (void)trimToSize;
@end

@implementation JavaLangStringBuffer

- (JavaLangStringBuffer)init
{
  return self;
}

- (JavaLangStringBuffer)initWithInt:(int)a3
{
  return self;
}

- (JavaLangStringBuffer)initWithNSString:(id)a3
{
  return self;
}

- (JavaLangStringBuffer)initWithJavaLangCharSequence:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  JavaLangStringBuffer_initWithNSString_(self, [a3 description]);
  return self;
}

- (id)appendWithBoolean:(BOOL)a3
{
  if (a3) {
    CFStringRef v3 = @"true";
  }
  else {
    CFStringRef v3 = @"false";
  }
  return [(JavaLangStringBuffer *)self appendWithNSString:v3];
}

- (id)appendWithChar:(unsigned __int16)a3
{
  return self;
}

- (id)appendWithDouble:(double)a3
{
  return self;
}

- (id)appendWithFloat:(float)a3
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

- (id)appendWithId:(id)a3
{
  if (a3) {
    JreStringBuilder_appendString((uint64_t)&self->super.delegate_, (CFStringRef)[a3 description]);
  }
  else {
    JreStringBuilder_appendNull((uint64_t)&self->super.delegate_);
  }
  objc_sync_exit(self);
  return self;
}

- (id)appendWithNSString:(id)a3
{
  return self;
}

- (id)appendWithJavaLangStringBuffer:(id)a3
{
  if (a3)
  {
    objc_sync_enter(a3);
    JreStringBuilder_appendBuffer((uint64_t)&self->super.delegate_, *((void **)a3 + 1), *((_DWORD *)a3 + 5));
    objc_sync_exit(a3);
  }
  else
  {
    JreStringBuilder_appendNull((uint64_t)&self->super.delegate_);
  }
  objc_sync_exit(self);
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
  objc_sync_exit(self);
  return self;
}

- (id)appendWithJavaLangCharSequence:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v6 = *(void *)&a4;
  objc_sync_enter(self);
  JreStringBuilder_appendCharSequence((uint64_t)&self->super.delegate_, (__CFString *)a3, v6, a5);
  objc_sync_exit(self);
  return self;
}

- (id)appendCodePointWithInt:(int)a3
{
  v9 = JavaLangCharacter_toCharsWithInt_(*(uint64_t *)&a3, (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
  return [(JavaLangStringBuffer *)self appendWithCharArray:v9];
}

- (unsigned)charAtWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  objc_sync_enter(self);
  v6.receiver = self;
  v6.super_class = (Class)JavaLangStringBuffer;
  LOWORD(v3) = [(JavaLangAbstractStringBuilder *)&v6 charAtWithInt:v3];
  objc_sync_exit(self);
  return v3;
}

- (int)codePointAtWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  objc_sync_enter(self);
  v6.receiver = self;
  v6.super_class = (Class)JavaLangStringBuffer;
  LODWORD(v3) = [(JavaLangAbstractStringBuilder *)&v6 codePointAtWithInt:v3];
  objc_sync_exit(self);
  return v3;
}

- (int)codePointBeforeWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  objc_sync_enter(self);
  v6.receiver = self;
  v6.super_class = (Class)JavaLangStringBuffer;
  LODWORD(v3) = [(JavaLangAbstractStringBuilder *)&v6 codePointBeforeWithInt:v3];
  objc_sync_exit(self);
  return v3;
}

- (int)codePointCountWithInt:(int)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  objc_sync_enter(self);
  v8.receiver = self;
  v8.super_class = (Class)JavaLangStringBuffer;
  LODWORD(v4) = [(JavaLangAbstractStringBuilder *)&v8 codePointCountWithInt:v5 withInt:v4];
  objc_sync_exit(self);
  return v4;
}

- (id)delete__WithInt:(int)a3 withInt:(int)a4
{
  uint64_t v5 = *(void *)&a3;
  objc_sync_enter(self);
  JreStringBuilder_delete(&self->super.delegate_, v5, a4);
  objc_sync_exit(self);
  return self;
}

- (id)deleteCharAtWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  objc_sync_enter(self);
  JreStringBuilder_deleteCharAt(&self->super.delegate_, v3);
  objc_sync_exit(self);
  return self;
}

- (void)ensureCapacityWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  objc_sync_enter(self);
  v5.receiver = self;
  v5.super_class = (Class)JavaLangStringBuffer;
  [(JavaLangAbstractStringBuilder *)&v5 ensureCapacityWithInt:v3];
  objc_sync_exit(self);
}

- (void)getCharsWithInt:(int)a3 withInt:(int)a4 withCharArray:(id)a5 withInt:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v8 = *(void *)&a4;
  uint64_t v9 = *(void *)&a3;
  objc_sync_enter(self);
  v11.receiver = self;
  v11.super_class = (Class)JavaLangStringBuffer;
  [(JavaLangAbstractStringBuilder *)&v11 getCharsWithInt:v9 withInt:v8 withCharArray:a5 withInt:v6];
  objc_sync_exit(self);
}

- (int)indexOfWithNSString:(id)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  objc_sync_enter(self);
  v8.receiver = self;
  v8.super_class = (Class)JavaLangStringBuffer;
  LODWORD(v4) = [(JavaLangAbstractStringBuilder *)&v8 indexOfWithNSString:a3 withInt:v4];
  objc_sync_exit(self);
  return v4;
}

- (id)insertWithInt:(int)a3 withChar:(unsigned __int16)a4
{
  uint64_t v5 = *(void *)&a3;
  objc_sync_enter(self);
  JreStringBuilder_insertChar((uint64_t)&self->super.delegate_, v5, a4);
  objc_sync_exit(self);
  return self;
}

- (id)insertWithInt:(int)a3 withBoolean:(BOOL)a4
{
  if (a4) {
    CFStringRef v4 = @"true";
  }
  else {
    CFStringRef v4 = @"false";
  }
  return [(JavaLangStringBuffer *)self insertWithInt:*(void *)&a3 withNSString:v4];
}

- (id)insertWithInt:(int)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = JavaLangInteger_toStringWithInt_(a4);
  return [(JavaLangStringBuffer *)self insertWithInt:v4 withNSString:v6];
}

- (id)insertWithInt:(int)a3 withLong:(int64_t)a4
{
  uint64_t v4 = *(void *)&a3;
  CFStringRef v6 = JavaLangLong_toStringWithLong_(a4);
  return [(JavaLangStringBuffer *)self insertWithInt:v4 withNSString:v6];
}

- (id)insertWithInt:(int)a3 withDouble:(double)a4
{
  uint64_t v4 = *(void *)&a3;
  CFStringRef v6 = JavaLangDouble_toStringWithDouble_(a4);
  return [(JavaLangStringBuffer *)self insertWithInt:v4 withNSString:v6];
}

- (id)insertWithInt:(int)a3 withFloat:(float)a4
{
  uint64_t v4 = *(void *)&a3;
  CFStringRef v6 = JavaLangFloat_toStringWithFloat_(a4);
  return [(JavaLangStringBuffer *)self insertWithInt:v4 withNSString:v6];
}

- (id)insertWithInt:(int)a3 withId:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  if (a4) {
    CFStringRef v6 = (const __CFString *)[a4 description];
  }
  else {
    CFStringRef v6 = @"null";
  }
  return [(JavaLangStringBuffer *)self insertWithInt:v4 withNSString:v6];
}

- (id)insertWithInt:(int)a3 withNSString:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  objc_sync_enter(self);
  JreStringBuilder_insertString((uint64_t)&self->super.delegate_, v5, (__CFString *)a4);
  objc_sync_exit(self);
  return self;
}

- (id)insertWithInt:(int)a3 withCharArray:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  objc_sync_enter(self);
  JreStringBuilder_insertCharArray(&self->super.delegate_, v5, (uint64_t)a4);
  objc_sync_exit(self);
  return self;
}

- (id)insertWithInt:(int)a3 withCharArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v9 = *(void *)&a3;
  objc_sync_enter(self);
  JreStringBuilder_insertCharArraySubset(&self->super.delegate_, v9, (uint64_t)a4, v7, v6);
  objc_sync_exit(self);
  return self;
}

- (id)insertWithInt:(int)a3 withJavaLangCharSequence:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  objc_sync_enter(self);
  if (a4) {
    uint64_t v7 = (__CFString *)[a4 description];
  }
  else {
    uint64_t v7 = @"null";
  }
  JreStringBuilder_insertString((uint64_t)&self->super.delegate_, v5, v7);
  objc_sync_exit(self);
  return self;
}

- (id)insertWithInt:(int)a3 withJavaLangCharSequence:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v9 = *(void *)&a3;
  objc_sync_enter(self);
  JreStringBuilder_insertCharSequence((uint64_t)&self->super.delegate_, v9, (__CFString *)a4, v7, v6);
  objc_sync_exit(self);
  return self;
}

- (int)lastIndexOfWithNSString:(id)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  objc_sync_enter(self);
  v8.receiver = self;
  v8.super_class = (Class)JavaLangStringBuffer;
  LODWORD(v4) = [(JavaLangAbstractStringBuilder *)&v8 lastIndexOfWithNSString:a3 withInt:v4];
  objc_sync_exit(self);
  return v4;
}

- (int)length
{
  v3.receiver = self;
  v3.super_class = (Class)JavaLangStringBuffer;
  return [(JavaLangAbstractStringBuilder *)&v3 length];
}

- (int)offsetByCodePointsWithInt:(int)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  objc_sync_enter(self);
  v8.receiver = self;
  v8.super_class = (Class)JavaLangStringBuffer;
  LODWORD(v4) = [(JavaLangAbstractStringBuilder *)&v8 offsetByCodePointsWithInt:v5 withInt:v4];
  objc_sync_exit(self);
  return v4;
}

- (id)replaceWithInt:(int)a3 withInt:(int)a4 withNSString:(id)a5
{
  uint64_t v7 = *(void *)&a3;
  objc_sync_enter(self);
  JreStringBuilder_replace((uint64_t)&self->super.delegate_, v7, a4, (__CFString *)a5);
  objc_sync_exit(self);
  return self;
}

- (id)reverse
{
  return self;
}

- (void)setCharAtWithInt:(int)a3 withChar:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = *(void *)&a3;
  objc_sync_enter(self);
  v7.receiver = self;
  v7.super_class = (Class)JavaLangStringBuffer;
  [(JavaLangAbstractStringBuilder *)&v7 setCharAtWithInt:v5 withChar:v4];
  objc_sync_exit(self);
}

- (void)setLengthWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  objc_sync_enter(self);
  v5.receiver = self;
  v5.super_class = (Class)JavaLangStringBuffer;
  [(JavaLangAbstractStringBuilder *)&v5 setLengthWithInt:v3];
  objc_sync_exit(self);
}

- (id)subSequenceFrom:(int)a3 to:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  objc_sync_enter(self);
  v9.receiver = self;
  v9.super_class = (Class)JavaLangStringBuffer;
  id v7 = [(JavaLangAbstractStringBuilder *)&v9 substringWithInt:v5 withInt:v4];
  objc_sync_exit(self);
  return v7;
}

- (id)substringWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  objc_sync_enter(self);
  v7.receiver = self;
  v7.super_class = (Class)JavaLangStringBuffer;
  id v5 = [(JavaLangAbstractStringBuilder *)&v7 substringWithInt:v3];
  objc_sync_exit(self);
  return v5;
}

- (id)substringWithInt:(int)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  objc_sync_enter(self);
  v9.receiver = self;
  v9.super_class = (Class)JavaLangStringBuffer;
  id v7 = [(JavaLangAbstractStringBuilder *)&v9 substringWithInt:v5 withInt:v4];
  objc_sync_exit(self);
  return v7;
}

- (NSString)description
{
  objc_sync_enter(self);
  CFStringRef v3 = JreStringBuilder_toString((uint64_t)&self->super.delegate_);
  objc_sync_exit(self);
  return &v3->isa;
}

- (void)trimToSize
{
  objc_sync_enter(self);
  v3.receiver = self;
  v3.super_class = (Class)JavaLangStringBuffer;
  [(JavaLangAbstractStringBuilder *)&v3 trimToSize];
  objc_sync_exit(self);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100485DD8;
}

@end