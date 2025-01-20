@interface _INPBFindDeviceAndPlaySoundIntent
+ (BOOL)supportsSecureCoding;
+ (Class)deviceType;
- (BOOL)hasIntentMetadata;
- (BOOL)hasIsStopRequest;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStopRequest;
- (BOOL)readFrom:(id)a3;
- (NSArray)devices;
- (_INPBFindDeviceAndPlaySoundIntent)initWithCoder:(id)a3;
- (_INPBIntentMetadata)intentMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deviceAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (unint64_t)devicesCount;
- (unint64_t)hash;
- (void)addDevice:(id)a3;
- (void)clearDevices;
- (void)encodeWithCoder:(id)a3;
- (void)setDevices:(id)a3;
- (void)setHasIsStopRequest:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setIsStopRequest:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBFindDeviceAndPlaySoundIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentMetadata, 0);

  objc_storeStrong((id *)&self->_devices, 0);
}

- (BOOL)isStopRequest
{
  return self->_isStopRequest;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (NSArray)devices
{
  return self->_devices;
}

- (id)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_devices count])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v5 = self->_devices;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"device"];
  }
  v11 = [(_INPBFindDeviceAndPlaySoundIntent *)self intentMetadata];
  v12 = [v11 dictionaryRepresentation];
  [v3 setObject:v12 forKeyedSubscript:@"intentMetadata"];

  if ([(_INPBFindDeviceAndPlaySoundIntent *)self hasIsStopRequest])
  {
    v13 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBFindDeviceAndPlaySoundIntent isStopRequest](self, "isStopRequest"));
    [v3 setObject:v13 forKeyedSubscript:@"isStopRequest"];
  }

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_devices hash];
  unint64_t v4 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  if ([(_INPBFindDeviceAndPlaySoundIntent *)self hasIsStopRequest]) {
    uint64_t v5 = 2654435761 * self->_isStopRequest;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(_INPBFindDeviceAndPlaySoundIntent *)self devices];
  uint64_t v6 = [v4 devices];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBFindDeviceAndPlaySoundIntent *)self devices];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(_INPBFindDeviceAndPlaySoundIntent *)self devices];
    v10 = [v4 devices];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBFindDeviceAndPlaySoundIntent *)self intentMetadata];
  uint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(_INPBFindDeviceAndPlaySoundIntent *)self intentMetadata];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBFindDeviceAndPlaySoundIntent *)self intentMetadata];
    long long v15 = [v4 intentMetadata];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  int v19 = [(_INPBFindDeviceAndPlaySoundIntent *)self hasIsStopRequest];
  if (v19 == [v4 hasIsStopRequest])
  {
    if (![(_INPBFindDeviceAndPlaySoundIntent *)self hasIsStopRequest]
      || ![v4 hasIsStopRequest]
      || (int isStopRequest = self->_isStopRequest, isStopRequest == [v4 isStopRequest]))
    {
      BOOL v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBFindDeviceAndPlaySoundIntent allocWithZone:](_INPBFindDeviceAndPlaySoundIntent, "allocWithZone:") init];
  uint64_t v6 = (void *)[(NSArray *)self->_devices copyWithZone:a3];
  [(_INPBFindDeviceAndPlaySoundIntent *)v5 setDevices:v6];

  id v7 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBFindDeviceAndPlaySoundIntent *)v5 setIntentMetadata:v7];

  if ([(_INPBFindDeviceAndPlaySoundIntent *)self hasIsStopRequest]) {
    [(_INPBFindDeviceAndPlaySoundIntent *)v5 setIsStopRequest:[(_INPBFindDeviceAndPlaySoundIntent *)self isStopRequest]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBFindDeviceAndPlaySoundIntent *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBFindDeviceAndPlaySoundIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBFindDeviceAndPlaySoundIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBFindDeviceAndPlaySoundIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBFindDeviceAndPlaySoundIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = self->_devices;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  v10 = [(_INPBFindDeviceAndPlaySoundIntent *)self intentMetadata];

  if (v10)
  {
    int v11 = [(_INPBFindDeviceAndPlaySoundIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBFindDeviceAndPlaySoundIntent *)self hasIsStopRequest]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBFindDeviceAndPlaySoundIntentReadFrom(self, (uint64_t)a3);
}

- (void)setHasIsStopRequest:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsStopRequest
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsStopRequest:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isStopRequest = a3;
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (id)deviceAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_devices objectAtIndexedSubscript:a3];
}

- (unint64_t)devicesCount
{
  return [(NSArray *)self->_devices count];
}

- (void)addDevice:(id)a3
{
  id v4 = a3;
  devices = self->_devices;
  id v8 = v4;
  if (!devices)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_devices;
    self->_devices = v6;

    id v4 = v8;
    devices = self->_devices;
  }
  [(NSArray *)devices addObject:v4];
}

- (void)clearDevices
{
}

- (void)setDevices:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  devices = self->_devices;
  self->_devices = v4;

  MEMORY[0x1F41817F8](v4, devices);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)deviceType
{
  return (Class)objc_opt_class();
}

@end