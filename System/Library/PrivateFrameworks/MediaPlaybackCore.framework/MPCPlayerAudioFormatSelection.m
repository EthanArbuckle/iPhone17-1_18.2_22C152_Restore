@interface MPCPlayerAudioFormatSelection
- (MPCPlayerAudioFormat)format;
- (MPCPlayerAudioFormatSelection)initWithExplanation:(id)a3 justification:(id)a4;
- (MPCPlayerAudioFormatSelection)initWithFormat:(id)a3 explanation:(id)a4 justification:(id)a5;
- (NSDictionary)justification;
- (NSString)explanation;
- (void)setExplanation:(id)a3;
- (void)setFormat:(id)a3;
- (void)setJustification:(id)a3;
@end

@implementation MPCPlayerAudioFormatSelection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_justification, 0);
  objc_storeStrong((id *)&self->_explanation, 0);

  objc_storeStrong((id *)&self->_format, 0);
}

- (void)setJustification:(id)a3
{
}

- (NSDictionary)justification
{
  return self->_justification;
}

- (void)setExplanation:(id)a3
{
}

- (NSString)explanation
{
  return self->_explanation;
}

- (void)setFormat:(id)a3
{
}

- (MPCPlayerAudioFormat)format
{
  return self->_format;
}

- (MPCPlayerAudioFormatSelection)initWithFormat:(id)a3 explanation:(id)a4 justification:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MPCPlayerAudioFormatSelection;
  v12 = [(MPCPlayerAudioFormatSelection *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_format, a3);
    uint64_t v14 = [v10 copy];
    explanation = v13->_explanation;
    v13->_explanation = (NSString *)v14;

    objc_storeStrong((id *)&v13->_justification, a5);
  }

  return v13;
}

- (MPCPlayerAudioFormatSelection)initWithExplanation:(id)a3 justification:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPCPlayerAudioFormatSelection;
  v8 = [(MPCPlayerAudioFormatSelection *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    explanation = v8->_explanation;
    v8->_explanation = (NSString *)v9;

    objc_storeStrong((id *)&v8->_justification, a4);
  }

  return v8;
}

@end