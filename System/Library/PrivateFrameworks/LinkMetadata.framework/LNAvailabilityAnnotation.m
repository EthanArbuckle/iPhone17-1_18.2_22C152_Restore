@interface LNAvailabilityAnnotation
+ (BOOL)supportsSecureCoding;
+ (id)available;
+ (id)deprecated;
+ (id)unavailable;
- (BOOL)isEqual:(id)a3;
- (LNAvailabilityAnnotation)initWithCoder:(id)a3;
- (LNAvailabilityAnnotation)initWithIntroducedVersion:(id)a3 deprecatedVersion:(id)a4 available:(BOOL)a5 deprecated:(BOOL)a6;
- (LNAvailabilityAnnotation)initWithIntroducedVersion:(id)a3 deprecatedVersion:(id)a4 obsoletedVersion:(id)a5;
- (NSString)deprecatedVersion;
- (NSString)introducedVersion;
- (NSString)obsoletedVersion;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNAvailabilityAnnotation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_obsoletedVersion, 0);
  objc_storeStrong((id *)&self->_deprecatedVersion, 0);
  objc_storeStrong((id *)&self->_introducedVersion, 0);
}

- (LNAvailabilityAnnotation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"introducedVersion"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deprecatedVersion"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"obsoletedVersion"];

  v8 = [(LNAvailabilityAnnotation *)self initWithIntroducedVersion:v5 deprecatedVersion:v6 obsoletedVersion:v7];
  return v8;
}

- (LNAvailabilityAnnotation)initWithIntroducedVersion:(id)a3 deprecatedVersion:(id)a4 obsoletedVersion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)LNAvailabilityAnnotation;
  v11 = [(LNAvailabilityAnnotation *)&v20 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    introducedVersion = v11->_introducedVersion;
    v11->_introducedVersion = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    deprecatedVersion = v11->_deprecatedVersion;
    v11->_deprecatedVersion = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    obsoletedVersion = v11->_obsoletedVersion;
    v11->_obsoletedVersion = (NSString *)v16;

    v18 = v11;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNAvailabilityAnnotation *)self introducedVersion];
  [v4 encodeObject:v5 forKey:@"introducedVersion"];

  v6 = [(LNAvailabilityAnnotation *)self deprecatedVersion];
  [v4 encodeObject:v6 forKey:@"deprecatedVersion"];

  id v7 = [(LNAvailabilityAnnotation *)self obsoletedVersion];
  [v4 encodeObject:v7 forKey:@"obsoletedVersion"];
}

- (NSString)introducedVersion
{
  return self->_introducedVersion;
}

- (NSString)obsoletedVersion
{
  return self->_obsoletedVersion;
}

- (NSString)deprecatedVersion
{
  return self->_deprecatedVersion;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNAvailabilityAnnotation *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_27:

      goto LABEL_28;
    }
    id v7 = [(LNAvailabilityAnnotation *)self introducedVersion];
    id v8 = [(LNAvailabilityAnnotation *)v6 introducedVersion];
    id v9 = v7;
    id v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      id v14 = v9;
      if (!v9 || !v10) {
        goto LABEL_25;
      }
      int v15 = [v9 isEqualToString:v10];

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_26:

        goto LABEL_27;
      }
    }
    uint64_t v16 = [(LNAvailabilityAnnotation *)self deprecatedVersion];
    v17 = [(LNAvailabilityAnnotation *)v6 deprecatedVersion];
    id v14 = v16;
    id v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      id v20 = v14;
      if (!v14 || !v18)
      {
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      int v12 = [v14 isEqualToString:v18];

      if (!v12) {
        goto LABEL_25;
      }
    }
    v21 = [(LNAvailabilityAnnotation *)self obsoletedVersion];
    v22 = [(LNAvailabilityAnnotation *)v6 obsoletedVersion];
    id v20 = v21;
    id v23 = v22;
    v19 = v23;
    if (v20 == v23)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v20 && v23) {
        LOBYTE(v12) = [v20 isEqualToString:v23];
      }
    }

    goto LABEL_24;
  }
  LOBYTE(v12) = 1;
LABEL_28:

  return v12;
}

- (unint64_t)hash
{
  v3 = [(LNAvailabilityAnnotation *)self introducedVersion];
  uint64_t v4 = [v3 hash];
  v5 = [(LNAvailabilityAnnotation *)self deprecatedVersion];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(LNAvailabilityAnnotation *)self obsoletedVersion];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(LNAvailabilityAnnotation *)self introducedVersion];
  id v7 = [(LNAvailabilityAnnotation *)self deprecatedVersion];
  unint64_t v8 = [(LNAvailabilityAnnotation *)self obsoletedVersion];
  id v9 = [v3 stringWithFormat:@"<%@: %p, introduced: %@, deprecated: %@, obsoleted: %@>", v5, self, v6, v7, v8];

  return v9;
}

+ (id)unavailable
{
  v2 = (void *)[objc_alloc((Class)a1) initWithIntroducedVersion:0 deprecatedVersion:0 obsoletedVersion:@"*"];
  return v2;
}

+ (id)deprecated
{
  v2 = (void *)[objc_alloc((Class)a1) initWithIntroducedVersion:0 deprecatedVersion:@"*" obsoletedVersion:0];
  return v2;
}

+ (id)available
{
  v2 = (void *)[objc_alloc((Class)a1) initWithIntroducedVersion:@"*" deprecatedVersion:0 obsoletedVersion:0];
  return v2;
}

- (LNAvailabilityAnnotation)initWithIntroducedVersion:(id)a3 deprecatedVersion:(id)a4 available:(BOOL)a5 deprecated:(BOOL)a6
{
  return -[LNAvailabilityAnnotation initWithIntroducedVersion:deprecatedVersion:obsoletedVersion:](self, "initWithIntroducedVersion:deprecatedVersion:obsoletedVersion:", a3, a4, 0, a6);
}

@end