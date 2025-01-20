@interface CMSNetworkActivity
+ (BOOL)supportsSecureCoding;
- (CMSNetworkActivity)initWithCoder:(id)a3;
- (CMSNetworkActivity)initWithLabel:(unsigned int)a3 parentActivity:(id)a4;
- (CMSNetworkActivity)initWithLabel:(unsigned int)a3 parentUUID:(id)a4;
- (CMSNetworkActivity)initWithRetry:(id)a3;
- (OS_nw_activity)nwActivity;
- (unsigned)label;
- (void)associateWithTask:(id)a3;
- (void)completeActivity:(int)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMSNetworkActivity

- (CMSNetworkActivity)initWithLabel:(unsigned int)a3 parentUUID:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CMSNetworkActivity;
  v7 = [(CMSNetworkActivity *)&v13 init];
  v8 = v7;
  if (v7)
  {
    v7->_label = a3;
    uint64_t v9 = nw_activity_create();
    nwActivity = v8->_nwActivity;
    v8->_nwActivity = (OS_nw_activity *)v9;

    v11 = nwActivityFromUUID(v6);
    if (v11) {
      nw_activity_set_parent_activity();
    }
    nw_activity_activate();
  }
  return v8;
}

- (CMSNetworkActivity)initWithLabel:(unsigned int)a3 parentActivity:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CMSNetworkActivity;
  v7 = [(CMSNetworkActivity *)&v14 init];
  v8 = v7;
  if (v7)
  {
    v7->_label = a3;
    uint64_t v9 = nw_activity_create();
    nwActivity = v8->_nwActivity;
    v8->_nwActivity = (OS_nw_activity *)v9;

    v11 = [v6 nwActivity];

    if (v11)
    {
      v12 = [v6 nwActivity];
      nw_activity_set_parent_activity();
    }
    nw_activity_activate();
  }

  return v8;
}

- (CMSNetworkActivity)initWithRetry:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CMSNetworkActivity;
  v5 = [(CMSNetworkActivity *)&v10 init];
  if (v5)
  {
    v5->_label = [v4 label];
    id v6 = [v4 nwActivity];
    uint64_t retry = nw_activity_create_retry();
    nwActivity = v5->_nwActivity;
    v5->_nwActivity = (OS_nw_activity *)retry;

    nw_activity_activate();
  }

  return v5;
}

- (void)dealloc
{
  [(CMSNetworkActivity *)self completeActivity:1];
  v3.receiver = self;
  v3.super_class = (Class)CMSNetworkActivity;
  [(CMSNetworkActivity *)&v3 dealloc];
}

- (void)associateWithTask:(id)a3
{
  id v4 = a3;
  id v5 = [(CMSNetworkActivity *)self nwActivity];
  objc_msgSend(v4, "set_nw_activity:", v5);
}

- (void)completeActivity:(int)a3
{
  if (!self->_completed)
  {
    self->_completed = 1;
    id v3 = [(CMSNetworkActivity *)self nwActivity];
    nw_activity_complete_with_reason();
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMSNetworkActivity)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CMSNetworkActivity;
  id v5 = [(CMSNetworkActivity *)&v10 init];
  if (v5)
  {
    v5->_label = [v4 decodeInt32ForKey:@"label"];
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nwActivityUUID"];
    uint64_t v7 = nwActivityFromUUID(v6);
    nwActivity = v5->_nwActivity;
    v5->_nwActivity = (OS_nw_activity *)v7;

    v5->_completed = [v4 decodeBoolForKey:@"completed"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[CMSNetworkActivity label](self, "label"), @"label");
  id v5 = [(CMSNetworkActivity *)self nwActivity];
  if (v5)
  {
    v7[0] = 0;
    v7[1] = 0;
    nw_activity_get_token();
    id v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:v7];
  }
  else
  {
    id v6 = 0;
  }
  [v4 encodeObject:v6 forKey:@"nwActivityUUID"];

  [v4 encodeBool:self->_completed forKey:@"completed"];
}

- (unsigned)label
{
  return self->_label;
}

- (OS_nw_activity)nwActivity
{
  return self->_nwActivity;
}

- (void).cxx_destruct
{
}

@end