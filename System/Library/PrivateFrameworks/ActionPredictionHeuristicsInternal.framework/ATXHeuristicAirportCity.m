@interface ATXHeuristicAirportCity
+ (id)cityForAirport:(id)a3;
+ (id)cityForAirport:(id)a3 language:(id)a4;
+ (id)supportedLanguages;
- (NSString)iata;
- (NSString)isoLanguage;
- (NSString)name;
- (double)latitude;
- (double)longitude;
@end

@implementation ATXHeuristicAirportCity

+ (id)supportedLanguages
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v3 = [@"ar,de,en,es,ja,ko,ru,vi,zh" componentsSeparatedByString:@","];
  v4 = (void *)[v2 initWithArray:v3];

  return v4;
}

+ (id)cityForAirport:(id)a3 language:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 length] != 3 || !objc_msgSend(v7, "canBeConvertedToEncoding:", 1))
  {
    uint64_t v37 = 0;
    v9 = v7;
    goto LABEL_17;
  }
  v9 = [v7 uppercaseString];

  v10 = [a1 supportedLanguages];
  int v11 = [v10 containsObject:v8];

  if (!v11)
  {
    uint64_t v37 = 0;
    goto LABEL_17;
  }
  v12 = [MEMORY[0x1E4F28B50] bundleForClass:a1];
  v13 = [v12 pathForResource:@"airport-names" ofType:@"dat"];

  if (!v13)
  {
    v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2 object:a1 file:@"ATXHeuristicAirportCity.m" lineNumber:31 description:@"Airport name data not found"];
  }
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v13 options:1 error:0];
  if (!v14) {
    goto LABEL_26;
  }
  char __little = 0;
  id v15 = v9;
  uint64_t v16 = [v15 UTF8String];
  char v17 = *(unsigned char *)(v16 + 2);
  __int16 v43 = *(_WORD *)v16;
  char v44 = v17;
  id v18 = v14;
  v19 = (char *)memmem((const void *)[v18 bytes], objc_msgSend(v18, "length"), &__little, 4uLL);
  if (!v19) {
    goto LABEL_26;
  }
  v20 = v19;
  id v21 = v18;
  uint64_t v22 = [v21 bytes];
  unint64_t v23 = v22 + [v21 length];
  v24 = v20 + 9;
  if ((unint64_t)(v20 + 9) >= v23) {
    goto LABEL_26;
  }
  id obj = v15;
  uint64_t v25 = v20[8];
  uint64_t v26 = *((unsigned int *)v20 + 1);
  id v27 = v8;
  v28 = v20 + 12;
  if ((unint64_t)(v20 + 12) < v23)
  {
    double v29 = (double)((v26 | (unint64_t)(v25 << 32)) >> 20) * 0.000171661377 + -90.0;
    double v30 = (double)(v26 & 0xFFFFF) * 0.000343322754 + -180.0;
    v31 = (unsigned __int8 *)(v20 + 11);
    v32 = v27;
    while (1)
    {
      if (!*v24 || (v45 = *(_WORD *)v24, uint64_t v33 = *v31, (unint64_t)&v28[v33] >= v23))
      {
LABEL_15:
        uint64_t v37 = 0;
        goto LABEL_22;
      }
      id v34 = v32;
      v35 = (_WORD *)[v34 UTF8String];
      if (v45 == *v35) {
        break;
      }
      v36 = &v24[v33];
      v24 += v33 + 3;
      v31 = v36 + 5;
      v28 = v36 + 6;
      if ((unint64_t)(v36 + 6) >= v23) {
        goto LABEL_15;
      }
    }
    v32 = (void *)[[NSString alloc] initWithBytes:v28 length:v33 encoding:4];

    if (v32)
    {
      uint64_t v39 = objc_opt_new();
      uint64_t v37 = v39;
      if (v39)
      {
        objc_storeStrong((id *)(v39 + 8), obj);
        objc_storeStrong((id *)(v37 + 16), v32);
        objc_storeStrong((id *)(v37 + 24), v34);
        *(double *)(v37 + 32) = v29;
        *(double *)(v37 + 40) = v30;
      }
      goto LABEL_22;
    }
LABEL_26:
    uint64_t v37 = 0;
    goto LABEL_27;
  }
  uint64_t v37 = 0;
  v32 = v27;
LABEL_22:

LABEL_27:
LABEL_17:

  return (id)v37;
}

+ (id)cityForAirport:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA20];
  id v5 = a3;
  v6 = [v4 autoupdatingCurrentLocale];
  id v7 = [v6 languageCode];

  id v8 = [a1 cityForAirport:v5 language:v7];

  return v8;
}

- (NSString)iata
{
  return self->_iata;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)isoLanguage
{
  return self->_isoLanguage;
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isoLanguage, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_iata, 0);
}

@end