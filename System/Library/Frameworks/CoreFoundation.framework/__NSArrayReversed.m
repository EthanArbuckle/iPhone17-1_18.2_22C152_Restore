@interface __NSArrayReversed
- (__NSArrayReversed)initWithArray:(id)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (void)dealloc;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
@end

@implementation __NSArrayReversed

- (unint64_t)count
{
  return self->_cnt;
}

- (id)objectAtIndex:(unint64_t)a3
{
  v14[1] = *(void *)off_1ECE0A5B0;
  unint64_t cnt = self->_cnt;
  if ((a3 & 0x8000000000000000) != 0 || cnt <= a3)
  {
    uint64_t v8 = _os_log_pack_size();
    uint64_t v9 = _os_log_pack_fill();
    if (cnt)
    {
      uint64_t v11 = cnt - 1;
      double v12 = __os_log_helper_1_2_3_8_32_8_0_8_0(v9, (uint64_t)"-[__NSArrayReversed objectAtIndex:]", a3, v11);
      CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v12, "-[__NSArrayReversed objectAtIndex:]", a3, v11);
    }
    else
    {
      *(_DWORD *)uint64_t v9 = 136315394;
      *(void *)(v9 + 4) = "-[__NSArrayReversed objectAtIndex:]";
      *(_WORD *)(v9 + 12) = 2048;
      *(void *)(v9 + 14) = a3;
      CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty array", "-[__NSArrayReversed objectAtIndex:]", a3);
    }
    v13 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v10) userInfo:0 osLogPack:(char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0) size:v8];
    objc_exception_throw(v13);
  }
  id array = self->_array;
  unint64_t v5 = cnt + ~a3;

  return (id)[array objectAtIndex:v5];
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v6 = a3;
  v25[1] = *(void *)off_1ECE0A5B0;
  if (!a3 && a4.length)
  {
    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315394;
    *(void *)(v12 + 4) = "-[__NSArrayReversed getObjects:range:]";
    *(_WORD *)(v12 + 12) = 2048;
    *(void *)(v12 + 14) = length;
    CFStringRef v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[__NSArrayReversed getObjects:range:]", length);
    goto LABEL_12;
  }
  if (a4.length >> 61)
  {
    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315394;
    *(void *)(v14 + 4) = "-[__NSArrayReversed getObjects:range:]";
    *(_WORD *)(v14 + 12) = 2048;
    *(void *)(v14 + 14) = length;
    CFStringRef v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[__NSArrayReversed getObjects:range:]", length);
LABEL_12:
    v15 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v13) userInfo:0 osLogPack:v11 size:v10];
    objc_exception_throw(v15);
  }
  unint64_t v8 = [(__NSArrayReversed *)self count];
  if ((location & 0x8000000000000000) != 0 || v8 < location + length)
  {
    if (v8)
    {
      unint64_t v21 = v8;
      uint64_t v16 = _os_log_pack_size();
      v17 = (char *)v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v22 = _os_log_pack_fill();
      double v23 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v22, (uint64_t)"-[__NSArrayReversed getObjects:range:]", location, length, --v21);
      CFStringRef v20 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v23, "-[__NSArrayReversed getObjects:range:]", location, length, v21);
    }
    else
    {
      uint64_t v16 = _os_log_pack_size();
      v17 = (char *)v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v18 = _os_log_pack_fill();
      double v19 = __os_log_helper_1_2_3_8_32_8_0_8_0(v18, (uint64_t)"-[__NSArrayReversed getObjects:range:]", location, length);
      CFStringRef v20 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v19, "-[__NSArrayReversed getObjects:range:]", location, length);
    }
    v24 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v20) userInfo:0 osLogPack:v17 size:v16];
    objc_exception_throw(v24);
  }
  if (length)
  {
    NSUInteger v9 = ~location;
    do
    {
      *v6++ = (id)[self->_array objectAtIndex:v9 + self->_cnt];
      --v9;
      --length;
    }
    while (length);
  }
}

- (__NSArrayReversed)initWithArray:(id)a3
{
  v4 = (void *)[a3 copy];
  self->_id array = v4;
  self->_unint64_t cnt = [v4 count];
  return self;
}

- (void)dealloc
{
  uint64_t v4 = *(void *)off_1ECE0A5B0;

  v3.receiver = self;
  v3.super_class = (Class)__NSArrayReversed;
  [(__NSArrayReversed *)&v3 dealloc];
}

@end