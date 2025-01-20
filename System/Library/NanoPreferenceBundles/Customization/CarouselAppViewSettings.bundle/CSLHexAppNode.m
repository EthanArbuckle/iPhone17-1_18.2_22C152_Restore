@interface CSLHexAppNode
+ (BOOL)supportsSecureCoding;
+ (id)fakeBundle;
+ (id)unarchiveFromDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExactlyEqual:(id)a3;
- (BOOL)moved;
- (BOOL)valid;
- (BOOL)wasReflowed;
- (CSLHexAppNode)init;
- (CSLHexAppNode)initWithBundleIdentifier:(id)a3;
- (CSLHexAppNode)initWithBundleIdentifier:(id)a3 hex:(Hex)a4;
- (CSLHexAppNode)initWithBundleIdentifier:(id)a3 hex:(Hex)a4 placementReason:(unint64_t)a5;
- (CSLHexAppNode)initWithCoder:(id)a3;
- (Hex)hex;
- (Hex)savedHex;
- (NSString)bundleIdentifier;
- (id).cxx_construct;
- (id)archiveToDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)initFromDictionary:(id)a3;
- (unint64_t)allPropertiesHash;
- (unint64_t)directPlacementReason;
- (unint64_t)hash;
- (unint64_t)placementReason;
- (void)commitHexForReason:(unint64_t)a3 isDirect:(BOOL)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setDirectPlacementReason:(unint64_t)a3;
- (void)setHex:(Hex)a3;
- (void)setPlacementReason:(unint64_t)a3;
- (void)setSavedHex:(Hex)a3;
- (void)setWasReflowed:(BOOL)a3;
@end

@implementation CSLHexAppNode

- (CSLHexAppNode)initWithBundleIdentifier:(id)a3 hex:(Hex)a4 placementReason:(unint64_t)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CSLHexAppNode;
  v9 = [(CSLHexAppNode *)&v13 init];
  if (v9)
  {
    v10 = (NSString *)[v8 copy];
    bundleIdentifier = v9->_bundleIdentifier;
    v9->_bundleIdentifier = v10;

    v9->_hex = a4;
    v9->_savedHex = a4;
    v9->_directPlacementReason = a5;
    v9->_placementReason = a5;
  }

  return v9;
}

- (CSLHexAppNode)initWithBundleIdentifier:(id)a3 hex:(Hex)a4
{
  return [(CSLHexAppNode *)self initWithBundleIdentifier:a3 hex:a4 placementReason:0];
}

- (CSLHexAppNode)initWithBundleIdentifier:(id)a3
{
  return [(CSLHexAppNode *)self initWithBundleIdentifier:a3 hex:0 placementReason:0];
}

- (CSLHexAppNode)init
{
  v3 = +[CSLHexAppNode fakeBundle];
  v4 = [(CSLHexAppNode *)self initWithBundleIdentifier:v3 hex:0];

  return v4;
}

- (void)setDirectPlacementReason:(unint64_t)a3
{
  self->_directPlacementReason = a3;
  self->_placementReason = a3;
}

- (BOOL)wasReflowed
{
  return self->_directPlacementReason != self->_placementReason;
}

+ (id)fakeBundle
{
  v2 = +[NSUUID UUID];
  v3 = [v2 UUIDString];
  v4 = +[NSString stringWithFormat:@"com.apple.unknown.%@", v3];

  return v4;
}

- (BOOL)valid
{
  v2 = [(CSLHexAppNode *)self bundleIdentifier];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)commitHexForReason:(unint64_t)a3 isDirect:(BOOL)a4
{
  if (self->_savedHex.q != self->_hex.q || self->_savedHex.r != self->_hex.r)
  {
    self->_savedHex = self->_hex;
    if (a4) {
      self->_directPlacementReason = a3;
    }
    self->_placementReason = a3;
  }
}

- (BOOL)moved
{
  return self->_savedHex.q != self->_hex.q || self->_savedHex.r != self->_hex.r;
}

- (unint64_t)hash
{
  return [(NSString *)self->_bundleIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CSLHexAppNode *)a3;
  if (self == v4)
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      bundleIdentifier = self->_bundleIdentifier;
      v6 = [(CSLHexAppNode *)v4 bundleIdentifier];
      unsigned __int8 v7 = [(NSString *)bundleIdentifier isEqual:v6];
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)allPropertiesHash
{
  id v3 = objc_alloc_init((Class)BSHashBuilder);
  id v4 = [v3 appendObject:self->_bundleIdentifier];
  id v5 = [v3 hash];

  return (unint64_t)v5;
}

- (BOOL)isExactlyEqual:(id)a3
{
  id v4 = a3;
  id v5 = +[BSEqualsBuilder builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  bundleIdentifier = self->_bundleIdentifier;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1CFF0;
  v27[3] = &unk_3CD78;
  id v7 = v4;
  id v28 = v7;
  id v8 = [v5 appendObject:bundleIdentifier counterpart:v27];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1CFF8;
  v25[3] = &unk_3CC08;
  v25[4] = self;
  id v26 = v7;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1D040;
  v23[3] = &unk_3CC08;
  v23[4] = self;
  id v9 = v26;
  id v24 = v9;
  v10 = objc_retainBlock(v23);
  id v11 = objc_msgSend(v5, "appendEqualsBlocks:", v25, v10, 0);

  unint64_t directPlacementReason = self->_directPlacementReason;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1D088;
  v21[3] = &unk_3CBE0;
  id v13 = v9;
  id v22 = v13;
  id v14 = [v5 appendUnsignedInteger:directPlacementReason counterpart:v21];
  unint64_t placementReason = self->_placementReason;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1D090;
  v19[3] = &unk_3CBE0;
  id v16 = v13;
  id v20 = v16;
  id v17 = [v5 appendUnsignedInteger:placementReason counterpart:v19];
  LOBYTE(v13) = [v5 isEqual];

  return (char)v13;
}

- (id)description
{
  id v3 = [(CSLHexAppNode *)self bundleIdentifier];
  id v4 = +[NSString stringWithFormat:@"%@ @ {%d,%d}", v3, self->_hex.q, self->_hex.r];

  return v4;
}

- (id)debugDescription
{
  unsigned int v3 = [(CSLHexAppNode *)self wasReflowed];
  uint64_t v4 = [(CSLHexAppNode *)self bundleIdentifier];
  id v5 = (void *)v4;
  uint64_t q = self->_hex.q;
  unint64_t v7 = self->_placementReason - 1;
  if (v3)
  {
    if (v7 > 6) {
      CFStringRef v8 = @"unknown";
    }
    else {
      CFStringRef v8 = off_3CD98[v7];
    }
    unint64_t v10 = self->_directPlacementReason - 1;
    if (v10 > 6) {
      CFStringRef v11 = @"unknown";
    }
    else {
      CFStringRef v11 = off_3CD98[v10];
    }
    uint64_t v12 = +[NSString stringWithFormat:@"%@ @ {%d,%d} %@(direct:%@)", v4, q, self->_hex.r, v8, v11];
  }
  else
  {
    if (v7 > 6) {
      CFStringRef v9 = @"unknown";
    }
    else {
      CFStringRef v9 = off_3CD98[v7];
    }
    uint64_t v12 = +[NSString stringWithFormat:@"%@ @ {%d,%d} %@", v4, q, self->_hex.r, v9];
  }
  id v13 = (void *)v12;

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (Hex *)objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithBundleIdentifier:hex:placementReason:", self->_bundleIdentifier, *(void *)&self->_hex, self->_directPlacementReason);
  [(Hex *)v4 setPlacementReason:self->_placementReason];
  if (v4) {
    v4[4] = self->_savedHex;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CSLHexAppNode)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Bundle"];
  id v6 = objc_alloc((Class)NSSet);
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  CFStringRef v9 = [v4 decodeObjectOfClasses:v8 forKey:@"Hex"];
  if (!v9)
  {
    CFStringRef v9 = [v4 decodeObjectOfClasses:v8 forKey:@"Position"];
  }
  id v10 = [v4 decodeIntegerForKey:@"DirectReason"];
  id v11 = [v4 decodeIntegerForKey:@"Reason"];
  uint64_t v12 = -[CSLHexAppNode initWithBundleIdentifier:hex:placementReason:](self, "initWithBundleIdentifier:hex:placementReason:", v5, [v9 hex], v10);
  [(CSLHexAppNode *)v12 setPlacementReason:v11];

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(CSLHexAppNode *)self bundleIdentifier];
  [v6 encodeObject:v4 forKey:@"Bundle"];

  id v5 = [[CSLObjCHex alloc] initWithHex:*(void *)&self->_hex];
  [v6 encodeObject:v5 forKey:@"Hex"];
  [v6 encodeInteger:self->_placementReason forKey:@"Reason"];
  [v6 encodeInteger:self->_directPlacementReason forKey:@"DirectReason"];
}

- (id)archiveToDictionary
{
  v12[0] = self->_bundleIdentifier;
  v11[0] = @"Bundle";
  v11[1] = @"Hex";
  unsigned int v3 = +[NSNumber numberWithInt:self->_hex.q];
  v10[0] = v3;
  id v4 = +[NSNumber numberWithInt:self->_hex.r];
  v10[1] = v4;
  id v5 = +[NSArray arrayWithObjects:v10 count:2];
  v12[1] = v5;
  v11[2] = @"DirectReason";
  id v6 = +[NSNumber numberWithUnsignedInteger:self->_directPlacementReason];
  v12[2] = v6;
  v11[3] = @"Reason";
  uint64_t v7 = +[NSNumber numberWithUnsignedInteger:self->_placementReason];
  v12[3] = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];

  return v8;
}

+ (id)unarchiveFromDictionary:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [objc_alloc((Class)objc_opt_class()) initFromDictionary:v3];
  }
  else
  {
    id v5 = cslprf_icon_field_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_2776C();
    }

    id v4 = 0;
  }

  return v4;
}

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "bs_safeStringForKey:", @"Bundle");
  if (v5)
  {
    id v6 = objc_msgSend(v4, "bs_safeArrayForKey:", @"Hex");
    if ([v6 count] == (char *)&def_1AB14 + 2)
    {
      uint64_t v7 = [v6 firstObject];
      uint64_t v8 = objc_opt_class();
      id v9 = v7;
      if (v8)
      {
        if (objc_opt_isKindOfClass()) {
          id v10 = v9;
        }
        else {
          id v10 = 0;
        }
      }
      else
      {
        id v10 = 0;
      }
      uint64_t v12 = v10;

      id v13 = [v6 lastObject];
      uint64_t v14 = objc_opt_class();
      id v15 = v13;
      if (v14)
      {
        if (objc_opt_isKindOfClass()) {
          id v16 = v15;
        }
        else {
          id v16 = 0;
        }
      }
      else
      {
        id v16 = 0;
      }
      id v17 = v16;

      if (v12 && v17)
      {
        unsigned int v26 = [v12 intValue];
        id v18 = [v17 intValue];
        v19 = objc_msgSend(v4, "bs_safeNumberForKey:", @"DirectReason");
        id v20 = [v19 integerValue];

        v21 = objc_msgSend(v4, "bs_safeNumberForKey:", @"Reason");
        id v22 = [v21 integerValue];

        v23 = [(CSLHexAppNode *)self initWithBundleIdentifier:v5 hex:v26 | ((void)v18 << 32) placementReason:v20];
        [(CSLHexAppNode *)v23 setPlacementReason:v22];
        self = v23;
        id v11 = self;
      }
      else
      {
        id v24 = cslprf_icon_field_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          sub_2783C();
        }

        id v11 = 0;
      }
    }
    else
    {
      uint64_t v12 = cslprf_icon_field_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_278A4();
      }
      id v11 = 0;
    }
  }
  else
  {
    id v6 = cslprf_icon_field_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_277D4();
    }
    id v11 = 0;
  }

  return v11;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (Hex)hex
{
  return self->_hex;
}

- (void)setHex:(Hex)a3
{
  self->_hex = a3;
}

- (Hex)savedHex
{
  return self->_savedHex;
}

- (void)setSavedHex:(Hex)a3
{
  self->_savedHex = a3;
}

- (unint64_t)directPlacementReason
{
  return self->_directPlacementReason;
}

- (unint64_t)placementReason
{
  return self->_placementReason;
}

- (void)setPlacementReason:(unint64_t)a3
{
  self->_unint64_t placementReason = a3;
}

- (void)setWasReflowed:(BOOL)a3
{
  self->_wasReflowed = a3;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

@end