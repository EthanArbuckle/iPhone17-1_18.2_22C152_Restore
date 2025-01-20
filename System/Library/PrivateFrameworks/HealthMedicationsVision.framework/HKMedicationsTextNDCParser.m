@interface HKMedicationsTextNDCParser
- (HKMedicationsTextNDCParser)init;
- (NSArray)NDC10RegularExpressions;
- (NSRegularExpression)NDC11RegularExpression;
- (id)parsedNDCCodeFromString:(id)a3;
- (void)setNDC10RegularExpressions:(id)a3;
- (void)setNDC11RegularExpression:(id)a3;
@end

@implementation HKMedicationsTextNDCParser

- (HKMedicationsTextNDCParser)init
{
  v20[3] = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)HKMedicationsTextNDCParser;
  v2 = [(HKMedicationsTextNDCParser *)&v19 init];
  if (v2)
  {
    id v18 = 0;
    v3 = (void *)[objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:@"\\b([0-9]{4})[\\ -]([0-9]{4})[\\ -]([0-9]{2})\\b" options:1 error:&v18];
    id v4 = v18;
    v20[0] = v3;
    id v17 = v4;
    v5 = (void *)[objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:@"\\b([0-9]{5})[\\ -]([0-9]{3})[\\ -]([0-9]{2})\\b" options:1 error:&v17];
    id v6 = v17;

    v20[1] = v5;
    id v16 = v6;
    v7 = (void *)[objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:@"\\b([0-9]{5})[\\ -]([0-9]{4})[\\ -]([0-9]{1})\\b" options:1 error:&v16];
    id v8 = v16;

    v20[2] = v7;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:3];
    NDC10RegularExpressions = v2->_NDC10RegularExpressions;
    v2->_NDC10RegularExpressions = (NSArray *)v9;

    id v15 = v8;
    uint64_t v11 = [objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:@"\\b([0-9]{5})[\\ -]([0-9]{4})[\\ -]([0-9]{2})\\b" options:1 error:&v15];
    id v12 = v15;

    NDC11RegularExpression = v2->_NDC11RegularExpression;
    v2->_NDC11RegularExpression = (NSRegularExpression *)v11;
  }
  return v2;
}

- (id)parsedNDCCodeFromString:(id)a3
{
  id v4 = a3;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__0;
  v39 = __Block_byref_object_dispose__0;
  id v40 = 0;
  v5 = [(HKMedicationsTextNDCParser *)self NDC11RegularExpression];
  uint64_t v6 = [v4 length];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __54__HKMedicationsTextNDCParser_parsedNDCCodeFromString___block_invoke;
  v32[3] = &unk_264BC3598;
  v34 = &v35;
  id v7 = v4;
  id v33 = v7;
  objc_msgSend(v5, "enumerateMatchesInString:options:range:usingBlock:", v7, 0, 0, v6, v32);

  id v8 = (void *)v36[5];
  if (v8)
  {
    uint64_t v9 = [v8 stringByReplacingOccurrencesOfString:@"-" withString:&stru_26E5DAF10];
    v10 = (void *)v36[5];
    v36[5] = v9;

    uint64_t v11 = [(id)v36[5] stringByReplacingOccurrencesOfString:@" " withString:&stru_26E5DAF10];
    id v12 = (void *)v36[5];
    v36[5] = v11;

    id v13 = (id)v36[5];
  }
  else
  {
    for (unint64_t i = 0; ; ++i)
    {
      id v15 = [(HKMedicationsTextNDCParser *)self NDC10RegularExpressions];
      unint64_t v16 = [v15 count];

      if (i >= v16)
      {
        id v13 = 0;
        goto LABEL_11;
      }
      id v17 = [(HKMedicationsTextNDCParser *)self NDC10RegularExpressions];
      id v18 = [v17 objectAtIndexedSubscript:i];

      uint64_t v19 = [v7 length];
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __54__HKMedicationsTextNDCParser_parsedNDCCodeFromString___block_invoke_2;
      v29[3] = &unk_264BC3598;
      v31 = &v35;
      id v30 = v7;
      objc_msgSend(v18, "enumerateMatchesInString:options:range:usingBlock:", v30, 0, 0, v19, v29);
      v20 = (void *)v36[5];
      if (v20) {
        break;
      }
    }
    if (i < 3)
    {
      uint64_t v21 = qword_230F271E8[i];
      v22 = (void *)[v20 mutableCopy];
      [v22 insertString:@"0" atIndex:v21];
      v23 = (void *)v36[5];
      v36[5] = (uint64_t)v22;

      v20 = (void *)v36[5];
    }
    uint64_t v24 = [v20 stringByReplacingOccurrencesOfString:@"-" withString:&stru_26E5DAF10];
    v25 = (void *)v36[5];
    v36[5] = v24;

    uint64_t v26 = [(id)v36[5] stringByReplacingOccurrencesOfString:@" " withString:&stru_26E5DAF10];
    v27 = (void *)v36[5];
    v36[5] = v26;

    id v13 = (id)v36[5];
  }
LABEL_11:

  _Block_object_dispose(&v35, 8);
  return v13;
}

void __54__HKMedicationsTextNDCParser_parsedNDCCodeFromString___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = [a2 range];
  uint64_t v9 = objc_msgSend(v6, "substringWithRange:", v7, v8);
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  *a4 = 1;
}

void __54__HKMedicationsTextNDCParser_parsedNDCCodeFromString___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = [a2 range];
  uint64_t v9 = objc_msgSend(v6, "substringWithRange:", v7, v8);
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  *a4 = 1;
}

- (NSArray)NDC10RegularExpressions
{
  return self->_NDC10RegularExpressions;
}

- (void)setNDC10RegularExpressions:(id)a3
{
}

- (NSRegularExpression)NDC11RegularExpression
{
  return self->_NDC11RegularExpression;
}

- (void)setNDC11RegularExpression:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_NDC11RegularExpression, 0);
  objc_storeStrong((id *)&self->_NDC10RegularExpressions, 0);
}

@end