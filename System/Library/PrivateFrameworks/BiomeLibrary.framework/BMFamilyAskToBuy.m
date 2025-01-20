@interface BMFamilyAskToBuy
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMFamilyAskToBuy)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMFamilyAskToBuy)initWithRequestID:(id)a3 eventTime:(id)a4 userID:(id)a5 actionUserID:(id)a6 status:(int)a7 itemTitle:(id)a8 itemDescription:(id)a9 itemLocalizedPrice:(id)a10 thumbnailPath:(id)a11 ageRating:(id)a12 starRating:(id)a13 productType:(id)a14 isActionUserDevice:(id)a15 storeLink:(id)a16;
- (BOOL)hasEventTime;
- (BOOL)hasIsActionUserDevice;
- (BOOL)hasStarRating;
- (BOOL)isActionUserDevice;
- (BOOL)isEqual:(id)a3;
- (NSString)actionUserID;
- (NSString)ageRating;
- (NSString)description;
- (NSString)itemDescription;
- (NSString)itemLocalizedPrice;
- (NSString)itemTitle;
- (NSString)productType;
- (NSString)requestID;
- (NSString)storeLink;
- (NSString)thumbnailPath;
- (NSString)userID;
- (double)eventTime;
- (double)starRating;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)status;
- (unsigned)dataVersion;
- (void)setHasEventTime:(BOOL)a3;
- (void)setHasIsActionUserDevice:(BOOL)a3;
- (void)setHasStarRating:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMFamilyAskToBuy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeLink, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_ageRating, 0);
  objc_storeStrong((id *)&self->_thumbnailPath, 0);
  objc_storeStrong((id *)&self->_itemLocalizedPrice, 0);
  objc_storeStrong((id *)&self->_itemDescription, 0);
  objc_storeStrong((id *)&self->_itemTitle, 0);
  objc_storeStrong((id *)&self->_actionUserID, 0);
  objc_storeStrong((id *)&self->_userID, 0);

  objc_storeStrong((id *)&self->_requestID, 0);
}

- (NSString)storeLink
{
  return self->_storeLink;
}

- (void)setHasIsActionUserDevice:(BOOL)a3
{
  self->_hasIsActionUserDevice = a3;
}

- (BOOL)hasIsActionUserDevice
{
  return self->_hasIsActionUserDevice;
}

- (BOOL)isActionUserDevice
{
  return self->_isActionUserDevice;
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setHasStarRating:(BOOL)a3
{
  self->_hasStarRating = a3;
}

- (BOOL)hasStarRating
{
  return self->_hasStarRating;
}

- (double)starRating
{
  return self->_starRating;
}

- (NSString)ageRating
{
  return self->_ageRating;
}

- (NSString)thumbnailPath
{
  return self->_thumbnailPath;
}

- (NSString)itemLocalizedPrice
{
  return self->_itemLocalizedPrice;
}

- (NSString)itemDescription
{
  return self->_itemDescription;
}

- (NSString)itemTitle
{
  return self->_itemTitle;
}

- (int)status
{
  return self->_status;
}

- (NSString)actionUserID
{
  return self->_actionUserID;
}

- (NSString)userID
{
  return self->_userID;
}

- (void)setHasEventTime:(BOOL)a3
{
  self->_hasEventTime = a3;
}

- (BOOL)hasEventTime
{
  return self->_hasEventTime;
}

- (double)eventTime
{
  return self->_eventTime;
}

- (NSString)requestID
{
  return self->_requestID;
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
    v6 = [(BMFamilyAskToBuy *)self requestID];
    uint64_t v7 = [v5 requestID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMFamilyAskToBuy *)self requestID];
      v10 = [v5 requestID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_55;
      }
    }
    if (-[BMFamilyAskToBuy hasEventTime](self, "hasEventTime") || [v5 hasEventTime])
    {
      if (![(BMFamilyAskToBuy *)self hasEventTime]) {
        goto LABEL_55;
      }
      if (![v5 hasEventTime]) {
        goto LABEL_55;
      }
      [(BMFamilyAskToBuy *)self eventTime];
      double v14 = v13;
      [v5 eventTime];
      if (v14 != v15) {
        goto LABEL_55;
      }
    }
    v16 = [(BMFamilyAskToBuy *)self userID];
    uint64_t v17 = [v5 userID];
    if (v16 == (void *)v17)
    {
    }
    else
    {
      v18 = (void *)v17;
      v19 = [(BMFamilyAskToBuy *)self userID];
      v20 = [v5 userID];
      int v21 = [v19 isEqual:v20];

      if (!v21) {
        goto LABEL_55;
      }
    }
    v22 = [(BMFamilyAskToBuy *)self actionUserID];
    uint64_t v23 = [v5 actionUserID];
    if (v22 == (void *)v23)
    {
    }
    else
    {
      v24 = (void *)v23;
      v25 = [(BMFamilyAskToBuy *)self actionUserID];
      v26 = [v5 actionUserID];
      int v27 = [v25 isEqual:v26];

      if (!v27) {
        goto LABEL_55;
      }
    }
    int v28 = [(BMFamilyAskToBuy *)self status];
    if (v28 == [v5 status])
    {
      v29 = [(BMFamilyAskToBuy *)self itemTitle];
      uint64_t v30 = [v5 itemTitle];
      if (v29 == (void *)v30)
      {
      }
      else
      {
        v31 = (void *)v30;
        v32 = [(BMFamilyAskToBuy *)self itemTitle];
        v33 = [v5 itemTitle];
        int v34 = [v32 isEqual:v33];

        if (!v34) {
          goto LABEL_55;
        }
      }
      v35 = [(BMFamilyAskToBuy *)self itemDescription];
      uint64_t v36 = [v5 itemDescription];
      if (v35 == (void *)v36)
      {
      }
      else
      {
        v37 = (void *)v36;
        v38 = [(BMFamilyAskToBuy *)self itemDescription];
        v39 = [v5 itemDescription];
        int v40 = [v38 isEqual:v39];

        if (!v40) {
          goto LABEL_55;
        }
      }
      v41 = [(BMFamilyAskToBuy *)self itemLocalizedPrice];
      uint64_t v42 = [v5 itemLocalizedPrice];
      if (v41 == (void *)v42)
      {
      }
      else
      {
        v43 = (void *)v42;
        v44 = [(BMFamilyAskToBuy *)self itemLocalizedPrice];
        v45 = [v5 itemLocalizedPrice];
        int v46 = [v44 isEqual:v45];

        if (!v46) {
          goto LABEL_55;
        }
      }
      v47 = [(BMFamilyAskToBuy *)self thumbnailPath];
      uint64_t v48 = [v5 thumbnailPath];
      if (v47 == (void *)v48)
      {
      }
      else
      {
        v49 = (void *)v48;
        v50 = [(BMFamilyAskToBuy *)self thumbnailPath];
        v51 = [v5 thumbnailPath];
        int v52 = [v50 isEqual:v51];

        if (!v52) {
          goto LABEL_55;
        }
      }
      v53 = [(BMFamilyAskToBuy *)self ageRating];
      uint64_t v54 = [v5 ageRating];
      if (v53 == (void *)v54)
      {
      }
      else
      {
        v55 = (void *)v54;
        v56 = [(BMFamilyAskToBuy *)self ageRating];
        v57 = [v5 ageRating];
        int v58 = [v56 isEqual:v57];

        if (!v58) {
          goto LABEL_55;
        }
      }
      if (-[BMFamilyAskToBuy hasStarRating](self, "hasStarRating") || [v5 hasStarRating])
      {
        if (![(BMFamilyAskToBuy *)self hasStarRating]) {
          goto LABEL_55;
        }
        if (![v5 hasStarRating]) {
          goto LABEL_55;
        }
        [(BMFamilyAskToBuy *)self starRating];
        double v60 = v59;
        [v5 starRating];
        if (v60 != v61) {
          goto LABEL_55;
        }
      }
      v62 = [(BMFamilyAskToBuy *)self productType];
      uint64_t v63 = [v5 productType];
      if (v62 == (void *)v63)
      {
      }
      else
      {
        v64 = (void *)v63;
        v65 = [(BMFamilyAskToBuy *)self productType];
        v66 = [v5 productType];
        int v67 = [v65 isEqual:v66];

        if (!v67) {
          goto LABEL_55;
        }
      }
      if (![(BMFamilyAskToBuy *)self hasIsActionUserDevice]
        && ![v5 hasIsActionUserDevice]
        || [(BMFamilyAskToBuy *)self hasIsActionUserDevice]
        && [v5 hasIsActionUserDevice]
        && (int v68 = [(BMFamilyAskToBuy *)self isActionUserDevice],
            v68 == [v5 isActionUserDevice]))
      {
        v70 = [(BMFamilyAskToBuy *)self storeLink];
        v71 = [v5 storeLink];
        if (v70 == v71)
        {
          char v12 = 1;
        }
        else
        {
          v72 = [(BMFamilyAskToBuy *)self storeLink];
          v73 = [v5 storeLink];
          char v12 = [v72 isEqual:v73];
        }
        goto LABEL_56;
      }
    }
LABEL_55:
    char v12 = 0;
LABEL_56:

    goto LABEL_57;
  }
  char v12 = 0;
LABEL_57:

  return v12;
}

- (id)jsonDictionary
{
  v53[14] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMFamilyAskToBuy *)self requestID];
  if (![(BMFamilyAskToBuy *)self hasEventTime]
    || ([(BMFamilyAskToBuy *)self eventTime], fabs(v4) == INFINITY))
  {
    uint64_t v6 = 0;
  }
  else
  {
    [(BMFamilyAskToBuy *)self eventTime];
    id v5 = NSNumber;
    [(BMFamilyAskToBuy *)self eventTime];
    uint64_t v6 = objc_msgSend(v5, "numberWithDouble:");
  }
  uint64_t v7 = [(BMFamilyAskToBuy *)self userID];
  v8 = [(BMFamilyAskToBuy *)self actionUserID];
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInt:", -[BMFamilyAskToBuy status](self, "status"));
  uint64_t v10 = [(BMFamilyAskToBuy *)self itemTitle];
  v51 = [(BMFamilyAskToBuy *)self itemDescription];
  v50 = [(BMFamilyAskToBuy *)self itemLocalizedPrice];
  v49 = [(BMFamilyAskToBuy *)self thumbnailPath];
  uint64_t v48 = [(BMFamilyAskToBuy *)self ageRating];
  if (![(BMFamilyAskToBuy *)self hasStarRating]
    || ([(BMFamilyAskToBuy *)self starRating], fabs(v11) == INFINITY))
  {
    v47 = 0;
  }
  else
  {
    [(BMFamilyAskToBuy *)self starRating];
    char v12 = NSNumber;
    [(BMFamilyAskToBuy *)self starRating];
    v47 = objc_msgSend(v12, "numberWithDouble:");
  }
  int v46 = [(BMFamilyAskToBuy *)self productType];
  if ([(BMFamilyAskToBuy *)self hasIsActionUserDevice])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMFamilyAskToBuy isActionUserDevice](self, "isActionUserDevice"));
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = 0;
  }
  double v14 = [(BMFamilyAskToBuy *)self storeLink];
  v52[0] = @"requestID";
  uint64_t v15 = v3;
  if (!v3)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  int v40 = (void *)v15;
  v53[0] = v15;
  v52[1] = @"eventTime";
  uint64_t v16 = v6;
  if (!v6)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v39 = (void *)v16;
  v53[1] = v16;
  v52[2] = @"userID";
  uint64_t v17 = v7;
  if (!v7)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v38 = (void *)v17;
  v53[2] = v17;
  v52[3] = @"actionUserID";
  uint64_t v18 = (uint64_t)v8;
  if (!v8)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v37 = (void *)v18;
  v53[3] = v18;
  v52[4] = @"status";
  uint64_t v19 = v9;
  if (!v9)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v36 = (void *)v19;
  v53[4] = v19;
  v52[5] = @"itemTitle";
  uint64_t v20 = v10;
  if (!v10)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v45 = (void *)v7;
  v35 = (void *)v20;
  v53[5] = v20;
  v52[6] = @"itemDescription";
  uint64_t v21 = (uint64_t)v51;
  if (!v51)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v44 = (void *)v9;
  v53[6] = v21;
  v52[7] = @"itemLocalizedPrice";
  uint64_t v22 = (uint64_t)v50;
  if (!v50)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v43 = (void *)v10;
  v53[7] = v22;
  v52[8] = @"thumbnailPath";
  uint64_t v23 = v49;
  if (!v49)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v53[8] = v23;
  v52[9] = @"ageRating";
  v24 = v48;
  if (!v48)
  {
    v24 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v32 = v22;
  int v34 = (void *)v21;
  uint64_t v42 = (void *)v6;
  v53[9] = v24;
  v52[10] = @"starRating";
  v25 = v47;
  if (!v47)
  {
    v25 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v22, v34, v35, v36, v37, v38, v39, v40);
  }
  v26 = (void *)v3;
  v53[10] = v25;
  v52[11] = @"productType";
  int v27 = v46;
  if (!v46)
  {
    int v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v53[11] = v27;
  v52[12] = @"isActionUserDevice";
  int v28 = v13;
  v29 = v13;
  if (!v13)
  {
    int v28 = [MEMORY[0x1E4F1CA98] null];
  }
  v53[12] = v28;
  v52[13] = @"storeLink";
  uint64_t v30 = v14;
  if (!v14)
  {
    uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
  }
  v53[13] = v30;
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v53, v52, 14, v32);
  id v41 = (id)objc_claimAutoreleasedReturnValue();
  if (!v14) {

  }
  if (!v29) {
  if (!v46)
  }

  if (!v47) {
  if (!v48)
  }

  if (!v49) {
  if (!v50)
  }

  if (!v51) {
  if (v43)
  }
  {
    if (v44) {
      goto LABEL_58;
    }
  }
  else
  {

    if (v44)
    {
LABEL_58:
      if (v8) {
        goto LABEL_59;
      }
      goto LABEL_67;
    }
  }

  if (v8)
  {
LABEL_59:
    if (v45) {
      goto LABEL_60;
    }
    goto LABEL_68;
  }
LABEL_67:

  if (v45)
  {
LABEL_60:
    if (v42) {
      goto LABEL_61;
    }
LABEL_69:

    if (v26) {
      goto LABEL_62;
    }
    goto LABEL_70;
  }
LABEL_68:

  if (!v42) {
    goto LABEL_69;
  }
LABEL_61:
  if (v26) {
    goto LABEL_62;
  }
LABEL_70:

LABEL_62:

  return v41;
}

- (BMFamilyAskToBuy)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v152[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"requestID"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    uint64_t v9 = [v6 objectForKeyedSubscript:@"eventTime"];
    id v124 = v6;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v10 = 0;
          int v27 = 0;
          goto LABEL_80;
        }
        id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v97 = v8;
        v29 = a4;
        uint64_t v30 = *MEMORY[0x1E4F502C8];
        uint64_t v149 = *MEMORY[0x1E4F28568];
        uint64_t v31 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"eventTime"];
        uint64_t v150 = v31;
        double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v150 forKeys:&v149 count:1];
        uint64_t v32 = (void *)v31;
        id v10 = 0;
        int v27 = 0;
        id *v29 = (id)[v28 initWithDomain:v30 code:2 userInfo:v11];
        id v8 = v97;
        goto LABEL_79;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    double v11 = [v6 objectForKeyedSubscript:@"userID"];
    v123 = v11;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v104 = v9;
      v107 = v7;
      id v21 = v10;
      id v22 = v8;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          uint64_t v32 = 0;
          int v27 = 0;
          id v10 = v21;
          uint64_t v9 = v104;
          goto LABEL_79;
        }
        id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
        v119 = self;
        uint64_t v34 = *MEMORY[0x1E4F502C8];
        uint64_t v147 = *MEMORY[0x1E4F28568];
        uint64_t v35 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"userID"];
        uint64_t v148 = v35;
        uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v148 forKeys:&v147 count:1];
        uint64_t v37 = v34;
        double v11 = v123;
        uint64_t v32 = 0;
        v115 = 0;
        *a4 = (id)[v33 initWithDomain:v37 code:2 userInfo:v36];
        id v38 = v22;
        v39 = (id *)v35;
        id v10 = v21;
        uint64_t v9 = v104;
        uint64_t v15 = v107;
        int v40 = (void *)v36;
        self = v119;
        a4 = v39;
LABEL_78:

        id v8 = v38;
        uint64_t v7 = v15;
        int v27 = v115;
LABEL_79:

        id v6 = v124;
        goto LABEL_80;
      }
      id v114 = v11;
      id v10 = v21;
      uint64_t v9 = v104;
    }
    else
    {
      id v114 = 0;
    }
    uint64_t v12 = [v6 objectForKeyedSubscript:@"actionUserID"];
    v111 = (void *)v12;
    v122 = a4;
    if (v12)
    {
      id v13 = (void *)v12;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v15 = v7;
          id v38 = v8;
          int v40 = v13;
          if (!a4)
          {
            v115 = 0;
            uint64_t v32 = v114;
            goto LABEL_78;
          }
          id v120 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v41 = *MEMORY[0x1E4F502C8];
          uint64_t v145 = *MEMORY[0x1E4F28568];
          id v112 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"actionUserID"];
          id v146 = v112;
          uint64_t v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v146 forKeys:&v145 count:1];
          uint64_t v43 = v41;
          v44 = (void *)v42;
          v113 = 0;
          v115 = 0;
          id *v122 = (id)[v120 initWithDomain:v43 code:2 userInfo:v42];
          uint64_t v32 = v114;
          goto LABEL_77;
        }
        v118 = self;
        double v14 = v124;
        uint64_t v15 = v7;
        uint64_t v16 = v9;
        id v17 = v10;
        uint64_t v18 = v13;
LABEL_19:
        uint64_t v19 = [v14 objectForKeyedSubscript:@"status"];
        v113 = v18;
        v102 = (void *)v19;
        v110 = v17;
        if (v19 && (uint64_t v20 = (void *)v19, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v112 = v20;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!v122)
              {
                id v112 = 0;
                v115 = 0;
                uint64_t v32 = v114;
                v44 = v20;
                id v10 = v17;
                uint64_t v9 = v16;
                id v38 = v8;
                self = v118;
                goto LABEL_77;
              }
              id v78 = objc_alloc(MEMORY[0x1E4F28C58]);
              v106 = v16;
              uint64_t v79 = *MEMORY[0x1E4F502C8];
              uint64_t v143 = *MEMORY[0x1E4F28568];
              id v109 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"status"];
              id v144 = v109;
              [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v144 forKeys:&v143 count:1];
              self = v118;
              v108 = uint64_t v9 = v106;
              id v112 = 0;
              v115 = 0;
              id *v122 = (id)objc_msgSend(v78, "initWithDomain:code:userInfo:", v79, 2);
              uint64_t v32 = v114;
              v44 = v20;
LABEL_76:
              id v38 = v8;

              id v10 = v110;
LABEL_77:

              a4 = v113;
              int v40 = v111;
              goto LABEL_78;
            }
            id v112 = [NSNumber numberWithInt:BMFamilyAskToBuyRequestStatusFromString(v20)];
          }
        }
        else
        {
          id v112 = 0;
        }
        uint64_t v45 = [v14 objectForKeyedSubscript:@"itemTitle"];
        v108 = (void *)v45;
        if (v45)
        {
          int v46 = (void *)v45;
          objc_opt_class();
          uint64_t v9 = v16;
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            v47 = v15;
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!v122)
              {
                id v109 = 0;
                v115 = 0;
                uint64_t v32 = v114;
                v44 = v102;
                self = v118;
                goto LABEL_76;
              }
              id v70 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v71 = *MEMORY[0x1E4F502C8];
              uint64_t v141 = *MEMORY[0x1E4F28568];
              id v103 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"itemTitle"];
              id v142 = v103;
              [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v142 forKeys:&v141 count:1];
              v101 = self = v118;
              v115 = 0;
              id v109 = 0;
              id *v122 = (id)objc_msgSend(v70, "initWithDomain:code:userInfo:", v71, 2);
              uint64_t v32 = v114;
              v44 = v102;
              goto LABEL_75;
            }
            id v109 = v46;
LABEL_43:
            uint64_t v48 = v14;
            uint64_t v49 = [v14 objectForKeyedSubscript:@"itemDescription"];
            v101 = (void *)v49;
            if (v49 && (v50 = (void *)v49, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!v122)
                {
                  id v103 = 0;
                  v115 = 0;
                  uint64_t v32 = v114;
                  v44 = v102;
                  self = v118;
                  goto LABEL_75;
                }
                id v72 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v73 = *MEMORY[0x1E4F502C8];
                uint64_t v139 = *MEMORY[0x1E4F28568];
                id v100 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"itemDescription"];
                id v140 = v100;
                [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v140 forKeys:&v139 count:1];
                v99 = self = v118;
                v115 = 0;
                id v103 = 0;
                id *v122 = (id)objc_msgSend(v72, "initWithDomain:code:userInfo:", v73, 2);
                uint64_t v32 = v114;
                v44 = v102;
LABEL_74:

LABEL_75:
                uint64_t v15 = v47;

                goto LABEL_76;
              }
              id v103 = v50;
            }
            else
            {
              id v103 = 0;
            }
            uint64_t v51 = [v14 objectForKeyedSubscript:@"itemLocalizedPrice"];
            v99 = (void *)v51;
            if (v51 && (int v52 = (void *)v51, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!v122)
                {
                  id v100 = 0;
                  v115 = 0;
                  uint64_t v32 = v114;
                  v44 = v102;
                  self = v118;
                  goto LABEL_74;
                }
                id v74 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v75 = *MEMORY[0x1E4F502C8];
                uint64_t v137 = *MEMORY[0x1E4F28568];
                id v96 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"itemLocalizedPrice"];
                id v138 = v96;
                [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v138 forKeys:&v137 count:1];
                v95 = self = v118;
                v115 = 0;
                id v100 = 0;
                id *v122 = (id)objc_msgSend(v74, "initWithDomain:code:userInfo:", v75, 2);
                uint64_t v32 = v114;
                v44 = v102;
                goto LABEL_73;
              }
              id v100 = v52;
            }
            else
            {
              id v100 = 0;
            }
            uint64_t v53 = [v14 objectForKeyedSubscript:@"thumbnailPath"];
            v95 = (void *)v53;
            if (v53 && (uint64_t v54 = (void *)v53, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!v122)
                {
                  id v96 = 0;
                  v115 = 0;
                  uint64_t v32 = v114;
                  v44 = v102;
                  self = v118;
                  goto LABEL_73;
                }
                id v76 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v77 = *MEMORY[0x1E4F502C8];
                uint64_t v135 = *MEMORY[0x1E4F28568];
                id v94 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"thumbnailPath"];
                id v136 = v94;
                [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v136 forKeys:&v135 count:1];
                v93 = self = v118;
                v115 = 0;
                id v96 = 0;
                id *v122 = (id)objc_msgSend(v76, "initWithDomain:code:userInfo:", v77, 2);
                uint64_t v32 = v114;
                v44 = v102;
LABEL_72:

LABEL_73:
                goto LABEL_74;
              }
              id v96 = v54;
            }
            else
            {
              id v96 = 0;
            }
            uint64_t v55 = [v14 objectForKeyedSubscript:@"ageRating"];
            v93 = (void *)v55;
            if (v55 && (v56 = (void *)v55, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!v122)
                {
                  id v94 = 0;
                  v115 = 0;
                  uint64_t v32 = v114;
                  v44 = v102;
                  self = v118;
                  goto LABEL_72;
                }
                id v80 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v81 = *MEMORY[0x1E4F502C8];
                uint64_t v133 = *MEMORY[0x1E4F28568];
                int v68 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"ageRating"];
                v134 = v68;
                [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v134 forKeys:&v133 count:1];
                v57 = self = v118;
                v115 = 0;
                id v94 = 0;
                id *v122 = (id)objc_msgSend(v80, "initWithDomain:code:userInfo:", v81, 2);
                uint64_t v32 = v114;
                v44 = v102;
                goto LABEL_71;
              }
              id v94 = v56;
            }
            else
            {
              id v94 = 0;
            }
            v57 = [v14 objectForKeyedSubscript:@"starRating"];
            if (v57 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!v122)
                {
                  int v68 = 0;
                  v115 = 0;
                  uint64_t v32 = v114;
                  v44 = v102;
                  self = v118;
                  goto LABEL_71;
                }
                id v82 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v83 = *MEMORY[0x1E4F502C8];
                uint64_t v131 = *MEMORY[0x1E4F28568];
                id v92 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"starRating"];
                id v132 = v92;
                [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v132 forKeys:&v131 count:1];
                v91 = self = v118;
                v115 = 0;
                int v68 = 0;
                id *v122 = (id)objc_msgSend(v82, "initWithDomain:code:userInfo:", v83, 2);
                uint64_t v32 = v114;
                v44 = v102;
LABEL_70:

LABEL_71:
                goto LABEL_72;
              }
              id v105 = v57;
            }
            else
            {
              id v105 = 0;
            }
            uint64_t v58 = [v14 objectForKeyedSubscript:@"productType"];
            v91 = (void *)v58;
            if (v58 && (double v59 = (void *)v58, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!v122)
                {
                  id v92 = 0;
                  v115 = 0;
                  uint64_t v32 = v114;
                  v44 = v102;
                  self = v118;
                  int v68 = v105;
                  goto LABEL_70;
                }
                id v84 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v85 = *MEMORY[0x1E4F502C8];
                uint64_t v129 = *MEMORY[0x1E4F28568];
                int v67 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"productType"];
                v130 = v67;
                double v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v130 forKeys:&v129 count:1];
                v115 = 0;
                id v92 = 0;
                id *v122 = (id)[v84 initWithDomain:v85 code:2 userInfo:v60];
                goto LABEL_134;
              }
              id v92 = v59;
            }
            else
            {
              id v92 = 0;
            }
            double v60 = [v14 objectForKeyedSubscript:@"isActionUserDevice"];
            id v98 = v8;
            if (!v60 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              double v61 = v47;
              uint64_t v63 = v118;
              v62 = v122;
              id v64 = 0;
              goto LABEL_64;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              double v61 = v47;
              uint64_t v63 = v118;
              v62 = v122;
              id v64 = v60;
LABEL_64:
              v65 = [v48 objectForKeyedSubscript:@"storeLink"];
              if (v65 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                objc_opt_class();
                int v67 = v64;
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v47 = v61;
                  if (v62)
                  {
                    v88 = v62;
                    id v121 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v117 = *MEMORY[0x1E4F502C8];
                    uint64_t v125 = *MEMORY[0x1E4F28568];
                    v89 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"storeLink"];
                    v126 = v89;
                    v90 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v126 forKeys:&v125 count:1];
                    id *v88 = (id)[v121 initWithDomain:v117 code:2 userInfo:v90];
                  }
                  id v66 = 0;
                  v115 = 0;
                  int v68 = v105;
                  id v8 = v98;
                  goto LABEL_68;
                }
                id v66 = v65;
              }
              else
              {
                id v66 = 0;
                int v67 = v64;
              }
              v47 = v61;
              int v68 = v105;
              id v8 = v98;
              uint64_t v63 = -[BMFamilyAskToBuy initWithRequestID:eventTime:userID:actionUserID:status:itemTitle:itemDescription:itemLocalizedPrice:thumbnailPath:ageRating:starRating:productType:isActionUserDevice:storeLink:](v63, "initWithRequestID:eventTime:userID:actionUserID:status:itemTitle:itemDescription:itemLocalizedPrice:thumbnailPath:ageRating:starRating:productType:isActionUserDevice:storeLink:", v98, v110, v114, v113, [v112 intValue], v109, v103, v100, v96, v94, v105, v92, v67, v66);
              v115 = v63;
LABEL_68:
              v118 = v63;

              double v11 = v123;
LABEL_69:

              uint64_t v32 = v114;
              v44 = v102;
              self = v118;
              goto LABEL_70;
            }
            if (v122)
            {
              uint64_t v63 = v118;
              id v86 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v116 = *MEMORY[0x1E4F502C8];
              uint64_t v127 = *MEMORY[0x1E4F28568];
              id v66 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isActionUserDevice"];
              id v128 = v66;
              v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v128 forKeys:&v127 count:1];
              id v87 = (id)[v86 initWithDomain:v116 code:2 userInfo:v65];
              v115 = 0;
              int v67 = 0;
              id *v122 = v87;
              int v68 = v105;
              goto LABEL_68;
            }
            int v67 = 0;
            v115 = 0;
LABEL_134:
            int v68 = v105;
            goto LABEL_69;
          }
          id v109 = 0;
        }
        else
        {
          id v109 = 0;
          uint64_t v9 = v16;
        }
        v47 = v15;
        goto LABEL_43;
      }
      v118 = self;
      double v14 = v124;
    }
    else
    {
      v118 = self;
      double v14 = v6;
    }
    uint64_t v15 = v7;
    uint64_t v16 = v9;
    id v17 = v10;
    uint64_t v18 = 0;
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    id v8 = 0;
    int v27 = 0;
    goto LABEL_81;
  }
  id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
  id v24 = v6;
  v25 = a4;
  uint64_t v26 = *MEMORY[0x1E4F502C8];
  uint64_t v151 = *MEMORY[0x1E4F28568];
  id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"requestID"];
  v152[0] = v10;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v152 forKeys:&v151 count:1];
  id v8 = 0;
  int v27 = 0;
  id *v25 = (id)[v23 initWithDomain:v26 code:2 userInfo:v9];
  id v6 = v24;
LABEL_80:

LABEL_81:
  return v27;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMFamilyAskToBuy *)self writeTo:v3];
  double v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (self->_requestID) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasEventTime) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_userID) {
    PBDataWriterWriteStringField();
  }
  if (self->_actionUserID) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_itemTitle) {
    PBDataWriterWriteStringField();
  }
  if (self->_itemDescription) {
    PBDataWriterWriteStringField();
  }
  double v4 = v5;
  if (self->_itemLocalizedPrice)
  {
    PBDataWriterWriteStringField();
    double v4 = v5;
  }
  if (self->_thumbnailPath)
  {
    PBDataWriterWriteStringField();
    double v4 = v5;
  }
  if (self->_ageRating)
  {
    PBDataWriterWriteStringField();
    double v4 = v5;
  }
  if (self->_hasStarRating)
  {
    PBDataWriterWriteFloatField();
    double v4 = v5;
  }
  if (self->_productType)
  {
    PBDataWriterWriteStringField();
    double v4 = v5;
  }
  if (self->_hasIsActionUserDevice)
  {
    PBDataWriterWriteBOOLField();
    double v4 = v5;
  }
  if (self->_storeLink)
  {
    PBDataWriterWriteStringField();
    double v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  double v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)BMFamilyAskToBuy;
  id v5 = [(BMEventBase *)&v46 init];
  if (!v5) {
    goto LABEL_72;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    uint64_t v9 = (int *)MEMORY[0x1E4F940B8];
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
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 32;
          goto LABEL_52;
        case 2u:
          v5->_hasEventTime = 1;
          uint64_t v22 = *v6;
          unint64_t v23 = *(void *)&v4[v22];
          if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(void *)&v4[*v7])
          {
            double v24 = *(double *)(*(void *)&v4[*v9] + v23);
            *(void *)&v4[v22] = v23 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v24 = 0.0;
          }
          uint64_t v43 = 40;
          goto LABEL_69;
        case 3u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 48;
          goto LABEL_52;
        case 4u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 56;
          goto LABEL_52;
        case 5u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          while (2)
          {
            uint64_t v28 = *v6;
            uint64_t v29 = *(void *)&v4[v28];
            unint64_t v30 = v29 + 1;
            if (v29 == -1 || v30 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)&v4[*v9] + v29);
              *(void *)&v4[v28] = v30;
              v27 |= (unint64_t)(v31 & 0x7F) << v25;
              if (v31 < 0)
              {
                v25 += 7;
                BOOL v17 = v26++ >= 9;
                if (v17)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_58;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v27) = 0;
          }
LABEL_58:
          if (v27 >= 4) {
            LODWORD(v27) = 0;
          }
          v5->_status = v27;
          continue;
        case 6u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 64;
          goto LABEL_52;
        case 7u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 72;
          goto LABEL_52;
        case 8u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 80;
          goto LABEL_52;
        case 9u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 88;
          goto LABEL_52;
        case 0xAu:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 96;
          goto LABEL_52;
        case 0xBu:
          v5->_hasStarRating = 1;
          uint64_t v32 = *v6;
          unint64_t v33 = *(void *)&v4[v32];
          if (v33 <= 0xFFFFFFFFFFFFFFFBLL && v33 + 4 <= *(void *)&v4[*v7])
          {
            float v34 = *(float *)(*(void *)&v4[*v9] + v33);
            *(void *)&v4[v32] = v33 + 4;
          }
          else
          {
            v4[*v8] = 1;
            float v34 = 0.0;
          }
          double v24 = v34;
          uint64_t v43 = 104;
LABEL_69:
          *(double *)((char *)&v5->super.super.isa + v43) = v24;
          continue;
        case 0xCu:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 112;
          goto LABEL_52;
        case 0xDu:
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v37 = 0;
          v5->_hasIsActionUserDevice = 1;
          break;
        case 0xEu:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 120;
LABEL_52:
          uint64_t v42 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_71;
          }
          continue;
      }
      while (1)
      {
        uint64_t v38 = *v6;
        uint64_t v39 = *(void *)&v4[v38];
        unint64_t v40 = v39 + 1;
        if (v39 == -1 || v40 > *(void *)&v4[*v7]) {
          break;
        }
        char v41 = *(unsigned char *)(*(void *)&v4[*v9] + v39);
        *(void *)&v4[v38] = v40;
        v37 |= (unint64_t)(v41 & 0x7F) << v35;
        if ((v41 & 0x80) == 0) {
          goto LABEL_62;
        }
        v35 += 7;
        BOOL v17 = v36++ >= 9;
        if (v17)
        {
          uint64_t v37 = 0;
          goto LABEL_64;
        }
      }
      v4[*v8] = 1;
LABEL_62:
      if (v4[*v8]) {
        uint64_t v37 = 0;
      }
LABEL_64:
      v5->_isActionUserDevice = v37 != 0;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_71:
  }
    v44 = 0;
  else {
LABEL_72:
  }
    v44 = v5;

  return v44;
}

- (NSString)description
{
  id v17 = [NSString alloc];
  uint64_t v21 = [(BMFamilyAskToBuy *)self requestID];
  uint64_t v3 = NSNumber;
  [(BMFamilyAskToBuy *)self eventTime];
  uint64_t v20 = objc_msgSend(v3, "numberWithDouble:");
  uint64_t v19 = [(BMFamilyAskToBuy *)self userID];
  char v16 = [(BMFamilyAskToBuy *)self actionUserID];
  unint64_t v15 = BMFamilyAskToBuyRequestStatusAsString([(BMFamilyAskToBuy *)self status]);
  double v4 = [(BMFamilyAskToBuy *)self itemTitle];
  id v5 = [(BMFamilyAskToBuy *)self itemDescription];
  id v6 = [(BMFamilyAskToBuy *)self itemLocalizedPrice];
  uint64_t v7 = [(BMFamilyAskToBuy *)self thumbnailPath];
  id v8 = [(BMFamilyAskToBuy *)self ageRating];
  uint64_t v9 = NSNumber;
  [(BMFamilyAskToBuy *)self starRating];
  char v10 = objc_msgSend(v9, "numberWithDouble:");
  unsigned int v11 = [(BMFamilyAskToBuy *)self productType];
  unint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[BMFamilyAskToBuy isActionUserDevice](self, "isActionUserDevice"));
  uint64_t v13 = [(BMFamilyAskToBuy *)self storeLink];
  int v18 = (void *)[v17 initWithFormat:@"BMFamilyAskToBuy with requestID: %@, eventTime: %@, userID: %@, actionUserID: %@, status: %@, itemTitle: %@, itemDescription: %@, itemLocalizedPrice: %@, thumbnailPath: %@, ageRating: %@, starRating: %@, productType: %@, isActionUserDevice: %@, storeLink: %@", v21, v20, v19, v16, v15, v4, v5, v6, v7, v8, v10, v11, v12, v13];

  return (NSString *)v18;
}

- (BMFamilyAskToBuy)initWithRequestID:(id)a3 eventTime:(id)a4 userID:(id)a5 actionUserID:(id)a6 status:(int)a7 itemTitle:(id)a8 itemDescription:(id)a9 itemLocalizedPrice:(id)a10 thumbnailPath:(id)a11 ageRating:(id)a12 starRating:(id)a13 productType:(id)a14 isActionUserDevice:(id)a15 storeLink:(id)a16
{
  id v43 = a3;
  id v20 = a4;
  id v32 = a5;
  id v42 = a5;
  id v33 = a6;
  id v41 = a6;
  id v40 = a8;
  id v39 = a9;
  id v38 = a10;
  id v37 = a11;
  id v36 = a12;
  uint64_t v21 = v20;
  id v22 = a13;
  id v23 = a14;
  id v24 = a15;
  id v25 = a16;
  v44.receiver = self;
  v44.super_class = (Class)BMFamilyAskToBuy;
  unsigned int v26 = [(BMEventBase *)&v44 init];
  if (v26)
  {
    v26->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v26->_requestID, a3);
    if (v21)
    {
      v26->_hasEventTime = 1;
      [v21 doubleValue];
    }
    else
    {
      v26->_hasEventTime = 0;
      double v27 = -1.0;
    }
    v26->_eventTime = v27;
    objc_storeStrong((id *)&v26->_userID, v32);
    objc_storeStrong((id *)&v26->_actionUserID, v33);
    v26->_status = a7;
    objc_storeStrong((id *)&v26->_itemTitle, a8);
    objc_storeStrong((id *)&v26->_itemDescription, a9);
    objc_storeStrong((id *)&v26->_itemLocalizedPrice, a10);
    objc_storeStrong((id *)&v26->_thumbnailPath, a11);
    objc_storeStrong((id *)&v26->_ageRating, a12);
    if (v22)
    {
      v26->_hasStarRating = 1;
      [v22 floatValue];
      double v29 = v28;
    }
    else
    {
      v26->_hasStarRating = 0;
      double v29 = -1.0;
    }
    v26->_starRating = v29;
    objc_storeStrong((id *)&v26->_productType, a14);
    if (v24)
    {
      v26->_hasIsActionUserDevice = 1;
      v26->_isActionUserDevice = [v24 BOOLValue];
    }
    else
    {
      v26->_hasIsActionUserDevice = 0;
      v26->_isActionUserDevice = 0;
    }
    objc_storeStrong((id *)&v26->_storeLink, a16);
  }

  return v26;
}

+ (id)protoFields
{
  v18[14] = *MEMORY[0x1E4F143B8];
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"requestID" number:1 type:13 subMessageClass:0];
  v18[0] = v17;
  char v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"eventTime" number:2 type:0 subMessageClass:0];
  v18[1] = v16;
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userID" number:3 type:13 subMessageClass:0];
  v18[2] = v15;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"actionUserID" number:4 type:13 subMessageClass:0];
  v18[3] = v14;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"status" number:5 type:4 subMessageClass:0];
  v18[4] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"itemTitle" number:6 type:13 subMessageClass:0];
  v18[5] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"itemDescription" number:7 type:13 subMessageClass:0];
  v18[6] = v3;
  double v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"itemLocalizedPrice" number:8 type:13 subMessageClass:0];
  v18[7] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"thumbnailPath" number:9 type:13 subMessageClass:0];
  v18[8] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"ageRating" number:10 type:13 subMessageClass:0];
  v18[9] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"starRating" number:11 type:1 subMessageClass:0];
  v18[10] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"productType" number:12 type:13 subMessageClass:0];
  v18[11] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isActionUserDevice" number:13 type:12 subMessageClass:0];
  v18[12] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"storeLink" number:14 type:13 subMessageClass:0];
  v18[13] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:14];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF45C0;
}

+ (id)columns
{
  v18[14] = *MEMORY[0x1E4F143B8];
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"requestID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  char v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"eventTime" dataType:1 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:0];
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userID" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"actionUserID" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"status" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"itemTitle" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  double v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"itemDescription" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"itemLocalizedPrice" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"thumbnailPath" dataType:2 requestOnly:0 fieldNumber:9 protoDataType:13 convertedType:0];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"ageRating" dataType:2 requestOnly:0 fieldNumber:10 protoDataType:13 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"starRating" dataType:1 requestOnly:0 fieldNumber:11 protoDataType:1 convertedType:0];
  unint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"productType" dataType:2 requestOnly:0 fieldNumber:12 protoDataType:13 convertedType:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isActionUserDevice" dataType:0 requestOnly:0 fieldNumber:13 protoDataType:12 convertedType:0];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"storeLink" dataType:2 requestOnly:0 fieldNumber:14 protoDataType:13 convertedType:0];
  v18[0] = v17;
  v18[1] = v16;
  v18[2] = v15;
  v18[3] = v14;
  v18[4] = v2;
  v18[5] = v3;
  v18[6] = v4;
  v18[7] = v5;
  v18[8] = v6;
  v18[9] = v13;
  v18[10] = v7;
  v18[11] = v12;
  v18[12] = v8;
  v18[13] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:14];

  return v11;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 2)
  {
    double v4 = (objc_class *)MEMORY[0x1E4F94090];
    id v5 = a3;
    id v6 = (void *)[[v4 alloc] initWithData:v5];

    uint64_t v7 = [[BMFamilyAskToBuy alloc] initByReadFrom:v6];
    id v8 = v7;
    if (v7) {
      v7[5] = 2;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (unsigned)latestDataVersion
{
  return 2;
}

@end