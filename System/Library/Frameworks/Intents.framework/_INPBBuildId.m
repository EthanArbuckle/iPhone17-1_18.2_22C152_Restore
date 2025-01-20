@interface _INPBBuildId
+ (BOOL)supportsSecureCoding;
- (BOOL)hasBuildNumber;
- (BOOL)hasVersionNumber;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)buildNumber;
- (NSString)versionNumber;
- (_INPBBuildId)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBuildNumber:(id)a3;
- (void)setVersionNumber:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBBuildId

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionNumber, 0);

  objc_storeStrong((id *)&self->_buildNumber, 0);
}

- (NSString)versionNumber
{
  return self->_versionNumber;
}

- (NSString)buildNumber
{
  return self->_buildNumber;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_buildNumber)
  {
    v4 = [(_INPBBuildId *)self buildNumber];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"build_number"];
  }
  if (self->_versionNumber)
  {
    v6 = [(_INPBBuildId *)self versionNumber];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"version_number"];
  }

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_buildNumber hash];
  return [(NSString *)self->_versionNumber hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBBuildId *)self buildNumber];
  v6 = [v4 buildNumber];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBBuildId *)self buildNumber];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBBuildId *)self buildNumber];
    v10 = [v4 buildNumber];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBBuildId *)self versionNumber];
  v6 = [v4 versionNumber];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBBuildId *)self versionNumber];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_INPBBuildId *)self versionNumber];
    v15 = [v4 versionNumber];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBBuildId allocWithZone:](_INPBBuildId, "allocWithZone:") init];
  v6 = (void *)[(NSString *)self->_buildNumber copyWithZone:a3];
  [(_INPBBuildId *)v5 setBuildNumber:v6];

  uint64_t v7 = (void *)[(NSString *)self->_versionNumber copyWithZone:a3];
  [(_INPBBuildId *)v5 setVersionNumber:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBBuildId *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBBuildId)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBBuildId *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBBuildId *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBBuildId *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(_INPBBuildId *)self buildNumber];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(_INPBBuildId *)self versionNumber];

  if (v5) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBBuildIdReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasVersionNumber
{
  return self->_versionNumber != 0;
}

- (void)setVersionNumber:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  versionNumber = self->_versionNumber;
  self->_versionNumber = v4;

  MEMORY[0x1F41817F8](v4, versionNumber);
}

- (BOOL)hasBuildNumber
{
  return self->_buildNumber != 0;
}

- (void)setBuildNumber:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  buildNumber = self->_buildNumber;
  self->_buildNumber = v4;

  MEMORY[0x1F41817F8](v4, buildNumber);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end