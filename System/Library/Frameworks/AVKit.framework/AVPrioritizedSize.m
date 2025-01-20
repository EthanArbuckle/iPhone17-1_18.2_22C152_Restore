@interface AVPrioritizedSize
+ (id)sizesResolvingFirstPrioritizedSize:(id)a3 secondPrioritizedSize:(id)a4 inAvailableWidth:(double)a5;
- (AVPrioritizedSize)init;
- (CGSize)currentTotalSize;
- (NSMutableArray)highPrioritySizes;
- (NSMutableArray)lowPrioritySizes;
- (NSMutableArray)mediumPrioritySizes;
- (NSMutableArray)requiredPrioritySizes;
- (NSMutableArray)veryHighPrioritySizes;
- (id)removeLastSizeOfPriority:(unint64_t)a3;
- (void)addSize:(CGSize)a3 withPriority:(unint64_t)a4;
- (void)setCurrentTotalSize:(CGSize)a3;
- (void)setHighPrioritySizes:(id)a3;
- (void)setLowPrioritySizes:(id)a3;
- (void)setMediumPrioritySizes:(id)a3;
- (void)setRequiredPrioritySizes:(id)a3;
- (void)setVeryHighPrioritySizes:(id)a3;
@end

@implementation AVPrioritizedSize

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowPrioritySizes, 0);
  objc_storeStrong((id *)&self->_mediumPrioritySizes, 0);
  objc_storeStrong((id *)&self->_highPrioritySizes, 0);
  objc_storeStrong((id *)&self->_veryHighPrioritySizes, 0);

  objc_storeStrong((id *)&self->_requiredPrioritySizes, 0);
}

- (void)setLowPrioritySizes:(id)a3
{
}

- (NSMutableArray)lowPrioritySizes
{
  return self->_lowPrioritySizes;
}

- (void)setMediumPrioritySizes:(id)a3
{
}

- (NSMutableArray)mediumPrioritySizes
{
  return self->_mediumPrioritySizes;
}

- (void)setHighPrioritySizes:(id)a3
{
}

- (NSMutableArray)highPrioritySizes
{
  return self->_highPrioritySizes;
}

- (void)setVeryHighPrioritySizes:(id)a3
{
}

- (NSMutableArray)veryHighPrioritySizes
{
  return self->_veryHighPrioritySizes;
}

- (void)setRequiredPrioritySizes:(id)a3
{
}

- (NSMutableArray)requiredPrioritySizes
{
  return self->_requiredPrioritySizes;
}

- (void)setCurrentTotalSize:(CGSize)a3
{
  self->_currentTotalSize = a3;
}

- (CGSize)currentTotalSize
{
  double width = self->_currentTotalSize.width;
  double height = self->_currentTotalSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)removeLastSizeOfPriority:(unint64_t)a3
{
  v5 = [(AVPrioritizedSize *)self lowPrioritySizes];
  switch(a3)
  {
    case 0uLL:
      uint64_t v6 = [(AVPrioritizedSize *)self lowPrioritySizes];
      goto LABEL_7;
    case 1uLL:
      uint64_t v6 = [(AVPrioritizedSize *)self mediumPrioritySizes];
      goto LABEL_7;
    case 2uLL:
      uint64_t v6 = [(AVPrioritizedSize *)self highPrioritySizes];
      goto LABEL_7;
    case 3uLL:
      uint64_t v6 = [(AVPrioritizedSize *)self veryHighPrioritySizes];
      goto LABEL_7;
    case 4uLL:
      uint64_t v6 = [(AVPrioritizedSize *)self requiredPrioritySizes];
LABEL_7:
      v7 = (void *)v6;

      v5 = v7;
      break;
    default:
      break;
  }
  v8 = [v5 lastObject];
  if (v8)
  {
    objc_msgSend(v5, "removeObjectAtIndex:", objc_msgSend(v5, "count") - 1);
    [v8 sizeValue];
    double v10 = v9;
    [(AVPrioritizedSize *)self currentTotalSize];
    double v12 = v11 - v10;
    [(AVPrioritizedSize *)self currentTotalSize];
    [(AVPrioritizedSize *)self setCurrentTotalSize:v12];
  }

  return v8;
}

- (void)addSize:(CGSize)a3 withPriority:(unint64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  [(AVPrioritizedSize *)self currentTotalSize];
  double v9 = width + v8;
  [(AVPrioritizedSize *)self currentTotalSize];
  BOOL v11 = v10 == 0.0;
  double v12 = height;
  if (!v11)
  {
    [(AVPrioritizedSize *)self currentTotalSize];
    if (v12 >= height) {
      double v12 = height;
    }
  }
  -[AVPrioritizedSize setCurrentTotalSize:](self, "setCurrentTotalSize:", v9, v12);
  v13 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:", width, height);
  id v16 = v13;
  switch(a4)
  {
    case 0uLL:
      v14 = [(AVPrioritizedSize *)self lowPrioritySizes];
      goto LABEL_10;
    case 1uLL:
      v14 = [(AVPrioritizedSize *)self mediumPrioritySizes];
      goto LABEL_10;
    case 2uLL:
      v14 = [(AVPrioritizedSize *)self highPrioritySizes];
      goto LABEL_10;
    case 3uLL:
      v14 = [(AVPrioritizedSize *)self veryHighPrioritySizes];
      goto LABEL_10;
    case 4uLL:
      v14 = [(AVPrioritizedSize *)self requiredPrioritySizes];
LABEL_10:
      v15 = v14;
      [v14 addObject:v16];

      v13 = v16;
      break;
    default:
      break;
  }
}

- (AVPrioritizedSize)init
{
  v14.receiver = self;
  v14.super_class = (Class)AVPrioritizedSize;
  v2 = [(AVPrioritizedSize *)&v14 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    requiredPrioritySizes = v2->_requiredPrioritySizes;
    v2->_requiredPrioritySizes = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    veryHighPrioritySizes = v2->_veryHighPrioritySizes;
    v2->_veryHighPrioritySizes = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    highPrioritySizes = v2->_highPrioritySizes;
    v2->_highPrioritySizes = v7;

    double v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    mediumPrioritySizes = v2->_mediumPrioritySizes;
    v2->_mediumPrioritySizes = v9;

    BOOL v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    lowPrioritySizes = v2->_lowPrioritySizes;
    v2->_lowPrioritySizes = v11;

    v2->_currentTotalSize = (CGSize)*MEMORY[0x1E4F1DB30];
  }
  return v2;
}

+ (id)sizesResolvingFirstPrioritizedSize:(id)a3 secondPrioritizedSize:(id)a4 inAvailableWidth:(double)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  double v9 = [MEMORY[0x1E4F1CA48] array];
  [v7 currentTotalSize];
  double v11 = v10;
  [v8 currentTotalSize];
  double v13 = v11 + v12;
  if (v13 > a5)
  {
    id v14 = v7;
    unint64_t v15 = 0;
    id v16 = v14;
    do
    {
      v17 = [v16 removeLastSizeOfPriority:v15];
      v18 = v17;
      if (v17)
      {
        [v17 sizeValue];
        double v13 = v13 - v19;
      }
      else if (v16 == v14)
      {
        id v16 = v8;
      }
      else
      {
        ++v15;
        id v20 = v14;

        id v16 = v20;
      }
    }
    while (v13 > a5 && v15 < 5);
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v35[0] = v7;
  v35[1] = v8;
  v22 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v35, 2, 0);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v32 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = (void *)MEMORY[0x1E4F29238];
        [*(id *)(*((void *)&v31 + 1) + 8 * i) currentTotalSize];
        v28 = objc_msgSend(v27, "valueWithSize:");
        [v9 addObject:v28];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v24);
  }

  v29 = (void *)[v9 copy];

  return v29;
}

@end