@interface FPErrorRedactionHelper
- (FPErrorRedactionHelper)initWithError:(id)a3 depth:(unint64_t)a4;
- (id)description;
- (id)parseErrorIntoStringRedacted:(BOOL)a3;
- (id)redactedDescription;
@end

@implementation FPErrorRedactionHelper

- (FPErrorRedactionHelper)initWithError:(id)a3 depth:(unint64_t)a4
{
  self->_depth = a4;
  return self;
}

- (id)description
{
  return [(FPErrorRedactionHelper *)self parseErrorIntoStringRedacted:0];
}

- (id)redactedDescription
{
  return [(FPErrorRedactionHelper *)self parseErrorIntoStringRedacted:1];
}

- (id)parseErrorIntoStringRedacted:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [MEMORY[0x1E4F28E78] string];
  v6 = [(NSError *)self->_error domain];
  if ([v6 isEqualToString:@"NSFileProviderErrorDomain"])
  {
    v7 = @"FP";
LABEL_7:

    v6 = v7;
    goto LABEL_8;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F281F8]])
  {
    v7 = @"Cocoa";
    goto LABEL_7;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F28798]])
  {
    v7 = @"POSIX";
    goto LABEL_7;
  }
LABEL_8:
  [v5 appendFormat:@"NSError: %@ %li ", v6, -[NSError code](self->_error, "code")];
  v8 = [(NSError *)self->_error userInfo];
  v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F28228]];
  if (v9
    || ([v8 objectForKeyedSubscript:*MEMORY[0x1E4F1D140]],
        (v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (![v9 hasPrefix:@"Error Domain="]) {
      goto LABEL_13;
    }
  }
  uint64_t v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F28568]];

  v9 = (void *)v10;
  if (v10
    || ([(NSError *)self->_error localizedDescription],
        (v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
LABEL_13:
    if (v3)
    {
      v11 = @"\"<private>\"";
    }
    else
    {
      v23 = v9;
      v11 = @"\"%@\"";
    }
    objc_msgSend(v5, "appendFormat:", v11, v23);
  }
  if (v8)
  {
    if (self->_depth > 1)
    {
      [v5 appendString:@" UserInfo={(omitted)}"];
      goto LABEL_38;
    }
    [v5 appendString:@" UserInfo={"];
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__30;
    v37 = __Block_byref_object_dispose__30;
    id v38 = 0;
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2020000000;
    uint64_t v32 = 0;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __55__FPErrorRedactionHelper_parseErrorIntoStringRedacted___block_invoke;
    v24[3] = &unk_1E5AF6298;
    v26 = &v33;
    BOOL v28 = v3;
    id v12 = v5;
    id v25 = v12;
    v27 = &v29;
    [v8 enumerateKeysAndObjectsUsingBlock:v24];
    if (v30[3])
    {
      if (![v12 hasSuffix:@", "]) {
        goto LABEL_25;
      }
      uint64_t v13 = [v12 length] - 2;
      v14 = @"} ";
      uint64_t v15 = 2;
    }
    else
    {
      uint64_t v16 = [v12 length];
      uint64_t v17 = [@" UserInfo={" length];
      uint64_t v15 = [@" UserInfo={" length];
      uint64_t v13 = v16 - v17;
      v14 = @" ";
    }
    objc_msgSend(v12, "replaceCharactersInRange:withString:", v13, v15, v14);
LABEL_25:
    if (v34[5])
    {
      ++v30[3];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = [FPErrorRedactionHelper alloc];
        v19 = [(FPErrorRedactionHelper *)v18 initWithError:v34[5] depth:self->_depth + 1];
        v20 = v19;
        if (v3) {
          [(FPErrorRedactionHelper *)v19 redactedDescription];
        }
        else {
        v21 = [(FPErrorRedactionHelper *)v19 description];
        }
        [v12 appendFormat:@"Underlying={%@}", v21];

        goto LABEL_34;
      }
      if (!v3)
      {
        v20 = [(id)v34[5] description];
        [v12 appendFormat:@"Underlying={%@}", v20];
LABEL_34:

        goto LABEL_35;
      }
      [v12 appendFormat:@"Underlying={<private>}"];
    }
LABEL_35:
    if (v30[3]) {
      [v12 appendString:@"}"];
    }

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(&v33, 8);
  }
LABEL_38:

  return v5;
}

void __55__FPErrorRedactionHelper_parseErrorIntoStringRedacted___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  if (([v16 isEqual:*MEMORY[0x1E4F28228]] & 1) == 0
    && ([v16 isEqual:*MEMORY[0x1E4F28568]] & 1) == 0
    && ([v16 isEqual:*MEMORY[0x1E4F1D140]] & 1) == 0)
  {
    if ([v16 isEqual:*MEMORY[0x1E4F28A50]])
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
      goto LABEL_19;
    }
    if (*(unsigned char *)(a1 + 56))
    {
      v6 = *(void **)(a1 + 32);
      v7 = @"<private>=<private>, ";
LABEL_17:
      objc_msgSend(v6, "appendFormat:", v7, v14, v15);
      goto LABEL_18;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 isFileURL])
    {
      v8 = *(void **)(a1 + 32);
      uint64_t v9 = objc_msgSend(v5, "fp_shortDescription");
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      id v11 = v16;
      if ((isKindOfClass & 1) == 0
        || ([v16 isEqual:*MEMORY[0x1E4F289D0]] & 1) == 0
        && (int v12 = [v16 isEqual:*MEMORY[0x1E4F28328]], v11 = v16, !v12))
      {
        v6 = *(void **)(a1 + 32);
        id v14 = v11;
        id v15 = v5;
        v7 = @"%@=%@, ";
        goto LABEL_17;
      }
      v8 = *(void **)(a1 + 32);
      uint64_t v9 = objc_msgSend(v5, "fp_obfuscatedPath");
    }
    uint64_t v13 = (void *)v9;
    [v8 appendFormat:@"%@=%@, ", v16, v9];

LABEL_18:
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
LABEL_19:
}

- (void).cxx_destruct
{
}

@end