@interface FlowAdaptationDecoder
- (BOOL)bindCVPixelBuffers:(__CVBuffer *)a3 correlation:(__CVBuffer *)a4 flow:(__CVBuffer *)a5 output:(__CVBuffer *)a6;
- (BOOL)estimateFlow:(__CVBuffer *)a3 correlation:(__CVBuffer *)a4 flow:(__CVBuffer *)a5 output:(__CVBuffer *)a6 callback:(id)a7;
- (FlowAdaptationDecoder)initWithMode:(int64_t)a3;
- (FlowAdaptationDecoder)initWithMode:(int64_t)a3 revision:(int64_t)a4;
- (void)setupNetworkModel;
@end

@implementation FlowAdaptationDecoder

- (FlowAdaptationDecoder)initWithMode:(int64_t)a3
{
  return [(FlowAdaptationDecoder *)self initWithMode:a3 revision:1];
}

- (FlowAdaptationDecoder)initWithMode:(int64_t)a3 revision:(int64_t)a4
{
  -[EspressoModel setUsage:](self, "setUsage:");
  [(FlowEstimate *)self setRevision:a4];
  [(FlowAdaptationDecoder *)self setupNetworkModel];
  espresso_file = self->_espresso_file;
  v14.receiver = self;
  v14.super_class = (Class)FlowAdaptationDecoder;
  v8 = [(EspressoModel *)&v14 initWithModelName:espresso_file usage:a3];
  v9 = v8;
  if (v8)
  {
    [(FlowEstimate *)v8 setLevel:0];
    dispatch_queue_t v10 = dispatch_queue_create("Flow Adaptation Decoder", 0);
    submissionQueue = v9->_submissionQueue;
    v9->_submissionQueue = (OS_dispatch_queue *)v10;

    v12 = v9;
  }

  return v9;
}

- (void)setupNetworkModel
{
  self->super._inputBlobs = (const char **)&inputBlobNames_1;
  espresso_file = self->_espresso_file;
  self->_espresso_file = (NSString *)@"flow_adaptation_decoder";

  self->super._outputBlobs = (const char **)&outputBlobNames_1;
  if ([(FlowEstimate *)self revision] != 1)
  {
    self->super._outputBlobs = (const char **)&off_1EAA9C448;
    self->_espresso_file = [(NSString *)self->_espresso_file stringByAppendingFormat:@"_rev%ld", [(FlowEstimate *)self revision]];
    MEMORY[0x1F41817F8]();
  }
}

- (BOOL)bindCVPixelBuffers:(__CVBuffer *)a3 correlation:(__CVBuffer *)a4 flow:(__CVBuffer *)a5 output:(__CVBuffer *)a6
{
  if (espresso_network_bind_direct_cvpixelbuffer())
  {
    NSLog(&cfstr_ErrorFailedToB_4.isa);
    return 0;
  }
  if (espresso_network_bind_direct_cvpixelbuffer())
  {
    NSLog(&cfstr_ErrorFailedToB_1.isa);
    return 0;
  }
  if (espresso_network_bind_direct_cvpixelbuffer())
  {
    NSLog(&cfstr_ErrorFailedToB_0.isa);
    return 0;
  }
  if (espresso_network_bind_direct_cvpixelbuffer())
  {
    NSLog(&cfstr_ErrorFailedToB_5.isa);
    return 0;
  }
  return 1;
}

- (BOOL)estimateFlow:(__CVBuffer *)a3 correlation:(__CVBuffer *)a4 flow:(__CVBuffer *)a5 output:(__CVBuffer *)a6 callback:(id)a7
{
  id v12 = a7;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 1;
  submissionQueue = self->_submissionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__FlowAdaptationDecoder_estimateFlow_correlation_flow_output_callback___block_invoke;
  block[3] = &unk_1E6CA4260;
  v20 = a4;
  v21 = a5;
  v22 = a6;
  v18 = &v23;
  v19 = a3;
  block[4] = self;
  id v17 = v12;
  id v14 = v12;
  dispatch_sync(submissionQueue, block);
  LOBYTE(a5) = *((unsigned char *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  return (char)a5;
}

void __71__FlowAdaptationDecoder_estimateFlow_correlation_flow_output_callback___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) bindCVPixelBuffers:*(void *)(a1 + 56) correlation:*(void *)(a1 + 64) flow:*(void *)(a1 + 72) output:*(void *)(a1 + 80)])
  {
    kdebug_trace();
    uint64_t v2 = MEMORY[0x1E4F143A8];
    id v3 = *(id *)(a1 + 40);
    if (espresso_plan_submit())
    {
      NSLog(&cfstr_Flowadaptation.isa, [*(id *)(a1 + 32) usage], v2, 3221225472, __71__FlowAdaptationDecoder_estimateFlow_correlation_flow_output_callback___block_invoke_2, &unk_1E6CA4238, v3);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

uint64_t __71__FlowAdaptationDecoder_estimateFlow_correlation_flow_output_callback___block_invoke_2(uint64_t a1)
{
  kdebug_trace();
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submissionQueue, 0);
  objc_storeStrong((id *)&self->_espresso_file, 0);
}

@end