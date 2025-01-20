@interface BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus)initWithNumberOfDevices:(id)a3 numberOfRooms:(id)a4 numberOfHomes:(id)a5 hasLights:(id)a6 hasSecuritySystem:(id)a7 hasTemperatureControl:(id)a8;
- (BOOL)hasHasLights;
- (BOOL)hasHasSecuritySystem;
- (BOOL)hasHasTemperatureControl;
- (BOOL)hasLights;
- (BOOL)hasNumberOfDevices;
- (BOOL)hasNumberOfHomes;
- (BOOL)hasNumberOfRooms;
- (BOOL)hasSecuritySystem;
- (BOOL)hasTemperatureControl;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)numberOfDevices;
- (int)numberOfHomes;
- (int)numberOfRooms;
- (unsigned)dataVersion;
- (void)setHasHasLights:(BOOL)a3;
- (void)setHasHasSecuritySystem:(BOOL)a3;
- (void)setHasHasTemperatureControl:(BOOL)a3;
- (void)setHasNumberOfDevices:(BOOL)a3;
- (void)setHasNumberOfHomes:(BOOL)a3;
- (void)setHasNumberOfRooms:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus

- (void)setHasHasTemperatureControl:(BOOL)a3
{
  self->_hasHasTemperatureControl = a3;
}

- (BOOL)hasHasTemperatureControl
{
  return self->_hasHasTemperatureControl;
}

- (BOOL)hasTemperatureControl
{
  return self->_hasTemperatureControl;
}

- (void)setHasHasSecuritySystem:(BOOL)a3
{
  self->_hasHasSecuritySystem = a3;
}

- (BOOL)hasHasSecuritySystem
{
  return self->_hasHasSecuritySystem;
}

- (BOOL)hasSecuritySystem
{
  return self->_hasSecuritySystem;
}

- (void)setHasHasLights:(BOOL)a3
{
  self->_hasHasLights = a3;
}

- (BOOL)hasHasLights
{
  return self->_hasHasLights;
}

- (BOOL)hasLights
{
  return self->_hasLights;
}

- (void)setHasNumberOfHomes:(BOOL)a3
{
  self->_hasNumberOfHomes = a3;
}

- (BOOL)hasNumberOfHomes
{
  return self->_hasNumberOfHomes;
}

- (int)numberOfHomes
{
  return self->_numberOfHomes;
}

- (void)setHasNumberOfRooms:(BOOL)a3
{
  self->_hasNumberOfRooms = a3;
}

- (BOOL)hasNumberOfRooms
{
  return self->_hasNumberOfRooms;
}

- (int)numberOfRooms
{
  return self->_numberOfRooms;
}

- (void)setHasNumberOfDevices:(BOOL)a3
{
  self->_hasNumberOfDevices = a3;
}

- (BOOL)hasNumberOfDevices
{
  return self->_hasNumberOfDevices;
}

- (int)numberOfDevices
{
  return self->_numberOfDevices;
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
    if (-[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasNumberOfDevices](self, "hasNumberOfDevices")|| [v5 hasNumberOfDevices])
    {
      if (![(BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus *)self hasNumberOfDevices])goto LABEL_33; {
      if (![v5 hasNumberOfDevices])
      }
        goto LABEL_33;
      int v6 = [(BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus *)self numberOfDevices];
      if (v6 != [v5 numberOfDevices]) {
        goto LABEL_33;
      }
    }
    if (-[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasNumberOfRooms](self, "hasNumberOfRooms")|| [v5 hasNumberOfRooms])
    {
      if (![(BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus *)self hasNumberOfRooms])goto LABEL_33; {
      if (![v5 hasNumberOfRooms])
      }
        goto LABEL_33;
      int v7 = [(BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus *)self numberOfRooms];
      if (v7 != [v5 numberOfRooms]) {
        goto LABEL_33;
      }
    }
    if (-[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasNumberOfHomes](self, "hasNumberOfHomes")|| [v5 hasNumberOfHomes])
    {
      if (![(BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus *)self hasNumberOfHomes])goto LABEL_33; {
      if (![v5 hasNumberOfHomes])
      }
        goto LABEL_33;
      int v8 = [(BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus *)self numberOfHomes];
      if (v8 != [v5 numberOfHomes]) {
        goto LABEL_33;
      }
    }
    if ([(BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus *)self hasHasLights]
      || [v5 hasHasLights])
    {
      if (![(BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus *)self hasHasLights]) {
        goto LABEL_33;
      }
      if (![v5 hasHasLights]) {
        goto LABEL_33;
      }
      int v9 = [(BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus *)self hasLights];
      if (v9 != [v5 hasLights]) {
        goto LABEL_33;
      }
    }
    if (-[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasHasSecuritySystem](self, "hasHasSecuritySystem")|| [v5 hasHasSecuritySystem])
    {
      if (![(BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus *)self hasHasSecuritySystem])goto LABEL_33; {
      if (![v5 hasHasSecuritySystem])
      }
        goto LABEL_33;
      int v10 = [(BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus *)self hasSecuritySystem];
      if (v10 != [v5 hasSecuritySystem]) {
        goto LABEL_33;
      }
    }
    if (!-[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasHasTemperatureControl](self, "hasHasTemperatureControl")&& ![v5 hasHasTemperatureControl])
    {
      LOBYTE(v12) = 1;
      goto LABEL_34;
    }
    if (-[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasHasTemperatureControl](self, "hasHasTemperatureControl")&& [v5 hasHasTemperatureControl])
    {
      BOOL v11 = [(BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus *)self hasTemperatureControl];
      int v12 = v11 ^ [v5 hasTemperatureControl] ^ 1;
    }
    else
    {
LABEL_33:
      LOBYTE(v12) = 0;
    }
LABEL_34:

    goto LABEL_35;
  }
  LOBYTE(v12) = 0;
LABEL_35:

  return v12;
}

- (id)jsonDictionary
{
  v22[6] = *MEMORY[0x1E4F143B8];
  if ([(BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus *)self hasNumberOfDevices])
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus numberOfDevices](self, "numberOfDevices"));
  }
  else
  {
    uint64_t v3 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus *)self hasNumberOfRooms])
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus numberOfRooms](self, "numberOfRooms"));
  }
  else
  {
    uint64_t v4 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus *)self hasNumberOfHomes])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus numberOfHomes](self, "numberOfHomes"));
  }
  else
  {
    id v5 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus *)self hasHasLights])
  {
    int v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasLights](self, "hasLights"));
  }
  else
  {
    int v6 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus *)self hasHasSecuritySystem])
  {
    int v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasSecuritySystem](self, "hasSecuritySystem"));
  }
  else
  {
    int v7 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus *)self hasHasTemperatureControl])
  {
    int v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasTemperatureControl](self, "hasTemperatureControl"));
  }
  else
  {
    int v8 = 0;
  }
  v21[0] = @"numberOfDevices";
  uint64_t v9 = v3;
  if (!v3)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v17 = v9;
  v19 = (void *)v4;
  v22[0] = v9;
  v21[1] = @"numberOfRooms";
  int v10 = (void *)v4;
  if (!v4)
  {
    int v10 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v9);
  }
  v22[1] = v10;
  v21[2] = @"numberOfHomes";
  BOOL v11 = v5;
  if (!v5)
  {
    BOOL v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = (void *)v3;
  v22[2] = v11;
  v21[3] = @"hasLights";
  int v12 = v6;
  if (!v6)
  {
    int v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[3] = v12;
  v21[4] = @"hasSecuritySystem";
  v13 = v7;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[4] = v13;
  v21[5] = @"hasTemperatureControl";
  v14 = v8;
  if (!v8)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[5] = v14;
  v15 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, v21, 6, v17);
  if (v8)
  {
    if (v7) {
      goto LABEL_33;
    }
LABEL_42:

    if (v6) {
      goto LABEL_34;
    }
    goto LABEL_43;
  }

  if (!v7) {
    goto LABEL_42;
  }
LABEL_33:
  if (v6) {
    goto LABEL_34;
  }
LABEL_43:

LABEL_34:
  if (!v5) {

  }
  if (v19)
  {
    if (v20) {
      goto LABEL_38;
    }
  }
  else
  {

    if (v20) {
      goto LABEL_38;
    }
  }

LABEL_38:

  return v15;
}

- (BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v72[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 objectForKeyedSubscript:@"numberOfDevices"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    uint64_t v9 = [v6 objectForKeyedSubscript:@"numberOfRooms"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v21 = 0;
          uint64_t v17 = 0;
          goto LABEL_50;
        }
        id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
        v52 = a4;
        uint64_t v23 = *MEMORY[0x1E4F502C8];
        uint64_t v69 = *MEMORY[0x1E4F28568];
        v24 = v7;
        id v25 = v8;
        id v26 = [NSString alloc];
        uint64_t v49 = objc_opt_class();
        v27 = v26;
        id v8 = v25;
        int v7 = v24;
        v28 = (id *)[v27 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v49, @"numberOfRooms"];
        v70 = v28;
        int v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
        uint64_t v29 = v23;
        a4 = v28;
        uint64_t v17 = 0;
        v21 = 0;
        id *v52 = (id)[v22 initWithDomain:v29 code:2 userInfo:v10];
        goto LABEL_49;
      }
      id v59 = v9;
    }
    else
    {
      id v59 = 0;
    }
    int v10 = [v6 objectForKeyedSubscript:@"numberOfHomes"];
    v60 = self;
    v57 = v9;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          uint64_t v17 = 0;
          v21 = v59;
          goto LABEL_49;
        }
        id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
        v31 = a4;
        uint64_t v32 = *MEMORY[0x1E4F502C8];
        uint64_t v67 = *MEMORY[0x1E4F28568];
        v33 = v7;
        id v34 = v8;
        id v35 = [NSString alloc];
        uint64_t v50 = objc_opt_class();
        v36 = v35;
        id v8 = v34;
        int v7 = v33;
        id v58 = (id)[v36 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v50, @"numberOfHomes"];
        id v68 = v58;
        BOOL v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
        id v37 = (id)[v30 initWithDomain:v32 code:2 userInfo:v11];
        uint64_t v17 = 0;
        a4 = 0;
        id *v31 = v37;
        uint64_t v9 = v57;
        v21 = v59;
LABEL_48:

        self = v60;
LABEL_49:

        goto LABEL_50;
      }
      v56 = v10;
    }
    else
    {
      v56 = 0;
    }
    BOOL v11 = [v6 objectForKeyedSubscript:@"hasLights"];
    v55 = v7;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v58 = 0;
          uint64_t v17 = 0;
          v21 = v59;
          a4 = v56;
          goto LABEL_48;
        }
        id v38 = v8;
        id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v40 = *MEMORY[0x1E4F502C8];
        uint64_t v65 = *MEMORY[0x1E4F28568];
        id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"hasLights"];
        id v66 = v14;
        int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
        v41 = v39;
        id v8 = v38;
        int v7 = v55;
        id v42 = (id)[v41 initWithDomain:v40 code:2 userInfo:v12];
        uint64_t v17 = 0;
        id v58 = 0;
        *a4 = v42;
        goto LABEL_57;
      }
      id v58 = v11;
    }
    else
    {
      id v58 = 0;
    }
    int v12 = [v6 objectForKeyedSubscript:@"hasSecuritySystem"];
    if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v13 = v8;
      id v14 = 0;
      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v8;
      id v14 = v12;
LABEL_16:
      v15 = [v6 objectForKeyedSubscript:@"hasTemperatureControl"];
      if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v16 = 0;
LABEL_19:
        a4 = v56;
        uint64_t v17 = [(BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus *)v60 initWithNumberOfDevices:v13 numberOfRooms:v59 numberOfHomes:v56 hasLights:v58 hasSecuritySystem:v14 hasTemperatureControl:v16];
        v60 = v17;
LABEL_46:

        id v8 = v13;
        int v7 = v55;
LABEL_47:

        v21 = v59;
        uint64_t v9 = v57;
        goto LABEL_48;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v15;
        goto LABEL_19;
      }
      if (a4)
      {
        id v54 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v51 = *MEMORY[0x1E4F502C8];
        uint64_t v61 = *MEMORY[0x1E4F28568];
        v46 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"hasTemperatureControl"];
        v62 = v46;
        v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
        *a4 = (id)[v54 initWithDomain:v51 code:2 userInfo:v47];
      }
      id v16 = 0;
      uint64_t v17 = 0;
LABEL_45:
      a4 = v56;
      goto LABEL_46;
    }
    if (a4)
    {
      id v13 = v8;
      v53 = a4;
      id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v44 = *MEMORY[0x1E4F502C8];
      uint64_t v63 = *MEMORY[0x1E4F28568];
      id v16 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"hasSecuritySystem"];
      id v64 = v16;
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
      id v45 = (id)[v43 initWithDomain:v44 code:2 userInfo:v15];
      uint64_t v17 = 0;
      id v14 = 0;
      id *v53 = v45;
      goto LABEL_45;
    }
    id v14 = 0;
    uint64_t v17 = 0;
LABEL_57:
    a4 = v56;
    goto LABEL_47;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    uint64_t v17 = 0;
    id v8 = 0;
    goto LABEL_51;
  }
  id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
  v19 = a4;
  uint64_t v20 = *MEMORY[0x1E4F502C8];
  uint64_t v71 = *MEMORY[0x1E4F28568];
  v21 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numberOfDevices"];
  v72[0] = v21;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:&v71 count:1];
  uint64_t v17 = 0;
  id v8 = 0;
  id *v19 = (id)[v18 initWithDomain:v20 code:2 userInfo:v9];
LABEL_50:

LABEL_51:
  return v17;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasNumberOfDevices)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasNumberOfRooms)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasNumberOfHomes)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasHasLights)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasHasSecuritySystem)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasHasTemperatureControl)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v65.receiver = self;
  v65.super_class = (Class)BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus;
  id v5 = [(BMEventBase *)&v65 init];
  if (!v5) {
    goto LABEL_93;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  int v7 = (int *)MEMORY[0x1E4F940E0];
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
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          v5->_hasNumberOfDevices = 1;
          while (1)
          {
            uint64_t v23 = *v6;
            uint64_t v24 = *(void *)&v4[v23];
            unint64_t v25 = v24 + 1;
            if (v24 == -1 || v25 > *(void *)&v4[*v7]) {
              break;
            }
            char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v24);
            *(void *)&v4[v23] = v25;
            v22 |= (unint64_t)(v26 & 0x7F) << v20;
            if ((v26 & 0x80) == 0) {
              goto LABEL_65;
            }
            v20 += 7;
            BOOL v17 = v21++ >= 9;
            if (v17)
            {
              LODWORD(v22) = 0;
              goto LABEL_67;
            }
          }
          v4[*v8] = 1;
LABEL_65:
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_67:
          uint64_t v60 = 32;
          goto LABEL_76;
        case 2u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v22 = 0;
          v5->_hasNumberOfRooms = 1;
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
              v22 |= (unint64_t)(v32 & 0x7F) << v27;
              if (v32 < 0)
              {
                v27 += 7;
                BOOL v17 = v28++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_71;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_71:
          uint64_t v60 = 36;
          goto LABEL_76;
        case 3u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v22 = 0;
          v5->_hasNumberOfHomes = 1;
          while (2)
          {
            uint64_t v35 = *v6;
            uint64_t v36 = *(void *)&v4[v35];
            unint64_t v37 = v36 + 1;
            if (v36 == -1 || v37 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v38 = *(unsigned char *)(*(void *)&v4[*v9] + v36);
              *(void *)&v4[v35] = v37;
              v22 |= (unint64_t)(v38 & 0x7F) << v33;
              if (v38 < 0)
              {
                v33 += 7;
                BOOL v17 = v34++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_75;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_75:
          uint64_t v60 = 40;
LABEL_76:
          *(_DWORD *)((char *)&v5->super.super.isa + v60) = v22;
          continue;
        case 4u:
          char v39 = 0;
          unsigned int v40 = 0;
          uint64_t v41 = 0;
          v5->_hasHasLights = 1;
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
              v41 |= (unint64_t)(v45 & 0x7F) << v39;
              if (v45 < 0)
              {
                v39 += 7;
                BOOL v17 = v40++ >= 9;
                if (v17)
                {
                  uint64_t v41 = 0;
                  goto LABEL_80;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v41 = 0;
          }
LABEL_80:
          BOOL v61 = v41 != 0;
          uint64_t v62 = 19;
          goto LABEL_89;
        case 5u:
          char v46 = 0;
          unsigned int v47 = 0;
          uint64_t v48 = 0;
          v5->_hasHasSecuritySystem = 1;
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
                  goto LABEL_84;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v48 = 0;
          }
LABEL_84:
          BOOL v61 = v48 != 0;
          uint64_t v62 = 21;
          goto LABEL_89;
        case 6u:
          char v53 = 0;
          unsigned int v54 = 0;
          uint64_t v55 = 0;
          v5->_hasHasTemperatureControl = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_92;
          }
          continue;
      }
      while (1)
      {
        uint64_t v56 = *v6;
        uint64_t v57 = *(void *)&v4[v56];
        unint64_t v58 = v57 + 1;
        if (v57 == -1 || v58 > *(void *)&v4[*v7]) {
          break;
        }
        char v59 = *(unsigned char *)(*(void *)&v4[*v9] + v57);
        *(void *)&v4[v56] = v58;
        v55 |= (unint64_t)(v59 & 0x7F) << v53;
        if ((v59 & 0x80) == 0) {
          goto LABEL_86;
        }
        v53 += 7;
        BOOL v17 = v54++ >= 9;
        if (v17)
        {
          uint64_t v55 = 0;
          goto LABEL_88;
        }
      }
      v4[*v8] = 1;
LABEL_86:
      if (v4[*v8]) {
        uint64_t v55 = 0;
      }
LABEL_88:
      BOOL v61 = v55 != 0;
      uint64_t v62 = 23;
LABEL_89:
      *((unsigned char *)&v5->super.super.isa + v62) = v61;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_92:
  }
    uint64_t v63 = 0;
  else {
LABEL_93:
  }
    uint64_t v63 = v5;

  return v63;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus numberOfDevices](self, "numberOfDevices"));
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus numberOfRooms](self, "numberOfRooms"));
  id v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus numberOfHomes](self, "numberOfHomes"));
  int v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasLights](self, "hasLights"));
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasSecuritySystem](self, "hasSecuritySystem"));
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasTemperatureControl](self, "hasTemperatureControl"));
  char v10 = (void *)[v3 initWithFormat:@"BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus with numberOfDevices: %@, numberOfRooms: %@, numberOfHomes: %@, hasLights: %@, hasSecuritySystem: %@, hasTemperatureControl: %@", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus)initWithNumberOfDevices:(id)a3 numberOfRooms:(id)a4 numberOfHomes:(id)a5 hasLights:(id)a6 hasSecuritySystem:(id)a7 hasTemperatureControl:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v25.receiver = self;
  v25.super_class = (Class)BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus;
  char v20 = [(BMEventBase *)&v25 init];
  if (v20)
  {
    v20->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v14)
    {
      v20->_hasNumberOfDevices = 1;
      int v21 = [v14 intValue];
    }
    else
    {
      v20->_hasNumberOfDevices = 0;
      int v21 = -1;
    }
    v20->_numberOfDevices = v21;
    if (v15)
    {
      v20->_hasNumberOfRooms = 1;
      int v22 = [v15 intValue];
    }
    else
    {
      v20->_hasNumberOfRooms = 0;
      int v22 = -1;
    }
    v20->_numberOfRooms = v22;
    if (v16)
    {
      v20->_hasNumberOfHomes = 1;
      int v23 = [v16 intValue];
    }
    else
    {
      v20->_hasNumberOfHomes = 0;
      int v23 = -1;
    }
    v20->_numberOfHomes = v23;
    if (v17)
    {
      v20->_hasHasLights = 1;
      v20->_hasLights = [v17 BOOLValue];
    }
    else
    {
      v20->_hasHasLights = 0;
      v20->_hasLights = 0;
    }
    if (v18)
    {
      v20->_hasHasSecuritySystem = 1;
      v20->_hasSecuritySystem = [v18 BOOLValue];
    }
    else
    {
      v20->_hasHasSecuritySystem = 0;
      v20->_hasSecuritySystem = 0;
    }
    if (v19)
    {
      v20->_hasHasTemperatureControl = 1;
      v20->_hasTemperatureControl = [v19 BOOLValue];
    }
    else
    {
      v20->_hasHasTemperatureControl = 0;
      v20->_hasTemperatureControl = 0;
    }
  }

  return v20;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numberOfDevices" number:1 type:2 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numberOfRooms" number:2 type:2 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numberOfHomes" number:3 type:2 subMessageClass:0];
  v10[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"hasLights" number:4 type:12 subMessageClass:0];
  v10[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"hasSecuritySystem" number:5 type:12 subMessageClass:0];
  v10[4] = v6;
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"hasTemperatureControl" number:6 type:12 subMessageClass:0];
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3C18;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numberOfDevices" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:2 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numberOfRooms" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:2 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numberOfHomes" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:2 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"hasLights" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:12 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"hasSecuritySystem" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:12 convertedType:0];
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"hasTemperatureControl" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:12 convertedType:0];
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
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
    int v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[7] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end