@interface CMData
+ (BOOL)supportsSecureCoding;
+ (id)classes;
- (BOOL)isSent;
- (CMData)initWithCoder:(id)a3;
- (CMData)initWithMessage:(id)a3 timestamp:(double)a4 isSent:(BOOL)a5;
- (NSData)additionalData;
- (NSData)data;
- (NSString)sourcePeerDisplayName;
- (double)timestamp;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalData:(id)a3;
- (void)setData:(id)a3;
- (void)setIsSent:(BOOL)a3;
- (void)setSourcePeerDisplayName:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setType:(int64_t)a3;
@end

@implementation CMData

- (CMData)initWithMessage:(id)a3 timestamp:(double)a4 isSent:(BOOL)a5
{
  id v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CMData;
  v9 = [(CMData *)&v18 init];
  v10 = v9;
  if (v9)
  {
    v9->_timestamp = a4;
    v9->_isSent = a5;
    uint64_t v11 = [v8 fromPeerDisplayName];
    sourcePeerDisplayName = v10->_sourcePeerDisplayName;
    v10->_sourcePeerDisplayName = (NSString *)v11;

    v10->_type = [v8 cmDataType];
    uint64_t v13 = [v8 cmData];
    data = v10->_data;
    v10->_data = (NSData *)v13;

    uint64_t v15 = [v8 cmAdditionalData];
    additionalData = v10->_additionalData;
    v10->_additionalData = (NSData *)v15;
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classes
{
  if (qword_267C58B38 == -1)
  {
    v2 = (void *)qword_267C58B30;
  }
  else
  {
    dispatch_once(&qword_267C58B38, &unk_26CB5E258);
    v2 = (void *)qword_267C58B30;
  }
  return v2;
}

- (CMData)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CMData;
  v5 = [(CMData *)&v15 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x21D490BF0]();
    uint64_t v7 = [v4 decodeObjectForKey:@"pd"];
    sourcePeerDisplayName = v5->_sourcePeerDisplayName;
    v5->_sourcePeerDisplayName = (NSString *)v7;

    [v4 decodeDoubleForKey:@"t"];
    v5->_timestamp = v9;
    v5->_type = [v4 decodeIntegerForKey:@"cmType"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cmData"];
    data = v5->_data;
    v5->_data = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cmAddData"];
    additionalData = v5->_additionalData;
    v5->_additionalData = (NSData *)v12;

    v5->_isSent = [v4 decodeBoolForKey:@"is"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = (void *)MEMORY[0x21D490BF0]();
  [v5 encodeObject:self->_sourcePeerDisplayName forKey:@"pd"];
  [v5 encodeDouble:@"t" forKey:self->_timestamp];
  [v5 encodeInteger:self->_type forKey:@"cmType"];
  [v5 encodeObject:self->_data forKey:@"cmData"];
  [v5 encodeObject:self->_additionalData forKey:@"cmAddData"];
  [v5 encodeBool:self->_isSent forKey:@"is"];
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSData)additionalData
{
  return self->_additionalData;
}

- (void)setAdditionalData:(id)a3
{
}

- (NSString)sourcePeerDisplayName
{
  return self->_sourcePeerDisplayName;
}

- (void)setSourcePeerDisplayName:(id)a3
{
}

- (BOOL)isSent
{
  return self->_isSent;
}

- (void)setIsSent:(BOOL)a3
{
  self->_isSent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourcePeerDisplayName, 0);
  objc_storeStrong((id *)&self->_additionalData, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end