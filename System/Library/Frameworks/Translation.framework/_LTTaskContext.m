@interface _LTTaskContext
+ (BOOL)supportsSecureCoding;
- (NSString)appIdentifier;
- (NSString)deviceOS;
- (NSString)deviceType;
- (NSString)sessionID;
- (_LTLocalePair)localePair;
- (_LTTaskContext)initWithCoder:(id)a3;
- (_LTTaskContext)initWithSessionID:(id)a3 taskHint:(int64_t)a4 localePair:(id)a5 deviceOS:(id)a6 deviceType:(id)a7 appIdentifier:(id)a8;
- (int64_t)taskHint;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _LTTaskContext

- (_LTTaskContext)initWithSessionID:(id)a3 taskHint:(int64_t)a4 localePair:(id)a5 deviceOS:(id)a6 deviceType:(id)a7 appIdentifier:(id)a8
{
  id v23 = a3;
  id v22 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)_LTTaskContext;
  v18 = [(_LTTaskContext *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_sessionID, a3);
    v19->_taskHint = a4;
    objc_storeStrong((id *)&v19->_localePair, a5);
    objc_storeStrong((id *)&v19->_deviceOS, a6);
    objc_storeStrong((id *)&v19->_deviceType, a7);
    objc_storeStrong((id *)&v19->_appIdentifier, a8);
    v20 = v19;
  }

  return v19;
}

- (_LTTaskContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_LTTaskContext;
  v5 = [(_LTTaskContext *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionID"];
    sessionID = v5->_sessionID;
    v5->_sessionID = (NSString *)v6;

    v5->_taskHint = [v4 decodeIntegerForKey:@"taskHint"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localePair"];
    localePair = v5->_localePair;
    v5->_localePair = (_LTLocalePair *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceOS"];
    deviceOS = v5->_deviceOS;
    v5->_deviceOS = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceType"];
    deviceType = v5->_deviceType;
    v5->_deviceType = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appIdentifier"];
    appIdentifier = v5->_appIdentifier;
    v5->_appIdentifier = (NSString *)v14;

    id v16 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  sessionID = self->_sessionID;
  id v5 = a3;
  [v5 encodeObject:sessionID forKey:@"sessionID"];
  [v5 encodeInteger:self->_taskHint forKey:@"taskHint"];
  [v5 encodeObject:self->_localePair forKey:@"localePair"];
  [v5 encodeObject:self->_deviceOS forKey:@"deviceOS"];
  [v5 encodeObject:self->_deviceType forKey:@"deviceType"];
  [v5 encodeObject:self->_appIdentifier forKey:@"appIdentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (int64_t)taskHint
{
  return self->_taskHint;
}

- (_LTLocalePair)localePair
{
  return self->_localePair;
}

- (NSString)deviceOS
{
  return self->_deviceOS;
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_deviceOS, 0);
  objc_storeStrong((id *)&self->_localePair, 0);

  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end