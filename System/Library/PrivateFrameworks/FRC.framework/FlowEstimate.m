@interface FlowEstimate
+ (int64_t)numLevels;
+ (void)setNumLevels:(int64_t)a3;
- (BOOL)bindCVPixelBuffers:(__CVBuffer *)a3 correlation:(__CVBuffer *)a4 flow:(__CVBuffer *)a5 output:(__CVBuffer *)a6;
- (BOOL)estimateFlow:(__CVBuffer *)a3 correlation:(__CVBuffer *)a4 flow:(__CVBuffer *)a5 output:(__CVBuffer *)a6 callback:(id)a7;
- (FlowEstimate)initWithMode:(int64_t)a3 level:(unsigned int)a4;
- (FlowEstimate)initWithMode:(int64_t)a3 level:(unsigned int)a4 revision:(int64_t)a5;
- (int64_t)revision;
- (unint64_t)channels;
- (unint64_t)height;
- (unint64_t)width;
- (unsigned)level;
- (void)setChannels:(unint64_t)a3;
- (void)setHeight:(unint64_t)a3;
- (void)setLevel:(unsigned int)a3;
- (void)setRevision:(int64_t)a3;
- (void)setWidth:(unint64_t)a3;
- (void)setupNetworkModel;
@end

@implementation FlowEstimate

+ (int64_t)numLevels
{
  return _numLevels;
}

+ (void)setNumLevels:(int64_t)a3
{
  _numLevels = a3;
}

- (FlowEstimate)initWithMode:(int64_t)a3 level:(unsigned int)a4
{
  return [(FlowEstimate *)self initWithMode:a3 level:*(void *)&a4 revision:1];
}

- (FlowEstimate)initWithMode:(int64_t)a3 level:(unsigned int)a4 revision:(int64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  [(FlowEstimate *)self setLevel:*(void *)&a4];
  [(EspressoModel *)self setUsage:a3];
  [(FlowEstimate *)self setRevision:a5];
  [(FlowEstimate *)self setupNetworkModel];
  v9 = [NSString stringWithFormat:@"%@%d", self->_espresso_base_name, (v6 + 1)];
  v16.receiver = self;
  v16.super_class = (Class)FlowEstimate;
  v10 = [(EspressoModel *)&v16 initWithModelName:v9 usage:a3];
  if (v10)
  {
    id v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"Optical Flow Estimate Level %d", v6);
    dispatch_queue_t v12 = dispatch_queue_create((const char *)[v11 UTF8String], 0);
    submissionQueue = v10->_submissionQueue;
    v10->_submissionQueue = (OS_dispatch_queue *)v12;

    v14 = v10;
  }

  return v10;
}

- (void)setupNetworkModel
{
  uint64_t v9 = 0;
  unint64_t v10 = 0;
  FRCGetInputFrameSizeForUsage([(EspressoModel *)self usage], (uint64_t *)&v10, &v9);
  espresso_base_name = self->_espresso_base_name;
  if (v10 <= 0x3E8) {
    v4 = @"optical_flow_estimation_pyrlite";
  }
  else {
    v4 = @"optical_flow_estimation_pyrlite_HD";
  }
  self->_espresso_base_name = &v4->isa;

  if (self->_revision != 1)
  {
    v5 = [(NSString *)self->_espresso_base_name stringByAppendingFormat:@"_rev%ld", self->_revision];
    uint64_t v6 = self->_espresso_base_name;
    self->_espresso_base_name = v5;
  }
  v7 = [(NSString *)self->_espresso_base_name stringByAppendingString:@"_stage"];
  v8 = self->_espresso_base_name;
  self->_espresso_base_name = v7;

  self->_inputBlobs = (const char **)&inputBlobNames_0;
  self->_outputBlobs = (const char **)&outputBlobNames_0;
  self->_concatenatedInputBlob = *self->_inputBlobs;
}

- (BOOL)bindCVPixelBuffers:(__CVBuffer *)a3 correlation:(__CVBuffer *)a4 flow:(__CVBuffer *)a5 output:(__CVBuffer *)a6
{
  if (self->_level < 2)
  {
    if (espresso_network_bind_direct_cvpixelbuffer()) {
      goto LABEL_7;
    }
  }
  else
  {
    if (espresso_network_bind_cvpixelbuffer())
    {
      NSLog(&cfstr_ErrorFailedToB.isa);
      return 0;
    }
    if (espresso_network_bind_cvpixelbuffer())
    {
LABEL_7:
      NSLog(&cfstr_ErrorFailedToB_0.isa);
      return 0;
    }
    if (_numLevels - 1 != self->_level && espresso_network_bind_cvpixelbuffer())
    {
      NSLog(&cfstr_ErrorFailedToB_1.isa);
      return 0;
    }
  }
  if (espresso_network_bind_direct_cvpixelbuffer())
  {
    NSLog(&cfstr_ErrorFailedToB_2.isa);
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
  block[2] = __62__FlowEstimate_estimateFlow_correlation_flow_output_callback___block_invoke;
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

void __62__FlowEstimate_estimateFlow_correlation_flow_output_callback___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) bindCVPixelBuffers:*(void *)(a1 + 56) correlation:*(void *)(a1 + 64) flow:*(void *)(a1 + 72) output:*(void *)(a1 + 80)])
  {
    kdebug_trace();
    id v2 = *(id *)(a1 + 40);
    if (espresso_plan_submit())
    {
      NSLog(&cfstr_FlowestimateLe.isa, [*(id *)(a1 + 32) level], objc_msgSend(*(id *)(a1 + 32), "usage"));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    }
  }
  else
  {
    NSLog(&cfstr_ErrorFailedToB_3.isa);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

uint64_t __62__FlowEstimate_estimateFlow_correlation_flow_output_callback___block_invoke_2(uint64_t a1)
{
  kdebug_trace();
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (unint64_t)width
{
  return self->_width;
}

- (void)setWidth:(unint64_t)a3
{
  self->_width = a3;
}

- (unint64_t)height
{
  return self->_height;
}

- (void)setHeight:(unint64_t)a3
{
  self->_height = a3;
}

- (unint64_t)channels
{
  return self->_channels;
}

- (void)setChannels:(unint64_t)a3
{
  self->_channels = a3;
}

- (unsigned)level
{
  return self->_level;
}

- (void)setLevel:(unsigned int)a3
{
  self->_level = a3;
}

- (int64_t)revision
{
  return self->_revision;
}

- (void)setRevision:(int64_t)a3
{
  self->_revision = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submissionQueue, 0);
  objc_storeStrong((id *)&self->_espresso_base_name, 0);
}

@end