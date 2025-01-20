@interface _LTSpeechRecognitionBin
+ (BOOL)supportsSecureCoding;
- (NSArray)alternatives;
- (_LTSpeechRecognitionBin)initWithCoder:(id)a3;
- (unint64_t)bestAlternativeIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setAlternatives:(id)a3;
- (void)setBestAlternativeIndex:(unint64_t)a3;
@end

@implementation _LTSpeechRecognitionBin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  alternatives = self->_alternatives;
  id v5 = a3;
  [v5 encodeObject:alternatives forKey:@"alternatives"];
  [v5 encodeInteger:self->_bestAlternativeIndex forKey:@"bestIndex"];
}

- (_LTSpeechRecognitionBin)initWithCoder:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_LTSpeechRecognitionBin;
  id v5 = [(_LTSpeechRecognitionBin *)&v13 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"alternatives"];
    alternatives = v5->_alternatives;
    v5->_alternatives = (NSArray *)v9;

    v5->_bestAlternativeIndex = [v4 decodeIntegerForKey:@"bestIndex"];
    v11 = v5;
  }
  return v5;
}

- (NSArray)alternatives
{
  return self->_alternatives;
}

- (void)setAlternatives:(id)a3
{
}

- (unint64_t)bestAlternativeIndex
{
  return self->_bestAlternativeIndex;
}

- (void)setBestAlternativeIndex:(unint64_t)a3
{
  self->_bestAlternativeIndex = a3;
}

- (void).cxx_destruct
{
}

@end