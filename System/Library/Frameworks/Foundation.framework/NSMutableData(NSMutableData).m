@interface NSMutableData(NSMutableData)
+ (id)allocWithZone:()NSMutableData;
+ (id)dataWithCapacity:()NSMutableData;
+ (id)dataWithLength:()NSMutableData;
+ (uint64_t)_newZeroingDataWithBytes:()NSMutableData length:;
- (uint64_t)_isCompact;
- (uint64_t)classForCoder;
- (uint64_t)increaseLengthBy:()NSMutableData;
- (uint64_t)setData:()NSMutableData;
- (void)appendBytes:()NSMutableData length:;
- (void)appendData:()NSMutableData;
- (void)initWithCapacity:()NSMutableData;
- (void)initWithLength:()NSMutableData;
- (void)mutableBytes;
- (void)replaceBytesInRange:()NSMutableData withBytes:;
- (void)replaceBytesInRange:()NSMutableData withBytes:length:;
- (void)resetBytesInRange:()NSMutableData;
- (void)setLength:()NSMutableData;
@end

@implementation NSMutableData(NSMutableData)

- (uint64_t)classForCoder
{
  return self;
}

- (uint64_t)_isCompact
{
  return 1;
}

+ (id)dataWithCapacity:()NSMutableData
{
  v3 = (void *)[objc_allocWithZone(a1) initWithCapacity:a3];

  return v3;
}

+ (id)dataWithLength:()NSMutableData
{
  v3 = (void *)[objc_allocWithZone(a1) initWithLength:a3];

  return v3;
}

+ (id)allocWithZone:()NSMutableData
{
  if ((objc_class *)self == a1)
  {
    return +[NSData _alloc];
  }
  else
  {
    return NSAllocateObject(a1, 0, a3);
  }
}

- (void)replaceBytesInRange:()NSMutableData withBytes:length:
{
  if (*MEMORY[0x1E4F1CC18]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x1E4F1CC18])(a1, v6, *MEMORY[0x1E4F1CBD0]);
  }
  unint64_t v13 = [a1 length];
  if (__CFADD__(a4, a3))
  {
    v25 = _NSMethodExceptionProem((objc_class *)a1, a2);
    v37.location = a3;
    v37.length = a4;
    v26 = +[NSString stringWithFormat:@"%@: range %@ causes integer overflow", v25, NSStringFromRange(v37), v33];
    goto LABEL_37;
  }
  unint64_t v14 = v13;
  size_t v15 = v13 - (a3 + a4);
  if (v13 < a3 + a4)
  {
    v27 = _NSMethodExceptionProem((objc_class *)a1, a2);
    v28 = v27;
    if (a4)
    {
      v39.location = a3;
      v39.length = a4;
      v32 = NSStringFromRange(v39);
      unint64_t v34 = v14;
      v31 = v28;
      v29 = @"%@: range %@ exceeds data length %lu";
    }
    else
    {
      v32 = (NSString *)a3;
      unint64_t v34 = v14;
      v31 = v27;
      v29 = @"%@: location %lu exceeds data length %lu";
    }
    v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v29, v31, v32, v34);
LABEL_37:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8] reason:v26 userInfo:0]);
  }
  if (__CFADD__(a6, v13 - a4))
  {
    v30 = _NSMethodExceptionProem((objc_class *)a1, a2);
    v38.location = v14 - a4;
    v38.length = a6;
    v26 = +[NSString stringWithFormat:@"%@: range %@ causes integer overflow", v30, NSStringFromRange(v38), v33];
    goto LABEL_37;
  }
  unint64_t v16 = v13 - a4 + a6;
  unint64_t v17 = [a1 mutableBytes];
  uint64_t v18 = v17;
  v19 = (char *)a5;
  if (a5)
  {
    v19 = (char *)a5;
    if (v17)
    {
      v19 = (char *)a5;
      if (v17 + v14 > a5)
      {
        v19 = (char *)a5;
        if (v17 < a5 + a6)
        {
          unint64_t v20 = (unint64_t)malloc_type_malloc(a6, 0xF5BEFFFAuLL);
          v19 = (char *)v20;
          v21 = (char *)a5;
          size_t v22 = a6;
          if (a6 >= 0x80000)
          {
            size_t v22 = a6;
            v21 = (char *)a5;
            if (((*MEMORY[0x1E4F14B00] - 1) & (v20 | a5)) != 0
              || (malloc_default_zone(),
                  int v23 = malloc_zone_claimed_address(),
                  unint64_t v20 = (unint64_t)v19,
                  size_t v22 = a6,
                  v21 = (char *)a5,
                  v23))
            {
LABEL_15:
              memmove((void *)v20, v21, v22);
              goto LABEL_16;
            }
            NSUInteger v35 = -*MEMORY[0x1E4F14B00] & a6;
            NSCopyMemoryPages((const void *)a5, v19, v35);
            v21 = (char *)(a5 + v35);
            unint64_t v20 = (unint64_t)&v19[v35];
            size_t v22 = a6 - v35;
          }
          if (!v22) {
            goto LABEL_16;
          }
          goto LABEL_15;
        }
      }
    }
  }
LABEL_16:
  if (v16 > v14)
  {
    [a1 setLength:v16];
    uint64_t v18 = [a1 mutableBytes];
  }
  if (v16 != v14) {
    memmove((void *)(v18 + a3 + a6), (const void *)(v18 + a3 + a4), v15);
  }
  if (a6)
  {
    v24 = (void *)(v18 + a3);
    if (v19) {
      memmove(v24, v19, a6);
    }
    else {
      bzero(v24, a6);
    }
  }
  if (v19 != (char *)a5) {
    free(v19);
  }
  if (v16 < v14)
  {
    [a1 setLength:v16];
  }
}

- (uint64_t)setData:()NSMutableData
{
  v7[5] = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1CC18]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x1E4F1CC18])(a1, v3, *MEMORY[0x1E4F1CBD0]);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__NSMutableData_NSMutableData__setData___block_invoke;
  v7[3] = &unk_1E51F7018;
  v7[4] = a1;
  [a3 enumerateByteRangesUsingBlock:v7];
  return objc_msgSend(a1, "setLength:", objc_msgSend(a3, "length"));
}

- (void)mutableBytes
{
  if (*MEMORY[0x1E4F1CC18]) {
    ((void (*)(uint64_t, uint64_t, void))*MEMORY[0x1E4F1CC18])(a1, v2, *MEMORY[0x1E4F1CBD0]);
  }
  v5 = NSClassFromString((NSString *)@"NSMutableData");
  NSRequestConcreteImplementation(a1, a2, v5);
}

- (void)setLength:()NSMutableData
{
  if (*MEMORY[0x1E4F1CC18]) {
    ((void (*)(uint64_t, uint64_t, void))*MEMORY[0x1E4F1CC18])(a1, v2, *MEMORY[0x1E4F1CBD0]);
  }
  v5 = NSClassFromString((NSString *)@"NSMutableData");

  NSRequestConcreteImplementation(a1, a2, v5);
}

- (void)appendBytes:()NSMutableData length:
{
  NSUInteger v5 = a4;
  if (*MEMORY[0x1E4F1CC18])
  {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x1E4F1CC18])(a1, v4, *MEMORY[0x1E4F1CBD0]);
    if (!v5) {
      return;
    }
  }
  else if (!a4)
  {
    return;
  }
  NSUInteger v9 = [a1 length];
  if (__CFADD__(v5, v9))
  {
    size_t v22 = _NSMethodExceptionProem((objc_class *)a1, a2);
    v25.location = v9;
    v25.length = v5;
    int v23 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: range %@ causes integer overflow", v22, NSStringFromRange(v25)), 0 reason userInfo];
    objc_exception_throw(v23);
  }
  unint64_t v10 = [a1 mutableBytes];
  unint64_t v11 = a3;
  if (v10)
  {
    unint64_t v11 = a3;
    if (v10 + v9 > a3)
    {
      unint64_t v11 = a3;
      if (v10 < a3 + v5)
      {
        unint64_t v12 = (unint64_t)malloc_type_malloc(v5, 0xF4F166B7uLL);
        unint64_t v11 = v12;
        size_t v13 = v5;
        unint64_t v14 = (char *)a3;
        if (v5 < 0x80000) {
          goto LABEL_12;
        }
        size_t v15 = (void *)MEMORY[0x1E4F14B00];
        size_t v13 = v5;
        unint64_t v14 = (char *)a3;
        if (((*MEMORY[0x1E4F14B00] - 1) & (v12 | a3)) != 0) {
          goto LABEL_12;
        }
        malloc_default_zone();
        int v16 = malloc_zone_claimed_address();
        unint64_t v12 = v11;
        size_t v13 = v5;
        unint64_t v14 = (char *)a3;
        if (v16) {
          goto LABEL_12;
        }
        NSUInteger v17 = -*v15 & v5;
        NSCopyMemoryPages((const void *)a3, (void *)v11, v17);
        size_t v13 = v5 - v17;
        if (v5 != v17)
        {
          unint64_t v14 = (char *)(a3 + v17);
          unint64_t v12 = v11 + v17;
LABEL_12:
          memmove((void *)v12, v14, v13);
        }
      }
    }
  }
  [a1 setLength:v9 + v5];
  NSUInteger v18 = [a1 mutableBytes] + v9;
  if (v5 < 0x80000
    || (v19 = (void *)MEMORY[0x1E4F14B00], ((*MEMORY[0x1E4F14B00] - 1) & (v18 | v11)) != 0)
    || (malloc_default_zone(), malloc_zone_claimed_address()))
  {
    unint64_t v20 = (char *)v11;
LABEL_17:
    memmove((void *)v18, v20, v5);
    goto LABEL_18;
  }
  NSUInteger v21 = -*v19 & v5;
  NSCopyMemoryPages((const void *)v11, (void *)v18, v21);
  v5 -= v21;
  if (v5)
  {
    unint64_t v20 = (char *)(v11 + v21);
    v18 += v21;
    goto LABEL_17;
  }
LABEL_18:
  if (v11 != a3)
  {
    free((void *)v11);
  }
}

- (void)appendData:()NSMutableData
{
  if (*MEMORY[0x1E4F1CC18]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x1E4F1CC18])(a1, v3, *MEMORY[0x1E4F1CBD0]);
  }
  uint64_t v7 = [a3 length];
  if (v7)
  {
    size_t v8 = v7;
    unint64_t v9 = [a3 bytes];
    NSUInteger v10 = [a1 length];
    uint64_t v11 = [a3 length];
    if (__CFADD__(v11, v10))
    {
      NSUInteger v24 = v11;
      NSRange v25 = _NSMethodExceptionProem((objc_class *)a1, a2);
      v28.location = v10;
      v28.length = v24;
      v26 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: range %@ causes integer overflow", v25, NSStringFromRange(v28)), 0 reason userInfo];
      objc_exception_throw(v26);
    }
    unint64_t v12 = [a1 mutableBytes];
    if (v12 && v9 < v12 + v10 && v12 < v9 + v8)
    {
      unint64_t v13 = (unint64_t)malloc_type_malloc(v8, 0x3070430uLL);
      unint64_t v14 = v13;
      if (v8 < 0x80000
        || (size_t v15 = (void *)MEMORY[0x1E4F14B00], ((*MEMORY[0x1E4F14B00] - 1) & (v13 | v9)) != 0)
        || (malloc_default_zone(), malloc_zone_claimed_address()))
      {
        int v16 = (char *)v14;
        size_t v17 = v8;
        NSUInteger v18 = (const void *)v9;
      }
      else
      {
        NSUInteger v23 = v8 & -*v15;
        NSCopyMemoryPages((const void *)v9, (void *)v14, v23);
        size_t v17 = v8 - v23;
        if (v8 == v23) {
          goto LABEL_14;
        }
        NSUInteger v18 = (const void *)(v9 + v23);
        int v16 = (char *)(v14 + v23);
      }
      memmove(v16, v18, v17);
    }
    else
    {
      unint64_t v14 = v9;
    }
LABEL_14:
    [a1 setLength:v10 + v8];
    NSUInteger v19 = [a1 mutableBytes] + v10;
    if (v8 < 0x80000
      || (unint64_t v20 = (void *)MEMORY[0x1E4F14B00], ((*MEMORY[0x1E4F14B00] - 1) & (v19 | v14)) != 0)
      || (malloc_default_zone(), malloc_zone_claimed_address()))
    {
      NSUInteger v21 = (char *)v14;
    }
    else
    {
      NSUInteger v22 = v8 & -*v20;
      NSCopyMemoryPages((const void *)v14, (void *)v19, v22);
      v8 -= v22;
      if (!v8)
      {
LABEL_19:
        if (v14 != v9)
        {
          free((void *)v14);
        }
        return;
      }
      NSUInteger v21 = (char *)(v14 + v22);
      v19 += v22;
    }
    memmove((void *)v19, v21, v8);
    goto LABEL_19;
  }
}

- (uint64_t)increaseLengthBy:()NSMutableData
{
  if (*MEMORY[0x1E4F1CC18]) {
    ((void (*)(objc_class *, uint64_t, void))*MEMORY[0x1E4F1CC18])(a1, v3, *MEMORY[0x1E4F1CBD0]);
  }
  if (a3 >= 0x8000000000000001)
  {
    unint64_t v9 = +[NSString stringWithFormat:@"%@: absurd %s: %lu, maximum size: %llu bytes", _NSMethodExceptionProem(a1, a2), "extra length", a3, 0x8000000000000000];
    NSUInteger v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = (void *)MEMORY[0x1E4F1C3C8];
    goto LABEL_10;
  }
  uint64_t v7 = [(objc_class *)a1 length];
  if (__CFADD__(a3, v7))
  {
    NSUInteger v12 = v7;
    unint64_t v13 = _NSMethodExceptionProem(a1, a2);
    v15.location = v12;
    v15.length = a3;
    unint64_t v9 = +[NSString stringWithFormat:@"%@: range %@ causes integer overflow", v13, NSStringFromRange(v15)];
    NSUInteger v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = (void *)MEMORY[0x1E4F1C4A8];
LABEL_10:
    objc_exception_throw((id)[v10 exceptionWithName:*v11 reason:v9 userInfo:0]);
  }

  return [(objc_class *)a1 setLength:v7 + a3];
}

- (void)replaceBytesInRange:()NSMutableData withBytes:
{
  NSUInteger v7 = a4;
  if (*MEMORY[0x1E4F1CC18])
  {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x1E4F1CC18])(a1, v5, *MEMORY[0x1E4F1CBD0]);
    if (!v7) {
      return;
    }
  }
  else if (!a4)
  {
    return;
  }
  unint64_t v11 = [a1 length];
  unint64_t v12 = v11;
  if (a3 > v11)
  {
    NSRange v25 = +[NSString stringWithFormat:@"%@: location %lu exceeds data length %lu", _NSMethodExceptionProem((objc_class *)a1, a2), a3, v11];
    goto LABEL_31;
  }
  if (__CFADD__(v7, a3))
  {
    v26 = _NSMethodExceptionProem((objc_class *)a1, a2);
    v29.location = a3;
    v29.length = v7;
    NSRange v25 = +[NSString stringWithFormat:@"%@: range %@ causes integer overflow", v26, NSStringFromRange(v29), v27];
LABEL_31:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8] reason:v25 userInfo:0]);
  }
  unint64_t v13 = (char *)a5;
  if (v11 < a3 + v7)
  {
    unint64_t v14 = [a1 mutableBytes];
    unint64_t v13 = (char *)a5;
    if (!v14) {
      goto LABEL_15;
    }
    unint64_t v13 = (char *)a5;
    if (v14 + v12 <= a5) {
      goto LABEL_15;
    }
    unint64_t v13 = (char *)a5;
    if (v14 >= a5 + v7) {
      goto LABEL_15;
    }
    unint64_t v15 = (unint64_t)malloc_type_malloc(v7, 0x65877BBFuLL);
    unint64_t v13 = (char *)v15;
    size_t v16 = v7;
    size_t v17 = (char *)a5;
    if (v7 >= 0x80000)
    {
      NSUInteger v18 = (void *)MEMORY[0x1E4F14B00];
      size_t v16 = v7;
      size_t v17 = (char *)a5;
      if (((*MEMORY[0x1E4F14B00] - 1) & (v15 | a5)) == 0)
      {
        malloc_default_zone();
        int v19 = malloc_zone_claimed_address();
        unint64_t v15 = (unint64_t)v13;
        size_t v16 = v7;
        size_t v17 = (char *)a5;
        if (!v19)
        {
          NSUInteger v20 = v7 & -*v18;
          NSCopyMemoryPages((const void *)a5, v13, v20);
          size_t v16 = v7 - v20;
          if (v7 == v20)
          {
LABEL_15:
            [a1 setLength:a3 + v7];
            goto LABEL_16;
          }
          size_t v17 = (char *)(a5 + v20);
          unint64_t v15 = (unint64_t)&v13[v20];
        }
      }
    }
    memmove((void *)v15, v17, v16);
    goto LABEL_15;
  }
LABEL_16:
  NSUInteger v21 = [a1 mutableBytes] + a3;
  if (v7 < 0x80000
    || (NSUInteger v22 = (void *)MEMORY[0x1E4F14B00], ((*MEMORY[0x1E4F14B00] - 1) & (v21 | a5)) != 0)
    || (malloc_default_zone(), malloc_zone_claimed_address()))
  {
    NSUInteger v23 = (char *)a5;
LABEL_20:
    memmove((void *)v21, v23, v7);
    goto LABEL_21;
  }
  NSUInteger v24 = v7 & -*v22;
  NSCopyMemoryPages((const void *)a5, (void *)v21, v24);
  v7 -= v24;
  if (v7)
  {
    NSUInteger v23 = (char *)(a5 + v24);
    v21 += v24;
    goto LABEL_20;
  }
LABEL_21:
  if (v13 != (char *)a5)
  {
    free(v13);
  }
}

- (void)resetBytesInRange:()NSMutableData
{
  if (*MEMORY[0x1E4F1CC18])
  {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x1E4F1CC18])(a1, v4, *MEMORY[0x1E4F1CBD0]);
    if (!a4) {
      return;
    }
  }
  else if (!a4)
  {
    return;
  }
  unint64_t v9 = [a1 length];
  if (a3 > v9)
  {
    unint64_t v11 = +[NSString stringWithFormat:@"%@: location %lu exceeds data length %lu", _NSMethodExceptionProem((objc_class *)a1, a2), a3, v9];
    goto LABEL_14;
  }
  if (__CFADD__(a4, a3))
  {
    unint64_t v12 = _NSMethodExceptionProem((objc_class *)a1, a2);
    v15.location = a3;
    v15.length = a4;
    unint64_t v11 = +[NSString stringWithFormat:@"%@: range %@ causes integer overflow", v12, NSStringFromRange(v15), v13];
LABEL_14:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8] reason:v11 userInfo:0]);
  }
  if (v9 < a3 + a4) {
    objc_msgSend(a1, "setLength:");
  }
  NSUInteger v10 = (void *)([a1 mutableBytes] + a3);

  bzero(v10, a4);
}

- (void)initWithCapacity:()NSMutableData
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSMutableData");
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)initWithLength:()NSMutableData
{
  uint64_t v4 = objc_msgSend(a1, "initWithCapacity:");
  [v4 setLength:a3];
  return v4;
}

+ (uint64_t)_newZeroingDataWithBytes:()NSMutableData length:
{
  uint64_t v6 = [_NSClrDatM alloc];

  return (uint64_t)[(NSConcreteMutableData *)v6 initWithBytes:a3 length:a4 copy:1 deallocator:0];
}

@end