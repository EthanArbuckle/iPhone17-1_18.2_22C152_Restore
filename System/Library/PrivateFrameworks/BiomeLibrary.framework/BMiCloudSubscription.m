@interface BMiCloudSubscription
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMiCloudSubscription)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMiCloudSubscription)initWithMlServerScore:(id)a3 totalQuota:(id)a4 totalUsed:(id)a5 totalAvailable:(id)a6 bundleQuotaInBytes:(id)a7 commerceQuotaInBytes:(id)a8 iCloudSubscriptionEventType:(int)a9;
- (BMiCloudSubscription)initWithMlServerScore:(id)a3 totalQuota:(id)a4 totalUsed:(id)a5 totalAvailable:(id)a6 bundleQuotaInBytes:(id)a7 commerceQuotaInBytes:(id)a8 iCloudSubscriptionEventType:(int)a9 displayEntry:(int)a10;
- (BOOL)hasBundleQuotaInBytes;
- (BOOL)hasCommerceQuotaInBytes;
- (BOOL)hasMlServerScore;
- (BOOL)hasTotalAvailable;
- (BOOL)hasTotalQuota;
- (BOOL)hasTotalUsed;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (double)mlServerScore;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)displayEntry;
- (int)iCloudSubscriptionEventType;
- (int64_t)bundleQuotaInBytes;
- (int64_t)commerceQuotaInBytes;
- (int64_t)totalAvailable;
- (int64_t)totalQuota;
- (int64_t)totalUsed;
- (unsigned)dataVersion;
- (void)setHasBundleQuotaInBytes:(BOOL)a3;
- (void)setHasCommerceQuotaInBytes:(BOOL)a3;
- (void)setHasMlServerScore:(BOOL)a3;
- (void)setHasTotalAvailable:(BOOL)a3;
- (void)setHasTotalQuota:(BOOL)a3;
- (void)setHasTotalUsed:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMiCloudSubscription

- (int)displayEntry
{
  return self->_displayEntry;
}

- (int)iCloudSubscriptionEventType
{
  return self->_iCloudSubscriptionEventType;
}

- (void)setHasCommerceQuotaInBytes:(BOOL)a3
{
  self->_hasCommerceQuotaInBytes = a3;
}

- (BOOL)hasCommerceQuotaInBytes
{
  return self->_hasCommerceQuotaInBytes;
}

- (int64_t)commerceQuotaInBytes
{
  return self->_commerceQuotaInBytes;
}

- (void)setHasBundleQuotaInBytes:(BOOL)a3
{
  self->_hasBundleQuotaInBytes = a3;
}

- (BOOL)hasBundleQuotaInBytes
{
  return self->_hasBundleQuotaInBytes;
}

- (int64_t)bundleQuotaInBytes
{
  return self->_bundleQuotaInBytes;
}

- (void)setHasTotalAvailable:(BOOL)a3
{
  self->_hasTotalAvailable = a3;
}

- (BOOL)hasTotalAvailable
{
  return self->_hasTotalAvailable;
}

- (int64_t)totalAvailable
{
  return self->_totalAvailable;
}

- (void)setHasTotalUsed:(BOOL)a3
{
  self->_hasTotalUsed = a3;
}

- (BOOL)hasTotalUsed
{
  return self->_hasTotalUsed;
}

- (int64_t)totalUsed
{
  return self->_totalUsed;
}

- (void)setHasTotalQuota:(BOOL)a3
{
  self->_hasTotalQuota = a3;
}

- (BOOL)hasTotalQuota
{
  return self->_hasTotalQuota;
}

- (int64_t)totalQuota
{
  return self->_totalQuota;
}

- (void)setHasMlServerScore:(BOOL)a3
{
  self->_hasMlServerScore = a3;
}

- (BOOL)hasMlServerScore
{
  return self->_hasMlServerScore;
}

- (double)mlServerScore
{
  return self->_mlServerScore;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([(BMiCloudSubscription *)self hasMlServerScore]
      || [v5 hasMlServerScore])
    {
      if (![(BMiCloudSubscription *)self hasMlServerScore]) {
        goto LABEL_35;
      }
      if (![v5 hasMlServerScore]) {
        goto LABEL_35;
      }
      [(BMiCloudSubscription *)self mlServerScore];
      double v7 = v6;
      [v5 mlServerScore];
      if (v7 != v8) {
        goto LABEL_35;
      }
    }
    if ((![(BMiCloudSubscription *)self hasTotalQuota]
       && ![v5 hasTotalQuota]
       || [(BMiCloudSubscription *)self hasTotalQuota]
       && [v5 hasTotalQuota]
       && (int64_t v9 = -[BMiCloudSubscription totalQuota](self, "totalQuota"), v9 == [v5 totalQuota]))
      && (!-[BMiCloudSubscription hasTotalUsed](self, "hasTotalUsed") && ![v5 hasTotalUsed]
       || [(BMiCloudSubscription *)self hasTotalUsed]
       && [v5 hasTotalUsed]
       && (int64_t v10 = -[BMiCloudSubscription totalUsed](self, "totalUsed"), v10 == [v5 totalUsed]))
      && (![(BMiCloudSubscription *)self hasTotalAvailable]
       && ![v5 hasTotalAvailable]
       || [(BMiCloudSubscription *)self hasTotalAvailable]
       && [v5 hasTotalAvailable]
       && (int64_t v11 = [(BMiCloudSubscription *)self totalAvailable],
           v11 == [v5 totalAvailable]))
      && (![(BMiCloudSubscription *)self hasBundleQuotaInBytes]
       && ![v5 hasBundleQuotaInBytes]
       || [(BMiCloudSubscription *)self hasBundleQuotaInBytes]
       && [v5 hasBundleQuotaInBytes]
       && (int64_t v12 = [(BMiCloudSubscription *)self bundleQuotaInBytes],
           v12 == [v5 bundleQuotaInBytes]))
      && (![(BMiCloudSubscription *)self hasCommerceQuotaInBytes]
       && ![v5 hasCommerceQuotaInBytes]
       || [(BMiCloudSubscription *)self hasCommerceQuotaInBytes]
       && [v5 hasCommerceQuotaInBytes]
       && (int64_t v13 = [(BMiCloudSubscription *)self commerceQuotaInBytes],
           v13 == [v5 commerceQuotaInBytes]))
      && (int v14 = [(BMiCloudSubscription *)self iCloudSubscriptionEventType],
          v14 == [v5 iCloudSubscriptionEventType]))
    {
      int v15 = [(BMiCloudSubscription *)self displayEntry];
      BOOL v16 = v15 == [v5 displayEntry];
    }
    else
    {
LABEL_35:
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (id)jsonDictionary
{
  v29[8] = *MEMORY[0x1E4F143B8];
  if (![(BMiCloudSubscription *)self hasMlServerScore]
    || ([(BMiCloudSubscription *)self mlServerScore], fabs(v3) == INFINITY))
  {
    uint64_t v5 = 0;
  }
  else
  {
    [(BMiCloudSubscription *)self mlServerScore];
    id v4 = NSNumber;
    [(BMiCloudSubscription *)self mlServerScore];
    uint64_t v5 = objc_msgSend(v4, "numberWithDouble:");
  }
  if ([(BMiCloudSubscription *)self hasTotalQuota])
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMiCloudSubscription totalQuota](self, "totalQuota"));
  }
  else
  {
    uint64_t v6 = 0;
  }
  if ([(BMiCloudSubscription *)self hasTotalUsed])
  {
    double v7 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMiCloudSubscription totalUsed](self, "totalUsed"));
  }
  else
  {
    double v7 = 0;
  }
  if ([(BMiCloudSubscription *)self hasTotalAvailable])
  {
    v27 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMiCloudSubscription totalAvailable](self, "totalAvailable"));
  }
  else
  {
    v27 = 0;
  }
  if ([(BMiCloudSubscription *)self hasBundleQuotaInBytes])
  {
    v26 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMiCloudSubscription bundleQuotaInBytes](self, "bundleQuotaInBytes"));
  }
  else
  {
    v26 = 0;
  }
  if ([(BMiCloudSubscription *)self hasCommerceQuotaInBytes])
  {
    double v8 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMiCloudSubscription commerceQuotaInBytes](self, "commerceQuotaInBytes"));
  }
  else
  {
    double v8 = 0;
  }
  int64_t v9 = objc_msgSend(NSNumber, "numberWithInt:", -[BMiCloudSubscription iCloudSubscriptionEventType](self, "iCloudSubscriptionEventType"));
  int64_t v10 = objc_msgSend(NSNumber, "numberWithInt:", -[BMiCloudSubscription displayEntry](self, "displayEntry"));
  v28[0] = @"mlServerScore";
  uint64_t v11 = v5;
  if (!v5)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = (void *)v11;
  v29[0] = v11;
  v28[1] = @"totalQuota";
  uint64_t v12 = v6;
  if (!v6)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v12;
  v29[1] = v12;
  v28[2] = @"totalUsed";
  uint64_t v13 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v25 = (void *)v5;
  v21 = (void *)v13;
  v29[2] = v13;
  v28[3] = @"totalAvailable";
  int v14 = v27;
  if (!v27)
  {
    int v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = (void *)v6;
  v29[3] = v14;
  v28[4] = @"bundleQuotaInBytes";
  int v15 = v26;
  if (!v26)
  {
    int v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v29[4] = v15;
  v28[5] = @"commerceQuotaInBytes";
  BOOL v16 = v8;
  if (!v8)
  {
    BOOL v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v29[5] = v16;
  v28[6] = @"iCloudSubscriptionEventType";
  v17 = v9;
  if (!v9)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v29[6] = v17;
  v28[7] = @"displayEntry";
  v18 = v10;
  if (!v10)
  {
    v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v29[7] = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:8];
  if (v10)
  {
    if (v9) {
      goto LABEL_38;
    }
LABEL_50:

    if (v8) {
      goto LABEL_39;
    }
    goto LABEL_51;
  }

  if (!v9) {
    goto LABEL_50;
  }
LABEL_38:
  if (v8) {
    goto LABEL_39;
  }
LABEL_51:

LABEL_39:
  if (!v26) {

  }
  if (!v27) {
  if (v7)
  }
  {
    if (v24) {
      goto LABEL_45;
    }
LABEL_53:

    if (v25) {
      goto LABEL_46;
    }
    goto LABEL_54;
  }

  if (!v24) {
    goto LABEL_53;
  }
LABEL_45:
  if (v25) {
    goto LABEL_46;
  }
LABEL_54:

LABEL_46:

  return v19;
}

- (BMiCloudSubscription)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v88[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [v6 objectForKeyedSubscript:@"mlServerScore"];
  v71 = a4;
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    int64_t v9 = [v6 objectForKeyedSubscript:@"totalQuota"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v10 = 0;
          v22 = 0;
          goto LABEL_70;
        }
        id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v24 = *MEMORY[0x1E4F502C8];
        uint64_t v85 = *MEMORY[0x1E4F28568];
        v25 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"totalQuota"];
        v86 = v25;
        uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
        v27 = v23;
        uint64_t v11 = (void *)v26;
        id v10 = 0;
        v22 = 0;
        id *v71 = (id)[v27 initWithDomain:v24 code:2 userInfo:v26];
        goto LABEL_69;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    uint64_t v11 = [v6 objectForKeyedSubscript:@"totalUsed"];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v25 = 0;
          v22 = 0;
          goto LABEL_69;
        }
        id v70 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v29 = *MEMORY[0x1E4F502C8];
        uint64_t v83 = *MEMORY[0x1E4F28568];
        id v30 = v10;
        id v31 = [NSString alloc];
        uint64_t v57 = objc_opt_class();
        v32 = v31;
        id v10 = v30;
        id v72 = (id)[v32 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v57, @"totalUsed"];
        id v84 = v72;
        uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v84 forKeys:&v83 count:1];
        uint64_t v34 = v29;
        v35 = (void *)v33;
        v25 = 0;
        v22 = 0;
        id *v71 = (id)[v70 initWithDomain:v34 code:2 userInfo:v33];
LABEL_68:

LABEL_69:
        goto LABEL_70;
      }
      v61 = v9;
      uint64_t v12 = v7;
      uint64_t v13 = self;
      id v69 = v11;
    }
    else
    {
      v61 = v9;
      uint64_t v12 = v7;
      uint64_t v13 = self;
      id v69 = 0;
    }
    uint64_t v14 = [v6 objectForKeyedSubscript:@"totalAvailable"];
    v59 = v11;
    v64 = (void *)v14;
    if (v14 && (int v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v72 = 0;
          v22 = 0;
          v25 = v69;
          self = v13;
          double v7 = v12;
          int64_t v9 = v61;
          v35 = v64;
          goto LABEL_68;
        }
        id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v37 = v10;
        uint64_t v38 = *MEMORY[0x1E4F502C8];
        uint64_t v81 = *MEMORY[0x1E4F28568];
        v39 = a4;
        id v67 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"totalAvailable"];
        id v82 = v67;
        BOOL v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
        v40 = v36;
        uint64_t v11 = v59;
        uint64_t v41 = v38;
        id v10 = v37;
        id v72 = 0;
        v22 = 0;
        id *v39 = (id)[v40 initWithDomain:v41 code:2 userInfo:v16];
        v25 = v69;
        self = v13;
        double v7 = v12;
        int64_t v9 = v61;
        goto LABEL_67;
      }
      id v72 = v15;
    }
    else
    {
      id v72 = 0;
    }
    BOOL v16 = [v6 objectForKeyedSubscript:@"bundleQuotaInBytes"];
    self = v13;
    id v66 = v8;
    if (v16)
    {
      objc_opt_class();
      double v7 = v12;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        int64_t v9 = v61;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v71)
          {
            id v67 = 0;
            v22 = 0;
            goto LABEL_66;
          }
          id v42 = objc_alloc(MEMORY[0x1E4F28C58]);
          id v43 = v10;
          uint64_t v44 = *MEMORY[0x1E4F502C8];
          uint64_t v79 = *MEMORY[0x1E4F28568];
          id v65 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"bundleQuotaInBytes"];
          id v80 = v65;
          v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v80 forKeys:&v79 count:1];
          v45 = v42;
          uint64_t v11 = v59;
          uint64_t v46 = v44;
          id v10 = v43;
          id v67 = 0;
          v22 = 0;
          id *v71 = (id)[v45 initWithDomain:v46 code:2 userInfo:v17];
LABEL_65:

          id v8 = v66;
LABEL_66:
          v25 = v69;
LABEL_67:

          v35 = v64;
          goto LABEL_68;
        }
        id v67 = v16;
LABEL_24:
        v17 = [v6 objectForKeyedSubscript:@"commerceQuotaInBytes"];
        v68 = self;
        id v60 = v10;
        if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v71)
            {
              id v65 = 0;
              v22 = 0;
              goto LABEL_65;
            }
            id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v48 = *MEMORY[0x1E4F502C8];
            uint64_t v77 = *MEMORY[0x1E4F28568];
            v19 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"commerceQuotaInBytes"];
            v78 = v19;
            v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
            id v65 = 0;
            v22 = 0;
            id *v71 = (id)[v47 initWithDomain:v48 code:2 userInfo:v18];
            goto LABEL_64;
          }
          id v65 = v17;
        }
        else
        {
          id v65 = 0;
        }
        v18 = [v6 objectForKeyedSubscript:@"iCloudSubscriptionEventType"];
        if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v28 = v18;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!v71)
              {
                v19 = 0;
                v22 = 0;
                goto LABEL_64;
              }
              id v62 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v53 = *MEMORY[0x1E4F502C8];
              uint64_t v75 = *MEMORY[0x1E4F28568];
              v50 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"iCloudSubscriptionEventType"];
              v76 = v50;
              v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
              id v54 = (id)[v62 initWithDomain:v53 code:2 userInfo:v49];
              v19 = 0;
              v22 = 0;
              id *v71 = v54;
              goto LABEL_63;
            }
            id v28 = [NSNumber numberWithInt:BMiCloudSubscriptionEventTypeFromString(v18)];
          }
          v19 = v28;
        }
        else
        {
          v19 = 0;
        }
        v49 = [v6 objectForKeyedSubscript:@"displayEntry"];
        if (v49 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v51 = v49;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (v71)
              {
                id v63 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v58 = *MEMORY[0x1E4F502C8];
                uint64_t v73 = *MEMORY[0x1E4F28568];
                v55 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"displayEntry"];
                v74 = v55;
                v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
                id *v71 = (id)[v63 initWithDomain:v58 code:2 userInfo:v56];
              }
              v50 = 0;
              v22 = 0;
              goto LABEL_63;
            }
            id v51 = [NSNumber numberWithInt:BMiCloudSubscriptionEntryTypeFromString(v49)];
          }
          v50 = v51;
        }
        else
        {
          v50 = 0;
        }
        v22 = -[BMiCloudSubscription initWithMlServerScore:totalQuota:totalUsed:totalAvailable:bundleQuotaInBytes:commerceQuotaInBytes:iCloudSubscriptionEventType:displayEntry:](v68, "initWithMlServerScore:totalQuota:totalUsed:totalAvailable:bundleQuotaInBytes:commerceQuotaInBytes:iCloudSubscriptionEventType:displayEntry:", v66, v60, v69, v72, v67, v65, __PAIR64__([v50 intValue], objc_msgSend(v19, "intValue")));
        v68 = v22;
LABEL_63:

LABEL_64:
        self = v68;
        uint64_t v11 = v59;
        id v10 = v60;
        goto LABEL_65;
      }
      id v67 = 0;
    }
    else
    {
      id v67 = 0;
      double v7 = v12;
    }
    int64_t v9 = v61;
    goto LABEL_24;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (a4)
  {
    id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v21 = *MEMORY[0x1E4F502C8];
    uint64_t v87 = *MEMORY[0x1E4F28568];
    id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"mlServerScore"];
    v88[0] = v10;
    int64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v88 forKeys:&v87 count:1];
    id v8 = 0;
    v22 = 0;
    id *v71 = (id)[v20 initWithDomain:v21 code:2 userInfo:v9];
LABEL_70:

    goto LABEL_71;
  }
  id v8 = 0;
  v22 = 0;
LABEL_71:

  return v22;
}

- (id)serialize
{
  double v3 = objc_opt_new();
  [(BMiCloudSubscription *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_hasMlServerScore) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasTotalQuota) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_hasTotalUsed) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_hasTotalAvailable) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_hasBundleQuotaInBytes) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_hasCommerceQuotaInBytes) {
    PBDataWriterWriteInt64Field();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v71.receiver = self;
  v71.super_class = (Class)BMiCloudSubscription;
  uint64_t v5 = [(BMEventBase *)&v71 init];
  if (!v5) {
    goto LABEL_113;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  double v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    int64_t v9 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v8]) {
        break;
      }
      char v10 = 0;
      unsigned int v11 = 0;
      unint64_t v12 = 0;
      while (1)
      {
        uint64_t v13 = *v6;
        uint64_t v14 = *(void *)&v4[v13];
        unint64_t v15 = v14 + 1;
        if (v14 == -1 || v15 > *(void *)&v4[*v7]) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        BOOL v17 = v11++ >= 9;
        if (v17)
        {
          unint64_t v12 = 0;
          int v18 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v18 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v18 || (v12 & 7) == 4) {
        break;
      }
      switch((v12 >> 3))
      {
        case 1u:
          v5->_hasMlServerScore = 1;
          uint64_t v20 = *v6;
          unint64_t v21 = *(void *)&v4[v20];
          if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(void *)&v4[*v7])
          {
            double v22 = *(double *)(*(void *)&v4[*v9] + v21);
            *(void *)&v4[v20] = v21 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v22 = 0.0;
          }
          v5->_mlServerScore = v22;
          continue;
        case 2u:
          char v23 = 0;
          unsigned int v24 = 0;
          v25 = 0;
          v5->_hasTotalQuota = 1;
          while (1)
          {
            uint64_t v26 = *v6;
            uint64_t v27 = *(void *)&v4[v26];
            unint64_t v28 = v27 + 1;
            if (v27 == -1 || v28 > *(void *)&v4[*v7]) {
              break;
            }
            char v29 = *(unsigned char *)(*(void *)&v4[*v9] + v27);
            *(void *)&v4[v26] = v28;
            v25 = (objc_class *)(((unint64_t)(v29 & 0x7F) << v23) | (unint64_t)v25);
            if ((v29 & 0x80) == 0) {
              goto LABEL_75;
            }
            v23 += 7;
            BOOL v17 = v24++ >= 9;
            if (v17)
            {
              v25 = 0;
              goto LABEL_77;
            }
          }
          v4[*v8] = 1;
LABEL_75:
          if (v4[*v8]) {
            v25 = 0;
          }
LABEL_77:
          uint64_t v67 = 48;
          goto LABEL_94;
        case 3u:
          char v30 = 0;
          unsigned int v31 = 0;
          v25 = 0;
          v5->_hasTotalUsed = 1;
          while (2)
          {
            uint64_t v32 = *v6;
            uint64_t v33 = *(void *)&v4[v32];
            unint64_t v34 = v33 + 1;
            if (v33 == -1 || v34 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v35 = *(unsigned char *)(*(void *)&v4[*v9] + v33);
              *(void *)&v4[v32] = v34;
              v25 = (objc_class *)(((unint64_t)(v35 & 0x7F) << v30) | (unint64_t)v25);
              if (v35 < 0)
              {
                v30 += 7;
                BOOL v17 = v31++ >= 9;
                if (v17)
                {
                  v25 = 0;
                  goto LABEL_81;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            v25 = 0;
          }
LABEL_81:
          uint64_t v67 = 56;
          goto LABEL_94;
        case 4u:
          char v36 = 0;
          unsigned int v37 = 0;
          v25 = 0;
          v5->_hasTotalAvailable = 1;
          while (2)
          {
            uint64_t v38 = *v6;
            uint64_t v39 = *(void *)&v4[v38];
            unint64_t v40 = v39 + 1;
            if (v39 == -1 || v40 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v41 = *(unsigned char *)(*(void *)&v4[*v9] + v39);
              *(void *)&v4[v38] = v40;
              v25 = (objc_class *)(((unint64_t)(v41 & 0x7F) << v36) | (unint64_t)v25);
              if (v41 < 0)
              {
                v36 += 7;
                BOOL v17 = v37++ >= 9;
                if (v17)
                {
                  v25 = 0;
                  goto LABEL_85;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            v25 = 0;
          }
LABEL_85:
          uint64_t v67 = 64;
          goto LABEL_94;
        case 5u:
          char v42 = 0;
          unsigned int v43 = 0;
          v25 = 0;
          v5->_hasBundleQuotaInBytes = 1;
          while (2)
          {
            uint64_t v44 = *v6;
            uint64_t v45 = *(void *)&v4[v44];
            unint64_t v46 = v45 + 1;
            if (v45 == -1 || v46 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v47 = *(unsigned char *)(*(void *)&v4[*v9] + v45);
              *(void *)&v4[v44] = v46;
              v25 = (objc_class *)(((unint64_t)(v47 & 0x7F) << v42) | (unint64_t)v25);
              if (v47 < 0)
              {
                v42 += 7;
                BOOL v17 = v43++ >= 9;
                if (v17)
                {
                  v25 = 0;
                  goto LABEL_89;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            v25 = 0;
          }
LABEL_89:
          uint64_t v67 = 72;
          goto LABEL_94;
        case 6u:
          char v48 = 0;
          unsigned int v49 = 0;
          v25 = 0;
          v5->_hasCommerceQuotaInBytes = 1;
          while (2)
          {
            uint64_t v50 = *v6;
            uint64_t v51 = *(void *)&v4[v50];
            unint64_t v52 = v51 + 1;
            if (v51 == -1 || v52 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v53 = *(unsigned char *)(*(void *)&v4[*v9] + v51);
              *(void *)&v4[v50] = v52;
              v25 = (objc_class *)(((unint64_t)(v53 & 0x7F) << v48) | (unint64_t)v25);
              if (v53 < 0)
              {
                v48 += 7;
                BOOL v17 = v49++ >= 9;
                if (v17)
                {
                  v25 = 0;
                  goto LABEL_93;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            v25 = 0;
          }
LABEL_93:
          uint64_t v67 = 80;
LABEL_94:
          *(Class *)((char *)&v5->super.super.isa + v67) = v25;
          continue;
        case 7u:
          char v54 = 0;
          unsigned int v55 = 0;
          uint64_t v56 = 0;
          while (2)
          {
            uint64_t v57 = *v6;
            uint64_t v58 = *(void *)&v4[v57];
            unint64_t v59 = v58 + 1;
            if (v58 == -1 || v59 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v60 = *(unsigned char *)(*(void *)&v4[*v9] + v58);
              *(void *)&v4[v57] = v59;
              v56 |= (unint64_t)(v60 & 0x7F) << v54;
              if (v60 < 0)
              {
                v54 += 7;
                BOOL v17 = v55++ >= 9;
                if (v17)
                {
                  LODWORD(v56) = 0;
                  goto LABEL_98;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v56) = 0;
          }
LABEL_98:
          if (v56 >= 6) {
            LODWORD(v56) = 0;
          }
          uint64_t v68 = 28;
          goto LABEL_107;
        case 8u:
          char v61 = 0;
          unsigned int v62 = 0;
          uint64_t v56 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_112;
          }
          continue;
      }
      while (1)
      {
        uint64_t v63 = *v6;
        uint64_t v64 = *(void *)&v4[v63];
        unint64_t v65 = v64 + 1;
        if (v64 == -1 || v65 > *(void *)&v4[*v7]) {
          break;
        }
        char v66 = *(unsigned char *)(*(void *)&v4[*v9] + v64);
        *(void *)&v4[v63] = v65;
        v56 |= (unint64_t)(v66 & 0x7F) << v61;
        if ((v66 & 0x80) == 0) {
          goto LABEL_102;
        }
        v61 += 7;
        BOOL v17 = v62++ >= 9;
        if (v17)
        {
          LODWORD(v56) = 0;
          goto LABEL_104;
        }
      }
      v4[*v8] = 1;
LABEL_102:
      if (v4[*v8]) {
        LODWORD(v56) = 0;
      }
LABEL_104:
      if (v56 >= 5) {
        LODWORD(v56) = 0;
      }
      uint64_t v68 = 32;
LABEL_107:
      *(_DWORD *)((char *)&v5->super.super.isa + v68) = v56;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_112:
  }
    id v69 = 0;
  else {
LABEL_113:
  }
    id v69 = v5;

  return v69;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = NSNumber;
  [(BMiCloudSubscription *)self mlServerScore];
  uint64_t v5 = objc_msgSend(v4, "numberWithDouble:");
  id v6 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMiCloudSubscription totalQuota](self, "totalQuota"));
  double v7 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMiCloudSubscription totalUsed](self, "totalUsed"));
  id v8 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMiCloudSubscription totalAvailable](self, "totalAvailable"));
  int64_t v9 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMiCloudSubscription bundleQuotaInBytes](self, "bundleQuotaInBytes"));
  char v10 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMiCloudSubscription commerceQuotaInBytes](self, "commerceQuotaInBytes"));
  unsigned int v11 = BMiCloudSubscriptionEventTypeAsString([(BMiCloudSubscription *)self iCloudSubscriptionEventType]);
  unint64_t v12 = BMiCloudSubscriptionEntryTypeAsString([(BMiCloudSubscription *)self displayEntry]);
  uint64_t v13 = (void *)[v3 initWithFormat:@"BMiCloudSubscription with mlServerScore: %@, totalQuota: %@, totalUsed: %@, totalAvailable: %@, bundleQuotaInBytes: %@, commerceQuotaInBytes: %@, iCloudSubscriptionEventType: %@, displayEntry: %@", v5, v6, v7, v8, v9, v10, v11, v12];

  return (NSString *)v13;
}

- (BMiCloudSubscription)initWithMlServerScore:(id)a3 totalQuota:(id)a4 totalUsed:(id)a5 totalAvailable:(id)a6 bundleQuotaInBytes:(id)a7 commerceQuotaInBytes:(id)a8 iCloudSubscriptionEventType:(int)a9 displayEntry:(int)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  v30.receiver = self;
  v30.super_class = (Class)BMiCloudSubscription;
  double v22 = [(BMEventBase *)&v30 init];
  if (v22)
  {
    v22->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v16)
    {
      v22->_hasMlServerScore = 1;
      [v16 doubleValue];
    }
    else
    {
      v22->_hasMlServerScore = 0;
      double v23 = -1.0;
    }
    v22->_mlServerScore = v23;
    if (v17)
    {
      v22->_hasTotalQuota = 1;
      uint64_t v24 = [v17 longLongValue];
    }
    else
    {
      v22->_hasTotalQuota = 0;
      uint64_t v24 = -1;
    }
    v22->_totalQuota = v24;
    if (v18)
    {
      v22->_hasTotalUsed = 1;
      uint64_t v25 = [v18 longLongValue];
    }
    else
    {
      v22->_hasTotalUsed = 0;
      uint64_t v25 = -1;
    }
    v22->_totalUsed = v25;
    if (v19)
    {
      v22->_hasTotalAvailable = 1;
      uint64_t v26 = [v19 longLongValue];
    }
    else
    {
      v22->_hasTotalAvailable = 0;
      uint64_t v26 = -1;
    }
    v22->_totalAvailable = v26;
    if (v20)
    {
      v22->_hasBundleQuotaInBytes = 1;
      uint64_t v27 = [v20 longLongValue];
    }
    else
    {
      v22->_hasBundleQuotaInBytes = 0;
      uint64_t v27 = -1;
    }
    v22->_bundleQuotaInBytes = v27;
    if (v21)
    {
      v22->_hasCommerceQuotaInBytes = 1;
      uint64_t v28 = [v21 longLongValue];
    }
    else
    {
      v22->_hasCommerceQuotaInBytes = 0;
      uint64_t v28 = -1;
    }
    v22->_commerceQuotaInBytes = v28;
    v22->_iCloudSubscriptionEventType = a9;
    v22->_displayEntry = a10;
  }

  return v22;
}

+ (id)protoFields
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mlServerScore" number:1 type:0 subMessageClass:0];
  v12[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"totalQuota" number:2 type:3 subMessageClass:0];
  v12[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"totalUsed" number:3 type:3 subMessageClass:0];
  v12[2] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"totalAvailable" number:4 type:3 subMessageClass:0];
  v12[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleQuotaInBytes" number:5 type:3 subMessageClass:0];
  v12[4] = v6;
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"commerceQuotaInBytes" number:6 type:3 subMessageClass:0];
  v12[5] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"iCloudSubscriptionEventType" number:7 type:4 subMessageClass:0];
  v12[6] = v8;
  int64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"displayEntry" number:8 type:4 subMessageClass:0];
  v12[7] = v9;
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5A18;
}

+ (id)columns
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"mlServerScore" dataType:1 requestOnly:0 fieldNumber:1 protoDataType:0 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"totalQuota" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:3 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"totalUsed" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:3 convertedType:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"totalAvailable" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:3 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleQuotaInBytes" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:3 convertedType:0];
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"commerceQuotaInBytes" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:3 convertedType:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"iCloudSubscriptionEventType" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:4 convertedType:0];
  int64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"displayEntry" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:4 convertedType:0];
  v12[0] = v2;
  v12[1] = v3;
  v12[2] = v4;
  v12[3] = v5;
  v12[4] = v6;
  v12[5] = v7;
  v12[6] = v8;
  v12[7] = v9;
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    double v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMiCloudSubscription alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[6] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

- (BMiCloudSubscription)initWithMlServerScore:(id)a3 totalQuota:(id)a4 totalUsed:(id)a5 totalAvailable:(id)a6 bundleQuotaInBytes:(id)a7 commerceQuotaInBytes:(id)a8 iCloudSubscriptionEventType:(int)a9
{
  return -[BMiCloudSubscription initWithMlServerScore:totalQuota:totalUsed:totalAvailable:bundleQuotaInBytes:commerceQuotaInBytes:iCloudSubscriptionEventType:displayEntry:](self, "initWithMlServerScore:totalQuota:totalUsed:totalAvailable:bundleQuotaInBytes:commerceQuotaInBytes:iCloudSubscriptionEventType:displayEntry:", a3, a4, a5, a6, a7, a8, a9);
}

@end