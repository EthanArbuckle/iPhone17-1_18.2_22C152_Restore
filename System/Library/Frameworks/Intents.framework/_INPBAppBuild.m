@interface _INPBAppBuild
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAppId;
- (BOOL)hasBuildId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBAppBuild)initWithCoder:(id)a3;
- (_INPBAppId)appId;
- (_INPBBuildId)buildId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAppId:(id)a3;
- (void)setBuildId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBAppBuild

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buildId, 0);

  objc_storeStrong((id *)&self->_appId, 0);
}

- (_INPBBuildId)buildId
{
  return self->_buildId;
}

- (_INPBAppId)appId
{
  return self->_appId;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBAppBuild *)self appId];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"app_id"];

  v6 = [(_INPBAppBuild *)self buildId];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"build_id"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBAppId *)self->_appId hash];
  return [(_INPBBuildId *)self->_buildId hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBAppBuild *)self appId];
  v6 = [v4 appId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBAppBuild *)self appId];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBAppBuild *)self appId];
    v10 = [v4 appId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBAppBuild *)self buildId];
  v6 = [v4 buildId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBAppBuild *)self buildId];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_INPBAppBuild *)self buildId];
    v15 = [v4 buildId];
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
  v5 = [+[_INPBAppBuild allocWithZone:](_INPBAppBuild, "allocWithZone:") init];
  id v6 = [(_INPBAppId *)self->_appId copyWithZone:a3];
  [(_INPBAppBuild *)v5 setAppId:v6];

  id v7 = [(_INPBBuildId *)self->_buildId copyWithZone:a3];
  [(_INPBAppBuild *)v5 setBuildId:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBAppBuild *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBAppBuild)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBAppBuild *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBAppBuild *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBAppBuild *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(_INPBAppBuild *)self appId];

  if (v4)
  {
    v5 = [(_INPBAppBuild *)self appId];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBAppBuild *)self buildId];

  if (v6)
  {
    uint64_t v7 = [(_INPBAppBuild *)self buildId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBAppBuildReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasBuildId
{
  return self->_buildId != 0;
}

- (void)setBuildId:(id)a3
{
}

- (BOOL)hasAppId
{
  return self->_appId != 0;
}

- (void)setAppId:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end