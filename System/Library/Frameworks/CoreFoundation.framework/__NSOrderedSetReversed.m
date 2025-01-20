@interface __NSOrderedSetReversed
- (__NSOrderedSetReversed)initWithOrderedSet:(id)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)indexOfObject:(id)a3;
- (void)dealloc;
@end

@implementation __NSOrderedSetReversed

- (__NSOrderedSetReversed)initWithOrderedSet:(id)a3
{
  v4 = (void *)[a3 copy];
  self->_orderedSet = v4;
  self->_cnt = [v4 count];
  return self;
}

- (void)dealloc
{
  uint64_t v4 = *(void *)off_1ECE0A5B0;

  v3.receiver = self;
  v3.super_class = (Class)__NSOrderedSetReversed;
  [(__NSOrderedSetReversed *)&v3 dealloc];
}

- (unint64_t)count
{
  return self->_cnt;
}

- (unint64_t)indexOfObject:(id)a3
{
  uint64_t v4 = [self->_orderedSet indexOfObject:a3];
  unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
    return self->_cnt + ~v4;
  }
  return v5;
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
      double v12 = __os_log_helper_1_2_3_8_32_8_0_8_0(v9, (uint64_t)"-[__NSOrderedSetReversed objectAtIndex:]", a3, v11);
      CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v12, "-[__NSOrderedSetReversed objectAtIndex:]", a3, v11);
    }
    else
    {
      *(_DWORD *)uint64_t v9 = 136315394;
      *(void *)(v9 + 4) = "-[__NSOrderedSetReversed objectAtIndex:]";
      *(_WORD *)(v9 + 12) = 2048;
      *(void *)(v9 + 14) = a3;
      CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty ordered set", "-[__NSOrderedSetReversed objectAtIndex:]", a3);
    }
    v13 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v10) userInfo:0 osLogPack:(char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0) size:v8];
    objc_exception_throw(v13);
  }
  id orderedSet = self->_orderedSet;
  unint64_t v5 = cnt + ~a3;

  return (id)[orderedSet objectAtIndex:v5];
}

@end