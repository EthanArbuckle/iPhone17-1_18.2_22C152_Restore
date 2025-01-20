@interface AXUIContextDrawingAnnotation
+ (id)annotationsForContext:(CGContext *)a3;
+ (id)contextAnnotationMap;
+ (void)addLabel:(id)a3 boundingRect:(CGRect)a4 withContext:(CGContext *)a5;
- (AXUIContextDrawingAnnotation)initWithLabel:(id)a3 boundingRect:(CGRect)a4;
- (CGRect)boundingRect;
- (NSString)label;
- (id)description;
@end

@implementation AXUIContextDrawingAnnotation

void __66__AXUIContextDrawingAnnotation_addLabel_boundingRect_withContext___block_invoke(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v2 removeObject:*(void *)(a1 + 48)];

  v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = [v3 count];

  if (!v4) {
    [*(id *)(a1 + 32) removeObjectForKey:*(void *)(a1 + 40)];
  }
  objc_sync_exit(obj);
}

+ (void)addLabel:(id)a3 boundingRect:(CGRect)a4 withContext:(CGContext *)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  if (a5)
  {
    v12 = [MEMORY[0x1E4F29238] valueWithPointer:a5];
    v13 = -[AXUIContextDrawingAnnotation initWithLabel:boundingRect:]([AXUIContextDrawingAnnotation alloc], "initWithLabel:boundingRect:", v11, x, y, width, height);
    id v14 = [a1 contextAnnotationMap];
    objc_sync_enter(v14);
    v15 = [v14 objectForKeyedSubscript:v12];

    if (!v15)
    {
      v16 = [MEMORY[0x1E4F1CA48] array];
      [v14 setObject:v16 forKeyedSubscript:v12];
    }
    v17 = [v14 objectForKeyedSubscript:v12];
    [v17 addObject:v13];

    id v18 = v14;
    id v19 = v12;
    v20 = v13;
    AXPerformBlockOnMainThreadAfterDelay();

    objc_sync_exit(v18);
  }
}

+ (id)annotationsForContext:(CGContext *)a3
{
  if (a3)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithPointer:");
    id v5 = [a1 contextAnnotationMap];
    objc_sync_enter(v5);
    v6 = [v5 objectForKey:v4];
    v7 = (void *)[v6 copy];

    if (v7) {
      [v5 removeObjectForKey:v4];
    }
    objc_sync_exit(v5);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)contextAnnotationMap
{
  if (contextAnnotationMap_onceToken != -1) {
    dispatch_once(&contextAnnotationMap_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)contextAnnotationMap___axContextAnnotationMap;
  return v2;
}

- (AXUIContextDrawingAnnotation)initWithLabel:(id)a3 boundingRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AXUIContextDrawingAnnotation;
  id v11 = [(AXUIContextDrawingAnnotation *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_label, a3);
    v12->_boundingRect.origin.CGFloat x = x;
    v12->_boundingRect.origin.CGFloat y = y;
    v12->_boundingRect.size.CGFloat width = width;
    v12->_boundingRect.size.CGFloat height = height;
  }

  return v12;
}

- (void).cxx_destruct
{
}

uint64_t __52__AXUIContextDrawingAnnotation_contextAnnotationMap__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v1 = contextAnnotationMap___axContextAnnotationMap;
  contextAnnotationMap___axContextAnnotationMap = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)AXUIContextDrawingAnnotation;
  uint64_t v4 = [(AXUIContextDrawingAnnotation *)&v9 description];
  id v5 = [(AXUIContextDrawingAnnotation *)self label];
  [(AXUIContextDrawingAnnotation *)self boundingRect];
  v6 = NSStringFromCGRect(v11);
  v7 = [v3 stringWithFormat:@"%@, label=%@, boundingRect=%@", v4, v5, v6];

  return v7;
}

- (NSString)label
{
  return self->_label;
}

- (CGRect)boundingRect
{
  double x = self->_boundingRect.origin.x;
  double y = self->_boundingRect.origin.y;
  double width = self->_boundingRect.size.width;
  double height = self->_boundingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end