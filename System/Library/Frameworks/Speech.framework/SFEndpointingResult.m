@interface SFEndpointingResult
- ($E36B78CDAC119E0352F6B513F3BB0FF8)range;
- (NSArray)pauseCounts;
- (SFEndpointingResult)initWithRange:(id *)a3 wordCount:(int64_t)a4 eosLikelihood:(double)a5 pauseCounts:(id)a6 silencePosterior:(double)a7;
- (double)eosLikelihood;
- (double)silencePosterior;
- (int64_t)wordCount;
@end

@implementation SFEndpointingResult

- (void).cxx_destruct
{
}

- (double)silencePosterior
{
  return self->_silencePosterior;
}

- (NSArray)pauseCounts
{
  return self->_pauseCounts;
}

- (double)eosLikelihood
{
  return self->_eosLikelihood;
}

- (int64_t)wordCount
{
  return self->_wordCount;
}

- ($E36B78CDAC119E0352F6B513F3BB0FF8)range
{
  long long v3 = *(_OWORD *)&self[1].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var0;
  return self;
}

- (SFEndpointingResult)initWithRange:(id *)a3 wordCount:(int64_t)a4 eosLikelihood:(double)a5 pauseCounts:(id)a6 silencePosterior:(double)a7
{
  id v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SFEndpointingResult;
  v13 = [(SFEndpointingResult *)&v20 init];
  v14 = (SFEndpointingResult *)v13;
  if (v13)
  {
    long long v15 = *(_OWORD *)&a3->var0.var0;
    long long v16 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)(v13 + 72) = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)(v13 + 56) = v16;
    *(_OWORD *)(v13 + 40) = v15;
    *((void *)v13 + 1) = a4;
    *((double *)v13 + 2) = a5;
    uint64_t v17 = [v12 copy];
    pauseCounts = v14->_pauseCounts;
    v14->_pauseCounts = (NSArray *)v17;

    v14->_silencePosterior = a7;
  }

  return v14;
}

@end