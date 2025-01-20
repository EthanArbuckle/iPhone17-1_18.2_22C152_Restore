@interface HKMedicationsBarcodeNDCParser
+ (BOOL)_isGTIN14CodeValid:(id)a3;
+ (BOOL)isObservationSupported:(id)a3;
+ (id)_barcodeObservationsFrom:(opaqueCMSampleBuffer *)a3 error:(id *)a4;
+ (id)_convertNDCFromGTIN14Code:(id)a3;
+ (id)_parsedGTIN14FromDataMatrix:(id)a3;
+ (id)_parsedGTIN14FromDataMatrixPayload:(id)a3;
+ (id)_parsedGTIN14FromEAN13:(id)a3;
+ (id)_parsedGTIN14FromEAN13Payload:(id)a3;
+ (id)_parsedNDCFromEAN13:(id)a3;
+ (id)hkt_parsedNDCFromDataMatrixPayload:(id)a3;
+ (id)hkt_parsedNDCFromEAN13Payload:(id)a3;
+ (id)parsedGTIN14CodeFromBarcodeObservation:(id)a3;
+ (id)parsedGTIN14CodesFromCMSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4;
+ (id)parsedNDCCodeFromBarcodeObservation:(id)a3;
+ (id)parsedNDCCodesFromCMSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4;
+ (id)parsedNDCFromDataMatrix:(id)a3;
@end

@implementation HKMedicationsBarcodeNDCParser

+ (BOOL)isObservationSupported:(id)a3
{
  id v3 = a3;
  v4 = [v3 symbology];
  if (v4 == (void *)*MEMORY[0x263F1F0B0])
  {
    BOOL v6 = 1;
  }
  else
  {
    v5 = [v3 symbology];
    BOOL v6 = v5 == (void *)*MEMORY[0x263F1F0A8];
  }
  return v6;
}

+ (id)parsedNDCCodeFromBarcodeObservation:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FCFA10]();
  if (![a1 isObservationSupported:v4]) {
    goto LABEL_4;
  }
  BOOL v6 = [v4 symbology];
  v7 = (void *)*MEMORY[0x263F1F0B0];

  if (v6 == v7)
  {
    uint64_t v11 = [a1 _parsedNDCFromEAN13:v4];
  }
  else
  {
    v8 = [v4 symbology];
    v9 = (void *)*MEMORY[0x263F1F0A8];

    if (v8 != v9)
    {
LABEL_4:
      v10 = 0;
      goto LABEL_8;
    }
    uint64_t v11 = [a1 parsedNDCFromDataMatrix:v4];
  }
  v10 = (void *)v11;
LABEL_8:

  return v10;
}

+ (id)parsedGTIN14CodeFromBarcodeObservation:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FCFA10]();
  if (![a1 isObservationSupported:v4]) {
    goto LABEL_4;
  }
  BOOL v6 = [v4 symbology];
  v7 = (void *)*MEMORY[0x263F1F0B0];

  if (v6 == v7)
  {
    uint64_t v11 = [a1 _parsedGTIN14FromEAN13:v4];
  }
  else
  {
    v8 = [v4 symbology];
    v9 = (void *)*MEMORY[0x263F1F0A8];

    if (v8 != v9)
    {
LABEL_4:
      v10 = 0;
      goto LABEL_8;
    }
    uint64_t v11 = [a1 _parsedGTIN14FromDataMatrix:v4];
  }
  v10 = (void *)v11;
LABEL_8:

  return v10;
}

+ (id)parsedNDCCodesFromCMSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v5 = [a1 _barcodeObservationsFrom:a3 error:a4];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(a1, "parsedNDCCodeFromBarcodeObservation:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
          if ([v12 length]) {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)parsedGTIN14CodesFromCMSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v5 = [a1 _barcodeObservationsFrom:a3 error:a4];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(a1, "parsedGTIN14CodeFromBarcodeObservation:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
          if ([v12 length]) {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)_barcodeObservationsFrom:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  id v6 = objc_alloc(MEMORY[0x263F1EF40]);
  id v7 = (void *)[v6 initWithCMSampleBuffer:a3 options:MEMORY[0x263EFFA78]];
  uint64_t v8 = +[HKMedicationsBarcodeExtractor extractedBarcodesFromRequestHandler:v7 error:a4];
  uint64_t v9 = v8;
  if (v8) {
    id v10 = v8;
  }

  return v9;
}

+ (id)_parsedGTIN14FromEAN13:(id)a3
{
  id v4 = [a3 payloadStringValue];
  v5 = [a1 _parsedGTIN14FromEAN13Payload:v4];

  return v5;
}

+ (id)_parsedGTIN14FromEAN13Payload:(id)a3
{
  id v3 = a3;
  if ([v3 length] == 13 && objc_msgSend(v3, "hasPrefix:", @"03"))
  {
    id v4 = [@"0" stringByAppendingString:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)_parsedNDCFromEAN13:(id)a3
{
  id v4 = [a1 _parsedGTIN14FromEAN13:a3];
  v5 = [a1 _convertNDCFromGTIN14Code:v4];

  return v5;
}

+ (id)_parsedGTIN14FromDataMatrix:(id)a3
{
  id v4 = [a3 payloadStringValue];
  v5 = [a1 _parsedGTIN14FromDataMatrixPayload:v4];

  return v5;
}

+ (id)parsedNDCFromDataMatrix:(id)a3
{
  id v4 = [a1 _parsedGTIN14FromDataMatrix:a3];
  v5 = [a1 _convertNDCFromGTIN14Code:v4];

  return v5;
}

+ (id)_parsedGTIN14FromDataMatrixPayload:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%c", 29);
  id v6 = (void *)[objc_alloc(MEMORY[0x263F08B08]) initWithString:v4];
  id v7 = 0;
  if ([v6 scanString:v5 intoString:0])
  {
    while (1)
    {
      id v13 = 0;
      int v8 = [v6 scanString:@"01" intoString:&v13];
      id v9 = v13;
      id v10 = v9;
      if (v8 && [v9 isEqual:@"01"])
      {
        uint64_t v11 = objc_msgSend(v4, "substringWithRange:", objc_msgSend(v6, "scanLocation"), 14);
        if (([v11 containsString:v5] & 1) == 0)
        {
          if ([a1 _isGTIN14CodeValid:v11]) {
            id v7 = v11;
          }
          else {
            id v7 = 0;
          }

          break;
        }
      }
      if (([v6 scanString:v5 intoString:0] & 1) == 0)
      {
        id v7 = 0;
        break;
      }
    }
  }

  return v7;
}

+ (BOOL)_isGTIN14CodeValid:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"003"])
  {
    id v4 = objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v3, "length") - 1);
    uint64_t v5 = [v4 integerValue];

    if ([v3 length] == 1) {
      goto LABEL_11;
    }
    unint64_t v6 = 0;
    uint64_t v7 = 0;
    do
    {
      int v8 = objc_msgSend(v3, "substringWithRange:", v6, 1);
      uint64_t v9 = [v8 integerValue];

      if (v6) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = 3;
      }
      v7 += v9 * v10;
      ++v6;
    }
    while ([v3 length] - 1 > v6);
    if (!(v7 % 10)) {
LABEL_11:
    }
      uint64_t v11 = 0;
    else {
      uint64_t v11 = 10 - v7 % 10;
    }
    BOOL v12 = v5 == v11;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

+ (id)_convertNDCFromGTIN14Code:(id)a3
{
  id v4 = a3;
  if ([a1 _isGTIN14CodeValid:v4])
  {
    uint64_t v5 = [v4 substringFromIndex:objc_msgSend(@"003", "length")];
    unint64_t v6 = objc_msgSend(v5, "substringToIndex:", objc_msgSend(v5, "length") - 1);

    if ([v6 length] == 10 || objc_msgSend(v6, "length") == 11) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)hkt_parsedNDCFromDataMatrixPayload:(id)a3
{
  id v4 = [a1 _parsedGTIN14FromDataMatrixPayload:a3];
  uint64_t v5 = [a1 _convertNDCFromGTIN14Code:v4];

  return v5;
}

+ (id)hkt_parsedNDCFromEAN13Payload:(id)a3
{
  id v4 = [a1 _parsedGTIN14FromEAN13Payload:a3];
  uint64_t v5 = [a1 _convertNDCFromGTIN14Code:v4];

  return v5;
}

@end