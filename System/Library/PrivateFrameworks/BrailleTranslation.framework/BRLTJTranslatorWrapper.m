@interface BRLTJTranslatorWrapper
- (BRLTJTranslatorWrapper)initWithTranslationDelegate:(id)a3 outputMode:(unint64_t)a4 inputMode:(unint64_t)a5;
- (id)arrayFromData:(id)a3;
- (id)brailleForText:(id)a3;
- (id)textForBraille:(id)a3;
- (unint64_t)inputMode;
- (unint64_t)outputMode;
- (void)setInputMode:(unint64_t)a3;
- (void)setOutputMode:(unint64_t)a3;
@end

@implementation BRLTJTranslatorWrapper

- (BRLTJTranslatorWrapper)initWithTranslationDelegate:(id)a3 outputMode:(unint64_t)a4 inputMode:(unint64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRLTJTranslatorWrapper;
  v10 = [(BRLTJTranslatorWrapper *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_translationDelegate, a3);
    v11->_outputMode = a4;
    v11->_inputMode = a5;
  }

  return v11;
}

- (id)brailleForText:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  translationDelegate = self->_translationDelegate;
  unint64_t outputMode = self->_outputMode;
  id v12 = 0;
  uint64_t v6 = -[BRLTBrailleTranslationDelegateProtocol printBrailleForText:language:mode:textPositionsRange:locations:textFormattingRanges:](translationDelegate, "printBrailleForText:language:mode:textPositionsRange:locations:textFormattingRanges:", a3, 0, outputMode, 0x7FFFFFFFFFFFFFFFLL, 0, &v12, 0);
  id v7 = v12;
  if (v6) {
    v8 = (__CFString *)v6;
  }
  else {
    v8 = &stru_26CCBD108;
  }
  v13[0] = @"braille";
  v13[1] = @"locations";
  v14[0] = v8;
  id v9 = [(BRLTJTranslatorWrapper *)self arrayFromData:v7];
  v14[1] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v10;
}

- (id)textForBraille:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  translationDelegate = self->_translationDelegate;
  unint64_t inputMode = self->_inputMode;
  id v12 = 0;
  uint64_t v6 = [(BRLTBrailleTranslationDelegateProtocol *)translationDelegate textForPrintBraille:a3 language:0 mode:inputMode locations:&v12];
  id v7 = v12;
  if (v6) {
    v8 = (__CFString *)v6;
  }
  else {
    v8 = &stru_26CCBD108;
  }
  v13[0] = @"text";
  v13[1] = @"locations";
  v14[0] = v8;
  id v9 = [(BRLTJTranslatorWrapper *)self arrayFromData:v7];
  v14[1] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v10;
}

- (id)arrayFromData:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 length];
  id v5 = v3;
  uint64_t v6 = (uint64_t *)[v5 bytes];
  id v7 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v4 >> 3];
  if (v4 >= 8)
  {
    if (v4 >> 3 <= 1) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = v4 >> 3;
    }
    do
    {
      uint64_t v9 = *v6++;
      v10 = [NSNumber numberWithInteger:v9];
      [v7 addObject:v10];

      --v8;
    }
    while (v8);
  }

  return v7;
}

- (unint64_t)outputMode
{
  return self->_outputMode;
}

- (void)setOutputMode:(unint64_t)a3
{
  self->_unint64_t outputMode = a3;
}

- (unint64_t)inputMode
{
  return self->_inputMode;
}

- (void)setInputMode:(unint64_t)a3
{
  self->_unint64_t inputMode = a3;
}

- (void).cxx_destruct
{
}

@end