@interface GKScoreParser
+ (id)formattedDifferenceBetweenFirstScore:(id)a3 secondScore:(id)a4;
- (BOOL)error;
- (NSMutableArray)numericSeparators;
- (NSMutableString)prefix;
- (NSMutableString)suffix;
- (int64_t)colonCount;
- (int64_t)precision;
- (void)parseScore:(id)a3;
- (void)setColonCount:(int64_t)a3;
- (void)setError:(BOOL)a3;
- (void)setNumericSeparators:(id)a3;
- (void)setPrecision:(int64_t)a3;
- (void)setPrefix:(id)a3;
- (void)setSuffix:(id)a3;
@end

@implementation GKScoreParser

- (void)parseScore:(id)a3
{
  id v4 = a3;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__9;
  v14[4] = __Block_byref_object_dispose__9;
  id v15 = 0;
  v5 = objc_opt_new();
  [(GKScoreParser *)self setPrefix:v5];

  v6 = objc_opt_new();
  [(GKScoreParser *)self setSuffix:v6];

  v7 = objc_opt_new();
  [(GKScoreParser *)self setNumericSeparators:v7];

  uint64_t v8 = [v4 length];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __28__GKScoreParser_parseScore___block_invoke;
  v9[3] = &unk_1E6470338;
  v11 = v18;
  v12 = v16;
  v13 = v14;
  v9[4] = self;
  v10 = @" ";
  objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, 2, v9);

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v18, 8);
}

void __28__GKScoreParser_parseScore___block_invoke(uint64_t a1, void *a2)
{
  id v39 = a2;
  int v4 = [v39 characterAtIndex:0];
  int v5 = v4;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(unsigned char *)(v6 + 24))
  {
    if ((v4 - 58) <= 0xFFFFFFF5 && v4 != 45)
    {
      v9 = [*(id *)(a1 + 32) prefix];
      goto LABEL_7;
    }
    *(unsigned char *)(v6 + 24) = 1;
    uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
    if (v4 != 45)
    {
      *(unsigned char *)(v19 + 24) = 0;
      objc_msgSend(*(id *)(a1 + 32), "setPrecision:", objc_msgSend(*(id *)(a1 + 32), "precision") + 1);
      goto LABEL_8;
    }
    goto LABEL_37;
  }
  v7 = [*(id *)(a1 + 32) suffix];
  uint64_t v8 = [v7 length];

  if (v8)
  {
LABEL_3:
    v9 = [*(id *)(a1 + 32) suffix];
LABEL_7:
    v10 = v9;
    [v9 appendString:v39];

    goto LABEL_8;
  }
  if ((v5 - 48) >= 0xA)
  {
    v20 = (id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      id v21 = *v20;
      if (v21 && ([v21 isEqualToString:*(void *)(a1 + 40)] & 1) == 0) {
        [*(id *)(a1 + 32) setError:1];
      }
      v22 = [*(id *)(a1 + 32) suffix];
      [v22 appendString:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

      goto LABEL_3;
    }
    objc_storeStrong(v20, a2);
    uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
LABEL_37:
    *(unsigned char *)(v19 + 24) = 1;
    goto LABEL_8;
  }
  v11 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v11)
  {
    if ([v11 isEqualToString:@":"])
    {
      v12 = *(void **)(a1 + 32);
      uint64_t v13 = [v12 colonCount];
      [v12 setColonCount:v13 + 1];
      if (v13 >= 2) {
        [*(id *)(a1 + 32) setError:1];
      }
    }
    v14 = [*(id *)(a1 + 32) numericSeparators];
    if ([v14 count]
      && ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) isEqualToString:*(void *)(a1 + 40)] & 1) != 0)
    {
      id v15 = [*(id *)(a1 + 32) numericSeparators];
      v16 = [*(id *)(a1 + 32) numericSeparators];
      char v17 = objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v16, "count") - 1);
      char v18 = [v17 isEqualToString:*(void *)(a1 + 40)];

      if ((v18 & 1) == 0) {
        goto LABEL_33;
      }
    }
    else
    {
    }
    v23 = [*(id *)(a1 + 32) numericSeparators];
    uint64_t v24 = [v23 count];

    v25 = [*(id *)(a1 + 32) numericSeparators];
    v26 = v25;
    if (v24)
    {
      v27 = [*(id *)(a1 + 32) numericSeparators];
      v28 = objc_msgSend(v26, "objectAtIndexedSubscript:", objc_msgSend(v27, "count") - 1);
      char v29 = [v28 isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

      v26 = [*(id *)(a1 + 32) numericSeparators];
      unint64_t v30 = [v26 count];
      unint64_t v31 = v30;
      if (v29)
      {
        if (v30 >= 2)
        {
          uint64_t v32 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);

          if (v32)
          {
            [*(id *)(a1 + 32) setError:1];
LABEL_33:
            v33 = [*(id *)(a1 + 32) suffix];
            [v33 appendString:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

LABEL_34:
            v34 = [*(id *)(a1 + 32) suffix];
            [v34 appendString:v39];

LABEL_44:
            uint64_t v36 = *(void *)(*(void *)(a1 + 64) + 8);
            v37 = *(void **)(v36 + 40);
            *(void *)(v36 + 40) = 0;

            goto LABEL_45;
          }
LABEL_43:
          [*(id *)(a1 + 32) setPrecision:1];
          goto LABEL_44;
        }
LABEL_42:

        goto LABEL_43;
      }

      if (v31 != 1)
      {
        v38 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        if (v38 && ([v38 isEqualToString:*(void *)(a1 + 40)] & 1) == 0) {
          [*(id *)(a1 + 32) setError:1];
        }
        goto LABEL_34;
      }
      v25 = [*(id *)(a1 + 32) numericSeparators];
      v26 = v25;
      uint64_t v35 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    }
    else
    {
      uint64_t v35 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    }
    [v25 addObject:v35];
    goto LABEL_42;
  }
  objc_msgSend(*(id *)(a1 + 32), "setPrecision:", objc_msgSend(*(id *)(a1 + 32), "precision") + 1);
LABEL_45:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
LABEL_8:
}

+ (id)formattedDifferenceBetweenFirstScore:(id)a3 secondScore:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  uint64_t v8 = [v5 formattedScore];
  [v7 parseScore:v8];

  v9 = objc_opt_new();
  v10 = [v6 formattedScore];
  [v9 parseScore:v10];

  if ([v7 error] & 1) != 0 || (objc_msgSend(v9, "error"))
  {
    v11 = 0;
    goto LABEL_63;
  }
  uint64_t v12 = [v5 score];
  uint64_t v13 = [v6 score];
  if (v12 - v13 >= 0) {
    unint64_t v14 = v12 - v13;
  }
  else {
    unint64_t v14 = v13 - v12;
  }
  if (v12 != v13)
  {
    v16 = [v7 numericSeparators];
    unint64_t v17 = [v16 count];
    char v18 = [v9 numericSeparators];
    if (v17 >= [v18 count]) {
      uint64_t v19 = v7;
    }
    else {
      uint64_t v19 = v9;
    }
    v20 = [v19 numericSeparators];

    uint64_t v21 = [v7 colonCount];
    if (v21 >= [v9 colonCount]) {
      v22 = v7;
    }
    else {
      v22 = v9;
    }
    uint64_t v23 = [v22 colonCount];
    uint64_t v24 = [v7 precision];
    if (v24 >= [v9 precision]) {
      v25 = v7;
    }
    else {
      v25 = v9;
    }
    uint64_t v26 = [v25 precision];
    if (v23 >= 1)
    {
      if ((unint64_t)[v20 count] < 2)
      {
        if ((unint64_t)v23 > 1) {
          objc_msgSend(NSString, "stringWithFormat:", @"%ld:%02ld:%02ld", v14 / 0xE10, (uint64_t)(v14 % 0xE10) / 60, (uint64_t)(v14 % 0xE10) % 60);
        }
        else {
          objc_msgSend(NSString, "stringWithFormat:", @"%ld:%02ld", v14 / 0x3C, v14 % 0x3C, v52);
        }
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"%ld:%02ld:%05.2f", v14 / 0x57E40, (uint64_t)((double)(v14 % 0x57E40) / 6000.0), (float)((float)(uint64_t)(v14 % 0x57E40 - 6000 * (uint64_t)((double)(v14 % 0x57E40) / 6000.0)) / 100.0));
      }
      id v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_43:
      uint64_t v39 = [v5 score];
      if (v39 >= 0) {
        unint64_t v40 = v39;
      }
      else {
        unint64_t v40 = -v39;
      }
      uint64_t v41 = [v6 score];
      if (v41 >= 0) {
        unint64_t v42 = v41;
      }
      else {
        unint64_t v42 = -v41;
      }
      if (v40 >= v42) {
        v43 = v7;
      }
      else {
        v43 = v9;
      }
      v44 = [v43 prefix];
      uint64_t v45 = [v5 score];
      if (v45 >= 0) {
        unint64_t v46 = v45;
      }
      else {
        unint64_t v46 = -v45;
      }
      uint64_t v47 = [v6 score];
      if (v47 >= 0) {
        unint64_t v48 = v47;
      }
      else {
        unint64_t v48 = -v47;
      }
      if (v46 >= v48) {
        v49 = v7;
      }
      else {
        v49 = v9;
      }
      v50 = [v49 suffix];
      v11 = [NSString stringWithFormat:@"%@%@%@", v44, v15, v50];

      goto LABEL_62;
    }
    uint64_t v27 = v26;
    v28 = [v7 numericSeparators];
    if ([v28 count])
    {
      char v29 = [v9 numericSeparators];
      uint64_t v30 = [v29 count];

      if (v30)
      {
        unint64_t v31 = objc_msgSend(v20, "objectAtIndexedSubscript:", objc_msgSend(v20, "count") - 1);
        uint64_t v32 = [v20 count];
        if (v27 == 3 && v32 == 1) {
          uint64_t v34 = 0;
        }
        else {
          uint64_t v34 = v27;
        }
        goto LABEL_33;
      }
    }
    else
    {
    }
    uint64_t v34 = 0;
    unint64_t v31 = 0;
LABEL_33:
    uint64_t v35 = objc_opt_new();
    if ([v20 count])
    {
      uint64_t v36 = [v20 objectAtIndexedSubscript:0];
      [v35 setGroupingSeparator:v36];
    }
    else
    {
      [v35 setGroupingSeparator:@","];
    }
    [v35 setGroupingSize:3];
    [v35 setUsesGroupingSeparator:1];
    [v35 setDecimalSeparator:v31];
    [v35 setNumberStyle:1];
    [v35 setMinimumFractionDigits:v34];
    [v35 setMaximumFractionDigits:v34];
    if (v31 && v34 >= 1)
    {
      uint64_t v37 = [NSNumber numberWithDouble:(double)(uint64_t)v14 / __exp10((double)v34)];
    }
    else
    {
      uint64_t v37 = [NSNumber numberWithInteger:v14];
    }
    v38 = (void *)v37;
    id v15 = [v35 stringFromNumber:v37];

    goto LABEL_43;
  }
  v11 = 0;
  id v15 = &stru_1F1E47DF8;
LABEL_62:

LABEL_63:

  return v11;
}

- (NSMutableString)prefix
{
  return self->_prefix;
}

- (void)setPrefix:(id)a3
{
}

- (NSMutableString)suffix
{
  return self->_suffix;
}

- (void)setSuffix:(id)a3
{
}

- (NSMutableArray)numericSeparators
{
  return self->_numericSeparators;
}

- (void)setNumericSeparators:(id)a3
{
}

- (int64_t)colonCount
{
  return self->_colonCount;
}

- (void)setColonCount:(int64_t)a3
{
  self->_colonCount = a3;
}

- (int64_t)precision
{
  return self->_precision;
}

- (void)setPrecision:(int64_t)a3
{
  self->_precision = a3;
}

- (BOOL)error
{
  return self->_error;
}

- (void)setError:(BOOL)a3
{
  self->_error = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numericSeparators, 0);
  objc_storeStrong((id *)&self->_suffix, 0);

  objc_storeStrong((id *)&self->_prefix, 0);
}

@end