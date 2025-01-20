@interface JavaLangAbstractStringBuilder
+ (J2ObjcClassInfo)__metadata;
- (JavaLangAbstractStringBuilder)init;
- (JavaLangAbstractStringBuilder)initWithInt:(int)a3;
- (JavaLangAbstractStringBuilder)initWithNSString:(id)a3;
- (id)description;
- (id)getValue;
- (id)subSequenceFrom:(int)a3 to:(int)a4;
- (id)substringWithInt:(int)a3;
- (id)substringWithInt:(int)a3 withInt:(int)a4;
- (int)capacity;
- (int)codePointAtWithInt:(int)a3;
- (int)codePointBeforeWithInt:(int)a3;
- (int)codePointCountWithInt:(int)a3 withInt:(int)a4;
- (int)indexOfWithNSString:(id)a3;
- (int)indexOfWithNSString:(id)a3 withInt:(int)a4;
- (int)lastIndexOfWithNSString:(id)a3;
- (int)lastIndexOfWithNSString:(id)a3 withInt:(int)a4;
- (int)length;
- (int)offsetByCodePointsWithInt:(int)a3 withInt:(int)a4;
- (unsigned)charAtWithInt:(int)a3;
- (void)dealloc;
- (void)ensureCapacityWithInt:(int)a3;
- (void)getCharsWithInt:(int)a3 withInt:(int)a4 withCharArray:(id)a5 withInt:(int)a6;
- (void)setCharAtWithInt:(int)a3 withChar:(unsigned __int16)a4;
- (void)setLengthWithInt:(int)a3;
- (void)setWithCharArray:(id)a3 withInt:(int)a4;
- (void)trimToSize;
@end

@implementation JavaLangAbstractStringBuilder

- (id)getValue
{
  return +[IOSCharArray arrayWithChars:self->delegate_.buffer_ count:self->delegate_.count_];
}

- (void)setWithCharArray:(id)a3 withInt:(int)a4
{
  v5 = a3;
  if (!a3)
  {
    if ((atomic_load_explicit(LibcoreUtilEmptyArray__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    v5 = (_DWORD *)LibcoreUtilEmptyArray_CHAR_;
    if (!LibcoreUtilEmptyArray_CHAR_) {
      JreThrowNullPointerException();
    }
  }
  if (v5[2] < a4) {
    objc_exception_throw([[JavaIoInvalidObjectException alloc] initWithNSString:@"count out of range"]);
  }
  buffer = self->delegate_.buffer_;
  if (self->delegate_.bufferSize_ >= a4)
  {
    size_t v8 = 2 * a4;
  }
  else
  {
    free(buffer);
    size_t v8 = 2 * a4;
    buffer = malloc_type_malloc(v8, 0x1000040BDFB0063uLL);
    self->delegate_.buffer_ = (unsigned __int16 *)buffer;
    if (!buffer) {
      sub_100254F80();
    }
    self->delegate_.bufferSize_ = a4;
  }
  memcpy(buffer, v5 + 3, v8);
  self->delegate_.count_ = a4;
}

- (JavaLangAbstractStringBuilder)init
{
  return self;
}

- (JavaLangAbstractStringBuilder)initWithInt:(int)a3
{
  return self;
}

- (JavaLangAbstractStringBuilder)initWithNSString:(id)a3
{
  return self;
}

- (int)capacity
{
  return self->delegate_.bufferSize_;
}

- (unsigned)charAtWithInt:(int)a3
{
  if (a3 < 0 || self->delegate_.count_ <= a3) {
    sub_100253E88((uint64_t)&self->delegate_, *(uint64_t *)&a3);
  }
  return self->delegate_.buffer_[a3];
}

- (void)ensureCapacityWithInt:(int)a3
{
  int bufferSize = self->delegate_.bufferSize_;
  if (bufferSize < a3)
  {
    p_delegate = &self->delegate_;
    int v5 = 2 * bufferSize + 2;
    if (v5 <= a3) {
      int v6 = a3;
    }
    else {
      int v6 = v5;
    }
    sub_100253A7C((uint64_t)p_delegate, v6);
  }
}

- (void)getCharsWithInt:(int)a3 withInt:(int)a4 withCharArray:(id)a5 withInt:(int)a6
{
  int v6 = a4 - a3;
  if (a4 < a3 || ((count = self->delegate_.count_, count >= a3) ? (BOOL v8 = count < a4) : (BOOL v8 = 1), v8)) {
    sub_100253F2C((uint64_t)&self->delegate_, *(uint64_t *)&a3, a4);
  }
  if ((v6 | a3) < 0 || self->delegate_.bufferSize_ < a4) {
    IOSArray_throwOutOfBounds();
  }
  if (!a5) {
    JreThrowNullPointerException();
  }
  if ((v6 | a6) < 0 || v6 + a6 > *((_DWORD *)a5 + 2)) {
    IOSArray_throwOutOfBounds();
  }
  v9 = &self->delegate_.buffer_[a3];
  memcpy((char *)a5 + 2 * a6 + 12, v9, 2 * v6);
}

- (int)length
{
  return self->delegate_.count_;
}

- (void)setCharAtWithInt:(int)a3 withChar:(unsigned __int16)a4
{
  if (a3 < 0 || self->delegate_.count_ <= a3) {
    sub_100253E88((uint64_t)&self->delegate_, *(uint64_t *)&a3);
  }
  self->delegate_.buffer_[a3] = a4;
}

- (void)setLengthWithInt:(int)a3
{
  if (a3 < 0) {
    objc_exception_throw([[JavaLangStringIndexOutOfBoundsException alloc] initWithNSString:+[NSString stringWithFormat:@"length < 0: %d", *(void *)&a3]]);
  }
  p_delegate = &self->delegate_;
  if (self->delegate_.bufferSize_ < a3) {
    sub_100253A7C((uint64_t)&self->delegate_, a3);
  }
  uint64_t count = self->delegate_.count_;
  if (a3 > (int)count) {
    bzero(&p_delegate->buffer_[count], 2 * (a3 - (int)count));
  }
  self->delegate_.count_ = a3;
}

- (id)substringWithInt:(int)a3
{
  if (a3 < 0 || (int count = self->delegate_.count_, v4 = count - a3, count < a3)) {
    sub_100253E88((uint64_t)&self->delegate_, *(uint64_t *)&a3);
  }
  if (count == a3) {
    return &stru_10048C1F8;
  }
  int v6 = &self->delegate_.buffer_[a3];
  return +[NSString stringWithCharacters:v6 length:v4];
}

- (id)substringWithInt:(int)a3 withInt:(int)a4
{
  if (a3 < 0 || a4 < a3 || self->delegate_.count_ < a4) {
    sub_100253F2C((uint64_t)&self->delegate_, *(uint64_t *)&a3, a4);
  }
  int v4 = a4 - a3;
  if (a4 == a3) {
    return &stru_10048C1F8;
  }
  int v6 = &self->delegate_.buffer_[a3];
  return +[NSString stringWithCharacters:v6 length:v4];
}

- (id)description
{
  if (self->delegate_.count_) {
    return +[NSString stringWithCharacters:length:](NSString, "stringWithCharacters:length:", self->delegate_.buffer_);
  }
  else {
    return &stru_10048C1F8;
  }
}

- (id)subSequenceFrom:(int)a3 to:(int)a4
{
  return [(JavaLangAbstractStringBuilder *)self substringWithInt:*(void *)&a3 withInt:*(void *)&a4];
}

- (int)indexOfWithNSString:(id)a3
{
  return [(JavaLangAbstractStringBuilder *)self indexOfWithNSString:a3 withInt:0];
}

- (int)indexOfWithNSString:(id)a3 withInt:(int)a4
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v7 = a4 & ~(a4 >> 31);
  int v8 = [a3 length];
  int v9 = v8;
  if (v8 < 1)
  {
    if (v7 < self->delegate_.count_ || a4 < 1) {
      return v7;
    }
    else {
      return self->delegate_.count_;
    }
  }
  else
  {
    if (v7 + v8 > self->delegate_.count_) {
      return -1;
    }
    unsigned int v12 = [a3 characterAtIndex:0];
LABEL_12:
    uint64_t count = self->delegate_.count_;
    if (v7 >= (int)count) {
      return -1;
    }
    int v14 = -v7;
    v15 = &self->delegate_.buffer_[v7];
    uint64_t v16 = count - v7;
    for (int i = v7 + 1; ; ++i)
    {
      int v18 = *v15++;
      if (v18 == v12) {
        break;
      }
      --v14;
      if (!--v16) {
        return -1;
      }
    }
    if (v9 - v14 > (int)count)
    {
      return -1;
    }
    else
    {
      uint64_t v19 = 0;
      while (v9 - 1 != v19)
      {
        ++v19;
        int v20 = self->delegate_.buffer_[i++];
        if (v20 != [a3 characterAtIndex:v19])
        {
          int v7 = 1 - v14;
          if (v9 != v19) {
            goto LABEL_12;
          }
          return -v14;
        }
      }
      return -v14;
    }
  }
}

- (int)lastIndexOfWithNSString:(id)a3
{
  return [(JavaLangAbstractStringBuilder *)self lastIndexOfWithNSString:a3 withInt:self->delegate_.count_];
}

- (int)lastIndexOfWithNSString:(id)a3 withInt:(int)a4
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v7 = [a3 length];
  int v8 = -1;
  if (a4 < 0) {
    return v8;
  }
  int v9 = v7;
  int count = self->delegate_.count_;
  if (count < v7) {
    return v8;
  }
  if (v7 >= 1)
  {
    if (count - v7 >= a4) {
      int v11 = a4;
    }
    else {
      int v11 = count - v7;
    }
    unsigned int v12 = [a3 characterAtIndex:0];
LABEL_9:
    if (v11 < 0) {
      return -1;
    }
    int v13 = v11 + 1;
    int v8 = v11;
    while (self->delegate_.buffer_[v8] != v12)
    {
      --v13;
      if (v8-- <= 0) {
        return -1;
      }
    }
    uint64_t v15 = 0;
    while (v9 - 1 != v15)
    {
      ++v15;
      int v16 = self->delegate_.buffer_[v13++];
      if (v16 != [a3 characterAtIndex:v15])
      {
        int v11 = v8 - 1;
        if (v9 != v15) {
          goto LABEL_9;
        }
        return v8;
      }
    }
    return v8;
  }
  if (count >= a4) {
    return a4;
  }
  else {
    return self->delegate_.count_;
  }
}

- (void)trimToSize
{
  int count = self->delegate_.count_;
  if (count < self->delegate_.bufferSize_)
  {
    buffer = self->delegate_.buffer_;
    int v5 = (unsigned __int16 *)malloc_type_malloc(2 * count, 0x1000040BDFB0063uLL);
    self->delegate_.buffer_ = v5;
    if (!v5) {
      sub_100254F80();
    }
    self->delegate_.bufferSize_ = count;
    memcpy(v5, buffer, 2 * self->delegate_.count_);
    free(buffer);
  }
}

- (int)codePointAtWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 < 0 || (int count = self->delegate_.count_, count <= (int)v3)) {
    sub_100253E88((uint64_t)&self->delegate_, v3);
  }
  buffer = self->delegate_.buffer_;
  return JavaLangCharacter_codePointAtRaw((uint64_t)buffer, v3, count);
}

- (int)codePointBeforeWithInt:(int)a3
{
  if (a3 < 1 || self->delegate_.count_ < a3) {
    sub_100253E88((uint64_t)&self->delegate_, *(uint64_t *)&a3);
  }
  buffer = self->delegate_.buffer_;
  return JavaLangCharacter_codePointBeforeRaw((uint64_t)buffer, a3, 0);
}

- (int)codePointCountWithInt:(int)a3 withInt:(int)a4
{
  if (a3 < 0 || a4 < a3 || self->delegate_.count_ < a4) {
    sub_100253F2C((uint64_t)&self->delegate_, *(uint64_t *)&a3, a4);
  }
  buffer = self->delegate_.buffer_;
  int v6 = a4 - a3;
  return JavaLangCharacter_codePointCountRaw((uint64_t)buffer, a3, v6);
}

- (int)offsetByCodePointsWithInt:(int)a3 withInt:(int)a4
{
  return JavaLangCharacter_offsetByCodePointsRaw((uint64_t)self->delegate_.buffer_, 0, self->delegate_.count_, *(uint64_t *)&a3, a4);
}

- (void)dealloc
{
  free(self->delegate_.buffer_);
  v3.receiver = self;
  v3.super_class = (Class)JavaLangAbstractStringBuilder;
  [(JavaLangAbstractStringBuilder *)&v3 dealloc];
}

+ (J2ObjcClassInfo)__metadata
{
  return (J2ObjcClassInfo *)&unk_10055E638;
}

@end