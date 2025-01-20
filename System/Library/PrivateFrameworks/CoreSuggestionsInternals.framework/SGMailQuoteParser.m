@interface SGMailQuoteParser
+ (id)_tofuRegions:(id)a3 utf8:(const char *)a4 isAOSPMail:(BOOL)a5;
+ (id)_xWrote:(id)a3 utf8:(const char *)a4;
+ (id)quotedRegionsFrom:(id)a3 isAOSPMail:(BOOL)a4 foundToEndOfMessage:(BOOL *)a5;
@end

@implementation SGMailQuoteParser

+ (id)quotedRegionsFrom:(id)a3 isAOSPMail:(BOOL)a4 foundToEndOfMessage:(BOOL *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v9 = (void *)MEMORY[0x1CB79B230]();
  id v10 = v8;
  uint64_t v11 = [v10 UTF8String];
  v12 = objc_opt_new();
  v13 = [a1 _tofuRegions:v10 utf8:v11 isAOSPMail:v6];
  [v12 addIndexes:v13];
  if (a5) {
    *a5 = [v13 count] != 0;
  }
  v14 = [a1 _xWrote:v10 utf8:v11];
  [v12 addIndexes:v14];

  return v12;
}

+ (id)_xWrote:(id)a3 utf8:(const char *)a4
{
  id v7 = a3;
  id v8 = (id)objc_opt_new();
  id v4 = v7;
  _PASMemoryHeavyOperation();
  id v5 = v8;

  return v5;
}

void __34__SGMailQuoteParser__xWrote_utf8___block_invoke(uint64_t a1)
{
  v2 = +[SGMailPatterns replyAttributionPattern];
  uint64_t v3 = *(void *)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__SGMailQuoteParser__xWrote_utf8___block_invoke_2;
  v5[3] = &unk_1E65B9F40;
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  [v2 enumerateMatchesInUtf8:v4 fromString:v3 ngroups:0 block:v5];
}

uint64_t __34__SGMailQuoteParser__xWrote_utf8___block_invoke_2(uint64_t a1, unint64_t *a2)
{
  unint64_t v2 = *a2;
  uint64_t v3 = *(void **)(a1 + 32);
  unint64_t v4 = [*(id *)(a1 + 40) length];
  if (v2 <= v4) {
    unint64_t v5 = v4;
  }
  else {
    unint64_t v5 = v2;
  }
  if (v2 >= v4) {
    unint64_t v6 = v4;
  }
  else {
    unint64_t v6 = v2;
  }
  objc_msgSend(v3, "addIndexesInRange:", v6, v5 - v6);
  return 0;
}

+ (id)_tofuRegions:(id)a3 utf8:(const char *)a4 isAOSPMail:(BOOL)a5
{
  BOOL v5 = a5;
  id v6 = a3;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  uint64_t v54 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v45 = MEMORY[0x1E4F143A8];
  uint64_t v46 = 3221225472;
  v47 = __50__SGMailQuoteParser__tofuRegions_utf8_isAOSPMail___block_invoke;
  v48 = &unk_1E65C0728;
  id v49 = v6;
  v50 = &v51;
  _PASMemoryHeavyOperation();
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__24033;
  v43 = __Block_byref_object_dispose__24034;
  id v44 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__24033;
  v37 = __Block_byref_object_dispose__24034;
  id v38 = 0;
  v28[4] = MEMORY[0x1E4F143A8];
  v28[5] = 3221225472;
  v28[6] = __50__SGMailQuoteParser__tofuRegions_utf8_isAOSPMail___block_invoke_16;
  v28[7] = &unk_1E65B9EC8;
  id v7 = v49;
  id v29 = v7;
  v30 = &v51;
  v31 = &v39;
  v32 = &v33;
  _PASMemoryHeavyOperation();
  id v8 = (void *)v40[5];
  if (v8 && v34[5])
  {
    unint64_t v9 = [v8 unsignedIntegerValue];
    unint64_t v10 = [(id)v34[5] unsignedIntegerValue];
    int64_t v11 = v9 >= v10 ? v10 : v9;
    if (v11 < v52[3]) {
      v52[3] = v11;
    }
  }
  if (v5)
  {
    v12 = patterns_24035();
    v13 = [v12 regex2ForKey:@"SXReply"];

    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    v28[3] = 0;
    id v26 = v13;
    id v27 = v7;
    _PASEnumerateSimpleLinesInString();

    _Block_object_dispose(v28, 8);
  }
  uint64_t v14 = [v7 length];
  unint64_t v15 = [v7 length];
  uint64_t v16 = 4000;
  if (v15 < 0xFA0) {
    uint64_t v16 = v15;
  }
  unint64_t v17 = v14 - v16;
  unint64_t v18 = v52[3];
  if (v17 < v18)
  {
    id v25 = v7;
    _PASMemoryHeavyOperation();

    unint64_t v18 = v52[3];
  }
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v19 = objc_opt_new();
  }
  else
  {
    id v20 = objc_alloc(MEMORY[0x1E4F28D60]);
    uint64_t v21 = v52[3];
    uint64_t v22 = [v7 length];
    uint64_t v19 = objc_msgSend(v20, "initWithIndexesInRange:", v21, v22 - v52[3]);
  }
  v23 = (void *)v19;

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v51, 8);
  return v23;
}

void __50__SGMailQuoteParser__tofuRegions_utf8_isAOSPMail___block_invoke(uint64_t a1)
{
  unint64_t v2 = patterns_24035();
  uint64_t v3 = [v2 regex2ForKey:@"OriginalMessage/F"];

  id v5 = *(id *)(a1 + 32);
  id v4 = v3;
  _PASEnumerateSimpleLinesInString();
}

void __50__SGMailQuoteParser__tofuRegions_utf8_isAOSPMail___block_invoke_16(uint64_t a1)
{
  unint64_t v2 = patterns_24035();
  uint64_t v3 = [v2 regex2ForKey:@"BodyHeaders/F"];

  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__SGMailQuoteParser__tofuRegions_utf8_isAOSPMail___block_invoke_2_17;
  v6[3] = &unk_1E65B9EA0;
  id v7 = v4;
  id v8 = v3;
  long long v9 = *(_OWORD *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 56);
  id v5 = v3;
  SGEnumerateBodyHeaderCandidates(v7, v6);
}

BOOL __50__SGMailQuoteParser__tofuRegions_utf8_isAOSPMail___block_invoke_4(uint64_t a1, unint64_t a2, unint64_t a3)
{
  BOOL v4 = a2 + a3 < *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (a3 <= 1)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    return v4;
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  if (a3 > 0x65 || a3 - 1 < 0xA || *(void *)(v5 + 24) < 2uLL)
  {
LABEL_10:
    *(void *)(v5 + 24) = 0;
    return v4;
  }
  id v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) substringWithRange:a2];
  long long v9 = [v7 matchesString:v8];

  if (!v9)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
    goto LABEL_10;
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v4 = 0;
  if (a2 < *(void *)(v10 + 24)) {
    *(void *)(v10 + 24) = a2;
  }
  return v4;
}

void __50__SGMailQuoteParser__tofuRegions_utf8_isAOSPMail___block_invoke_5(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) substringFromIndex:*(void *)(a1 + 48)];
  uint64_t v3 = patterns_24035();
  BOOL v4 = [v3 regex2ForKey:@"CorporateFooter"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__SGMailQuoteParser__tofuRegions_utf8_isAOSPMail___block_invoke_6;
  v6[3] = &unk_1E65B9F18;
  uint64_t v5 = *(void *)(a1 + 48);
  void v6[4] = *(void *)(a1 + 40);
  v6[5] = v5;
  [v4 enumerateMatchesInString:v2 ngroups:0 block:v6];
}

uint64_t __50__SGMailQuoteParser__tofuRegions_utf8_isAOSPMail___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2 = *a2 + *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v2 < *(void *)(v3 + 24)) {
    *(void *)(v3 + 24) = v2;
  }
  return 0;
}

uint64_t __50__SGMailQuoteParser__tofuRegions_utf8_isAOSPMail___block_invoke_2_17(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = (void *)MEMORY[0x1CB79B230]();
  id v7 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a2, a3);
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  BOOL v16 = 0;
  id v8 = *(void **)(a1 + 40);
  BOOL v16 = (unint64_t)(a2 + a3) < *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__SGMailQuoteParser__tofuRegions_utf8_isAOSPMail___block_invoke_3_18;
  v12[3] = &unk_1E65B9E78;
  v12[7] = a2;
  v12[8] = a3;
  uint64_t v9 = *(void *)(a1 + 64);
  v12[4] = *(void *)(a1 + 56);
  v12[5] = &v13;
  v12[6] = v9;
  [v8 enumerateMatchesInString:v7 ngroups:0 block:v12];
  uint64_t v10 = *((unsigned __int8 *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return v10;
}

uint64_t __50__SGMailQuoteParser__tofuRegions_utf8_isAOSPMail___block_invoke_3_18(void *a1, void *a2)
{
  if (!*(void *)(*(void *)(a1[4] + 8) + 40))
  {
    uint64_t v7 = [NSNumber numberWithUnsignedInteger:a1[7] + *a2];
    uint64_t v8 = *(void *)(a1[4] + 8);
    id v6 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
    char v4 = 1;
    goto LABEL_5;
  }
  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    uint64_t v3 = [NSNumber numberWithUnsignedInteger:a1[7] + *a2];
    char v4 = 0;
    uint64_t v5 = *(void *)(a1[6] + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v3;
LABEL_5:

    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v4;
  }
  return 0;
}

uint64_t __50__SGMailQuoteParser__tofuRegions_utf8_isAOSPMail___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  BOOL v14 = 0;
  BOOL v14 = (unint64_t)(a2 + a3) < *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  id v6 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a2, a3);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__SGMailQuoteParser__tofuRegions_utf8_isAOSPMail___block_invoke_3;
  v10[3] = &unk_1E65B9E28;
  v10[6] = a2;
  v10[7] = a3;
  uint64_t v7 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 48);
  v10[5] = &v11;
  [v7 enumerateMatchesInString:v6 ngroups:0 block:v10];
  uint64_t v8 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t __50__SGMailQuoteParser__tofuRegions_utf8_isAOSPMail___block_invoke_3(void *a1, void *a2)
{
  uint64_t v2 = *a2 + a1[6];
  uint64_t v3 = *(void *)(a1[4] + 8);
  if (v2 < *(void *)(v3 + 24)) {
    *(void *)(v3 + 24) = v2;
  }
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
  return 0;
}

@end