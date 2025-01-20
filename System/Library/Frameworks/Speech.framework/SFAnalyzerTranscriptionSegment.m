@interface SFAnalyzerTranscriptionSegment
- (NSArray)alternatives;
- (NSArray)text;
- (SFAnalyzerTranscriptionSegment)initWithText:(id)a3 alternatives:(id)a4;
@end

@implementation SFAnalyzerTranscriptionSegment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternatives, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

- (NSArray)alternatives
{
  return self->_alternatives;
}

- (NSArray)text
{
  return self->_text;
}

- (SFAnalyzerTranscriptionSegment)initWithText:(id)a3 alternatives:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)SFAnalyzerTranscriptionSegment;
  id v5 = a4;
  id v6 = a3;
  v7 = [(SFAnalyzerTranscriptionSegment *)&v13 init];
  uint64_t v8 = objc_msgSend(v6, "copy", v13.receiver, v13.super_class);

  text = v7->_text;
  v7->_text = (NSArray *)v8;

  uint64_t v10 = [v5 copy];
  alternatives = v7->_alternatives;
  v7->_alternatives = (NSArray *)v10;

  return v7;
}

@end