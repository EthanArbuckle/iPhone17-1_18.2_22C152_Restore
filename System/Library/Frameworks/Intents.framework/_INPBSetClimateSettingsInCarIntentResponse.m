@interface _INPBSetClimateSettingsInCarIntentResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBSetClimateSettingsInCarIntentResponse)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _INPBSetClimateSettingsInCarIntentResponse

- (id)dictionaryRepresentation
{
  return (id)[MEMORY[0x1E4F1CA60] dictionary];
}

- (unint64_t)hash
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  char v4 = [v3 isMemberOfClass:objc_opt_class()];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = +[_INPBSetClimateSettingsInCarIntentResponse allocWithZone:a3];

  return [(_INPBSetClimateSettingsInCarIntentResponse *)v3 init];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSetClimateSettingsInCarIntentResponse *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSetClimateSettingsInCarIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSetClimateSettingsInCarIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSetClimateSettingsInCarIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSetClimateSettingsInCarIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSetClimateSettingsInCarIntentResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end