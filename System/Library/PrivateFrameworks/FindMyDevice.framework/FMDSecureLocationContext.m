@interface FMDSecureLocationContext
+ (BOOL)supportsSecureCoding;
- (BOOL)stopMonitoringActivePolicy;
- (FMDSecureLocationContext)initWithCoder:(id)a3;
- (NSString)findMyId;
- (NSString)mode;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setFindMyId:(id)a3;
- (void)setMode:(id)a3;
- (void)setStopMonitoringActivePolicy:(BOOL)a3;
@end

@implementation FMDSecureLocationContext

- (FMDSecureLocationContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMDSecureLocationContext;
  v5 = [(FMDSecureLocationContext *)&v9 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"findMyId"];
    [(FMDSecureLocationContext *)v5 setFindMyId:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mode"];
    [(FMDSecureLocationContext *)v5 setMode:v7];

    -[FMDSecureLocationContext setStopMonitoringActivePolicy:](v5, "setStopMonitoringActivePolicy:", [v4 decodeBoolForKey:@"stopMonitoringActivePolicy"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(FMDSecureLocationContext *)self findMyId];
  [v6 encodeObject:v4 forKey:@"findMyId"];

  v5 = [(FMDSecureLocationContext *)self mode];
  [v6 encodeObject:v5 forKey:@"mode"];

  objc_msgSend(v6, "encodeBool:forKey:", -[FMDSecureLocationContext stopMonitoringActivePolicy](self, "stopMonitoringActivePolicy"), @"stopMonitoringActivePolicy");
}

- (void)setMode:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(FMDSecureLocationContext *)self findMyId];
  v5 = [(FMDSecureLocationContext *)self mode];
  id v6 = [v3 stringWithFormat:@"findMyId %@ mode %@ stopMonitoringActivePolicy %i", v4, v5, -[FMDSecureLocationContext stopMonitoringActivePolicy](self, "stopMonitoringActivePolicy")];

  return v6;
}

- (NSString)findMyId
{
  return self->_findMyId;
}

- (void)setFindMyId:(id)a3
{
}

- (NSString)mode
{
  return self->_mode;
}

- (BOOL)stopMonitoringActivePolicy
{
  return self->_stopMonitoringActivePolicy;
}

- (void)setStopMonitoringActivePolicy:(BOOL)a3
{
  self->_stopMonitoringActivePolicy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mode, 0);

  objc_storeStrong((id *)&self->_findMyId, 0);
}

@end