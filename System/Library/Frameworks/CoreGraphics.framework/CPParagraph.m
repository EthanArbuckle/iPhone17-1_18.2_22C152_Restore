@interface CPParagraph
- (BOOL)below;
- (BOOL)hasDropCap;
- (BOOL)isBoxRegion;
- (BOOL)isGraphicalRegion;
- (BOOL)isImageRegion;
- (BOOL)isListItemRegion;
- (BOOL)isParagraphRegion;
- (BOOL)isPreformattedWithUnitWidth:(double *)a3;
- (BOOL)isRowRegion;
- (BOOL)isShapeRegion;
- (BOOL)isTextRegion;
- (BOOL)noIndentation;
- (CGRect)bounds;
- (CGRect)reducedBounds;
- (CPParagraph)init;
- (CPParagraphListItem)listItem;
- (double)selectionBottom;
- (id)copyWithZone:(_NSZone *)a3;
- (id)flowProperties;
- (unint64_t)alignment;
- (unint64_t)index;
- (void)accept:(id)a3;
- (void)dealloc;
- (void)explode;
- (void)setAlignment:(unint64_t)a3;
- (void)setBelow:(BOOL)a3;
- (void)setFlowProperties:(id)a3;
- (void)setHasDropCap:(BOOL)a3;
- (void)setListItem:(id)a3;
- (void)setNoIndentation:(BOOL)a3;
@end

@implementation CPParagraph

- (void)setListItem:(id)a3
{
}

- (CPParagraphListItem)listItem
{
  return (CPParagraphListItem *)self->flowProperties;
}

- (CGRect)bounds
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  children = self->super.super.super.super.children;
  uint64_t v3 = [(NSMutableArray *)children countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v23;
    CGFloat height = 0.0;
    CGFloat y = INFINITY;
    CGFloat width = 0.0;
    CGFloat x = INFINITY;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(children);
        }
        v11 = (void *)[*(id *)(*((void *)&v22 + 1) + 8 * i) charSequence];
        if ([v11 length])
        {
          uint64_t v12 = 0;
          do
          {
            uint64_t v13 = [v11 charAtIndex:v12];
            __double2 v14 = __sincos_stret(*(double *)(v13 + 168) * 0.0174532925);
            CGFloat v15 = *(double *)v13;
            CGFloat v16 = *(double *)(v13 + 8);
            v28.size.CGFloat width = *(CGFloat *)(v13 + 16);
            v28.size.CGFloat height = *(CGFloat *)(v13 + 24);
            v21.a = v14.__cosval;
            v21.b = v14.__sinval;
            v21.c = -v14.__sinval;
            v21.d = v14.__cosval;
            v21.tCGFloat x = 0.0;
            v21.tCGFloat y = 0.0;
            v28.origin.CGFloat x = v15;
            v28.origin.CGFloat y = v16;
            CGRect v32 = CGRectApplyAffineTransform(v28, &v21);
            v29.origin.CGFloat x = x;
            v29.origin.CGFloat y = y;
            v29.size.CGFloat width = width;
            v29.size.CGFloat height = height;
            CGRect v30 = CGRectUnion(v29, v32);
            CGFloat x = v30.origin.x;
            CGFloat y = v30.origin.y;
            CGFloat width = v30.size.width;
            CGFloat height = v30.size.height;
            uint64_t v12 = (v12 + 1);
          }
          while (v12 < [v11 length]);
        }
      }
      uint64_t v4 = [(NSMutableArray *)children countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v4);
  }
  else
  {
    CGFloat height = 0.0;
    CGFloat y = INFINITY;
    CGFloat width = 0.0;
    CGFloat x = INFINITY;
  }
  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (BOOL)isPreformattedWithUnitWidth:(double *)a3
{
  if (a3) {
    *a3 = *(double *)&self->listItem;
  }
  if (*(double *)&self->listItem == 0.0)
  {
    uint64_t v6 = [(NSMutableArray *)self->super.super.super.super.children count];
    if (v6)
    {
      uint64_t v7 = 0;
      while (1)
      {
        v8 = (void *)[(NSMutableArray *)self->super.super.super.super.children objectAtIndex:v7];
        int v5 = [v8 isMonospaced];
        if (!v5) {
          break;
        }
        if ([v8 inlineCount]) {
          goto LABEL_23;
        }
        if (v6 == ++v7)
        {
          uint64_t v9 = 0;
          uint64_t v10 = 0;
          unsigned int v11 = 0;
          double v12 = 0.0;
          while (1)
          {
            uint64_t v13 = (void *)[(NSMutableArray *)self->super.super.super.super.children objectAtIndex:v9];
            uint64_t v26 = 0;
            if (![v13 styleIsUniform:&v26 styleFlags:3072]) {
              goto LABEL_23;
            }
            uint64_t v14 = v26;
            if (v10)
            {
              if (v10 == v26)
              {
                uint64_t v14 = v10;
              }
              else
              {
                if (!v26 || *(double *)(v10 + 72) != *(double *)(v26 + 72)) {
                  goto LABEL_23;
                }
                CGFloat v15 = *(void **)(v10 + 64);
                if (v15 != *(void **)(v26 + 64))
                {
                  if (!objc_msgSend(v15, "isSameFontAs:")) {
                    goto LABEL_23;
                  }
                  uint64_t v14 = v26;
                }
              }
            }
            unsigned int v16 = objc_msgSend((id)objc_msgSend(v13, "charSequence"), "length");
            if (!v16) {
              goto LABEL_23;
            }
            unsigned int v17 = v16;
            double v18 = (double)v16;
            [v13 monospaceWidth];
            double v12 = v12 + v18 * v19;
            v11 += v17;
            ++v9;
            uint64_t v10 = v14;
            if (v6 == v9)
            {
              if (v11 >= 0xC)
              {
                uint64_t v20 = 0;
                double v21 = v12 / (double)v11;
                while (1)
                {
                  long long v22 = (void *)[(NSMutableArray *)self->super.super.super.super.children objectAtIndex:v20];
                  double v23 = (double)objc_msgSend((id)objc_msgSend(v22, "charSequence"), "length");
                  [v22 monospaceWidth];
                  if (vabdd_f64(v24, v21) * v23 > v21 * 0.0625 + v21 * 0.0625) {
                    break;
                  }
                  if (v6 == ++v20)
                  {
                    *(double *)&self->listItem = v21;
                    if (a3) {
                      *a3 = v21;
                    }
                    goto LABEL_4;
                  }
                }
              }
              goto LABEL_23;
            }
          }
        }
      }
    }
    else
    {
LABEL_23:
      LOBYTE(v5) = 0;
    }
  }
  else
  {
LABEL_4:
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (void)setAlignment:(unint64_t)a3
{
  *(void *)&self->noIndentation = a3;
}

- (unint64_t)alignment
{
  return *(void *)&self->noIndentation;
}

- (BOOL)below
{
  return *(&self->super.dirtyNormalizedBounds + 2);
}

- (void)setBelow:(BOOL)a3
{
  *(&self->super.dirtyNormalizedBounds + 2) = a3;
}

- (double)selectionBottom
{
  double v3 = 0.0;
  if ([(CPObject *)self count])
  {
    id v4 = [(CPObject *)self lastChild];
    if (v4)
    {
      [v4 bounds];
      double v3 = v6;
      if (v7 < 0.0 || v8 < 0.0)
      {
        CGRect v10 = CGRectStandardize(*(CGRect *)&v5);
        return v10.origin.y;
      }
    }
  }
  return v3;
}

- (CGRect)reducedBounds
{
  [(CPParagraph *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  objc_msgSend(-[CPObject lastChild](self, "lastChild"), "baseline");
  double v12 = v11;
  double v13 = v10 - (v6 - v11);
  double v14 = v4;
  double v15 = v8;
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v14;
  return result;
}

- (void)explode
{
  id v3 = [(CPObject *)self childrenOfClass:objc_opt_class()];
  if ((unint64_t)[v3 count] >= 2 && objc_msgSend(v3, "count"))
  {
    unint64_t v4 = 0;
    do
    {
      uint64_t v5 = [v3 objectAtIndex:v4];
      if (v4)
      {
        uint64_t v6 = v5;
        double v7 = objc_alloc_init(CPParagraph);
        [(CPParagraph *)v7 setAlignment:*(void *)&self->noIndentation];
        objc_msgSend(-[CPObject parent](self, "parent"), "add:", v7);
        [(CPChunk *)v7 add:v6];
      }
      ++v4;
    }
    while ([v3 count] > v4);
  }
}

- (void)setHasDropCap:(BOOL)a3
{
  LOBYTE(self->alignment) = a3;
}

- (BOOL)hasDropCap
{
  return self->alignment;
}

- (BOOL)noIndentation
{
  return *(&self->super.dirtyNormalizedBounds + 1);
}

- (void)setNoIndentation:(BOOL)a3
{
  *(&self->super.dirtyNormalizedBounds + 1) = a3;
}

- (BOOL)isShapeRegion
{
  return 0;
}

- (BOOL)isImageRegion
{
  return 0;
}

- (BOOL)isRowRegion
{
  return 0;
}

- (BOOL)isGraphicalRegion
{
  return 0;
}

- (BOOL)isBoxRegion
{
  return 0;
}

- (BOOL)isTextRegion
{
  return 1;
}

- (unint64_t)index
{
  id v3 = [(CPObject *)self->super.super.super.super.parent children];

  return [v3 indexOfObject:self];
}

- (BOOL)isListItemRegion
{
  return self->flowProperties != 0;
}

- (BOOL)isParagraphRegion
{
  return self->flowProperties == 0;
}

- (void)accept:(id)a3
{
}

- (void)setFlowProperties:(id)a3
{
  *(void *)&self->hasDropCap = a3;
}

- (id)flowProperties
{
  return *(id *)&self->hasDropCap;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CPParagraph;
  id result = [(CPRegion *)&v4 copyWithZone:a3];
  *((void *)result + 24) = 0;
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CPParagraph;
  [(CPRegion *)&v3 dealloc];
}

- (CPParagraph)init
{
  v3.receiver = self;
  v3.super_class = (Class)CPParagraph;
  id result = [(CPRotatedRegion *)&v3 init];
  if (result)
  {
    result->super.super.isTextRegion = 1;
    LOBYTE(result->alignment) = 0;
    *(void *)&result->hasDropCap = 0;
  }
  return result;
}

@end