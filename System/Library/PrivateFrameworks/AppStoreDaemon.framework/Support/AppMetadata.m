@interface AppMetadata
+ (Class)databaseEntityClass;
- (AppMetadata)init;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation AppMetadata

- (AppMetadata)init
{
  v3.receiver = self;
  v3.super_class = (Class)AppMetadata;
  return [(SQLiteMemoryEntity *)&v3 init];
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = sub_1003A3938(self);
  v5 = sub_1003A3970(self);
  v6 = sub_1003A39A8(self);
  v7 = sub_1003A39E0(self);
  v8 = sub_1003A3A8C(self);
  v9 = +[NSString stringWithFormat:@"%@ { bundleID: %@ itemID: %@ evid: %@ timestamp: %@ cohort: %@ }", v3, v4, v5, v6, v7, v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v8 = a3;
  if (![v8 isMemberOfClass:objc_opt_class()])
  {
    unsigned __int8 v10 = 0;
    goto LABEL_63;
  }
  v9 = sub_1003A3938(self);
  if (!v9)
  {
    v6 = sub_1003A3938(v8);
    if (!v6)
    {
      int v47 = 0;
      goto LABEL_9;
    }
  }
  v4 = sub_1003A3938(self);
  v5 = sub_1003A3938(v8);
  if ([v4 isEqual:v5])
  {
    int v47 = 1;
LABEL_9:
    v11 = sub_1003A3F1C(self);
    if (v11 || (sub_1003A3F1C(v8), (v44 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v12 = sub_1003A3F1C(self);
      v46 = sub_1003A3F1C(v8);
      if (!objc_msgSend(v12, "isEqual:"))
      {
        unsigned __int8 v10 = 0;
        goto LABEL_55;
      }
      v41 = v12;
      int v45 = 1;
    }
    else
    {
      v44 = 0;
      int v45 = 0;
    }
    v13 = sub_1003A3970(self);
    if (v13 || (sub_1003A3970(v8), (v36 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v14 = sub_1003A3970(self);
      uint64_t v15 = sub_1003A3970(v8);
      v43 = (void *)v14;
      v16 = (void *)v14;
      uint64_t v3 = (void *)v15;
      if (![v16 isEqual:v15])
      {
        unsigned __int8 v10 = 0;
LABEL_50:

LABEL_51:
        if (!v13) {

        }
        if (!v45) {
          goto LABEL_56;
        }
        v12 = v41;
LABEL_55:

LABEL_56:
        if (!v11) {

        }
        if (v47)
        {
        }
        goto LABEL_60;
      }
      int v40 = 1;
    }
    else
    {
      v36 = 0;
      int v40 = 0;
    }
    uint64_t v42 = sub_1003A39A8(self);
    if (v42 || (sub_1003A39A8(v8), (v32 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v17 = v6;
      v18 = sub_1003A39A8(self);
      v37 = sub_1003A39A8(v8);
      v38 = v18;
      if (![v18 isEqual:v37])
      {
        unsigned __int8 v10 = 0;
        v6 = v17;
        goto LABEL_46;
      }
      int v35 = 1;
      v6 = v17;
    }
    else
    {
      v32 = 0;
      int v35 = 0;
    }
    v39 = sub_1003A3A8C(self);
    if (v39 || (sub_1003A3A8C(v8), (v28 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v19 = sub_1003A3A8C(self);
      v33 = sub_1003A3A8C(v8);
      v34 = v19;
      if (![v19 isEqual:v33])
      {
        unsigned __int8 v10 = 0;
LABEL_42:

LABEL_43:
        if (!v39) {

        }
        if (!v35)
        {
LABEL_47:
          v25 = (void *)v42;
          if (!v42)
          {

            v25 = 0;
          }

          if (!v40) {
            goto LABEL_51;
          }
          goto LABEL_50;
        }
LABEL_46:

        goto LABEL_47;
      }
      v31 = v3;
      int v20 = 1;
    }
    else
    {
      v31 = v3;
      v28 = 0;
      int v20 = 0;
    }
    v21 = sub_1003A39E0(self);
    if (v21 || (sub_1003A39E0(v8), (uint64_t v27 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      int v29 = v20;
      v30 = v6;
      v22 = sub_1003A39E0(self);
      v23 = sub_1003A39E0(v8);
      unsigned __int8 v10 = [v22 isEqual:v23];

      if (v21)
      {

        if (!v29)
        {
          v6 = v30;
          uint64_t v3 = v31;
          goto LABEL_43;
        }
        v6 = v30;
        uint64_t v3 = v31;
        goto LABEL_42;
      }
      v6 = v30;
      LOBYTE(v20) = v29;
      v24 = (void *)v27;
    }
    else
    {
      v24 = 0;
      unsigned __int8 v10 = 1;
    }

    uint64_t v3 = v31;
    if ((v20 & 1) == 0) {
      goto LABEL_43;
    }
    goto LABEL_42;
  }

  unsigned __int8 v10 = 0;
LABEL_60:
  if (!v9) {

  }
LABEL_63:
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AppMetadata;
  return [(SQLiteMemoryEntity *)&v4 copyWithZone:a3];
}

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class();
}

@end