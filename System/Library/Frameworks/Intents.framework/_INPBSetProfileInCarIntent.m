@interface _INPBSetProfileInCarIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)defaultProfile;
- (BOOL)hasCarName;
- (BOOL)hasDefaultProfile;
- (BOOL)hasIntentMetadata;
- (BOOL)hasProfileName;
- (BOOL)hasProfileNumber;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBDataString)carName;
- (_INPBInteger)profileNumber;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBSetProfileInCarIntent)initWithCoder:(id)a3;
- (_INPBString)profileName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCarName:(id)a3;
- (void)setDefaultProfile:(BOOL)a3;
- (void)setHasDefaultProfile:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setProfileName:(id)a3;
- (void)setProfileNumber:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSetProfileInCarIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileNumber, 0);
  objc_storeStrong((id *)&self->_profileName, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);

  objc_storeStrong((id *)&self->_carName, 0);
}

- (_INPBInteger)profileNumber
{
  return self->_profileNumber;
}

- (_INPBString)profileName
{
  return self->_profileName;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (BOOL)defaultProfile
{
  return self->_defaultProfile;
}

- (_INPBDataString)carName
{
  return self->_carName;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBSetProfileInCarIntent *)self carName];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"carName"];

  if ([(_INPBSetProfileInCarIntent *)self hasDefaultProfile])
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBSetProfileInCarIntent defaultProfile](self, "defaultProfile"));
    [v3 setObject:v6 forKeyedSubscript:@"defaultProfile"];
  }
  v7 = [(_INPBSetProfileInCarIntent *)self intentMetadata];
  v8 = [v7 dictionaryRepresentation];
  [v3 setObject:v8 forKeyedSubscript:@"intentMetadata"];

  v9 = [(_INPBSetProfileInCarIntent *)self profileName];
  v10 = [v9 dictionaryRepresentation];
  [v3 setObject:v10 forKeyedSubscript:@"profileName"];

  v11 = [(_INPBSetProfileInCarIntent *)self profileNumber];
  v12 = [v11 dictionaryRepresentation];
  [v3 setObject:v12 forKeyedSubscript:@"profileNumber"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBDataString *)self->_carName hash];
  if ([(_INPBSetProfileInCarIntent *)self hasDefaultProfile]) {
    uint64_t v4 = 2654435761 * self->_defaultProfile;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = v4 ^ v3;
  unint64_t v6 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  unint64_t v7 = v5 ^ v6 ^ [(_INPBString *)self->_profileName hash];
  return v7 ^ [(_INPBInteger *)self->_profileNumber hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  unint64_t v5 = [(_INPBSetProfileInCarIntent *)self carName];
  unint64_t v6 = [v4 carName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_25;
  }
  uint64_t v7 = [(_INPBSetProfileInCarIntent *)self carName];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBSetProfileInCarIntent *)self carName];
    v10 = [v4 carName];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  int v12 = [(_INPBSetProfileInCarIntent *)self hasDefaultProfile];
  if (v12 != [v4 hasDefaultProfile]) {
    goto LABEL_26;
  }
  if ([(_INPBSetProfileInCarIntent *)self hasDefaultProfile])
  {
    if ([v4 hasDefaultProfile])
    {
      int defaultProfile = self->_defaultProfile;
      if (defaultProfile != [v4 defaultProfile]) {
        goto LABEL_26;
      }
    }
  }
  unint64_t v5 = [(_INPBSetProfileInCarIntent *)self intentMetadata];
  unint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_25;
  }
  uint64_t v14 = [(_INPBSetProfileInCarIntent *)self intentMetadata];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [(_INPBSetProfileInCarIntent *)self intentMetadata];
    v17 = [v4 intentMetadata];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSetProfileInCarIntent *)self profileName];
  unint64_t v6 = [v4 profileName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_25;
  }
  uint64_t v19 = [(_INPBSetProfileInCarIntent *)self profileName];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(_INPBSetProfileInCarIntent *)self profileName];
    v22 = [v4 profileName];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSetProfileInCarIntent *)self profileNumber];
  unint64_t v6 = [v4 profileNumber];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v24 = [(_INPBSetProfileInCarIntent *)self profileNumber];
    if (!v24)
    {

LABEL_29:
      BOOL v29 = 1;
      goto LABEL_27;
    }
    v25 = (void *)v24;
    v26 = [(_INPBSetProfileInCarIntent *)self profileNumber];
    v27 = [v4 profileNumber];
    char v28 = [v26 isEqual:v27];

    if (v28) {
      goto LABEL_29;
    }
  }
  else
  {
LABEL_25:
  }
LABEL_26:
  BOOL v29 = 0;
LABEL_27:

  return v29;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBSetProfileInCarIntent allocWithZone:](_INPBSetProfileInCarIntent, "allocWithZone:") init];
  id v6 = [(_INPBDataString *)self->_carName copyWithZone:a3];
  [(_INPBSetProfileInCarIntent *)v5 setCarName:v6];

  if ([(_INPBSetProfileInCarIntent *)self hasDefaultProfile]) {
    [(_INPBSetProfileInCarIntent *)v5 setDefaultProfile:[(_INPBSetProfileInCarIntent *)self defaultProfile]];
  }
  id v7 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBSetProfileInCarIntent *)v5 setIntentMetadata:v7];

  id v8 = [(_INPBString *)self->_profileName copyWithZone:a3];
  [(_INPBSetProfileInCarIntent *)v5 setProfileName:v8];

  id v9 = [(_INPBInteger *)self->_profileNumber copyWithZone:a3];
  [(_INPBSetProfileInCarIntent *)v5 setProfileNumber:v9];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSetProfileInCarIntent *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSetProfileInCarIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSetProfileInCarIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSetProfileInCarIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSetProfileInCarIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v13 = a3;
  id v4 = [(_INPBSetProfileInCarIntent *)self carName];

  if (v4)
  {
    unint64_t v5 = [(_INPBSetProfileInCarIntent *)self carName];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBSetProfileInCarIntent *)self hasDefaultProfile]) {
    PBDataWriterWriteBOOLField();
  }
  id v6 = [(_INPBSetProfileInCarIntent *)self intentMetadata];

  if (v6)
  {
    uint64_t v7 = [(_INPBSetProfileInCarIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBSetProfileInCarIntent *)self profileName];

  if (v8)
  {
    id v9 = [(_INPBSetProfileInCarIntent *)self profileName];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(_INPBSetProfileInCarIntent *)self profileNumber];

  int v11 = v13;
  if (v10)
  {
    int v12 = [(_INPBSetProfileInCarIntent *)self profileNumber];
    PBDataWriterWriteSubmessage();

    int v11 = v13;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSetProfileInCarIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasProfileNumber
{
  return self->_profileNumber != 0;
}

- (void)setProfileNumber:(id)a3
{
}

- (BOOL)hasProfileName
{
  return self->_profileName != 0;
}

- (void)setProfileName:(id)a3
{
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (void)setHasDefaultProfile:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDefaultProfile
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDefaultProfile:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int defaultProfile = a3;
}

- (BOOL)hasCarName
{
  return self->_carName != 0;
}

- (void)setCarName:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end