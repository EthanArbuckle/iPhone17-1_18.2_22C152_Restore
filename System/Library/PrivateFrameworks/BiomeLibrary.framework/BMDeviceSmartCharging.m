@interface BMDeviceSmartCharging
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMDeviceSmartCharging)initWithBatteryLevel:(id)a3 targetSoC:(id)a4 predictedEndOfCharge:(id)a5 mode:(int)a6 obcEvent:(int)a7;
- (BMDeviceSmartCharging)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasBatteryLevel;
- (BOOL)hasPredictedEndOfCharge;
- (BOOL)hasTargetSoC;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (double)predictedEndOfCharge;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)batteryLevel;
- (int)mode;
- (int)obcEvent;
- (int)targetSoC;
- (unsigned)dataVersion;
- (void)setHasBatteryLevel:(BOOL)a3;
- (void)setHasPredictedEndOfCharge:(BOOL)a3;
- (void)setHasTargetSoC:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMDeviceSmartCharging

- (int)obcEvent
{
  return self->_obcEvent;
}

- (int)mode
{
  return self->_mode;
}

- (void)setHasPredictedEndOfCharge:(BOOL)a3
{
  self->_hasPredictedEndOfCharge = a3;
}

- (BOOL)hasPredictedEndOfCharge
{
  return self->_hasPredictedEndOfCharge;
}

- (double)predictedEndOfCharge
{
  return self->_predictedEndOfCharge;
}

- (void)setHasTargetSoC:(BOOL)a3
{
  self->_hasTargetSoC = a3;
}

- (BOOL)hasTargetSoC
{
  return self->_hasTargetSoC;
}

- (int)targetSoC
{
  return self->_targetSoC;
}

- (void)setHasBatteryLevel:(BOOL)a3
{
  self->_hasBatteryLevel = a3;
}

- (BOOL)hasBatteryLevel
{
  return self->_hasBatteryLevel;
}

- (int)batteryLevel
{
  return self->_batteryLevel;
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
    if ((![(BMDeviceSmartCharging *)self hasBatteryLevel]
       && ![v5 hasBatteryLevel]
       || [(BMDeviceSmartCharging *)self hasBatteryLevel]
       && [v5 hasBatteryLevel]
       && (int v6 = [(BMDeviceSmartCharging *)self batteryLevel],
           v6 == [v5 batteryLevel]))
      && (![(BMDeviceSmartCharging *)self hasTargetSoC]
       && ![v5 hasTargetSoC]
       || [(BMDeviceSmartCharging *)self hasTargetSoC]
       && [v5 hasTargetSoC]
       && (int v7 = -[BMDeviceSmartCharging targetSoC](self, "targetSoC"), v7 == [v5 targetSoC]))
      && (![(BMDeviceSmartCharging *)self hasPredictedEndOfCharge]
       && ![v5 hasPredictedEndOfCharge]
       || [(BMDeviceSmartCharging *)self hasPredictedEndOfCharge]
       && [v5 hasPredictedEndOfCharge]
       && ([(BMDeviceSmartCharging *)self predictedEndOfCharge],
           double v9 = v8,
           [v5 predictedEndOfCharge],
           v9 == v10))
      && (int v11 = -[BMDeviceSmartCharging mode](self, "mode"), v11 == [v5 mode]))
    {
      int v12 = [(BMDeviceSmartCharging *)self obcEvent];
      BOOL v13 = v12 == [v5 obcEvent];
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)jsonDictionary
{
  v20[5] = *MEMORY[0x1E4F143B8];
  if ([(BMDeviceSmartCharging *)self hasBatteryLevel])
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceSmartCharging batteryLevel](self, "batteryLevel"));
  }
  else
  {
    uint64_t v3 = 0;
  }
  if ([(BMDeviceSmartCharging *)self hasTargetSoC])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceSmartCharging targetSoC](self, "targetSoC"));
  }
  else
  {
    id v4 = 0;
  }
  if (![(BMDeviceSmartCharging *)self hasPredictedEndOfCharge]
    || ([(BMDeviceSmartCharging *)self predictedEndOfCharge], fabs(v5) == INFINITY))
  {
    int v7 = 0;
  }
  else
  {
    [(BMDeviceSmartCharging *)self predictedEndOfCharge];
    int v6 = NSNumber;
    [(BMDeviceSmartCharging *)self predictedEndOfCharge];
    int v7 = objc_msgSend(v6, "numberWithDouble:");
  }
  double v8 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceSmartCharging mode](self, "mode"));
  double v9 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceSmartCharging obcEvent](self, "obcEvent"));
  uint64_t v17 = v3;
  v19[0] = @"batteryLevel";
  double v10 = (void *)v3;
  if (!v3)
  {
    double v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v20[0] = v10;
  v19[1] = @"targetSoC";
  int v11 = v4;
  if (!v4)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v20[1] = v11;
  v19[2] = @"predictedEndOfCharge";
  int v12 = v7;
  if (!v7)
  {
    int v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v20[2] = v12;
  v19[3] = @"mode";
  BOOL v13 = v8;
  if (!v8)
  {
    BOOL v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v20[3] = v13;
  v19[4] = @"obcEvent";
  v14 = v9;
  if (!v9)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v20[4] = v14;
  v15 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v20, v19, 5, v17);
  if (v9)
  {
    if (v8) {
      goto LABEL_23;
    }
  }
  else
  {

    if (v8)
    {
LABEL_23:
      if (v7) {
        goto LABEL_24;
      }
LABEL_32:

      if (v4) {
        goto LABEL_25;
      }
      goto LABEL_33;
    }
  }

  if (!v7) {
    goto LABEL_32;
  }
LABEL_24:
  if (v4) {
    goto LABEL_25;
  }
LABEL_33:

LABEL_25:
  if (!v18) {

  }
  return v15;
}

- (BMDeviceSmartCharging)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 objectForKeyedSubscript:@"batteryLevel"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    double v9 = [v6 objectForKeyedSubscript:@"targetSoC"];
    v32 = a4;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v35 = 0;
          uint64_t v17 = 0;
          goto LABEL_42;
        }
        id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v19 = *MEMORY[0x1E4F502C8];
        uint64_t v42 = *MEMORY[0x1E4F28568];
        id v34 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"targetSoC"];
        id v43 = v34;
        double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        id v35 = 0;
        uint64_t v17 = 0;
        id *v32 = (id)[v18 initWithDomain:v19 code:2 userInfo:v10];
        goto LABEL_41;
      }
      id v35 = v9;
    }
    else
    {
      id v35 = 0;
    }
    double v10 = [v6 objectForKeyedSubscript:@"predictedEndOfCharge"];
    id v33 = v8;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v34 = 0;
          uint64_t v17 = 0;
          goto LABEL_41;
        }
        id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v21 = *MEMORY[0x1E4F502C8];
        uint64_t v40 = *MEMORY[0x1E4F28568];
        int v12 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"predictedEndOfCharge"];
        v41 = v12;
        int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
        id v34 = 0;
        uint64_t v17 = 0;
        id *v32 = (id)[v20 initWithDomain:v21 code:2 userInfo:v11];
LABEL_40:

        id v8 = v33;
LABEL_41:

        goto LABEL_42;
      }
      id v34 = v10;
    }
    else
    {
      id v34 = 0;
    }
    int v11 = [v6 objectForKeyedSubscript:@"mode"];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = v11;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            int v12 = 0;
            uint64_t v17 = 0;
            goto LABEL_40;
          }
          id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v28 = *MEMORY[0x1E4F502C8];
          uint64_t v38 = *MEMORY[0x1E4F28568];
          v23 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"mode"];
          v39 = v23;
          v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
          int v12 = 0;
          uint64_t v17 = 0;
          id *v32 = (id)[v30 initWithDomain:v28 code:2 userInfo:v22];
          goto LABEL_39;
        }
        id v13 = [NSNumber numberWithInt:BMDeviceSmartChargingModeOfOperationFromString(v11)];
      }
      int v12 = v13;
    }
    else
    {
      int v12 = 0;
    }
    v22 = [v6 objectForKeyedSubscript:@"obcEvent"];
    if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v24 = v22;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v32)
          {
            id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v29 = *MEMORY[0x1E4F502C8];
            uint64_t v36 = *MEMORY[0x1E4F28568];
            v26 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"obcEvent"];
            v37 = v26;
            v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
            id *v32 = (id)[v31 initWithDomain:v29 code:2 userInfo:v27];
          }
          v23 = 0;
          uint64_t v17 = 0;
          goto LABEL_39;
        }
        id v24 = [NSNumber numberWithInt:BMDeviceSmartChargingOBCEventFromString(v22)];
      }
      v23 = v24;
    }
    else
    {
      v23 = 0;
    }
    uint64_t v17 = -[BMDeviceSmartCharging initWithBatteryLevel:targetSoC:predictedEndOfCharge:mode:obcEvent:](self, "initWithBatteryLevel:targetSoC:predictedEndOfCharge:mode:obcEvent:", v33, v35, v34, [v12 intValue], objc_msgSend(v23, "intValue"));
    self = v17;
LABEL_39:

    goto LABEL_40;
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
    uint64_t v17 = 0;
    goto LABEL_43;
  }
  v14 = a4;
  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v16 = *MEMORY[0x1E4F502C8];
  uint64_t v44 = *MEMORY[0x1E4F28568];
  id v35 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"batteryLevel"];
  v45[0] = v35;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];
  id v8 = 0;
  uint64_t v17 = 0;
  id *v14 = (id)[v15 initWithDomain:v16 code:2 userInfo:v9];
LABEL_42:

LABEL_43:
  return v17;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMDeviceSmartCharging *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_hasBatteryLevel) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasTargetSoC) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasPredictedEndOfCharge) {
    PBDataWriterWriteDoubleField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)BMDeviceSmartCharging;
  double v5 = [(BMEventBase *)&v53 init];
  if (!v5) {
    goto LABEL_80;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  int v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    double v9 = (int *)MEMORY[0x1E4F940B8];
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
          v5->_hasBatteryLevel = 1;
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
              goto LABEL_54;
            }
            v20 += 7;
            BOOL v17 = v21++ >= 9;
            if (v17)
            {
              LODWORD(v22) = 0;
              goto LABEL_56;
            }
          }
          v4[*v8] = 1;
LABEL_54:
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_56:
          uint64_t v49 = 24;
          goto LABEL_61;
        case 2u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v22 = 0;
          v5->_hasTargetSoC = 1;
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
                  goto LABEL_60;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_60:
          uint64_t v49 = 28;
LABEL_61:
          *(_DWORD *)((char *)&v5->super.super.isa + v49) = v22;
          continue;
        case 3u:
          v5->_hasPredictedEndOfCharge = 1;
          uint64_t v33 = *v6;
          unint64_t v34 = *(void *)&v4[v33];
          if (v34 <= 0xFFFFFFFFFFFFFFF7 && v34 + 8 <= *(void *)&v4[*v7])
          {
            double v35 = *(double *)(*(void *)&v4[*v9] + v34);
            *(void *)&v4[v33] = v34 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v35 = 0.0;
          }
          v5->_predictedEndOfCharge = v35;
          continue;
        case 4u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v38 = 0;
          while (2)
          {
            uint64_t v39 = *v6;
            uint64_t v40 = *(void *)&v4[v39];
            unint64_t v41 = v40 + 1;
            if (v40 == -1 || v41 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v42 = *(unsigned char *)(*(void *)&v4[*v9] + v40);
              *(void *)&v4[v39] = v41;
              v38 |= (unint64_t)(v42 & 0x7F) << v36;
              if (v42 < 0)
              {
                v36 += 7;
                BOOL v17 = v37++ >= 9;
                if (v17)
                {
                  LODWORD(v38) = 0;
                  goto LABEL_65;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v38) = 0;
          }
LABEL_65:
          if (v38 >= 9) {
            LODWORD(v38) = 0;
          }
          uint64_t v50 = 32;
          goto LABEL_74;
        case 5u:
          char v43 = 0;
          unsigned int v44 = 0;
          uint64_t v38 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_79;
          }
          continue;
      }
      while (1)
      {
        uint64_t v45 = *v6;
        uint64_t v46 = *(void *)&v4[v45];
        unint64_t v47 = v46 + 1;
        if (v46 == -1 || v47 > *(void *)&v4[*v7]) {
          break;
        }
        char v48 = *(unsigned char *)(*(void *)&v4[*v9] + v46);
        *(void *)&v4[v45] = v47;
        v38 |= (unint64_t)(v48 & 0x7F) << v43;
        if ((v48 & 0x80) == 0) {
          goto LABEL_69;
        }
        v43 += 7;
        BOOL v17 = v44++ >= 9;
        if (v17)
        {
          LODWORD(v38) = 0;
          goto LABEL_71;
        }
      }
      v4[*v8] = 1;
LABEL_69:
      if (v4[*v8]) {
        LODWORD(v38) = 0;
      }
LABEL_71:
      if (v38 >= 0xF) {
        LODWORD(v38) = 0;
      }
      uint64_t v50 = 36;
LABEL_74:
      *(_DWORD *)((char *)&v5->super.super.isa + v50) = v38;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_79:
  }
    v51 = 0;
  else {
LABEL_80:
  }
    v51 = v5;

  return v51;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceSmartCharging batteryLevel](self, "batteryLevel"));
  double v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceSmartCharging targetSoC](self, "targetSoC"));
  id v6 = NSNumber;
  [(BMDeviceSmartCharging *)self predictedEndOfCharge];
  int v7 = objc_msgSend(v6, "numberWithDouble:");
  id v8 = BMDeviceSmartChargingModeOfOperationAsString([(BMDeviceSmartCharging *)self mode]);
  double v9 = BMDeviceSmartChargingOBCEventAsString([(BMDeviceSmartCharging *)self obcEvent]);
  char v10 = (void *)[v3 initWithFormat:@"BMDeviceSmartCharging with batteryLevel: %@, targetSoC: %@, predictedEndOfCharge: %@, mode: %@, obcEvent: %@", v4, v5, v7, v8, v9];

  return (NSString *)v10;
}

- (BMDeviceSmartCharging)initWithBatteryLevel:(id)a3 targetSoC:(id)a4 predictedEndOfCharge:(id)a5 mode:(int)a6 obcEvent:(int)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v20.receiver = self;
  v20.super_class = (Class)BMDeviceSmartCharging;
  unint64_t v15 = [(BMEventBase *)&v20 init];
  if (v15)
  {
    v15->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v12)
    {
      v15->_hasBatteryLevel = 1;
      int v16 = [v12 intValue];
    }
    else
    {
      v15->_hasBatteryLevel = 0;
      int v16 = -1;
    }
    v15->_batteryLevel = v16;
    if (v13)
    {
      v15->_hasTargetSoC = 1;
      int v17 = [v13 intValue];
    }
    else
    {
      v15->_hasTargetSoC = 0;
      int v17 = -1;
    }
    v15->_targetSoC = v17;
    if (v14)
    {
      v15->_hasPredictedEndOfCharge = 1;
      [v14 doubleValue];
    }
    else
    {
      v15->_hasPredictedEndOfCharge = 0;
      double v18 = -1.0;
    }
    v15->_predictedEndOfCharge = v18;
    v15->_mode = a6;
    v15->_obcEvent = a7;
  }

  return v15;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"batteryLevel" number:1 type:2 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"targetSoC", 2, 2, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"predictedEndOfCharge" number:3 type:0 subMessageClass:0];
  v9[2] = v4;
  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mode" number:4 type:4 subMessageClass:0];
  v9[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"obcEvent" number:5 type:4 subMessageClass:0];
  v9[4] = v6;
  int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4290;
}

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"batteryLevel" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:2 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"targetSoC" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:2 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"predictedEndOfCharge" dataType:1 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:0];
  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"mode" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"obcEvent" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    double v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    int v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMDeviceSmartCharging alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[5] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end