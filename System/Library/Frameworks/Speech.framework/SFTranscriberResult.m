@interface SFTranscriberResult
- ($E36B78CDAC119E0352F6B513F3BB0FF8)range;
- (SFTranscriberResult)initWithRange:(id *)a3 normalizedTranscriberMultisegmentResult:(id)a4 contextualizedTranscriberMultisegmentResult:(id)a5;
- (STTranscriberMultisegmentResult)contextualizedTranscriberMultisegmentResult;
- (STTranscriberMultisegmentResult)normalizedTranscriberMultisegmentResult;
@end

@implementation SFTranscriberResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextualizedTranscriberMultisegmentResult, 0);

  objc_storeStrong((id *)&self->_normalizedTranscriberMultisegmentResult, 0);
}

- (STTranscriberMultisegmentResult)contextualizedTranscriberMultisegmentResult
{
  return self->_contextualizedTranscriberMultisegmentResult;
}

- (STTranscriberMultisegmentResult)normalizedTranscriberMultisegmentResult
{
  return self->_normalizedTranscriberMultisegmentResult;
}

- ($E36B78CDAC119E0352F6B513F3BB0FF8)range
{
  long long v3 = *(_OWORD *)&self->var1.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var1;
  return self;
}

- (SFTranscriberResult)initWithRange:(id *)a3 normalizedTranscriberMultisegmentResult:(id)a4 contextualizedTranscriberMultisegmentResult:(id)a5
{
  v17.receiver = self;
  v17.super_class = (Class)SFTranscriberResult;
  id v7 = a5;
  id v8 = a4;
  v9 = [(SFTranscriberResult *)&v17 init];
  long long v11 = *(_OWORD *)&a3->var0.var3;
  long long v10 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)(v9 + 24) = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)(v9 + 40) = v11;
  *(_OWORD *)(v9 + 56) = v10;
  uint64_t v12 = objc_msgSend(v8, "copy", v17.receiver, v17.super_class);

  v13 = (void *)*((void *)v9 + 1);
  *((void *)v9 + 1) = v12;

  uint64_t v14 = [v7 copy];
  v15 = (void *)*((void *)v9 + 2);
  *((void *)v9 + 2) = v14;

  return (SFTranscriberResult *)v9;
}

@end