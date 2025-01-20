@interface ARPRoutingSessionArchive
+ (BOOL)supportsSecureCoding;
- (ARPRoutingSessionArchive)initWithCoder:(id)a3;
- (ARPRoutingSessionArchive)initWithSessions:(id)a3 routingSessionTimeout:(double)a4;
- (NSArray)sessions;
- (double)routingSessionTimeout;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ARPRoutingSessionArchive

- (ARPRoutingSessionArchive)initWithSessions:(id)a3 routingSessionTimeout:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ARPRoutingSessionArchive;
  v8 = [(ARPRoutingSessionArchive *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sessions, a3);
    v9->_routingSessionTimeout = a4;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(ARPRoutingSessionArchive *)self sessions];
  [(ARPRoutingSessionArchive *)self routingSessionTimeout];
  v6 = objc_msgSend(v4, "initWithSessions:routingSessionTimeout:", v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ARPRoutingSessionArchive *)self sessions];
  v6 = NSStringFromSelector(sel_sessions);
  [v4 encodeObject:v5 forKey:v6];

  [(ARPRoutingSessionArchive *)self routingSessionTimeout];
  double v8 = v7;
  NSStringFromSelector(sel_routingSessionTimeout);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeDouble:v9 forKey:v8];
}

- (ARPRoutingSessionArchive)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  double v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  double v8 = NSStringFromSelector(sel_sessions);
  id v9 = [v5 decodeObjectOfClasses:v7 forKey:v8];

  v10 = NSStringFromSelector(sel_routingSessionTimeout);
  [v5 decodeDoubleForKey:v10];
  double v12 = v11;

  v13 = [(ARPRoutingSessionArchive *)self initWithSessions:v9 routingSessionTimeout:v12];
  return v13;
}

- (NSArray)sessions
{
  return self->_sessions;
}

- (double)routingSessionTimeout
{
  return self->_routingSessionTimeout;
}

- (void).cxx_destruct
{
}

@end