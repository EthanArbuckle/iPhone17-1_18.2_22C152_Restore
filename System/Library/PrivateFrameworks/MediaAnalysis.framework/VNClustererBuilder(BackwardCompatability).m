@interface VNClustererBuilder(BackwardCompatability)
- (id)vcp_updateModelByAddingFaces:()BackwardCompatability error:;
@end

@implementation VNClustererBuilder(BackwardCompatability)

- (id)vcp_updateModelByAddingFaces:()BackwardCompatability error:
{
  id v6 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [a1 updateModelByAddingFaces:v6 andRemovingFaces:0 canceller:0 error:a4];
LABEL_5:
    v8 = (void *)v7;
    goto LABEL_7;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [a1 updateModelByAddingFaces:v6 error:a4];
    goto LABEL_5;
  }
  v8 = 0;
LABEL_7:

  return v8;
}

@end