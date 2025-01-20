@interface BMCameraCaptureAutoFocusROI
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMCameraCaptureAutoFocusROI)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMCameraCaptureAutoFocusROI)initWithPortType:(id)a3 focusRegionType:(int)a4 topLeftCornerRow:(id)a5 topLeftCornerColumn:(id)a6 width:(id)a7 height:(id)a8 luxLevel:(id)a9 subjectDistance:(id)a10 clientApplicationIDType:(int)a11;
- (BOOL)hasHeight;
- (BOOL)hasLuxLevel;
- (BOOL)hasSubjectDistance;
- (BOOL)hasTopLeftCornerColumn;
- (BOOL)hasTopLeftCornerRow;
- (BOOL)hasWidth;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)portType;
- (double)subjectDistance;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)clientApplicationIDType;
- (int)focusRegionType;
- (unsigned)dataVersion;
- (unsigned)height;
- (unsigned)luxLevel;
- (unsigned)topLeftCornerColumn;
- (unsigned)topLeftCornerRow;
- (unsigned)width;
- (void)setHasHeight:(BOOL)a3;
- (void)setHasLuxLevel:(BOOL)a3;
- (void)setHasSubjectDistance:(BOOL)a3;
- (void)setHasTopLeftCornerColumn:(BOOL)a3;
- (void)setHasTopLeftCornerRow:(BOOL)a3;
- (void)setHasWidth:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMCameraCaptureAutoFocusROI

- (void).cxx_destruct
{
}

- (int)clientApplicationIDType
{
  return self->_clientApplicationIDType;
}

- (void)setHasSubjectDistance:(BOOL)a3
{
  self->_hasSubjectDistance = a3;
}

- (BOOL)hasSubjectDistance
{
  return self->_hasSubjectDistance;
}

- (double)subjectDistance
{
  return self->_subjectDistance;
}

- (void)setHasLuxLevel:(BOOL)a3
{
  self->_hasLuxLevel = a3;
}

- (BOOL)hasLuxLevel
{
  return self->_hasLuxLevel;
}

- (unsigned)luxLevel
{
  return self->_luxLevel;
}

- (void)setHasHeight:(BOOL)a3
{
  self->_hasHeight = a3;
}

- (BOOL)hasHeight
{
  return self->_hasHeight;
}

- (unsigned)height
{
  return self->_height;
}

- (void)setHasWidth:(BOOL)a3
{
  self->_hasWidth = a3;
}

- (BOOL)hasWidth
{
  return self->_hasWidth;
}

- (unsigned)width
{
  return self->_width;
}

- (void)setHasTopLeftCornerColumn:(BOOL)a3
{
  self->_hasTopLeftCornerColumn = a3;
}

- (BOOL)hasTopLeftCornerColumn
{
  return self->_hasTopLeftCornerColumn;
}

- (unsigned)topLeftCornerColumn
{
  return self->_topLeftCornerColumn;
}

- (void)setHasTopLeftCornerRow:(BOOL)a3
{
  self->_hasTopLeftCornerRow = a3;
}

- (BOOL)hasTopLeftCornerRow
{
  return self->_hasTopLeftCornerRow;
}

- (unsigned)topLeftCornerRow
{
  return self->_topLeftCornerRow;
}

- (int)focusRegionType
{
  return self->_focusRegionType;
}

- (NSString)portType
{
  return self->_portType;
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
    v6 = [(BMCameraCaptureAutoFocusROI *)self portType];
    uint64_t v7 = [v5 portType];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMCameraCaptureAutoFocusROI *)self portType];
      v10 = [v5 portType];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_39;
      }
    }
    int v13 = [(BMCameraCaptureAutoFocusROI *)self focusRegionType];
    if (v13 == [v5 focusRegionType])
    {
      if (![(BMCameraCaptureAutoFocusROI *)self hasTopLeftCornerRow]
        && ![v5 hasTopLeftCornerRow]
        || [(BMCameraCaptureAutoFocusROI *)self hasTopLeftCornerRow]
        && [v5 hasTopLeftCornerRow]
        && (unsigned int v14 = [(BMCameraCaptureAutoFocusROI *)self topLeftCornerRow],
            v14 == [v5 topLeftCornerRow]))
      {
        if (![(BMCameraCaptureAutoFocusROI *)self hasTopLeftCornerColumn]
          && ![v5 hasTopLeftCornerColumn]
          || [(BMCameraCaptureAutoFocusROI *)self hasTopLeftCornerColumn]
          && [v5 hasTopLeftCornerColumn]
          && (unsigned int v15 = [(BMCameraCaptureAutoFocusROI *)self topLeftCornerColumn],
              v15 == [v5 topLeftCornerColumn]))
        {
          if (!-[BMCameraCaptureAutoFocusROI hasWidth](self, "hasWidth") && ![v5 hasWidth]
            || [(BMCameraCaptureAutoFocusROI *)self hasWidth]
            && [v5 hasWidth]
            && (unsigned int v16 = -[BMCameraCaptureAutoFocusROI width](self, "width"), v16 == [v5 width]))
          {
            if (![(BMCameraCaptureAutoFocusROI *)self hasHeight]
              && ![v5 hasHeight]
              || [(BMCameraCaptureAutoFocusROI *)self hasHeight]
              && [v5 hasHeight]
              && (unsigned int v17 = [(BMCameraCaptureAutoFocusROI *)self height],
                  v17 == [v5 height]))
            {
              if (![(BMCameraCaptureAutoFocusROI *)self hasLuxLevel]
                && ![v5 hasLuxLevel]
                || [(BMCameraCaptureAutoFocusROI *)self hasLuxLevel]
                && [v5 hasLuxLevel]
                && (unsigned int v18 = [(BMCameraCaptureAutoFocusROI *)self luxLevel],
                    v18 == [v5 luxLevel]))
              {
                if (![(BMCameraCaptureAutoFocusROI *)self hasSubjectDistance]
                  && ![v5 hasSubjectDistance]
                  || [(BMCameraCaptureAutoFocusROI *)self hasSubjectDistance]
                  && [v5 hasSubjectDistance]
                  && ([(BMCameraCaptureAutoFocusROI *)self subjectDistance],
                      double v20 = v19,
                      [v5 subjectDistance],
                      v20 == v21))
                {
                  int v22 = [(BMCameraCaptureAutoFocusROI *)self clientApplicationIDType];
                  BOOL v12 = v22 == [v5 clientApplicationIDType];
LABEL_40:

                  goto LABEL_41;
                }
              }
            }
          }
        }
      }
    }
LABEL_39:
    BOOL v12 = 0;
    goto LABEL_40;
  }
  BOOL v12 = 0;
LABEL_41:

  return v12;
}

- (id)jsonDictionary
{
  v35[9] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMCameraCaptureAutoFocusROI *)self portType];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMCameraCaptureAutoFocusROI focusRegionType](self, "focusRegionType"));
  if ([(BMCameraCaptureAutoFocusROI *)self hasTopLeftCornerRow])
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMCameraCaptureAutoFocusROI topLeftCornerRow](self, "topLeftCornerRow"));
  }
  else
  {
    uint64_t v5 = 0;
  }
  if ([(BMCameraCaptureAutoFocusROI *)self hasTopLeftCornerColumn])
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMCameraCaptureAutoFocusROI topLeftCornerColumn](self, "topLeftCornerColumn"));
  }
  else
  {
    uint64_t v6 = 0;
  }
  if ([(BMCameraCaptureAutoFocusROI *)self hasWidth])
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMCameraCaptureAutoFocusROI width](self, "width"));
  }
  else
  {
    uint64_t v7 = 0;
  }
  if ([(BMCameraCaptureAutoFocusROI *)self hasHeight])
  {
    v33 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMCameraCaptureAutoFocusROI height](self, "height"));
  }
  else
  {
    v33 = 0;
  }
  if ([(BMCameraCaptureAutoFocusROI *)self hasLuxLevel])
  {
    v32 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMCameraCaptureAutoFocusROI luxLevel](self, "luxLevel"));
  }
  else
  {
    v32 = 0;
  }
  if (![(BMCameraCaptureAutoFocusROI *)self hasSubjectDistance]
    || ([(BMCameraCaptureAutoFocusROI *)self subjectDistance], fabs(v8) == INFINITY))
  {
    v10 = 0;
  }
  else
  {
    [(BMCameraCaptureAutoFocusROI *)self subjectDistance];
    v9 = NSNumber;
    [(BMCameraCaptureAutoFocusROI *)self subjectDistance];
    v10 = objc_msgSend(v9, "numberWithDouble:");
  }
  int v11 = objc_msgSend(NSNumber, "numberWithInt:", -[BMCameraCaptureAutoFocusROI clientApplicationIDType](self, "clientApplicationIDType"));
  v34[0] = @"portType";
  uint64_t v12 = v3;
  if (!v3)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v28 = (void *)v12;
  v35[0] = v12;
  v34[1] = @"focusRegionType";
  uint64_t v13 = v4;
  if (!v4)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v27 = (void *)v13;
  v35[1] = v13;
  v34[2] = @"topLeftCornerRow";
  uint64_t v14 = v5;
  if (!v5)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v31 = (void *)v3;
  v26 = (void *)v14;
  v35[2] = v14;
  v34[3] = @"topLeftCornerColumn";
  uint64_t v15 = v6;
  if (!v6)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v30 = (void *)v4;
  v25 = (void *)v15;
  v35[3] = v15;
  v34[4] = @"width";
  unsigned int v16 = (void *)v7;
  if (!v7)
  {
    unsigned int v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v29 = (void *)v5;
  v35[4] = v16;
  v34[5] = @"height";
  unsigned int v17 = v33;
  if (!v33)
  {
    unsigned int v17 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v18 = (void *)v6;
  v35[5] = v17;
  v34[6] = @"luxLevel";
  double v19 = v32;
  if (!v32)
  {
    double v19 = [MEMORY[0x1E4F1CA98] null];
  }
  double v20 = (void *)v7;
  v35[6] = v19;
  v34[7] = @"subjectDistance";
  double v21 = v10;
  if (!v10)
  {
    double v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v35[7] = v21;
  v34[8] = @"clientApplicationIDType";
  int v22 = v11;
  if (!v11)
  {
    int v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v35[8] = v22;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:9];
  if (v11)
  {
    if (v10) {
      goto LABEL_40;
    }
  }
  else
  {

    if (v10) {
      goto LABEL_40;
    }
  }

LABEL_40:
  if (!v32) {

  }
  if (!v33) {
  if (!v20)
  }

  if (!v18) {
  if (v29)
  }
  {
    if (v30) {
      goto LABEL_50;
    }
LABEL_57:

    if (v31) {
      goto LABEL_51;
    }
    goto LABEL_58;
  }

  if (!v30) {
    goto LABEL_57;
  }
LABEL_50:
  if (v31) {
    goto LABEL_51;
  }
LABEL_58:

LABEL_51:

  return v23;
}

- (BMCameraCaptureAutoFocusROI)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v114[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"portType"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"focusRegionType"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v9;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v10 = 0;
            a4 = 0;
            goto LABEL_79;
          }
          v59 = a4;
          id v60 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v61 = *MEMORY[0x1E4F502C8];
          uint64_t v111 = *MEMORY[0x1E4F28568];
          v34 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"focusRegionType"];
          v112 = v34;
          uint64_t v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v112 forKeys:&v111 count:1];
          uint64_t v63 = v61;
          unsigned int v16 = (void *)v62;
          id v64 = (id)[v60 initWithDomain:v63 code:2 userInfo:v62];
          v10 = 0;
          a4 = 0;
          id *v59 = v64;
          goto LABEL_78;
        }
        id v11 = [NSNumber numberWithInt:BMCameraCaptureAutoFocusROIFocusRegionTypeFromString(v9)];
      }
      v10 = v11;
    }
    else
    {
      v10 = 0;
    }
    unsigned int v16 = [v6 objectForKeyedSubscript:@"topLeftCornerRow"];
    v88 = a4;
    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v34 = 0;
LABEL_78:

          goto LABEL_79;
        }
        id v96 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v28 = *MEMORY[0x1E4F502C8];
        uint64_t v109 = *MEMORY[0x1E4F28568];
        v29 = v10;
        id v30 = [NSString alloc];
        uint64_t v75 = objc_opt_class();
        v31 = v30;
        v10 = v29;
        id v94 = (id)[v31 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v75, @"topLeftCornerRow"];
        id v110 = v94;
        v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v110 forKeys:&v109 count:1];
        id v33 = (id)[v96 initWithDomain:v28 code:2 userInfo:v32];
        v34 = 0;
        a4 = 0;
        id *v88 = v33;
LABEL_77:

        goto LABEL_78;
      }
      id v95 = v8;
      unsigned int v17 = self;
      id v93 = v16;
    }
    else
    {
      id v95 = v8;
      unsigned int v17 = self;
      id v93 = 0;
    }
    unsigned int v18 = [v6 objectForKeyedSubscript:@"topLeftCornerColumn"];
    v89 = v16;
    if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v94 = 0;
          v34 = v93;
          v32 = v18;
          self = v17;
          id v8 = v95;
          goto LABEL_77;
        }
        id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v36 = *MEMORY[0x1E4F502C8];
        uint64_t v107 = *MEMORY[0x1E4F28568];
        v37 = v10;
        id v38 = [NSString alloc];
        uint64_t v76 = objc_opt_class();
        v39 = v38;
        v10 = v37;
        v32 = v18;
        id v92 = (id)[v39 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v76, @"topLeftCornerColumn"];
        id v108 = v92;
        uint64_t v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v108 forKeys:&v107 count:1];
        uint64_t v41 = v36;
        unsigned int v16 = v89;
        v90 = (void *)v40;
        id v42 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v41, 2);
        id v94 = 0;
        a4 = 0;
        id *v88 = v42;
        goto LABEL_83;
      }
      v84 = v18;
      id v94 = v18;
    }
    else
    {
      v84 = v18;
      id v94 = 0;
    }
    uint64_t v19 = [v6 objectForKeyedSubscript:@"width"];
    v90 = (void *)v19;
    if (!v19 || (double v20 = (void *)v19, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v92 = 0;
LABEL_25:
      double v21 = [v6 objectForKeyedSubscript:@"height"];
      self = v17;
      v87 = v10;
      if (v21 && (objc_opt_class(), id v8 = v95, (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v91 = 0;
            a4 = 0;
            v32 = v84;
            goto LABEL_75;
          }
          id v52 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v53 = *MEMORY[0x1E4F502C8];
          uint64_t v103 = *MEMORY[0x1E4F28568];
          v54 = self;
          id v55 = [NSString alloc];
          uint64_t v78 = objc_opt_class();
          v56 = v55;
          self = v54;
          id v85 = (id)[v56 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v78, @"height"];
          id v104 = v85;
          int v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v104 forKeys:&v103 count:1];
          v57 = v52;
          unsigned int v16 = v89;
          uint64_t v58 = v53;
          v10 = v87;
          id v91 = 0;
          a4 = 0;
          id *v88 = (id)[v57 initWithDomain:v58 code:2 userInfo:v22];
          goto LABEL_73;
        }
        id v91 = v21;
      }
      else
      {
        id v91 = 0;
      }
      int v22 = [v6 objectForKeyedSubscript:@"luxLevel"];
      v83 = v7;
      if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v85 = 0;
            a4 = 0;
            goto LABEL_73;
          }
          v65 = self;
          id v66 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v86 = *MEMORY[0x1E4F502C8];
          uint64_t v101 = *MEMORY[0x1E4F28568];
          id v25 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"luxLevel"];
          id v102 = v25;
          v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v102 forKeys:&v101 count:1];
          v67 = v66;
          self = v65;
          uint64_t v7 = v83;
          id v68 = (id)[v67 initWithDomain:v86 code:2 userInfo:v23];
          id v85 = 0;
          a4 = 0;
          id *v88 = v68;
LABEL_72:

          v10 = v87;
          unsigned int v16 = v89;
LABEL_73:
          v32 = v84;

          goto LABEL_74;
        }
        id v85 = v22;
      }
      else
      {
        id v85 = 0;
      }
      v23 = [v6 objectForKeyedSubscript:@"subjectDistance"];
      if (v23 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v25 = 0;
            a4 = 0;
            goto LABEL_72;
          }
          v24 = self;
          id v81 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v69 = *MEMORY[0x1E4F502C8];
          uint64_t v99 = *MEMORY[0x1E4F28568];
          v27 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"subjectDistance"];
          v100 = v27;
          v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v100 forKeys:&v99 count:1];
          id v70 = (id)[v81 initWithDomain:v69 code:2 userInfo:v26];
          id v25 = 0;
          a4 = 0;
          id *v88 = v70;
          goto LABEL_71;
        }
        v24 = self;
        id v25 = v23;
      }
      else
      {
        v24 = self;
        id v25 = 0;
      }
      v26 = [v6 objectForKeyedSubscript:@"clientApplicationIDType"];
      if (v26 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v43 = v26;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (a4)
            {
              id v82 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v80 = *MEMORY[0x1E4F502C8];
              uint64_t v97 = *MEMORY[0x1E4F28568];
              v73 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"clientApplicationIDType"];
              v98 = v73;
              v74 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v98 forKeys:&v97 count:1];
              id *v88 = (id)[v82 initWithDomain:v80 code:2 userInfo:v74];
            }
            v27 = 0;
            a4 = 0;
            goto LABEL_71;
          }
          id v43 = [NSNumber numberWithInt:BMCameraCaptureAutoFocusROIClientApplicationIDTypeFromString(v26)];
        }
        v27 = v43;
      }
      else
      {
        v27 = 0;
      }
      uint64_t v71 = [v87 intValue];
      LODWORD(v79) = [v27 intValue];
      a4 = [(BMCameraCaptureAutoFocusROI *)v24 initWithPortType:v95 focusRegionType:v71 topLeftCornerRow:v93 topLeftCornerColumn:v94 width:v92 height:v91 luxLevel:v85 subjectDistance:v25 clientApplicationIDType:v79];
      v24 = (BMCameraCaptureAutoFocusROI *)a4;
LABEL_71:

      self = v24;
      uint64_t v7 = v83;
      goto LABEL_72;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v92 = v20;
      goto LABEL_25;
    }
    if (a4)
    {
      v44 = a4;
      id v45 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v46 = *MEMORY[0x1E4F502C8];
      uint64_t v105 = *MEMORY[0x1E4F28568];
      v47 = v10;
      id v48 = [NSString alloc];
      uint64_t v77 = objc_opt_class();
      v49 = v48;
      v10 = v47;
      id v91 = (id)[v49 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v77, @"width"];
      id v106 = v91;
      double v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v106 forKeys:&v105 count:1];
      uint64_t v50 = v46;
      unsigned int v16 = v89;
      id v51 = (id)[v45 initWithDomain:v50 code:2 userInfo:v21];
      id v92 = 0;
      a4 = 0;
      id *v44 = v51;
      v32 = v84;
      self = v17;
LABEL_74:
      id v8 = v95;
LABEL_75:

LABEL_76:
      v34 = v93;
      goto LABEL_77;
    }
    id v92 = 0;
    v32 = v84;
LABEL_83:
    self = v17;
    id v8 = v95;
    goto LABEL_76;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (a4)
  {
    uint64_t v12 = a4;
    id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v14 = *MEMORY[0x1E4F502C8];
    uint64_t v113 = *MEMORY[0x1E4F28568];
    v10 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"portType"];
    v114[0] = v10;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v114 forKeys:&v113 count:1];
    id v15 = (id)[v13 initWithDomain:v14 code:2 userInfo:v9];
    id v8 = 0;
    a4 = 0;
    *uint64_t v12 = v15;
LABEL_79:

    goto LABEL_80;
  }
  id v8 = 0;
LABEL_80:

  return (BMCameraCaptureAutoFocusROI *)a4;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMCameraCaptureAutoFocusROI *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_portType) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasTopLeftCornerRow) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasTopLeftCornerColumn) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasWidth) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasHeight) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasLuxLevel) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasSubjectDistance) {
    PBDataWriterWriteFloatField();
  }
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v73.receiver = self;
  v73.super_class = (Class)BMCameraCaptureAutoFocusROI;
  uint64_t v5 = [(BMEventBase *)&v73 init];
  if (!v5) {
    goto LABEL_114;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    v9 = (int *)MEMORY[0x1E4F940B8];
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
          portType = v5->_portType;
          v5->_portType = (NSString *)v20;

          continue;
        case 2u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          while (1)
          {
            uint64_t v25 = *v6;
            uint64_t v26 = *(void *)&v4[v25];
            unint64_t v27 = v26 + 1;
            if (v26 == -1 || v27 > *(void *)&v4[*v7]) {
              break;
            }
            char v28 = *(unsigned char *)(*(void *)&v4[*v9] + v26);
            *(void *)&v4[v25] = v27;
            v24 |= (unint64_t)(v28 & 0x7F) << v22;
            if ((v28 & 0x80) == 0) {
              goto LABEL_76;
            }
            v22 += 7;
            BOOL v17 = v23++ >= 9;
            if (v17)
            {
              LODWORD(v24) = 0;
              goto LABEL_78;
            }
          }
          v4[*v8] = 1;
LABEL_76:
          if (v4[*v8]) {
            LODWORD(v24) = 0;
          }
LABEL_78:
          if (v24 >= 5) {
            LODWORD(v24) = 0;
          }
          uint64_t v69 = 28;
          goto LABEL_108;
        case 3u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v31 = 0;
          v5->_hasTopLeftCornerRow = 1;
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
              v31 |= (unint64_t)(v35 & 0x7F) << v29;
              if (v35 < 0)
              {
                v29 += 7;
                BOOL v17 = v30++ >= 9;
                if (v17)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_84;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v31) = 0;
          }
LABEL_84:
          uint64_t v70 = 32;
          goto LABEL_101;
        case 4u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v31 = 0;
          v5->_hasTopLeftCornerColumn = 1;
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
              v31 |= (unint64_t)(v41 & 0x7F) << v36;
              if (v41 < 0)
              {
                v36 += 7;
                BOOL v17 = v37++ >= 9;
                if (v17)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_88;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v31) = 0;
          }
LABEL_88:
          uint64_t v70 = 36;
          goto LABEL_101;
        case 5u:
          char v42 = 0;
          unsigned int v43 = 0;
          uint64_t v31 = 0;
          v5->_hasWidth = 1;
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
              v31 |= (unint64_t)(v47 & 0x7F) << v42;
              if (v47 < 0)
              {
                v42 += 7;
                BOOL v17 = v43++ >= 9;
                if (v17)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_92;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v31) = 0;
          }
LABEL_92:
          uint64_t v70 = 40;
          goto LABEL_101;
        case 6u:
          char v48 = 0;
          unsigned int v49 = 0;
          uint64_t v31 = 0;
          v5->_hasHeight = 1;
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
              v31 |= (unint64_t)(v53 & 0x7F) << v48;
              if (v53 < 0)
              {
                v48 += 7;
                BOOL v17 = v49++ >= 9;
                if (v17)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_96;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v31) = 0;
          }
LABEL_96:
          uint64_t v70 = 44;
          goto LABEL_101;
        case 7u:
          char v54 = 0;
          unsigned int v55 = 0;
          uint64_t v31 = 0;
          v5->_hasLuxLevel = 1;
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
              v31 |= (unint64_t)(v59 & 0x7F) << v54;
              if (v59 < 0)
              {
                v54 += 7;
                BOOL v17 = v55++ >= 9;
                if (v17)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_100;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v31) = 0;
          }
LABEL_100:
          uint64_t v70 = 48;
LABEL_101:
          *(_DWORD *)((char *)&v5->super.super.isa + v70) = v31;
          continue;
        case 8u:
          v5->_hasSubjectDistance = 1;
          uint64_t v60 = *v6;
          unint64_t v61 = *(void *)&v4[v60];
          if (v61 <= 0xFFFFFFFFFFFFFFFBLL && v61 + 4 <= *(void *)&v4[*v7])
          {
            float v62 = *(float *)(*(void *)&v4[*v9] + v61);
            *(void *)&v4[v60] = v61 + 4;
          }
          else
          {
            v4[*v8] = 1;
            float v62 = 0.0;
          }
          v5->_subjectDistance = v62;
          continue;
        case 9u:
          char v63 = 0;
          unsigned int v64 = 0;
          uint64_t v24 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_113;
          }
          continue;
      }
      while (1)
      {
        uint64_t v65 = *v6;
        uint64_t v66 = *(void *)&v4[v65];
        unint64_t v67 = v66 + 1;
        if (v66 == -1 || v67 > *(void *)&v4[*v7]) {
          break;
        }
        char v68 = *(unsigned char *)(*(void *)&v4[*v9] + v66);
        *(void *)&v4[v65] = v67;
        v24 |= (unint64_t)(v68 & 0x7F) << v63;
        if ((v68 & 0x80) == 0) {
          goto LABEL_103;
        }
        v63 += 7;
        BOOL v17 = v64++ >= 9;
        if (v17)
        {
          LODWORD(v24) = 0;
          goto LABEL_105;
        }
      }
      v4[*v8] = 1;
LABEL_103:
      if (v4[*v8]) {
        LODWORD(v24) = 0;
      }
LABEL_105:
      if (v24 >= 0x2F) {
        LODWORD(v24) = 0;
      }
      uint64_t v69 = 52;
LABEL_108:
      *(_DWORD *)((char *)&v5->super.super.isa + v69) = v24;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_113:
  }
    uint64_t v71 = 0;
  else {
LABEL_114:
  }
    uint64_t v71 = v5;

  return v71;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMCameraCaptureAutoFocusROI *)self portType];
  uint64_t v5 = BMCameraCaptureAutoFocusROIFocusRegionTypeAsString([(BMCameraCaptureAutoFocusROI *)self focusRegionType]);
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMCameraCaptureAutoFocusROI topLeftCornerRow](self, "topLeftCornerRow"));
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMCameraCaptureAutoFocusROI topLeftCornerColumn](self, "topLeftCornerColumn"));
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMCameraCaptureAutoFocusROI width](self, "width"));
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMCameraCaptureAutoFocusROI height](self, "height"));
  char v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMCameraCaptureAutoFocusROI luxLevel](self, "luxLevel"));
  unsigned int v11 = NSNumber;
  [(BMCameraCaptureAutoFocusROI *)self subjectDistance];
  unint64_t v12 = objc_msgSend(v11, "numberWithDouble:");
  uint64_t v13 = BMCameraCaptureAutoFocusROIClientApplicationIDTypeAsString([(BMCameraCaptureAutoFocusROI *)self clientApplicationIDType]);
  uint64_t v14 = (void *)[v3 initWithFormat:@"BMCameraCaptureAutoFocusROI with portType: %@, focusRegionType: %@, topLeftCornerRow: %@, topLeftCornerColumn: %@, width: %@, height: %@, luxLevel: %@, subjectDistance: %@, clientApplicationIDType: %@", v4, v5, v6, v7, v8, v9, v10, v12, v13];

  return (NSString *)v14;
}

- (BMCameraCaptureAutoFocusROI)initWithPortType:(id)a3 focusRegionType:(int)a4 topLeftCornerRow:(id)a5 topLeftCornerColumn:(id)a6 width:(id)a7 height:(id)a8 luxLevel:(id)a9 subjectDistance:(id)a10 clientApplicationIDType:(int)a11
{
  id v18 = a3;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  v34.receiver = self;
  v34.super_class = (Class)BMCameraCaptureAutoFocusROI;
  uint64_t v25 = [(BMEventBase *)&v34 init];
  if (v25)
  {
    v25->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v25->_portType, a3);
    v25->_focusRegionType = a4;
    if (v19)
    {
      v25->_hasTopLeftCornerRow = 1;
      unsigned int v26 = [v19 unsignedIntValue];
    }
    else
    {
      unsigned int v26 = 0;
      v25->_hasTopLeftCornerRow = 0;
    }
    v25->_topLeftCornerRow = v26;
    if (v20)
    {
      v25->_hasTopLeftCornerColumn = 1;
      unsigned int v27 = [v20 unsignedIntValue];
    }
    else
    {
      unsigned int v27 = 0;
      v25->_hasTopLeftCornerColumn = 0;
    }
    v25->_topLeftCornerColumn = v27;
    if (v21)
    {
      v25->_hasWidth = 1;
      unsigned int v28 = [v21 unsignedIntValue];
    }
    else
    {
      unsigned int v28 = 0;
      v25->_hasWidth = 0;
    }
    v25->_width = v28;
    if (v22)
    {
      v25->_hasHeight = 1;
      unsigned int v29 = [v22 unsignedIntValue];
    }
    else
    {
      unsigned int v29 = 0;
      v25->_hasHeight = 0;
    }
    v25->_height = v29;
    if (v23)
    {
      v25->_hasLuxLevel = 1;
      unsigned int v30 = [v23 unsignedIntValue];
    }
    else
    {
      unsigned int v30 = 0;
      v25->_hasLuxLevel = 0;
    }
    v25->_luxLevel = v30;
    if (v24)
    {
      v25->_hasSubjectDistance = 1;
      [v24 floatValue];
      double v32 = v31;
    }
    else
    {
      v25->_hasSubjectDistance = 0;
      double v32 = -1.0;
    }
    v25->_subjectDistance = v32;
    v25->_clientApplicationIDType = a11;
  }

  return v25;
}

+ (id)protoFields
{
  v13[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"portType" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"focusRegionType", 2, 4, 0, v2);
  v13[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"topLeftCornerRow" number:3 type:4 subMessageClass:0];
  v13[2] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"topLeftCornerColumn" number:4 type:4 subMessageClass:0];
  v13[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"width" number:5 type:4 subMessageClass:0];
  v13[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"height" number:6 type:4 subMessageClass:0];
  v13[5] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"luxLevel" number:7 type:4 subMessageClass:0];
  v13[6] = v8;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"subjectDistance" number:8 type:1 subMessageClass:0];
  v13[7] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clientApplicationIDType" number:9 type:4 subMessageClass:0];
  v13[8] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:9];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6468;
}

+ (id)columns
{
  v13[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"portType" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"focusRegionType" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"topLeftCornerRow" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"topLeftCornerColumn" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"width" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"height" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:4 convertedType:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"luxLevel" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:4 convertedType:0];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"subjectDistance" dataType:1 requestOnly:0 fieldNumber:8 protoDataType:1 convertedType:0];
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clientApplicationIDType" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:4 convertedType:0];
  v13[0] = v2;
  v13[1] = v3;
  v13[2] = v4;
  v13[3] = v5;
  v13[4] = v6;
  v13[5] = v7;
  v13[6] = v8;
  v13[7] = v9;
  v13[8] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:9];

  return v11;
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
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMCameraCaptureAutoFocusROI alloc] initByReadFrom:v7];
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

@end