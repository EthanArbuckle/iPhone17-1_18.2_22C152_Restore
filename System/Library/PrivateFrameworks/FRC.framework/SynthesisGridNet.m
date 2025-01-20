@interface SynthesisGridNet
- (BOOL)synthesizeFrameFromFeatureForward:(id *)a3 backward:(id *)a4 destination:(__CVBuffer *)a5 pyramidStartLevel:(unint64_t)a6 callback:(id)a7;
- (SynthesisGridNet)initWithMode:(int64_t)a3;
- (void)dealloc;
@end

@implementation SynthesisGridNet

- (SynthesisGridNet)initWithMode:(int64_t)a3
{
  uint64_t v12 = 0;
  unint64_t v13 = 0;
  FRCGetInputFrameSizeForUsage(a3, (uint64_t *)&v13, &v12);
  if (v13 <= 0x3E8) {
    v5 = @"synthesis_net_GridNet_pyrlite";
  }
  else {
    v5 = @"synthesis_net_GridNet_pyrlite_HD";
  }
  v6 = [NSString stringWithFormat:v5];
  v11.receiver = self;
  v11.super_class = (Class)SynthesisGridNet;
  v7 = [(EspressoModel *)&v11 initWithModelName:v6 usage:a3];
  v8 = v7;
  if (v7) {
    v9 = v7;
  }

  return v8;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)SynthesisGridNet;
  [(EspressoModel *)&v2 dealloc];
}

- (BOOL)synthesizeFrameFromFeatureForward:(id *)a3 backward:(id *)a4 destination:(__CVBuffer *)a5 pyramidStartLevel:(unint64_t)a6 callback:(id)a7
{
  id v8 = a7;
  uint64_t v9 = 0;
  v10 = off_1E6CA44E0;
  do
  {
    if (espresso_network_bind_cvpixelbuffer() || espresso_network_bind_cvpixelbuffer())
    {
      NSLog(&cfstr_GridnetErrorFa.isa);
      goto LABEL_8;
    }
    v9 += 8;
    v10 += 2;
  }
  while (v9 != 24);
  if (espresso_network_bind_cvpixelbuffer())
  {
    NSLog(&cfstr_GridnetErrorFa_0.isa);
LABEL_8:
    BOOL v11 = 0;
    goto LABEL_9;
  }
  kdebug_trace();
  if (v8)
  {
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __102__SynthesisGridNet_synthesizeFrameFromFeatureForward_backward_destination_pyramidStartLevel_callback___block_invoke;
    v18 = &unk_1E6CA4238;
    id v19 = v8;
    int v13 = espresso_plan_submit();

    if (v13)
    {
LABEL_12:
      NSLog(&cfstr_GridnetErrorNe.isa, [(EspressoModel *)self usage], v15, v16, v17, v18);
      goto LABEL_8;
    }
  }
  else
  {
    int v14 = espresso_plan_execute_sync();
    kdebug_trace();
    if (v14) {
      goto LABEL_12;
    }
  }
  BOOL v11 = 1;
LABEL_9:

  return v11;
}

uint64_t __102__SynthesisGridNet_synthesizeFrameFromFeatureForward_backward_destination_pyramidStartLevel_callback___block_invoke(uint64_t a1)
{
  kdebug_trace();
  objc_super v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v2();
}

@end