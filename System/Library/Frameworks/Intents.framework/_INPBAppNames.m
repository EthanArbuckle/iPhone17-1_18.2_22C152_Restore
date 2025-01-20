@interface _INPBAppNames
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAppName;
- (BOOL)hasAxSpokenName;
- (BOOL)hasDisplayName;
- (BOOL)hasSpotlightName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)appName;
- (NSString)axSpokenName;
- (NSString)displayName;
- (NSString)spotlightName;
- (_INPBAppNames)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAppName:(id)a3;
- (void)setAxSpokenName:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setSpotlightName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBAppNames

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_axSpokenName, 0);

  objc_storeStrong((id *)&self->_appName, 0);
}

- (NSString)spotlightName
{
  return self->_spotlightName;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)axSpokenName
{
  return self->_axSpokenName;
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
    v4 = [(_INPBAppNames *)self appName];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"app_name"];
  }
  if (self->_axSpokenName)
  {
    v6 = [(_INPBAppNames *)self axSpokenName];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"ax_spoken_name"];
  }
  if (self->_displayName)
  {
    v8 = [(_INPBAppNames *)self displayName];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"display_name"];
  }
  if (self->_spotlightName)
  {
    v10 = [(_INPBAppNames *)self spotlightName];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"spotlight_name"];
  }

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_appName hash];
  NSUInteger v4 = [(NSString *)self->_axSpokenName hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_displayName hash];
  return v4 ^ v5 ^ [(NSString *)self->_spotlightName hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  NSUInteger v5 = [(_INPBAppNames *)self appName];
  v6 = [v4 appName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(_INPBAppNames *)self appName];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBAppNames *)self appName];
    v10 = [v4 appName];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBAppNames *)self axSpokenName];
  v6 = [v4 axSpokenName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(_INPBAppNames *)self axSpokenName];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBAppNames *)self axSpokenName];
    v15 = [v4 axSpokenName];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBAppNames *)self displayName];
  v6 = [v4 displayName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(_INPBAppNames *)self displayName];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBAppNames *)self displayName];
    v20 = [v4 displayName];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBAppNames *)self spotlightName];
  v6 = [v4 spotlightName];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(_INPBAppNames *)self spotlightName];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    v24 = [(_INPBAppNames *)self spotlightName];
    v25 = [v4 spotlightName];
    char v26 = [v24 isEqual:v25];

    if (v26) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_21:
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = [+[_INPBAppNames allocWithZone:](_INPBAppNames, "allocWithZone:") init];
  v6 = (void *)[(NSString *)self->_appName copyWithZone:a3];
  [(_INPBAppNames *)v5 setAppName:v6];

  uint64_t v7 = (void *)[(NSString *)self->_axSpokenName copyWithZone:a3];
  [(_INPBAppNames *)v5 setAxSpokenName:v7];

  v8 = (void *)[(NSString *)self->_displayName copyWithZone:a3];
  [(_INPBAppNames *)v5 setDisplayName:v8];

  v9 = (void *)[(NSString *)self->_spotlightName copyWithZone:a3];
  [(_INPBAppNames *)v5 setSpotlightName:v9];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBAppNames *)self data];
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBAppNames)initWithCoder:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBAppNames *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBAppNames *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBAppNames *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  id v4 = [(_INPBAppNames *)self appName];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v5 = [(_INPBAppNames *)self axSpokenName];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  id v6 = [(_INPBAppNames *)self displayName];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(_INPBAppNames *)self spotlightName];

  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    v8 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBAppNamesReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasSpotlightName
{
  return self->_spotlightName != 0;
}

- (void)setSpotlightName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  spotlightName = self->_spotlightName;
  self->_spotlightName = v4;

  MEMORY[0x1F41817F8](v4, spotlightName);
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (void)setDisplayName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  displayName = self->_displayName;
  self->_displayName = v4;

  MEMORY[0x1F41817F8](v4, displayName);
}

- (BOOL)hasAxSpokenName
{
  return self->_axSpokenName != 0;
}

- (void)setAxSpokenName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  axSpokenName = self->_axSpokenName;
  self->_axSpokenName = v4;

  MEMORY[0x1F41817F8](v4, axSpokenName);
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