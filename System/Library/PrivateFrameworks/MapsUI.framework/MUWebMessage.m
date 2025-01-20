@interface MUWebMessage
- (MUWebMessage)initWithJSONObject:(id)a3;
- (NSCopying)arguments;
- (NSCopying)result;
- (NSDictionary)JSONObject;
- (NSNumber)callNumber;
- (NSString)callee;
- (NSString)caller;
- (NSString)errorMessage;
- (NSString)method;
- (NSString)status;
- (NSString)type;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setArguments:(id)a3;
- (void)setCallNumber:(id)a3;
- (void)setCallee:(id)a3;
- (void)setCaller:(id)a3;
- (void)setErrorMessage:(id)a3;
- (void)setMethod:(id)a3;
- (void)setResult:(id)a3;
- (void)setStatus:(id)a3;
- (void)setType:(id)a3;
@end

@implementation MUWebMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(MUWebMessage *)self type];
  [v4 setType:v5];

  v6 = [(MUWebMessage *)self caller];
  [v4 setCaller:v6];

  v7 = [(MUWebMessage *)self callee];
  [v4 setCallee:v7];

  v8 = [(MUWebMessage *)self method];
  [v4 setMethod:v8];

  v9 = [(MUWebMessage *)self callNumber];
  [v4 setCallNumber:v9];

  v10 = [(MUWebMessage *)self status];
  [v4 setStatus:v10];

  v11 = [(MUWebMessage *)self arguments];
  [v4 setArguments:v11];

  v12 = [(MUWebMessage *)self result];
  [v4 setResult:v12];

  v13 = [(MUWebMessage *)self errorMessage];
  [v4 setErrorMessage:v13];

  return v4;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSString)caller
{
  return self->_caller;
}

- (void)setCaller:(id)a3
{
}

- (NSString)callee
{
  return self->_callee;
}

- (void)setCallee:(id)a3
{
}

- (NSString)method
{
  return self->_method;
}

- (void)setMethod:(id)a3
{
}

- (NSNumber)callNumber
{
  return self->_callNumber;
}

- (void)setCallNumber:(id)a3
{
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (NSCopying)arguments
{
  return self->_arguments;
}

- (void)setArguments:(id)a3
{
}

- (NSCopying)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_callNumber, 0);
  objc_storeStrong((id *)&self->_method, 0);
  objc_storeStrong((id *)&self->_callee, 0);
  objc_storeStrong((id *)&self->_caller, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (MUWebMessage)initWithJSONObject:(id)a3
{
  id v4 = a3;
  v5 = [(MUWebMessage *)self init];
  if (!v5) {
    goto LABEL_37;
  }
  v6 = [v4 objectForKeyedSubscript:@"type"];
  if (v6
    && ([MEMORY[0x1E4F1CA98] null],
        v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v6 isEqual:v7],
        v7,
        !v8))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_51;
    }
    v9 = v5;
    v10 = v6;
  }
  else
  {
    v9 = v5;
    v10 = 0;
  }
  [(MUWebMessage *)v9 setType:v10];
  v11 = [v4 objectForKeyedSubscript:@"caller"];
  if (v11)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
    int v13 = [v11 isEqual:v12];

    if (!v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = v5;
        v15 = v11;
        goto LABEL_8;
      }

LABEL_51:
      goto LABEL_52;
    }
  }
  v14 = v5;
  v15 = 0;
LABEL_8:
  [(MUWebMessage *)v14 setCaller:v15];
  v16 = [v4 objectForKeyedSubscript:@"callee"];
  if (!v16
    || ([MEMORY[0x1E4F1CA98] null],
        v17 = objc_claimAutoreleasedReturnValue(),
        int v18 = [v16 isEqual:v17],
        v17,
        v18))
  {
    v19 = v5;
    v20 = 0;
LABEL_11:
    [(MUWebMessage *)v19 setCallee:v20];
    v21 = [v4 objectForKeyedSubscript:@"method"];
    if (v21
      && ([MEMORY[0x1E4F1CA98] null],
          v22 = objc_claimAutoreleasedReturnValue(),
          int v23 = [v21 isEqual:v22],
          v22,
          !v23))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v51 = 1;
        goto LABEL_35;
      }
      v24 = v5;
      v56 = v21;
      v25 = v21;
    }
    else
    {
      v56 = v21;
      v24 = v5;
      v25 = 0;
    }
    [(MUWebMessage *)v24 setMethod:v25];
    v26 = [v4 objectForKeyedSubscript:@"callNumber"];
    if (v26
      && ([MEMORY[0x1E4F1CA98] null],
          v27 = objc_claimAutoreleasedReturnValue(),
          int v28 = [v26 isEqual:v27],
          v27,
          !v28))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v51 = 1;
        goto LABEL_34;
      }
      v29 = v5;
      v30 = v26;
    }
    else
    {
      v29 = v5;
      v30 = 0;
    }
    [(MUWebMessage *)v29 setCallNumber:v30];
    v31 = [v4 objectForKeyedSubscript:@"status"];
    if (v31
      && ([MEMORY[0x1E4F1CA98] null],
          v32 = objc_claimAutoreleasedReturnValue(),
          int v33 = [v31 isEqual:v32],
          v32,
          !v33))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v51 = 1;
        goto LABEL_33;
      }
      v54 = v16;
      v34 = v5;
      v35 = v31;
    }
    else
    {
      v54 = v16;
      v34 = v5;
      v35 = 0;
    }
    [(MUWebMessage *)v34 setStatus:v35];
    v36 = [v4 objectForKeyedSubscript:@"arguments"];
    v55 = v26;
    if (v36
      && ([MEMORY[0x1E4F1CA98] null],
          v37 = objc_claimAutoreleasedReturnValue(),
          int v38 = [v36 isEqual:v37],
          v37,
          !v38))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v51 = 1;
        goto LABEL_32;
      }
      v39 = v5;
      v40 = v36;
    }
    else
    {
      v39 = v5;
      v40 = 0;
    }
    [(MUWebMessage *)v39 setArguments:v40];
    v41 = [v4 objectForKeyedSubscript:@"result"];
    if (v41
      && ([MEMORY[0x1E4F1CA98] null],
          v42 = objc_claimAutoreleasedReturnValue(),
          int v43 = [v41 isEqual:v42],
          v42,
          !v43))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v51 = 1;
        v26 = v55;
        goto LABEL_31;
      }
      v44 = v5;
      v45 = v41;
    }
    else
    {
      v44 = v5;
      v45 = 0;
    }
    [(MUWebMessage *)v44 setResult:v45];
    v26 = v55;
    v46 = [v4 objectForKeyedSubscript:@"errorMessage"];
    if (v46
      && ([MEMORY[0x1E4F1CA98] null],
          v47 = objc_claimAutoreleasedReturnValue(),
          int v48 = [v46 isEqual:v47],
          v47,
          v26 = v55,
          !v48))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v51 = 1;
        goto LABEL_30;
      }
      v49 = v5;
      v50 = v46;
    }
    else
    {
      v49 = v5;
      v50 = 0;
    }
    [(MUWebMessage *)v49 setErrorMessage:v50];
    int v51 = 0;
LABEL_30:

LABEL_31:
LABEL_32:
    v16 = v54;

LABEL_33:
LABEL_34:
    v21 = v56;

LABEL_35:
    goto LABEL_36;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v19 = v5;
    v20 = v16;
    goto LABEL_11;
  }
  int v51 = 1;
LABEL_36:

  if (v51)
  {
LABEL_52:
    v52 = 0;
    goto LABEL_53;
  }
LABEL_37:
  v52 = v5;
LABEL_53:

  return v52;
}

- (NSDictionary)JSONObject
{
  v32[9] = *MEMORY[0x1E4F143B8];
  v31[0] = @"type";
  uint64_t v3 = [(MUWebMessage *)self type];
  id v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v27 = (void *)v3;
  v32[0] = v3;
  v31[1] = @"caller";
  uint64_t v5 = [(MUWebMessage *)self caller];
  v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v26 = (void *)v5;
  v32[1] = v5;
  v31[2] = @"callee";
  uint64_t v7 = [(MUWebMessage *)self callee];
  int v8 = (void *)v7;
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v25 = (void *)v7;
  v32[2] = v7;
  v31[3] = @"method";
  uint64_t v9 = [(MUWebMessage *)self method];
  v10 = (void *)v9;
  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = (void *)v9;
  v32[3] = v9;
  v31[4] = @"callNumber";
  uint64_t v11 = [(MUWebMessage *)self callNumber];
  v12 = (void *)v11;
  if (!v11)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v29 = v6;
  int v23 = (void *)v11;
  v32[4] = v11;
  v31[5] = @"status";
  uint64_t v13 = [(MUWebMessage *)self status];
  v14 = (void *)v13;
  if (!v13)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v30 = v4;
  v22 = (void *)v13;
  v32[5] = v13;
  v31[6] = @"arguments";
  v15 = [(MUWebMessage *)self arguments];
  v16 = v15;
  if (!v15)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v32[6] = v16;
  v31[7] = @"result";
  v17 = [(MUWebMessage *)self result];
  int v18 = v17;
  if (!v17)
  {
    int v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v32[7] = v18;
  v31[8] = @"errorMessage";
  v19 = [(MUWebMessage *)self errorMessage];
  v20 = v19;
  if (!v19)
  {
    v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v32[8] = v20;
  id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:9];
  if (!v19) {

  }
  if (!v17) {
  if (!v15)
  }

  if (!v14) {
  if (!v12)
  }

  if (!v10) {
  if (!v8)
  }

  if (!v29) {
  if (!v30)
  }

  return (NSDictionary *)v28;
}

- (id)description
{
  v2 = [(MUWebMessage *)self JSONObject];
  uint64_t v3 = [v2 description];

  return v3;
}

@end