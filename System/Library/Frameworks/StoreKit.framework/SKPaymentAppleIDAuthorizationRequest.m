@interface SKPaymentAppleIDAuthorizationRequest
- (NSString)clientIdentifier;
- (NSString)serviceIdentifier;
- (NSString)teamIdentifier;
- (SKPaymentAppleIDAuthorizationRequest)initWithClientIdentifier:(id)a3 teamIdentifier:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setServiceIdentifier:(id)a3;
@end

@implementation SKPaymentAppleIDAuthorizationRequest

- (SKPaymentAppleIDAuthorizationRequest)initWithClientIdentifier:(id)a3 teamIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SKPaymentAppleIDAuthorizationRequest initWithClientIdentifier:teamIdentifier:]((uint64_t)self);
    }
    goto LABEL_10;
  }
  if (!v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SKPaymentAppleIDAuthorizationRequest initWithClientIdentifier:teamIdentifier:]((uint64_t)self);
    }
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  v14.receiver = self;
  v14.super_class = (Class)SKPaymentAppleIDAuthorizationRequest;
  v10 = [(SKPaymentAppleIDAuthorizationRequest *)&v14 init];
  p_isa = (id *)&v10->super.isa;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_clientIdentifier, a3);
    objc_storeStrong(p_isa + 2, a4);
  }
  self = p_isa;
  v12 = self;
LABEL_11:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(SKPaymentAppleIDAuthorizationRequest);
  uint64_t v5 = [(NSString *)self->_clientIdentifier copy];
  clientIdentifier = v4->_clientIdentifier;
  v4->_clientIdentifier = (NSString *)v5;

  uint64_t v7 = [(NSString *)self->_teamIdentifier copy];
  teamIdentifier = v4->_teamIdentifier;
  v4->_teamIdentifier = (NSString *)v7;

  uint64_t v9 = [(NSString *)self->_serviceIdentifier copy];
  serviceIdentifier = v4->_serviceIdentifier;
  v4->_serviceIdentifier = (NSString *)v9;

  return v4;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);

  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

- (void)initWithClientIdentifier:(uint64_t)a1 teamIdentifier:.cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[%{public}@]: Client identifier is nil", (uint8_t *)&v1, 0xCu);
}

- (void)initWithClientIdentifier:(uint64_t)a1 teamIdentifier:.cold.2(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[%{public}@]: Team identifier is nil", (uint8_t *)&v1, 0xCu);
}

@end