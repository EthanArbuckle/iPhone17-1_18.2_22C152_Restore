@interface BRLTTranslator
- (BOOL)isEqualTable:(id)a3;
- (BRLTTranslator)initWithDelegate:(id)a3 tableIdentifier:(id)a4;
- (id)_backTranslate:(id)a3;
- (id)_translate:(id)a3 isTechnical:(BOOL)a4 textFormattingRanges:(id)a5;
- (id)arrayFromData:(id)a3;
@end

@implementation BRLTTranslator

- (BRLTTranslator)initWithDelegate:(id)a3 tableIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BRLTTranslator;
  v9 = [(BRLTTranslator *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_translationDelegate, a3);
    objc_storeStrong((id *)&v10->_tableIdentifier, a4);
  }

  return v10;
}

- (id)_translate:(id)a3 isTechnical:(BOOL)a4 textFormattingRanges:(id)a5
{
  v16[2] = *MEMORY[0x263EF8340];
  uint64_t v6 = 4;
  if (!a4) {
    uint64_t v6 = 1;
  }
  translationDelegate = self->_translationDelegate;
  id v14 = 0;
  uint64_t v8 = -[BRLTBrailleTranslationDelegateProtocol printBrailleForText:language:mode:textPositionsRange:locations:textFormattingRanges:](translationDelegate, "printBrailleForText:language:mode:textPositionsRange:locations:textFormattingRanges:", a3, 0, v6, 0x7FFFFFFFFFFFFFFFLL, 0, &v14, a5);
  id v9 = v14;
  if (v8) {
    v10 = (__CFString *)v8;
  }
  else {
    v10 = &stru_26CCBD108;
  }
  v15[0] = @"braille";
  v15[1] = @"locations";
  v16[0] = v10;
  v11 = [(BRLTTranslator *)self arrayFromData:v9];
  v16[1] = v11;
  objc_super v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v12;
}

- (id)_backTranslate:(id)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  translationDelegate = self->_translationDelegate;
  id v11 = 0;
  uint64_t v5 = [(BRLTBrailleTranslationDelegateProtocol *)translationDelegate textForPrintBraille:a3 language:0 mode:1 locations:&v11];
  id v6 = v11;
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  else {
    id v7 = &stru_26CCBD108;
  }
  v12[0] = @"text";
  v12[1] = @"locations";
  v13[0] = v7;
  uint64_t v8 = [(BRLTTranslator *)self arrayFromData:v6];
  v13[1] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v9;
}

- (id)arrayFromData:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 length];
  id v5 = v3;
  id v6 = (uint64_t *)[v5 bytes];
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

- (BOOL)isEqualTable:(id)a3
{
  return [(NSString *)self->_tableIdentifier isEqual:*((void *)a3 + 2)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableIdentifier, 0);
  objc_storeStrong((id *)&self->_translationDelegate, 0);
}

@end