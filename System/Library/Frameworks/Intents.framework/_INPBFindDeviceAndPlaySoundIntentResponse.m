@interface _INPBFindDeviceAndPlaySoundIntentResponse
+ (BOOL)supportsSecureCoding;
+ (Class)devicesFoundType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)devicesFounds;
- (_INPBFindDeviceAndPlaySoundIntentResponse)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)devicesFoundAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (unint64_t)devicesFoundsCount;
- (unint64_t)hash;
- (void)addDevicesFound:(id)a3;
- (void)clearDevicesFounds;
- (void)encodeWithCoder:(id)a3;
- (void)setDevicesFounds:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBFindDeviceAndPlaySoundIntentResponse

- (void).cxx_destruct
{
}

- (NSArray)devicesFounds
{
  return self->_devicesFounds;
}

- (id)dictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_devicesFounds count])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v5 = self->_devicesFounds;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "dictionaryRepresentation", (void)v12);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"devicesFound"];
  }

  return v3;
}

- (unint64_t)hash
{
  return [(NSArray *)self->_devicesFounds hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(_INPBFindDeviceAndPlaySoundIntentResponse *)self devicesFounds];
    uint64_t v6 = [v4 devicesFounds];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(_INPBFindDeviceAndPlaySoundIntentResponse *)self devicesFounds];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      v10 = [(_INPBFindDeviceAndPlaySoundIntentResponse *)self devicesFounds];
      v11 = [v4 devicesFounds];
      char v12 = [v10 isEqual:v11];

      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  BOOL v13 = 0;
LABEL_8:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBFindDeviceAndPlaySoundIntentResponse allocWithZone:](_INPBFindDeviceAndPlaySoundIntentResponse, "allocWithZone:") init];
  uint64_t v6 = (void *)[(NSArray *)self->_devicesFounds copyWithZone:a3];
  [(_INPBFindDeviceAndPlaySoundIntentResponse *)v5 setDevicesFounds:v6];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBFindDeviceAndPlaySoundIntentResponse *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBFindDeviceAndPlaySoundIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBFindDeviceAndPlaySoundIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBFindDeviceAndPlaySoundIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBFindDeviceAndPlaySoundIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_devicesFounds;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBFindDeviceAndPlaySoundIntentResponseReadFrom(self, (uint64_t)a3);
}

- (id)devicesFoundAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_devicesFounds objectAtIndexedSubscript:a3];
}

- (unint64_t)devicesFoundsCount
{
  return [(NSArray *)self->_devicesFounds count];
}

- (void)addDevicesFound:(id)a3
{
  id v4 = a3;
  devicesFounds = self->_devicesFounds;
  id v8 = v4;
  if (!devicesFounds)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_devicesFounds;
    self->_devicesFounds = v6;

    id v4 = v8;
    devicesFounds = self->_devicesFounds;
  }
  [(NSArray *)devicesFounds addObject:v4];
}

- (void)clearDevicesFounds
{
}

- (void)setDevicesFounds:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  devicesFounds = self->_devicesFounds;
  self->_devicesFounds = v4;

  MEMORY[0x1F41817F8](v4, devicesFounds);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)devicesFoundType
{
  return (Class)objc_opt_class();
}

@end