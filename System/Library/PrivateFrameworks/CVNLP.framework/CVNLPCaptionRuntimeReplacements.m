@interface CVNLPCaptionRuntimeReplacements
- (CVNLPCaptionRuntimeReplacements)initWithKey:(id)a3 value:(id)a4 prob:(double)a5 genderOption:(id)a6;
- (NSNumber)genderOption;
- (NSString)replacementKey;
- (NSString)replacementValue;
- (double)replacementProb;
@end

@implementation CVNLPCaptionRuntimeReplacements

- (CVNLPCaptionRuntimeReplacements)initWithKey:(id)a3 value:(id)a4 prob:(double)a5 genderOption:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v26.receiver = self;
  v26.super_class = (Class)CVNLPCaptionRuntimeReplacements;
  v16 = [(CVNLPCaptionRuntimeReplacements *)&v26 init];
  if (v16)
  {
    uint64_t v17 = objc_msgSend_stringWithSpaceAtEnds(v10, v13, v14, v15);
    replacementKey = v16->_replacementKey;
    v16->_replacementKey = (NSString *)v17;

    uint64_t v22 = objc_msgSend_stringWithSpaceAtEnds(v11, v19, v20, v21);
    replacementValue = v16->_replacementValue;
    v16->_replacementValue = (NSString *)v22;

    double v24 = 1.0;
    if (a5 != 0.0) {
      double v24 = a5;
    }
    v16->_replacementProb = v24;
    objc_storeStrong((id *)&v16->_genderOption, a6);
  }

  return v16;
}

- (NSString)replacementKey
{
  return self->_replacementKey;
}

- (NSString)replacementValue
{
  return self->_replacementValue;
}

- (double)replacementProb
{
  return self->_replacementProb;
}

- (NSNumber)genderOption
{
  return self->_genderOption;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genderOption, 0);
  objc_storeStrong((id *)&self->_replacementValue, 0);
  objc_storeStrong((id *)&self->_replacementKey, 0);
}

@end