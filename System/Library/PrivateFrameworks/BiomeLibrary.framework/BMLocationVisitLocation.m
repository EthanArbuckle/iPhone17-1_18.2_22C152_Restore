@interface BMLocationVisitLocation
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMLocationVisitLocation)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMLocationVisitLocation)initWithLatitude:(id)a3 longitude:(id)a4 horizontalUncertainty:(id)a5 altitude:(id)a6 verticalUncertainty:(id)a7 date:(id)a8 referenceFrame:(int)a9 sourceAccuracy:(int)a10;
- (BOOL)hasAltitude;
- (BOOL)hasHorizontalUncertainty;
- (BOOL)hasLatitude;
- (BOOL)hasLongitude;
- (BOOL)hasVerticalUncertainty;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (NSString)description;
- (double)altitude;
- (double)horizontalUncertainty;
- (double)latitude;
- (double)longitude;
- (double)verticalUncertainty;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)referenceFrame;
- (int)sourceAccuracy;
- (unsigned)dataVersion;
- (void)setHasAltitude:(BOOL)a3;
- (void)setHasHorizontalUncertainty:(BOOL)a3;
- (void)setHasLatitude:(BOOL)a3;
- (void)setHasLongitude:(BOOL)a3;
- (void)setHasVerticalUncertainty:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMLocationVisitLocation

- (int)sourceAccuracy
{
  return self->_sourceAccuracy;
}

- (int)referenceFrame
{
  return self->_referenceFrame;
}

- (void)setHasVerticalUncertainty:(BOOL)a3
{
  self->_hasVerticalUncertainty = a3;
}

- (BOOL)hasVerticalUncertainty
{
  return self->_hasVerticalUncertainty;
}

- (double)verticalUncertainty
{
  return self->_verticalUncertainty;
}

- (void)setHasAltitude:(BOOL)a3
{
  self->_hasAltitude = a3;
}

- (BOOL)hasAltitude
{
  return self->_hasAltitude;
}

- (double)altitude
{
  return self->_altitude;
}

- (void)setHasHorizontalUncertainty:(BOOL)a3
{
  self->_hasHorizontalUncertainty = a3;
}

- (BOOL)hasHorizontalUncertainty
{
  return self->_hasHorizontalUncertainty;
}

- (double)horizontalUncertainty
{
  return self->_horizontalUncertainty;
}

- (void)setHasLongitude:(BOOL)a3
{
  self->_hasLongitude = a3;
}

- (BOOL)hasLongitude
{
  return self->_hasLongitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setHasLatitude:(BOOL)a3
{
  self->_hasLatitude = a3;
}

- (BOOL)hasLatitude
{
  return self->_hasLatitude;
}

- (double)latitude
{
  return self->_latitude;
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
    if (-[BMLocationVisitLocation hasLatitude](self, "hasLatitude") || [v5 hasLatitude])
    {
      if (![(BMLocationVisitLocation *)self hasLatitude]) {
        goto LABEL_34;
      }
      if (![v5 hasLatitude]) {
        goto LABEL_34;
      }
      [(BMLocationVisitLocation *)self latitude];
      double v7 = v6;
      [v5 latitude];
      if (v7 != v8) {
        goto LABEL_34;
      }
    }
    if (-[BMLocationVisitLocation hasLongitude](self, "hasLongitude") || [v5 hasLongitude])
    {
      if (![(BMLocationVisitLocation *)self hasLongitude]) {
        goto LABEL_34;
      }
      if (![v5 hasLongitude]) {
        goto LABEL_34;
      }
      [(BMLocationVisitLocation *)self longitude];
      double v10 = v9;
      [v5 longitude];
      if (v10 != v11) {
        goto LABEL_34;
      }
    }
    if ([(BMLocationVisitLocation *)self hasHorizontalUncertainty]
      || [v5 hasHorizontalUncertainty])
    {
      if (![(BMLocationVisitLocation *)self hasHorizontalUncertainty]) {
        goto LABEL_34;
      }
      if (![v5 hasHorizontalUncertainty]) {
        goto LABEL_34;
      }
      [(BMLocationVisitLocation *)self horizontalUncertainty];
      double v13 = v12;
      [v5 horizontalUncertainty];
      if (v13 != v14) {
        goto LABEL_34;
      }
    }
    if (-[BMLocationVisitLocation hasAltitude](self, "hasAltitude") || [v5 hasAltitude])
    {
      if (![(BMLocationVisitLocation *)self hasAltitude]) {
        goto LABEL_34;
      }
      if (![v5 hasAltitude]) {
        goto LABEL_34;
      }
      [(BMLocationVisitLocation *)self altitude];
      double v16 = v15;
      [v5 altitude];
      if (v16 != v17) {
        goto LABEL_34;
      }
    }
    if ([(BMLocationVisitLocation *)self hasVerticalUncertainty]
      || [v5 hasVerticalUncertainty])
    {
      if (![(BMLocationVisitLocation *)self hasVerticalUncertainty]) {
        goto LABEL_34;
      }
      if (![v5 hasVerticalUncertainty]) {
        goto LABEL_34;
      }
      [(BMLocationVisitLocation *)self verticalUncertainty];
      double v19 = v18;
      [v5 verticalUncertainty];
      if (v19 != v20) {
        goto LABEL_34;
      }
    }
    v21 = [(BMLocationVisitLocation *)self date];
    uint64_t v22 = [v5 date];
    if (v21 == (void *)v22)
    {
    }
    else
    {
      v23 = (void *)v22;
      v24 = [(BMLocationVisitLocation *)self date];
      v25 = [v5 date];
      int v26 = [v24 isEqual:v25];

      if (!v26) {
        goto LABEL_34;
      }
    }
    int v28 = [(BMLocationVisitLocation *)self referenceFrame];
    if (v28 == [v5 referenceFrame])
    {
      int v29 = [(BMLocationVisitLocation *)self sourceAccuracy];
      BOOL v27 = v29 == [v5 sourceAccuracy];
LABEL_35:

      goto LABEL_36;
    }
LABEL_34:
    BOOL v27 = 0;
    goto LABEL_35;
  }
  BOOL v27 = 0;
LABEL_36:

  return v27;
}

- (NSDate)date
{
  if (self->_hasRaw_date)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_date];
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
  v42[8] = *MEMORY[0x1E4F143B8];
  if (![(BMLocationVisitLocation *)self hasLatitude]
    || ([(BMLocationVisitLocation *)self latitude], fabs(v3) == INFINITY))
  {
    uint64_t v5 = 0;
  }
  else
  {
    [(BMLocationVisitLocation *)self latitude];
    id v4 = NSNumber;
    [(BMLocationVisitLocation *)self latitude];
    uint64_t v5 = objc_msgSend(v4, "numberWithDouble:");
  }
  if (![(BMLocationVisitLocation *)self hasLongitude]
    || ([(BMLocationVisitLocation *)self longitude], fabs(v6) == INFINITY))
  {
    uint64_t v8 = 0;
  }
  else
  {
    [(BMLocationVisitLocation *)self longitude];
    double v7 = NSNumber;
    [(BMLocationVisitLocation *)self longitude];
    uint64_t v8 = objc_msgSend(v7, "numberWithDouble:");
  }
  if (![(BMLocationVisitLocation *)self hasHorizontalUncertainty]
    || ([(BMLocationVisitLocation *)self horizontalUncertainty], fabs(v9) == INFINITY))
  {
    uint64_t v11 = 0;
  }
  else
  {
    [(BMLocationVisitLocation *)self horizontalUncertainty];
    double v10 = NSNumber;
    [(BMLocationVisitLocation *)self horizontalUncertainty];
    uint64_t v11 = objc_msgSend(v10, "numberWithDouble:");
  }
  if (![(BMLocationVisitLocation *)self hasAltitude]
    || ([(BMLocationVisitLocation *)self altitude], fabs(v12) == INFINITY))
  {
    v40 = 0;
  }
  else
  {
    [(BMLocationVisitLocation *)self altitude];
    double v13 = NSNumber;
    [(BMLocationVisitLocation *)self altitude];
    v40 = objc_msgSend(v13, "numberWithDouble:");
  }
  if (![(BMLocationVisitLocation *)self hasVerticalUncertainty]
    || ([(BMLocationVisitLocation *)self verticalUncertainty], fabs(v14) == INFINITY))
  {
    v39 = 0;
  }
  else
  {
    [(BMLocationVisitLocation *)self verticalUncertainty];
    double v15 = NSNumber;
    [(BMLocationVisitLocation *)self verticalUncertainty];
    v39 = objc_msgSend(v15, "numberWithDouble:");
  }
  double v16 = [(BMLocationVisitLocation *)self date];
  if (v16)
  {
    double v17 = NSNumber;
    [(BMLocationVisitLocation *)self date];
    v19 = uint64_t v18 = v11;
    [v19 timeIntervalSince1970];
    double v20 = objc_msgSend(v17, "numberWithDouble:");

    uint64_t v11 = v18;
  }
  else
  {
    double v20 = 0;
  }

  v21 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLocationVisitLocation referenceFrame](self, "referenceFrame"));
  uint64_t v22 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLocationVisitLocation sourceAccuracy](self, "sourceAccuracy"));
  v41[0] = @"latitude";
  uint64_t v23 = v5;
  if (!v5)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v36 = (void *)v23;
  v42[0] = v23;
  v41[1] = @"longitude";
  uint64_t v24 = v8;
  if (!v8)
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v35 = (void *)v24;
  v42[1] = v24;
  v41[2] = @"horizontalUncertainty";
  uint64_t v25 = v11;
  v37 = (void *)v11;
  if (!v11)
  {
    uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v34 = (void *)v25;
  v42[2] = v25;
  v41[3] = @"altitude";
  int v26 = v40;
  if (!v40)
  {
    int v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v38 = (void *)v5;
  v42[3] = v26;
  v41[4] = @"verticalUncertainty";
  BOOL v27 = v39;
  if (!v39)
  {
    BOOL v27 = [MEMORY[0x1E4F1CA98] null];
  }
  int v28 = (void *)v8;
  v42[4] = v27;
  v41[5] = @"date";
  int v29 = v20;
  if (!v20)
  {
    int v29 = [MEMORY[0x1E4F1CA98] null];
  }
  v42[5] = v29;
  v41[6] = @"referenceFrame";
  v30 = v21;
  if (!v21)
  {
    v30 = [MEMORY[0x1E4F1CA98] null];
  }
  v42[6] = v30;
  v41[7] = @"sourceAccuracy";
  v31 = v22;
  if (!v22)
  {
    v31 = [MEMORY[0x1E4F1CA98] null];
  }
  v42[7] = v31;
  v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:8];
  if (v22)
  {
    if (v21) {
      goto LABEL_42;
    }
LABEL_54:

    if (v20) {
      goto LABEL_43;
    }
    goto LABEL_55;
  }

  if (!v21) {
    goto LABEL_54;
  }
LABEL_42:
  if (v20) {
    goto LABEL_43;
  }
LABEL_55:

LABEL_43:
  if (!v39) {

  }
  if (!v40) {
  if (v37)
  }
  {
    if (v28) {
      goto LABEL_49;
    }
LABEL_57:

    if (v38) {
      goto LABEL_50;
    }
    goto LABEL_58;
  }

  if (!v28) {
    goto LABEL_57;
  }
LABEL_49:
  if (v38) {
    goto LABEL_50;
  }
LABEL_58:

LABEL_50:

  return v32;
}

- (BMLocationVisitLocation)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v107[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [v6 objectForKeyedSubscript:@"latitude"];
  v91 = v6;
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
LABEL_4:
    double v9 = [v6 objectForKeyedSubscript:@"longitude"];
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v10 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;
LABEL_7:
      uint64_t v11 = [v6 objectForKeyedSubscript:@"horizontalUncertainty"];
      id v89 = v10;
      if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        double v12 = self;
        double v13 = v9;
        double v14 = v7;
        id v87 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v12 = self;
        double v13 = v9;
        double v14 = v7;
        id v87 = v11;
LABEL_10:
        double v15 = [v6 objectForKeyedSubscript:@"altitude"];
        v81 = v11;
        if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v80 = v15;
          id v90 = 0;
          goto LABEL_13;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v80 = v15;
          id v90 = v15;
LABEL_13:
          uint64_t v16 = [v6 objectForKeyedSubscript:@"verticalUncertainty"];
          double v7 = v14;
          v82 = (void *)v16;
          if (v16)
          {
            double v17 = (void *)v16;
            objc_opt_class();
            double v9 = v13;
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              self = v12;
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!a4)
                {
                  v53 = 0;
                  uint64_t v24 = 0;
                  v35 = v87;
                  v45 = v80;
                  goto LABEL_75;
                }
                v54 = a4;
                id v55 = objc_alloc(MEMORY[0x1E4F28C58]);
                id v56 = v8;
                uint64_t v57 = *MEMORY[0x1E4F502C8];
                uint64_t v98 = *MEMORY[0x1E4F28568];
                v83 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"verticalUncertainty"];
                v99 = v83;
                uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v99 forKeys:&v98 count:1];
                uint64_t v58 = v57;
                id v8 = v56;
                v53 = 0;
                uint64_t v24 = 0;
                id *v54 = (id)[v55 initWithDomain:v58 code:2 userInfo:v18];
                uint64_t v11 = v81;
                goto LABEL_73;
              }
              id v79 = v17;
LABEL_24:
              uint64_t v18 = [v91 objectForKeyedSubscript:@"date"];
              v88 = self;
              id v85 = v8;
              if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v83 = 0;
                goto LABEL_52;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v25 = (objc_class *)MEMORY[0x1E4F1C9C8];
                int v26 = a4;
                id v27 = v18;
                id v28 = [v25 alloc];
                [v27 doubleValue];
                double v30 = v29;

                a4 = v26;
                id v31 = (id)[v28 initWithTimeIntervalSince1970:v30];
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v59 = objc_alloc_init(MEMORY[0x1E4F28D48]);
                  v83 = [v59 dateFromString:v18];

                  goto LABEL_52;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (!a4)
                  {
                    v83 = 0;
                    uint64_t v24 = 0;
                    v53 = v79;
                    v45 = v80;
                    goto LABEL_74;
                  }
                  v73 = a4;
                  id v74 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v75 = *MEMORY[0x1E4F502C8];
                  uint64_t v96 = *MEMORY[0x1E4F28568];
                  v62 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"date"];
                  v97 = v62;
                  v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v97 forKeys:&v96 count:1];
                  v83 = 0;
                  uint64_t v24 = 0;
                  id *v73 = (id)[v74 initWithDomain:v75 code:2 userInfo:v60];
                  goto LABEL_89;
                }
                id v31 = v18;
              }
              v83 = v31;
LABEL_52:
              v60 = [v91 objectForKeyedSubscript:@"referenceFrame"];
              v61 = a4;
              if (!v60 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v62 = 0;
                goto LABEL_60;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v63 = v60;
LABEL_59:
                v62 = v63;
LABEL_60:
                v64 = [v91 objectForKeyedSubscript:@"sourceAccuracy"];
                if (v64)
                {
                  objc_opt_class();
                  v53 = v79;
                  if (objc_opt_isKindOfClass())
                  {
                    v65 = 0;
                  }
                  else
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v66 = v64;
                    }
                    else
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        if (v61)
                        {
                          id v78 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v77 = *MEMORY[0x1E4F502C8];
                          uint64_t v92 = *MEMORY[0x1E4F28568];
                          v71 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"sourceAccuracy"];
                          v93 = v71;
                          v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v93 forKeys:&v92 count:1];
                          id *v61 = (id)[v78 initWithDomain:v77 code:2 userInfo:v72];
                        }
                        v65 = 0;
                        uint64_t v24 = 0;
                        goto LABEL_70;
                      }
                      id v66 = [NSNumber numberWithInt:BMLocationVisitLocationSourceAccuracyFromString(v64)];
                    }
                    v65 = v66;
                  }
                }
                else
                {
                  v65 = 0;
                  v53 = v79;
                }
                uint64_t v24 = -[BMLocationVisitLocation initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:sourceAccuracy:](v88, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:sourceAccuracy:", v85, v89, v87, v90, v53, v83, __PAIR64__([v65 intValue], objc_msgSend(v62, "intValue")));
                v88 = v24;
LABEL_70:
                uint64_t v11 = v81;
LABEL_71:

LABEL_72:
                self = v88;
                id v8 = v85;
LABEL_73:
                v45 = v80;
LABEL_74:

                id v10 = v89;
                v35 = v87;
                goto LABEL_75;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v63 = [NSNumber numberWithInt:BMLocationVisitLocationReferenceFrameFromString(v60)];
                goto LABEL_59;
              }
              if (a4)
              {
                id v68 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v69 = *MEMORY[0x1E4F502C8];
                uint64_t v94 = *MEMORY[0x1E4F28568];
                v65 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"referenceFrame"];
                v95 = v65;
                v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v95 forKeys:&v94 count:1];
                id v70 = (id)[v68 initWithDomain:v69 code:2 userInfo:v64];
                v62 = 0;
                uint64_t v24 = 0;
                id *v61 = v70;
                uint64_t v11 = v81;
                v53 = v79;
                goto LABEL_71;
              }
              v62 = 0;
              uint64_t v24 = 0;
LABEL_89:
              uint64_t v11 = v81;
              v53 = v79;
              goto LABEL_72;
            }
            id v79 = 0;
          }
          else
          {
            id v79 = 0;
            double v9 = v13;
          }
          self = v12;
          goto LABEL_24;
        }
        if (a4)
        {
          v84 = a4;
          id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v48 = *MEMORY[0x1E4F502C8];
          uint64_t v100 = *MEMORY[0x1E4F28568];
          id v86 = v8;
          uint64_t v49 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"altitude"];
          uint64_t v101 = v49;
          uint64_t v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v101 forKeys:&v100 count:1];
          v51 = v47;
          v45 = v15;
          uint64_t v52 = v48;
          id v10 = v89;
          v82 = (void *)v50;
          id v90 = 0;
          uint64_t v24 = 0;
          id *v84 = (id)objc_msgSend(v51, "initWithDomain:code:userInfo:", v52, 2);
          double v7 = v14;
          double v9 = v13;
          self = v12;
          v53 = (void *)v49;
          id v8 = v86;
          v35 = v87;
LABEL_75:

          goto LABEL_76;
        }
        id v90 = 0;
        uint64_t v24 = 0;
        v35 = v87;
        v45 = v15;
        double v7 = v14;
        double v9 = v13;
        self = v12;
LABEL_76:

        goto LABEL_77;
      }
      if (a4)
      {
        v37 = a4;
        id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v39 = *MEMORY[0x1E4F502C8];
        uint64_t v102 = *MEMORY[0x1E4F28568];
        id v40 = v8;
        id v41 = [NSString alloc];
        uint64_t v76 = objc_opt_class();
        v42 = v41;
        id v8 = v40;
        id v90 = (id)[v42 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v76, @"horizontalUncertainty"];
        id v103 = v90;
        uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v103 forKeys:&v102 count:1];
        v44 = v38;
        v45 = (void *)v43;
        uint64_t v46 = v39;
        id v10 = v89;
        v35 = 0;
        uint64_t v24 = 0;
        id *v37 = (id)[v44 initWithDomain:v46 code:2 userInfo:v43];
        goto LABEL_76;
      }
      v35 = 0;
      uint64_t v24 = 0;
LABEL_77:

      goto LABEL_78;
    }
    if (a4)
    {
      v32 = a4;
      id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v34 = *MEMORY[0x1E4F502C8];
      uint64_t v104 = *MEMORY[0x1E4F28568];
      v35 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"longitude"];
      v105 = v35;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v105 forKeys:&v104 count:1];
      id v36 = (id)[v33 initWithDomain:v34 code:2 userInfo:v11];
      id v10 = 0;
      uint64_t v24 = 0;
      id *v32 = v36;
      goto LABEL_77;
    }
    id v10 = 0;
    uint64_t v24 = 0;
LABEL_78:

    goto LABEL_79;
  }
  if (a4)
  {
    double v19 = a4;
    id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v21 = *MEMORY[0x1E4F502C8];
    uint64_t v106 = *MEMORY[0x1E4F28568];
    uint64_t v22 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"latitude"];
    v107[0] = v22;
    double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v107 forKeys:&v106 count:1];
    uint64_t v23 = v21;
    id v10 = (id)v22;
    id v8 = 0;
    uint64_t v24 = 0;
    *double v19 = (id)[v20 initWithDomain:v23 code:2 userInfo:v9];
    goto LABEL_78;
  }
  id v8 = 0;
  uint64_t v24 = 0;
LABEL_79:

  return v24;
}

- (id)serialize
{
  double v3 = objc_opt_new();
  [(BMLocationVisitLocation *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_hasLatitude) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasLongitude) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasHorizontalUncertainty) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasAltitude) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasVerticalUncertainty) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasRaw_date) {
    PBDataWriterWriteDoubleField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)BMLocationVisitLocation;
  uint64_t v5 = [(BMEventBase *)&v50 init];
  if (!v5) {
    goto LABEL_83;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  double v7 = (int *)MEMORY[0x1E4F940E0];
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
          v5->_hasLatitude = 1;
          uint64_t v20 = *v6;
          unint64_t v21 = *(void *)&v4[v20];
          if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v22 = *(objc_class **)(*(void *)&v4[*v9] + v21);
            *(void *)&v4[v20] = v21 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v22 = 0;
          }
          uint64_t v47 = 56;
          goto LABEL_79;
        case 2u:
          v5->_hasLongitude = 1;
          uint64_t v23 = *v6;
          unint64_t v24 = *(void *)&v4[v23];
          if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v22 = *(objc_class **)(*(void *)&v4[*v9] + v24);
            *(void *)&v4[v23] = v24 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v22 = 0;
          }
          uint64_t v47 = 64;
          goto LABEL_79;
        case 3u:
          v5->_hasHorizontalUncertainty = 1;
          uint64_t v25 = *v6;
          unint64_t v26 = *(void *)&v4[v25];
          if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v22 = *(objc_class **)(*(void *)&v4[*v9] + v26);
            *(void *)&v4[v25] = v26 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v22 = 0;
          }
          uint64_t v47 = 72;
          goto LABEL_79;
        case 4u:
          v5->_hasAltitude = 1;
          uint64_t v27 = *v6;
          unint64_t v28 = *(void *)&v4[v27];
          if (v28 <= 0xFFFFFFFFFFFFFFF7 && v28 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v22 = *(objc_class **)(*(void *)&v4[*v9] + v28);
            *(void *)&v4[v27] = v28 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v22 = 0;
          }
          uint64_t v47 = 80;
          goto LABEL_79;
        case 5u:
          v5->_hasVerticalUncertainty = 1;
          uint64_t v29 = *v6;
          unint64_t v30 = *(void *)&v4[v29];
          if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v22 = *(objc_class **)(*(void *)&v4[*v9] + v30);
            *(void *)&v4[v29] = v30 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v22 = 0;
          }
          uint64_t v47 = 88;
          goto LABEL_79;
        case 6u:
          v5->_hasRaw_date = 1;
          uint64_t v31 = *v6;
          unint64_t v32 = *(void *)&v4[v31];
          if (v32 <= 0xFFFFFFFFFFFFFFF7 && v32 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v22 = *(objc_class **)(*(void *)&v4[*v9] + v32);
            *(void *)&v4[v31] = v32 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v22 = 0;
          }
          uint64_t v47 = 24;
LABEL_79:
          *(Class *)((char *)&v5->super.super.isa + v47) = v22;
          continue;
        case 7u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v35 = 0;
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
              v35 |= (unint64_t)(v39 & 0x7F) << v33;
              if (v39 < 0)
              {
                v33 += 7;
                BOOL v17 = v34++ >= 9;
                if (v17)
                {
                  LODWORD(v35) = 0;
                  goto LABEL_57;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v35) = 0;
          }
LABEL_57:
          if (v35 >= 3) {
            LODWORD(v35) = 0;
          }
          uint64_t v46 = 44;
          goto LABEL_66;
        case 8u:
          char v40 = 0;
          unsigned int v41 = 0;
          uint64_t v35 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_82;
          }
          continue;
      }
      while (1)
      {
        uint64_t v42 = *v6;
        uint64_t v43 = *(void *)&v4[v42];
        unint64_t v44 = v43 + 1;
        if (v43 == -1 || v44 > *(void *)&v4[*v7]) {
          break;
        }
        char v45 = *(unsigned char *)(*(void *)&v4[*v9] + v43);
        *(void *)&v4[v42] = v44;
        v35 |= (unint64_t)(v45 & 0x7F) << v40;
        if ((v45 & 0x80) == 0) {
          goto LABEL_61;
        }
        v40 += 7;
        BOOL v17 = v41++ >= 9;
        if (v17)
        {
          LODWORD(v35) = 0;
          goto LABEL_63;
        }
      }
      v4[*v8] = 1;
LABEL_61:
      if (v4[*v8]) {
        LODWORD(v35) = 0;
      }
LABEL_63:
      if (v35 >= 3) {
        LODWORD(v35) = 0;
      }
      uint64_t v46 = 48;
LABEL_66:
      *(_DWORD *)((char *)&v5->super.super.isa + v46) = v35;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_82:
  }
    uint64_t v48 = 0;
  else {
LABEL_83:
  }
    uint64_t v48 = v5;

  return v48;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = NSNumber;
  [(BMLocationVisitLocation *)self latitude];
  uint64_t v5 = objc_msgSend(v4, "numberWithDouble:");
  id v6 = NSNumber;
  [(BMLocationVisitLocation *)self longitude];
  double v7 = objc_msgSend(v6, "numberWithDouble:");
  id v8 = NSNumber;
  [(BMLocationVisitLocation *)self horizontalUncertainty];
  double v9 = objc_msgSend(v8, "numberWithDouble:");
  char v10 = NSNumber;
  [(BMLocationVisitLocation *)self altitude];
  unsigned int v11 = objc_msgSend(v10, "numberWithDouble:");
  unint64_t v12 = NSNumber;
  [(BMLocationVisitLocation *)self verticalUncertainty];
  uint64_t v13 = objc_msgSend(v12, "numberWithDouble:");
  uint64_t v14 = [(BMLocationVisitLocation *)self date];
  unint64_t v15 = BMLocationVisitLocationReferenceFrameAsString([(BMLocationVisitLocation *)self referenceFrame]);
  char v16 = BMLocationVisitLocationSourceAccuracyAsString([(BMLocationVisitLocation *)self sourceAccuracy]);
  BOOL v17 = (void *)[v3 initWithFormat:@"BMLocationVisitLocation with latitude: %@, longitude: %@, horizontalUncertainty: %@, altitude: %@, verticalUncertainty: %@, date: %@, referenceFrame: %@, sourceAccuracy: %@", v5, v7, v9, v11, v13, v14, v15, v16];

  return (NSString *)v17;
}

- (BMLocationVisitLocation)initWithLatitude:(id)a3 longitude:(id)a4 horizontalUncertainty:(id)a5 altitude:(id)a6 verticalUncertainty:(id)a7 date:(id)a8 referenceFrame:(int)a9 sourceAccuracy:(int)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  v30.receiver = self;
  v30.super_class = (Class)BMLocationVisitLocation;
  uint64_t v22 = [(BMEventBase *)&v30 init];
  if (v22)
  {
    v22->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v16)
    {
      v22->_hasLatitude = 1;
      [v16 doubleValue];
    }
    else
    {
      v22->_hasLatitude = 0;
      double v23 = -1.0;
    }
    v22->_latitude = v23;
    if (v17)
    {
      v22->_hasLongitude = 1;
      [v17 doubleValue];
    }
    else
    {
      v22->_hasLongitude = 0;
      double v24 = -1.0;
    }
    v22->_longitude = v24;
    if (v18)
    {
      v22->_hasHorizontalUncertainty = 1;
      [v18 doubleValue];
    }
    else
    {
      v22->_hasHorizontalUncertainty = 0;
      double v25 = -1.0;
    }
    v22->_horizontalUncertainty = v25;
    if (v19)
    {
      v22->_hasAltitude = 1;
      [v19 doubleValue];
    }
    else
    {
      v22->_hasAltitude = 0;
      double v26 = -1.0;
    }
    v22->_altitude = v26;
    if (v20)
    {
      v22->_hasVerticalUncertainty = 1;
      [v20 doubleValue];
    }
    else
    {
      v22->_hasVerticalUncertainty = 0;
      double v27 = -1.0;
    }
    v22->_verticalUncertainty = v27;
    if (v21)
    {
      v22->_hasRaw_date = 1;
      [v21 timeIntervalSince1970];
    }
    else
    {
      v22->_hasRaw_date = 0;
      double v28 = -1.0;
    }
    v22->_raw_date = v28;
    v22->_referenceFrame = a9;
    v22->_sourceAccuracy = a10;
  }

  return v22;
}

+ (id)protoFields
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"latitude" number:1 type:0 subMessageClass:0];
  v12[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"longitude" number:2 type:0 subMessageClass:0];
  v12[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"horizontalUncertainty" number:3 type:0 subMessageClass:0];
  v12[2] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"altitude" number:4 type:0 subMessageClass:0];
  v12[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"verticalUncertainty" number:5 type:0 subMessageClass:0];
  v12[4] = v6;
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"date" number:6 type:0 subMessageClass:0];
  v12[5] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"referenceFrame" number:7 type:4 subMessageClass:0];
  v12[6] = v8;
  double v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sourceAccuracy" number:8 type:4 subMessageClass:0];
  v12[7] = v9;
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6420;
}

+ (id)columns
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"latitude" dataType:1 requestOnly:0 fieldNumber:1 protoDataType:0 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"longitude" dataType:1 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"horizontalUncertainty" dataType:1 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"altitude" dataType:1 requestOnly:0 fieldNumber:4 protoDataType:0 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"verticalUncertainty" dataType:1 requestOnly:0 fieldNumber:5 protoDataType:0 convertedType:0];
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"date" dataType:3 requestOnly:0 fieldNumber:6 protoDataType:0 convertedType:2];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"referenceFrame" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:4 convertedType:0];
  double v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sourceAccuracy" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:4 convertedType:0];
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

    id v8 = [[BMLocationVisitLocation alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[10] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end