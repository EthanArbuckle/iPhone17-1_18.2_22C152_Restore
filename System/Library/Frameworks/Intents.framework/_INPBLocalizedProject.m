@interface _INPBLocalizedProject
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAppNames;
- (BOOL)hasIntentVocabulary;
- (BOOL)hasLanguage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBAppNames)appNames;
- (_INPBIntentVocabulary)intentVocabulary;
- (_INPBLanguageTag)language;
- (_INPBLocalizedProject)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAppNames:(id)a3;
- (void)setIntentVocabulary:(id)a3;
- (void)setLanguage:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBLocalizedProject

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_intentVocabulary, 0);

  objc_storeStrong((id *)&self->_appNames, 0);
}

- (_INPBLanguageTag)language
{
  return self->_language;
}

- (_INPBIntentVocabulary)intentVocabulary
{
  return self->_intentVocabulary;
}

- (_INPBAppNames)appNames
{
  return self->_appNames;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBLocalizedProject *)self appNames];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"app_names"];

  v6 = [(_INPBLocalizedProject *)self intentVocabulary];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"intent_vocabulary"];

  v8 = [(_INPBLocalizedProject *)self language];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"language"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBAppNames *)self->_appNames hash];
  unint64_t v4 = [(_INPBIntentVocabulary *)self->_intentVocabulary hash] ^ v3;
  return v4 ^ [(_INPBLanguageTag *)self->_language hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_INPBLocalizedProject *)self appNames];
  v6 = [v4 appNames];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_INPBLocalizedProject *)self appNames];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBLocalizedProject *)self appNames];
    v10 = [v4 appNames];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBLocalizedProject *)self intentVocabulary];
  v6 = [v4 intentVocabulary];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_INPBLocalizedProject *)self intentVocabulary];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBLocalizedProject *)self intentVocabulary];
    v15 = [v4 intentVocabulary];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBLocalizedProject *)self language];
  v6 = [v4 language];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_INPBLocalizedProject *)self language];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_INPBLocalizedProject *)self language];
    v20 = [v4 language];
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
  v5 = [+[_INPBLocalizedProject allocWithZone:](_INPBLocalizedProject, "allocWithZone:") init];
  id v6 = [(_INPBAppNames *)self->_appNames copyWithZone:a3];
  [(_INPBLocalizedProject *)v5 setAppNames:v6];

  id v7 = [(_INPBIntentVocabulary *)self->_intentVocabulary copyWithZone:a3];
  [(_INPBLocalizedProject *)v5 setIntentVocabulary:v7];

  id v8 = [(_INPBLanguageTag *)self->_language copyWithZone:a3];
  [(_INPBLocalizedProject *)v5 setLanguage:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBLocalizedProject *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBLocalizedProject)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBLocalizedProject *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBLocalizedProject *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBLocalizedProject *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  id v4 = [(_INPBLocalizedProject *)self appNames];

  if (v4)
  {
    v5 = [(_INPBLocalizedProject *)self appNames];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBLocalizedProject *)self intentVocabulary];

  if (v6)
  {
    uint64_t v7 = [(_INPBLocalizedProject *)self intentVocabulary];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBLocalizedProject *)self language];

  if (v8)
  {
    v9 = [(_INPBLocalizedProject *)self language];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBLocalizedProjectReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (void)setLanguage:(id)a3
{
}

- (BOOL)hasIntentVocabulary
{
  return self->_intentVocabulary != 0;
}

- (void)setIntentVocabulary:(id)a3
{
}

- (BOOL)hasAppNames
{
  return self->_appNames != 0;
}

- (void)setAppNames:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end