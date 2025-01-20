@interface CSUCaptionRuntimeReplacements
- (CSUCaptionRuntimeReplacements)initWithKey:(id)a3 value:(id)a4 prob:(double)a5 genderOption:(id)a6;
- (NSNumber)genderOption;
- (NSString)replacementKey;
- (NSString)replacementValue;
- (double)replacementProb;
@end

@implementation CSUCaptionRuntimeReplacements

- (CSUCaptionRuntimeReplacements)initWithKey:(id)a3 value:(id)a4 prob:(double)a5 genderOption:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v28.receiver = self;
  v28.super_class = (Class)CSUCaptionRuntimeReplacements;
  v17 = [(CSUCaptionRuntimeReplacements *)&v28 init];
  if (v17)
  {
    uint64_t v18 = objc_msgSend_stringWithSpaceAtEnds(v10, v13, v14, v15, v16);
    replacementKey = v17->_replacementKey;
    v17->_replacementKey = (NSString *)v18;

    uint64_t v24 = objc_msgSend_stringWithSpaceAtEnds(v11, v20, v21, v22, v23);
    replacementValue = v17->_replacementValue;
    v17->_replacementValue = (NSString *)v24;

    double v26 = 1.0;
    if (a5 != 0.0) {
      double v26 = a5;
    }
    v17->_replacementProb = v26;
    objc_storeStrong((id *)&v17->_genderOption, a6);
  }

  return v17;
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