@interface DMFOSUpdate
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsInstallLater;
- (BOOL)isCritical;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSplat;
- (BOOL)restartRequired;
- (DMFOSUpdate)initWithCoder:(id)a3;
- (DMFOSUpdate)initWithProductKey:(id)a3 humanReadableName:(id)a4 productName:(id)a5 version:(id)a6 build:(id)a7 downloadSize:(unint64_t)a8 installSize:(unint64_t)a9 isCritical:(BOOL)a10 restartRequired:(BOOL)a11 allowsInstallLater:(BOOL)a12 isSplat:(BOOL)a13 supplementalBuild:(id)a14 supplementalVersionExtra:(id)a15;
- (NSString)build;
- (NSString)humanReadableName;
- (NSString)productKey;
- (NSString)productName;
- (NSString)supplementalBuild;
- (NSString)supplementalVersionExtra;
- (NSString)version;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)downloadSize;
- (unint64_t)hash;
- (unint64_t)installSize;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DMFOSUpdate

- (DMFOSUpdate)initWithProductKey:(id)a3 humanReadableName:(id)a4 productName:(id)a5 version:(id)a6 build:(id)a7 downloadSize:(unint64_t)a8 installSize:(unint64_t)a9 isCritical:(BOOL)a10 restartRequired:(BOOL)a11 allowsInstallLater:(BOOL)a12 isSplat:(BOOL)a13 supplementalBuild:(id)a14 supplementalVersionExtra:(id)a15
{
  id v43 = a3;
  id v42 = a4;
  id v21 = a5;
  id v22 = a6;
  id v23 = a7;
  id v24 = a14;
  id v25 = a15;
  v44.receiver = self;
  v44.super_class = (Class)DMFOSUpdate;
  v26 = [(DMFOSUpdate *)&v44 init];
  if (v26)
  {
    uint64_t v27 = [v43 copy];
    productKey = v26->_productKey;
    v26->_productKey = (NSString *)v27;

    uint64_t v29 = [v42 copy];
    humanReadableName = v26->_humanReadableName;
    v26->_humanReadableName = (NSString *)v29;

    uint64_t v31 = [v21 copy];
    productName = v26->_productName;
    v26->_productName = (NSString *)v31;

    uint64_t v33 = [v22 copy];
    version = v26->_version;
    v26->_version = (NSString *)v33;

    uint64_t v35 = [v23 copy];
    build = v26->_build;
    v26->_build = (NSString *)v35;

    v26->_downloadSize = a8;
    v26->_installSize = a9;
    v26->_isCritical = a10;
    v26->_restartRequired = a11;
    v26->_allowsInstallLater = a12;
    v26->_isSplat = a13;
    uint64_t v37 = [v24 copy];
    supplementalBuild = v26->_supplementalBuild;
    v26->_supplementalBuild = (NSString *)v37;

    uint64_t v39 = [v25 copy];
    supplementalVersionExtra = v26->_supplementalVersionExtra;
    v26->_supplementalVersionExtra = (NSString *)v39;
  }
  return v26;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v20 = objc_alloc((Class)objc_opt_class());
  v19 = [(DMFOSUpdate *)self productKey];
  v18 = [(DMFOSUpdate *)self humanReadableName];
  v4 = [(DMFOSUpdate *)self productName];
  v5 = [(DMFOSUpdate *)self version];
  v6 = [(DMFOSUpdate *)self build];
  unint64_t v17 = [(DMFOSUpdate *)self downloadSize];
  unint64_t v7 = [(DMFOSUpdate *)self installSize];
  BOOL v8 = [(DMFOSUpdate *)self isCritical];
  BOOL v9 = [(DMFOSUpdate *)self restartRequired];
  BOOL v10 = [(DMFOSUpdate *)self allowsInstallLater];
  BOOL v11 = [(DMFOSUpdate *)self isSplat];
  v12 = [(DMFOSUpdate *)self supplementalBuild];
  v13 = [(DMFOSUpdate *)self supplementalVersionExtra];
  BYTE3(v16) = v11;
  BYTE2(v16) = v10;
  BYTE1(v16) = v9;
  LOBYTE(v16) = v8;
  v14 = objc_msgSend(v20, "initWithProductKey:humanReadableName:productName:version:build:downloadSize:installSize:isCritical:restartRequired:allowsInstallLater:isSplat:supplementalBuild:supplementalVersionExtra:", v19, v18, v4, v5, v6, v17, v7, v16, v12, v13);

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFOSUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)DMFOSUpdate;
  v5 = [(DMFOSUpdate *)&v34 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"productKey"];
    productKey = v5->_productKey;
    v5->_productKey = (NSString *)v7;

    BOOL v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"humanReadableName"];
    humanReadableName = v5->_humanReadableName;
    v5->_humanReadableName = (NSString *)v10;

    v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"productName"];
    productName = v5->_productName;
    v5->_productName = (NSString *)v13;

    v15 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"version"];
    version = v5->_version;
    v5->_version = (NSString *)v16;

    v18 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"build"];
    build = v5->_build;
    v5->_build = (NSString *)v19;

    id v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"downloadSize"];
    v5->_downloadSize = [v21 unsignedIntegerValue];

    id v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installSize"];
    v5->_installSize = [v22 unsignedIntegerValue];

    id v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isCritical"];
    v5->_isCritical = [v23 BOOLValue];

    id v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"restartRequired"];
    v5->_restartRequired = [v24 BOOLValue];

    id v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allowsInstallLater"];
    v5->_allowsInstallLater = [v25 BOOLValue];

    v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isSplat"];
    v5->_isSplat = [v26 BOOLValue];

    uint64_t v27 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"supplementalBuild"];
    supplementalBuild = v5->_supplementalBuild;
    v5->_supplementalBuild = (NSString *)v28;

    v30 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"supplementalVersionExtra"];
    supplementalVersionExtra = v5->_supplementalVersionExtra;
    v5->_supplementalVersionExtra = (NSString *)v31;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DMFOSUpdate *)self productKey];
  [v4 encodeObject:v5 forKey:@"productKey"];

  v6 = [(DMFOSUpdate *)self humanReadableName];
  [v4 encodeObject:v6 forKey:@"humanReadableName"];

  uint64_t v7 = [(DMFOSUpdate *)self productName];
  [v4 encodeObject:v7 forKey:@"productName"];

  BOOL v8 = [(DMFOSUpdate *)self version];
  [v4 encodeObject:v8 forKey:@"version"];

  BOOL v9 = [(DMFOSUpdate *)self build];
  [v4 encodeObject:v9 forKey:@"build"];

  uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DMFOSUpdate downloadSize](self, "downloadSize"));
  [v4 encodeObject:v10 forKey:@"downloadSize"];

  BOOL v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DMFOSUpdate installSize](self, "installSize"));
  [v4 encodeObject:v11 forKey:@"installSize"];

  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[DMFOSUpdate isCritical](self, "isCritical"));
  [v4 encodeObject:v12 forKey:@"isCritical"];

  uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", -[DMFOSUpdate restartRequired](self, "restartRequired"));
  [v4 encodeObject:v13 forKey:@"restartRequired"];

  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[DMFOSUpdate allowsInstallLater](self, "allowsInstallLater"));
  [v4 encodeObject:v14 forKey:@"allowsInstallLater"];

  v15 = objc_msgSend(NSNumber, "numberWithBool:", -[DMFOSUpdate isSplat](self, "isSplat"));
  [v4 encodeObject:v15 forKey:@"isSplat"];

  uint64_t v16 = [(DMFOSUpdate *)self supplementalBuild];
  [v4 encodeObject:v16 forKey:@"supplementalBuild"];

  id v17 = [(DMFOSUpdate *)self supplementalVersionExtra];
  [v4 encodeObject:v17 forKey:@"supplementalVersionExtra"];
}

- (unint64_t)hash
{
  v3 = [(DMFOSUpdate *)self productKey];
  uint64_t v4 = [v3 hash];
  v5 = [(DMFOSUpdate *)self humanReadableName];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = [(DMFOSUpdate *)self productName];
  uint64_t v8 = [v7 hash];
  BOOL v9 = [(DMFOSUpdate *)self version];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  BOOL v11 = [(DMFOSUpdate *)self build];
  uint64_t v12 = [v11 hash];
  unint64_t v13 = v12 ^ [(DMFOSUpdate *)self downloadSize];
  unint64_t v14 = v10 ^ v13 ^ [(DMFOSUpdate *)self installSize];
  uint64_t v15 = [(DMFOSUpdate *)self isCritical];
  uint64_t v16 = v15 ^ [(DMFOSUpdate *)self restartRequired];
  unint64_t v17 = v14 ^ v16 ^ [(DMFOSUpdate *)self allowsInstallLater];
  uint64_t v18 = [(DMFOSUpdate *)self isSplat];
  uint64_t v19 = [(DMFOSUpdate *)self supplementalBuild];
  uint64_t v20 = v18 ^ [v19 hash];
  id v21 = [(DMFOSUpdate *)self supplementalVersionExtra];
  unint64_t v22 = v17 ^ v20 ^ [v21 hash];

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (DMFOSUpdate *)a3;
  if (self == v4)
  {
    BOOL v34 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(DMFOSUpdate *)self productKey];
      uint64_t v7 = [(DMFOSUpdate *)v5 productKey];
      unint64_t v8 = v6;
      unint64_t v9 = v7;
      if (v8 | v9 && (int v10 = [(id)v8 isEqual:v9], (id)v9, (id)v8, !v10))
      {
        BOOL v34 = 0;
      }
      else
      {
        BOOL v11 = [(DMFOSUpdate *)self humanReadableName];
        uint64_t v12 = [(DMFOSUpdate *)v5 humanReadableName];
        unint64_t v13 = v11;
        unint64_t v14 = v12;
        if (v13 | v14
          && (int v15 = [(id)v13 isEqual:v14], (id)v14, (id)v13, !v15))
        {
          BOOL v34 = 0;
        }
        else
        {
          uint64_t v16 = [(DMFOSUpdate *)self productName];
          unint64_t v17 = [(DMFOSUpdate *)v5 productName];
          unint64_t v18 = v16;
          unint64_t v53 = v17;
          if (v18 | v53
            && (int v19 = [(id)v18 isEqual:v53], (id)v53, (id)v18, !v19))
          {
            BOOL v34 = 0;
          }
          else
          {
            unint64_t v50 = v18;
            uint64_t v20 = [(DMFOSUpdate *)self version];
            id v21 = [(DMFOSUpdate *)v5 version];
            id v22 = v20;
            id v51 = v22;
            id v52 = v21;
            if (__PAIR128__((unint64_t)v52, (unint64_t)v22) == 0
              || (int v23 = [v22 isEqual:v52], v52, v22, v23))
            {
              id v24 = [(DMFOSUpdate *)self build];
              id v25 = [(DMFOSUpdate *)v5 build];
              unint64_t v26 = v24;
              unint64_t v48 = v25;
              v49 = (void *)v26;
              if (v26 | v48
                && (int v27 = [(id)v26 isEqual:v48], (id)v48, v49, !v27))
              {
                BOOL v34 = 0;
                unint64_t v18 = v50;
                id v22 = v51;
              }
              else
              {
                unint64_t v28 = [(DMFOSUpdate *)self downloadSize];
                id v22 = v51;
                if (v28 == [(DMFOSUpdate *)v5 downloadSize]
                  && (unint64_t v29 = [(DMFOSUpdate *)self installSize],
                      v29 == [(DMFOSUpdate *)v5 installSize])
                  && (BOOL v30 = [(DMFOSUpdate *)self isCritical],
                      v30 == [(DMFOSUpdate *)v5 isCritical])
                  && (BOOL v31 = [(DMFOSUpdate *)self restartRequired],
                      v31 == [(DMFOSUpdate *)v5 restartRequired])
                  && (BOOL v32 = [(DMFOSUpdate *)self allowsInstallLater],
                      v32 == [(DMFOSUpdate *)v5 allowsInstallLater])
                  && (BOOL v33 = [(DMFOSUpdate *)self isSplat], v33 == [(DMFOSUpdate *)v5 isSplat]))
                {
                  v36 = [(DMFOSUpdate *)self supplementalBuild];
                  uint64_t v37 = [(DMFOSUpdate *)v5 supplementalBuild];
                  unint64_t v38 = v36;
                  unint64_t v39 = v37;
                  v47 = (void *)v39;
                  if (v38 | v39
                    && (v40 = (void *)v39,
                        int v41 = [(id)v38 isEqual:v39],
                        v40,
                        (id)v38,
                        !v41))
                  {
                    BOOL v34 = 0;
                    unint64_t v18 = v50;
                    id v22 = v51;
                  }
                  else
                  {
                    uint64_t v42 = [(DMFOSUpdate *)self supplementalVersionExtra];
                    uint64_t v43 = [(DMFOSUpdate *)v5 supplementalVersionExtra];
                    if (v42 | v43)
                    {
                      uint64_t v44 = v43;
                      char v45 = [(id)v42 isEqual:v43];
                      uint64_t v43 = v44;
                      BOOL v34 = v45;
                    }
                    else
                    {
                      BOOL v34 = 1;
                    }
                    unint64_t v18 = v50;
                    id v22 = v51;

                    unint64_t v38 = v46;
                  }
                }
                else
                {
                  BOOL v34 = 0;
                  unint64_t v18 = v50;
                }
              }
            }
            else
            {
              BOOL v34 = 0;
              unint64_t v18 = v50;
            }
          }
        }
      }
    }
    else
    {
      BOOL v34 = 0;
    }
  }

  return v34;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@:%p {", objc_opt_class(), self];
  uint64_t v4 = [(DMFOSUpdate *)self productKey];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    uint64_t v6 = [(DMFOSUpdate *)self productKey];
    [v3 appendFormat:@"\n\tProduct Key                : “%@”", v6];
  }
  uint64_t v7 = [(DMFOSUpdate *)self humanReadableName];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    unint64_t v9 = [(DMFOSUpdate *)self humanReadableName];
    [v3 appendFormat:@"\n\tHuman Readable Name        : “%@”", v9];
  }
  int v10 = [(DMFOSUpdate *)self productName];
  uint64_t v11 = [v10 length];

  if (v11)
  {
    uint64_t v12 = [(DMFOSUpdate *)self productName];
    [v3 appendFormat:@"\n\tProduct Name               : “%@”", v12];
  }
  unint64_t v13 = [(DMFOSUpdate *)self version];
  uint64_t v14 = [v13 length];

  if (v14)
  {
    int v15 = [(DMFOSUpdate *)self version];
    [v3 appendFormat:@"\n\tVersion                    : “%@”", v15];
  }
  uint64_t v16 = [(DMFOSUpdate *)self build];
  uint64_t v17 = [v16 length];

  if (v17)
  {
    unint64_t v18 = [(DMFOSUpdate *)self build];
    [v3 appendFormat:@"\n\tBuild                      : “%@”", v18];
  }
  objc_msgSend(v3, "appendFormat:", @"\n\tDownload Size              : %lu", -[DMFOSUpdate downloadSize](self, "downloadSize"));
  objc_msgSend(v3, "appendFormat:", @"\n\tInstall Size               : %lu", -[DMFOSUpdate installSize](self, "installSize"));
  if ([(DMFOSUpdate *)self isCritical]) {
    int v19 = @"YES";
  }
  else {
    int v19 = @"NO";
  }
  [v3 appendFormat:@"\n\tIs Critical                : %@", v19];
  if ([(DMFOSUpdate *)self restartRequired]) {
    uint64_t v20 = @"YES";
  }
  else {
    uint64_t v20 = @"NO";
  }
  [v3 appendFormat:@"\n\tRestart Required           : %@", v20];
  if ([(DMFOSUpdate *)self allowsInstallLater]) {
    id v21 = @"YES";
  }
  else {
    id v21 = @"NO";
  }
  [v3 appendFormat:@"\n\tAllows Install Later       : %@", v21];
  if ([(DMFOSUpdate *)self isSplat]) {
    id v22 = @"YES";
  }
  else {
    id v22 = @"NO";
  }
  [v3 appendFormat:@"\n\tIs Splat                   : %@", v22];
  int v23 = [(DMFOSUpdate *)self supplementalBuild];
  uint64_t v24 = [v23 length];

  if (v24)
  {
    id v25 = [(DMFOSUpdate *)self supplementalBuild];
    [v3 appendFormat:@"\n\tSupplemental Build         : “%@”", v25];
  }
  unint64_t v26 = [(DMFOSUpdate *)self supplementalVersionExtra];
  uint64_t v27 = [v26 length];

  if (v27)
  {
    unint64_t v28 = [(DMFOSUpdate *)self supplementalVersionExtra];
    [v3 appendFormat:@"\n\tSupplemental Version Extra : “%@”", v28];
  }
  [v3 appendString:@"\n}>"];
  unint64_t v29 = (void *)[v3 copy];

  return v29;
}

- (NSString)productKey
{
  return self->_productKey;
}

- (NSString)humanReadableName
{
  return self->_humanReadableName;
}

- (NSString)productName
{
  return self->_productName;
}

- (NSString)version
{
  return self->_version;
}

- (NSString)build
{
  return self->_build;
}

- (unint64_t)downloadSize
{
  return self->_downloadSize;
}

- (unint64_t)installSize
{
  return self->_installSize;
}

- (BOOL)isCritical
{
  return self->_isCritical;
}

- (BOOL)restartRequired
{
  return self->_restartRequired;
}

- (BOOL)allowsInstallLater
{
  return self->_allowsInstallLater;
}

- (BOOL)isSplat
{
  return self->_isSplat;
}

- (NSString)supplementalBuild
{
  return self->_supplementalBuild;
}

- (NSString)supplementalVersionExtra
{
  return self->_supplementalVersionExtra;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementalVersionExtra, 0);
  objc_storeStrong((id *)&self->_supplementalBuild, 0);
  objc_storeStrong((id *)&self->_build, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_humanReadableName, 0);
  objc_storeStrong((id *)&self->_productKey, 0);
}

@end