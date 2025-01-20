@interface CTTetheringStatus
+ (BOOL)supportsSecureCoding;
- (CTDataConnectionAvailabilityStatus)connectionAvailabilityStatus;
- (CTDataConnectionStatus)connectionStatus;
- (CTTetheringStatus)initWithCoder:(id)a3;
- (CTXPCServiceSubscriptionContext)context;
- (NSNumber)activationFailure;
- (NSNumber)asserted;
- (NSNumber)carrierEnabled;
- (NSNumber)misPdpMaxHosts;
- (NSNumber)userAuthenticated;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setActivationFailure:(id)a3;
- (void)setAsserted:(id)a3;
- (void)setCarrierEnabled:(id)a3;
- (void)setConnectionAvailabilityStatus:(id)a3;
- (void)setConnectionStatus:(id)a3;
- (void)setContext:(id)a3;
- (void)setMisPdpMaxHosts:(id)a3;
- (void)setUserAuthenticated:(id)a3;
@end

@implementation CTTetheringStatus

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTTetheringStatus *)self carrierEnabled];
  [v3 appendFormat:@", carrierEnabled=%@", v4];

  v5 = [(CTTetheringStatus *)self userAuthenticated];
  [v3 appendFormat:@", userAuthenticated=%@", v5];

  v6 = [(CTTetheringStatus *)self asserted];
  [v3 appendFormat:@", asserted=%@", v6];

  v7 = [(CTTetheringStatus *)self activationFailure];
  [v3 appendFormat:@", activationFailure=%@", v7];

  v8 = [(CTTetheringStatus *)self misPdpMaxHosts];
  [v3 appendFormat:@", misPdpMaxHosts=%@", v8];

  v9 = [(CTTetheringStatus *)self connectionAvailabilityStatus];
  [v3 appendFormat:@", connectionAvailabilityStatus=%@", v9];

  v10 = [(CTTetheringStatus *)self connectionStatus];
  [v3 appendFormat:@", connectionStatus=%@", v10];

  v11 = [(CTTetheringStatus *)self context];
  [v3 appendFormat:@", context=%@", v11];

  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(CTTetheringStatus *)self carrierEnabled];
  v6 = (void *)[v5 copy];
  [v4 setCarrierEnabled:v6];

  v7 = [(CTTetheringStatus *)self userAuthenticated];
  v8 = (void *)[v7 copy];
  [v4 setUserAuthenticated:v8];

  v9 = [(CTTetheringStatus *)self asserted];
  v10 = (void *)[v9 copy];
  [v4 setAsserted:v10];

  v11 = [(CTTetheringStatus *)self activationFailure];
  v12 = (void *)[v11 copy];
  [v4 setActivationFailure:v12];

  v13 = [(CTTetheringStatus *)self misPdpMaxHosts];
  v14 = (void *)[v13 copy];
  [v4 setMisPdpMaxHosts:v14];

  v15 = [(CTTetheringStatus *)self connectionAvailabilityStatus];
  v16 = (void *)[v15 copy];
  [v4 setConnectionAvailabilityStatus:v16];

  v17 = [(CTTetheringStatus *)self connectionStatus];
  v18 = (void *)[v17 copy];
  [v4 setConnectionStatus:v18];

  v19 = [(CTTetheringStatus *)self context];
  v20 = (void *)[v19 copy];
  [v4 setContext:v20];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CTTetheringStatus *)self carrierEnabled];
  [v4 encodeObject:v5 forKey:@"carrierEnabled"];

  v6 = [(CTTetheringStatus *)self userAuthenticated];
  [v4 encodeObject:v6 forKey:@"userAuthenticated"];

  v7 = [(CTTetheringStatus *)self asserted];
  [v4 encodeObject:v7 forKey:@"asserted"];

  v8 = [(CTTetheringStatus *)self activationFailure];
  [v4 encodeObject:v8 forKey:@"activationFailure"];

  v9 = [(CTTetheringStatus *)self misPdpMaxHosts];
  [v4 encodeObject:v9 forKey:@"misPdpMaxHosts"];

  v10 = [(CTTetheringStatus *)self connectionAvailabilityStatus];
  [v4 encodeObject:v10 forKey:@"connectionAvailabilityStatus"];

  v11 = [(CTTetheringStatus *)self connectionStatus];
  [v4 encodeObject:v11 forKey:@"connectionStatus"];

  id v12 = [(CTTetheringStatus *)self context];
  [v4 encodeObject:v12 forKey:@"context"];
}

- (CTTetheringStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CTTetheringStatus;
  v5 = [(CTTetheringStatus *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"carrierEnabled"];
    carrierEnabled = v5->_carrierEnabled;
    v5->_carrierEnabled = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userAuthenticated"];
    userAuthenticated = v5->_userAuthenticated;
    v5->_userAuthenticated = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"asserted"];
    asserted = v5->_asserted;
    v5->_asserted = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activationFailure"];
    activationFailure = v5->_activationFailure;
    v5->_activationFailure = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"misPdpMaxHosts"];
    misPdpMaxHosts = v5->_misPdpMaxHosts;
    v5->_misPdpMaxHosts = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"connectionAvailabilityStatus"];
    connectionAvailabilityStatus = v5->_connectionAvailabilityStatus;
    v5->_connectionAvailabilityStatus = (CTDataConnectionAvailabilityStatus *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"connectionStatus"];
    connectionStatus = v5->_connectionStatus;
    v5->_connectionStatus = (CTDataConnectionStatus *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"context"];
    context = v5->_context;
    v5->_context = (CTXPCServiceSubscriptionContext *)v20;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)carrierEnabled
{
  return self->_carrierEnabled;
}

- (void)setCarrierEnabled:(id)a3
{
}

- (NSNumber)userAuthenticated
{
  return self->_userAuthenticated;
}

- (void)setUserAuthenticated:(id)a3
{
}

- (NSNumber)asserted
{
  return self->_asserted;
}

- (void)setAsserted:(id)a3
{
}

- (NSNumber)activationFailure
{
  return self->_activationFailure;
}

- (void)setActivationFailure:(id)a3
{
}

- (NSNumber)misPdpMaxHosts
{
  return self->_misPdpMaxHosts;
}

- (void)setMisPdpMaxHosts:(id)a3
{
}

- (CTDataConnectionAvailabilityStatus)connectionAvailabilityStatus
{
  return self->_connectionAvailabilityStatus;
}

- (void)setConnectionAvailabilityStatus:(id)a3
{
}

- (CTDataConnectionStatus)connectionStatus
{
  return self->_connectionStatus;
}

- (void)setConnectionStatus:(id)a3
{
}

- (CTXPCServiceSubscriptionContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_connectionStatus, 0);
  objc_storeStrong((id *)&self->_connectionAvailabilityStatus, 0);
  objc_storeStrong((id *)&self->_misPdpMaxHosts, 0);
  objc_storeStrong((id *)&self->_activationFailure, 0);
  objc_storeStrong((id *)&self->_asserted, 0);
  objc_storeStrong((id *)&self->_userAuthenticated, 0);

  objc_storeStrong((id *)&self->_carrierEnabled, 0);
}

@end