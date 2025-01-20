@interface GTReplayUpdateResult
+ (BOOL)supportsSecureCoding;
- ($71565B17A5F3ED2E4525C95CCD99C39E)dispatchUID;
- (GTReplayUpdateResult)initWithCoder:(id)a3;
- (NSDictionary)updatePipelines;
- (NSError)error;
- (unint64_t)streamRef;
- (void)encodeWithCoder:(id)a3;
- (void)setDispatchUID:(id)a3;
- (void)setError:(id)a3;
- (void)setStreamRef:(unint64_t)a3;
- (void)setUpdatePipelines:(id)a3;
@end

@implementation GTReplayUpdateResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayUpdateResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GTReplayUpdateResult;
  v5 = [(GTReplayRequest *)&v16 initWithCoder:v4];
  if (v5)
  {
    v5->_streamRef = [v4 decodeInt64ForKey:@"streamRef"];
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"updatedPipelines"];
    updatePipelines = v5->_updatePipelines;
    v5->_updatePipelines = (NSDictionary *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v12;

    v5->_dispatchUID.uid = GTDispatchUIDDecode(v4, @"dispatchUID");
    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GTReplayUpdateResult;
  id v4 = a3;
  [(GTReplayRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->_streamRef, @"streamRef", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_updatePipelines forKey:@"updatedPipelines"];
  [v4 encodeObject:self->_error forKey:@"error"];
  GTDispatchUIDEncode(v4, self->_dispatchUID.uid, @"dispatchUID");
}

- ($71565B17A5F3ED2E4525C95CCD99C39E)dispatchUID
{
  return ($71565B17A5F3ED2E4525C95CCD99C39E)self->_dispatchUID.uid;
}

- (void)setDispatchUID:(id)a3
{
  self->_dispatchUID.uid = a3.var1;
}

- (unint64_t)streamRef
{
  return self->_streamRef;
}

- (void)setStreamRef:(unint64_t)a3
{
  self->_streamRef = a3;
}

- (NSDictionary)updatePipelines
{
  return self->_updatePipelines;
}

- (void)setUpdatePipelines:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_updatePipelines, 0);
}

@end