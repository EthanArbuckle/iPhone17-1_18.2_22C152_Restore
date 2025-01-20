@interface BGContinuedProcessingTaskRequest
+ (Class)_correspondingTaskClass;
+ (id)_requestFromActivity:(id)a3;
- (BGContinuedProcessingTaskRequest)initWithIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)reason;
- (NSString)title;
- (id)_activity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setReason:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation BGContinuedProcessingTaskRequest

- (BGContinuedProcessingTaskRequest)initWithIdentifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BGContinuedProcessingTaskRequest;
  return (BGContinuedProcessingTaskRequest *)[(BGTaskRequest *)&v4 _initWithIdentifier:a3];
}

+ (id)_requestFromActivity:(id)a3
{
  id v4 = a3;
  v5 = [v4 launchReason];
  int v6 = [v5 isEqualToString:*MEMORY[0x263F3B038]];

  if (v6)
  {
    id v7 = objc_alloc((Class)a1);
    v8 = [v4 clientProvidedIdentifier];
    v9 = (void *)[v7 initWithIdentifier:v8];

    v10 = [v4 clientProvidedStartDate];
    [v9 setEarliestBeginDate:v10];

    v11 = [v4 clientProvidedTitle];
    [v9 setTitle:v11];

    v12 = [v4 clientProvidedReason];
    [v9 setReason:v12];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(BGTaskRequest *)self identifier];
  v5 = [(BGContinuedProcessingTaskRequest *)self title];
  int v6 = [v3 stringWithFormat:@"<BGContinuedProcessingTaskRequest: %@, title: %@>", v4, v5];

  return v6;
}

+ (Class)_correspondingTaskClass
{
  return (Class)objc_opt_class();
}

- (id)_activity
{
  v22[2] = *MEMORY[0x263EF8340];
  v3 = NSString;
  id v4 = [(BGTaskRequest *)self identifier];
  v5 = [v3 stringWithFormat:@"bgContinuedProcessing-%@", v4];

  int v6 = [MEMORY[0x263EFF910] now];
  id v7 = (void *)MEMORY[0x263F3AFC8];
  uint64_t v8 = *MEMORY[0x263F3B068];
  uint64_t v9 = *MEMORY[0x263F3AFE8];
  v21[0] = @"clientProvidedTitle";
  uint64_t v10 = [(BGContinuedProcessingTaskRequest *)self title];
  v11 = (void *)v10;
  if (v10) {
    v12 = (__CFString *)v10;
  }
  else {
    v12 = &stru_26CD18D20;
  }
  v21[1] = @"clientProvidedReason";
  v22[0] = v12;
  uint64_t v13 = [(BGContinuedProcessingTaskRequest *)self reason];
  v14 = (void *)v13;
  if (v13) {
    v15 = (__CFString *)v13;
  }
  else {
    v15 = &stru_26CD18D20;
  }
  v22[1] = v15;
  v16 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
  v17 = [v7 activityWithName:v5 priority:v8 duration:v9 startingAfter:v6 startingBefore:v6 userInfo:v16];

  [v17 setLaunchReason:*MEMORY[0x263F3B038]];
  v18 = [(BGTaskRequest *)self identifier];
  [v17 setClientProvidedIdentifier:v18];

  v19 = [(BGTaskRequest *)self earliestBeginDate];
  [v17 setClientProvidedStartDate:v19];

  return v17;
}

- (unint64_t)hash
{
  v3 = [(BGTaskRequest *)self identifier];
  uint64_t v4 = [v3 hash];
  v5 = [(BGTaskRequest *)self earliestBeginDate];
  uint64_t v6 = v4 ^ (2 * [v5 hash]);
  id v7 = [(BGContinuedProcessingTaskRequest *)self title];
  uint64_t v8 = v6 ^ (4 * [v7 hash]);
  uint64_t v9 = [(BGContinuedProcessingTaskRequest *)self reason];
  unint64_t v10 = v8 ^ (8 * [v9 hash]);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (BGContinuedProcessingTaskRequest *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(BGTaskRequest *)v5 identifier];
      id v7 = [(BGTaskRequest *)self identifier];
      if (v6 != v7)
      {
        uint64_t v8 = [(BGTaskRequest *)v5 identifier];
        uint64_t v9 = [(BGTaskRequest *)self identifier];
        if (![v8 isEqual:v9])
        {
          BOOL v10 = 0;
          goto LABEL_32;
        }
        v28 = v9;
        v29 = v8;
      }
      v11 = [(BGTaskRequest *)v5 earliestBeginDate];
      v12 = [(BGTaskRequest *)self earliestBeginDate];
      if (v11 != v12)
      {
        uint64_t v13 = [(BGTaskRequest *)v5 earliestBeginDate];
        v14 = [(BGTaskRequest *)self earliestBeginDate];
        if (![v13 isEqual:v14])
        {
          BOOL v10 = 0;
LABEL_30:

LABEL_31:
          uint64_t v9 = v28;
          uint64_t v8 = v29;
          if (v6 == v7)
          {
LABEL_33:

            goto LABEL_34;
          }
LABEL_32:

          goto LABEL_33;
        }
        v26 = v14;
        v27 = v13;
      }
      v15 = [(BGContinuedProcessingTaskRequest *)v5 title];
      v16 = [(BGContinuedProcessingTaskRequest *)self title];
      if (v15 == v16)
      {
        [(BGContinuedProcessingTaskRequest *)v5 reason];
      }
      else
      {
        v17 = [(BGContinuedProcessingTaskRequest *)v5 title];
        v25 = [(BGContinuedProcessingTaskRequest *)self title];
        if (!objc_msgSend(v17, "isEqual:"))
        {
          BOOL v10 = 0;
LABEL_28:

LABEL_29:
          v14 = v26;
          uint64_t v13 = v27;
          if (v11 == v12) {
            goto LABEL_31;
          }
          goto LABEL_30;
        }
        [(BGContinuedProcessingTaskRequest *)v5 reason];
      v18 = };
      if (v18
        && ([(BGContinuedProcessingTaskRequest *)self reason],
            (v19 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        BOOL v10 = 1;
      }
      else
      {
        v20 = [(BGContinuedProcessingTaskRequest *)v5 reason];
        if (v20)
        {

          BOOL v10 = 0;
          if (!v18)
          {
LABEL_27:
            v17 = v24;
            if (v15 == v16) {
              goto LABEL_29;
            }
            goto LABEL_28;
          }
        }
        else
        {
          v21 = [(BGContinuedProcessingTaskRequest *)self reason];
          BOOL v10 = v21 == 0;

          if (!v18) {
            goto LABEL_27;
          }
        }
        v19 = 0;
      }

      goto LABEL_27;
    }
    BOOL v10 = 0;
  }
LABEL_34:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BGContinuedProcessingTaskRequest;
  id v4 = [(BGTaskRequest *)&v9 copyWithZone:a3];
  v5 = [(BGTaskRequest *)self earliestBeginDate];
  [v4 setEarliestBeginDate:v5];

  uint64_t v6 = [(BGContinuedProcessingTaskRequest *)self title];
  [v4 setTitle:v6];

  id v7 = [(BGContinuedProcessingTaskRequest *)self reason];
  [v4 setReason:v7];

  return v4;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTitle:(id)a3
{
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end