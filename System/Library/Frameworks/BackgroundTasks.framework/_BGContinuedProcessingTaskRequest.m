@interface _BGContinuedProcessingTaskRequest
+ (Class)_correspondingTaskClass;
+ (id)_requestFromActivity:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)iconBundleIdentifier;
- (NSString)reason;
- (NSString)title;
- (_BGContinuedProcessingTaskRequest)initWithIdentifier:(id)a3;
- (_BGContinuedProcessingTaskRequest)initWithIdentifier:(id)a3 iconBundleIdentifier:(id)a4;
- (id)_activity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setIconBundleIdentifier:(id)a3;
- (void)setReason:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation _BGContinuedProcessingTaskRequest

- (_BGContinuedProcessingTaskRequest)initWithIdentifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_BGContinuedProcessingTaskRequest;
  return (_BGContinuedProcessingTaskRequest *)[(BGTaskRequest *)&v4 _initWithIdentifier:a3];
}

- (_BGContinuedProcessingTaskRequest)initWithIdentifier:(id)a3 iconBundleIdentifier:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_BGContinuedProcessingTaskRequest;
  v8 = [(BGTaskRequest *)&v11 _initWithIdentifier:a3];
  v9 = (_BGContinuedProcessingTaskRequest *)v8;
  if (v8) {
    objc_storeStrong(v8 + 5, a4);
  }

  return v9;
}

+ (id)_requestFromActivity:(id)a3
{
  id v4 = a3;
  v5 = [v4 launchReason];
  int v6 = [v5 isEqualToString:*MEMORY[0x263F3B040]];

  if (v6)
  {
    id v7 = objc_alloc((Class)a1);
    v8 = [v4 clientProvidedIdentifier];
    v9 = (void *)[v7 initWithIdentifier:v8];

    v10 = [v4 clientProvidedStartDate];
    [v9 setEarliestBeginDate:v10];

    objc_super v11 = [v4 clientProvidedTitle];
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
  v5 = [(_BGContinuedProcessingTaskRequest *)self title];
  int v6 = [v3 stringWithFormat:@"<_BGContinuedProcessingTaskRequest: %@, title: %@>", v4, v5];

  return v6;
}

+ (Class)_correspondingTaskClass
{
  return (Class)objc_opt_class();
}

- (id)_activity
{
  v24[3] = *MEMORY[0x263EF8340];
  v3 = NSString;
  id v4 = [(BGTaskRequest *)self identifier];
  v22 = [v3 stringWithFormat:@"bgContinuedProcessing-%@", v4];

  v5 = [MEMORY[0x263EFF910] now];
  int v6 = (void *)MEMORY[0x263F3AFC8];
  uint64_t v7 = *MEMORY[0x263F3B068];
  uint64_t v8 = *MEMORY[0x263F3AFE8];
  v23[0] = @"clientProvidedTitle";
  uint64_t v9 = [(_BGContinuedProcessingTaskRequest *)self title];
  v10 = (void *)v9;
  if (v9) {
    objc_super v11 = (__CFString *)v9;
  }
  else {
    objc_super v11 = &stru_26CD18D20;
  }
  v24[0] = v11;
  v23[1] = @"clientProvidedReason";
  uint64_t v12 = [(_BGContinuedProcessingTaskRequest *)self reason];
  v13 = (void *)v12;
  if (v12) {
    v14 = (__CFString *)v12;
  }
  else {
    v14 = &stru_26CD18D20;
  }
  v24[1] = v14;
  v23[2] = @"clientProvidedIconBundleIdentifier";
  iconBundleIdentifier = self->_iconBundleIdentifier;
  v16 = iconBundleIdentifier;
  if (!iconBundleIdentifier)
  {
    v16 = [MEMORY[0x263EFF9D0] null];
  }
  v24[2] = v16;
  v17 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:3];
  v18 = [v6 activityWithName:v22 priority:v7 duration:v8 startingAfter:v5 startingBefore:v5 userInfo:v17];

  if (!iconBundleIdentifier) {
  [v18 setLaunchReason:*MEMORY[0x263F3B040]];
  }
  v19 = [(BGTaskRequest *)self identifier];
  [v18 setClientProvidedIdentifier:v19];

  v20 = [(BGTaskRequest *)self earliestBeginDate];
  [v18 setClientProvidedStartDate:v20];

  return v18;
}

- (unint64_t)hash
{
  v3 = [(BGTaskRequest *)self identifier];
  uint64_t v4 = [v3 hash];
  v5 = [(BGTaskRequest *)self earliestBeginDate];
  uint64_t v6 = v4 ^ (2 * [v5 hash]);
  uint64_t v7 = [(_BGContinuedProcessingTaskRequest *)self title];
  uint64_t v8 = v6 ^ (4 * [v7 hash]);
  uint64_t v9 = [(_BGContinuedProcessingTaskRequest *)self reason];
  unint64_t v10 = v8 ^ (8 * [v9 hash]);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_BGContinuedProcessingTaskRequest *)a3;
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
      uint64_t v7 = [(BGTaskRequest *)self identifier];
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
      objc_super v11 = [(BGTaskRequest *)v5 earliestBeginDate];
      uint64_t v12 = [(BGTaskRequest *)self earliestBeginDate];
      if (v11 != v12)
      {
        v13 = [(BGTaskRequest *)v5 earliestBeginDate];
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
      v15 = [(_BGContinuedProcessingTaskRequest *)v5 title];
      v16 = [(_BGContinuedProcessingTaskRequest *)self title];
      if (v15 == v16)
      {
        [(_BGContinuedProcessingTaskRequest *)v5 reason];
      }
      else
      {
        v17 = [(_BGContinuedProcessingTaskRequest *)v5 title];
        v25 = [(_BGContinuedProcessingTaskRequest *)self title];
        if (!objc_msgSend(v17, "isEqual:"))
        {
          BOOL v10 = 0;
LABEL_28:

LABEL_29:
          v14 = v26;
          v13 = v27;
          if (v11 == v12) {
            goto LABEL_31;
          }
          goto LABEL_30;
        }
        [(_BGContinuedProcessingTaskRequest *)v5 reason];
      v18 = };
      if (v18
        && ([(_BGContinuedProcessingTaskRequest *)self reason],
            (v19 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        BOOL v10 = 1;
      }
      else
      {
        v20 = [(_BGContinuedProcessingTaskRequest *)v5 reason];
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
          v21 = [(_BGContinuedProcessingTaskRequest *)self reason];
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
  v10.receiver = self;
  v10.super_class = (Class)_BGContinuedProcessingTaskRequest;
  id v4 = [(BGTaskRequest *)&v10 copyWithZone:a3];
  v5 = [(BGTaskRequest *)self earliestBeginDate];
  [v4 setEarliestBeginDate:v5];

  uint64_t v6 = [(_BGContinuedProcessingTaskRequest *)self title];
  [v4 setTitle:v6];

  uint64_t v7 = [(_BGContinuedProcessingTaskRequest *)self reason];
  [v4 setReason:v7];

  uint64_t v8 = [(_BGContinuedProcessingTaskRequest *)self iconBundleIdentifier];
  [v4 setIconBundleIdentifier:v8];

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

- (NSString)iconBundleIdentifier
{
  return self->_iconBundleIdentifier;
}

- (void)setIconBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_reason, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end