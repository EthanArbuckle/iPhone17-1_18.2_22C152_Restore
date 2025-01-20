@interface CSL1CandidateQueue
- (id)getAllItemsAndClearHeap;
- (void)dealloc;
- (void)onlyEmbeddingResults;
@end

@implementation CSL1CandidateQueue

- (void)dealloc
{
  sparseQueue = self->_sparseQueue;
  if (sparseQueue) {
    CFRelease(sparseQueue);
  }
  denseQueue = self->_denseQueue;
  if (denseQueue) {
    CFRelease(denseQueue);
  }
  hybridQueue = self->_hybridQueue;
  if (hybridQueue) {
    CFRelease(hybridQueue);
  }
  scoreQueue = self->_scoreQueue;
  if (scoreQueue) {
    CFRelease(scoreQueue);
  }
  v7.receiver = self;
  v7.super_class = (Class)CSL1CandidateQueue;
  [(CSL1CandidateQueue *)&v7 dealloc];
}

- (void)onlyEmbeddingResults
{
  if (result)
  {
    if (result[1] || result[3]) {
      return 0;
    }
    else {
      return (void *)(result[2] != 0);
    }
  }
  return result;
}

- (id)getAllItemsAndClearHeap
{
  if (a1)
  {
    v2 = objc_opt_new();
    v3 = a1[1];
    if (v3)
    {
      CFIndex Count = CFBinaryHeapGetCount(a1[1]);
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
    objc_super v7 = a1[2];
    if (v7)
    {
      CFIndex v8 = CFBinaryHeapGetCount(a1[2]);
      if (v8 >= 1)
      {
        CFIndex v9 = v8;
        do
        {
          v10 = CFBinaryHeapGetMinimum(v7);
          CFBinaryHeapRemoveMinimumValue(v7);
          [v2 addObject:v10];

          --v9;
        }
        while (v9);
      }
    }
    v11 = a1[3];
    if (v11)
    {
      CFIndex v12 = CFBinaryHeapGetCount(a1[3]);
      if (v12 >= 1)
      {
        CFIndex v13 = v12;
        do
        {
          v14 = CFBinaryHeapGetMinimum(v11);
          CFBinaryHeapRemoveMinimumValue(v11);
          [v2 addObject:v14];

          --v13;
        }
        while (v13);
      }
    }
    v15 = a1[4];
    if (v15)
    {
      CFIndex v16 = CFBinaryHeapGetCount(v15);
      if (v16 >= 1)
      {
        CFIndex v17 = v16;
        do
        {
          v18 = CFBinaryHeapGetMinimum(v15);
          CFBinaryHeapRemoveMinimumValue(v15);
          [v2 addObject:v18];

          --v17;
        }
        while (v17);
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