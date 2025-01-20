@interface BMDeviceEdgeSelection
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMDeviceEdgeSelection)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMDeviceEdgeSelection)initWithPublicIPPrefix:(id)a3 addressFamily:(id)a4 prefixLength:(id)a5 interfaceType:(id)a6 radioType:(id)a7 radioBand:(id)a8 country:(id)a9 timeZone:(id)a10 geohash:(id)a11;
- (BOOL)hasAddressFamily;
- (BOOL)hasPrefixLength;
- (BOOL)isEqual:(id)a3;
- (NSString)country;
- (NSString)description;
- (NSString)geohash;
- (NSString)interfaceType;
- (NSString)publicIPPrefix;
- (NSString)radioBand;
- (NSString)radioType;
- (NSString)timeZone;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)addressFamily;
- (unsigned)dataVersion;
- (unsigned)prefixLength;
- (void)setHasAddressFamily:(BOOL)a3;
- (void)setHasPrefixLength:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMDeviceEdgeSelection

+ (id)columns
{
  v13[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"publicIPPrefix" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"addressFamily" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"prefixLength" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"interfaceType" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"radioType" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"radioBand" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"country" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"timeZone" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"geohash" dataType:2 requestOnly:0 fieldNumber:9 protoDataType:13 convertedType:0];
  v13[0] = v2;
  v13[1] = v3;
  v13[2] = v4;
  v13[3] = v5;
  v13[4] = v6;
  v13[5] = v7;
  v13[6] = v8;
  v13[7] = v9;
  v13[8] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:9];

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geohash, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_radioBand, 0);
  objc_storeStrong((id *)&self->_radioType, 0);
  objc_storeStrong((id *)&self->_interfaceType, 0);

  objc_storeStrong((id *)&self->_publicIPPrefix, 0);
}

- (NSString)geohash
{
  return self->_geohash;
}

- (NSString)timeZone
{
  return self->_timeZone;
}

- (NSString)country
{
  return self->_country;
}

- (NSString)radioBand
{
  return self->_radioBand;
}

- (NSString)radioType
{
  return self->_radioType;
}

- (NSString)interfaceType
{
  return self->_interfaceType;
}

- (void)setHasPrefixLength:(BOOL)a3
{
  self->_hasPrefixLength = a3;
}

- (BOOL)hasPrefixLength
{
  return self->_hasPrefixLength;
}

- (unsigned)prefixLength
{
  return self->_prefixLength;
}

- (void)setHasAddressFamily:(BOOL)a3
{
  self->_hasAddressFamily = a3;
}

- (BOOL)hasAddressFamily
{
  return self->_hasAddressFamily;
}

- (unsigned)addressFamily
{
  return self->_addressFamily;
}

- (NSString)publicIPPrefix
{
  return self->_publicIPPrefix;
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
    v6 = [(BMDeviceEdgeSelection *)self publicIPPrefix];
    uint64_t v7 = [v5 publicIPPrefix];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMDeviceEdgeSelection *)self publicIPPrefix];
      v10 = [v5 publicIPPrefix];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_35;
      }
    }
    if ([(BMDeviceEdgeSelection *)self hasAddressFamily]
      || [v5 hasAddressFamily])
    {
      if (![(BMDeviceEdgeSelection *)self hasAddressFamily]) {
        goto LABEL_35;
      }
      if (![v5 hasAddressFamily]) {
        goto LABEL_35;
      }
      unsigned int v13 = [(BMDeviceEdgeSelection *)self addressFamily];
      if (v13 != [v5 addressFamily]) {
        goto LABEL_35;
      }
    }
    if ([(BMDeviceEdgeSelection *)self hasPrefixLength]
      || [v5 hasPrefixLength])
    {
      if (![(BMDeviceEdgeSelection *)self hasPrefixLength]) {
        goto LABEL_35;
      }
      if (![v5 hasPrefixLength]) {
        goto LABEL_35;
      }
      unsigned int v14 = [(BMDeviceEdgeSelection *)self prefixLength];
      if (v14 != [v5 prefixLength]) {
        goto LABEL_35;
      }
    }
    v15 = [(BMDeviceEdgeSelection *)self interfaceType];
    uint64_t v16 = [v5 interfaceType];
    if (v15 == (void *)v16)
    {
    }
    else
    {
      v17 = (void *)v16;
      v18 = [(BMDeviceEdgeSelection *)self interfaceType];
      v19 = [v5 interfaceType];
      int v20 = [v18 isEqual:v19];

      if (!v20) {
        goto LABEL_35;
      }
    }
    v21 = [(BMDeviceEdgeSelection *)self radioType];
    uint64_t v22 = [v5 radioType];
    if (v21 == (void *)v22)
    {
    }
    else
    {
      v23 = (void *)v22;
      v24 = [(BMDeviceEdgeSelection *)self radioType];
      v25 = [v5 radioType];
      int v26 = [v24 isEqual:v25];

      if (!v26) {
        goto LABEL_35;
      }
    }
    v27 = [(BMDeviceEdgeSelection *)self radioBand];
    uint64_t v28 = [v5 radioBand];
    if (v27 == (void *)v28)
    {
    }
    else
    {
      v29 = (void *)v28;
      v30 = [(BMDeviceEdgeSelection *)self radioBand];
      v31 = [v5 radioBand];
      int v32 = [v30 isEqual:v31];

      if (!v32) {
        goto LABEL_35;
      }
    }
    v33 = [(BMDeviceEdgeSelection *)self country];
    uint64_t v34 = [v5 country];
    if (v33 == (void *)v34)
    {
    }
    else
    {
      v35 = (void *)v34;
      v36 = [(BMDeviceEdgeSelection *)self country];
      v37 = [v5 country];
      int v38 = [v36 isEqual:v37];

      if (!v38) {
        goto LABEL_35;
      }
    }
    v39 = [(BMDeviceEdgeSelection *)self timeZone];
    uint64_t v40 = [v5 timeZone];
    if (v39 == (void *)v40)
    {
    }
    else
    {
      v41 = (void *)v40;
      v42 = [(BMDeviceEdgeSelection *)self timeZone];
      v43 = [v5 timeZone];
      int v44 = [v42 isEqual:v43];

      if (!v44)
      {
LABEL_35:
        char v12 = 0;
LABEL_36:

        goto LABEL_37;
      }
    }
    v46 = [(BMDeviceEdgeSelection *)self geohash];
    v47 = [v5 geohash];
    if (v46 == v47)
    {
      char v12 = 1;
    }
    else
    {
      v48 = [(BMDeviceEdgeSelection *)self geohash];
      v49 = [v5 geohash];
      char v12 = [v48 isEqual:v49];
    }
    goto LABEL_36;
  }
  char v12 = 0;
LABEL_37:

  return v12;
}

- (id)jsonDictionary
{
  v31[9] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMDeviceEdgeSelection *)self publicIPPrefix];
  if ([(BMDeviceEdgeSelection *)self hasAddressFamily])
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceEdgeSelection addressFamily](self, "addressFamily"));
  }
  else
  {
    uint64_t v4 = 0;
  }
  if ([(BMDeviceEdgeSelection *)self hasPrefixLength])
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceEdgeSelection prefixLength](self, "prefixLength"));
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = [(BMDeviceEdgeSelection *)self interfaceType];
  uint64_t v7 = [(BMDeviceEdgeSelection *)self radioType];
  v29 = [(BMDeviceEdgeSelection *)self radioBand];
  v8 = [(BMDeviceEdgeSelection *)self country];
  v9 = [(BMDeviceEdgeSelection *)self timeZone];
  v10 = [(BMDeviceEdgeSelection *)self geohash];
  v30[0] = @"publicIPPrefix";
  uint64_t v11 = v3;
  if (!v3)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = (void *)v11;
  v31[0] = v11;
  v30[1] = @"addressFamily";
  uint64_t v12 = v4;
  if (!v4)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = (void *)v12;
  v31[1] = v12;
  v30[2] = @"prefixLength";
  uint64_t v13 = v5;
  if (!v5)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v28 = (void *)v3;
  uint64_t v22 = (void *)v13;
  v31[2] = v13;
  v30[3] = @"interfaceType";
  uint64_t v14 = (uint64_t)v6;
  if (!v6)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v27 = (void *)v4;
  v21 = (void *)v14;
  v31[3] = v14;
  v30[4] = @"radioType";
  v15 = v7;
  if (!v7)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  int v26 = (void *)v5;
  v31[4] = v15;
  v30[5] = @"radioBand";
  uint64_t v16 = v29;
  if (!v29)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v31[5] = v16;
  v30[6] = @"country";
  v17 = v8;
  if (!v8)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v31[6] = v17;
  v30[7] = @"timeZone";
  v18 = v9;
  if (!v9)
  {
    v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v31[7] = v18;
  v30[8] = @"geohash";
  v19 = v10;
  if (!v10)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v31[8] = v19;
  id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:9];
  if (v10)
  {
    if (v9) {
      goto LABEL_27;
    }
LABEL_41:

    if (v8) {
      goto LABEL_28;
    }
    goto LABEL_42;
  }

  if (!v9) {
    goto LABEL_41;
  }
LABEL_27:
  if (v8) {
    goto LABEL_28;
  }
LABEL_42:

LABEL_28:
  if (!v29) {

  }
  if (!v7) {
  if (!v6)
  }

  if (v26)
  {
    if (v27) {
      goto LABEL_36;
    }
LABEL_44:

    if (v28) {
      goto LABEL_37;
    }
    goto LABEL_45;
  }

  if (!v27) {
    goto LABEL_44;
  }
LABEL_36:
  if (v28) {
    goto LABEL_37;
  }
LABEL_45:

LABEL_37:

  return v25;
}

- (BMDeviceEdgeSelection)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v90[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"publicIPPrefix"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = 0;
LABEL_4:
    v8 = [v5 objectForKeyedSubscript:@"addressFamily"];
    v66 = a4;
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v9 = 0;
          v23 = 0;
          goto LABEL_36;
        }
        id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
        v33 = a4;
        uint64_t v34 = *MEMORY[0x1E4F502C8];
        uint64_t v87 = *MEMORY[0x1E4F28568];
        id v25 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"addressFamily"];
        v88 = v25;
        uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v88 forKeys:&v87 count:1];
        uint64_t v36 = v34;
        v10 = (void *)v35;
        v23 = 0;
        id v9 = 0;
        id *v33 = (id)[v32 initWithDomain:v36 code:2 userInfo:v35];
        goto LABEL_35;
      }
      id v9 = v8;
    }
    else
    {
      id v9 = 0;
    }
    v10 = [v5 objectForKeyedSubscript:@"prefixLength"];
    v65 = v6;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v66)
        {
          id v25 = 0;
          v23 = 0;
          goto LABEL_35;
        }
        id v24 = v7;
        id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v68 = *MEMORY[0x1E4F502C8];
        uint64_t v85 = *MEMORY[0x1E4F28568];
        id v69 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"prefixLength"];
        id v86 = v69;
        v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
        v23 = 0;
        id v25 = 0;
        id *v66 = (id)[v37 initWithDomain:v68 code:2 userInfo:v27];
LABEL_34:

        id v7 = v24;
        v6 = v65;
LABEL_35:

        goto LABEL_36;
      }
      id v67 = v10;
    }
    else
    {
      id v67 = 0;
    }
    uint64_t v11 = [v5 objectForKeyedSubscript:@"interfaceType"];
    v61 = (void *)v11;
    if (v11 && (uint64_t v12 = (void *)v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id v24 = v7;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v66)
        {
          id v69 = 0;
          v23 = 0;
          id v25 = v67;
          v27 = v12;
          goto LABEL_34;
        }
        id v70 = objc_alloc(MEMORY[0x1E4F28C58]);
        v56 = v10;
        uint64_t v38 = *MEMORY[0x1E4F502C8];
        uint64_t v83 = *MEMORY[0x1E4F28568];
        id v63 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"interfaceType"];
        id v84 = v63;
        int v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v84 forKeys:&v83 count:1];
        uint64_t v39 = v38;
        v10 = v56;
        id v40 = (id)[v70 initWithDomain:v39 code:2 userInfo:v26];
        v23 = 0;
        id v69 = 0;
        id *v66 = v40;
        v27 = v61;
        id v25 = v67;
        goto LABEL_33;
      }
      uint64_t v13 = v8;
      id v69 = v12;
    }
    else
    {
      uint64_t v13 = v8;
      id v69 = 0;
    }
    uint64_t v14 = [v5 objectForKeyedSubscript:@"radioType"];
    v60 = (void *)v14;
    if (v14 && (v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v24 = v7;
        if (!v66)
        {
          id v63 = 0;
          v23 = 0;
          id v25 = v67;
          int v26 = v60;
          v27 = v61;
          v8 = v13;
          goto LABEL_33;
        }
        id v41 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v64 = *MEMORY[0x1E4F502C8];
        uint64_t v81 = *MEMORY[0x1E4F28568];
        id v62 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"radioType"];
        id v82 = v62;
        uint64_t v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
        id v43 = (id)[v41 initWithDomain:v64 code:2 userInfo:v42];
        v23 = 0;
        id v63 = 0;
        id *v66 = v43;
        id v25 = v67;
        v8 = v13;
        uint64_t v16 = (void *)v42;
LABEL_32:

        int v26 = v60;
        v27 = v61;
LABEL_33:

        goto LABEL_34;
      }
      id v63 = v15;
    }
    else
    {
      id v63 = 0;
    }
    [v5 objectForKeyedSubscript:@"radioBand"];
    uint64_t v16 = v8 = v13;
    id v59 = v9;
    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v66)
        {
          id v24 = v7;
          id v62 = 0;
          v23 = 0;
          id v25 = v67;
          goto LABEL_32;
        }
        id v24 = v7;
        id v44 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v45 = *MEMORY[0x1E4F502C8];
        uint64_t v79 = *MEMORY[0x1E4F28568];
        id v58 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"radioBand"];
        id v80 = v58;
        v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v80 forKeys:&v79 count:1];
        v23 = 0;
        id v62 = 0;
        id *v66 = (id)[v44 initWithDomain:v45 code:2 userInfo:v17];
        goto LABEL_82;
      }
      id v62 = v16;
    }
    else
    {
      id v62 = 0;
    }
    v17 = [v5 objectForKeyedSubscript:@"country"];
    v55 = v10;
    id v57 = v7;
    v54 = v16;
    if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v58 = 0;
LABEL_22:
      v18 = [v5 objectForKeyedSubscript:@"timeZone"];
      if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v19 = self;
          if (!v66)
          {
            id v20 = 0;
            v23 = 0;
            goto LABEL_30;
          }
          id v52 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v48 = *MEMORY[0x1E4F502C8];
          uint64_t v75 = *MEMORY[0x1E4F28568];
          id v22 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"timeZone"];
          id v76 = v22;
          v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
          id v49 = (id)[v52 initWithDomain:v48 code:2 userInfo:v21];
          v23 = 0;
          id v20 = 0;
          id *v66 = v49;
          goto LABEL_29;
        }
        v19 = self;
        id v20 = v18;
      }
      else
      {
        v19 = self;
        id v20 = 0;
      }
      v21 = [v5 objectForKeyedSubscript:@"geohash"];
      if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v66)
          {
            id v72 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v53 = *MEMORY[0x1E4F502C8];
            uint64_t v73 = *MEMORY[0x1E4F28568];
            v50 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"geohash"];
            v74 = v50;
            v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
            id *v66 = (id)[v72 initWithDomain:v53 code:2 userInfo:v51];
          }
          id v22 = 0;
          v23 = 0;
          goto LABEL_29;
        }
        id v22 = v21;
      }
      else
      {
        id v22 = 0;
      }
      v23 = [(BMDeviceEdgeSelection *)v19 initWithPublicIPPrefix:v57 addressFamily:v59 prefixLength:v67 interfaceType:v69 radioType:v63 radioBand:v62 country:v58 timeZone:v20 geohash:v22];
      v19 = v23;
LABEL_29:

LABEL_30:
      self = v19;

      v10 = v55;
      id v24 = v57;
      id v25 = v67;
      uint64_t v16 = v54;
LABEL_31:

      id v9 = v59;
      goto LABEL_32;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v58 = v17;
      goto LABEL_22;
    }
    if (v66)
    {
      v19 = self;
      id v46 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v47 = *MEMORY[0x1E4F502C8];
      uint64_t v77 = *MEMORY[0x1E4F28568];
      id v20 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"country"];
      id v78 = v20;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
      v23 = 0;
      id v58 = 0;
      id *v66 = (id)[v46 initWithDomain:v47 code:2 userInfo:v18];
      goto LABEL_30;
    }
    id v24 = v7;
    id v58 = 0;
    v23 = 0;
LABEL_82:
    id v25 = v67;
    goto LABEL_31;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    goto LABEL_4;
  }
  if (!a4)
  {
    v23 = 0;
    id v7 = 0;
    goto LABEL_37;
  }
  id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
  v30 = a4;
  uint64_t v31 = *MEMORY[0x1E4F502C8];
  uint64_t v89 = *MEMORY[0x1E4F28568];
  id v9 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"publicIPPrefix"];
  v90[0] = v9;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v90 forKeys:&v89 count:1];
  v23 = 0;
  id v7 = 0;
  id *v30 = (id)[v29 initWithDomain:v31 code:2 userInfo:v8];
LABEL_36:

LABEL_37:
  return v23;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMDeviceEdgeSelection *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_publicIPPrefix)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasAddressFamily)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasPrefixLength)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_interfaceType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_radioType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_radioBand)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_country)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_timeZone)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_geohash)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BMDeviceEdgeSelection;
  id v5 = [(BMEventBase *)&v36 init];
  if (!v5) {
    goto LABEL_56;
  }
  v6 = (int *)MEMORY[0x1E4F940E8];
  id v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
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
        unint64_t v14 = *(void *)&v4[v13];
        if (v14 == -1 || v14 >= *(void *)&v4[*v7]) {
          break;
        }
        char v15 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v14 + 1;
        v12 |= (unint64_t)(v15 & 0x7F) << v10;
        if ((v15 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        BOOL v16 = v11++ >= 9;
        if (v16)
        {
          unint64_t v12 = 0;
          int v17 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v17 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v17 || (v12 & 7) == 4) {
        break;
      }
      switch((v12 >> 3))
      {
        case 1u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 32;
          goto LABEL_43;
        case 2u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          v5->_hasAddressFamily = 1;
          while (2)
          {
            uint64_t v24 = *v6;
            unint64_t v25 = *(void *)&v4[v24];
            if (v25 == -1 || v25 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v25);
              *(void *)&v4[v24] = v25 + 1;
              v23 |= (unint64_t)(v26 & 0x7F) << v21;
              if (v26 < 0)
              {
                v21 += 7;
                BOOL v16 = v22++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_47;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_47:
          uint64_t v33 = 24;
          goto LABEL_52;
        case 3u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v23 = 0;
          v5->_hasPrefixLength = 1;
          break;
        case 4u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 40;
          goto LABEL_43;
        case 5u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 48;
          goto LABEL_43;
        case 6u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 56;
          goto LABEL_43;
        case 7u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 64;
          goto LABEL_43;
        case 8u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 72;
          goto LABEL_43;
        case 9u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 80;
LABEL_43:
          id v32 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_55;
          }
          continue;
      }
      while (1)
      {
        uint64_t v29 = *v6;
        unint64_t v30 = *(void *)&v4[v29];
        if (v30 == -1 || v30 >= *(void *)&v4[*v7]) {
          break;
        }
        char v31 = *(unsigned char *)(*(void *)&v4[*v9] + v30);
        *(void *)&v4[v29] = v30 + 1;
        v23 |= (unint64_t)(v31 & 0x7F) << v27;
        if ((v31 & 0x80) == 0) {
          goto LABEL_49;
        }
        v27 += 7;
        BOOL v16 = v28++ >= 9;
        if (v16)
        {
          LODWORD(v23) = 0;
          goto LABEL_51;
        }
      }
      v4[*v8] = 1;
LABEL_49:
      if (v4[*v8]) {
        LODWORD(v23) = 0;
      }
LABEL_51:
      uint64_t v33 = 28;
LABEL_52:
      *(_DWORD *)((char *)&v5->super.super.isa + v33) = v23;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_55:
  }
    uint64_t v34 = 0;
  else {
LABEL_56:
  }
    uint64_t v34 = v5;

  return v34;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMDeviceEdgeSelection *)self publicIPPrefix];
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceEdgeSelection addressFamily](self, "addressFamily"));
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceEdgeSelection prefixLength](self, "prefixLength"));
  id v7 = [(BMDeviceEdgeSelection *)self interfaceType];
  v8 = [(BMDeviceEdgeSelection *)self radioType];
  id v9 = [(BMDeviceEdgeSelection *)self radioBand];
  char v10 = [(BMDeviceEdgeSelection *)self country];
  unsigned int v11 = [(BMDeviceEdgeSelection *)self timeZone];
  unint64_t v12 = [(BMDeviceEdgeSelection *)self geohash];
  uint64_t v13 = (void *)[v3 initWithFormat:@"BMDeviceEdgeSelection with publicIPPrefix: %@, addressFamily: %@, prefixLength: %@, interfaceType: %@, radioType: %@, radioBand: %@, country: %@, timeZone: %@, geohash: %@", v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return (NSString *)v13;
}

- (BMDeviceEdgeSelection)initWithPublicIPPrefix:(id)a3 addressFamily:(id)a4 prefixLength:(id)a5 interfaceType:(id)a6 radioType:(id)a7 radioBand:(id)a8 country:(id)a9 timeZone:(id)a10 geohash:(id)a11
{
  id v30 = a3;
  id v18 = a4;
  id v19 = a5;
  id v29 = a6;
  id v28 = a7;
  id v27 = a8;
  id v26 = a9;
  id v25 = a10;
  id v24 = a11;
  v31.receiver = self;
  v31.super_class = (Class)BMDeviceEdgeSelection;
  uint64_t v20 = [(BMEventBase *)&v31 init];
  if (v20)
  {
    v20->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v20->_publicIPPrefix, a3);
    if (v18)
    {
      v20->_hasAddressFamily = 1;
      unsigned int v21 = [v18 unsignedIntValue];
    }
    else
    {
      unsigned int v21 = 0;
      v20->_hasAddressFamily = 0;
    }
    v20->_addressFamily = v21;
    if (v19)
    {
      v20->_hasPrefixLength = 1;
      unsigned int v22 = [v19 unsignedIntValue];
    }
    else
    {
      unsigned int v22 = 0;
      v20->_hasPrefixLength = 0;
    }
    v20->_prefixLength = v22;
    objc_storeStrong((id *)&v20->_interfaceType, a6);
    objc_storeStrong((id *)&v20->_radioType, a7);
    objc_storeStrong((id *)&v20->_radioBand, a8);
    objc_storeStrong((id *)&v20->_country, a9);
    objc_storeStrong((id *)&v20->_timeZone, a10);
    objc_storeStrong((id *)&v20->_geohash, a11);
  }

  return v20;
}

+ (id)protoFields
{
  v13[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"publicIPPrefix" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"addressFamily", 2, 4, 0, v2);
  v13[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"prefixLength" number:3 type:4 subMessageClass:0];
  v13[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"interfaceType" number:4 type:13 subMessageClass:0];
  v13[3] = v5;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"radioType" number:5 type:13 subMessageClass:0];
  v13[4] = v6;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"radioBand" number:6 type:13 subMessageClass:0];
  v13[5] = v7;
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"country" number:7 type:13 subMessageClass:0];
  v13[6] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"timeZone" number:8 type:13 subMessageClass:0];
  v13[7] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"geohash" number:9 type:13 subMessageClass:0];
  v13[8] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:9];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3F78;
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
    id v7 = (void *)[[v5 alloc] initWithData:v6];

    v8 = [[BMDeviceEdgeSelection alloc] initByReadFrom:v7];
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