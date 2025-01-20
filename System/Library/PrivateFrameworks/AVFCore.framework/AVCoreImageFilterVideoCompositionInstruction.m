@interface AVCoreImageFilterVideoCompositionInstruction
- ($1CE2C3FC342086196D07C2B4E8C70800)timeRange;
- (AVCoreImageFilterVideoCompositionInstruction)init;
- (AVCoreImageFilterVideoCompositionInstruction)initWithTimeRange:(id *)a3 sourceTrackIDs:(id)a4 handler:(id)a5;
- (BOOL)containsTweening;
- (BOOL)enablePostProcessing;
- (CGAffineTransform)sourceTrackPreferredTransform;
- (NSArray)requiredSourceTrackIDs;
- (id)handler;
- (int)passthroughTrackID;
- (void)dealloc;
- (void)setSourceTrackPreferredTransform:(CGAffineTransform *)a3;
@end

@implementation AVCoreImageFilterVideoCompositionInstruction

- (BOOL)enablePostProcessing
{
  return 0;
}

- (BOOL)containsTweening
{
  return 1;
}

- (int)passthroughTrackID
{
  return 0;
}

- (AVCoreImageFilterVideoCompositionInstruction)init
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3A8];
  v6 = NSStringFromSelector(sel_initWithTimeRange_sourceTrackIDs_handler_);
  v12 = (void *)[v4 exceptionWithName:v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Not available.  Use %@ instead", v7, v8, v9, v10, v11, (uint64_t)v6), 0 reason userInfo];
  objc_exception_throw(v12);
}

- (AVCoreImageFilterVideoCompositionInstruction)initWithTimeRange:(id *)a3 sourceTrackIDs:(id)a4 handler:(id)a5
{
  v15.receiver = self;
  v15.super_class = (Class)AVCoreImageFilterVideoCompositionInstruction;
  uint64_t v8 = [(AVCoreImageFilterVideoCompositionInstruction *)&v15 init];
  uint64_t v9 = (AVCoreImageFilterVideoCompositionInstruction *)v8;
  if (v8)
  {
    uint64_t v10 = MEMORY[0x1E4F1DAB8];
    long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)(v8 + 72) = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)(v8 + 88) = v11;
    *(_OWORD *)(v8 + 104) = *(_OWORD *)(v10 + 32);
    long long v13 = *(_OWORD *)&a3->var0.var0;
    long long v12 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)(v8 + 40) = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)(v8 + 8) = v13;
    *(_OWORD *)(v8 + 24) = v12;
    *((void *)v8 + 8) = [a5 copy];
    v9->_requiredSourceTrackIDs = (NSArray *)[a4 copy];
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCoreImageFilterVideoCompositionInstruction;
  [(AVCoreImageFilterVideoCompositionInstruction *)&v3 dealloc];
}

- ($1CE2C3FC342086196D07C2B4E8C70800)timeRange
{
  long long v3 = *(_OWORD *)&self->var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self->var1.var3;
  return self;
}

- (NSArray)requiredSourceTrackIDs
{
  return self->_requiredSourceTrackIDs;
}

- (id)handler
{
  return self->_handler;
}

- (CGAffineTransform)sourceTrackPreferredTransform
{
  long long v3 = *(_OWORD *)&self[1].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].b;
  return self;
}

- (void)setSourceTrackPreferredTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_sourceTrackPreferredTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_sourceTrackPreferredTransform.c = v4;
  *(_OWORD *)&self->_sourceTrackPreferredTransform.a = v3;
}

@end