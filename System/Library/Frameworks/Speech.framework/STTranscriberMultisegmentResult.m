@interface STTranscriberMultisegmentResult
- ($E36B78CDAC119E0352F6B513F3BB0FF8)recognitionAudioRange;
- (NSArray)nBestChoices;
- (NSArray)segments;
- (NSArray)transcriptions;
- (STTranscriberMultisegmentResult)initWithSegments:(id)a3 transcriptions:(id)a4 earResultType:(unint64_t)a5 nBestChoices:(id)a6 recognitionAudioRange:(id *)a7;
- (unint64_t)earResultType;
@end

@implementation STTranscriberMultisegmentResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nBestChoices, 0);
  objc_storeStrong((id *)&self->_transcriptions, 0);

  objc_storeStrong((id *)&self->_segments, 0);
}

- ($E36B78CDAC119E0352F6B513F3BB0FF8)recognitionAudioRange
{
  long long v3 = *(_OWORD *)&self[1].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var0;
  return self;
}

- (NSArray)nBestChoices
{
  return self->_nBestChoices;
}

- (unint64_t)earResultType
{
  return self->_earResultType;
}

- (NSArray)transcriptions
{
  return self->_transcriptions;
}

- (NSArray)segments
{
  return self->_segments;
}

- (STTranscriberMultisegmentResult)initWithSegments:(id)a3 transcriptions:(id)a4 earResultType:(unint64_t)a5 nBestChoices:(id)a6 recognitionAudioRange:(id *)a7
{
  v24.receiver = self;
  v24.super_class = (Class)STTranscriberMultisegmentResult;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  v14 = [(STTranscriberMultisegmentResult *)&v24 init];
  uint64_t v15 = objc_msgSend(v13, "copy", v24.receiver, v24.super_class);

  v16 = (void *)*((void *)v14 + 1);
  *((void *)v14 + 1) = v15;

  uint64_t v17 = [v12 copy];
  v18 = (void *)*((void *)v14 + 2);
  *((void *)v14 + 2) = v17;

  *((void *)v14 + 3) = a5;
  uint64_t v19 = [v11 copy];

  v20 = (void *)*((void *)v14 + 4);
  *((void *)v14 + 4) = v19;

  long long v21 = *(_OWORD *)&a7->var0.var0;
  long long v22 = *(_OWORD *)&a7->var0.var3;
  *(_OWORD *)(v14 + 72) = *(_OWORD *)&a7->var1.var1;
  *(_OWORD *)(v14 + 56) = v22;
  *(_OWORD *)(v14 + 40) = v21;
  return (STTranscriberMultisegmentResult *)v14;
}

@end