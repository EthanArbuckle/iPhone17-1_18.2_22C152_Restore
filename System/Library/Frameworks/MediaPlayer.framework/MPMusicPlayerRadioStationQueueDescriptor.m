@interface MPMusicPlayerRadioStationQueueDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (MPMusicPlayerRadioStationQueueDescriptor)initWithCoder:(id)a3;
- (MPMusicPlayerRadioStationQueueDescriptor)initWithRadioStation:(id)a3;
- (MPRadioStation)radioStation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MPMusicPlayerRadioStationQueueDescriptor

- (void).cxx_destruct
{
}

- (MPRadioStation)radioStation
{
  return self->_radioStation;
}

- (BOOL)isEmpty
{
  return self->_radioStation == 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MPMusicPlayerRadioStationQueueDescriptor;
  v4 = [(MPMusicPlayerQueueDescriptor *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 11, self->_radioStation);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MPMusicPlayerRadioStationQueueDescriptor;
  id v4 = a3;
  [(MPMusicPlayerQueueDescriptor *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_radioStation, @"radioStation", v5.receiver, v5.super_class);
}

- (MPMusicPlayerRadioStationQueueDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPMusicPlayerRadioStationQueueDescriptor;
  objc_super v5 = [(MPMusicPlayerQueueDescriptor *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"radioStation"];
    radioStation = v5->_radioStation;
    v5->_radioStation = (MPRadioStation *)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MPMusicPlayerRadioStationQueueDescriptor;
  if ([(MPMusicPlayerQueueDescriptor *)&v10 isEqual:v4])
  {
    objc_super v5 = (MPRadioStation *)v4[11];
    uint64_t v6 = self->_radioStation;
    v7 = v6;
    if (v6 == v5) {
      char v8 = 1;
    }
    else {
      char v8 = [(MPRadioStation *)v6 isEqual:v5];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p radioStation=%@>", objc_opt_class(), self, self->_radioStation];
}

- (MPMusicPlayerRadioStationQueueDescriptor)initWithRadioStation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPMusicPlayerRadioStationQueueDescriptor;
  uint64_t v6 = [(MPMusicPlayerQueueDescriptor *)&v9 _init];
  v7 = (MPMusicPlayerRadioStationQueueDescriptor *)v6;
  if (v6) {
    objc_storeStrong(v6 + 11, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end