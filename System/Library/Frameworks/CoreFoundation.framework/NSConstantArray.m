@interface NSConstantArray
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (NSConstantArray)new;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (NSConstantArray)initWithObjects:(const void *)a3 count:(unint64_t)a4;
- (id)mutableCopy;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (id)objectEnumerator;
- (unint64_t)count;
- (unint64_t)retainCount;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
@end

@implementation NSConstantArray

- (unint64_t)count
{
  return self->_count;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  v26[1] = *(void *)off_1ECE0A5B0;
  if (!a3 && a4.length)
  {
    NSUInteger length = a4.length;
    uint64_t v10 = _os_log_pack_size();
    v11 = (char *)v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315394;
    *(void *)(v12 + 4) = "-[NSConstantArray getObjects:range:]";
    *(_WORD *)(v12 + 12) = 2048;
    *(void *)(v12 + 14) = length;
    CFStringRef v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[NSConstantArray getObjects:range:]", length);
    goto LABEL_17;
  }
  if (a4.length >> 61)
  {
    NSUInteger v14 = a4.length;
    uint64_t v10 = _os_log_pack_size();
    v11 = (char *)v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315394;
    *(void *)(v15 + 4) = "-[NSConstantArray getObjects:range:]";
    *(_WORD *)(v15 + 12) = 2048;
    *(void *)(v15 + 14) = v14;
    CFStringRef v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[NSConstantArray getObjects:range:]", v14);
LABEL_17:
    v16 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v13) userInfo:0 osLogPack:v11 size:v10];
    objc_exception_throw(v16);
  }
  unint64_t count = self->_count;
  if ((a4.location & 0x8000000000000000) != 0 || count < a4.location + a4.length)
  {
    NSUInteger location = a4.location;
    NSUInteger v18 = a4.length;
    uint64_t v19 = _os_log_pack_size();
    uint64_t v20 = _os_log_pack_fill();
    if (count)
    {
      uint64_t v23 = count - 1;
      double v24 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v20, (uint64_t)"-[NSConstantArray getObjects:range:]", location, v18, v23);
      CFStringRef v22 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v24, "-[NSConstantArray getObjects:range:]", location, v18, v23);
    }
    else
    {
      double v21 = __os_log_helper_1_2_3_8_32_8_0_8_0(v20, (uint64_t)"-[NSConstantArray getObjects:range:]", location, v18);
      CFStringRef v22 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v21, "-[NSConstantArray getObjects:range:]", location, v18);
    }
    v25 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v22) userInfo:0 osLogPack:(char *)v26 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0) size:v19];
    objc_exception_throw(v25);
  }
  v5 = (void **)&self->_objects[a4.location];
  if (a4.length > 4)
  {
    memmove(a3, v5, 8 * a4.length);
  }
  else
  {
    switch(a4.length)
    {
      case 1uLL:
        goto LABEL_11;
      case 2uLL:
        goto LABEL_10;
      case 3uLL:
        goto LABEL_9;
      case 4uLL:
        v6 = *v5++;
        *a3++ = v6;
LABEL_9:
        v7 = *v5++;
        *a3++ = v7;
LABEL_10:
        v8 = *v5++;
        *a3++ = v8;
LABEL_11:
        *a3 = *v5;
        break;
      default:
        return;
    }
  }
}

- (id)mutableCopy
{
  return __NSArrayM_new(self->_objects, self->_count, 0);
}

- (id)objectAtIndex:(unint64_t)a3
{
  v12[1] = *(void *)off_1ECE0A5B0;
  unint64_t count = self->_count;
  if ((a3 & 0x8000000000000000) != 0 || count <= a3)
  {
    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = _os_log_pack_fill();
    if (count)
    {
      uint64_t v9 = count - 1;
      double v10 = __os_log_helper_1_2_3_8_32_8_0_8_0(v7, (uint64_t)"-[NSConstantArray objectAtIndex:]", a3, v9);
      CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v10, "-[NSConstantArray objectAtIndex:]", a3, v9);
    }
    else
    {
      *(_DWORD *)uint64_t v7 = 136315394;
      *(void *)(v7 + 4) = "-[NSConstantArray objectAtIndex:]";
      *(_WORD *)(v7 + 12) = 2048;
      *(void *)(v7 + 14) = a3;
      CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty array", "-[NSConstantArray objectAtIndex:]", a3);
    }
    v11 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v8) userInfo:0 osLogPack:(char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) size:v6];
    objc_exception_throw(v11);
  }
  return self->_objects[a3];
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  v12[1] = *(void *)off_1ECE0A5B0;
  unint64_t count = self->_count;
  if ((a3 & 0x8000000000000000) != 0 || count <= a3)
  {
    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = _os_log_pack_fill();
    if (count)
    {
      uint64_t v9 = count - 1;
      double v10 = __os_log_helper_1_2_3_8_32_8_0_8_0(v7, (uint64_t)"-[NSConstantArray objectAtIndexedSubscript:]", a3, v9);
      CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v10, "-[NSConstantArray objectAtIndexedSubscript:]", a3, v9);
    }
    else
    {
      *(_DWORD *)uint64_t v7 = 136315394;
      *(void *)(v7 + 4) = "-[NSConstantArray objectAtIndexedSubscript:]";
      *(_WORD *)(v7 + 12) = 2048;
      *(void *)(v7 + 14) = a3;
      CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty array", "-[NSConstantArray objectAtIndexedSubscript:]", a3);
    }
    v11 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v8) userInfo:0 osLogPack:(char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) size:v6];
    objc_exception_throw(v11);
  }
  return self->_objects[a3];
}

- (NSConstantArray)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  qword_1EC093AA8 = (uint64_t)"attempting to allocate a constant object";
  __break(1u);
  JUMPOUT(0x182CC570CLL);
}

- (id)objectEnumerator
{
  v2 = [[__NSConstantArrayEnumerator alloc] initWithConstantArray:self];

  return v2;
}

+ (NSConstantArray)new
{
  return (NSConstantArray *)objc_opt_new();
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return __NSArrayM_new(self->_objects, self->_count, 0);
}

- (BOOL)_tryRetain
{
  return 1;
}

- (BOOL)_isDeallocating
{
  return 0;
}

- (unint64_t)retainCount
{
  return -1;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

@end