@interface CKContextUserFacingUniversalRecent
- (BMUserActivityMetadataEvent)event;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setEvent:(id)a3;
@end

@implementation CKContextUserFacingUniversalRecent

- (unint64_t)hash
{
  v2 = [(CKContextUserFacingUniversalRecent *)self event];
  v3 = [v2 title];
  uint64_t v4 = [v3 hash];
  v5 = [v2 activityType];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [v2 associatedBundleId];
  uint64_t v8 = [v7 hash];
  v9 = [v2 associatedURLString];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [(CKContextUserFacingUniversalRecent *)self event];
    v7 = [v5 event];
    uint64_t v8 = [v6 associatedURLString];
    v9 = [v7 associatedURLString];
    unint64_t v10 = [v6 modeIdentifier];
    v11 = [v7 modeIdentifier];
    v12 = [v6 title];
    if (v12 || ([v7 title], (v29 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v13 = [v6 title];
      v3 = [v7 title];
      v34 = v13;
      if (![v13 isEqualToString:v3])
      {
        char v14 = 0;
        goto LABEL_36;
      }
      unint64_t v33 = (unint64_t)v11;
      int v32 = 1;
    }
    else
    {
      unint64_t v33 = (unint64_t)v11;
      v29 = 0;
      int v32 = 0;
    }
    v15 = [v6 activityType];
    if (v15 || ([v7 activityType], (v25 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v16 = [v6 activityType];
      v30 = [v7 activityType];
      v31 = v16;
      if (!objc_msgSend(v16, "isEqualToString:"))
      {
        char v14 = 0;
        goto LABEL_33;
      }
      unint64_t v27 = (unint64_t)v10;
      int v17 = 1;
    }
    else
    {
      unint64_t v27 = (unint64_t)v10;
      v25 = 0;
      int v17 = 0;
    }
    *(void *)&long long v28 = v9;
    *((void *)&v28 + 1) = v8;
    v18 = [v6 associatedBundleId];
    int v26 = v17;
    if (v18 || ([v7 associatedBundleId], (v24 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v8 = [v6 associatedBundleId];
      v9 = [v7 associatedBundleId];
      if (![v8 isEqualToString:v9])
      {
        char v14 = 0;
        goto LABEL_29;
      }
      int v19 = 1;
    }
    else
    {
      v24 = 0;
      int v19 = 0;
    }
    if (v28 == 0 || (v20 = v19, v21 = objc_msgSend(*((id *)&v28 + 1), "isEqualToString:"), int v19 = v20, v21))
    {
      if (v27 | v33)
      {
        char v23 = v19;
        char v14 = objc_msgSend((id)v27, "isEqualToString:");
        if ((v23 & 1) == 0)
        {
LABEL_30:
          uint64_t v8 = (void *)*((void *)&v28 + 1);
          v9 = (void *)v28;
          if (v18)
          {

            if (v26)
            {
LABEL_32:
              unint64_t v10 = (void *)v27;
LABEL_33:

              if (v15) {
                goto LABEL_34;
              }
              goto LABEL_42;
            }
          }
          else
          {

            if (v26) {
              goto LABEL_32;
            }
          }
          unint64_t v10 = (void *)v27;
          if (v15)
          {
LABEL_34:

            if (v32)
            {
LABEL_35:
              v11 = (void *)v33;
LABEL_36:

              if (v12)
              {
LABEL_38:

                goto LABEL_39;
              }
LABEL_37:

              goto LABEL_38;
            }
LABEL_43:
            v11 = (void *)v33;
            if (v12) {
              goto LABEL_38;
            }
            goto LABEL_37;
          }
LABEL_42:

          if (v32) {
            goto LABEL_35;
          }
          goto LABEL_43;
        }
LABEL_29:

        goto LABEL_30;
      }
      char v14 = 1;
    }
    else
    {
      char v14 = 0;
    }
    if (!v19) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  char v14 = 0;
LABEL_39:

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    id v5 = [(CKContextUserFacingUniversalRecent *)self event];
    [v4 setEvent:v5];
  }
  return v4;
}

- (BMUserActivityMetadataEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end