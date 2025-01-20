@interface FLDPGBatch
- (FLDPGBatch)initWithBundleID:(id)a3 payload:(id)a4;
- (NSData)payload;
- (NSString)bundleID;
- (void)setBundleID:(id)a3;
- (void)setPayload:(id)a3;
@end

@implementation FLDPGBatch

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (void)setPayload:(id)a3
{
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (FLDPGBatch)initWithBundleID:(id)a3 payload:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(FLDPGBatch *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleID, a3);
    objc_storeStrong((id *)&v10->_payload, a4);
  }

  return v10;
}

@end