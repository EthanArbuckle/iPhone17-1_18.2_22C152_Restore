@interface HMImmutableSettingsProtoStringSettingEvent
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HMImmutableSettingsProtoStringValueEvent)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMImmutableSettingsProtoStringSettingEvent

- (void).cxx_destruct
{
}

- (void)setValue:(id)a3
{
}

- (HMImmutableSettingsProtoStringValueEvent)value
{
  return self->_value;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  value = self->_value;
  uint64_t v6 = v4[1];
  if (value)
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    value = (HMImmutableSettingsProtoStringValueEvent *)-[HMImmutableSettingsProtoStringValueEvent mergeFrom:](value, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    value = (HMImmutableSettingsProtoStringValueEvent *)-[HMImmutableSettingsProtoStringSettingEvent setValue:](self, "setValue:");
  }
  v4 = v7;
LABEL_7:

  MEMORY[0x1F41817F8](value, v4);
}

- (unint64_t)hash
{
  return [(HMImmutableSettingsProtoStringValueEvent *)self->_value hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    value = self->_value;
    if ((unint64_t)value | v4[1]) {
      char v6 = -[HMImmutableSettingsProtoStringValueEvent isEqual:](value, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HMImmutableSettingsProtoStringValueEvent *)self->_value copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)copyTo:(id)a3
{
  value = self->_value;
  if (value) {
    [a3 setValue:value];
  }
}

- (void)writeTo:(id)a3
{
  if (self->_value) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMImmutableSettingsProtoStringSettingEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  value = self->_value;
  if (value)
  {
    v5 = [(HMImmutableSettingsProtoStringValueEvent *)value dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"value"];
  }

  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMImmutableSettingsProtoStringSettingEvent;
  v4 = [(HMImmutableSettingsProtoStringSettingEvent *)&v8 description];
  v5 = [(HMImmutableSettingsProtoStringSettingEvent *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

@end