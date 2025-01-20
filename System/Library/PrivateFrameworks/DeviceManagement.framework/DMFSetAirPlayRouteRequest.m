@interface DMFSetAirPlayRouteRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)suppressPasscodePrompt;
- (DMFSetAirPlayRouteRequest)initWithCoder:(id)a3;
- (NSString)password;
- (NSString)routeUID;
- (void)encodeWithCoder:(id)a3;
- (void)setPassword:(id)a3;
- (void)setRouteUID:(id)a3;
- (void)setSuppressPasscodePrompt:(BOOL)a3;
@end

@implementation DMFSetAirPlayRouteRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFSetAirPlayRouteRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DMFSetAirPlayRouteRequest;
  v5 = [(CATTaskRequest *)&v14 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"routeUID"];
    routeUID = v5->_routeUID;
    v5->_routeUID = (NSString *)v7;

    v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"password"];
    password = v5->_password;
    v5->_password = (NSString *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suppressPasscodePrompt"];
    v5->_suppressPasscodePrompt = [v12 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)DMFSetAirPlayRouteRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v8 encodeWithCoder:v4];
  v5 = [(DMFSetAirPlayRouteRequest *)self routeUID];
  [v4 encodeObject:v5 forKey:@"routeUID"];

  v6 = [(DMFSetAirPlayRouteRequest *)self password];
  [v4 encodeObject:v6 forKey:@"password"];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[DMFSetAirPlayRouteRequest suppressPasscodePrompt](self, "suppressPasscodePrompt"));
  [v4 encodeObject:v7 forKey:@"suppressPasscodePrompt"];
}

- (NSString)routeUID
{
  return self->_routeUID;
}

- (void)setRouteUID:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (BOOL)suppressPasscodePrompt
{
  return self->_suppressPasscodePrompt;
}

- (void)setSuppressPasscodePrompt:(BOOL)a3
{
  self->_suppressPasscodePrompt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_routeUID, 0);
}

@end