@interface RPCCVideoEffect
+ (BOOL)supportsSecureCoding;
+ (NSString)defaultTintColorName;
+ (id)defaultEffect;
+ (id)placeholderEffectFromEffect:(id)a3;
+ (unint64_t)maxUIAddableEffects;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPlaceholder;
- (NSString)effectIdentifier;
- (NSString)intensityName;
- (NSString)name;
- (NSString)symbolImageName;
- (NSString)tintColorName;
- (NSUUID)identifier;
- (RPCCVideoEffect)initWithCoder:(id)a3;
- (RPCCVideoEffect)initWithName:(id)a3 effectIdentifier:(id)a4 symbolImageName:(id)a5 tintColorName:(id)a6 intensityName:(id)a7;
- (RPCCVideoEffect)initWithName:(id)a3 effectIdentifier:(id)a4 symbolImageName:(id)a5 tintColorName:(id)a6 intensityName:(id)a7 identifier:(id)a8;
- (id)_initWithEffect:(id)a3;
- (id)_name;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)settingsURL;
- (id)setupURL;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setSymbolImageName:(id)a3;
@end

@implementation RPCCVideoEffect

+ (unint64_t)maxUIAddableEffects
{
  return 10;
}

+ (id)defaultEffect
{
  v2 = [RPCCVideoEffect alloc];
  v3 = +[RPCCVideoEffect defaultTintColorName];
  v4 = [(RPCCVideoEffect *)v2 initWithName:@"Do Not Disturb" effectIdentifier:@"dnd" symbolImageName:@"moon.fill" tintColorName:v3 intensityName:0];

  return v4;
}

+ (id)placeholderEffectFromEffect:(id)a3
{
  id v3 = a3;
  v4 = [RPCCVideoEffect alloc];
  v5 = [v3 name];
  v6 = [v3 effectIdentifier];
  v7 = [v3 symbolImageName];
  v8 = [v3 tintColorName];
  v9 = [v3 identifier];

  v10 = [(RPCCVideoEffect *)v4 initWithName:v5 effectIdentifier:v6 symbolImageName:v7 tintColorName:v8 intensityName:0 identifier:v9];

  return v10;
}

- (RPCCVideoEffect)initWithName:(id)a3 effectIdentifier:(id)a4 symbolImageName:(id)a5 tintColorName:(id)a6 intensityName:(id)a7
{
  return [(RPCCVideoEffect *)self initWithName:a3 effectIdentifier:a4 symbolImageName:a5 tintColorName:a6 intensityName:a7 identifier:0];
}

- (RPCCVideoEffect)initWithName:(id)a3 effectIdentifier:(id)a4 symbolImageName:(id)a5 tintColorName:(id)a6 intensityName:(id)a7 identifier:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)RPCCVideoEffect;
  v20 = [(RPCCVideoEffect *)&v34 init];
  if (v20)
  {
    v21 = (NSString *)[v14 copy];
    name = v20->_name;
    v20->_name = v21;

    v23 = (NSString *)[v15 copy];
    effectIdentifier = v20->_effectIdentifier;
    v20->_effectIdentifier = v23;

    v25 = (NSString *)[v16 copy];
    symbolImageName = v20->_symbolImageName;
    v20->_symbolImageName = v25;

    v27 = (NSString *)[v17 copy];
    tintColorName = v20->_tintColorName;
    v20->_tintColorName = v27;

    v29 = (NSString *)[v18 copy];
    intensityName = v20->_intensityName;
    v20->_intensityName = v29;

    if (v19) {
      v31 = (NSUUID *)v19;
    }
    else {
      v31 = (NSUUID *)objc_alloc_init((Class)NSUUID);
    }
    identifier = v20->_identifier;
    v20->_identifier = v31;
  }
  return v20;
}

- (id)_initWithEffect:(id)a3
{
  id v4 = a3;
  v5 = [v4 _name];
  v6 = [v4 effectIdentifier];
  v7 = [v4 symbolImageName];
  v8 = [v4 tintColorName];
  v9 = [v4 intensityName];
  v10 = [v4 identifier];

  v11 = [(RPCCVideoEffect *)self initWithName:v5 effectIdentifier:v6 symbolImageName:v7 tintColorName:v8 intensityName:v9 identifier:v10];
  return v11;
}

+ (NSString)defaultTintColorName
{
  return (NSString *)@"systemIndigoColor";
}

- (NSString)name
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:self->_name value:&stru_69FF8 table:0];

  return (NSString *)v4;
}

- (BOOL)isPlaceholder
{
  return 0;
}

- (id)settingsURL
{
  return 0;
}

- (id)setupURL
{
  return 0;
}

- (id)_name
{
  return self->_name;
}

- (unint64_t)hash
{
  id v3 = [(RPCCVideoEffect *)self _name];
  unint64_t v4 = (unint64_t)[v3 hash];
  v5 = [(RPCCVideoEffect *)self effectIdentifier];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  v7 = [(RPCCVideoEffect *)self symbolImageName];
  unint64_t v8 = (unint64_t)[v7 hash];
  v9 = [(RPCCVideoEffect *)self tintColorName];
  unint64_t v10 = v6 ^ v8 ^ (unint64_t)[v9 hash];
  v11 = [(RPCCVideoEffect *)self intensityName];
  unint64_t v12 = (unint64_t)[v11 hash];
  v13 = [(RPCCVideoEffect *)self identifier];
  unint64_t v14 = v10 ^ v12 ^ (unint64_t)[v13 hash];

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (RPCCVideoEffect *)a3;
  if (self == v5)
  {
    unsigned __int8 v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v6 = v5;
      v7 = [(RPCCVideoEffect *)self _name];
      unint64_t v8 = [(RPCCVideoEffect *)v6 _name];
      if (v7 != v8)
      {
        uint64_t v9 = [(RPCCVideoEffect *)self _name];
        if (!v9)
        {
          unsigned __int8 v13 = 0;
          goto LABEL_73;
        }
        unint64_t v10 = (void *)v9;
        v11 = [(RPCCVideoEffect *)v6 _name];
        if (!v11)
        {
          unsigned __int8 v13 = 0;
LABEL_72:

          goto LABEL_73;
        }
        id v3 = [(RPCCVideoEffect *)self _name];
        unint64_t v12 = [(RPCCVideoEffect *)v6 _name];
        if (![v3 isEqual:v12])
        {
          unsigned __int8 v13 = 0;
LABEL_71:

          goto LABEL_72;
        }
        v75 = v10;
        v76 = v12;
        v77 = v3;
        v78 = v11;
      }
      unint64_t v14 = [(RPCCVideoEffect *)self effectIdentifier];
      id v15 = [(RPCCVideoEffect *)v6 effectIdentifier];
      if (v14 != v15)
      {
        uint64_t v16 = [(RPCCVideoEffect *)self effectIdentifier];
        if (v16)
        {
          id v17 = (void *)v16;
          v79 = v14;
          uint64_t v18 = [(RPCCVideoEffect *)v6 effectIdentifier];
          if (v18)
          {
            id v3 = (void *)v18;
            id v19 = [(RPCCVideoEffect *)self effectIdentifier];
            v20 = [(RPCCVideoEffect *)v6 effectIdentifier];
            if ([v19 isEqual:v20])
            {
              v72 = v20;
              v73 = v19;
              v69 = v3;
              v70 = v17;
              goto LABEL_17;
            }
          }
        }
        else
        {
        }
LABEL_69:
        unsigned __int8 v13 = 0;
        goto LABEL_70;
      }
      v79 = v14;
LABEL_17:
      v21 = [(RPCCVideoEffect *)self symbolImageName];
      v22 = [(RPCCVideoEffect *)v6 symbolImageName];
      if (v21 == v22) {
        goto LABEL_25;
      }
      uint64_t v23 = [(RPCCVideoEffect *)self symbolImageName];
      if (v23)
      {
        v71 = (void *)v23;
        uint64_t v24 = [(RPCCVideoEffect *)v6 symbolImageName];
        if (v24)
        {
          v67 = (void *)v24;
          id v3 = [(RPCCVideoEffect *)self symbolImageName];
          v25 = [(RPCCVideoEffect *)v6 symbolImageName];
          if ([v3 isEqual:v25])
          {
            v62 = v25;
            v63 = v3;
LABEL_25:
            v26 = [(RPCCVideoEffect *)self tintColorName];
            v74 = [(RPCCVideoEffect *)v6 tintColorName];
            if (v26 == v74)
            {
              v68 = v22;
              v30 = v21;
LABEL_33:
              uint64_t v31 = [(RPCCVideoEffect *)self intensityName];
              v65 = [(RPCCVideoEffect *)v6 intensityName];
              v66 = (void *)v31;
              if ((void *)v31 == v65)
              {
                v33 = v30;
                goto LABEL_44;
              }
              uint64_t v32 = [(RPCCVideoEffect *)self intensityName];
              v33 = v30;
              if (v32)
              {
                v56 = (void *)v32;
                v60 = v26;
                objc_super v34 = [(RPCCVideoEffect *)v6 intensityName];
                v35 = v66;
                if (v34)
                {
                  id v53 = v34;
                  v36 = [(RPCCVideoEffect *)self intensityName];
                  v37 = [(RPCCVideoEffect *)v6 intensityName];
                  if ([v36 isEqual:v37])
                  {
                    v51 = v37;
                    v52 = v36;
                    v26 = v60;
LABEL_44:
                    v39 = [(RPCCVideoEffect *)self identifier];
                    uint64_t v40 = [(RPCCVideoEffect *)v6 identifier];
                    v54 = v3;
                    v57 = v33;
                    if (v39 == (void *)v40)
                    {

                      unsigned __int8 v13 = 1;
                    }
                    else
                    {
                      v61 = (void *)v40;
                      uint64_t v41 = [(RPCCVideoEffect *)self identifier];
                      if (v41)
                      {
                        v50 = (void *)v41;
                        v42 = [(RPCCVideoEffect *)v6 identifier];
                        if (v42)
                        {
                          v49 = v42;
                          v43 = [(RPCCVideoEffect *)self identifier];
                          v44 = [(RPCCVideoEffect *)v6 identifier];
                          unsigned __int8 v13 = [v43 isEqual:v44];

                          v42 = v49;
                        }
                        else
                        {
                          unsigned __int8 v13 = 0;
                        }
                      }
                      else
                      {

                        unsigned __int8 v13 = 0;
                      }
                    }
                    if (v66 != v65)
                    {
                    }
                    if (v26 != v74)
                    {
                    }
                    if (v57 != v68)
                    {
                    }
                    if (v79 != v15)
                    {
                    }
LABEL_70:
                    id v3 = v77;
                    v11 = v78;
                    unint64_t v10 = v75;
                    unint64_t v12 = v76;
                    if (v7 != v8) {
                      goto LABEL_71;
                    }
LABEL_73:

                    goto LABEL_74;
                  }

                  objc_super v34 = v53;
                  v35 = v66;
                }

                v47 = v74;
                v46 = v60;
              }
              else
              {

                v46 = v26;
                v47 = v74;
              }
              if (v46 != v47)
              {
              }
              v45 = v73;
              if (v33 != v68)
              {
              }
              v38 = v79;
              if (v79 == v15) {
                goto LABEL_67;
              }
LABEL_65:

LABEL_66:
LABEL_67:

              goto LABEL_68;
            }
            uint64_t v27 = [(RPCCVideoEffect *)self tintColorName];
            if (v27)
            {
              v64 = (void *)v27;
              uint64_t v28 = [(RPCCVideoEffect *)v6 tintColorName];
              if (v28)
              {
                v58 = (void *)v28;
                v59 = v26;
                v29 = [(RPCCVideoEffect *)self tintColorName];
                id v3 = [(RPCCVideoEffect *)v6 tintColorName];
                if ([v29 isEqual:v3])
                {
                  v68 = v22;
                  v30 = v21;
                  v55 = v29;
                  v26 = v59;
                  goto LABEL_33;
                }

LABEL_51:
                if (v21 == v22)
                {
                }
                else
                {
                }
                v38 = v79;
                v45 = v73;
                if (v79 == v15) {
                  goto LABEL_67;
                }
                goto LABEL_65;
              }
            }
            goto LABEL_51;
          }
        }
      }

      v38 = v79;
      if (v79 == v15)
      {

LABEL_68:
        goto LABEL_69;
      }

      goto LABEL_66;
    }
    unsigned __int8 v13 = 0;
  }
LABEL_74:

  return v13;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  unint64_t v4 = [(RPCCVideoEffect *)self _name];
  v5 = [(RPCCVideoEffect *)self effectIdentifier];
  unint64_t v6 = [(RPCCVideoEffect *)self symbolImageName];
  v7 = [(RPCCVideoEffect *)self tintColorName];
  unint64_t v8 = [(RPCCVideoEffect *)self intensityName];
  uint64_t v9 = [(RPCCVideoEffect *)self identifier];
  unint64_t v10 = [v9 UUIDString];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; name: %@; effectIdentifier: %@; symbolImageName: %@; tintColorName: %@; intensityName: %@; identifier: %@>",
    v3,
    self,
    v4,
    v5,
    v6,
    v7,
    v8,
  v11 = v10);

  return v11;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  unint64_t v4 = [RPCCMutableVideoEffect alloc];

  return [(RPCCVideoEffect *)v4 _initWithEffect:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPCCVideoEffect)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"effectIdentifier"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"symbolImageName"];
  unint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tintColorName"];
  if ([v4 containsValueForKey:@"intensityName"])
  {
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intensityName"];
  }
  else
  {
    uint64_t v9 = 0;
  }
  if ([v4 containsValueForKey:@"identifier"])
  {
    unint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  }
  else
  {
    unint64_t v10 = 0;
  }
  v11 = [(RPCCVideoEffect *)self initWithName:v5 effectIdentifier:v6 symbolImageName:v7 tintColorName:v8 intensityName:v9 identifier:v10];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(RPCCVideoEffect *)self _name];
  [v4 encodeObject:v5 forKey:@"name"];

  unint64_t v6 = [(RPCCVideoEffect *)self effectIdentifier];
  [v4 encodeObject:v6 forKey:@"effectIdentifier"];

  v7 = [(RPCCVideoEffect *)self symbolImageName];
  [v4 encodeObject:v7 forKey:@"symbolImageName"];

  unint64_t v8 = [(RPCCVideoEffect *)self tintColorName];
  [v4 encodeObject:v8 forKey:@"tintColorName"];

  uint64_t v9 = [(RPCCVideoEffect *)self tintColorName];
  [v4 encodeObject:v9 forKey:@"intensityName"];

  id v10 = [(RPCCVideoEffect *)self identifier];
  [v4 encodeObject:v10 forKey:@"identifier"];
}

- (NSString)effectIdentifier
{
  return self->_effectIdentifier;
}

- (NSString)symbolImageName
{
  return self->_symbolImageName;
}

- (void)setSymbolImageName:(id)a3
{
}

- (NSString)tintColorName
{
  return self->_tintColorName;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)intensityName
{
  return self->_intensityName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_effectIdentifier, 0);
  objc_storeStrong((id *)&self->_intensityName, 0);
  objc_storeStrong((id *)&self->_tintColorName, 0);
  objc_storeStrong((id *)&self->_symbolImageName, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end