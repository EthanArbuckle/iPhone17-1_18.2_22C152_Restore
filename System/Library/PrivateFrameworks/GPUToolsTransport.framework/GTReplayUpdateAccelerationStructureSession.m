@interface GTReplayUpdateAccelerationStructureSession
+ (BOOL)supportsSecureCoding;
- (GTReplayUpdateAccelerationStructureSession)initWithCoder:(id)a3;
- (NSData)data;
- (unint64_t)sessionsID;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
- (void)setSessionsID:(unint64_t)a3;
@end

@implementation GTReplayUpdateAccelerationStructureSession

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayUpdateAccelerationStructureSession)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GTReplayUpdateAccelerationStructureSession;
  v5 = [(GTReplayRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    v5->_sessionsID = [v4 decodeInt64ForKey:@"sessionsID"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    data = v5->_data;
    v5->_data = (NSData *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GTReplayUpdateAccelerationStructureSession;
  id v4 = a3;
  [(GTReplayRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->_sessionsID, @"sessionsID", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_data forKey:@"data"];
}

- (unint64_t)sessionsID
{
  return self->_sessionsID;
}

- (void)setSessionsID:(unint64_t)a3
{
  self->_sessionsID = a3;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end