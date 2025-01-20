@interface _BlastDoorDrawingStroke
+ (id)createBDStroke:(id)a3;
- (NSMutableArray)strokePoints;
- (_BlastDoorDrawingStroke)init;
- (id)createDKStroke:(id)a3;
@end

@implementation _BlastDoorDrawingStroke

- (_BlastDoorDrawingStroke)init
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)_BlastDoorDrawingStroke;
  v2 = [(_BlastDoorDrawingStroke *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    strokePoints = v2->_strokePoints;
    v2->_strokePoints = (NSMutableArray *)v3;
  }
  return v2;
}

- (id)createDKStroke:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  v4 = (void *)getDKDrawingStrokeClass_softClass;
  uint64_t v18 = getDKDrawingStrokeClass_softClass;
  if (!getDKDrawingStrokeClass_softClass)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __getDKDrawingStrokeClass_block_invoke;
    v14[3] = &unk_1E5FF6880;
    v14[4] = &v15;
    __getDKDrawingStrokeClass_block_invoke((uint64_t)v14);
    v4 = (void *)v16[3];
  }
  v5 = v4;
  _Block_object_dispose(&v15, 8);
  objc_super v6 = (void *)[[v5 alloc] init];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = [*(id *)(*((void *)&v20 + 1) + 8 * i) createDKStrokePoint];
        v12 = [v6 strokePoints];
        [v12 addObject:v11];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v19 count:16];
    }
    while (v8);
  }

  return v6;
}

+ (id)createBDStroke:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_alloc_init(_BlastDoorDrawingStroke);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = [v3 strokePoints];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = objc_alloc_init(_BlastDoorDrawingStrokePoint);
        [v10 location];
        -[_BlastDoorDrawingStrokePoint setLocation:](v11, "setLocation:");
        [v10 force];
        -[_BlastDoorDrawingStrokePoint setForce:](v11, "setForce:");
        [v10 velocity];
        -[_BlastDoorDrawingStrokePoint setVelocity:](v11, "setVelocity:");
        v12 = [(_BlastDoorDrawingStroke *)v4 strokePoints];
        [v12 addObject:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v14 count:16];
    }
    while (v7);
  }

  return v4;
}

- (NSMutableArray)strokePoints
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end