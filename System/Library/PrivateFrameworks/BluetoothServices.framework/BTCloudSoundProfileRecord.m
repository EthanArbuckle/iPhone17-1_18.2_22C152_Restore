@interface BTCloudSoundProfileRecord
+ (BOOL)supportsSecureCoding;
+ (id)soundProfileRecordWithCustomData:(id)a3;
+ (id)soundProfileRecordWithFileURL:(id)a3;
- (BTCloudSoundProfileRecord)initWithCoder:(id)a3;
- (BTCloudSoundProfileRecord)initWithCustomData:(id)a3;
- (BTCloudSoundProfileRecord)initWithFileURL:(id)a3;
- (NSData)soundProfileData;
- (NSURL)soundProfileFileURL;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setSoundProfileData:(id)a3;
- (void)setSoundProfileFileURL:(id)a3;
@end

@implementation BTCloudSoundProfileRecord

- (BTCloudSoundProfileRecord)initWithCustomData:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BTCloudSoundProfileRecord;
  v5 = [(BTCloudSoundProfileRecord *)&v8 init];
  v6 = v5;
  if (v5) {
    [(BTCloudSoundProfileRecord *)v5 setSoundProfileData:v4];
  }

  return v6;
}

- (BTCloudSoundProfileRecord)initWithFileURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BTCloudSoundProfileRecord;
  v5 = [(BTCloudSoundProfileRecord *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(BTCloudSoundProfileRecord *)v5 setSoundProfileFileURL:v4];
    v7 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v4 options:1 error:0];
    [(BTCloudSoundProfileRecord *)v6 setSoundProfileData:v7];
  }
  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(BTCloudSoundProfileRecord *)self soundProfileData];
  v5 = (void *)v4;
  if (v4)
  {
    v6 = [v3 stringWithFormat:@"BTCloudSoundProfileRecord: %@", v4];
  }
  else
  {
    v7 = [(BTCloudSoundProfileRecord *)self soundProfileFileURL];
    v6 = [v3 stringWithFormat:@"BTCloudSoundProfileRecord: %@", v7];
  }
  return v6;
}

+ (id)soundProfileRecordWithCustomData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[BTCloudSoundProfileRecord alloc] initWithCustomData:v3];

  return v4;
}

+ (id)soundProfileRecordWithFileURL:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[BTCloudSoundProfileRecord alloc] initWithFileURL:v3];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BTCloudSoundProfileRecord *)self soundProfileData];
  v6 = NSStringFromSelector(sel_soundProfileData);
  [v4 encodeObject:v5 forKey:v6];

  id v8 = [(BTCloudSoundProfileRecord *)self soundProfileFileURL];
  v7 = NSStringFromSelector(sel_soundProfileFileURL);
  [v4 encodeObject:v8 forKey:v7];
}

- (BTCloudSoundProfileRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BTCloudSoundProfileRecord;
  v5 = [(BTCloudSoundProfileRecord *)&v13 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_soundProfileData);
    id v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    [(BTCloudSoundProfileRecord *)v5 setSoundProfileData:v8];

    uint64_t v9 = objc_opt_class();
    v10 = NSStringFromSelector(sel_soundProfileFileURL);
    v11 = [v4 decodeObjectOfClass:v9 forKey:v10];
    [(BTCloudSoundProfileRecord *)v5 setSoundProfileFileURL:v11];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)soundProfileData
{
  return self->_soundProfileData;
}

- (void)setSoundProfileData:(id)a3
{
}

- (NSURL)soundProfileFileURL
{
  return self->_soundProfileFileURL;
}

- (void)setSoundProfileFileURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soundProfileFileURL, 0);
  objc_storeStrong((id *)&self->_soundProfileData, 0);
}

@end