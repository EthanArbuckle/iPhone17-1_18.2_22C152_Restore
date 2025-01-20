@interface LNAction
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)openAppWhenRun;
- (LNAction)actionWithByMergingParameters:(id)a3;
- (LNAction)actionWithNonSecureParameters;
- (LNAction)actionWithOpenWhenRun:(BOOL)a3;
- (LNAction)actionWithParameters:(id)a3;
- (LNAction)actionWithPresentationStyle:(int64_t)a3;
- (LNAction)actionWithURL:(id)a3;
- (LNAction)initWithBSXPCCoder:(id)a3;
- (LNAction)initWithCoder:(id)a3;
- (LNAction)initWithIdentifier:(id)a3;
- (LNAction)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 openAppWhenRun:(BOOL)a5 outputFlags:(id)a6 outputType:(id)a7 parameters:(id)a8;
- (LNAction)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 openAppWhenRun:(BOOL)a5 outputFlags:(id)a6 outputType:(id)a7 systemProtocols:(id)a8 parameters:(id)a9;
- (LNAction)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 openAppWhenRun:(BOOL)a5 outputFlags:(id)a6 systemProtocols:(id)a7 parameters:(id)a8;
- (LNAction)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 openAppWhenRun:(BOOL)a5 parameters:(id)a6;
- (LNAction)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 presentationStyle:(int64_t)a5 parameters:(id)a6;
- (LNAction)initWithIdentifier:(id)a3 parameters:(id)a4;
- (LNAction)initWithIdentifier:(id)a3 presentationStyle:(int64_t)a4 parameters:(id)a5;
- (LNAction)initWithMetadata:(id)a3 bundleIdentifier:(id)a4 parameters:(id)a5;
- (LNAction)initWithMetadata:(id)a3 mangledName:(id)a4 parameters:(id)a5;
- (LNAction)initWithMetadata:(id)a3 mangledTypeName:(id)a4 parameters:(id)a5;
- (LNActionMetadata)metadata;
- (LNValueType)outputType;
- (NSArray)parameters;
- (NSArray)systemProtocols;
- (NSNumber)explicitAuthenticationPolicy;
- (NSNumber)outputFlags;
- (NSString)description;
- (NSString)identifier;
- (NSString)mangledTypeName;
- (NSURL)url;
- (id)_initWithIdentifier:(id)a3 mangledTypeName:(id)a4 openAppWhenRun:(BOOL)a5 explicitAuthenticationPolicy:(id)a6 outputFlags:(id)a7 outputType:(id)a8 systemProtocols:(id)a9 parameters:(id)a10 metadata:(id)a11;
- (id)_initWithIdentifier:(id)a3 mangledTypeName:(id)a4 openAppWhenRun:(BOOL)a5 outputFlags:(id)a6 outputType:(id)a7 systemProtocols:(id)a8 parameters:(id)a9;
- (id)_initWithMetadata:(id)a3 mangledTypeName:(id)a4 parameters:(id)a5;
- (id)authenticationPolicyAllowingImplicit:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)presentationStyle;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateParameterValuesOfValueType:(id)a3 block:(id)a4;
@end

@implementation LNAction

- (LNAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mangledTypeName"];
  unsigned int v25 = [v4 decodeBoolForKey:@"openAppWhenRun"];
  v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"outputFlags"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"outputType"];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"systemProtocols"];
  v11 = (void *)v10;
  v12 = (void *)MEMORY[0x1E4F1CBF0];
  if (v10) {
    v12 = (void *)v10;
  }
  id v13 = v12;

  v14 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = objc_opt_class();
  v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
  v17 = [v4 decodeObjectOfClasses:v16 forKey:@"parameters"];

  v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"explicitAuthenticationPolicy"];
  v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metadata"];
  v20 = 0;
  if (v5 && v17)
  {
    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    v22 = (void *)v26;
    v23 = (LNAction *)[(LNAction *)self _initWithIdentifier:v5 mangledTypeName:v26 openAppWhenRun:v25 explicitAuthenticationPolicy:v18 outputFlags:v27 outputType:v6 systemProtocols:v13 parameters:v17 metadata:v19];
    self = v23;
    if (v23) {
      objc_storeStrong((id *)&v23->_url, v21);
    }

    v20 = self;
  }
  else
  {
    v22 = (void *)v26;
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(LNAction *)self parameters];
  v5 = [(LNAction *)self actionWithParameters:v4];

  return v5;
}

- (LNAction)actionWithParameters:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = [(LNAction *)self identifier];
  v7 = [(LNAction *)self mangledTypeName];
  BOOL v8 = [(LNAction *)self openAppWhenRun];
  v9 = [(LNAction *)self explicitAuthenticationPolicy];
  uint64_t v10 = [(LNAction *)self outputFlags];
  v11 = [(LNAction *)self outputType];
  v12 = [(LNAction *)self systemProtocols];
  id v13 = [(LNAction *)self metadata];
  v14 = (void *)[v5 _initWithIdentifier:v6 mangledTypeName:v7 openAppWhenRun:v8 explicitAuthenticationPolicy:v9 outputFlags:v10 outputType:v11 systemProtocols:v12 parameters:v4 metadata:v13];

  return (LNAction *)v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(LNAction *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(LNAction *)self mangledTypeName];
  [v4 encodeObject:v6 forKey:@"mangledTypeName"];

  objc_msgSend(v4, "encodeBool:forKey:", -[LNAction openAppWhenRun](self, "openAppWhenRun"), @"openAppWhenRun");
  v7 = [(LNAction *)self explicitAuthenticationPolicy];
  [v4 encodeObject:v7 forKey:@"explicitAuthenticationPolicy"];

  BOOL v8 = [(LNAction *)self outputFlags];
  [v4 encodeObject:v8 forKey:@"outputFlags"];

  v9 = [(LNAction *)self outputType];
  [v4 encodeObject:v9 forKey:@"outputType"];

  uint64_t v10 = [(LNAction *)self systemProtocols];
  [v4 encodeObject:v10 forKey:@"systemProtocols"];

  v11 = [(LNAction *)self parameters];
  [v4 encodeObject:v11 forKey:@"parameters"];

  v12 = [(LNAction *)self url];
  [v4 encodeObject:v12 forKey:@"url"];

  id v13 = [(LNAction *)self metadata];
  [v4 encodeObject:v13 forKey:@"metadata"];
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)systemProtocols
{
  return self->_systemProtocols;
}

- (LNValueType)outputType
{
  return self->_outputType;
}

- (NSNumber)outputFlags
{
  return self->_outputFlags;
}

- (BOOL)openAppWhenRun
{
  return self->_openAppWhenRun;
}

- (NSString)mangledTypeName
{
  return self->_mangledTypeName;
}

- (NSNumber)explicitAuthenticationPolicy
{
  return self->_explicitAuthenticationPolicy;
}

- (NSURL)url
{
  return self->_url;
}

- (LNActionMetadata)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explicitAuthenticationPolicy, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_systemProtocols, 0);
  objc_storeStrong((id *)&self->_outputType, 0);
  objc_storeStrong((id *)&self->_outputFlags, 0);
  objc_storeStrong((id *)&self->_mangledTypeName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)enumerateParameterValuesOfValueType:(id)a3 block:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v8 = [(LNAction *)self parameters];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v14 = [v13 value];
        uint64_t v15 = [v14 valueType];
        v16 = [v13 value];
        [v15 enumerateValuesOfValueType:v6 value:v16 block:v7];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNAction *)a3;
  id v5 = v4;
  if (self != v4)
  {
    id v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_64:

      goto LABEL_65;
    }
    id v7 = [(LNAction *)self identifier];
    BOOL v8 = [(LNAction *)v6 identifier];
    id v9 = v7;
    id v10 = v8;
    uint64_t v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      id v13 = v10;
      id v14 = v9;
      if (!v9 || !v10) {
        goto LABEL_62;
      }
      int v15 = [v9 isEqualToString:v10];

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_63:

        goto LABEL_64;
      }
    }
    v16 = [(LNAction *)self mangledTypeName];
    long long v17 = [(LNAction *)v6 mangledTypeName];
    id v14 = v16;
    id v18 = v17;
    id v13 = v18;
    if (v14 == v18)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      long long v19 = v18;
      id v20 = v14;
      if (!v14 || !v18) {
        goto LABEL_61;
      }
      int v21 = [v14 isEqualToString:v18];

      if (!v21) {
        goto LABEL_19;
      }
    }
    BOOL v22 = [(LNAction *)self openAppWhenRun];
    if (v22 != [(LNAction *)v6 openAppWhenRun])
    {
LABEL_19:
      LOBYTE(v12) = 0;
LABEL_62:

      goto LABEL_63;
    }
    v23 = [(LNAction *)self outputFlags];
    v24 = [(LNAction *)v6 outputFlags];
    id v20 = v23;
    id v25 = v24;
    long long v19 = v25;
    id v75 = v20;
    if (v20 == v25)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      uint64_t v26 = v25;
      if (!v20 || !v25) {
        goto LABEL_60;
      }
      LODWORD(v12) = [v20 isEqual:v25];

      if (!v12) {
        goto LABEL_61;
      }
    }
    v74 = v19;
    v27 = [(LNAction *)self outputType];
    v28 = [(LNAction *)v6 outputType];
    id v29 = v27;
    id v30 = v28;
    id v31 = v30;
    id v73 = v29;
    if (v29 != v30)
    {
      LOBYTE(v12) = 0;
      v32 = v30;
      if (v29)
      {
        long long v19 = v74;
        if (v30)
        {
          v33 = v30;
          int v34 = [v29 isEqual:v30];
          id v72 = v33;

          if (!v34)
          {
LABEL_45:
            LOBYTE(v12) = 0;
            goto LABEL_46;
          }
LABEL_32:
          v35 = [(LNAction *)self systemProtocols];
          v36 = [(LNAction *)v6 systemProtocols];

          if (v35 != v36)
          {
            v12 = [(LNAction *)self systemProtocols];
            if (!v12) {
              goto LABEL_46;
            }
            v37 = [(LNAction *)v6 systemProtocols];

            if (!v37) {
              goto LABEL_45;
            }
            v38 = (void *)MEMORY[0x1E4F1CAD0];
            v69 = [(LNAction *)self systemProtocols];
            v39 = [v38 setWithArray:v69];
            v40 = (void *)MEMORY[0x1E4F1CAD0];
            v41 = [(LNAction *)v6 systemProtocols];
            v42 = [v40 setWithArray:v41];
            LODWORD(v66) = [v39 isEqualToSet:v42];

            if (!v66) {
              goto LABEL_45;
            }
          }
          v43 = [(LNAction *)self parameters];
          v44 = [(LNAction *)v6 parameters];

          if (v43 == v44) {
            goto LABEL_40;
          }
          v12 = [(LNAction *)self parameters];
          if (v12)
          {
            v45 = [(LNAction *)v6 parameters];

            if (!v45) {
              goto LABEL_45;
            }
            v46 = (void *)MEMORY[0x1E4F1CAD0];
            v70 = [(LNAction *)self parameters];
            v47 = [v46 setWithArray:v70];
            v48 = (void *)MEMORY[0x1E4F1CAD0];
            v49 = [(LNAction *)v6 parameters];
            v50 = [v48 setWithArray:v49];
            LODWORD(v67) = [v47 isEqualToSet:v50];

            if (!v67) {
              goto LABEL_45;
            }
LABEL_40:
            v51 = [(LNAction *)self url];
            v52 = [(LNAction *)v6 url];
            id v29 = v51;
            id v53 = v52;
            v71 = v53;
            if (v29 == v53)
            {
            }
            else
            {
              LOBYTE(v12) = 0;
              if (!v29)
              {
                v54 = v53;
                id v55 = 0;
                long long v19 = v74;
                goto LABEL_57;
              }
              v54 = v53;
              id v55 = v29;
              long long v19 = v74;
              if (!v53)
              {
LABEL_57:
                v62 = v55;

                goto LABEL_58;
              }
              int v56 = [v29 isEqual:v53];

              if (!v56)
              {
                LOBYTE(v12) = 0;
                long long v19 = v74;
LABEL_58:
                v32 = v71;
                id v31 = v72;
                goto LABEL_59;
              }
            }
            v57 = [(LNAction *)self explicitAuthenticationPolicy];
            v58 = [(LNAction *)v6 explicitAuthenticationPolicy];
            id v59 = v57;
            id v60 = v58;
            v61 = v59;
            v68 = v60;
            if (v59 == v60)
            {
              LOBYTE(v12) = 1;
            }
            else
            {
              LOBYTE(v12) = 0;
              if (v59)
              {
                long long v19 = v74;
                if (v60) {
                  LOBYTE(v12) = [v61 isEqual:v60];
                }
                goto LABEL_55;
              }
            }
            long long v19 = v74;
LABEL_55:

            v54 = v68;
            id v55 = v61;
            goto LABEL_57;
          }
LABEL_46:
          id v20 = v73;
          long long v19 = v74;
          uint64_t v26 = v72;
LABEL_60:

          id v20 = v75;
LABEL_61:

          goto LABEL_62;
        }
      }
      else
      {
        long long v19 = v74;
      }
LABEL_59:
      v63 = v29;
      v64 = v31;

      uint64_t v26 = v64;
      id v20 = v73;
      goto LABEL_60;
    }
    id v72 = v30;

    goto LABEL_32;
  }
  LOBYTE(v12) = 1;
LABEL_65:

  return (char)v12;
}

- (unint64_t)hash
{
  v3 = [(LNAction *)self identifier];
  uint64_t v4 = [v3 hash];
  id v5 = [(LNAction *)self mangledTypeName];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = v6 ^ [(LNAction *)self openAppWhenRun];
  BOOL v8 = [(LNAction *)self outputFlags];
  uint64_t v9 = [v8 hash];
  id v10 = [(LNAction *)self outputType];
  uint64_t v11 = v9 ^ [v10 hash];
  v12 = [(LNAction *)self systemProtocols];
  uint64_t v13 = v7 ^ v11 ^ [v12 hash];
  id v14 = [(LNAction *)self parameters];
  uint64_t v15 = [v14 hash];
  v16 = [(LNAction *)self url];
  uint64_t v17 = v15 ^ [v16 hash];
  id v18 = [(LNAction *)self explicitAuthenticationPolicy];
  unint64_t v19 = v13 ^ v17 ^ [v18 hash];

  return v19;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(LNAction *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  uint64_t v6 = [(LNAction *)self mangledTypeName];
  [v4 encodeObject:v6 forKey:@"mangledTypeName"];

  objc_msgSend(v4, "encodeBool:forKey:", -[LNAction openAppWhenRun](self, "openAppWhenRun"), @"openAppWhenRun");
  uint64_t v7 = [(LNAction *)self explicitAuthenticationPolicy];
  [v4 encodeObject:v7 forKey:@"explicitAuthenticationPolicy"];

  BOOL v8 = [(LNAction *)self outputFlags];
  [v4 encodeObject:v8 forKey:@"outputFlags"];

  uint64_t v9 = [(LNAction *)self outputType];
  [v4 encodeObject:v9 forKey:@"outputType"];

  id v10 = [(LNAction *)self systemProtocols];
  [v4 encodeObject:v10 forKey:@"systemProtocols"];

  uint64_t v11 = [(LNAction *)self parameters];
  [v4 encodeObject:v11 forKey:@"parameters"];

  v12 = [(LNAction *)self url];
  [v4 encodeObject:v12 forKey:@"url"];

  id v13 = [(LNAction *)self metadata];
  [v4 encodeObject:v13 forKey:@"metadata"];
}

- (LNAction)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  BOOL v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mangledTypeName"];
  unsigned int v21 = [v4 decodeBoolForKey:@"openAppWhenRun"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"outputFlags"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"outputType"];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = [v4 decodeCollectionOfClass:v8 containingClass:objc_opt_class() forKey:@"systemProtocols"];
  id v10 = (void *)v9;
  uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
  if (v9) {
    uint64_t v11 = (void *)v9;
  }
  id v12 = v11;

  uint64_t v13 = objc_opt_class();
  id v14 = [v4 decodeCollectionOfClass:v13 containingClass:objc_opt_class() forKey:@"parameters"];
  uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"explicitAuthenticationPolicy"];
  v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metadata"];
  uint64_t v17 = 0;
  if (v5 && v14)
  {
    id v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    unint64_t v19 = (LNAction *)[(LNAction *)self _initWithIdentifier:v5 mangledTypeName:v22 openAppWhenRun:v21 explicitAuthenticationPolicy:v15 outputFlags:v6 outputType:v7 systemProtocols:v12 parameters:v14 metadata:v16];
    self = v19;
    if (v19) {
      objc_storeStrong((id *)&v19->_url, v18);
    }

    uint64_t v17 = self;
  }

  return v17;
}

- (NSString)description
{
  id v20 = NSString;
  v3 = (objc_class *)objc_opt_class();
  unint64_t v19 = NSStringFromClass(v3);
  id v18 = [(LNAction *)self identifier];
  id v4 = [(LNAction *)self mangledTypeName];
  BOOL v5 = [(LNAction *)self openAppWhenRun];
  uint64_t v6 = @"NO";
  if (v5) {
    uint64_t v6 = @"YES";
  }
  v16 = v6;
  uint64_t v7 = [(LNAction *)self outputFlags];
  uint64_t v8 = [(LNAction *)self outputType];
  uint64_t v17 = [(LNAction *)self systemProtocols];
  uint64_t v9 = [v17 valueForKeyPath:@"description"];
  id v10 = [v9 componentsJoinedByString:@", "];
  uint64_t v11 = [(LNAction *)self parameters];
  id v12 = [(LNAction *)self url];
  uint64_t v13 = [(LNAction *)self explicitAuthenticationPolicy];
  id v14 = [v20 stringWithFormat:@"<%@: %p, identifier: %@, mangledTypeName: %@, openAppWhenRun: %@, outputFlags: %@, outputType: %@, systemProtocols: %@, parameters: %@, url: %@, explicitAuthenticationPolicy: %@", v19, self, v18, v4, v16, v7, v8, v10, v11, v12, v13];

  return (NSString *)v14;
}

- (id)authenticationPolicyAllowingImplicit:(BOOL)a3
{
  explicitAuthenticationPolicy = self->_explicitAuthenticationPolicy;
  if (a3 && !explicitAuthenticationPolicy)
  {
    id v4 = [NSNumber numberWithInt:0];
  }
  else
  {
    id v4 = explicitAuthenticationPolicy;
  }
  return v4;
}

- (LNAction)actionWithURL:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(LNAction *)self copy];
  uint64_t v7 = (void *)v6;
  if (v6) {
    objc_storeStrong((id *)(v6 + 16), a3);
  }

  return (LNAction *)v7;
}

- (LNAction)actionWithOpenWhenRun:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  uint64_t v6 = [(LNAction *)self identifier];
  uint64_t v7 = [(LNAction *)self mangledTypeName];
  uint64_t v8 = [(LNAction *)self explicitAuthenticationPolicy];
  uint64_t v9 = [(LNAction *)self outputFlags];
  id v10 = [(LNAction *)self outputType];
  uint64_t v11 = [(LNAction *)self systemProtocols];
  id v12 = [(LNAction *)self parameters];
  uint64_t v13 = [(LNAction *)self metadata];
  id v14 = (void *)[v5 _initWithIdentifier:v6 mangledTypeName:v7 openAppWhenRun:v3 explicitAuthenticationPolicy:v8 outputFlags:v9 outputType:v10 systemProtocols:v11 parameters:v12 metadata:v13];

  return (LNAction *)v14;
}

- (LNAction)actionWithNonSecureParameters
{
  BOOL v3 = [(LNAction *)self parameters];
  id v4 = objc_msgSend(v3, "if_objectsPassingTest:", &__block_literal_global_8141);

  id v5 = [(LNAction *)self actionWithParameters:v4];

  return (LNAction *)v5;
}

uint64_t __41__LNAction_actionWithNonSecureParameters__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v3 = [v2 configuration];
    uint64_t v4 = [v3 isSecure] ^ 1;
  }
  else
  {
    uint64_t v4 = 1;
  }

  return v4;
}

- (LNAction)actionWithByMergingParameters:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v6 = [(LNAction *)self parameters];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v12 = [v11 identifier];
        [v5 setObject:v11 forKeyedSubscript:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v8);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = v4;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v23 + 1) + 8 * j);
        unint64_t v19 = objc_msgSend(v18, "identifier", (void)v23);
        [v5 setObject:v18 forKeyedSubscript:v19];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v15);
  }

  id v20 = [v5 allValues];
  unsigned int v21 = [(LNAction *)self actionWithParameters:v20];

  return (LNAction *)v21;
}

- (LNAction)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 openAppWhenRun:(BOOL)a5 outputFlags:(id)a6 systemProtocols:(id)a7 parameters:(id)a8
{
  return (LNAction *)[(LNAction *)self _initWithIdentifier:a3 mangledTypeName:a4 openAppWhenRun:a5 explicitAuthenticationPolicy:&unk_1EEDCE908 outputFlags:a6 outputType:0 systemProtocols:a7 parameters:a8 metadata:0];
}

- (LNAction)initWithMetadata:(id)a3 mangledName:(id)a4 parameters:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v10 identifier];
  uint64_t v12 = [v10 openAppWhenRun];
  id v13 = [v10 authenticationPolicyAllowingImplicit:0];
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "outputFlags"));
  uint64_t v15 = [v10 outputType];
  uint64_t v16 = [v10 systemProtocols];
  uint64_t v17 = [(LNAction *)self _initWithIdentifier:v11 mangledTypeName:v9 openAppWhenRun:v12 explicitAuthenticationPolicy:v13 outputFlags:v14 outputType:v15 systemProtocols:v16 parameters:v8 metadata:v10];

  return v17;
}

- (id)_initWithIdentifier:(id)a3 mangledTypeName:(id)a4 openAppWhenRun:(BOOL)a5 outputFlags:(id)a6 outputType:(id)a7 systemProtocols:(id)a8 parameters:(id)a9
{
  return [(LNAction *)self _initWithIdentifier:a3 mangledTypeName:a4 openAppWhenRun:a5 explicitAuthenticationPolicy:&unk_1EEDCE908 outputFlags:a6 outputType:a7 systemProtocols:a8 parameters:a9 metadata:0];
}

- (id)_initWithMetadata:(id)a3 mangledTypeName:(id)a4 parameters:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v10 identifier];
  uint64_t v12 = [v10 openAppWhenRun];
  id v13 = [v10 authenticationPolicyAllowingImplicit:0];
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "outputFlags"));
  uint64_t v15 = [v10 outputType];
  uint64_t v16 = [v10 systemProtocols];
  id v17 = [(LNAction *)self _initWithIdentifier:v11 mangledTypeName:v9 openAppWhenRun:v12 explicitAuthenticationPolicy:v13 outputFlags:v14 outputType:v15 systemProtocols:v16 parameters:v8 metadata:v10];

  return v17;
}

- (id)_initWithIdentifier:(id)a3 mangledTypeName:(id)a4 openAppWhenRun:(BOOL)a5 explicitAuthenticationPolicy:(id)a6 outputFlags:(id)a7 outputType:(id)a8 systemProtocols:(id)a9 parameters:(id)a10 metadata:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v37 = a6;
  id v36 = a7;
  id v35 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  v38.receiver = self;
  v38.super_class = (Class)LNAction;
  BOOL v22 = [(LNAction *)&v38 init];
  if (v22)
  {
    uint64_t v23 = [v17 copy];
    identifier = v22->_identifier;
    v22->_identifier = (NSString *)v23;

    uint64_t v25 = [v18 copy];
    mangledTypeName = v22->_mangledTypeName;
    v22->_mangledTypeName = (NSString *)v25;

    v22->_openAppWhenRun = a5;
    objc_storeStrong((id *)&v22->_explicitAuthenticationPolicy, a6);
    objc_storeStrong((id *)&v22->_outputFlags, a7);
    objc_storeStrong((id *)&v22->_outputType, a8);
    uint64_t v27 = [v19 copy];
    systemProtocols = v22->_systemProtocols;
    v22->_systemProtocols = (NSArray *)v27;

    uint64_t v29 = [v20 copy];
    parameters = v22->_parameters;
    v22->_parameters = (NSArray *)v29;

    uint64_t v31 = [v21 copy];
    metadata = v22->_metadata;
    v22->_metadata = (LNActionMetadata *)v31;

    uint64_t v33 = v22;
  }

  return v22;
}

- (LNAction)initWithMetadata:(id)a3 bundleIdentifier:(id)a4 parameters:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v10 identifier];
  uint64_t v12 = [v10 mangledTypeNameForBundleIdentifier:v9];

  uint64_t v13 = [v10 openAppWhenRun];
  uint64_t v14 = [v10 authenticationPolicyAllowingImplicit:0];
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "outputFlags"));
  uint64_t v16 = [v10 outputType];
  id v17 = [v10 systemProtocols];
  id v18 = [(LNAction *)self _initWithIdentifier:v11 mangledTypeName:v12 openAppWhenRun:v13 explicitAuthenticationPolicy:v14 outputFlags:v15 outputType:v16 systemProtocols:v17 parameters:v8 metadata:v10];

  return v18;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (LNAction)actionWithPresentationStyle:(int64_t)a3
{
  return [(LNAction *)self actionWithOpenWhenRun:a3 != 0];
}

- (LNAction)initWithIdentifier:(id)a3
{
  return [(LNAction *)self initWithIdentifier:a3 parameters:MEMORY[0x1E4F1CBF0]];
}

- (LNAction)initWithIdentifier:(id)a3 parameters:(id)a4
{
  return [(LNAction *)self initWithIdentifier:a3 presentationStyle:0 parameters:a4];
}

- (LNAction)initWithIdentifier:(id)a3 presentationStyle:(int64_t)a4 parameters:(id)a5
{
  return [(LNAction *)self initWithIdentifier:a3 mangledTypeName:0 presentationStyle:a4 parameters:a5];
}

- (LNAction)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 presentationStyle:(int64_t)a5 parameters:(id)a6
{
  return [(LNAction *)self initWithIdentifier:a3 mangledTypeName:a4 openAppWhenRun:a5 != 0 parameters:a6];
}

- (LNAction)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 openAppWhenRun:(BOOL)a5 parameters:(id)a6
{
  return [(LNAction *)self initWithIdentifier:a3 mangledTypeName:a4 openAppWhenRun:a5 outputFlags:0 outputType:0 parameters:a6];
}

- (LNAction)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 openAppWhenRun:(BOOL)a5 outputFlags:(id)a6 outputType:(id)a7 parameters:(id)a8
{
  return [(LNAction *)self initWithIdentifier:a3 mangledTypeName:a4 openAppWhenRun:a5 outputFlags:a6 outputType:a7 systemProtocols:MEMORY[0x1E4F1CBF0] parameters:a8];
}

- (LNAction)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 openAppWhenRun:(BOOL)a5 outputFlags:(id)a6 outputType:(id)a7 systemProtocols:(id)a8 parameters:(id)a9
{
  return (LNAction *)[(LNAction *)self _initWithIdentifier:a3 mangledTypeName:a4 openAppWhenRun:a5 explicitAuthenticationPolicy:&unk_1EEDCE908 outputFlags:a6 outputType:a7 systemProtocols:a8 parameters:a9 metadata:0];
}

- (LNAction)initWithMetadata:(id)a3 mangledTypeName:(id)a4 parameters:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v10 identifier];
  uint64_t v12 = [v10 openAppWhenRun];
  uint64_t v13 = [v10 authenticationPolicyAllowingImplicit:0];
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "outputFlags"));
  uint64_t v15 = [v10 outputType];
  uint64_t v16 = [v10 systemProtocols];
  id v17 = [(LNAction *)self _initWithIdentifier:v11 mangledTypeName:v9 openAppWhenRun:v12 explicitAuthenticationPolicy:v13 outputFlags:v14 outputType:v15 systemProtocols:v16 parameters:v8 metadata:v10];

  return v17;
}

- (int64_t)presentationStyle
{
  if ([(LNAction *)self openAppWhenRun]) {
    return 2;
  }
  else {
    return 0;
  }
}

@end