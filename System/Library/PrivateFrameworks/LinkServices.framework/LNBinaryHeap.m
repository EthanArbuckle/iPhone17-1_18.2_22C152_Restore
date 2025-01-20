@interface LNBinaryHeap
- (BOOL)insertObject:(id)a3;
- (LNBinaryHeap)initWithCapacity:(unint64_t)a3 comparator:(id)a4 admissionPolicy:(id)a5;
- (id)peek;
- (id)popObject;
- (unint64_t)count;
- (void)dealloc;
- (void)enumerateObjectsUsingBlock:(id)a3;
@end

@implementation LNBinaryHeap

- (void).cxx_destruct
{
  objc_storeStrong(&self->_policy, 0);
  objc_storeStrong(&self->_comparator, 0);
}

- (void)dealloc
{
  CFRelease(self->_binaryHeap);
  v3.receiver = self;
  v3.super_class = (Class)LNBinaryHeap;
  [(LNBinaryHeap *)&v3 dealloc];
}

- (BOOL)insertObject:(id)a3
{
  id v4 = a3;
  if ([(LNBinaryHeap *)self count] >= self->_capacity)
  {
    policy = (uint64_t (**)(id, void *, id))self->_policy;
    if (!policy
      || ([(LNBinaryHeap *)self peek],
          v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = policy[2](policy, v6, v4),
          v6,
          !v7))
    {
      BOOL v9 = 0;
      goto LABEL_7;
    }
    id v8 = [(LNBinaryHeap *)self popObject];
  }
  CFBinaryHeapAddValue(self->_binaryHeap, v4);
  BOOL v9 = 1;
LABEL_7:

  return v9;
}

- (id)peek
{
  objc_super v3 = [(LNBinaryHeap *)self count];
  if (v3)
  {
    objc_super v3 = CFBinaryHeapGetMinimum(self->_binaryHeap);
  }
  return v3;
}

- (unint64_t)count
{
  return CFBinaryHeapGetCount(self->_binaryHeap);
}

- (id)popObject
{
  if ([(LNBinaryHeap *)self count])
  {
    objc_super v3 = CFBinaryHeapGetMinimum(self->_binaryHeap);
    CFBinaryHeapRemoveMinimumValue(self->_binaryHeap);
  }
  else
  {
    objc_super v3 = 0;
  }
  return v3;
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
}

- (LNBinaryHeap)initWithCapacity:(unint64_t)a3 comparator:(id)a4 admissionPolicy:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"LNBinaryHeap.m", 68, @"Invalid parameter not satisfying: %@", @"comparator" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)LNBinaryHeap;
  v11 = [(LNBinaryHeap *)&v22 init];
  if (v11)
  {
    uint64_t v12 = [v9 copy];
    id comparator = v11->_comparator;
    v11->_id comparator = (id)v12;

    uint64_t v14 = [v10 copy];
    id policy = v11->_policy;
    v11->_id policy = (id)v14;

    v11->_capacity = a3;
    CFBinaryHeapCallBacks callBacks = *(CFBinaryHeapCallBacks *)byte_1EF7D9A18;
    id v16 = v11->_comparator;
    compareContext.version = 0;
    compareContext.info = v16;
    compareContext.retain = (const void *(__cdecl *)(const void *))LNPriorityQueueRetain;
    compareContext.release = LNPriorityQueueRelease;
    compareContext.copyDescription = (CFStringRef (__cdecl *)(const void *))LNPriorityQueueCopyDescription;
    v11->_binaryHeap = CFBinaryHeapCreate(0, a3, &callBacks, &compareContext);
    v17 = v11;
  }

  return v11;
}

@end