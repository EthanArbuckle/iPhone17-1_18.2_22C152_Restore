@interface _BlastDoorDrawing
+ (id)createDrawing:(id)a3 frame:(CGRect)a4 bound:(CGRect)a5;
+ (id)decodeDrawingStrokes:(id)a3;
@end

@implementation _BlastDoorDrawing

+ (id)createDrawing:(id)a3 frame:(CGRect)a4 bound:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v9 = a4.size.height;
  double v10 = a4.size.width;
  double v11 = a4.origin.y;
  double v12 = a4.origin.x;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  v14 = (void *)getDKDrawingClass_softClass;
  uint64_t v29 = getDKDrawingClass_softClass;
  if (!getDKDrawingClass_softClass)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __getDKDrawingClass_block_invoke;
    v25[3] = &unk_1E5FF6880;
    v25[4] = &v26;
    __getDKDrawingClass_block_invoke((uint64_t)v25);
    v14 = (void *)v27[3];
  }
  v15 = v14;
  _Block_object_dispose(&v26, 8);
  v16 = (void *)[[v15 alloc] init];
  objc_msgSend(v16, "setStrokesFrame:", v12, v11, v10, v9);
  objc_msgSend(v16, "setCanvasBounds:", x, y, width, height);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v17 = v13;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v30 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v32 != v19) {
          objc_enumerationMutation(v17);
        }
        v21 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v22 = [v21 strokePoints];
        v23 = [v21 createDKStroke:v22];

        [v16 addBrushStroke:v23];
      }
      uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v30 count:16];
    }
    while (v18);
  }

  return v16;
}

+ (id)decodeDrawingStrokes:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [v3 strokes];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = +[_BlastDoorDrawingStroke createBDStroke:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v12 count:16];
    }
    while (v7);
  }

  return v4;
}

@end