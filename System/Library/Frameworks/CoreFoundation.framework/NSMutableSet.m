@interface NSMutableSet
+ (NSMutableSet)setWithCapacity:(NSUInteger)numItems;
- (NSMutableSet)initWithCapacity:(NSUInteger)numItems;
- (NSMutableSet)initWithObjects:(const void *)a3 count:(unint64_t)a4;
- (id)setByAddingObjectsFromArray:(id)a3;
- (id)setByAddingObjectsFromSet:(id)a3;
- (void)addObject:(id)object;
- (void)addObjects:(const void *)a3 count:(unint64_t)a4;
- (void)addObjectsFromArray:(NSArray *)array;
- (void)addObjectsFromArray:(id)a3 range:(_NSRange)a4;
- (void)addObjectsFromOrderedSet:(id)a3;
- (void)addObjectsFromOrderedSet:(id)a3 range:(_NSRange)a4;
- (void)addObjectsFromSet:(id)a3;
- (void)intersectOrderedSet:(id)a3;
- (void)intersectSet:(NSSet *)otherSet;
- (void)minusOrderedSet:(id)a3;
- (void)minusSet:(NSSet *)otherSet;
- (void)removeAllObjects;
- (void)removeObject:(id)object;
- (void)removeObjectsInArray:(id)a3;
- (void)removeObjectsInArray:(id)a3 range:(_NSRange)a4;
- (void)removeObjectsInOrderedSet:(id)a3;
- (void)removeObjectsInOrderedSet:(id)a3 range:(_NSRange)a4;
- (void)removeObjectsInSet:(id)a3;
- (void)removeObjectsPassingTest:(id)a3;
- (void)removeObjectsWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (void)replaceObject:(id)a3;
- (void)setArray:(id)a3;
- (void)setObject:(id)a3;
- (void)setOrderedSet:(id)a3;
- (void)setSet:(NSSet *)otherSet;
- (void)unionOrderedSet:(id)a3;
- (void)unionSet:(NSSet *)otherSet;
@end

@implementation NSMutableSet

+ (NSMutableSet)setWithCapacity:(NSUInteger)numItems
{
  v3 = (void *)[objc_alloc((Class)a1) initWithCapacity:numItems];

  return (NSMutableSet *)v3;
}

- (void)intersectSet:(NSSet *)otherSet
{
  uint64_t v60 = *(void *)off_1ECE0A5B0;
  [(NSMutableSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
    if (!otherSet) {
      goto LABEL_17;
    }
  }
  else if (!otherSet)
  {
    goto LABEL_17;
  }
  if ((_NSIsNSSet((uint64_t)otherSet) & 1) != 0
    || _CFExecutableLinkedOnOrAfter(7uLL)
    || _CFExecutableLinkedOnOrAfter(0x3F2uLL))
  {
    goto LABEL_16;
  }
  if ((unint64_t)++__checkForAndForgiveClientSin_cnt <= 0x64)
  {
    __int16 v7 = __CFExceptionProem((objc_class *)self, a2);
    CFLog(3, @"%@: This app appears to be calling this method with a non-set parameter.  Please wait while the system corrects this....  %s", v8, v9, v10, v11, v12, v13, v7);
  }
  v14 = objc_opt_new();
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  unint64_t v15 = [(NSSet *)otherSet countByEnumeratingWithState:&v56 objects:v55 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v57 != v16) {
          objc_enumerationMutation(otherSet);
        }
        [v14 addObject:*(void *)(*((void *)&v56 + 1) + 8 * i)];
      }
      unint64_t v15 = [(NSSet *)otherSet countByEnumeratingWithState:&v56 objects:v55 count:16];
    }
    while (v15);
  }
  otherSet = v14;
  if (otherSet)
  {
LABEL_16:
    if ((_NSIsNSSet((uint64_t)otherSet) & 1) == 0)
    {
      uint64_t v35 = _os_log_pack_size();
      v37 = (char *)&v43 - ((MEMORY[0x1F4188790](v35, v36) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v38 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v38 = 136315138;
      *(void *)(v38 + 4) = "-[NSMutableSet intersectSet:]";
      CFStringRef v39 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: set argument is not an NSSet", "-[NSMutableSet intersectSet:]");
      v40 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v39) userInfo:0 osLogPack:v37 size:v35];
      objc_exception_throw(v40);
    }
  }
LABEL_17:
  if (otherSet != (NSSet *)self)
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    unint64_t v18 = 0;
    unint64_t v20 = [(NSSet *)self countByEnumeratingWithState:&v51 objects:v50 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v52;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v52 != v21) {
            objc_enumerationMutation(self);
          }
          v18 += [(NSSet *)self countForObject:*(void *)(*((void *)&v51 + 1) + 8 * j)];
        }
        unint64_t v20 = [(NSSet *)self countByEnumeratingWithState:&v51 objects:v50 count:16];
      }
      while (v20);
      if (v18 >> 60)
      {
        CFStringRef v41 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v18);
        v42 = +[NSException exceptionWithName:@"NSGenericException" reason:v41 userInfo:0];
        CFRelease(v41);
        objc_exception_throw(v42);
      }
    }
    if (v18 <= 1) {
      uint64_t v23 = 1;
    }
    else {
      uint64_t v23 = v18;
    }
    unint64_t v24 = MEMORY[0x1F4188790](v23, v19);
    v26 = (uint64_t *)((char *)&v43 - v25);
    v55[0] = 0;
    if (v18 >= 0x101)
    {
      v26 = (uint64_t *)_CFCreateArrayStorage(v24, 0, v55);
      v44 = v26;
    }
    else
    {
      v44 = 0;
    }
    uint64_t v43 = (uint64_t)&v43;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    unint64_t v27 = [(NSSet *)self countByEnumeratingWithState:&v46 objects:v45 count:16];
    v28 = v26;
    if (v27)
    {
      uint64_t v29 = *(void *)v47;
      v28 = v26;
      do
      {
        for (uint64_t k = 0; k != v27; ++k)
        {
          if (*(void *)v47 != v29) {
            objc_enumerationMutation(self);
          }
          uint64_t v31 = *(void *)(*((void *)&v46 + 1) + 8 * k);
          unint64_t v32 = [(NSSet *)otherSet countForObject:v31];
          unint64_t v33 = [(NSSet *)self countForObject:v31];
          unint64_t v34 = v33 - v32;
          if (v33 > v32)
          {
            do
            {
              *v28++ = v31;
              --v34;
            }
            while (v34);
          }
        }
        unint64_t v27 = [(NSSet *)self countByEnumeratingWithState:&v46 objects:v45 count:16];
      }
      while (v27);
    }
    while (v26 < v28)
      [(NSMutableSet *)self removeObject:*v26++];
    free(v44);
  }
}

- (void)minusSet:(NSSet *)otherSet
{
  uint64_t v42 = *(void *)off_1ECE0A5B0;
  [(NSMutableSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
    if (!otherSet) {
      goto LABEL_17;
    }
  }
  else if (!otherSet)
  {
    goto LABEL_17;
  }
  if ((_NSIsNSSet((uint64_t)otherSet) & 1) != 0
    || _CFExecutableLinkedOnOrAfter(7uLL)
    || _CFExecutableLinkedOnOrAfter(0x3F2uLL))
  {
    goto LABEL_16;
  }
  if ((unint64_t)++__checkForAndForgiveClientSin_cnt <= 0x64)
  {
    __int16 v7 = __CFExceptionProem((objc_class *)self, a2);
    CFLog(3, @"%@: This app appears to be calling this method with a non-set parameter.  Please wait while the system corrects this....  %s", v8, v9, v10, v11, v12, v13, v7);
  }
  v14 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  unint64_t v15 = [(NSSet *)otherSet countByEnumeratingWithState:&v38 objects:v37 count:16];
  if (v15)
  {
    unint64_t v16 = v15;
    uint64_t v17 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v39 != v17) {
          objc_enumerationMutation(otherSet);
        }
        [v14 addObject:*(void *)(*((void *)&v38 + 1) + 8 * i)];
      }
      unint64_t v16 = [(NSSet *)otherSet countByEnumeratingWithState:&v38 objects:v37 count:16];
    }
    while (v16);
  }
  otherSet = v14;
  if (otherSet)
  {
LABEL_16:
    if ((_NSIsNSSet((uint64_t)otherSet) & 1) == 0)
    {
      uint64_t v26 = _os_log_pack_size();
      v28 = &v32[-((MEMORY[0x1F4188790](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0)];
      uint64_t v29 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v29 = 136315138;
      *(void *)(v29 + 4) = "-[NSMutableSet minusSet:]";
      CFStringRef v30 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: set argument is not an NSSet", "-[NSMutableSet minusSet:]");
      uint64_t v31 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v30) userInfo:0 osLogPack:v28 size:v26];
      objc_exception_throw(v31);
    }
  }
LABEL_17:
  if (otherSet == (NSSet *)self)
  {
    [(NSMutableSet *)self removeAllObjects];
  }
  else
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    unint64_t v19 = [(NSSet *)otherSet countByEnumeratingWithState:&v33 objects:v32 count:16];
    if (v19)
    {
      unint64_t v20 = v19;
      uint64_t v21 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v34 != v21) {
            objc_enumerationMutation(otherSet);
          }
          uint64_t v23 = *(void *)(*((void *)&v33 + 1) + 8 * j);
          unint64_t v24 = [(NSSet *)otherSet countForObject:v23];
          if (v24)
          {
            unint64_t v25 = v24;
            do
            {
              --v25;
              [(NSMutableSet *)self removeObject:v23];
            }
            while (v25);
          }
        }
        unint64_t v20 = [(NSSet *)otherSet countByEnumeratingWithState:&v33 objects:v32 count:16];
      }
      while (v20);
    }
  }
}

- (void)addObjectsFromArray:(NSArray *)array
{
  v4 = array;
  uint64_t v27 = *(void *)off_1ECE0A5B0;
  if (array)
  {
    objc_lookUpClass("NSArray");
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      CFStringRef v6 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSMutableSet addObjectsFromArray:]");
      __int16 v7 = _CFAutoreleasePoolAddObject(0, (uint64_t)v6);
      CFLog(3, @"%@", v8, v9, v10, v11, v12, v13, v7);
      objc_lookUpClass("NSSet");
      if (objc_opt_isKindOfClass()) {
        v4 = [(NSArray *)v4 allObjects];
      }
    }
  }
  [(NSMutableSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
    if (!v4) {
      goto LABEL_8;
    }
  }
  else if (!v4)
  {
    goto LABEL_8;
  }
  if ((_NSIsNSArray((uint64_t)v4) & 1) == 0)
  {
    uint64_t v18 = _os_log_pack_size();
    uint64_t v19 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v19 = 136315138;
    *(void *)(v19 + 4) = "-[NSMutableSet addObjectsFromArray:]";
    CFStringRef v20 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSMutableSet addObjectsFromArray:]");
    uint64_t v21 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v20) userInfo:0 osLogPack:&v22[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)] size:v18];
    objc_exception_throw(v21);
  }
LABEL_8:
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v14 = [(NSArray *)v4 countByEnumeratingWithState:&v23 objects:v22 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v4);
        }
        [(NSMutableSet *)self addObject:*(void *)(*((void *)&v23 + 1) + 8 * i)];
      }
      uint64_t v15 = [(NSArray *)v4 countByEnumeratingWithState:&v23 objects:v22 count:16];
    }
    while (v15);
  }
}

- (void)unionSet:(NSSet *)otherSet
{
  uint64_t v40 = *(void *)off_1ECE0A5B0;
  [(NSMutableSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
    if (!otherSet) {
      goto LABEL_17;
    }
  }
  else if (!otherSet)
  {
    goto LABEL_17;
  }
  if ((_NSIsNSSet((uint64_t)otherSet) & 1) != 0
    || _CFExecutableLinkedOnOrAfter(7uLL)
    || _CFExecutableLinkedOnOrAfter(0x3F2uLL))
  {
    goto LABEL_16;
  }
  if ((unint64_t)++__checkForAndForgiveClientSin_cnt <= 0x64)
  {
    __int16 v7 = __CFExceptionProem((objc_class *)self, a2);
    CFLog(3, @"%@: This app appears to be calling this method with a non-set parameter.  Please wait while the system corrects this....  %s", v8, v9, v10, v11, v12, v13, v7);
  }
  uint64_t v14 = objc_opt_new();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  unint64_t v15 = [(NSSet *)otherSet countByEnumeratingWithState:&v36 objects:v35 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v37 != v16) {
          objc_enumerationMutation(otherSet);
        }
        [v14 addObject:*(void *)(*((void *)&v36 + 1) + 8 * i)];
      }
      unint64_t v15 = [(NSSet *)otherSet countByEnumeratingWithState:&v36 objects:v35 count:16];
    }
    while (v15);
  }
  otherSet = v14;
  if (otherSet)
  {
LABEL_16:
    if ((_NSIsNSSet((uint64_t)otherSet) & 1) == 0)
    {
      uint64_t v29 = _os_log_pack_size();
      uint64_t v31 = (char *)v35 - ((MEMORY[0x1F4188790](v29, v30) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v32 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v32 = 136315138;
      *(void *)(v32 + 4) = "-[NSMutableSet unionSet:]";
      CFStringRef v33 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: set argument is not an NSSet", "-[NSMutableSet unionSet:]");
      long long v34 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v33) userInfo:0 osLogPack:v31 size:v29];
      objc_exception_throw(v34);
    }
  }
LABEL_17:
  NSUInteger v18 = [(NSSet *)otherSet count];
  unint64_t v20 = v18;
  if (v18 >> 60)
  {
    CFStringRef v27 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v18);
    v28 = +[NSException exceptionWithName:@"NSGenericException" reason:v27 userInfo:0];
    CFRelease(v27);
    objc_exception_throw(v28);
  }
  if (v18 <= 1) {
    NSUInteger v18 = 1;
  }
  unint64_t v21 = MEMORY[0x1F4188790](v18, v19);
  long long v23 = (char *)v35 - v22;
  v35[0] = 0;
  if (v20 >= 0x101)
  {
    long long v23 = (char *)_CFCreateArrayStorage(v21, 0, v35);
    long long v24 = v23;
  }
  else
  {
    long long v24 = 0;
  }
  -[NSSet getObjects:count:](otherSet, "getObjects:count:", v23, v20, v35[0]);
  if (v20)
  {
    for (uint64_t j = 0; j != v20; ++j)
    {
      unint64_t v26 = [(NSSet *)otherSet countForObject:*(void *)&v23[8 * j]] + 1;
      while (--v26)
        [(NSMutableSet *)self addObject:*(void *)&v23[8 * j]];
    }
  }
  free(v24);
}

- (id)setByAddingObjectsFromArray:(id)a3
{
  uint64_t v26 = *(void *)off_1ECE0A5B0;
  if (a3 && (_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    uint64_t v19 = _os_log_pack_size();
    unint64_t v21 = (char *)&v25 - ((MEMORY[0x1F4188790](v19, v20) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v22 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v22 = 136315138;
    *(void *)(v22 + 4) = "-[NSMutableSet setByAddingObjectsFromArray:]";
    CFStringRef v23 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSMutableSet setByAddingObjectsFromArray:]");
    long long v24 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v23) userInfo:0 osLogPack:v21 size:v19];
    objc_exception_throw(v24);
  }
  uint64_t v5 = [a3 count];
  NSUInteger v6 = [(NSSet *)self count];
  unint64_t v8 = v6 + v5;
  if ((v6 + v5) >> 60)
  {
    CFStringRef v17 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v6 + v5);
    NSUInteger v18 = +[NSException exceptionWithName:@"NSGenericException" reason:v17 userInfo:0];
    CFRelease(v17);
    objc_exception_throw(v18);
  }
  NSUInteger v9 = v6;
  if (v8 <= 1) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = v6 + v5;
  }
  unint64_t v11 = MEMORY[0x1F4188790](v10, v7);
  uint64_t v13 = (char *)&v25 - v12;
  size_t v25 = 0;
  if (v8 >= 0x101)
  {
    uint64_t v13 = (char *)_CFCreateArrayStorage(v11, 0, &v25);
    uint64_t v14 = v13;
    if (!v9) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  uint64_t v14 = 0;
  if (v9) {
LABEL_11:
  }
    -[NSSet getObjects:count:](self, "getObjects:count:", v13, v9, v25, v26);
LABEL_12:
  if (v5) {
    objc_msgSend(a3, "getObjects:range:", &v13[8 * v9], 0, v5);
  }
  unint64_t v15 = +[NSSet setWithObjects:count:](NSSet, "setWithObjects:count:", v13, v8, v25);
  free(v14);
  return v15;
}

- (id)setByAddingObjectsFromSet:(id)a3
{
  id v3 = a3;
  uint64_t v42 = *(void *)off_1ECE0A5B0;
  if (a3)
  {
    if ((_NSIsNSSet((uint64_t)a3) & 1) != 0
      || _CFExecutableLinkedOnOrAfter(7uLL)
      || _CFExecutableLinkedOnOrAfter(0x3F2uLL))
    {
      goto LABEL_15;
    }
    if ((unint64_t)++__checkForAndForgiveClientSin_cnt <= 0x64)
    {
      __int16 v6 = __CFExceptionProem((objc_class *)self, a2);
      CFLog(3, @"%@: This app appears to be calling this method with a non-set parameter.  Please wait while the system corrects this....  %s", v7, v8, v9, v10, v11, v12, v6);
    }
    uint64_t v13 = objc_opt_new();
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v14 = [v3 countByEnumeratingWithState:&v38 objects:v37 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v39 != v15) {
            objc_enumerationMutation(v3);
          }
          [v13 addObject:*(void *)(*((void *)&v38 + 1) + 8 * i)];
        }
        uint64_t v14 = [v3 countByEnumeratingWithState:&v38 objects:v37 count:16];
      }
      while (v14);
    }
    id v3 = v13;
    if (v3)
    {
LABEL_15:
      if ((_NSIsNSSet((uint64_t)v3) & 1) == 0)
      {
        uint64_t v31 = _os_log_pack_size();
        CFStringRef v33 = (char *)v37 - ((MEMORY[0x1F4188790](v31, v32) + 15) & 0xFFFFFFFFFFFFFFF0);
        uint64_t v34 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v34 = 136315138;
        *(void *)(v34 + 4) = "-[NSMutableSet setByAddingObjectsFromSet:]";
        CFStringRef v35 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: set argument is not an NSSet", "-[NSMutableSet setByAddingObjectsFromSet:]");
        long long v36 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v35) userInfo:0 osLogPack:v33 size:v31];
        objc_exception_throw(v36);
      }
    }
  }
  uint64_t v17 = [v3 count];
  NSUInteger v18 = [(NSSet *)self count];
  NSUInteger v20 = v18;
  unint64_t v21 = v18 + v17;
  if ((v18 + v17) >> 60)
  {
    CFStringRef v29 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v18 + v17);
    uint64_t v30 = +[NSException exceptionWithName:@"NSGenericException" reason:v29 userInfo:0];
    CFRelease(v29);
    objc_exception_throw(v30);
  }
  if (v21 <= 1) {
    uint64_t v22 = 1;
  }
  else {
    uint64_t v22 = v18 + v17;
  }
  unint64_t v23 = MEMORY[0x1F4188790](v22, v19);
  size_t v25 = (char *)v37 - v24;
  v37[0] = 0;
  if (v21 >= 0x101)
  {
    size_t v25 = (char *)_CFCreateArrayStorage(v23, 0, v37);
    uint64_t v26 = v25;
    if (!v20) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  uint64_t v26 = 0;
  if (v20) {
LABEL_24:
  }
    -[NSSet getObjects:count:](self, "getObjects:count:", v25, v20, v37[0]);
LABEL_25:
  if (v17) {
    [v3 getObjects:&v25[8 * v20] count:v17];
  }
  CFStringRef v27 = +[NSSet setWithObjects:count:](NSSet, "setWithObjects:count:", v25, v21, v37[0]);
  free(v26);
  return v27;
}

- (void)setObject:(id)a3
{
  v11[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableSet *)self _mutate];
  if (!__cf_tsanWriteFunction)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_11:
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[NSMutableSet setObject:]";
    CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: object cannot be nil", "-[NSMutableSet setObject:]");
    uint64_t v10 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v9) userInfo:0 osLogPack:(char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) size:v7];
    objc_exception_throw(v10);
  }
  __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
  if (!a3) {
    goto LABEL_11;
  }
LABEL_3:
  id v6 = [(NSSet *)self member:a3];
  if (v6 != a3)
  {
    if (v6) {
      [(NSMutableSet *)self removeObject:v6];
    }
    [(NSMutableSet *)self addObject:a3];
  }
}

- (void)setSet:(NSSet *)otherSet
{
  uint64_t v42 = *(void *)off_1ECE0A5B0;
  [(NSMutableSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
    if (!otherSet) {
      goto LABEL_17;
    }
  }
  else if (!otherSet)
  {
    goto LABEL_17;
  }
  if ((_NSIsNSSet((uint64_t)otherSet) & 1) != 0
    || _CFExecutableLinkedOnOrAfter(7uLL)
    || _CFExecutableLinkedOnOrAfter(0x3F2uLL))
  {
    goto LABEL_16;
  }
  if ((unint64_t)++__checkForAndForgiveClientSin_cnt <= 0x64)
  {
    __int16 v7 = __CFExceptionProem((objc_class *)self, a2);
    CFLog(3, @"%@: This app appears to be calling this method with a non-set parameter.  Please wait while the system corrects this....  %s", v8, v9, v10, v11, v12, v13, v7);
  }
  uint64_t v14 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  unint64_t v15 = [(NSSet *)otherSet countByEnumeratingWithState:&v38 objects:v37 count:16];
  if (v15)
  {
    unint64_t v16 = v15;
    uint64_t v17 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v39 != v17) {
          objc_enumerationMutation(otherSet);
        }
        [v14 addObject:*(void *)(*((void *)&v38 + 1) + 8 * i)];
      }
      unint64_t v16 = [(NSSet *)otherSet countByEnumeratingWithState:&v38 objects:v37 count:16];
    }
    while (v16);
  }
  otherSet = v14;
  if (otherSet)
  {
LABEL_16:
    if ((_NSIsNSSet((uint64_t)otherSet) & 1) == 0)
    {
      uint64_t v26 = _os_log_pack_size();
      v28 = &v32[-((MEMORY[0x1F4188790](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0)];
      uint64_t v29 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v29 = 136315138;
      *(void *)(v29 + 4) = "-[NSMutableSet setSet:]";
      CFStringRef v30 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: set argument is not an NSSet", "-[NSMutableSet setSet:]");
      uint64_t v31 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v30) userInfo:0 osLogPack:v28 size:v26];
      objc_exception_throw(v31);
    }
  }
LABEL_17:
  if (otherSet != (NSSet *)self)
  {
    [(NSMutableSet *)self removeAllObjects];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    unint64_t v19 = [(NSSet *)otherSet countByEnumeratingWithState:&v33 objects:v32 count:16];
    if (v19)
    {
      unint64_t v20 = v19;
      uint64_t v21 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v34 != v21) {
            objc_enumerationMutation(otherSet);
          }
          uint64_t v23 = *(void *)(*((void *)&v33 + 1) + 8 * j);
          unint64_t v24 = [(NSSet *)otherSet countForObject:v23];
          if (v24)
          {
            unint64_t v25 = v24;
            do
            {
              --v25;
              [(NSMutableSet *)self addObject:v23];
            }
            while (v25);
          }
        }
        unint64_t v20 = [(NSSet *)otherSet countByEnumeratingWithState:&v33 objects:v32 count:16];
      }
      while (v20);
    }
  }
}

- (void)addObjects:(const void *)a3 count:(unint64_t)a4
{
  v20[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableSet);
    if (a3) {
      goto LABEL_4;
    }
  }
  else if (a3)
  {
    goto LABEL_4;
  }
  if (a4)
  {
    uint64_t v14 = _os_log_pack_size();
    unint64_t v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315394;
    *(void *)(v16 + 4) = "-[NSMutableSet addObjects:count:]";
    *(_WORD *)(v16 + 12) = 2048;
    *(void *)(v16 + 14) = a4;
    CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[NSMutableSet addObjects:count:]", a4);
    goto LABEL_16;
  }
LABEL_4:
  if (a4 >> 61)
  {
    uint64_t v14 = _os_log_pack_size();
    unint64_t v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315394;
    *(void *)(v18 + 4) = "-[NSMutableSet addObjects:count:]";
    *(_WORD *)(v18 + 12) = 2048;
    *(void *)(v18 + 14) = a4;
    CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[NSMutableSet addObjects:count:]", a4);
LABEL_16:
    unint64_t v19 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v17) userInfo:0 osLogPack:v15 size:v14];
    objc_exception_throw(v19);
  }
  if (a4)
  {
    uint64_t v8 = 0;
    do
    {
      if (!a3[v8])
      {
        uint64_t v10 = _os_log_pack_size();
        uint64_t v11 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v11 = 136315394;
        *(void *)(v11 + 4) = "-[NSMutableSet addObjects:count:]";
        *(_WORD *)(v11 + 12) = 2048;
        *(void *)(v11 + 14) = v8;
        CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: attempt to insert nil object from objects[%lu]", "-[NSMutableSet addObjects:count:]", v8);
        uint64_t v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0 osLogPack:(char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0) size:v10];
        objc_exception_throw(v13);
      }
      ++v8;
    }
    while (a4 != v8);
    do
    {
      uint64_t v9 = (uint64_t)*a3++;
      [(NSMutableSet *)self addObject:v9];
      --a4;
    }
    while (a4);
  }
}

- (void)addObjectsFromArray:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v39[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableSet);
    if (!a3) {
      goto LABEL_4;
    }
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    uint64_t v25 = _os_log_pack_size();
    uint64_t v27 = (char *)v39 - ((MEMORY[0x1F4188790](v25, v26) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v28 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v28 = 136315138;
    *(void *)(v28 + 4) = "-[NSMutableSet addObjectsFromArray:range:]";
    CFStringRef v29 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSMutableSet addObjectsFromArray:range:]");
    CFStringRef v30 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v29) userInfo:0 osLogPack:v27 size:v25];
    objc_exception_throw(v30);
  }
LABEL_4:
  unint64_t v9 = [a3 count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (!v9)
    {
      uint64_t v16 = _os_log_pack_size();
      uint64_t v18 = (char *)v39 - ((MEMORY[0x1F4188790](v16, v17) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v19 = _os_log_pack_fill();
      double v20 = __os_log_helper_1_2_3_8_32_8_0_8_0(v19, (uint64_t)"-[NSMutableSet addObjectsFromArray:range:]", location, length);
      CFStringRef v21 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty set", v20, "-[NSMutableSet addObjectsFromArray:range:]", location, length);
      uint64_t v22 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v21) userInfo:0 osLogPack:v18 size:v16];
      objc_exception_throw(v22);
    }
    unint64_t v31 = v9;
    uint64_t v32 = _os_log_pack_size();
    long long v34 = (char *)v39 - ((MEMORY[0x1F4188790](v32, v33) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v35 = _os_log_pack_fill();
    double v36 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v35, (uint64_t)"-[NSMutableSet addObjectsFromArray:range:]", location, length, --v31);
    CFStringRef v37 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v36, "-[NSMutableSet addObjectsFromArray:range:]", location, length, v31);
    long long v38 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v37) userInfo:0 osLogPack:v34 size:v32];
    objc_exception_throw(v38);
  }
  if (length >> 60)
  {
    CFStringRef v23 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", length);
    unint64_t v24 = +[NSException exceptionWithName:@"NSGenericException" reason:v23 userInfo:0];
    CFRelease(v23);
    objc_exception_throw(v24);
  }
  if (length <= 1) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = length;
  }
  unint64_t v12 = MEMORY[0x1F4188790](v11, v10);
  uint64_t v14 = (char *)v39 - v13;
  v39[0] = 0;
  if (length >= 0x101)
  {
    uint64_t v14 = (char *)_CFCreateArrayStorage(v12, 0, v39);
    unint64_t v15 = v14;
  }
  else
  {
    unint64_t v15 = 0;
  }
  objc_msgSend(a3, "getObjects:range:", v14, location, length, v39[0]);
  [(NSMutableSet *)self addObjects:v14 count:length];
  free(v15);
}

- (void)addObjectsFromOrderedSet:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v39[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableSet);
    if (!a3) {
      goto LABEL_4;
    }
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    uint64_t v25 = _os_log_pack_size();
    uint64_t v27 = (char *)v39 - ((MEMORY[0x1F4188790](v25, v26) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v28 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v28 = 136315138;
    *(void *)(v28 + 4) = "-[NSMutableSet addObjectsFromOrderedSet:range:]";
    CFStringRef v29 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSMutableSet addObjectsFromOrderedSet:range:]");
    CFStringRef v30 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v29) userInfo:0 osLogPack:v27 size:v25];
    objc_exception_throw(v30);
  }
LABEL_4:
  unint64_t v9 = [a3 count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (!v9)
    {
      uint64_t v16 = _os_log_pack_size();
      uint64_t v18 = (char *)v39 - ((MEMORY[0x1F4188790](v16, v17) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v19 = _os_log_pack_fill();
      double v20 = __os_log_helper_1_2_3_8_32_8_0_8_0(v19, (uint64_t)"-[NSMutableSet addObjectsFromOrderedSet:range:]", location, length);
      CFStringRef v21 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty set", v20, "-[NSMutableSet addObjectsFromOrderedSet:range:]", location, length);
      uint64_t v22 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v21) userInfo:0 osLogPack:v18 size:v16];
      objc_exception_throw(v22);
    }
    unint64_t v31 = v9;
    uint64_t v32 = _os_log_pack_size();
    long long v34 = (char *)v39 - ((MEMORY[0x1F4188790](v32, v33) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v35 = _os_log_pack_fill();
    double v36 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v35, (uint64_t)"-[NSMutableSet addObjectsFromOrderedSet:range:]", location, length, --v31);
    CFStringRef v37 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v36, "-[NSMutableSet addObjectsFromOrderedSet:range:]", location, length, v31);
    long long v38 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v37) userInfo:0 osLogPack:v34 size:v32];
    objc_exception_throw(v38);
  }
  if (length >> 60)
  {
    CFStringRef v23 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", length);
    unint64_t v24 = +[NSException exceptionWithName:@"NSGenericException" reason:v23 userInfo:0];
    CFRelease(v23);
    objc_exception_throw(v24);
  }
  if (length <= 1) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = length;
  }
  unint64_t v12 = MEMORY[0x1F4188790](v11, v10);
  uint64_t v14 = (char *)v39 - v13;
  v39[0] = 0;
  if (length >= 0x101)
  {
    uint64_t v14 = (char *)_CFCreateArrayStorage(v12, 0, v39);
    unint64_t v15 = v14;
  }
  else
  {
    unint64_t v15 = 0;
  }
  objc_msgSend(a3, "getObjects:range:", v14, location, length, v39[0]);
  [(NSMutableSet *)self addObjects:v14 count:length];
  free(v15);
}

- (void)addObjectsFromOrderedSet:(id)a3
{
  uint64_t v19 = *(void *)off_1ECE0A5B0;
  [(NSMutableSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
    if (!a3) {
      goto LABEL_4;
    }
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "-[NSMutableSet addObjectsFromOrderedSet:]";
    CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSMutableSet addObjectsFromOrderedSet:]");
    uint64_t v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0 osLogPack:&v14[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)] size:v10];
    objc_exception_throw(v13);
  }
LABEL_4:
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(a3);
        }
        [(NSMutableSet *)self addObject:*(void *)(*((void *)&v15 + 1) + 8 * i)];
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v15 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)addObjectsFromSet:(id)a3
{
  uint64_t v39 = *(void *)off_1ECE0A5B0;
  [(NSMutableSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
    if (!a3) {
      goto LABEL_17;
    }
  }
  else if (!a3)
  {
    goto LABEL_17;
  }
  if ((_NSIsNSSet((uint64_t)a3) & 1) != 0
    || _CFExecutableLinkedOnOrAfter(7uLL)
    || _CFExecutableLinkedOnOrAfter(0x3F2uLL))
  {
    goto LABEL_16;
  }
  if ((unint64_t)++__checkForAndForgiveClientSin_cnt <= 0x64)
  {
    __int16 v7 = __CFExceptionProem((objc_class *)self, a2);
    CFLog(3, @"%@: This app appears to be calling this method with a non-set parameter.  Please wait while the system corrects this....  %s", v8, v9, v10, v11, v12, v13, v7);
  }
  uint64_t v14 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v15 = [a3 countByEnumeratingWithState:&v35 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v36 != v17) {
          objc_enumerationMutation(a3);
        }
        [v14 addObject:*(void *)(*((void *)&v35 + 1) + 8 * i)];
      }
      uint64_t v16 = [a3 countByEnumeratingWithState:&v35 objects:v34 count:16];
    }
    while (v16);
  }
  a3 = v14;
  if (a3)
  {
LABEL_16:
    if ((_NSIsNSSet((uint64_t)a3) & 1) == 0)
    {
      uint64_t v23 = _os_log_pack_size();
      uint64_t v25 = &v29[-((MEMORY[0x1F4188790](v23, v24) + 15) & 0xFFFFFFFFFFFFFFF0)];
      uint64_t v26 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v26 = 136315138;
      *(void *)(v26 + 4) = "-[NSMutableSet addObjectsFromSet:]";
      CFStringRef v27 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: set argument is not an NSSet", "-[NSMutableSet addObjectsFromSet:]");
      uint64_t v28 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v27) userInfo:0 osLogPack:v25 size:v23];
      objc_exception_throw(v28);
    }
  }
LABEL_17:
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v19 = [a3 countByEnumeratingWithState:&v30 objects:v29 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(a3);
        }
        [(NSMutableSet *)self addObject:*(void *)(*((void *)&v30 + 1) + 8 * j)];
      }
      uint64_t v20 = [a3 countByEnumeratingWithState:&v30 objects:v29 count:16];
    }
    while (v20);
  }
}

- (void)intersectOrderedSet:(id)a3
{
  uint64_t v45 = *(void *)off_1ECE0A5B0;
  [(NSMutableSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
    if (!a3) {
      goto LABEL_4;
    }
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    uint64_t v24 = _os_log_pack_size();
    uint64_t v26 = (char *)&v33 - ((MEMORY[0x1F4188790](v24, v25) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v27 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v27 = 136315138;
    *(void *)(v27 + 4) = "-[NSMutableSet intersectOrderedSet:]";
    CFStringRef v28 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSMutableSet intersectOrderedSet:]");
    CFStringRef v29 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v28) userInfo:0 osLogPack:v26 size:v24];
    objc_exception_throw(v29);
  }
LABEL_4:
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  unint64_t v7 = [(NSSet *)self countByEnumeratingWithState:&v41 objects:v40 count:16];
  if (v7)
  {
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v42 != v9) {
          objc_enumerationMutation(self);
        }
        v8 += [(NSSet *)self countForObject:*(void *)(*((void *)&v41 + 1) + 8 * i)];
      }
      unint64_t v7 = [(NSSet *)self countByEnumeratingWithState:&v41 objects:v40 count:16];
    }
    while (v7);
    if (v8 >> 60)
    {
      CFStringRef v30 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v8);
      long long v31 = +[NSException exceptionWithName:@"NSGenericException" reason:v30 userInfo:0];
      CFRelease(v30);
      objc_exception_throw(v31);
    }
    if (v8 <= 1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = v8;
    }
    unint64_t v13 = MEMORY[0x1F4188790](v12, v11);
    uint64_t v15 = (uint64_t *)((char *)&v33 - v14);
    size_t v34 = 0;
    if (v8 >= 0x101)
    {
      uint64_t v15 = (uint64_t *)_CFCreateArrayStorage(v13, 0, &v34);
      long long v33 = v15;
    }
    else
    {
      long long v33 = 0;
    }
  }
  else
  {
    MEMORY[0x1F4188790](0, v6);
    uint64_t v15 = &v32;
    long long v33 = 0;
    size_t v34 = 0;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  unint64_t v16 = -[NSSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v36, v35, 16, v33, v34);
  uint64_t v17 = v15;
  if (v16)
  {
    uint64_t v18 = *(void *)v37;
    uint64_t v17 = v15;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v37 != v18) {
          objc_enumerationMutation(self);
        }
        uint64_t v20 = *(void *)(*((void *)&v36 + 1) + 8 * j);
        unint64_t v21 = [a3 countForObject:v20];
        unint64_t v22 = [(NSSet *)self countForObject:v20];
        unint64_t v23 = v22 - v21;
        if (v22 > v21)
        {
          do
          {
            *v17++ = v20;
            --v23;
          }
          while (v23);
        }
      }
      unint64_t v16 = [(NSSet *)self countByEnumeratingWithState:&v36 objects:v35 count:16];
    }
    while (v16);
  }
  while (v15 < v17)
    [(NSMutableSet *)self removeObject:*v15++];
  free(v33);
}

- (void)minusOrderedSet:(id)a3
{
  uint64_t v22 = *(void *)off_1ECE0A5B0;
  [(NSMutableSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
    if (!a3) {
      goto LABEL_4;
    }
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    uint64_t v13 = _os_log_pack_size();
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315138;
    *(void *)(v14 + 4) = "-[NSMutableSet minusOrderedSet:]";
    CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSMutableSet minusOrderedSet:]");
    unint64_t v16 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v15) userInfo:0 osLogPack:&v17[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)] size:v13];
    objc_exception_throw(v16);
  }
LABEL_4:
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v11 = [a3 countForObject:v10];
        if (v11)
        {
          uint64_t v12 = v11;
          do
          {
            --v12;
            [(NSMutableSet *)self removeObject:v10];
          }
          while (v12);
        }
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v18 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)removeAllObjects
{
  v15[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableSet *)self _mutate];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v2, __CFTSANTagMutableSet);
  }
  NSUInteger v4 = [(NSSet *)self count];
  unint64_t v6 = v4;
  if (v4 >> 60)
  {
    CFStringRef v13 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v4);
    uint64_t v14 = +[NSException exceptionWithName:@"NSGenericException" reason:v13 userInfo:0];
    CFRelease(v13);
    objc_exception_throw(v14);
  }
  if (v4 <= 1) {
    NSUInteger v4 = 1;
  }
  unint64_t v7 = MEMORY[0x1F4188790](v4, v5);
  uint64_t v9 = (char *)v15 - v8;
  v15[0] = 0;
  if (v6 >= 0x101)
  {
    uint64_t v9 = (char *)_CFCreateArrayStorage(v7, 0, v15);
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v10 = 0;
  }
  -[NSSet getObjects:count:](self, "getObjects:count:", v9, v6, v15[0]);
  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      unint64_t v12 = [(NSSet *)self countForObject:*(void *)&v9[8 * i]] + 1;
      while (--v12)
        [(NSMutableSet *)self removeObject:*(void *)&v9[8 * i]];
    }
  }
  free(v10);
}

- (void)removeObjectsInArray:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v23[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableSet);
    if (!a3) {
      goto LABEL_4;
    }
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    uint64_t v15 = _os_log_pack_size();
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = "-[NSMutableSet removeObjectsInArray:range:]";
    CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSMutableSet removeObjectsInArray:range:]");
    long long v18 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v17) userInfo:0 osLogPack:(char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0) size:v15];
    objc_exception_throw(v18);
  }
LABEL_4:
  unint64_t v9 = [a3 count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      unint64_t v19 = v9;
      uint64_t v10 = _os_log_pack_size();
      uint64_t v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v20 = _os_log_pack_fill();
      double v21 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v20, (uint64_t)"-[NSMutableSet removeObjectsInArray:range:]", location, length, --v19);
      CFStringRef v14 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v21, "-[NSMutableSet removeObjectsInArray:range:]", location, length, v19);
    }
    else
    {
      uint64_t v10 = _os_log_pack_size();
      uint64_t v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v12 = _os_log_pack_fill();
      double v13 = __os_log_helper_1_2_3_8_32_8_0_8_0(v12, (uint64_t)"-[NSMutableSet removeObjectsInArray:range:]", location, length);
      CFStringRef v14 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty set", v13, "-[NSMutableSet removeObjectsInArray:range:]", location, length);
    }
    uint64_t v22 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v14) userInfo:0 osLogPack:v11 size:v10];
    objc_exception_throw(v22);
  }
  for (; length; --length)
    -[NSMutableSet removeObject:](self, "removeObject:", [a3 objectAtIndex:location++]);
}

- (void)removeObjectsInArray:(id)a3
{
  uint64_t v19 = *(void *)off_1ECE0A5B0;
  [(NSMutableSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
    if (!a3) {
      goto LABEL_4;
    }
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "-[NSMutableSet removeObjectsInArray:]";
    CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSMutableSet removeObjectsInArray:]");
    double v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0 osLogPack:&v14[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)] size:v10];
    objc_exception_throw(v13);
  }
LABEL_4:
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(a3);
        }
        [(NSMutableSet *)self removeObject:*(void *)(*((void *)&v15 + 1) + 8 * i)];
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v15 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)removeObjectsInOrderedSet:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v23[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableSet);
    if (!a3) {
      goto LABEL_4;
    }
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    uint64_t v15 = _os_log_pack_size();
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = "-[NSMutableSet removeObjectsInOrderedSet:range:]";
    CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSMutableSet removeObjectsInOrderedSet:range:]");
    long long v18 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v17) userInfo:0 osLogPack:(char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0) size:v15];
    objc_exception_throw(v18);
  }
LABEL_4:
  unint64_t v9 = [a3 count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      unint64_t v19 = v9;
      uint64_t v10 = _os_log_pack_size();
      uint64_t v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v20 = _os_log_pack_fill();
      double v21 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v20, (uint64_t)"-[NSMutableSet removeObjectsInOrderedSet:range:]", location, length, --v19);
      CFStringRef v14 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v21, "-[NSMutableSet removeObjectsInOrderedSet:range:]", location, length, v19);
    }
    else
    {
      uint64_t v10 = _os_log_pack_size();
      uint64_t v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v12 = _os_log_pack_fill();
      double v13 = __os_log_helper_1_2_3_8_32_8_0_8_0(v12, (uint64_t)"-[NSMutableSet removeObjectsInOrderedSet:range:]", location, length);
      CFStringRef v14 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty set", v13, "-[NSMutableSet removeObjectsInOrderedSet:range:]", location, length);
    }
    uint64_t v22 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v14) userInfo:0 osLogPack:v11 size:v10];
    objc_exception_throw(v22);
  }
  for (; length; --length)
    -[NSMutableSet removeObject:](self, "removeObject:", [a3 objectAtIndex:location++]);
}

- (void)removeObjectsInOrderedSet:(id)a3
{
  uint64_t v19 = *(void *)off_1ECE0A5B0;
  [(NSMutableSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
    if (!a3) {
      goto LABEL_4;
    }
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "-[NSMutableSet removeObjectsInOrderedSet:]";
    CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSMutableSet removeObjectsInOrderedSet:]");
    double v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0 osLogPack:&v14[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)] size:v10];
    objc_exception_throw(v13);
  }
LABEL_4:
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(a3);
        }
        [(NSMutableSet *)self removeObject:*(void *)(*((void *)&v15 + 1) + 8 * i)];
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v15 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)removeObjectsInSet:(id)a3
{
  uint64_t v39 = *(void *)off_1ECE0A5B0;
  [(NSMutableSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
    if (!a3) {
      goto LABEL_17;
    }
  }
  else if (!a3)
  {
    goto LABEL_17;
  }
  if ((_NSIsNSSet((uint64_t)a3) & 1) != 0
    || _CFExecutableLinkedOnOrAfter(7uLL)
    || _CFExecutableLinkedOnOrAfter(0x3F2uLL))
  {
    goto LABEL_16;
  }
  if ((unint64_t)++__checkForAndForgiveClientSin_cnt <= 0x64)
  {
    __int16 v7 = __CFExceptionProem((objc_class *)self, a2);
    CFLog(3, @"%@: This app appears to be calling this method with a non-set parameter.  Please wait while the system corrects this....  %s", v8, v9, v10, v11, v12, v13, v7);
  }
  CFStringRef v14 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v15 = [a3 countByEnumeratingWithState:&v35 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v36 != v17) {
          objc_enumerationMutation(a3);
        }
        [v14 addObject:*(void *)(*((void *)&v35 + 1) + 8 * i)];
      }
      uint64_t v16 = [a3 countByEnumeratingWithState:&v35 objects:v34 count:16];
    }
    while (v16);
  }
  a3 = v14;
  if (a3)
  {
LABEL_16:
    if ((_NSIsNSSet((uint64_t)a3) & 1) == 0)
    {
      uint64_t v23 = _os_log_pack_size();
      uint64_t v25 = &v29[-((MEMORY[0x1F4188790](v23, v24) + 15) & 0xFFFFFFFFFFFFFFF0)];
      uint64_t v26 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v26 = 136315138;
      *(void *)(v26 + 4) = "-[NSMutableSet removeObjectsInSet:]";
      CFStringRef v27 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: set argument is not an NSSet", "-[NSMutableSet removeObjectsInSet:]");
      CFStringRef v28 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v27) userInfo:0 osLogPack:v25 size:v23];
      objc_exception_throw(v28);
    }
  }
LABEL_17:
  if (a3 == self)
  {
    [(NSMutableSet *)self removeAllObjects];
  }
  else
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v19 = [a3 countByEnumeratingWithState:&v30 objects:v29 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v31 != v21) {
            objc_enumerationMutation(a3);
          }
          [(NSMutableSet *)self removeObject:*(void *)(*((void *)&v30 + 1) + 8 * j)];
        }
        uint64_t v20 = [a3 countByEnumeratingWithState:&v30 objects:v29 count:16];
      }
      while (v20);
    }
  }
}

- (void)removeObjectsWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  char v6 = a3;
  uint64_t v32 = *(void *)off_1ECE0A5B0;
  [(NSMutableSet *)self _mutate];
  if (!__cf_tsanWriteFunction)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_12:
    uint64_t v14 = _os_log_pack_size();
    uint64_t v16 = (char *)&v21[-1] - ((MEMORY[0x1F4188790](v14, v15) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315138;
    *(void *)(v17 + 4) = "-[NSMutableSet removeObjectsWithOptions:passingTest:]";
    CFStringRef v18 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSMutableSet removeObjectsWithOptions:passingTest:]");
    uint64_t v19 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v18) userInfo:0 osLogPack:v16 size:v14];
    objc_exception_throw(v19);
  }
  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableSet);
  if (!a4) {
    goto LABEL_12;
  }
LABEL_3:
  char v8 = v6 & 0xFD;
  uint64_t v9 = +[NSSet set];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  uint64_t v31 = 0;
  uint64_t v27 = 850045857;
  v21[0] = off_1ECE0A5A0;
  v21[1] = 3221225472;
  v21[2] = __53__NSMutableSet_removeObjectsWithOptions_passingTest___block_invoke;
  v21[3] = &unk_1ECB43C68;
  v21[5] = a4;
  v21[6] = &v27;
  v21[4] = v9;
  __NSSetEnumerate(self, v8, (uint64_t)v21);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v10 = [(NSSet *)v9 countByEnumeratingWithState:&v23 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        [(NSMutableSet *)self removeObject:*(void *)(*((void *)&v23 + 1) + 8 * i)];
      }
      uint64_t v11 = [(NSSet *)v9 countByEnumeratingWithState:&v23 objects:v22 count:16];
    }
    while (v11);
  }
}

uint64_t __53__NSMutableSet_removeObjectsWithOptions_passingTest___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (result)
  {
    pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 48));
    [*(id *)(a1 + 32) addObject:a2];
    uint64_t v5 = *(pthread_mutex_t **)(a1 + 48);
    return pthread_mutex_unlock(v5);
  }
  return result;
}

- (void)removeObjectsPassingTest:(id)a3
{
  v7[1] = *(void *)off_1ECE0A5B0;
  if (!a3)
  {
    uint64_t v3 = _os_log_pack_size();
    uint64_t v4 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v4 = 136315138;
    *(void *)(v4 + 4) = "-[NSMutableSet removeObjectsPassingTest:]";
    CFStringRef v5 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSMutableSet removeObjectsPassingTest:]");
    char v6 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v5) userInfo:0 osLogPack:(char *)v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0) size:v3];
    objc_exception_throw(v6);
  }

  [(NSMutableSet *)self removeObjectsWithOptions:0 passingTest:a3];
}

- (void)replaceObject:(id)a3
{
  v11[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
    if (a3) {
      goto LABEL_3;
    }
LABEL_10:
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[NSMutableSet replaceObject:]";
    CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: object cannot be nil", "-[NSMutableSet replaceObject:]");
    uint64_t v10 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v9) userInfo:0 osLogPack:(char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) size:v7];
    objc_exception_throw(v10);
  }
  if (!a3) {
    goto LABEL_10;
  }
LABEL_3:
  id v6 = [(NSSet *)self member:a3];
  if (v6 != a3 && v6)
  {
    [(NSMutableSet *)self removeObject:v6];
    [(NSMutableSet *)self addObject:a3];
  }
}

- (void)setArray:(id)a3
{
  uint64_t v19 = *(void *)off_1ECE0A5B0;
  [(NSMutableSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
    if (!a3) {
      goto LABEL_4;
    }
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "-[NSMutableSet setArray:]";
    CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSMutableSet setArray:]");
    uint64_t v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0 osLogPack:&v14[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)] size:v10];
    objc_exception_throw(v13);
  }
LABEL_4:
  [(NSMutableSet *)self removeAllObjects];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(a3);
        }
        [(NSMutableSet *)self addObject:*(void *)(*((void *)&v15 + 1) + 8 * i)];
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v15 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)setOrderedSet:(id)a3
{
  uint64_t v22 = *(void *)off_1ECE0A5B0;
  [(NSMutableSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
    if (!a3) {
      goto LABEL_4;
    }
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    uint64_t v13 = _os_log_pack_size();
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315138;
    *(void *)(v14 + 4) = "-[NSMutableSet setOrderedSet:]";
    CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSMutableSet setOrderedSet:]");
    long long v16 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v15) userInfo:0 osLogPack:&v17[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)] size:v13];
    objc_exception_throw(v16);
  }
LABEL_4:
  [(NSMutableSet *)self removeAllObjects];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v11 = [a3 countForObject:v10];
        if (v11)
        {
          uint64_t v12 = v11;
          do
          {
            --v12;
            [(NSMutableSet *)self addObject:v10];
          }
          while (v12);
        }
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v18 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)unionOrderedSet:(id)a3
{
  uint64_t v22 = *(void *)off_1ECE0A5B0;
  [(NSMutableSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
    if (!a3) {
      goto LABEL_4;
    }
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    uint64_t v13 = _os_log_pack_size();
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315138;
    *(void *)(v14 + 4) = "-[NSMutableSet unionOrderedSet:]";
    CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSMutableSet unionOrderedSet:]");
    long long v16 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v15) userInfo:0 osLogPack:&v17[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)] size:v13];
    objc_exception_throw(v16);
  }
LABEL_4:
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v11 = [a3 countForObject:v10];
        if (v11)
        {
          uint64_t v12 = v11;
          do
          {
            --v12;
            [(NSMutableSet *)self addObject:v10];
          }
          while (v12);
        }
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v18 objects:v17 count:16];
    }
    while (v7);
  }
}

- (NSMutableSet)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  unint64_t v4 = a4;
  CFStringRef v5 = a3;
  v20[1] = *(void *)off_1ECE0A5B0;
  if (!a3 && a4)
  {
    uint64_t v14 = _os_log_pack_size();
    CFStringRef v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315394;
    *(void *)(v16 + 4) = "-[NSMutableSet initWithObjects:count:]";
    *(_WORD *)(v16 + 12) = 2048;
    *(void *)(v16 + 14) = v4;
    CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[NSMutableSet initWithObjects:count:]", v4);
    goto LABEL_17;
  }
  if (a4 >> 61)
  {
    uint64_t v14 = _os_log_pack_size();
    CFStringRef v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315394;
    *(void *)(v18 + 4) = "-[NSMutableSet initWithObjects:count:]";
    *(_WORD *)(v18 + 12) = 2048;
    *(void *)(v18 + 14) = v4;
    CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[NSMutableSet initWithObjects:count:]", v4);
LABEL_17:
    long long v19 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v17) userInfo:0 osLogPack:v15 size:v14];
    objc_exception_throw(v19);
  }
  if (a4)
  {
    for (uint64_t i = 0; i != a4; ++i)
    {
      if (!a3[i])
      {
        uint64_t v10 = _os_log_pack_size();
        uint64_t v11 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v11 = 136315394;
        *(void *)(v11 + 4) = "-[NSMutableSet initWithObjects:count:]";
        *(_WORD *)(v11 + 12) = 2048;
        *(void *)(v11 + 14) = i;
        CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: attempt to insert nil object from objects[%lu]", "-[NSMutableSet initWithObjects:count:]", i);
        uint64_t v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0 osLogPack:(char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0) size:v10];
        objc_exception_throw(v13);
      }
    }
    for (uint64_t j = [(NSMutableSet *)self initWithCapacity:a4]; v4; --v4)
    {
      uint64_t v8 = (uint64_t)*v5++;
      [(NSMutableSet *)j addObject:v8];
    }
    return j;
  }
  else
  {
    return [(NSMutableSet *)self initWithCapacity:0];
  }
}

- (void)addObject:(id)object
{
  CFStringRef v5 = __CFLookUpClass("NSMutableSet");

  __CFRequireConcreteImplementation(v5, (objc_class *)self, a2);
}

- (void)removeObject:(id)object
{
  CFStringRef v5 = __CFLookUpClass("NSMutableSet");

  __CFRequireConcreteImplementation(v5, (objc_class *)self, a2);
}

- (NSMutableSet)initWithCapacity:(NSUInteger)numItems
{
  CFStringRef v5 = __CFLookUpClass("NSMutableSet");
  __CFRequireConcreteImplementation(v5, (objc_class *)self, a2);
}

@end