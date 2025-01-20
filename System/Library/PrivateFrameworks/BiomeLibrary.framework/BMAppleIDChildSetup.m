@interface BMAppleIDChildSetup
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMAppleIDChildSetup)initWithIsNewChildAccount:(id)a3 startDate:(id)a4 endDate:(id)a5 completedSetup:(id)a6 lastViewedScreen:(int)a7 appUsage:(id)a8 askToBuy:(id)a9 commSafety:(id)a10 screenDistance:(id)a11 age:(id)a12 flowType:(int)a13;
- (BMAppleIDChildSetup)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)appUsage;
- (BOOL)askToBuy;
- (BOOL)commSafety;
- (BOOL)completedSetup;
- (BOOL)hasAge;
- (BOOL)hasAppUsage;
- (BOOL)hasAskToBuy;
- (BOOL)hasCommSafety;
- (BOOL)hasCompletedSetup;
- (BOOL)hasIsNewChildAccount;
- (BOOL)hasScreenDistance;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNewChildAccount;
- (BOOL)screenDistance;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)flowType;
- (int)lastViewedScreen;
- (unsigned)age;
- (unsigned)dataVersion;
- (void)setHasAge:(BOOL)a3;
- (void)setHasAppUsage:(BOOL)a3;
- (void)setHasAskToBuy:(BOOL)a3;
- (void)setHasCommSafety:(BOOL)a3;
- (void)setHasCompletedSetup:(BOOL)a3;
- (void)setHasIsNewChildAccount:(BOOL)a3;
- (void)setHasScreenDistance:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMAppleIDChildSetup

- (int)flowType
{
  return self->_flowType;
}

- (void)setHasAge:(BOOL)a3
{
  self->_hasAge = a3;
}

- (BOOL)hasAge
{
  return self->_hasAge;
}

- (unsigned)age
{
  return self->_age;
}

- (void)setHasScreenDistance:(BOOL)a3
{
  self->_hasScreenDistance = a3;
}

- (BOOL)hasScreenDistance
{
  return self->_hasScreenDistance;
}

- (BOOL)screenDistance
{
  return self->_screenDistance;
}

- (void)setHasCommSafety:(BOOL)a3
{
  self->_hasCommSafety = a3;
}

- (BOOL)hasCommSafety
{
  return self->_hasCommSafety;
}

- (BOOL)commSafety
{
  return self->_commSafety;
}

- (void)setHasAskToBuy:(BOOL)a3
{
  self->_hasAskToBuy = a3;
}

- (BOOL)hasAskToBuy
{
  return self->_hasAskToBuy;
}

- (BOOL)askToBuy
{
  return self->_askToBuy;
}

- (void)setHasAppUsage:(BOOL)a3
{
  self->_hasAppUsage = a3;
}

- (BOOL)hasAppUsage
{
  return self->_hasAppUsage;
}

- (BOOL)appUsage
{
  return self->_appUsage;
}

- (int)lastViewedScreen
{
  return self->_lastViewedScreen;
}

- (void)setHasCompletedSetup:(BOOL)a3
{
  self->_hasCompletedSetup = a3;
}

- (BOOL)hasCompletedSetup
{
  return self->_hasCompletedSetup;
}

- (BOOL)completedSetup
{
  return self->_completedSetup;
}

- (void)setHasIsNewChildAccount:(BOOL)a3
{
  self->_hasIsNewChildAccount = a3;
}

- (BOOL)hasIsNewChildAccount
{
  return self->_hasIsNewChildAccount;
}

- (BOOL)isNewChildAccount
{
  return self->_isNewChildAccount;
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
    if ([(BMAppleIDChildSetup *)self hasIsNewChildAccount]
      || [v5 hasIsNewChildAccount])
    {
      if (![(BMAppleIDChildSetup *)self hasIsNewChildAccount]) {
        goto LABEL_48;
      }
      if (![v5 hasIsNewChildAccount]) {
        goto LABEL_48;
      }
      int v6 = [(BMAppleIDChildSetup *)self isNewChildAccount];
      if (v6 != [v5 isNewChildAccount]) {
        goto LABEL_48;
      }
    }
    v7 = [(BMAppleIDChildSetup *)self startDate];
    uint64_t v8 = [v5 startDate];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      v9 = (void *)v8;
      v10 = [(BMAppleIDChildSetup *)self startDate];
      v11 = [v5 startDate];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_48;
      }
    }
    v14 = [(BMAppleIDChildSetup *)self endDate];
    uint64_t v15 = [v5 endDate];
    if (v14 == (void *)v15)
    {
    }
    else
    {
      v16 = (void *)v15;
      v17 = [(BMAppleIDChildSetup *)self endDate];
      v18 = [v5 endDate];
      int v19 = [v17 isEqual:v18];

      if (!v19) {
        goto LABEL_48;
      }
    }
    if (![(BMAppleIDChildSetup *)self hasCompletedSetup]
      && ![v5 hasCompletedSetup]
      || [(BMAppleIDChildSetup *)self hasCompletedSetup]
      && [v5 hasCompletedSetup]
      && (int v20 = [(BMAppleIDChildSetup *)self completedSetup],
          v20 == [v5 completedSetup]))
    {
      int v21 = [(BMAppleIDChildSetup *)self lastViewedScreen];
      if (v21 == [v5 lastViewedScreen])
      {
        if (!-[BMAppleIDChildSetup hasAppUsage](self, "hasAppUsage") && ![v5 hasAppUsage]
          || [(BMAppleIDChildSetup *)self hasAppUsage]
          && [v5 hasAppUsage]
          && (int v22 = -[BMAppleIDChildSetup appUsage](self, "appUsage"), v22 == [v5 appUsage]))
        {
          if (![(BMAppleIDChildSetup *)self hasAskToBuy]
            && ![v5 hasAskToBuy]
            || [(BMAppleIDChildSetup *)self hasAskToBuy]
            && [v5 hasAskToBuy]
            && (int v23 = [(BMAppleIDChildSetup *)self askToBuy],
                v23 == [v5 askToBuy]))
          {
            if (![(BMAppleIDChildSetup *)self hasCommSafety]
              && ![v5 hasCommSafety]
              || [(BMAppleIDChildSetup *)self hasCommSafety]
              && [v5 hasCommSafety]
              && (int v24 = [(BMAppleIDChildSetup *)self commSafety],
                  v24 == [v5 commSafety]))
            {
              if (![(BMAppleIDChildSetup *)self hasScreenDistance]
                && ![v5 hasScreenDistance]
                || [(BMAppleIDChildSetup *)self hasScreenDistance]
                && [v5 hasScreenDistance]
                && (int v25 = [(BMAppleIDChildSetup *)self screenDistance],
                    v25 == [v5 screenDistance]))
              {
                if (!-[BMAppleIDChildSetup hasAge](self, "hasAge") && ![v5 hasAge]
                  || [(BMAppleIDChildSetup *)self hasAge]
                  && [v5 hasAge]
                  && (unsigned int v26 = -[BMAppleIDChildSetup age](self, "age"), v26 == [v5 age]))
                {
                  int v27 = [(BMAppleIDChildSetup *)self flowType];
                  BOOL v13 = v27 == [v5 flowType];
LABEL_49:

                  goto LABEL_50;
                }
              }
            }
          }
        }
      }
    }
LABEL_48:
    BOOL v13 = 0;
    goto LABEL_49;
  }
  BOOL v13 = 0;
LABEL_50:

  return v13;
}

- (NSDate)endDate
{
  if (self->_hasRaw_endDate)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_endDate];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)startDate
{
  if (self->_hasRaw_startDate)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_startDate];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (id)jsonDictionary
{
  v43[11] = *MEMORY[0x1E4F143B8];
  if ([(BMAppleIDChildSetup *)self hasIsNewChildAccount])
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAppleIDChildSetup isNewChildAccount](self, "isNewChildAccount"));
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = [(BMAppleIDChildSetup *)self startDate];
  if (v4)
  {
    id v5 = NSNumber;
    int v6 = [(BMAppleIDChildSetup *)self startDate];
    [v6 timeIntervalSince1970];
    uint64_t v7 = objc_msgSend(v5, "numberWithDouble:");
  }
  else
  {
    uint64_t v7 = 0;
  }

  uint64_t v8 = [(BMAppleIDChildSetup *)self endDate];
  if (v8)
  {
    v9 = NSNumber;
    v10 = [(BMAppleIDChildSetup *)self endDate];
    [v10 timeIntervalSince1970];
    uint64_t v11 = objc_msgSend(v9, "numberWithDouble:");
  }
  else
  {
    uint64_t v11 = 0;
  }

  if ([(BMAppleIDChildSetup *)self hasCompletedSetup])
  {
    int v12 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAppleIDChildSetup completedSetup](self, "completedSetup"));
  }
  else
  {
    int v12 = 0;
  }
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithInt:", -[BMAppleIDChildSetup lastViewedScreen](self, "lastViewedScreen"));
  if ([(BMAppleIDChildSetup *)self hasAppUsage])
  {
    v41 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAppleIDChildSetup appUsage](self, "appUsage"));
  }
  else
  {
    v41 = 0;
  }
  if ([(BMAppleIDChildSetup *)self hasAskToBuy])
  {
    v40 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAppleIDChildSetup askToBuy](self, "askToBuy"));
  }
  else
  {
    v40 = 0;
  }
  if ([(BMAppleIDChildSetup *)self hasCommSafety])
  {
    v39 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAppleIDChildSetup commSafety](self, "commSafety"));
  }
  else
  {
    v39 = 0;
  }
  if ([(BMAppleIDChildSetup *)self hasScreenDistance])
  {
    v38 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAppleIDChildSetup screenDistance](self, "screenDistance"));
  }
  else
  {
    v38 = 0;
  }
  if ([(BMAppleIDChildSetup *)self hasAge])
  {
    v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMAppleIDChildSetup age](self, "age"));
  }
  else
  {
    v14 = 0;
  }
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithInt:", -[BMAppleIDChildSetup flowType](self, "flowType"));
  v42[0] = @"isNewChildAccount";
  uint64_t v16 = v3;
  if (!v3)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v33 = (void *)v16;
  v43[0] = v16;
  v42[1] = @"startDate";
  uint64_t v17 = v7;
  if (!v7)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v32 = (void *)v17;
  v43[1] = v17;
  v42[2] = @"endDate";
  uint64_t v18 = v11;
  if (!v11)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v31 = (void *)v18;
  v43[2] = v18;
  v42[3] = @"completedSetup";
  uint64_t v19 = (uint64_t)v12;
  if (!v12)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v37 = (void *)v3;
  v30 = (void *)v19;
  v43[3] = v19;
  v42[4] = @"lastViewedScreen";
  uint64_t v20 = v13;
  if (!v13)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v36 = (void *)v7;
  v29 = (void *)v20;
  v43[4] = v20;
  v42[5] = @"appUsage";
  int v21 = v41;
  if (!v41)
  {
    int v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v35 = (void *)v11;
  v43[5] = v21;
  v42[6] = @"askToBuy";
  int v22 = v40;
  if (!v40)
  {
    int v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v43[6] = v22;
  v42[7] = @"commSafety";
  int v23 = v39;
  if (!v39)
  {
    int v23 = [MEMORY[0x1E4F1CA98] null];
  }
  int v24 = (void *)v13;
  v43[7] = v23;
  v42[8] = @"screenDistance";
  int v25 = v38;
  if (!v38)
  {
    int v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v43[8] = v25;
  v42[9] = @"age";
  unsigned int v26 = v14;
  if (!v14)
  {
    unsigned int v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v43[9] = v26;
  v42[10] = @"flowType";
  int v27 = v15;
  if (!v15)
  {
    int v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v43[10] = v27;
  id v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:11];
  if (v15)
  {
    if (v14) {
      goto LABEL_52;
    }
  }
  else
  {

    if (v14) {
      goto LABEL_52;
    }
  }

LABEL_52:
  if (!v38) {

  }
  if (!v39) {
  if (!v40)
  }

  if (!v41) {
  if (!v24)
  }

  if (v12)
  {
    if (v35) {
      goto LABEL_64;
    }
  }
  else
  {

    if (v35)
    {
LABEL_64:
      if (v36) {
        goto LABEL_65;
      }
LABEL_73:

      if (v37) {
        goto LABEL_66;
      }
      goto LABEL_74;
    }
  }

  if (!v36) {
    goto LABEL_73;
  }
LABEL_65:
  if (v37) {
    goto LABEL_66;
  }
LABEL_74:

LABEL_66:

  return v34;
}

- (BMAppleIDChildSetup)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v136[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"isNewChildAccount"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v113 = 0;
LABEL_4:
    uint64_t v8 = [v6 objectForKeyedSubscript:@"startDate"];
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v12 = (objc_class *)MEMORY[0x1E4F1C9C8];
        id v13 = v8;
        id v14 = [v12 alloc];
        [v13 doubleValue];
        double v16 = v15;

        id v9 = (id)[v14 initWithTimeIntervalSince1970:v16];
      }
      else
      {
        v31 = (BMAppleIDChildSetup *)a4;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v32 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          id v9 = [v32 dateFromString:v8];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              id v9 = 0;
              v30 = v113;
              goto LABEL_100;
            }
            id v78 = objc_alloc(MEMORY[0x1E4F28C58]);
            v79 = self;
            uint64_t v80 = *MEMORY[0x1E4F502C8];
            uint64_t v133 = *MEMORY[0x1E4F28568];
            v112 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"startDate"];
            v134 = v112;
            uint64_t v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v134 forKeys:&v133 count:1];
            uint64_t v82 = v80;
            self = v79;
            v110 = (void *)v81;
            id v83 = (id)objc_msgSend(v78, "initWithDomain:code:userInfo:", v82, 2);
            id v9 = 0;
            v31 = 0;
            *a4 = v83;
            goto LABEL_119;
          }
          id v9 = v8;
        }
      }
    }
    else
    {
      id v9 = 0;
    }
    uint64_t v10 = [v6 objectForKeyedSubscript:@"endDate"];
    v110 = (void *)v10;
    if (!v10 || (uint64_t v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v112 = 0;
      goto LABEL_24;
    }
    uint64_t v17 = self;
    uint64_t v18 = a4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v19 = (objc_class *)MEMORY[0x1E4F1C9C8];
      id v20 = v11;
      id v21 = [v19 alloc];
      [v20 doubleValue];
      double v23 = v22;

      id v24 = (id)[v21 initWithTimeIntervalSince1970:v23];
LABEL_16:
      v112 = v24;
LABEL_23:
      self = v17;
LABEL_24:
      id v34 = [v6 objectForKeyedSubscript:@"completedSetup"];
      v114 = self;
      if (!v34 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v35 = v7;
        v109 = 0;
LABEL_27:
        uint64_t v36 = [v6 objectForKeyedSubscript:@"lastViewedScreen"];
        v103 = v34;
        v105 = (void *)v36;
        if (v36 && (v37 = (void *)v36, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v111 = v37;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!a4)
              {
                id v111 = 0;
                v31 = 0;
                v30 = v113;
                a4 = v109;
                v50 = v37;
                uint64_t v7 = v35;
                self = v114;
                goto LABEL_97;
              }
              id v68 = objc_alloc(MEMORY[0x1E4F28C58]);
              id v69 = v9;
              uint64_t v70 = *MEMORY[0x1E4F502C8];
              uint64_t v127 = *MEMORY[0x1E4F28568];
              id v108 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"lastViewedScreen"];
              id v128 = v108;
              uint64_t v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v128 forKeys:&v127 count:1];
              uint64_t v72 = v70;
              id v9 = v69;
              v50 = v37;
              v106 = (void *)v71;
              id v73 = (id)objc_msgSend(v68, "initWithDomain:code:userInfo:", v72, 2);
              id v111 = 0;
              v31 = 0;
              *a4 = v73;
              v30 = v113;
              a4 = v109;
              uint64_t v7 = v35;
              self = v114;
              goto LABEL_96;
            }
            id v111 = [NSNumber numberWithInt:BMAppleIDChildSetupChildSetupScreenFromString(v37)];
          }
        }
        else
        {
          id v111 = 0;
        }
        uint64_t v38 = [v6 objectForKeyedSubscript:@"appUsage"];
        uint64_t v7 = v35;
        v101 = v8;
        v106 = (void *)v38;
        if (v38 && (v39 = (void *)v38, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              id v108 = 0;
              v31 = 0;
              a4 = v109;
              v30 = v113;
              self = v114;
              v50 = v105;
              goto LABEL_96;
            }
            id v52 = objc_alloc(MEMORY[0x1E4F28C58]);
            v53 = a4;
            uint64_t v54 = *MEMORY[0x1E4F502C8];
            uint64_t v125 = *MEMORY[0x1E4F28568];
            id v107 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"appUsage"];
            id v126 = v107;
            v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v126 forKeys:&v125 count:1];
            id v108 = 0;
            v31 = 0;
            id *v53 = (id)[v52 initWithDomain:v54 code:2 userInfo:v40];
            v30 = v113;
            self = v114;
            id v34 = v103;
            a4 = v109;
            v50 = v105;
LABEL_95:

            uint64_t v8 = v101;
LABEL_96:

            goto LABEL_97;
          }
          id v108 = v39;
        }
        else
        {
          id v108 = 0;
        }
        v40 = [v6 objectForKeyedSubscript:@"askToBuy"];
        id v104 = v9;
        if (v40 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              id v107 = 0;
              v31 = 0;
              a4 = v109;
              v30 = v113;
              v50 = v105;
              goto LABEL_94;
            }
            v56 = a4;
            id v57 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v58 = *MEMORY[0x1E4F502C8];
            uint64_t v123 = *MEMORY[0x1E4F28568];
            id v102 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"askToBuy"];
            id v124 = v102;
            v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v124 forKeys:&v123 count:1];
            id v107 = 0;
            v31 = 0;
            id *v56 = (id)[v57 initWithDomain:v58 code:2 userInfo:v41];
            goto LABEL_110;
          }
          id v107 = v40;
        }
        else
        {
          id v107 = 0;
        }
        v41 = [v6 objectForKeyedSubscript:@"commSafety"];
        if (!v41 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v102 = 0;
LABEL_39:
          v42 = [v6 objectForKeyedSubscript:@"screenDistance"];
          v97 = a4;
          v99 = v7;
          if (v42 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!a4)
              {
                id v100 = 0;
                v31 = 0;
                goto LABEL_92;
              }
              id v65 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v66 = *MEMORY[0x1E4F502C8];
              uint64_t v119 = *MEMORY[0x1E4F28568];
              v67 = a4;
              id v45 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"screenDistance"];
              id v120 = v45;
              v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v120 forKeys:&v119 count:1];
              id v100 = 0;
              v31 = 0;
              id *v67 = (id)[v65 initWithDomain:v66 code:2 userInfo:v43];
              goto LABEL_91;
            }
            id v100 = v42;
          }
          else
          {
            id v100 = 0;
          }
          v43 = [v6 objectForKeyedSubscript:@"age"];
          if (v43 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!v97)
              {
                id v45 = 0;
                v31 = 0;
                goto LABEL_91;
              }
              v44 = v114;
              id v95 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v74 = *MEMORY[0x1E4F502C8];
              uint64_t v117 = *MEMORY[0x1E4F28568];
              v47 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"age"];
              v118 = v47;
              v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v118 forKeys:&v117 count:1];
              id v75 = (id)[v95 initWithDomain:v74 code:2 userInfo:v46];
              id v45 = 0;
              v31 = 0;
              id *v97 = v75;
              goto LABEL_90;
            }
            v44 = v114;
            id v45 = v43;
          }
          else
          {
            v44 = v114;
            id v45 = 0;
          }
          v46 = [v6 objectForKeyedSubscript:@"flowType"];
          if (v46 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v55 = v46;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (v97)
                {
                  id v96 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v94 = *MEMORY[0x1E4F502C8];
                  uint64_t v115 = *MEMORY[0x1E4F28568];
                  v90 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"flowType"];
                  v116 = v90;
                  v91 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v116 forKeys:&v115 count:1];
                  id *v97 = (id)[v96 initWithDomain:v94 code:2 userInfo:v91];
                }
                v47 = 0;
                v31 = 0;
                goto LABEL_90;
              }
              id v55 = [NSNumber numberWithInt:BMAppleIDChildSetupFlowTypeFromString(v46)];
            }
            v47 = v55;
          }
          else
          {
            v47 = 0;
          }
          uint64_t v76 = [v111 intValue];
          LODWORD(v93) = [v47 intValue];
          v31 = [(BMAppleIDChildSetup *)v44 initWithIsNewChildAccount:v113 startDate:v104 endDate:v112 completedSetup:v109 lastViewedScreen:v76 appUsage:v108 askToBuy:v107 commSafety:v102 screenDistance:v100 age:v45 flowType:v93];
          v44 = v31;
LABEL_90:
          v114 = v44;

LABEL_91:
          uint64_t v7 = v99;
          goto LABEL_92;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v102 = v41;
          goto LABEL_39;
        }
        if (a4)
        {
          v59 = a4;
          id v60 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v61 = *MEMORY[0x1E4F502C8];
          uint64_t v121 = *MEMORY[0x1E4F28568];
          v62 = v7;
          id v63 = [NSString alloc];
          uint64_t v92 = objc_opt_class();
          v64 = v63;
          uint64_t v7 = v62;
          id v100 = (id)[v64 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v92, @"commSafety"];
          id v122 = v100;
          v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v122 forKeys:&v121 count:1];
          id v102 = 0;
          v31 = 0;
          id *v59 = (id)[v60 initWithDomain:v61 code:2 userInfo:v42];
LABEL_92:
          v50 = v105;

          v30 = v113;
          id v34 = v103;
          a4 = v109;
LABEL_93:

          id v9 = v104;
LABEL_94:
          self = v114;
          goto LABEL_95;
        }
        id v102 = 0;
        v31 = 0;
LABEL_110:
        a4 = v109;
        v30 = v113;
        v50 = v105;
        goto LABEL_93;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v35 = v7;
        v109 = v34;
        goto LABEL_27;
      }
      if (a4)
      {
        id v48 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v49 = *MEMORY[0x1E4F502C8];
        uint64_t v129 = *MEMORY[0x1E4F28568];
        v98 = a4;
        id v111 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"completedSetup"];
        id v130 = v111;
        v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v130 forKeys:&v129 count:1];
        id v51 = (id)[v48 initWithDomain:v49 code:2 userInfo:v50];
        a4 = 0;
        v31 = 0;
        id *v98 = v51;
        v30 = v113;
        self = v114;
LABEL_97:

LABEL_98:
LABEL_99:

        goto LABEL_100;
      }
      v31 = 0;
LABEL_107:
      v30 = v113;
      goto LABEL_98;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v33 = objc_alloc_init(MEMORY[0x1E4F28D48]);
      v112 = [v33 dateFromString:v11];

      goto LABEL_23;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v24 = v11;
      goto LABEL_16;
    }
    if (a4)
    {
      id v84 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v85 = v9;
      uint64_t v86 = *MEMORY[0x1E4F502C8];
      uint64_t v131 = *MEMORY[0x1E4F28568];
      a4 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"endDate"];
      v132 = a4;
      uint64_t v87 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v132 forKeys:&v131 count:1];
      uint64_t v88 = v86;
      id v9 = v85;
      id v89 = (id)[v84 initWithDomain:v88 code:2 userInfo:v87];
      v112 = 0;
      v31 = 0;
      id *v18 = v89;
      self = v17;
      id v34 = (void *)v87;
      goto LABEL_107;
    }
    v112 = 0;
    v31 = 0;
    self = v17;
LABEL_119:
    v30 = v113;
    goto LABEL_99;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v113 = v7;
    goto LABEL_4;
  }
  if (a4)
  {
    id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
    unsigned int v26 = self;
    uint64_t v27 = *MEMORY[0x1E4F502C8];
    uint64_t v135 = *MEMORY[0x1E4F28568];
    id v9 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isNewChildAccount"];
    v136[0] = v9;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v136 forKeys:&v135 count:1];
    uint64_t v28 = v27;
    self = v26;
    id v29 = (id)[v25 initWithDomain:v28 code:2 userInfo:v8];
    v30 = 0;
    v31 = 0;
    *a4 = v29;
LABEL_100:

    goto LABEL_101;
  }
  v30 = 0;
  v31 = 0;
LABEL_101:

  return v31;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMAppleIDChildSetup *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_hasIsNewChildAccount) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasRaw_startDate) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasRaw_endDate) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasCompletedSetup) {
    PBDataWriterWriteBOOLField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasAppUsage) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasAskToBuy) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasCommSafety) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasScreenDistance) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasAge) {
    PBDataWriterWriteUint32Field();
  }
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v108.receiver = self;
  v108.super_class = (Class)BMAppleIDChildSetup;
  id v5 = [(BMEventBase *)&v108 init];
  if (!v5) {
    goto LABEL_141;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v9 = &OBJC_IVAR___BMSiriAssistantSuggestions__interaction;
    uint64_t v10 = &OBJC_IVAR___BMSiriAssistantSuggestions__interaction;
    uint64_t v11 = (int *)MEMORY[0x1E4F940B8];
    int v12 = &OBJC_IVAR___BMSiriAssistantSuggestions__interaction;
    id v13 = &OBJC_IVAR___BMSiriAssistantSuggestions__interaction;
    id v14 = &OBJC_IVAR___BMSiriAssistantSuggestions__interaction;
    double v15 = &OBJC_IVAR___BMSiriAssistantSuggestions__interaction;
    double v16 = &OBJC_IVAR___BMSiriAssistantSuggestions__interaction;
    uint64_t v17 = &OBJC_IVAR___BMSiriAssistantSuggestions__interaction;
    uint64_t v18 = &OBJC_IVAR___BMSiriAssistantSuggestions__interaction;
    do
    {
      if (v4[*v8]) {
        break;
      }
      char v19 = 0;
      unsigned int v20 = 0;
      unint64_t v21 = 0;
      while (1)
      {
        uint64_t v22 = *v6;
        uint64_t v23 = *(void *)&v4[v22];
        unint64_t v24 = v23 + 1;
        if (v23 == -1 || v24 > *(void *)&v4[*v7]) {
          break;
        }
        char v25 = *(unsigned char *)(*(void *)&v4[*v11] + v23);
        *(void *)&v4[v22] = v24;
        v21 |= (unint64_t)(v25 & 0x7F) << v19;
        if ((v25 & 0x80) == 0) {
          goto LABEL_13;
        }
        v19 += 7;
        BOOL v26 = v20++ >= 9;
        if (v26)
        {
          unint64_t v21 = 0;
          int v27 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v27 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v21 = 0;
      }
LABEL_15:
      if (v27 || (v21 & 7) == 4) {
        break;
      }
      switch((v21 >> 3))
      {
        case 1u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v31 = 0;
          *((unsigned char *)&v5->super.super.isa + v9[23]) = 1;
          while (1)
          {
            uint64_t v32 = *v6;
            uint64_t v33 = *(void *)&v4[v32];
            unint64_t v34 = v33 + 1;
            if (v33 == -1 || v34 > *(void *)&v4[*v7]) {
              break;
            }
            char v35 = *(unsigned char *)(*(void *)&v4[*v11] + v33);
            *(void *)&v4[v32] = v34;
            v31 |= (unint64_t)(v35 & 0x7F) << v29;
            if ((v35 & 0x80) == 0) {
              goto LABEL_92;
            }
            v29 += 7;
            BOOL v26 = v30++ >= 9;
            if (v26)
            {
              uint64_t v31 = 0;
              goto LABEL_94;
            }
          }
          v4[*v8] = 1;
LABEL_92:
          if (v4[*v8]) {
            uint64_t v31 = 0;
          }
LABEL_94:
          BOOL v102 = v31 != 0;
          uint64_t v103 = v10[24];
          goto LABEL_121;
        case 2u:
          *((unsigned char *)&v5->super.super.isa + v12[25]) = 1;
          uint64_t v42 = *v6;
          unint64_t v43 = *(void *)&v4[v42];
          if (v43 <= 0xFFFFFFFFFFFFFFF7 && v43 + 8 <= *(void *)&v4[*v7])
          {
            v44 = *(objc_class **)(*(void *)&v4[*v11] + v43);
            *(void *)&v4[v42] = v43 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v44 = 0;
          }
          uint64_t v105 = v13[26];
          goto LABEL_137;
        case 3u:
          *((unsigned char *)&v5->super.super.isa + v14[27]) = 1;
          uint64_t v45 = *v6;
          unint64_t v46 = *(void *)&v4[v45];
          if (v46 <= 0xFFFFFFFFFFFFFFF7 && v46 + 8 <= *(void *)&v4[*v7])
          {
            v44 = *(objc_class **)(*(void *)&v4[*v11] + v46);
            *(void *)&v4[v45] = v46 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v44 = 0;
          }
          uint64_t v105 = v15[28];
LABEL_137:
          *(Class *)((char *)&v5->super.super.isa + v105) = v44;
          continue;
        case 4u:
          char v47 = 0;
          unsigned int v48 = 0;
          uint64_t v49 = 0;
          *((unsigned char *)&v5->super.super.isa + v16[29]) = 1;
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
              char v53 = *(unsigned char *)(*(void *)&v4[*v11] + v51);
              *(void *)&v4[v50] = v52;
              v49 |= (unint64_t)(v53 & 0x7F) << v47;
              if (v53 < 0)
              {
                v47 += 7;
                BOOL v26 = v48++ >= 9;
                if (v26)
                {
                  uint64_t v49 = 0;
                  goto LABEL_98;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v49 = 0;
          }
LABEL_98:
          BOOL v102 = v49 != 0;
          uint64_t v103 = v17[30];
          goto LABEL_121;
        case 5u:
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
              char v60 = *(unsigned char *)(*(void *)&v4[*v11] + v58);
              *(void *)&v4[v57] = v59;
              v56 |= (unint64_t)(v60 & 0x7F) << v54;
              if (v60 < 0)
              {
                v54 += 7;
                BOOL v26 = v55++ >= 9;
                if (v26)
                {
                  LODWORD(v56) = 0;
                  goto LABEL_102;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v56) = 0;
          }
LABEL_102:
          if (v56 >= 9) {
            LODWORD(v56) = 0;
          }
          uint64_t v104 = v18[31];
          goto LABEL_132;
        case 6u:
          char v61 = 0;
          unsigned int v62 = 0;
          uint64_t v63 = 0;
          v5->_hasAppUsage = 1;
          while (2)
          {
            uint64_t v64 = *v6;
            uint64_t v65 = *(void *)&v4[v64];
            unint64_t v66 = v65 + 1;
            if (v65 == -1 || v66 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v67 = *(unsigned char *)(*(void *)&v4[*v11] + v65);
              *(void *)&v4[v64] = v66;
              v63 |= (unint64_t)(v67 & 0x7F) << v61;
              if (v67 < 0)
              {
                v61 += 7;
                BOOL v26 = v62++ >= 9;
                if (v26)
                {
                  uint64_t v63 = 0;
                  goto LABEL_108;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v63 = 0;
          }
LABEL_108:
          BOOL v102 = v63 != 0;
          uint64_t v103 = 52;
          goto LABEL_121;
        case 7u:
          char v68 = 0;
          unsigned int v69 = 0;
          uint64_t v70 = 0;
          v5->_hasAskToBuy = 1;
          while (2)
          {
            uint64_t v71 = *v6;
            uint64_t v72 = *(void *)&v4[v71];
            unint64_t v73 = v72 + 1;
            if (v72 == -1 || v73 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v74 = *(unsigned char *)(*(void *)&v4[*v11] + v72);
              *(void *)&v4[v71] = v73;
              v70 |= (unint64_t)(v74 & 0x7F) << v68;
              if (v74 < 0)
              {
                v68 += 7;
                BOOL v26 = v69++ >= 9;
                if (v26)
                {
                  uint64_t v70 = 0;
                  goto LABEL_112;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v70 = 0;
          }
LABEL_112:
          BOOL v102 = v70 != 0;
          uint64_t v103 = 54;
          goto LABEL_121;
        case 8u:
          char v75 = 0;
          unsigned int v76 = 0;
          uint64_t v77 = 0;
          v5->_hasCommSafety = 1;
          while (2)
          {
            uint64_t v78 = *v6;
            uint64_t v79 = *(void *)&v4[v78];
            unint64_t v80 = v79 + 1;
            if (v79 == -1 || v80 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v81 = *(unsigned char *)(*(void *)&v4[*v11] + v79);
              *(void *)&v4[v78] = v80;
              v77 |= (unint64_t)(v81 & 0x7F) << v75;
              if (v81 < 0)
              {
                v75 += 7;
                BOOL v26 = v76++ >= 9;
                if (v26)
                {
                  uint64_t v77 = 0;
                  goto LABEL_116;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v77 = 0;
          }
LABEL_116:
          BOOL v102 = v77 != 0;
          uint64_t v103 = 56;
          goto LABEL_121;
        case 9u:
          char v82 = 0;
          unsigned int v83 = 0;
          uint64_t v84 = 0;
          v5->_hasScreenDistance = 1;
          while (2)
          {
            uint64_t v85 = *v6;
            uint64_t v86 = *(void *)&v4[v85];
            unint64_t v87 = v86 + 1;
            if (v86 == -1 || v87 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v88 = *(unsigned char *)(*(void *)&v4[*v11] + v86);
              *(void *)&v4[v85] = v87;
              v84 |= (unint64_t)(v88 & 0x7F) << v82;
              if (v88 < 0)
              {
                v82 += 7;
                BOOL v26 = v83++ >= 9;
                if (v26)
                {
                  uint64_t v84 = 0;
                  goto LABEL_120;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v84 = 0;
          }
LABEL_120:
          BOOL v102 = v84 != 0;
          uint64_t v103 = 58;
LABEL_121:
          *((unsigned char *)&v5->super.super.isa + v103) = v102;
          continue;
        case 0xAu:
          char v89 = 0;
          unsigned int v90 = 0;
          uint64_t v91 = 0;
          v5->_hasAge = 1;
          while (2)
          {
            uint64_t v92 = *v6;
            uint64_t v93 = *(void *)&v4[v92];
            unint64_t v94 = v93 + 1;
            if (v93 == -1 || v94 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v95 = *(unsigned char *)(*(void *)&v4[*v11] + v93);
              *(void *)&v4[v92] = v94;
              v91 |= (unint64_t)(v95 & 0x7F) << v89;
              if (v95 < 0)
              {
                v89 += 7;
                BOOL v26 = v90++ >= 9;
                if (v26)
                {
                  LODWORD(v91) = 0;
                  goto LABEL_125;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v91) = 0;
          }
LABEL_125:
          v5->_age = v91;
          continue;
        case 0xBu:
          char v96 = 0;
          unsigned int v97 = 0;
          uint64_t v56 = 0;
          break;
        default:
          uint64_t v36 = v9;
          v37 = v10;
          uint64_t v38 = v12;
          v39 = v13;
          v40 = v14;
          int v41 = PBReaderSkipValueWithTag();
          id v14 = v40;
          uint64_t v8 = (int *)MEMORY[0x1E4F940C8];
          id v13 = v39;
          double v15 = &OBJC_IVAR___BMSiriAssistantSuggestions__interaction;
          int v12 = v38;
          uint64_t v17 = &OBJC_IVAR___BMSiriAssistantSuggestions__interaction;
          uint64_t v10 = v37;
          double v16 = &OBJC_IVAR___BMSiriAssistantSuggestions__interaction;
          id v9 = v36;
          uint64_t v18 = &OBJC_IVAR___BMSiriAssistantSuggestions__interaction;
          if (!v41) {
            goto LABEL_140;
          }
          continue;
      }
      while (1)
      {
        uint64_t v98 = *v6;
        uint64_t v99 = *(void *)&v4[v98];
        unint64_t v100 = v99 + 1;
        if (v99 == -1 || v100 > *(void *)&v4[*v7]) {
          break;
        }
        char v101 = *(unsigned char *)(*(void *)&v4[*v11] + v99);
        *(void *)&v4[v98] = v100;
        v56 |= (unint64_t)(v101 & 0x7F) << v96;
        if ((v101 & 0x80) == 0) {
          goto LABEL_127;
        }
        v96 += 7;
        BOOL v26 = v97++ >= 9;
        if (v26)
        {
          LODWORD(v56) = 0;
          goto LABEL_129;
        }
      }
      v4[*v8] = 1;
LABEL_127:
      if (v4[*v8]) {
        LODWORD(v56) = 0;
      }
LABEL_129:
      if (v56 >= 3) {
        LODWORD(v56) = 0;
      }
      uint64_t v104 = 76;
LABEL_132:
      *(_DWORD *)((char *)&v5->super.super.isa + v104) = v56;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_140:
  }
    v106 = 0;
  else {
LABEL_141:
  }
    v106 = v5;

  return v106;
}

- (NSString)description
{
  id v15 = [NSString alloc];
  id v14 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAppleIDChildSetup isNewChildAccount](self, "isNewChildAccount"));
  id v13 = [(BMAppleIDChildSetup *)self startDate];
  uint64_t v3 = [(BMAppleIDChildSetup *)self endDate];
  int v12 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAppleIDChildSetup completedSetup](self, "completedSetup"));
  id v4 = BMAppleIDChildSetupChildSetupScreenAsString([(BMAppleIDChildSetup *)self lastViewedScreen]);
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAppleIDChildSetup appUsage](self, "appUsage"));
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAppleIDChildSetup askToBuy](self, "askToBuy"));
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAppleIDChildSetup commSafety](self, "commSafety"));
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAppleIDChildSetup screenDistance](self, "screenDistance"));
  id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMAppleIDChildSetup age](self, "age"));
  uint64_t v10 = BMAppleIDChildSetupFlowTypeAsString([(BMAppleIDChildSetup *)self flowType]);
  double v16 = (void *)[v15 initWithFormat:@"BMAppleIDChildSetup with isNewChildAccount: %@, startDate: %@, endDate: %@, completedSetup: %@, lastViewedScreen: %@, appUsage: %@, askToBuy: %@, commSafety: %@, screenDistance: %@, age: %@, flowType: %@", v14, v13, v3, v12, v4, v5, v6, v7, v8, v9, v10];

  return (NSString *)v16;
}

- (BMAppleIDChildSetup)initWithIsNewChildAccount:(id)a3 startDate:(id)a4 endDate:(id)a5 completedSetup:(id)a6 lastViewedScreen:(int)a7 appUsage:(id)a8 askToBuy:(id)a9 commSafety:(id)a10 screenDistance:(id)a11 age:(id)a12 flowType:(int)a13
{
  id v18 = a3;
  id v32 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a12;
  v33.receiver = self;
  v33.super_class = (Class)BMAppleIDChildSetup;
  BOOL v26 = [(BMEventBase *)&v33 init];
  if (v26)
  {
    v26->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v18)
    {
      v26->_hasIsNewChildAccount = 1;
      v26->_isNewChildAccount = [v18 BOOLValue];
    }
    else
    {
      id v18 = 0;
      v26->_hasIsNewChildAccount = 0;
      v26->_isNewChildAccount = 0;
    }
    if (v32)
    {
      v26->_hasRaw_startDate = 1;
      [v32 timeIntervalSince1970];
    }
    else
    {
      v26->_hasRaw_startDate = 0;
      double v27 = -1.0;
    }
    v26->_raw_startDate = v27;
    if (v19)
    {
      v26->_hasRaw_endDate = 1;
      [v19 timeIntervalSince1970];
    }
    else
    {
      v26->_hasRaw_endDate = 0;
      double v28 = -1.0;
    }
    v26->_raw_endDate = v28;
    if (v20)
    {
      v26->_hasCompletedSetup = 1;
      v26->_completedSetup = [v20 BOOLValue];
    }
    else
    {
      v26->_hasCompletedSetup = 0;
      v26->_completedSetup = 0;
    }
    v26->_lastViewedScreen = a7;
    if (v21)
    {
      v26->_hasAppUsage = 1;
      v26->_appUsage = [v21 BOOLValue];
    }
    else
    {
      v26->_hasAppUsage = 0;
      v26->_appUsage = 0;
    }
    if (v22)
    {
      v26->_hasAskToBuy = 1;
      v26->_askToBuy = [v22 BOOLValue];
    }
    else
    {
      v26->_hasAskToBuy = 0;
      v26->_askToBuy = 0;
    }
    if (v23)
    {
      v26->_hasCommSafety = 1;
      v26->_commSafety = [v23 BOOLValue];
    }
    else
    {
      v26->_hasCommSafety = 0;
      v26->_commSafety = 0;
    }
    if (v24)
    {
      v26->_hasScreenDistance = 1;
      v26->_screenDistance = [v24 BOOLValue];
    }
    else
    {
      v26->_hasScreenDistance = 0;
      v26->_screenDistance = 0;
    }
    if (v25)
    {
      v26->_hasAge = 1;
      unsigned int v29 = [v25 unsignedIntValue];
    }
    else
    {
      unsigned int v29 = 0;
      v26->_hasAge = 0;
    }
    v26->_age = v29;
    v26->_flowType = a13;
  }

  return v26;
}

+ (id)protoFields
{
  v15[11] = *MEMORY[0x1E4F143B8];
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isNewChildAccount" number:1 type:12 subMessageClass:0];
  v15[0] = v14;
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"startDate" number:2 type:0 subMessageClass:0];
  v15[1] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"endDate" number:3 type:0 subMessageClass:0];
  v15[2] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"completedSetup" number:4 type:12 subMessageClass:0];
  v15[3] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"lastViewedScreen" number:5 type:4 subMessageClass:0];
  v15[4] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"appUsage" number:6 type:12 subMessageClass:0];
  v15[5] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"askToBuy" number:7 type:12 subMessageClass:0];
  v15[6] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"commSafety" number:8 type:12 subMessageClass:0];
  v15[7] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"screenDistance" number:9 type:12 subMessageClass:0];
  v15[8] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"age" number:10 type:4 subMessageClass:0];
  v15[9] = v9;
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"flowType" number:11 type:4 subMessageClass:0];
  v15[10] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:11];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5BF8;
}

+ (id)columns
{
  v15[11] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isNewChildAccount" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:12 convertedType:0];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"startDate" dataType:3 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:2];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"endDate" dataType:3 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:2];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"completedSetup" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:12 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"lastViewedScreen" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"appUsage" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:12 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"askToBuy" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:12 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"commSafety" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:12 convertedType:0];
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"screenDistance" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:12 convertedType:0];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"age" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:4 convertedType:0];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"flowType" dataType:0 requestOnly:0 fieldNumber:11 protoDataType:4 convertedType:0];
  v15[0] = v2;
  v15[1] = v3;
  v15[2] = v4;
  v15[3] = v5;
  v15[4] = v6;
  v15[5] = v13;
  v15[6] = v7;
  v15[7] = v8;
  v15[8] = v14;
  v15[9] = v9;
  v15[10] = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:11];

  return v12;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMAppleIDChildSetup alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[16] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end