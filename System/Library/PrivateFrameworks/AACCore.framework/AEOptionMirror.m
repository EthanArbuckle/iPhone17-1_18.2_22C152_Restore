@interface AEOptionMirror
+ (id)flippedOptionMapWithMap:(uint64_t)a1;
+ (uint64_t)clearMaskWithNumbers:(uint64_t)a1;
+ (uint64_t)destinationOptionsFromSource:(void *)a3 destinationOptionsBySource:;
- (AEOptionMirror)initWithMirroredOptions:(id)a3;
- (int64_t)leftClearMask;
- (int64_t)leftOptionsFromRight:(int64_t)a3;
- (int64_t)rightClearMask;
- (int64_t)rightOptionsFromLeft:(int64_t)a3;
@end

@implementation AEOptionMirror

- (AEOptionMirror)initWithMirroredOptions:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AEOptionMirror;
  v5 = [(AEOptionMirror *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    rightOptionsByLeft = v5->_rightOptionsByLeft;
    v5->_rightOptionsByLeft = (NSDictionary *)v6;

    uint64_t v8 = +[AEOptionMirror flippedOptionMapWithMap:]((uint64_t)AEOptionMirror, v4);
    leftOptionsByRight = v5->_leftOptionsByRight;
    v5->_leftOptionsByRight = (NSDictionary *)v8;
  }
  return v5;
}

+ (id)flippedOptionMapWithMap:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = objc_opt_new();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__AEOptionMirror_flippedOptionMapWithMap___block_invoke;
  v6[3] = &unk_264EA3B90;
  v6[4] = v3;
  [v2 enumerateKeysAndObjectsUsingBlock:v6];

  id v4 = (void *)[v3 copy];
  return v4;
}

- (int64_t)leftOptionsFromRight:(int64_t)a3
{
  if (self) {
    leftOptionsByRight = self->_leftOptionsByRight;
  }
  else {
    leftOptionsByRight = 0;
  }
  return +[AEOptionMirror destinationOptionsFromSource:destinationOptionsBySource:]((uint64_t)AEOptionMirror, a3, leftOptionsByRight);
}

+ (uint64_t)destinationOptionsFromSource:(void *)a3 destinationOptionsBySource:
{
  id v4 = a3;
  self;
  if (a2 < 1)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v6 = 1;
    do
    {
      if ((v6 & a2) != 0)
      {
        v7 = [NSNumber numberWithInteger:v6 & a2];
        uint64_t v8 = [v4 objectForKeyedSubscript:v7];
        v5 |= [v8 integerValue];
      }
      a2 &= ~v6;
      v6 *= 2;
    }
    while (a2);
  }

  return v5;
}

- (int64_t)rightOptionsFromLeft:(int64_t)a3
{
  if (self) {
    rightOptionsByLeft = self->_rightOptionsByLeft;
  }
  else {
    rightOptionsByLeft = 0;
  }
  return +[AEOptionMirror destinationOptionsFromSource:destinationOptionsBySource:]((uint64_t)AEOptionMirror, a3, rightOptionsByLeft);
}

- (int64_t)leftClearMask
{
  if (self) {
    self = (AEOptionMirror *)self->_leftOptionsByRight;
  }
  id v2 = [(AEOptionMirror *)self allValues];
  int64_t v3 = +[AEOptionMirror clearMaskWithNumbers:]((uint64_t)AEOptionMirror, v2);

  return v3;
}

+ (uint64_t)clearMaskWithNumbers:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = a2;
  self;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 |= objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v8++), "integerValue", (void)v11);
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
    uint64_t v9 = ~v6;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

- (int64_t)rightClearMask
{
  if (self) {
    self = (AEOptionMirror *)self->_rightOptionsByLeft;
  }
  id v2 = [(AEOptionMirror *)self allValues];
  int64_t v3 = +[AEOptionMirror clearMaskWithNumbers:]((uint64_t)AEOptionMirror, v2);

  return v3;
}

uint64_t __42__AEOptionMirror_flippedOptionMapWithMap___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leftOptionsByRight, 0);
  objc_storeStrong((id *)&self->_rightOptionsByLeft, 0);
}

@end