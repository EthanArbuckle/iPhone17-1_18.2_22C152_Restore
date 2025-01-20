@interface BMFrontBoardDisplayElement
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMFrontBoardDisplayElement)initWithAbsoluteTimestamp:(id)a3 identifier:(id)a4 bundleIdentifier:(id)a5 elementType:(int)a6 layoutRole:(id)a7 level:(id)a8 hasKeyboardFocus:(id)a9 isUIApplicationElement:(id)a10 display:(id)a11 changeType:(int)a12;
- (BMFrontBoardDisplayElement)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMFrontBoardDisplayElementDisplay)display;
- (BOOL)hasHasKeyboardFocus;
- (BOOL)hasIsUIApplicationElement;
- (BOOL)hasKeyboardFocus;
- (BOOL)hasLayoutRole;
- (BOOL)hasLevel;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUIApplicationElement;
- (NSDate)absoluteTimestamp;
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)identifier;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)changeType;
- (int)elementType;
- (int64_t)layoutRole;
- (int64_t)level;
- (unsigned)dataVersion;
- (void)setHasHasKeyboardFocus:(BOOL)a3;
- (void)setHasIsUIApplicationElement:(BOOL)a3;
- (void)setHasLayoutRole:(BOOL)a3;
- (void)setHasLevel:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMFrontBoardDisplayElement

- (NSString)identifier
{
  return self->_identifier;
}

- (BMFrontBoardDisplayElementDisplay)display
{
  return self->_display;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_display, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BMFrontBoardDisplayElement)initWithAbsoluteTimestamp:(id)a3 identifier:(id)a4 bundleIdentifier:(id)a5 elementType:(int)a6 layoutRole:(id)a7 level:(id)a8 hasKeyboardFocus:(id)a9 isUIApplicationElement:(id)a10 display:(id)a11 changeType:(int)a12
{
  id v18 = a3;
  id v30 = a4;
  id v29 = a5;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v28 = a11;
  v31.receiver = self;
  v31.super_class = (Class)BMFrontBoardDisplayElement;
  v23 = [(BMEventBase *)&v31 init];
  if (v23)
  {
    v23->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v18)
    {
      v23->_hasRaw_absoluteTimestamp = 1;
      [v18 timeIntervalSince1970];
    }
    else
    {
      v23->_hasRaw_absoluteTimestamp = 0;
      double v24 = -1.0;
    }
    v23->_raw_absoluteTimestamp = v24;
    objc_storeStrong((id *)&v23->_identifier, a4);
    objc_storeStrong((id *)&v23->_bundleIdentifier, a5);
    v23->_elementType = a6;
    if (v19)
    {
      v23->_hasLayoutRole = 1;
      uint64_t v25 = [v19 longLongValue];
    }
    else
    {
      v23->_hasLayoutRole = 0;
      uint64_t v25 = -1;
    }
    v23->_layoutRole = v25;
    if (v20)
    {
      v23->_hasLevel = 1;
      uint64_t v26 = [v20 longLongValue];
    }
    else
    {
      v23->_hasLevel = 0;
      uint64_t v26 = -1;
    }
    v23->_level = v26;
    if (v21)
    {
      v23->_hasHasKeyboardFocus = 1;
      v23->_hasKeyboardFocus = [v21 BOOLValue];
    }
    else
    {
      v23->_hasHasKeyboardFocus = 0;
      v23->_hasKeyboardFocus = 0;
    }
    if (v22)
    {
      v23->_hasIsUIApplicationElement = 1;
      v23->_isUIApplicationElement = [v22 BOOLValue];
    }
    else
    {
      v23->_hasIsUIApplicationElement = 0;
      v23->_isUIApplicationElement = 0;
    }
    objc_storeStrong((id *)&v23->_display, a11);
    v23->_changeType = a12;
  }

  return v23;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)changeType
{
  return self->_changeType;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (int64_t)level
{
  return self->_level;
}

- (int64_t)layoutRole
{
  return self->_layoutRole;
}

- (BOOL)hasKeyboardFocus
{
  return self->_hasKeyboardFocus;
}

- (int)elementType
{
  return self->_elementType;
}

- (BOOL)isUIApplicationElement
{
  return self->_isUIApplicationElement;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMFrontBoardDisplayElement *)self writeTo:v3];
  v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_hasRaw_absoluteTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_bundleIdentifier) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasLayoutRole) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_hasLevel) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_hasHasKeyboardFocus) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsUIApplicationElement) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_display)
  {
    PBDataWriterPlaceMark();
    [(BMFrontBoardDisplayElementDisplay *)self->_display writeTo:v4];
    PBDataWriterRecallMark();
  }
  PBDataWriterWriteUint32Field();
}

- (void)setHasIsUIApplicationElement:(BOOL)a3
{
  self->_hasIsUIApplicationElement = a3;
}

- (BOOL)hasIsUIApplicationElement
{
  return self->_hasIsUIApplicationElement;
}

- (void)setHasHasKeyboardFocus:(BOOL)a3
{
  self->_hasHasKeyboardFocus = a3;
}

- (BOOL)hasHasKeyboardFocus
{
  return self->_hasHasKeyboardFocus;
}

- (void)setHasLevel:(BOOL)a3
{
  self->_hasLevel = a3;
}

- (BOOL)hasLevel
{
  return self->_hasLevel;
}

- (void)setHasLayoutRole:(BOOL)a3
{
  self->_hasLayoutRole = a3;
}

- (BOOL)hasLayoutRole
{
  return self->_hasLayoutRole;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(BMFrontBoardDisplayElement *)self absoluteTimestamp];
    uint64_t v7 = [v5 absoluteTimestamp];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMFrontBoardDisplayElement *)self absoluteTimestamp];
      v10 = [v5 absoluteTimestamp];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_38;
      }
    }
    v13 = [(BMFrontBoardDisplayElement *)self identifier];
    uint64_t v14 = [v5 identifier];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMFrontBoardDisplayElement *)self identifier];
      v17 = [v5 identifier];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_38;
      }
    }
    id v19 = [(BMFrontBoardDisplayElement *)self bundleIdentifier];
    uint64_t v20 = [v5 bundleIdentifier];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      id v21 = (void *)v20;
      id v22 = [(BMFrontBoardDisplayElement *)self bundleIdentifier];
      v23 = [v5 bundleIdentifier];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_38;
      }
    }
    int v25 = [(BMFrontBoardDisplayElement *)self elementType];
    if (v25 != [v5 elementType]) {
      goto LABEL_38;
    }
    if ([(BMFrontBoardDisplayElement *)self hasLayoutRole]
      || [v5 hasLayoutRole])
    {
      if (![(BMFrontBoardDisplayElement *)self hasLayoutRole]) {
        goto LABEL_38;
      }
      if (![v5 hasLayoutRole]) {
        goto LABEL_38;
      }
      int64_t v26 = [(BMFrontBoardDisplayElement *)self layoutRole];
      if (v26 != [v5 layoutRole]) {
        goto LABEL_38;
      }
    }
    if (-[BMFrontBoardDisplayElement hasLevel](self, "hasLevel") || [v5 hasLevel])
    {
      if (![(BMFrontBoardDisplayElement *)self hasLevel]) {
        goto LABEL_38;
      }
      if (![v5 hasLevel]) {
        goto LABEL_38;
      }
      int64_t v27 = [(BMFrontBoardDisplayElement *)self level];
      if (v27 != [v5 level]) {
        goto LABEL_38;
      }
    }
    if ([(BMFrontBoardDisplayElement *)self hasHasKeyboardFocus]
      || [v5 hasHasKeyboardFocus])
    {
      if (![(BMFrontBoardDisplayElement *)self hasHasKeyboardFocus]) {
        goto LABEL_38;
      }
      if (![v5 hasHasKeyboardFocus]) {
        goto LABEL_38;
      }
      int v28 = [(BMFrontBoardDisplayElement *)self hasKeyboardFocus];
      if (v28 != [v5 hasKeyboardFocus]) {
        goto LABEL_38;
      }
    }
    if ([(BMFrontBoardDisplayElement *)self hasIsUIApplicationElement]
      || [v5 hasIsUIApplicationElement])
    {
      if (![(BMFrontBoardDisplayElement *)self hasIsUIApplicationElement]) {
        goto LABEL_38;
      }
      if (![v5 hasIsUIApplicationElement]) {
        goto LABEL_38;
      }
      int v29 = [(BMFrontBoardDisplayElement *)self isUIApplicationElement];
      if (v29 != [v5 isUIApplicationElement]) {
        goto LABEL_38;
      }
    }
    id v30 = [(BMFrontBoardDisplayElement *)self display];
    uint64_t v31 = [v5 display];
    if (v30 == (void *)v31)
    {
    }
    else
    {
      v32 = (void *)v31;
      v33 = [(BMFrontBoardDisplayElement *)self display];
      v34 = [v5 display];
      int v35 = [v33 isEqual:v34];

      if (!v35)
      {
LABEL_38:
        BOOL v12 = 0;
LABEL_39:

        goto LABEL_40;
      }
    }
    int v37 = [(BMFrontBoardDisplayElement *)self changeType];
    BOOL v12 = v37 == [v5 changeType];
    goto LABEL_39;
  }
  BOOL v12 = 0;
LABEL_40:

  return v12;
}

- (NSDate)absoluteTimestamp
{
  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_absoluteTimestamp];
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
  v41[10] = *MEMORY[0x1E4F143B8];
  v3 = [(BMFrontBoardDisplayElement *)self absoluteTimestamp];
  if (v3)
  {
    id v4 = NSNumber;
    id v5 = [(BMFrontBoardDisplayElement *)self absoluteTimestamp];
    [v5 timeIntervalSince1970];
    uint64_t v6 = objc_msgSend(v4, "numberWithDouble:");
  }
  else
  {
    uint64_t v6 = 0;
  }

  uint64_t v7 = [(BMFrontBoardDisplayElement *)self identifier];
  uint64_t v8 = [(BMFrontBoardDisplayElement *)self bundleIdentifier];
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInt:", -[BMFrontBoardDisplayElement elementType](self, "elementType"));
  if ([(BMFrontBoardDisplayElement *)self hasLayoutRole])
  {
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMFrontBoardDisplayElement layoutRole](self, "layoutRole"));
  }
  else
  {
    uint64_t v10 = 0;
  }
  if ([(BMFrontBoardDisplayElement *)self hasLevel])
  {
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMFrontBoardDisplayElement level](self, "level"));
  }
  else
  {
    uint64_t v11 = 0;
  }
  if ([(BMFrontBoardDisplayElement *)self hasHasKeyboardFocus])
  {
    v39 = objc_msgSend(NSNumber, "numberWithBool:", -[BMFrontBoardDisplayElement hasKeyboardFocus](self, "hasKeyboardFocus"));
  }
  else
  {
    v39 = 0;
  }
  if ([(BMFrontBoardDisplayElement *)self hasIsUIApplicationElement])
  {
    v38 = objc_msgSend(NSNumber, "numberWithBool:", -[BMFrontBoardDisplayElement isUIApplicationElement](self, "isUIApplicationElement"));
  }
  else
  {
    v38 = 0;
  }
  BOOL v12 = [(BMFrontBoardDisplayElement *)self display];
  v13 = [v12 jsonDictionary];

  uint64_t v14 = objc_msgSend(NSNumber, "numberWithInt:", -[BMFrontBoardDisplayElement changeType](self, "changeType"));
  v40[0] = @"absoluteTimestamp";
  uint64_t v15 = v6;
  if (!v6)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v33 = (void *)v15;
  v41[0] = v15;
  v40[1] = @"identifier";
  uint64_t v16 = v7;
  if (!v7)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v32 = (void *)v16;
  v41[1] = v16;
  v40[2] = @"bundleIdentifier";
  uint64_t v17 = v8;
  if (!v8)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v31 = (void *)v17;
  v41[2] = v17;
  v40[3] = @"elementType";
  uint64_t v18 = v9;
  if (!v9)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  int v37 = (void *)v6;
  id v30 = (void *)v18;
  v41[3] = v18;
  v40[4] = @"layoutRole";
  uint64_t v19 = v10;
  if (!v10)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v36 = (void *)v7;
  int v29 = (void *)v19;
  v41[4] = v19;
  v40[5] = @"level";
  uint64_t v20 = (void *)v11;
  if (!v11)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  int v35 = (void *)v8;
  v41[5] = v20;
  v40[6] = @"hasKeyboardFocus";
  id v21 = v39;
  if (!v39)
  {
    id v21 = [MEMORY[0x1E4F1CA98] null];
  }
  id v22 = (void *)v11;
  v23 = (void *)v9;
  v41[6] = v21;
  v40[7] = @"isUIApplicationElement";
  int v24 = v38;
  if (!v38)
  {
    int v24 = [MEMORY[0x1E4F1CA98] null];
  }
  int v25 = (void *)v10;
  v41[7] = v24;
  v40[8] = @"display";
  int64_t v26 = v13;
  if (!v13)
  {
    int64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v41[8] = v26;
  v40[9] = @"changeType";
  int64_t v27 = v14;
  if (!v14)
  {
    int64_t v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v41[9] = v27;
  id v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:10];
  if (v14)
  {
    if (v13) {
      goto LABEL_38;
    }
  }
  else
  {

    if (v13) {
      goto LABEL_38;
    }
  }

LABEL_38:
  if (!v38) {

  }
  if (!v39) {
  if (!v22)
  }

  if (!v25) {
  if (v23)
  }
  {
    if (v35) {
      goto LABEL_48;
    }
  }
  else
  {

    if (v35)
    {
LABEL_48:
      if (v36) {
        goto LABEL_49;
      }
LABEL_57:

      if (v37) {
        goto LABEL_50;
      }
      goto LABEL_58;
    }
  }

  if (!v36) {
    goto LABEL_57;
  }
LABEL_49:
  if (v37) {
    goto LABEL_50;
  }
LABEL_58:

LABEL_50:

  return v34;
}

- (BMFrontBoardDisplayElement)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v124[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"absoluteTimestamp"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v7 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = (objc_class *)MEMORY[0x1E4F1C9C8];
    id v9 = v6;
    id v10 = [v8 alloc];
    [v9 doubleValue];
    double v12 = v11;

    id v13 = (id)[v10 initWithTimeIntervalSince1970:v12];
LABEL_6:
    uint64_t v7 = v13;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        uint64_t v7 = 0;
        int v28 = 0;
        v33 = self;
        goto LABEL_99;
      }
      id v74 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v75 = *MEMORY[0x1E4F502C8];
      uint64_t v123 = *MEMORY[0x1E4F28568];
      uint64_t v76 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"absoluteTimestamp"];
      v124[0] = v76;
      uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v124 forKeys:&v123 count:1];
      uint64_t v77 = v75;
      id v16 = (id)v76;
      uint64_t v7 = 0;
      int v28 = 0;
      *a4 = (id)[v74 initWithDomain:v77 code:2 userInfo:v15];
      goto LABEL_84;
    }
    id v13 = v6;
    goto LABEL_6;
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  uint64_t v7 = [v14 dateFromString:v6];

LABEL_9:
  uint64_t v15 = [v5 objectForKeyedSubscript:@"identifier"];
  if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v16 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v15;
LABEL_12:
    uint64_t v17 = [v5 objectForKeyedSubscript:@"bundleIdentifier"];
    if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v99 = 0;
LABEL_15:
      uint64_t v18 = [v5 objectForKeyedSubscript:@"elementType"];
      v96 = v15;
      v100 = v6;
      if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v19 = v7;
          id v21 = v18;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              v101 = 0;
              int v28 = 0;
              int v24 = v99;
              v33 = self;
              goto LABEL_96;
            }
            id v102 = objc_alloc(MEMORY[0x1E4F28C58]);
            id v68 = v16;
            uint64_t v69 = *MEMORY[0x1E4F502C8];
            uint64_t v117 = *MEMORY[0x1E4F28568];
            id v98 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"elementType"];
            id v118 = v98;
            uint64_t v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v118 forKeys:&v117 count:1];
            uint64_t v71 = v69;
            id v16 = v68;
            v94 = (void *)v70;
            id v72 = (id)objc_msgSend(v102, "initWithDomain:code:userInfo:", v71, 2);
            v101 = 0;
            int v28 = 0;
            *a4 = v72;
            int v24 = v99;
            v33 = self;
            goto LABEL_95;
          }
          uint64_t v19 = v7;
          id v21 = [NSNumber numberWithInt:BMFrontBoardDisplayElementTypeFromString(v18)];
        }
        v101 = v21;
        uint64_t v20 = a4;
      }
      else
      {
        uint64_t v19 = v7;
        uint64_t v20 = a4;
        v101 = 0;
      }
      uint64_t v34 = [v5 objectForKeyedSubscript:@"layoutRole"];
      id v97 = v16;
      v94 = (void *)v34;
      if (v34 && (int v35 = (void *)v34, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v20)
          {
            id v98 = 0;
            int v28 = 0;
            v33 = self;
            uint64_t v7 = v19;
            int v24 = v99;
            uint64_t v6 = v100;
            goto LABEL_95;
          }
          v47 = v20;
          v48 = v17;
          id v49 = objc_alloc(MEMORY[0x1E4F28C58]);
          v50 = v18;
          uint64_t v51 = *MEMORY[0x1E4F502C8];
          uint64_t v115 = *MEMORY[0x1E4F28568];
          id v95 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"layoutRole"];
          id v116 = v95;
          v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v116 forKeys:&v115 count:1];
          v52 = v49;
          uint64_t v17 = v48;
          uint64_t v53 = v51;
          uint64_t v18 = v50;
          uint64_t v15 = v96;
          id v98 = 0;
          int v28 = 0;
          id *v47 = (id)[v52 initWithDomain:v53 code:2 userInfo:v36];
          v33 = self;
          uint64_t v7 = v19;
          int v24 = v99;
          uint64_t v6 = v100;
LABEL_94:

          id v16 = v97;
LABEL_95:

          goto LABEL_96;
        }
        id v98 = v35;
      }
      else
      {
        id v98 = 0;
      }
      v36 = [v5 objectForKeyedSubscript:@"level"];
      v93 = v19;
      if (v36)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v95 = 0;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v7 = v19;
            uint64_t v6 = v100;
            if (!v20)
            {
              id v95 = 0;
              int v28 = 0;
              int v24 = v99;
              v33 = self;
              goto LABEL_94;
            }
            v54 = v17;
            id v55 = objc_alloc(MEMORY[0x1E4F28C58]);
            v56 = v18;
            uint64_t v57 = *MEMORY[0x1E4F502C8];
            uint64_t v113 = *MEMORY[0x1E4F28568];
            id v92 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"level"];
            id v114 = v92;
            int v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v114 forKeys:&v113 count:1];
            v58 = v55;
            uint64_t v17 = v54;
            uint64_t v59 = v57;
            uint64_t v18 = v56;
            uint64_t v15 = v96;
            id v95 = 0;
            int v28 = 0;
            *uint64_t v20 = (id)[v58 initWithDomain:v59 code:2 userInfo:v37];
            goto LABEL_103;
          }
          id v95 = v36;
        }
      }
      else
      {
        id v95 = 0;
      }
      uint64_t v6 = v100;
      int v37 = [v5 objectForKeyedSubscript:@"hasKeyboardFocus"];
      v91 = v18;
      if (!v37 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v92 = 0;
        goto LABEL_45;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v92 = v37;
LABEL_45:
        v38 = [v5 objectForKeyedSubscript:@"isUIApplicationElement"];
        v87 = v17;
        if (!v38 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v89 = v20;
          id v39 = 0;
          goto LABEL_48;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v89 = v20;
          id v39 = v38;
LABEL_48:
          v40 = [v5 objectForKeyedSubscript:@"display"];
          if (!v40 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v41 = 0;
            goto LABEL_51;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v44 = v40;
            id v104 = 0;
            v41 = [[BMFrontBoardDisplayElementDisplay alloc] initWithJSONDictionary:v44 error:&v104];
            id v45 = v104;
            if (v45)
            {
              v46 = v45;
              if (v89) {
                id *v89 = v45;
              }

              int v28 = 0;
              v40 = v44;
              goto LABEL_90;
            }

LABEL_51:
            v42 = [v5 objectForKeyedSubscript:@"changeType"];
            if (v42 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v60 = v42;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (v89)
                  {
                    id v86 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v84 = *MEMORY[0x1E4F502C8];
                    uint64_t v105 = *MEMORY[0x1E4F28568];
                    v80 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"changeType"];
                    v106 = v80;
                    v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v106 forKeys:&v105 count:1];
                    id *v89 = (id)[v86 initWithDomain:v84 code:2 userInfo:v81];
                  }
                  v43 = 0;
                  int v28 = 0;
                  goto LABEL_89;
                }
                id v60 = [NSNumber numberWithInt:BMFrontBoardDisplayElementChangeTypeFromString(v42)];
              }
              v43 = v60;
            }
            else
            {
              v43 = 0;
            }
            uint64_t v78 = [v101 intValue];
            LODWORD(v82) = [v43 intValue];
            int v28 = [(BMFrontBoardDisplayElement *)self initWithAbsoluteTimestamp:v93 identifier:v97 bundleIdentifier:v99 elementType:v78 layoutRole:v98 level:v95 hasKeyboardFocus:v92 isUIApplicationElement:v39 display:v41 changeType:v82];
            self = v28;
LABEL_89:

            goto LABEL_90;
          }
          if (!v89)
          {
            int v28 = 0;
            uint64_t v6 = v100;
            goto LABEL_91;
          }
          id v85 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v83 = *MEMORY[0x1E4F502C8];
          uint64_t v107 = *MEMORY[0x1E4F28568];
          v41 = (BMFrontBoardDisplayElementDisplay *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"display"];
          v108 = v41;
          v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v108 forKeys:&v107 count:1];
          id *v89 = (id)[v85 initWithDomain:v83 code:2 userInfo:v73];

          int v28 = 0;
LABEL_90:

          uint64_t v6 = v100;
          uint64_t v17 = v87;
LABEL_91:
          int v24 = v99;

LABEL_92:
          v33 = self;

          uint64_t v18 = v91;
          uint64_t v15 = v96;
LABEL_93:

          uint64_t v7 = v93;
          goto LABEL_94;
        }
        if (v20)
        {
          id v65 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v66 = *MEMORY[0x1E4F502C8];
          uint64_t v109 = *MEMORY[0x1E4F28568];
          v40 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isUIApplicationElement"];
          v110 = v40;
          v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v110 forKeys:&v109 count:1];
          id v67 = (id)[v65 initWithDomain:v66 code:2 userInfo:v41];
          id v39 = 0;
          int v28 = 0;
          *uint64_t v20 = v67;
          goto LABEL_90;
        }
        id v39 = 0;
        int v28 = 0;
LABEL_105:
        int v24 = v99;
        goto LABEL_92;
      }
      if (v20)
      {
        v90 = v20;
        v61 = v17;
        id v62 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v63 = *MEMORY[0x1E4F502C8];
        uint64_t v111 = *MEMORY[0x1E4F28568];
        id v39 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"hasKeyboardFocus"];
        id v112 = v39;
        v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v112 forKeys:&v111 count:1];
        v64 = v62;
        uint64_t v17 = v61;
        id v92 = 0;
        int v28 = 0;
        id *v90 = (id)[v64 initWithDomain:v63 code:2 userInfo:v38];
        goto LABEL_105;
      }
      id v92 = 0;
      int v28 = 0;
LABEL_103:
      int v24 = v99;
      v33 = self;
      goto LABEL_93;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v99 = v17;
      goto LABEL_15;
    }
    if (a4)
    {
      v88 = a4;
      id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v30 = v16;
      uint64_t v31 = *MEMORY[0x1E4F502C8];
      uint64_t v119 = *MEMORY[0x1E4F28568];
      v101 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bundleIdentifier"];
      v120 = v101;
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v120 forKeys:&v119 count:1];
      uint64_t v32 = v31;
      id v16 = v30;
      int v24 = 0;
      int v28 = 0;
      id *v88 = (id)[v29 initWithDomain:v32 code:2 userInfo:v18];
      v33 = self;
LABEL_96:

      goto LABEL_97;
    }
    int v24 = 0;
    int v28 = 0;
LABEL_81:
    v33 = self;
LABEL_97:

    goto LABEL_98;
  }
  if (a4)
  {
    id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v23 = *MEMORY[0x1E4F502C8];
    uint64_t v121 = *MEMORY[0x1E4F28568];
    int v24 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"identifier"];
    v122 = v24;
    uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v122 forKeys:&v121 count:1];
    int64_t v26 = v22;
    uint64_t v17 = (void *)v25;
    id v27 = (id)[v26 initWithDomain:v23 code:2 userInfo:v25];
    id v16 = 0;
    int v28 = 0;
    *a4 = v27;
    goto LABEL_81;
  }
  id v16 = 0;
  int v28 = 0;
LABEL_84:
  v33 = self;
LABEL_98:

LABEL_99:
  return v28;
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v74.receiver = self;
  v74.super_class = (Class)BMFrontBoardDisplayElement;
  id v5 = [(BMEventBase *)&v74 init];
  if (!v5) {
    goto LABEL_109;
  }
  uint64_t v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v9 = (int *)MEMORY[0x1E4F940B8];
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
          v5->_hasRaw_absoluteTimestamp = 1;
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
          v5->_raw_absoluteTimestamp = v22;
          continue;
        case 2u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 56;
          goto LABEL_27;
        case 3u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 64;
LABEL_27:
          uint64_t v25 = *(Class *)((char *)&v5->super.super.isa + v24);
          *(Class *)((char *)&v5->super.super.isa + v24) = (Class)v23;

          continue;
        case 4u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          while (2)
          {
            uint64_t v29 = *v6;
            uint64_t v30 = *(void *)&v4[v29];
            unint64_t v31 = v30 + 1;
            if (v30 == -1 || v31 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v32 = *(unsigned char *)(*(void *)&v4[*v9] + v30);
              *(void *)&v4[v29] = v31;
              v28 |= (unint64_t)(v32 & 0x7F) << v26;
              if (v32 < 0)
              {
                v26 += 7;
                BOOL v17 = v27++ >= 9;
                if (v17)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_76;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v28) = 0;
          }
LABEL_76:
          if (v28 >= 5) {
            LODWORD(v28) = 0;
          }
          uint64_t v68 = 44;
          goto LABEL_103;
        case 5u:
          char v33 = 0;
          unsigned int v34 = 0;
          int v35 = 0;
          v5->_hasLayoutRole = 1;
          while (2)
          {
            uint64_t v36 = *v6;
            uint64_t v37 = *(void *)&v4[v36];
            unint64_t v38 = v37 + 1;
            if (v37 == -1 || v38 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v39 = *(unsigned char *)(*(void *)&v4[*v9] + v37);
              *(void *)&v4[v36] = v38;
              int v35 = (objc_class *)(((unint64_t)(v39 & 0x7F) << v33) | (unint64_t)v35);
              if (v39 < 0)
              {
                v33 += 7;
                BOOL v17 = v34++ >= 9;
                if (v17)
                {
                  int v35 = 0;
                  goto LABEL_82;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            int v35 = 0;
          }
LABEL_82:
          uint64_t v69 = 72;
          goto LABEL_87;
        case 6u:
          char v40 = 0;
          unsigned int v41 = 0;
          int v35 = 0;
          v5->_hasLevel = 1;
          while (2)
          {
            uint64_t v42 = *v6;
            uint64_t v43 = *(void *)&v4[v42];
            unint64_t v44 = v43 + 1;
            if (v43 == -1 || v44 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v45 = *(unsigned char *)(*(void *)&v4[*v9] + v43);
              *(void *)&v4[v42] = v44;
              int v35 = (objc_class *)(((unint64_t)(v45 & 0x7F) << v40) | (unint64_t)v35);
              if (v45 < 0)
              {
                v40 += 7;
                BOOL v17 = v41++ >= 9;
                if (v17)
                {
                  int v35 = 0;
                  goto LABEL_86;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            int v35 = 0;
          }
LABEL_86:
          uint64_t v69 = 80;
LABEL_87:
          *(Class *)((char *)&v5->super.super.isa + v69) = v35;
          continue;
        case 7u:
          char v46 = 0;
          unsigned int v47 = 0;
          uint64_t v48 = 0;
          v5->_hasHasKeyboardFocus = 1;
          while (2)
          {
            uint64_t v49 = *v6;
            uint64_t v50 = *(void *)&v4[v49];
            unint64_t v51 = v50 + 1;
            if (v50 == -1 || v51 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v52 = *(unsigned char *)(*(void *)&v4[*v9] + v50);
              *(void *)&v4[v49] = v51;
              v48 |= (unint64_t)(v52 & 0x7F) << v46;
              if (v52 < 0)
              {
                v46 += 7;
                BOOL v17 = v47++ >= 9;
                if (v17)
                {
                  uint64_t v48 = 0;
                  goto LABEL_91;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v48 = 0;
          }
LABEL_91:
          BOOL v70 = v48 != 0;
          uint64_t v71 = 34;
          goto LABEL_96;
        case 8u:
          char v53 = 0;
          unsigned int v54 = 0;
          uint64_t v55 = 0;
          v5->_hasIsUIApplicationElement = 1;
          while (2)
          {
            uint64_t v56 = *v6;
            uint64_t v57 = *(void *)&v4[v56];
            unint64_t v58 = v57 + 1;
            if (v57 == -1 || v58 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v59 = *(unsigned char *)(*(void *)&v4[*v9] + v57);
              *(void *)&v4[v56] = v58;
              v55 |= (unint64_t)(v59 & 0x7F) << v53;
              if (v59 < 0)
              {
                v53 += 7;
                BOOL v17 = v54++ >= 9;
                if (v17)
                {
                  uint64_t v55 = 0;
                  goto LABEL_95;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v55 = 0;
          }
LABEL_95:
          BOOL v70 = v55 != 0;
          uint64_t v71 = 36;
LABEL_96:
          *((unsigned char *)&v5->super.super.isa + v71) = v70;
          continue;
        case 9u:
          uint64_t v75 = 0;
          uint64_t v76 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_108;
          }
          id v60 = [[BMFrontBoardDisplayElementDisplay alloc] initByReadFrom:v4];
          if (!v60) {
            goto LABEL_108;
          }
          display = v5->_display;
          v5->_display = v60;

          PBReaderRecallMark();
          continue;
        case 0xAu:
          char v62 = 0;
          unsigned int v63 = 0;
          uint64_t v28 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_108;
          }
          continue;
      }
      while (1)
      {
        uint64_t v64 = *v6;
        uint64_t v65 = *(void *)&v4[v64];
        unint64_t v66 = v65 + 1;
        if (v65 == -1 || v66 > *(void *)&v4[*v7]) {
          break;
        }
        char v67 = *(unsigned char *)(*(void *)&v4[*v9] + v65);
        *(void *)&v4[v64] = v66;
        v28 |= (unint64_t)(v67 & 0x7F) << v62;
        if ((v67 & 0x80) == 0) {
          goto LABEL_98;
        }
        v62 += 7;
        BOOL v17 = v63++ >= 9;
        if (v17)
        {
          LODWORD(v28) = 0;
          goto LABEL_100;
        }
      }
      v4[*v8] = 1;
LABEL_98:
      if (v4[*v8]) {
        LODWORD(v28) = 0;
      }
LABEL_100:
      if (v28 >= 4) {
        LODWORD(v28) = 0;
      }
      uint64_t v68 = 48;
LABEL_103:
      *(_DWORD *)((char *)&v5->super.super.isa + v68) = v28;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_108:
  }
    id v72 = 0;
  else {
LABEL_109:
  }
    id v72 = v5;

  return v72;
}

- (NSString)description
{
  id v14 = [NSString alloc];
  uint64_t v13 = [(BMFrontBoardDisplayElement *)self absoluteTimestamp];
  v3 = [(BMFrontBoardDisplayElement *)self identifier];
  id v4 = [(BMFrontBoardDisplayElement *)self bundleIdentifier];
  id v5 = BMFrontBoardDisplayElementTypeAsString([(BMFrontBoardDisplayElement *)self elementType]);
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMFrontBoardDisplayElement layoutRole](self, "layoutRole"));
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMFrontBoardDisplayElement level](self, "level"));
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMFrontBoardDisplayElement hasKeyboardFocus](self, "hasKeyboardFocus"));
  id v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BMFrontBoardDisplayElement isUIApplicationElement](self, "isUIApplicationElement"));
  char v10 = [(BMFrontBoardDisplayElement *)self display];
  unsigned int v11 = BMFrontBoardDisplayElementChangeTypeAsString([(BMFrontBoardDisplayElement *)self changeType]);
  id v15 = (id)[v14 initWithFormat:@"BMFrontBoardDisplayElement with absoluteTimestamp: %@, identifier: %@, bundleIdentifier: %@, elementType: %@, layoutRole: %@, level: %@, hasKeyboardFocus: %@, isUIApplicationElement: %@, display: %@, changeType: %@", v13, v3, v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v15;
}

+ (id)protoFields
{
  v14[10] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"absoluteTimestamp" number:1 type:0 subMessageClass:0];
  v14[0] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"identifier" number:2 type:13 subMessageClass:0];
  v14[1] = v2;
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleIdentifier" number:3 type:13 subMessageClass:0];
  v14[2] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"elementType" number:4 type:4 subMessageClass:0];
  v14[3] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"layoutRole" number:5 type:3 subMessageClass:0];
  v14[4] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"level" number:6 type:3 subMessageClass:0];
  v14[5] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"hasKeyboardFocus" number:7 type:12 subMessageClass:0];
  v14[6] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isUIApplicationElement" number:8 type:12 subMessageClass:0];
  v14[7] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"display" number:9 type:14 subMessageClass:objc_opt_class()];
  v14[8] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"changeType" number:10 type:4 subMessageClass:0];
  v14[9] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:10];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5F10;
}

+ (id)columns
{
  v14[10] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:1 protoDataType:0 convertedType:2];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"identifier" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleIdentifier" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"elementType" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"layoutRole" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:3 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"level" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:3 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"hasKeyboardFocus" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:12 convertedType:0];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isUIApplicationElement" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:12 convertedType:0];
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"display_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_268];
  unsigned int v11 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"changeType" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:4 convertedType:0];
  v14[0] = v2;
  v14[1] = v3;
  v14[2] = v4;
  v14[3] = v5;
  v14[4] = v6;
  v14[5] = v7;
  v14[6] = v8;
  v14[7] = v9;
  v14[8] = v10;
  v14[9] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:10];

  return v13;
}

id __37__BMFrontBoardDisplayElement_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  v3 = [v2 display];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
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

    uint64_t v8 = [[BMFrontBoardDisplayElement alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[10] = 0;
    }
  }

  return v4;
}

@end