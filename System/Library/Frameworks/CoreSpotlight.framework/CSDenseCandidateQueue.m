@interface CSDenseCandidateQueue
- (id)getAllItemsAndClearHeap;
- (void)dealloc;
@end

@implementation CSDenseCandidateQueue

- (void)dealloc
{
  denseQueue = self->_denseQueue;
  if (denseQueue) {
    CFRelease(denseQueue);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSDenseCandidateQueue;
  [(CSDenseCandidateQueue *)&v4 dealloc];
}

- (id)getAllItemsAndClearHeap
{
  if (a1)
  {
    v2 = objc_opt_new();
    v3 = *(__CFBinaryHeap **)(a1 + 8);
    if (v3)
    {
      CFIndex Count = CFBinaryHeapGetCount(v3);
      if (Count >= 1)
      {
        CFIndex v5 = Count;
        do
        {
          v6 = CFBinaryHeapGetMinimum(v3);
          CFBinaryHeapRemoveMinimumValue(v3);
          [v2 addObject:v6];

          --v5;
        }
        while (v5);
      }
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end