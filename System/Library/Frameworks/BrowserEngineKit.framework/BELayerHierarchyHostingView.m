@interface BELayerHierarchyHostingView
+ (Class)layerClass;
- (BELayerHierarchyHandle)handle;
- (void)setHandle:(id)a3;
@end

@implementation BELayerHierarchyHostingView

- (BELayerHierarchyHandle)handle
{
  BSDispatchQueueAssertMain();
  handle = self->_handle;

  return handle;
}

- (void)setHandle:(id)a3
{
  id v11 = a3;
  BSDispatchQueueAssertMain();
  v5 = self->_visibility;
  v6 = [(BELayerHierarchyHostingView *)self layer];
  if (v11)
  {
    [v6 setContextId:-[BELayerHierarchyHandle _contextID]((uint64_t)v11)];
    handle = self->_handle;
    if (handle
      && (int v8 = -[BELayerHierarchyHandle _pid]((uint64_t)handle),
          v8 == -[BELayerHierarchyHandle _pid]((uint64_t)v11)))
    {
      v9 = v5;
    }
    else
    {
      v9 = [MEMORY[0x263F83168] interactionWithPID:-[BELayerHierarchyHandle _pid]((uint64_t)v11) environmentIdentifier:@"BEHostingVisibilitySink"];
    }
    v10 = v9;
  }
  else
  {
    [v6 setContextId:0];
    v10 = 0;
  }
  objc_storeStrong((id *)&self->_handle, a3);
  if (v10 != v5)
  {
    objc_storeStrong((id *)&self->_visibility, v10);
    if (v10) {
      [(BELayerHierarchyHostingView *)self addInteraction:v10];
    }
    if (v5) {
      [(BELayerHierarchyHostingView *)self removeInteraction:v5];
    }
  }
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibility, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

@end