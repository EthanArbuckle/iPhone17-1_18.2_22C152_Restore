@interface ECDMARCVerifier
+ (void)partitionDKIMSignatureHeadersByIdentifierAlignment:(id)a3 forSender:(id)a4 strictAligned:(id *)a5 relaxedAligned:(id *)a6 unaligned:(id *)a7;
- (ECDMARCRecordSource)recordSource;
- (ECDMARCVerifier)initWithRecordSource:(id)a3;
- (id)_recordsForDomain:(id)a3 error:(id *)a4;
- (int64_t)_alignmentModeForDMARCRecord:(id)a3;
- (int64_t)_policyForTag:(id)a3 dmarcRecord:(id)a4;
- (int64_t)dmarcStatusForSender:(id)a3 dkimResult:(BOOL)a4 identifierAlignment:(int64_t)a5 receiverPolicy:(int64_t *)a6;
@end

@implementation ECDMARCVerifier

+ (void)partitionDKIMSignatureHeadersByIdentifierAlignment:(id)a3 forSender:(id)a4 strictAligned:(id *)a5 relaxedAligned:(id *)a6 unaligned:(id *)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v22 = a4;
  v26 = [v22 domain];
  if ([v26 length])
  {
    if (a5)
    {
      id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if (a6) {
        goto LABEL_4;
      }
    }
    else
    {
      id v25 = 0;
      if (a6)
      {
LABEL_4:
        unint64_t v24 = (unint64_t)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        if (a7)
        {
LABEL_5:
          unint64_t v11 = (unint64_t)objc_alloc_init(MEMORY[0x1E4F1CA48]);
          goto LABEL_15;
        }
LABEL_14:
        unint64_t v11 = 0;
LABEL_15:
        if (!v25 && !v24 && !v11) {
          goto LABEL_42;
        }
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v12 = v23;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
        v21 = a5;
        v20 = a7;
        v14 = 0;
        if (!v13) {
          goto LABEL_35;
        }
        uint64_t v15 = *(void *)v28;
        while (1)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v28 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            v18 = objc_msgSend(v17, "signingDomainIdentifier", v20);
            if ([v18 length])
            {
              if (objc_msgSend(v18, "ef_caseInsensitiveIsEqualToString:", v26))
              {
                [v25 addObject:v17];
                goto LABEL_33;
              }
              if (v24 | v11)
              {
                if (!v14)
                {
                  v14 = objc_msgSend(v26, "_lp_highLevelDomainFromHost");
                }
                v19 = objc_msgSend(v18, "_lp_highLevelDomainFromHost");
                if (objc_msgSend(v19, "ef_caseInsensitiveIsEqualToString:", v14))
                {
                  [(id)v24 addObject:v17];

                  goto LABEL_33;
                }
              }
            }
            [(id)v11 addObject:v17];
LABEL_33:
          }
          uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
          if (!v13)
          {
LABEL_35:

            if (v21)
            {
              objc_msgSend(v25, "ef_notEmpty");
              id *v21 = (id)objc_claimAutoreleasedReturnValue();
            }
            if (a6)
            {
              objc_msgSend((id)v24, "ef_notEmpty");
              *a6 = (id)objc_claimAutoreleasedReturnValue();
            }
            if (v20)
            {
              objc_msgSend((id)v11, "ef_notEmpty");
              id *v20 = (id)objc_claimAutoreleasedReturnValue();
            }

            goto LABEL_42;
          }
        }
      }
    }
    unint64_t v24 = 0;
    if (a7) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  if (a7) {
    *a7 = v23;
  }
LABEL_42:
}

- (ECDMARCVerifier)initWithRecordSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ECDMARCVerifier;
  v6 = [(ECDMARCVerifier *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_recordSource, a3);
  }

  return v7;
}

- (int64_t)dmarcStatusForSender:(id)a3 dkimResult:(BOOL)a4 identifierAlignment:(int64_t)a5 receiverPolicy:(int64_t *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  unint64_t v11 = v10;
  if (a6) {
    *a6 = 0;
  }
  if (a5 == 2 && v8)
  {
    int64_t v12 = 2;
  }
  else
  {
    uint64_t v13 = [v10 domain];
    id v25 = 0;
    v14 = [(ECDMARCVerifier *)self _recordsForDomain:v13 error:&v25];
    id v15 = v25;
    uint64_t v16 = [v14 count];
    if (!v16)
    {
      id v22 = v15;
      id v23 = v13;
      v17 = objc_msgSend(v13, "_lp_highLevelDomainFromHost");
      id v24 = 0;
      uint64_t v18 = [(ECDMARCVerifier *)self _recordsForDomain:v17 error:&v24];
      id v15 = v24;

      v14 = (void *)v18;
      uint64_t v13 = v23;
    }
    if ([v14 count] == 1
      && ([v14 firstObject], (v19 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      if (v16
        || (int64_t v20 = [(ECDMARCVerifier *)self _policyForTag:@"sp" dmarcRecord:v19]) == 0)
      {
        int64_t v20 = [(ECDMARCVerifier *)self _policyForTag:@"p" dmarcRecord:v19];
      }
      if (a6) {
        *a6 = v20;
      }
      if (v8)
      {
        if ([(ECDMARCVerifier *)self _alignmentModeForDMARCRecord:v19] <= a5) {
          int64_t v12 = 2;
        }
        else {
          int64_t v12 = 3;
        }
      }
      else
      {
        int64_t v12 = 3;
      }
    }
    else
    {
      v19 = 0;
      if (v15) {
        int64_t v12 = 5;
      }
      else {
        int64_t v12 = 1;
      }
    }
  }
  return v12;
}

- (int64_t)_policyForTag:(id)a3 dmarcRecord:(id)a4
{
  v4 = [a4 valueForTag:a3];
  if ([v4 isEqualToString:@"none"])
  {
    int64_t v5 = 1;
  }
  else if ([v4 isEqualToString:@"quarantine"])
  {
    int64_t v5 = 2;
  }
  else if ([v4 isEqualToString:@"reject"])
  {
    int64_t v5 = 3;
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (int64_t)_alignmentModeForDMARCRecord:(id)a3
{
  v3 = [a3 valueForTag:@"adkim"];
  if ([v3 isEqualToString:@"s"]) {
    int64_t v4 = 2;
  }
  else {
    int64_t v4 = 1;
  }

  return v4;
}

- (id)_recordsForDomain:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(ECDMARCVerifier *)self recordSource];
  BOOL v8 = [v7 getDMARCRecordsFromDomain:v6 error:a4];

  objc_super v9 = objc_msgSend(v8, "ef_filter:", &__block_literal_global_4);

  return v9;
}

uint64_t __43__ECDMARCVerifier__recordsForDomain_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 valueForTag:@"v"];
  uint64_t v3 = [v2 isEqualToString:@"DMARC1"];

  return v3;
}

- (ECDMARCRecordSource)recordSource
{
  return self->_recordSource;
}

- (void).cxx_destruct
{
}

@end