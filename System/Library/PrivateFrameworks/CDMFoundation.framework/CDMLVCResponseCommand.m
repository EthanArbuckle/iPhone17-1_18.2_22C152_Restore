@interface CDMLVCResponseCommand
- (CDMLVCResponseCommand)initWithITFMResponse:(id)a3 languageVariantResult:(id)a4;
- (SIRINLUEXTERNALLanguageVariantResult)languageVariantResult;
- (SIRINLUINTERNALITFMITFMParserResponse)itfmResponse;
- (id)description;
- (int)classLabel;
- (void)setClassLabel:(int)a3;
@end

@implementation CDMLVCResponseCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageVariantResult, 0);
  objc_storeStrong((id *)&self->_itfmResponse, 0);
}

- (SIRINLUEXTERNALLanguageVariantResult)languageVariantResult
{
  return self->_languageVariantResult;
}

- (SIRINLUINTERNALITFMITFMParserResponse)itfmResponse
{
  return self->_itfmResponse;
}

- (void)setClassLabel:(int)a3
{
  self->_classLabel = a3;
}

- (int)classLabel
{
  return self->_classLabel;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithString:@"languageVariantResult.multilingualVariants: "];
  v4 = [(CDMLVCResponseCommand *)self languageVariantResult];
  v5 = [v4 multilingualVariants];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    do
    {
      v8 = [(CDMLVCResponseCommand *)self languageVariantResult];
      v9 = [v8 multilingualVariants];
      v10 = [v9 objectAtIndexedSubscript:v7];

      v11 = [v10 languageVariantName];
      [v10 languageVariantScore];
      [v3 appendFormat:@"[%lu] %@=%.2f, ", v7, v11, v12];

      ++v7;
      v13 = [(CDMLVCResponseCommand *)self languageVariantResult];
      v14 = [v13 multilingualVariants];
      unint64_t v15 = [v14 count];
    }
    while (v7 < v15);
  }
  return v3;
}

- (CDMLVCResponseCommand)initWithITFMResponse:(id)a3 languageVariantResult:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDMLVCResponseCommand;
  v9 = [(CDMBaseCommand *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_itfmResponse, a3);
    objc_storeStrong((id *)&v10->_languageVariantResult, a4);
  }

  return v10;
}

@end