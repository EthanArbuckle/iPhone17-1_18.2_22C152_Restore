@interface MSUserAccountInfo
+ (BOOL)supportsSecureCoding;
- (MSUserAccountInfo)initWithCoder:(id)a3;
- (MSUserAccountInfo)initWithHomeUserID:(id)a3 sharedUserID:(id)a4;
- (NSString)homeUserID;
- (NSString)sharedUserID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MSUserAccountInfo

- (MSUserAccountInfo)initWithHomeUserID:(id)a3 sharedUserID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MSUserAccountInfo;
  v9 = [(MSUserAccountInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_homeUserID, a3);
    objc_storeStrong((id *)&v10->_sharedUserID, a4);
  }

  return v10;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_homeUserID, @"ResolvedSpeakerHomeUserID");
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_sharedUserID, @"ResolvedSpeakerSharedUserID");
  v4 = [v3 description];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  homeUserID = self->_homeUserID;
  id v5 = a3;
  [v5 encodeObject:homeUserID forKey:@"MSSHomeUserIDEncodedKey"];
  [v5 encodeObject:self->_sharedUserID forKey:@"MSSSharedUserIDEncodedKey"];
}

- (MSUserAccountInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSSHomeUserIDEncodedKey"];
  homeUserID = self->_homeUserID;
  self->_homeUserID = v5;

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSSSharedUserIDEncodedKey"];

  sharedUserID = self->_sharedUserID;
  self->_sharedUserID = v7;

  v9 = self->_homeUserID;
  v10 = self->_sharedUserID;

  return [(MSUserAccountInfo *)self initWithHomeUserID:v9 sharedUserID:v10];
}

- (NSString)homeUserID
{
  return self->_homeUserID;
}

- (NSString)sharedUserID
{
  return self->_sharedUserID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedUserID, 0);

  objc_storeStrong((id *)&self->_homeUserID, 0);
}

@end