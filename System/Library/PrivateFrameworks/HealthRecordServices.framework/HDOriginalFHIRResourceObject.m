@interface HDOriginalFHIRResourceObject
+ (BOOL)supportsSecureCoding;
+ (id)resourceObjectWithData:(id)a3 uniquenessChecksum:(id)a4 sourceURL:(id)a5 FHIRVersion:(id)a6 receivedDate:(id)a7 firstSeenDate:(id)a8 extractionHints:(unint64_t)a9 originVersion:(id *)a10 originBuild:(id)a11 country:(id)a12 existingROWID:(id)a13 ingestedOnLocalDevice:(BOOL)a14 error:(id *)a15;
+ (id)resourceObjectWithStaticIdentifier:(id)a3 data:(id)a4 sourceURL:(id)a5 FHIRVersion:(id)a6 receivedDate:(id)a7 firstSeenDate:(id)a8 extractionHints:(unint64_t)a9 originVersion:(id *)a10 originBuild:(id)a11 country:(id)a12 error:(id *)a13;
- (BOOL)ingestedOnLocalDevice;
- (BOOL)isEqual:(id)a3;
- (HDHRSOriginInformation)originInformation;
- (HDOriginalFHIRResourceObject)initWithCoder:(id)a3;
- (HDOriginalFHIRResourceObject)initWithResourceData:(id)a3 receivedDate:(id)a4 firstSeenDate:(id)a5 extractionHints:(unint64_t)a6 originInformation:(id)a7 country:(id)a8 existingROWID:(id)a9 ingestedOnLocalDevice:(BOOL)a10 error:(id *)a11;
- (NSDate)firstSeenDate;
- (NSNumber)existingRowID;
- (NSString)country;
- (id)_initWithResourceIdentifier:(id)a3 JSONObject:(id)a4 uniquenessChecksum:(id)a5 sourceURL:(id)a6 FHIRVersion:(id)a7 receivedDate:(id)a8 firstSeenDate:(id)a9 extractionHints:(unint64_t)a10 originInformation:(id)a11 existingROWID:(id)a12 ingestedOnLocalDevice:(BOOL)a13 country:(id)a14;
- (id)copyWithAlteredData:(id)a3 error:(id *)a4;
- (id)uniquenessChecksum;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDOriginalFHIRResourceObject

- (id)_initWithResourceIdentifier:(id)a3 JSONObject:(id)a4 uniquenessChecksum:(id)a5 sourceURL:(id)a6 FHIRVersion:(id)a7 receivedDate:(id)a8 firstSeenDate:(id)a9 extractionHints:(unint64_t)a10 originInformation:(id)a11 existingROWID:(id)a12 ingestedOnLocalDevice:(BOOL)a13 country:(id)a14
{
  id v18 = a5;
  id v19 = a9;
  id v20 = a11;
  id v21 = a12;
  id v22 = a14;
  v38.receiver = self;
  v38.super_class = (Class)HDOriginalFHIRResourceObject;
  v23 = v19;
  v24 = [(HDFHIRResourceObject *)&v38 _initWithResourceIdentifier:a3 JSONObject:a4 sourceURL:a6 FHIRVersion:a7 receivedDate:a8 extractionHints:a10];
  if (v24)
  {
    uint64_t v25 = [v18 copy];
    v26 = (void *)v24[7];
    v24[7] = v25;

    uint64_t v27 = [v23 copy];
    v28 = (void *)v24[9];
    v24[9] = v27;

    uint64_t v29 = [v20 copy];
    v30 = (void *)v24[10];
    v24[10] = v29;

    uint64_t v31 = [v22 copy];
    v32 = (void *)v24[11];
    v24[11] = v31;

    uint64_t v33 = [v21 copy];
    v34 = (void *)v24[12];
    v24[12] = v33;

    *((unsigned char *)v24 + 64) = a13;
  }

  return v24;
}

- (HDOriginalFHIRResourceObject)initWithResourceData:(id)a3 receivedDate:(id)a4 firstSeenDate:(id)a5 extractionHints:(unint64_t)a6 originInformation:(id)a7 country:(id)a8 existingROWID:(id)a9 ingestedOnLocalDevice:(BOOL)a10 error:(id *)a11
{
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = +[HDFHIRResourceObject resourceObjectWithResourceData:a3 receivedDate:a4 extractionHints:a6 error:a11];
  id v22 = v21;
  if (v21)
  {
    v23 = (void *)[v21 copyAsOriginalResourceObjectWithFirstSeenDate:v17 originInformation:v18 existingRowID:v20 ingestedOnLocalDevice:a10 country:v19];

    self = v23;
    v24 = self;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

+ (id)resourceObjectWithData:(id)a3 uniquenessChecksum:(id)a4 sourceURL:(id)a5 FHIRVersion:(id)a6 receivedDate:(id)a7 firstSeenDate:(id)a8 extractionHints:(unint64_t)a9 originVersion:(id *)a10 originBuild:(id)a11 country:(id)a12 existingROWID:(id)a13 ingestedOnLocalDevice:(BOOL)a14 error:(id *)a15
{
  id v41 = a4;
  id v43 = a7;
  id v42 = a8;
  id v21 = a11;
  id v22 = a12;
  id v23 = a13;
  id v24 = a6;
  id v25 = a5;
  id v26 = a3;
  uint64_t v27 = [[HDFHIRResourceData alloc] initWithData:v26 sourceURL:v25 FHIRVersion:v24];

  v28 = [(HDFHIRResourceData *)v27 JSONDictionaryWithError:a15];
  if (v28)
  {
    uint64_t v29 = [a1 identifierDetectedInJSONObject:v28 error:a15];
    if (v29)
    {
      v30 = [HDHRSOriginInformation alloc];
      $9FE6E10C8CE45DBC9A88DFDEA39A390D v44 = *a10;
      uint64_t v31 = [(HDHRSOriginInformation *)v30 initWithOperatingSystemVersion:&v44 build:v21];
      id v32 = objc_alloc((Class)a1);
      uint64_t v33 = [(HDFHIRResourceData *)v27 sourceURL];
      [(HDFHIRResourceData *)v27 FHIRVersion];
      v34 = id v40 = v21;
      LOBYTE(v39) = a14;
      v35 = v32;
      v36 = v41;
      v37 = (void *)[v35 _initWithResourceIdentifier:v29 JSONObject:v28 uniquenessChecksum:v41 sourceURL:v33 FHIRVersion:v34 receivedDate:v43 firstSeenDate:v42 extractionHints:a9 originInformation:v31 existingROWID:v23 ingestedOnLocalDevice:v39 country:v22];

      id v21 = v40;
    }
    else
    {
      v37 = 0;
      v36 = v41;
    }
  }
  else
  {
    v37 = 0;
    v36 = v41;
  }

  return v37;
}

+ (id)resourceObjectWithStaticIdentifier:(id)a3 data:(id)a4 sourceURL:(id)a5 FHIRVersion:(id)a6 receivedDate:(id)a7 firstSeenDate:(id)a8 extractionHints:(unint64_t)a9 originVersion:(id *)a10 originBuild:(id)a11 country:(id)a12 error:(id *)a13
{
  id v19 = a3;
  id v50 = a7;
  id v51 = a8;
  id v20 = a11;
  id v21 = a12;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = [[HDFHIRResourceData alloc] initWithData:v24 sourceURL:v23 FHIRVersion:v22];

  id v26 = +[HDFHIRJSONObject objectWithResourceData:v25 error:a13];
  uint64_t v27 = v26;
  if (v26)
  {
    v28 = [v26 JSONObject];
    uint64_t v29 = [a1 identifierWithStaticIdentifier:v19 JSONObject:v28 error:a13];

    if (v29)
    {
      v30 = [HDHRSOriginInformation alloc];
      $9FE6E10C8CE45DBC9A88DFDEA39A390D v52 = *a10;
      uint64_t v31 = [(HDHRSOriginInformation *)v30 initWithOperatingSystemVersion:&v52 build:v20];
      id v32 = (objc_class *)a1;
      uint64_t v33 = v31;
      v47 = (void *)v31;
      id v34 = [v32 alloc];
      [v27 JSONObject];
      uint64_t v35 = v49 = v19;
      v36 = [v27 uniquenessChecksum];
      [(HDFHIRResourceData *)v25 sourceURL];
      objc_super v38 = v37 = v21;
      [(HDFHIRResourceData *)v25 FHIRVersion];
      uint64_t v39 = v48 = v20;
      LOBYTE(v46) = 1;
      id v40 = v34;
      uint64_t v41 = v35;
      id v42 = (void *)v35;
      id v43 = v50;
      $9FE6E10C8CE45DBC9A88DFDEA39A390D v44 = (void *)[v40 _initWithResourceIdentifier:v29 JSONObject:v41 uniquenessChecksum:v36 sourceURL:v38 FHIRVersion:v39 receivedDate:v50 firstSeenDate:v51 extractionHints:a9 originInformation:v33 existingROWID:0 ingestedOnLocalDevice:v46 country:v37];

      id v20 = v48;
      id v21 = v37;

      id v19 = v49;
    }
    else
    {
      $9FE6E10C8CE45DBC9A88DFDEA39A390D v44 = 0;
      id v43 = v50;
    }
  }
  else
  {
    $9FE6E10C8CE45DBC9A88DFDEA39A390D v44 = 0;
    id v43 = v50;
  }

  return v44;
}

- (id)copyWithAlteredData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unint64_t v6 = [(HDFHIRResourceObject *)self extractionHints];
  v7 = objc_opt_class();
  staticUniquenessChecksum = self->_staticUniquenessChecksum;
  v9 = [(HDFHIRJSONObject *)self sourceURL];
  v10 = [(HDFHIRJSONObject *)self FHIRVersion];
  v11 = [MEMORY[0x263EFF910] now];
  firstSeenDate = self->_firstSeenDate;
  originInformation = self->_originInformation;
  if (originInformation)
  {
    [(HDHRSOriginInformation *)originInformation operatingSystemVersion];
    originInformation = self->_originInformation;
  }
  else
  {
    memset(v20, 0, sizeof(v20));
  }
  uint64_t v14 = v6 | 0x10;
  v15 = [(HDHRSOriginInformation *)originInformation operatingSystemBuild];
  LOBYTE(v18) = self->_ingestedOnLocalDevice;
  v16 = [v7 resourceObjectWithData:v5 uniquenessChecksum:staticUniquenessChecksum sourceURL:v9 FHIRVersion:v10 receivedDate:v11 firstSeenDate:firstSeenDate extractionHints:v14 originVersion:v20 originBuild:v15 country:self->_country existingROWID:self->_existingRowID ingestedOnLocalDevice:v18 error:a4];

  return v16;
}

- (id)uniquenessChecksum
{
  return self->_staticUniquenessChecksum;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HDOriginalFHIRResourceObject;
  id v4 = a3;
  [(HDFHIRResourceObject *)&v9 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_staticUniquenessChecksum, @"UniquenessChecksum", v9.receiver, v9.super_class);
  id v5 = [(HDOriginalFHIRResourceObject *)self firstSeenDate];
  [v4 encodeObject:v5 forKey:@"FirstSeenDate"];

  unint64_t v6 = [(HDOriginalFHIRResourceObject *)self originInformation];
  [v4 encodeObject:v6 forKey:@"OriginInformation"];

  v7 = [(HDOriginalFHIRResourceObject *)self country];
  [v4 encodeObject:v7 forKey:@"Country"];

  v8 = [(HDOriginalFHIRResourceObject *)self existingRowID];
  [v4 encodeObject:v8 forKey:@"existingRowID"];

  objc_msgSend(v4, "encodeBool:forKey:", -[HDOriginalFHIRResourceObject ingestedOnLocalDevice](self, "ingestedOnLocalDevice"), @"ingestedOnLocalDevice");
}

- (HDOriginalFHIRResourceObject)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UniquenessChecksum"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FirstSeenDate"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"OriginInformation"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Country"];
  if (v5) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  BOOL v10 = v9 || v7 == 0;
  if (!v10 && [v4 containsValueForKey:@"ingestedOnLocalDevice"] && v8)
  {
    v17.receiver = self;
    v17.super_class = (Class)HDOriginalFHIRResourceObject;
    v12 = [(HDFHIRResourceObject *)&v17 initWithCoder:v4];
    v13 = v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_staticUniquenessChecksum, v5);
      objc_storeStrong((id *)&v13->_firstSeenDate, v6);
      objc_storeStrong((id *)&v13->_originInformation, v7);
      objc_storeStrong((id *)&v13->_country, v8);
      uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"existingRowID"];
      existingRowID = v13->_existingRowID;
      v13->_existingRowID = (NSNumber *)v14;

      v13->_ingestedOnLocalDevice = [v4 decodeBoolForKey:@"ingestedOnLocalDevice"];
    }
    self = v13;
    v11 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)HDOriginalFHIRResourceObject;
  unint64_t v3 = [(HDFHIRResourceObject *)&v8 hash];
  uint64_t v4 = [(NSData *)self->_staticUniquenessChecksum hash] ^ v3;
  uint64_t v5 = [(NSDate *)self->_firstSeenDate hash];
  unint64_t v6 = v4 ^ v5 ^ [(HDHRSOriginInformation *)self->_originInformation hash];
  return v6 ^ [(NSNumber *)self->_existingRowID hash] ^ self->_ingestedOnLocalDevice;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (HDOriginalFHIRResourceObject *)a3;
  if (v5 == self)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v45.receiver = self;
      v45.super_class = (Class)HDOriginalFHIRResourceObject;
      if ([(HDFHIRResourceObject *)&v45 isEqual:v5])
      {
        unint64_t v6 = v5;
        staticUniquenessChecksum = self->_staticUniquenessChecksum;
        objc_super v8 = [(HDOriginalFHIRResourceObject *)v6 uniquenessChecksum];
        if (staticUniquenessChecksum != v8)
        {
          uint64_t v9 = [(HDOriginalFHIRResourceObject *)v6 uniquenessChecksum];
          if (!v9)
          {
            BOOL v12 = 0;
            goto LABEL_46;
          }
          unint64_t v3 = (void *)v9;
          BOOL v10 = self->_staticUniquenessChecksum;
          v11 = [(HDOriginalFHIRResourceObject *)v6 uniquenessChecksum];
          if (![(NSData *)v10 isEqual:v11])
          {
            BOOL v12 = 0;
LABEL_45:

            goto LABEL_46;
          }
          $9FE6E10C8CE45DBC9A88DFDEA39A390D v44 = v11;
        }
        firstSeenDate = self->_firstSeenDate;
        uint64_t v14 = [(HDOriginalFHIRResourceObject *)v6 firstSeenDate];
        if (firstSeenDate != v14)
        {
          uint64_t v15 = [(HDOriginalFHIRResourceObject *)v6 firstSeenDate];
          if (!v15)
          {
            BOOL v12 = 0;
            v11 = v44;
            goto LABEL_43;
          }
          id v40 = (void *)v15;
          v16 = self->_firstSeenDate;
          uint64_t v17 = [(HDOriginalFHIRResourceObject *)v6 firstSeenDate];
          uint64_t v18 = v16;
          id v19 = (void *)v17;
          if (([(NSDate *)v18 isEqual:v17] & 1) == 0)
          {

            BOOL v12 = 0;
            v11 = v44;
            if (staticUniquenessChecksum == v8) {
              goto LABEL_46;
            }
            goto LABEL_45;
          }
          uint64_t v41 = v19;
        }
        originInformation = self->_originInformation;
        [(HDOriginalFHIRResourceObject *)v6 originInformation];
        v43 = uint64_t v39 = originInformation;
        if (originInformation == (HDHRSOriginInformation *)v43)
        {
          objc_super v38 = v3;
        }
        else
        {
          uint64_t v21 = [(HDOriginalFHIRResourceObject *)v6 originInformation];
          if (!v21)
          {
            BOOL v12 = 0;
            v28 = v41;
            id v23 = firstSeenDate;
            v11 = v44;
LABEL_36:
            v30 = (void *)v43;
            goto LABEL_37;
          }
          id v37 = (void *)v21;
          id v22 = self->_originInformation;
          v36 = [(HDOriginalFHIRResourceObject *)v6 originInformation];
          if (!-[HDHRSOriginInformation isEqual:](v22, "isEqual:"))
          {
            BOOL v12 = 0;
            v28 = v41;
            v30 = (void *)v43;
            id v23 = firstSeenDate;
            v11 = v44;
            goto LABEL_40;
          }
          objc_super v38 = v3;
        }
        id v23 = firstSeenDate;
        existingRowID = self->_existingRowID;
        id v25 = [(HDOriginalFHIRResourceObject *)v6 existingRowID];
        if (existingRowID != v25)
        {
          uint64_t v26 = [(HDOriginalFHIRResourceObject *)v6 existingRowID];
          if (!v26)
          {

            BOOL v12 = 0;
            v30 = (void *)v43;
            v11 = v44;
            unint64_t v3 = v38;
            v28 = v41;
            if (v39 == (HDHRSOriginInformation *)v43) {
              goto LABEL_37;
            }
LABEL_35:

            goto LABEL_36;
          }
          id v34 = (void *)v26;
          uint64_t v27 = self->_existingRowID;
          uint64_t v33 = [(HDOriginalFHIRResourceObject *)v6 existingRowID];
          if (!-[NSNumber isEqual:](v27, "isEqual:"))
          {
            uint64_t v35 = v23;
            BOOL v12 = 0;
            unint64_t v3 = v38;
            goto LABEL_31;
          }
        }
        unint64_t v3 = v38;
        BOOL ingestedOnLocalDevice = self->_ingestedOnLocalDevice;
        BOOL v12 = ingestedOnLocalDevice == [(HDOriginalFHIRResourceObject *)v6 ingestedOnLocalDevice];
        if (existingRowID != v25)
        {
          uint64_t v35 = v23;
LABEL_31:

          v30 = (void *)v43;
          v11 = v44;
          v28 = v41;
          id v23 = v35;
          if (v39 == (HDHRSOriginInformation *)v43)
          {
LABEL_37:

            if (v23 != v14)
            {

LABEL_42:
            }
LABEL_43:

            goto LABEL_44;
          }
          goto LABEL_35;
        }

        v30 = (void *)v43;
        v11 = v44;
        v28 = v41;
        if (v39 == (HDHRSOriginInformation *)v43) {
          goto LABEL_37;
        }
LABEL_40:
        id v42 = v28;
        uint64_t v31 = v30;

        if (v23 == v14)
        {

LABEL_44:
          if (staticUniquenessChecksum != v8) {
            goto LABEL_45;
          }
LABEL_46:

          goto LABEL_47;
        }

        goto LABEL_42;
      }
    }
    BOOL v12 = 0;
  }
LABEL_47:

  return v12;
}

- (NSDate)firstSeenDate
{
  return self->_firstSeenDate;
}

- (HDHRSOriginInformation)originInformation
{
  return self->_originInformation;
}

- (NSString)country
{
  return self->_country;
}

- (NSNumber)existingRowID
{
  return self->_existingRowID;
}

- (BOOL)ingestedOnLocalDevice
{
  return self->_ingestedOnLocalDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingRowID, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_originInformation, 0);
  objc_storeStrong((id *)&self->_firstSeenDate, 0);

  objc_storeStrong((id *)&self->_staticUniquenessChecksum, 0);
}

@end