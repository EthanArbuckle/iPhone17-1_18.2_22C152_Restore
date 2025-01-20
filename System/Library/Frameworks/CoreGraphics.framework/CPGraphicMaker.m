@interface CPGraphicMaker
+ (void)combineShapesIn:(id)a3;
+ (void)makeCombinedShapesIn:(id)a3;
@end

@implementation CPGraphicMaker

+ (void)makeCombinedShapesIn:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [a3 childrenOfClass:objc_opt_class() into:v4];
  +[CPGraphicMaker combineShapesIn:v4];
}

+ (void)combineShapesIn:(id)a3
{
  [a3 sortUsingSelector:sel_compareInsertionOrder_];
  if ((unint64_t)[a3 count] >= 2)
  {
    unint64_t v4 = 2;
    while (1)
    {
      v5 = (void *)[a3 objectAtIndex:v4 - 2];
      v6 = (void *)[a3 objectAtIndex:v4 - 1];
      int v7 = [v5 insertionOrder];
      int v8 = [v6 insertionOrder];
      if (v8 == v7 || v7 + 1 == v8)
      {
        if ([v6 hasFill]) {
          int v10 = [v6 hasStroke];
        }
        else {
          int v10 = 0;
        }
        int v11 = [v5 hasFill];
        int v12 = [v5 hasStroke];
        int v13 = [v6 hasFill];
        char v14 = [v6 hasStroke];
        if (v11 && (v14 & 1) != 0)
        {
          if ((v10 & 1) == 0) {
            goto LABEL_16;
          }
          int v10 = 1;
        }
        else if (((v13 & v12 ^ 1 | v10) & 1) == 0)
        {
LABEL_16:
          [v6 left];
          double v16 = v15;
          [v5 left];
          if (v16 == v17 && [v6 canCombineWith:v5])
          {
            [v5 addShape:v6];
            [a3 removeObjectAtIndex:v4 - 1];
          }
        }
      }
      else
      {
        int v10 = 0;
      }
      if ([a3 count] > v4)
      {
        ++v4;
        if (!v10) {
          continue;
        }
      }
      return;
    }
  }
}

@end