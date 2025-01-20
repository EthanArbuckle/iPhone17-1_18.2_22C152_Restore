@interface BMProactiveHarvestingReminders
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMProactiveHarvestingReminders)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMProactiveHarvestingReminders)initWithUniqueID:(id)a3 domainID:(id)a4 absoluteTimestamp:(id)a5 title:(id)a6 notes:(id)a7 isAllDay:(id)a8 completionDateTimestamp:(id)a9 dueDateTimestamp:(id)a10 priority:(id)a11 contentProtection:(id)a12 personaId:(id)a13;
- (BOOL)hasIsAllDay;
- (BOOL)hasPriority;
- (BOOL)isAllDay;
- (BOOL)isEqual:(id)a3;
- (NSDate)absoluteTimestamp;
- (NSDate)completionDateTimestamp;
- (NSDate)dueDateTimestamp;
- (NSString)contentProtection;
- (NSString)description;
- (NSString)domainID;
- (NSString)notes;
- (NSString)personaId;
- (NSString)title;
- (NSString)uniqueID;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)priority;
- (unsigned)dataVersion;
- (void)setHasIsAllDay:(BOOL)a3;
- (void)setHasPriority:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMProactiveHarvestingReminders

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_domainID, 0);

  objc_storeStrong((id *)&self->_uniqueID, 0);
}

- (NSString)personaId
{
  return self->_personaId;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (void)setHasPriority:(BOOL)a3
{
  self->_hasPriority = a3;
}

- (BOOL)hasPriority
{
  return self->_hasPriority;
}

- (int)priority
{
  return self->_priority;
}

- (void)setHasIsAllDay:(BOOL)a3
{
  self->_hasIsAllDay = a3;
}

- (BOOL)hasIsAllDay
{
  return self->_hasIsAllDay;
}

- (BOOL)isAllDay
{
  return self->_isAllDay;
}

- (NSString)notes
{
  return self->_notes;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)domainID
{
  return self->_domainID;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
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
    v6 = [(BMProactiveHarvestingReminders *)self uniqueID];
    uint64_t v7 = [v5 uniqueID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMProactiveHarvestingReminders *)self uniqueID];
      v10 = [v5 uniqueID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_43;
      }
    }
    v13 = [(BMProactiveHarvestingReminders *)self domainID];
    uint64_t v14 = [v5 domainID];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMProactiveHarvestingReminders *)self domainID];
      v17 = [v5 domainID];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_43;
      }
    }
    v19 = [(BMProactiveHarvestingReminders *)self absoluteTimestamp];
    uint64_t v20 = [v5 absoluteTimestamp];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMProactiveHarvestingReminders *)self absoluteTimestamp];
      v23 = [v5 absoluteTimestamp];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_43;
      }
    }
    v25 = [(BMProactiveHarvestingReminders *)self title];
    uint64_t v26 = [v5 title];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMProactiveHarvestingReminders *)self title];
      v29 = [v5 title];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_43;
      }
    }
    v31 = [(BMProactiveHarvestingReminders *)self notes];
    uint64_t v32 = [v5 notes];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMProactiveHarvestingReminders *)self notes];
      v35 = [v5 notes];
      int v36 = [v34 isEqual:v35];

      if (!v36) {
        goto LABEL_43;
      }
    }
    if ([(BMProactiveHarvestingReminders *)self hasIsAllDay]
      || [v5 hasIsAllDay])
    {
      if (![(BMProactiveHarvestingReminders *)self hasIsAllDay]) {
        goto LABEL_43;
      }
      if (![v5 hasIsAllDay]) {
        goto LABEL_43;
      }
      int v37 = [(BMProactiveHarvestingReminders *)self isAllDay];
      if (v37 != [v5 isAllDay]) {
        goto LABEL_43;
      }
    }
    v38 = [(BMProactiveHarvestingReminders *)self completionDateTimestamp];
    uint64_t v39 = [v5 completionDateTimestamp];
    if (v38 == (void *)v39)
    {
    }
    else
    {
      v40 = (void *)v39;
      v41 = [(BMProactiveHarvestingReminders *)self completionDateTimestamp];
      v42 = [v5 completionDateTimestamp];
      int v43 = [v41 isEqual:v42];

      if (!v43) {
        goto LABEL_43;
      }
    }
    v44 = [(BMProactiveHarvestingReminders *)self dueDateTimestamp];
    uint64_t v45 = [v5 dueDateTimestamp];
    if (v44 == (void *)v45)
    {
    }
    else
    {
      v46 = (void *)v45;
      v47 = [(BMProactiveHarvestingReminders *)self dueDateTimestamp];
      v48 = [v5 dueDateTimestamp];
      int v49 = [v47 isEqual:v48];

      if (!v49) {
        goto LABEL_43;
      }
    }
    if ([(BMProactiveHarvestingReminders *)self hasPriority]
      || [v5 hasPriority])
    {
      if (![(BMProactiveHarvestingReminders *)self hasPriority]) {
        goto LABEL_43;
      }
      if (![v5 hasPriority]) {
        goto LABEL_43;
      }
      int v50 = [(BMProactiveHarvestingReminders *)self priority];
      if (v50 != [v5 priority]) {
        goto LABEL_43;
      }
    }
    v51 = [(BMProactiveHarvestingReminders *)self contentProtection];
    uint64_t v52 = [v5 contentProtection];
    if (v51 == (void *)v52)
    {
    }
    else
    {
      v53 = (void *)v52;
      v54 = [(BMProactiveHarvestingReminders *)self contentProtection];
      v55 = [v5 contentProtection];
      int v56 = [v54 isEqual:v55];

      if (!v56)
      {
LABEL_43:
        char v12 = 0;
LABEL_44:

        goto LABEL_45;
      }
    }
    v58 = [(BMProactiveHarvestingReminders *)self personaId];
    v59 = [v5 personaId];
    if (v58 == v59)
    {
      char v12 = 1;
    }
    else
    {
      v60 = [(BMProactiveHarvestingReminders *)self personaId];
      v61 = [v5 personaId];
      char v12 = [v60 isEqual:v61];
    }
    goto LABEL_44;
  }
  char v12 = 0;
LABEL_45:

  return v12;
}

- (NSDate)dueDateTimestamp
{
  if (self->_hasRaw_dueDateTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_dueDateTimestamp];
    id v4 = [v2 convertValue:v3 toType:1];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)completionDateTimestamp
{
  if (self->_hasRaw_completionDateTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_completionDateTimestamp];
    id v4 = [v2 convertValue:v3 toType:1];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)absoluteTimestamp
{
  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_absoluteTimestamp];
    id v4 = [v2 convertValue:v3 toType:1];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (id)jsonDictionary
{
  v47[11] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMProactiveHarvestingReminders *)self uniqueID];
  uint64_t v4 = [(BMProactiveHarvestingReminders *)self domainID];
  id v5 = [(BMProactiveHarvestingReminders *)self absoluteTimestamp];
  if (v5)
  {
    v6 = NSNumber;
    uint64_t v7 = [(BMProactiveHarvestingReminders *)self absoluteTimestamp];
    [v7 timeIntervalSinceReferenceDate];
    uint64_t v8 = objc_msgSend(v6, "numberWithDouble:");
  }
  else
  {
    uint64_t v8 = 0;
  }

  uint64_t v9 = [(BMProactiveHarvestingReminders *)self title];
  uint64_t v10 = [(BMProactiveHarvestingReminders *)self notes];
  if ([(BMProactiveHarvestingReminders *)self hasIsAllDay])
  {
    uint64_t v45 = objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingReminders isAllDay](self, "isAllDay"));
  }
  else
  {
    uint64_t v45 = 0;
  }
  int v11 = [(BMProactiveHarvestingReminders *)self completionDateTimestamp];
  if (v11)
  {
    char v12 = NSNumber;
    v13 = [(BMProactiveHarvestingReminders *)self completionDateTimestamp];
    [v13 timeIntervalSinceReferenceDate];
    v44 = objc_msgSend(v12, "numberWithDouble:");
  }
  else
  {
    v44 = 0;
  }

  uint64_t v14 = [(BMProactiveHarvestingReminders *)self dueDateTimestamp];
  if (v14)
  {
    v15 = NSNumber;
    v16 = [(BMProactiveHarvestingReminders *)self dueDateTimestamp];
    [v16 timeIntervalSinceReferenceDate];
    int v43 = objc_msgSend(v15, "numberWithDouble:");
  }
  else
  {
    int v43 = 0;
  }

  if ([(BMProactiveHarvestingReminders *)self hasPriority])
  {
    v17 = objc_msgSend(NSNumber, "numberWithInt:", -[BMProactiveHarvestingReminders priority](self, "priority"));
  }
  else
  {
    v17 = 0;
  }
  int v18 = [(BMProactiveHarvestingReminders *)self contentProtection];
  v19 = [(BMProactiveHarvestingReminders *)self personaId];
  v46[0] = @"uniqueID";
  uint64_t v20 = v3;
  if (!v3)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  int v37 = (void *)v20;
  v47[0] = v20;
  v46[1] = @"domainID";
  uint64_t v21 = v4;
  if (!v4)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  int v36 = (void *)v21;
  v47[1] = v21;
  v46[2] = @"absoluteTimestamp";
  uint64_t v22 = v8;
  if (!v8)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v35 = (void *)v22;
  v47[2] = v22;
  v46[3] = @"title";
  uint64_t v23 = v9;
  if (!v9)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v42 = (void *)v3;
  v34 = (void *)v23;
  v47[3] = v23;
  v46[4] = @"notes";
  uint64_t v24 = v10;
  if (!v10)
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v41 = (void *)v4;
  v33 = (void *)v24;
  v47[4] = v24;
  v46[5] = @"isAllDay";
  v25 = v45;
  if (!v45)
  {
    v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v40 = (void *)v8;
  v47[5] = v25;
  v46[6] = @"completionDateTimestamp";
  uint64_t v26 = v44;
  if (!v44)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v39 = (void *)v9;
  v47[6] = v26;
  v46[7] = @"dueDateTimestamp";
  v27 = v43;
  if (!v43)
  {
    v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v28 = (void *)v10;
  v47[7] = v27;
  v46[8] = @"priority";
  v29 = v17;
  if (!v17)
  {
    v29 = [MEMORY[0x1E4F1CA98] null];
  }
  v47[8] = v29;
  v46[9] = @"contentProtection";
  int v30 = v18;
  if (!v18)
  {
    int v30 = [MEMORY[0x1E4F1CA98] null];
  }
  v47[9] = v30;
  v46[10] = @"personaId";
  v31 = v19;
  if (!v19)
  {
    v31 = [MEMORY[0x1E4F1CA98] null];
  }
  v47[10] = v31;
  id v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:11];
  if (v19)
  {
    if (v18) {
      goto LABEL_40;
    }
LABEL_57:

    if (v17) {
      goto LABEL_41;
    }
    goto LABEL_58;
  }

  if (!v18) {
    goto LABEL_57;
  }
LABEL_40:
  if (v17) {
    goto LABEL_41;
  }
LABEL_58:

LABEL_41:
  if (!v43) {

  }
  if (!v44) {
  if (!v45)
  }

  if (!v28) {
  if (v39)
  }
  {
    if (v40) {
      goto LABEL_51;
    }
  }
  else
  {

    if (v40)
    {
LABEL_51:
      if (v41) {
        goto LABEL_52;
      }
LABEL_61:

      if (v42) {
        goto LABEL_53;
      }
      goto LABEL_62;
    }
  }

  if (!v41) {
    goto LABEL_61;
  }
LABEL_52:
  if (v42) {
    goto LABEL_53;
  }
LABEL_62:

LABEL_53:

  return v38;
}

- (BMProactiveHarvestingReminders)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v151[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"uniqueID"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
LABEL_4:
    uint64_t v8 = [v5 objectForKeyedSubscript:@"domainID"];
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v127 = 0;
LABEL_7:
      uint64_t v9 = [v5 objectForKeyedSubscript:@"absoluteTimestamp"];
      if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v11 = (objc_class *)MEMORY[0x1E4F1C9C8];
          char v12 = a4;
          id v13 = v9;
          id v14 = [v11 alloc];
          [v13 doubleValue];
          double v16 = v15;

          a4 = v12;
          id v17 = (id)[v14 initWithTimeIntervalSinceReferenceDate:v16];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v31 = objc_alloc_init(MEMORY[0x1E4F28D48]);
            uint64_t v10 = [v31 dateFromString:v9];

            goto LABEL_23;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              uint64_t v10 = 0;
              uint64_t v22 = 0;
              uint64_t v21 = v127;
              goto LABEL_88;
            }
            v89 = v6;
            id v90 = v7;
            v91 = a4;
            id v92 = objc_alloc(MEMORY[0x1E4F28C58]);
            v93 = v9;
            uint64_t v94 = *MEMORY[0x1E4F502C8];
            uint64_t v146 = *MEMORY[0x1E4F28568];
            id v126 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"absoluteTimestamp"];
            id v147 = v126;
            uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v147 forKeys:&v146 count:1];
            uint64_t v95 = v94;
            uint64_t v9 = v93;
            uint64_t v22 = 0;
            id *v91 = (id)[v92 initWithDomain:v95 code:2 userInfo:v32];
            id v7 = v90;
            v6 = v89;
            uint64_t v10 = 0;
            uint64_t v21 = v127;
            goto LABEL_87;
          }
          id v17 = v9;
        }
        uint64_t v10 = v17;
      }
      else
      {
        uint64_t v10 = 0;
      }
LABEL_23:
      uint64_t v32 = [v5 objectForKeyedSubscript:@"title"];
      v123 = v32;
      v125 = v10;
      if (v32 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v126 = 0;
            uint64_t v22 = 0;
            uint64_t v21 = v127;
LABEL_87:

            goto LABEL_88;
          }
          v114 = a4;
          id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
          v44 = v9;
          uint64_t v45 = *MEMORY[0x1E4F502C8];
          uint64_t v144 = *MEMORY[0x1E4F28568];
          id v124 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"title"];
          id v145 = v124;
          uint64_t v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v145 forKeys:&v144 count:1];
          v47 = v43;
          v48 = (void *)v46;
          uint64_t v49 = v45;
          uint64_t v9 = v44;
          id v126 = 0;
          uint64_t v22 = 0;
          id *v114 = (id)[v47 initWithDomain:v49 code:2 userInfo:v46];
          uint64_t v21 = v127;
LABEL_86:

          goto LABEL_87;
        }
        id v126 = v32;
      }
      else
      {
        id v126 = 0;
      }
      v33 = [v5 objectForKeyedSubscript:@"notes"];
      if (v33 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v124 = 0;
            uint64_t v22 = 0;
            uint64_t v21 = v127;
            v48 = v33;
LABEL_85:
            uint64_t v10 = v125;
            goto LABEL_86;
          }
          v121 = v6;
          id v117 = v7;
          int v50 = a4;
          id v51 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v52 = v9;
          uint64_t v53 = *MEMORY[0x1E4F502C8];
          uint64_t v142 = *MEMORY[0x1E4F28568];
          v48 = v33;
          id v34 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"notes"];
          id v143 = v34;
          uint64_t v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v143 forKeys:&v142 count:1];
          uint64_t v55 = v53;
          uint64_t v9 = v52;
          v119 = (void *)v54;
          id v124 = 0;
          uint64_t v22 = 0;
          *int v50 = (id)objc_msgSend(v51, "initWithDomain:code:userInfo:", v55, 2);
          id v7 = v117;
          v6 = v121;
          goto LABEL_83;
        }
        v115 = v33;
        id v124 = v33;
      }
      else
      {
        v115 = v33;
        id v124 = 0;
      }
      id v34 = [v5 objectForKeyedSubscript:@"isAllDay"];
      v119 = v34;
      v113 = a4;
      if (v34)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v34 = 0;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              id v34 = 0;
              uint64_t v22 = 0;
              uint64_t v21 = v127;
              v48 = v115;
              goto LABEL_84;
            }
            id v56 = objc_alloc(MEMORY[0x1E4F28C58]);
            v57 = v9;
            uint64_t v58 = *MEMORY[0x1E4F502C8];
            uint64_t v140 = *MEMORY[0x1E4F28568];
            id v59 = [NSString alloc];
            uint64_t v106 = objc_opt_class();
            v60 = v59;
            uint64_t v32 = v123;
            v120 = (void *)[v60 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v106, @"isAllDay"];
            v141 = v120;
            uint64_t v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v141 forKeys:&v140 count:1];
            uint64_t v62 = v58;
            uint64_t v9 = v57;
            v111 = (void *)v61;
            id v63 = (id)objc_msgSend(v56, "initWithDomain:code:userInfo:", v62, 2);
            id v34 = 0;
            uint64_t v22 = 0;
            v48 = v115;
            id *v113 = v63;
            goto LABEL_82;
          }
          id v34 = v34;
        }
      }
      uint64_t v35 = [v5 objectForKeyedSubscript:@"completionDateTimestamp"];
      v111 = (void *)v35;
      if (!v35 || (int v36 = (void *)v35, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v120 = 0;
LABEL_60:
        v65 = [v5 objectForKeyedSubscript:@"dueDateTimestamp"];
        id v118 = v7;
        v109 = v9;
        v110 = v8;
        if (v65 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v66 = (objc_class *)MEMORY[0x1E4F1C9C8];
            v67 = v9;
            id v68 = v65;
            id v69 = [v66 alloc];
            [v68 doubleValue];
            double v71 = v70;

            uint64_t v9 = v67;
            id v72 = (id)[v69 initWithTimeIntervalSinceReferenceDate:v71];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v73 = objc_alloc_init(MEMORY[0x1E4F28D48]);
              v116 = [v73 dateFromString:v65];

              goto LABEL_68;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!v113)
              {
                v116 = 0;
                uint64_t v22 = 0;
                goto LABEL_81;
              }
              id v102 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v103 = *MEMORY[0x1E4F502C8];
              uint64_t v136 = *MEMORY[0x1E4F28568];
              id v75 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"dueDateTimestamp"];
              id v137 = v75;
              v74 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v137 forKeys:&v136 count:1];
              v104 = v102;
              uint64_t v9 = v109;
              uint64_t v105 = v103;
              id v7 = v118;
              v116 = 0;
              uint64_t v22 = 0;
              id *v113 = (id)[v104 initWithDomain:v105 code:2 userInfo:v74];
              goto LABEL_80;
            }
            id v72 = v65;
          }
          v116 = v72;
        }
        else
        {
          v116 = 0;
        }
LABEL_68:
        v74 = [v5 objectForKeyedSubscript:@"priority"];
        id v112 = v34;
        if (v74 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v113)
            {
              id v75 = 0;
              uint64_t v22 = 0;
              goto LABEL_80;
            }
            id v82 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v83 = *MEMORY[0x1E4F502C8];
            uint64_t v134 = *MEMORY[0x1E4F28568];
            id v78 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"priority"];
            id v135 = v78;
            v76 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v135 forKeys:&v134 count:1];
            id v84 = (id)[v82 initWithDomain:v83 code:2 userInfo:v76];
            uint64_t v22 = 0;
            id v75 = 0;
            id *v113 = v84;
LABEL_79:

            id v7 = v118;
            uint64_t v9 = v109;
            id v34 = v112;
LABEL_80:

            uint64_t v8 = v110;
            goto LABEL_81;
          }
          id v75 = v74;
        }
        else
        {
          id v75 = 0;
        }
        v76 = [v5 objectForKeyedSubscript:@"contentProtection"];
        v122 = v6;
        if (v76 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v113)
            {
              id v78 = 0;
              uint64_t v22 = 0;
              goto LABEL_79;
            }
            v77 = self;
            id v107 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v85 = *MEMORY[0x1E4F502C8];
            uint64_t v132 = *MEMORY[0x1E4F28568];
            id v80 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"contentProtection"];
            id v133 = v80;
            v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v133 forKeys:&v132 count:1];
            id v86 = (id)[v107 initWithDomain:v85 code:2 userInfo:v79];
            uint64_t v22 = 0;
            id v78 = 0;
            id *v113 = v86;
            goto LABEL_78;
          }
          v77 = self;
          id v78 = v76;
        }
        else
        {
          v77 = self;
          id v78 = 0;
        }
        v79 = [v5 objectForKeyedSubscript:@"personaId"];
        if (v79 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (v113)
            {
              id v129 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v108 = *MEMORY[0x1E4F502C8];
              uint64_t v130 = *MEMORY[0x1E4F28568];
              v87 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"personaId"];
              v131 = v87;
              v88 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v131 forKeys:&v130 count:1];
              id *v113 = (id)[v129 initWithDomain:v108 code:2 userInfo:v88];
            }
            id v80 = 0;
            uint64_t v22 = 0;
            goto LABEL_78;
          }
          id v80 = v79;
        }
        else
        {
          id v80 = 0;
        }
        uint64_t v22 = [(BMProactiveHarvestingReminders *)v77 initWithUniqueID:v118 domainID:v127 absoluteTimestamp:v125 title:v126 notes:v124 isAllDay:v112 completionDateTimestamp:v120 dueDateTimestamp:v116 priority:v75 contentProtection:v78 personaId:v80];
        v77 = v22;
LABEL_78:
        self = v77;

        v6 = v122;
        goto LABEL_79;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v37 = (objc_class *)MEMORY[0x1E4F1C9C8];
        id v38 = v36;
        id v39 = [v37 alloc];
        [v38 doubleValue];
        double v41 = v40;

        id v42 = (id)[v39 initWithTimeIntervalSinceReferenceDate:v41];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v64 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          v120 = [v64 dateFromString:v36];

          goto LABEL_60;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v96 = v6;
          id v97 = v7;
          if (!v113)
          {
            v120 = 0;
            uint64_t v22 = 0;
            uint64_t v32 = v123;
            v6 = v96;
            v48 = v115;
            goto LABEL_82;
          }
          id v98 = objc_alloc(MEMORY[0x1E4F28C58]);
          v99 = v9;
          uint64_t v100 = *MEMORY[0x1E4F502C8];
          uint64_t v138 = *MEMORY[0x1E4F28568];
          v116 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"completionDateTimestamp"];
          v139 = v116;
          v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v139 forKeys:&v138 count:1];
          uint64_t v101 = v100;
          uint64_t v9 = v99;
          v120 = 0;
          uint64_t v22 = 0;
          id *v113 = (id)[v98 initWithDomain:v101 code:2 userInfo:v65];
          id v7 = v97;
          v6 = v96;
LABEL_81:
          v48 = v115;

          uint64_t v32 = v123;
LABEL_82:

LABEL_83:
          uint64_t v21 = v127;
LABEL_84:

          goto LABEL_85;
        }
        id v42 = v36;
      }
      v120 = v42;
      goto LABEL_60;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v127 = v8;
      goto LABEL_7;
    }
    if (a4)
    {
      uint64_t v23 = v6;
      id v24 = v7;
      v25 = a4;
      id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v27 = *MEMORY[0x1E4F502C8];
      uint64_t v148 = *MEMORY[0x1E4F28568];
      uint64_t v28 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"domainID"];
      uint64_t v149 = v28;
      uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v149 forKeys:&v148 count:1];
      uint64_t v30 = v27;
      uint64_t v9 = (void *)v29;
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      id *v25 = (id)[v26 initWithDomain:v30 code:2 userInfo:v29];
      id v7 = v24;
      v6 = v23;
      uint64_t v10 = (void *)v28;
LABEL_88:

      goto LABEL_89;
    }
    uint64_t v21 = 0;
    uint64_t v22 = 0;
LABEL_89:

    goto LABEL_90;
  }
  if (a4)
  {
    int v18 = a4;
    id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v20 = *MEMORY[0x1E4F502C8];
    uint64_t v150 = *MEMORY[0x1E4F28568];
    uint64_t v21 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"uniqueID"];
    v151[0] = v21;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v151 forKeys:&v150 count:1];
    uint64_t v22 = 0;
    *int v18 = (id)[v19 initWithDomain:v20 code:2 userInfo:v8];
    id v7 = 0;
    goto LABEL_89;
  }
  id v7 = 0;
  uint64_t v22 = 0;
LABEL_90:

  return v22;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMProactiveHarvestingReminders *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_uniqueID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_domainID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasRaw_absoluteTimestamp)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_notes)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasIsAllDay)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasRaw_completionDateTimestamp)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasRaw_dueDateTimestamp)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasPriority)
  {
    PBDataWriterWriteSint32Field();
    id v4 = v5;
  }
  if (self->_contentProtection)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_personaId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)BMProactiveHarvestingReminders;
  id v5 = [(BMEventBase *)&v47 init];
  if (!v5) {
    goto LABEL_70;
  }
  v6 = (int *)MEMORY[0x1E4F940E8];
  id v7 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v8 = (int *)MEMORY[0x1E4F940C8];
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
          uint64_t v21 = 80;
          goto LABEL_51;
        case 2u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 88;
          goto LABEL_51;
        case 3u:
          v5->_hasRaw_absoluteTimestamp = 1;
          uint64_t v22 = *v6;
          unint64_t v23 = *(void *)&v4[v22];
          if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(void *)&v4[*v7])
          {
            id v24 = *(objc_class **)(*(void *)&v4[*v9] + v23);
            *(void *)&v4[v22] = v23 + 8;
          }
          else
          {
            v4[*v8] = 1;
            id v24 = 0;
          }
          uint64_t v44 = 24;
          goto LABEL_66;
        case 4u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 96;
          goto LABEL_51;
        case 5u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 104;
          goto LABEL_51;
        case 6u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          v5->_hasIsAllDay = 1;
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
                  uint64_t v27 = 0;
                  goto LABEL_55;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v27 = 0;
          }
LABEL_55:
          v5->_isAllDay = v27 != 0;
          continue;
        case 7u:
          v5->_hasRaw_completionDateTimestamp = 1;
          uint64_t v32 = *v6;
          unint64_t v33 = *(void *)&v4[v32];
          if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(void *)&v4[*v7])
          {
            id v24 = *(objc_class **)(*(void *)&v4[*v9] + v33);
            *(void *)&v4[v32] = v33 + 8;
          }
          else
          {
            v4[*v8] = 1;
            id v24 = 0;
          }
          uint64_t v44 = 40;
          goto LABEL_66;
        case 8u:
          v5->_hasRaw_dueDateTimestamp = 1;
          uint64_t v34 = *v6;
          unint64_t v35 = *(void *)&v4[v34];
          if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(void *)&v4[*v7])
          {
            id v24 = *(objc_class **)(*(void *)&v4[*v9] + v35);
            *(void *)&v4[v34] = v35 + 8;
          }
          else
          {
            v4[*v8] = 1;
            id v24 = 0;
          }
          uint64_t v44 = 56;
LABEL_66:
          *(Class *)((char *)&v5->super.super.isa + v44) = v24;
          continue;
        case 9u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v38 = 0;
          v5->_hasPriority = 1;
          break;
        case 0xAu:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 112;
          goto LABEL_51;
        case 0xBu:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 120;
LABEL_51:
          id v43 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_69;
          }
          continue;
      }
      while (1)
      {
        uint64_t v39 = *v6;
        uint64_t v40 = *(void *)&v4[v39];
        unint64_t v41 = v40 + 1;
        if (v40 == -1 || v41 > *(void *)&v4[*v7]) {
          break;
        }
        char v42 = *(unsigned char *)(*(void *)&v4[*v9] + v40);
        *(void *)&v4[v39] = v41;
        v38 |= (unint64_t)(v42 & 0x7F) << v36;
        if ((v42 & 0x80) == 0) {
          goto LABEL_57;
        }
        v36 += 7;
        BOOL v17 = v37++ >= 9;
        if (v17)
        {
          LODWORD(v38) = 0;
          goto LABEL_59;
        }
      }
      v4[*v8] = 1;
LABEL_57:
      if (v4[*v8]) {
        LODWORD(v38) = 0;
      }
LABEL_59:
      v5->_priority = -(v38 & 1) ^ ((int)v38 >> 1);
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_69:
  }
    uint64_t v45 = 0;
  else {
LABEL_70:
  }
    uint64_t v45 = v5;

  return v45;
}

- (NSString)description
{
  id v14 = [NSString alloc];
  char v16 = [(BMProactiveHarvestingReminders *)self uniqueID];
  uint64_t v3 = [(BMProactiveHarvestingReminders *)self domainID];
  id v4 = [(BMProactiveHarvestingReminders *)self absoluteTimestamp];
  id v5 = [(BMProactiveHarvestingReminders *)self title];
  v6 = [(BMProactiveHarvestingReminders *)self notes];
  id v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingReminders isAllDay](self, "isAllDay"));
  uint64_t v8 = [(BMProactiveHarvestingReminders *)self completionDateTimestamp];
  uint64_t v9 = [(BMProactiveHarvestingReminders *)self dueDateTimestamp];
  char v10 = objc_msgSend(NSNumber, "numberWithInt:", -[BMProactiveHarvestingReminders priority](self, "priority"));
  unsigned int v11 = [(BMProactiveHarvestingReminders *)self contentProtection];
  unint64_t v12 = [(BMProactiveHarvestingReminders *)self personaId];
  id v15 = (id)[v14 initWithFormat:@"BMProactiveHarvestingReminders with uniqueID: %@, domainID: %@, absoluteTimestamp: %@, title: %@, notes: %@, isAllDay: %@, completionDateTimestamp: %@, dueDateTimestamp: %@, priority: %@, contentProtection: %@, personaId: %@", v16, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return (NSString *)v15;
}

- (BMProactiveHarvestingReminders)initWithUniqueID:(id)a3 domainID:(id)a4 absoluteTimestamp:(id)a5 title:(id)a6 notes:(id)a7 isAllDay:(id)a8 completionDateTimestamp:(id)a9 dueDateTimestamp:(id)a10 priority:(id)a11 contentProtection:(id)a12 personaId:(id)a13
{
  id v38 = a3;
  id v31 = a4;
  id v37 = a4;
  id v18 = a5;
  id v36 = a6;
  id v32 = a7;
  id v35 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  id v23 = a12;
  id v34 = a13;
  v39.receiver = self;
  v39.super_class = (Class)BMProactiveHarvestingReminders;
  id v24 = [(BMEventBase *)&v39 init];
  if (v24)
  {
    v24->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v24->_uniqueID, a3);
    objc_storeStrong((id *)&v24->_domainID, v31);
    if (v18)
    {
      v24->_hasRaw_absoluteTimestamp = 1;
      [v18 timeIntervalSinceReferenceDate];
    }
    else
    {
      v24->_hasRaw_absoluteTimestamp = 0;
      double v25 = -1.0;
    }
    v24->_raw_absoluteTimestamp = v25;
    objc_storeStrong((id *)&v24->_title, a6);
    objc_storeStrong((id *)&v24->_notes, v32);
    if (v19)
    {
      v24->_hasIsAllDay = 1;
      v24->_isAllDay = [v19 BOOLValue];
    }
    else
    {
      v24->_hasIsAllDay = 0;
      v24->_isAllDay = 0;
    }
    if (v20)
    {
      v24->_hasRaw_completionDateTimestamp = 1;
      [v20 timeIntervalSinceReferenceDate];
    }
    else
    {
      v24->_hasRaw_completionDateTimestamp = 0;
      double v26 = -1.0;
    }
    v24->_raw_completionDateTimestamp = v26;
    if (v21)
    {
      v24->_hasRaw_dueDateTimestamp = 1;
      [v21 timeIntervalSinceReferenceDate];
    }
    else
    {
      v24->_hasRaw_dueDateTimestamp = 0;
      double v27 = -1.0;
    }
    v24->_raw_dueDateTimestamp = v27;
    if (v22)
    {
      v24->_hasPriority = 1;
      int v28 = [v22 intValue];
    }
    else
    {
      v24->_hasPriority = 0;
      int v28 = -1;
    }
    v24->_priority = v28;
    objc_storeStrong((id *)&v24->_contentProtection, a12);
    objc_storeStrong((id *)&v24->_personaId, a13);
  }

  return v24;
}

+ (id)protoFields
{
  v15[11] = *MEMORY[0x1E4F143B8];
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"uniqueID" number:1 type:13 subMessageClass:0];
  v15[0] = v14;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"domainID" number:2 type:13 subMessageClass:0];
  v15[1] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"absoluteTimestamp" number:3 type:0 subMessageClass:0];
  v15[2] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"title" number:4 type:13 subMessageClass:0];
  v15[3] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"notes" number:5 type:13 subMessageClass:0];
  v15[4] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isAllDay" number:6 type:12 subMessageClass:0];
  v15[5] = v5;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"completionDateTimestamp" number:7 type:0 subMessageClass:0];
  v15[6] = v6;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"dueDateTimestamp" number:8 type:0 subMessageClass:0];
  v15[7] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"priority" number:9 type:6 subMessageClass:0];
  v15[8] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contentProtection" number:10 type:13 subMessageClass:0];
  v15[9] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"personaId" number:11 type:13 subMessageClass:0];
  v15[10] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:11];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5790;
}

+ (id)columns
{
  v15[11] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"uniqueID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"domainID" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:1];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"title" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"notes" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isAllDay" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:12 convertedType:0];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"completionDateTimestamp" dataType:3 requestOnly:0 fieldNumber:7 protoDataType:0 convertedType:1];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"dueDateTimestamp" dataType:3 requestOnly:0 fieldNumber:8 protoDataType:0 convertedType:1];
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"priority" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:6 convertedType:0];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contentProtection" dataType:2 requestOnly:0 fieldNumber:10 protoDataType:13 convertedType:0];
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"personaId" dataType:2 requestOnly:0 fieldNumber:11 protoDataType:13 convertedType:0];
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
  if (a4 == 1)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F94090];
    id v5 = a3;
    v6 = (void *)[[v4 alloc] initWithData:v5];

    id v7 = [[BMProactiveHarvestingReminders alloc] initByReadFrom:v6];
    uint64_t v8 = v7;
    if (v7) {
      v7[17] = 1;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (unsigned)latestDataVersion
{
  return 1;
}

@end