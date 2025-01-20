@interface LNNearbyAudioDeviceRelevantContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNNearbyAudioDeviceRelevantContext)initWithCoder:(id)a3;
- (LNNearbyAudioDeviceRelevantContext)initWithDeviceIdentifier:(id)a3 isPlaying:(id)a4;
- (NSNumber)isPlaying;
- (NSString)deviceIdentifier;
- (id)analyticsDescription;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNNearbyAudioDeviceRelevantContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isPlaying, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

- (NSNumber)isPlaying
{
  return self->_isPlaying;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (id)analyticsDescription
{
  return @".nearbyAudioDevice()";
}

- (id)description
{
  v3 = [(LNNearbyAudioDeviceRelevantContext *)self isPlaying];

  v4 = NSString;
  uint64_t v5 = [(LNNearbyAudioDeviceRelevantContext *)self deviceIdentifier];
  v6 = (void *)v5;
  if (v3)
  {
    v7 = [(LNNearbyAudioDeviceRelevantContext *)self isPlaying];
    v8 = [v4 stringWithFormat:@"<nearby audio device: %@, isPlaying: %{BOOL}d>", v6, objc_msgSend(v7, "BOOLValue")];
  }
  else
  {
    v8 = [v4 stringWithFormat:@"<nearby audio device: %@>", v5];
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNNearbyAudioDeviceRelevantContext *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      deviceIdentifier = self->_deviceIdentifier;
      uint64_t v7 = [(LNNearbyAudioDeviceRelevantContext *)v5 deviceIdentifier];
      if (deviceIdentifier == (NSString *)v7)
      {
      }
      else
      {
        v8 = (void *)v7;
        v9 = self->_deviceIdentifier;
        v10 = [(LNNearbyAudioDeviceRelevantContext *)v5 deviceIdentifier];
        LODWORD(v9) = [(NSString *)v9 isEqualToString:v10];

        if (!v9)
        {
          char v11 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      isPlaying = self->_isPlaying;
      uint64_t v13 = [(LNNearbyAudioDeviceRelevantContext *)v5 isPlaying];
      if (isPlaying == (NSNumber *)v13)
      {
        char v11 = 1;
      }
      else
      {
        v14 = (NSNumber *)v13;
        v15 = self->_isPlaying;
        v16 = [(LNNearbyAudioDeviceRelevantContext *)v5 isPlaying];
        char v11 = [(NSNumber *)v15 isEqual:v16];

        isPlaying = v14;
      }

      goto LABEL_13;
    }
    char v11 = 0;
  }
LABEL_14:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_deviceIdentifier hash];
  return [(NSNumber *)self->_isPlaying hash] ^ v3;
}

- (void)encodeWithCoder:(id)a3
{
  deviceIdentifier = self->_deviceIdentifier;
  id v5 = a3;
  [v5 encodeObject:deviceIdentifier forKey:@"deviceIdentifier"];
  [v5 encodeObject:self->_isPlaying forKey:@"isPlaying"];
}

- (LNNearbyAudioDeviceRelevantContext)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceIdentifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isPlaying"];

  uint64_t v7 = [(LNNearbyAudioDeviceRelevantContext *)self initWithDeviceIdentifier:v5 isPlaying:v6];
  return v7;
}

- (LNNearbyAudioDeviceRelevantContext)initWithDeviceIdentifier:(id)a3 isPlaying:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LNNearbyAudioDeviceRelevantContext;
  v9 = [(LNRelevantContext *)&v12 _init];
  v10 = (LNNearbyAudioDeviceRelevantContext *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 2, a3);
    objc_storeStrong((id *)&v10->_isPlaying, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end