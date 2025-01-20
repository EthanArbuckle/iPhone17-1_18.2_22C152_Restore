@interface _NSClStr
- (_NSClStr)initWithCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4;
- (_NSClStr)initWithString:(id)a3;
- (_NSClStr)initWithUTF8String:(const char *)a3;
- (const)_fastCharacterContents;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)dealloc;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
@end

@implementation _NSClStr

- (_NSClStr)initWithCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NULL argument" userInfo:0]);
  }
  v9.receiver = self;
  v9.super_class = (Class)_NSClStr;
  v6 = [(NSString *)&v9 init];
  v6->length = a4;
  v7 = (unsigned __int16 *)malloc_type_malloc(2 * a4, 0x1000040BDFB0063uLL);
  v6->characters = v7;
  memcpy(v7, a3, 2 * v6->length);
  return v6;
}

- (_NSClStr)initWithString:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"nil argument" userInfo:0]);
  }
  v8.receiver = self;
  v8.super_class = (Class)_NSClStr;
  v4 = [(NSString *)&v8 init];
  uint64_t v5 = [a3 length];
  v4->length = v5;
  v6 = (unsigned __int16 *)malloc_type_malloc(2 * v5, 0x1000040BDFB0063uLL);
  v4->characters = v6;
  objc_msgSend(a3, "getCharacters:range:", v6, 0, v4->length);
  return v4;
}

- (_NSClStr)initWithUTF8String:(const char *)a3
{
  if (!a3)
  {

    v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    v15 = @"NULL argument";
    goto LABEL_9;
  }
  size_t v5 = strlen(a3);
  rsize_t v6 = 2 * v5;
  v7 = (UniChar *)malloc_type_malloc(2 * v5, 0x1000040BDFB0063uLL);
  if (!v7)
  {

LABEL_8:
    v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    v15 = @"Invalid argument";
LABEL_9:
    objc_exception_throw((id)[v13 exceptionWithName:v14 reason:v15 userInfo:0]);
  }
  objc_super v8 = v7;
  MutableWithExternalCharactersNoCopy = CFStringCreateMutableWithExternalCharactersNoCopy(0, v7, 0, v5, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  if (!MutableWithExternalCharactersNoCopy)
  {

    free(v8);
    goto LABEL_8;
  }
  CFStringRef v10 = MutableWithExternalCharactersNoCopy;
  CFStringAppendCString(MutableWithExternalCharactersNoCopy, a3, 0x8000100u);
  v11 = [(_NSClStr *)self initWithCharacters:v8 length:CFStringGetLength(v10)];
  CFRelease(v10);
  memset_s(v8, v6, 0, v6);
  free(v8);
  return v11;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  memset_s(self->characters, 2 * self->length, 0, 2 * self->length);
  free(self->characters);
  v3.receiver = self;
  v3.super_class = (Class)_NSClStr;
  [(_NSClStr *)&v3 dealloc];
}

- (unint64_t)length
{
  return self->length;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  if (self->length <= a3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8] reason:@"Index out of bounds" userInfo:0]);
  }
  return self->characters[a3];
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length = self->length;
  BOOL v5 = length >= a4.length;
  NSUInteger v6 = length - a4.length;
  if (!v5 || a4.location > v6) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8] reason:@"Range out of bounds" userInfo:0]);
  }
  objc_super v8 = &self->characters[a4.location];

  memcpy(a3, v8, 2 * a4.length);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = self;
  return self;
}

- (const)_fastCharacterContents
{
  return self->characters;
}

@end