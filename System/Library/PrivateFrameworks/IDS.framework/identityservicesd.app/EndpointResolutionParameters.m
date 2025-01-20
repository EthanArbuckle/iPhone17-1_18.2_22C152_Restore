@interface EndpointResolutionParameters
- (EndpointResolutionParameters)initWithParams:(id)a3 secondaryPort:(id)a4;
- (NSNumber)secondaryPort;
- (NSString)appleID;
- (void)setAppleID:(id)a3;
- (void)setSecondaryPort:(id)a3;
@end

@implementation EndpointResolutionParameters

- (EndpointResolutionParameters)initWithParams:(id)a3 secondaryPort:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EndpointResolutionParameters;
  v9 = [(EndpointResolutionParameters *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appleID, a3);
    objc_storeStrong((id *)&v10->_secondaryPort, a4);
  }

  return v10;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setAppleID:(id)a3
{
}

- (NSNumber)secondaryPort
{
  return self->_secondaryPort;
}

- (void)setSecondaryPort:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryPort, 0);

  objc_storeStrong((id *)&self->_appleID, 0);
}

@end