@interface SGModelSampler
- (BOOL)shouldSampleForLabel:(id)a3 isDynamicLabel:(BOOL)a4;
- (SGModelSampler)initWithPositiveRate:(double)a3 dynamicLabelRate:(double)a4 negativeRate:(double)a5 rng:(id)a6;
@end

@implementation SGModelSampler

- (void).cxx_destruct
{
}

- (BOOL)shouldSampleForLabel:(id)a3 isDynamicLabel:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = [a3 unsignedIntegerValue];
  uint64_t v7 = 8;
  if (v4) {
    uint64_t v7 = 16;
  }
  if (!v6) {
    uint64_t v7 = 24;
  }
  double v8 = *(double *)((char *)&self->super.isa + v7);
  rng = self->_rng;
  if (rng) {
    BOOL v10 = v8 == 1.0;
  }
  else {
    BOOL v10 = 1;
  }
  BOOL result = 1;
  if (!v10)
  {
    [(_PASRng *)rng nextFloat];
    if (v8 <= v11) {
      return 0;
    }
  }
  return result;
}

- (SGModelSampler)initWithPositiveRate:(double)a3 dynamicLabelRate:(double)a4 negativeRate:(double)a5 rng:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)SGModelSampler;
  v12 = [(SGModelSampler *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_positiveRate = a3;
    v12->_dynamicLabelRate = a4;
    v12->_negativeRate = a5;
    objc_storeStrong((id *)&v12->_rng, a6);
  }

  return v13;
}

@end