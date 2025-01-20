@interface _INPBAppIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAppName;
- (BOOL)hasBundleIdentifier;
- (BOOL)hasBundleVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)appName;
- (NSString)bundleIdentifier;
- (NSString)bundleVersion;
- (_INPBAppIdentifier)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAppName:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBAppIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_appName, 0);
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)appName
{
  return self->_appName;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_appName)
  {
    v4 = [(_INPBAppIdentifier *)self appName];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"appName"];
  }
  if (self->_bundleIdentifier)
  {
    v6 = [(_INPBAppIdentifier *)self bundleIdentifier];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"bundleIdentifier"];
  }
  if (self->_bundleVersion)
  {
    v8 = [(_INPBAppIdentifier *)self bundleVersion];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"bundleVersion"];
  }

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_appName hash];
  NSUInteger v4 = [(NSString *)self->_bundleIdentifier hash] ^ v3;
  return v4 ^ [(NSString *)self->_bundleVersion hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_INPBAppIdentifier *)self appName];
  v6 = [v4 appName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_INPBAppIdentifier *)self appName];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBAppIdentifier *)self appName];
    v10 = [v4 appName];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBAppIdentifier *)self bundleIdentifier];
  v6 = [v4 bundleIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_INPBAppIdentifier *)self bundleIdentifier];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBAppIdentifier *)self bundleIdentifier];
    v15 = [v4 bundleIdentifier];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBAppIdentifier *)self bundleVersion];
  v6 = [v4 bundleVersion];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_INPBAppIdentifier *)self bundleVersion];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_INPBAppIdentifier *)self bundleVersion];
    v20 = [v4 bundleVersion];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBAppIdentifier allocWithZone:](_INPBAppIdentifier, "allocWithZone:") init];
  v6 = (void *)[(NSString *)self->_appName copyWithZone:a3];
  [(_INPBAppIdentifier *)v5 setAppName:v6];

  uint64_t v7 = (void *)[(NSString *)self->_bundleIdentifier copyWithZone:a3];
  [(_INPBAppIdentifier *)v5 setBundleIdentifier:v7];

  v8 = (void *)[(NSString *)self->_bundleVersion copyWithZone:a3];
  [(_INPBAppIdentifier *)v5 setBundleVersion:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBAppIdentifier *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBAppIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBAppIdentifier *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBAppIdentifier *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBAppIdentifier *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(_INPBAppIdentifier *)self appName];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(_INPBAppIdentifier *)self bundleIdentifier];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  id v6 = [(_INPBAppIdentifier *)self bundleVersion];

  uint64_t v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBAppIdentifierReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasBundleVersion
{
  return self->_bundleVersion != 0;
}

- (void)setBundleVersion:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  bundleVersion = self->_bundleVersion;
  self->_bundleVersion = v4;

  MEMORY[0x1F41817F8](v4, bundleVersion);
}

- (BOOL)hasBundleIdentifier
{
  return self->_bundleIdentifier != 0;
}

- (void)setBundleIdentifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = v4;

  MEMORY[0x1F41817F8](v4, bundleIdentifier);
}

- (BOOL)hasAppName
{
  return self->_appName != 0;
}

- (void)setAppName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  appName = self->_appName;
  self->_appName = v4;

  MEMORY[0x1F41817F8](v4, appName);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end