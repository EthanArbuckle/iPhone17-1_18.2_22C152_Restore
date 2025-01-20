@interface SFLanguageDetectorResult
- ($E36B78CDAC119E0352F6B513F3BB0FF8)range;
- (NSArray)alternatives;
- (NSLocale)dominantLocale;
- (NSString)detectedLanguageCode;
- (SFLanguageDetectorResult)initWithRange:(id *)a3 dominantLocale:(id)a4 alternatives:(id)a5 detectedLanguageCode:(id)a6;
@end

@implementation SFLanguageDetectorResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectedLanguageCode, 0);
  objc_storeStrong((id *)&self->_alternatives, 0);

  objc_storeStrong((id *)&self->_dominantLocale, 0);
}

- (NSString)detectedLanguageCode
{
  return self->_detectedLanguageCode;
}

- (NSArray)alternatives
{
  return self->_alternatives;
}

- (NSLocale)dominantLocale
{
  return self->_dominantLocale;
}

- ($E36B78CDAC119E0352F6B513F3BB0FF8)range
{
  long long v3 = *(_OWORD *)&self[1].var0.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var3;
  return self;
}

- (SFLanguageDetectorResult)initWithRange:(id *)a3 dominantLocale:(id)a4 alternatives:(id)a5 detectedLanguageCode:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SFLanguageDetectorResult;
  v13 = [(SFLanguageDetectorResult *)&v22 init];
  v14 = v13;
  if (v13)
  {
    long long v15 = *(_OWORD *)&a3->var0.var0;
    long long v16 = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&v13->_range.start.epoch = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&v13->_range.duration.timescale = v16;
    *(_OWORD *)&v13->_range.start.value = v15;
    uint64_t v17 = [v10 copy];
    dominantLocale = v14->_dominantLocale;
    v14->_dominantLocale = (NSLocale *)v17;

    uint64_t v19 = [v11 copy];
    alternatives = v14->_alternatives;
    v14->_alternatives = (NSArray *)v19;

    objc_storeStrong((id *)&v14->_detectedLanguageCode, a6);
  }

  return v14;
}

@end