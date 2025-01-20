@interface DACLifecycleInfo
+ (BOOL)supportsSecureCoding;
- (DACActivityDescriptor)activity;
- (DACActivityDescriptor)origin;
- (DACChangeMarker)changeMarker;
- (DACLifecycleInfo)initWithCoder:(id)a3;
- (id)_initWithActivity:(id)a3 state:(unint64_t)a4 reason:(unint64_t)a5 origin:(id)a6 changeMarker:(id)a7;
- (id)description;
- (unint64_t)reason;
- (unint64_t)state;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DACLifecycleInfo

- (id)_initWithActivity:(id)a3 state:(unint64_t)a4 reason:(unint64_t)a5 origin:(id)a6 changeMarker:(id)a7
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)DACLifecycleInfo;
  v16 = [(DACLifecycleInfo *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_activity, a3);
    v17->_state = a4;
    v17->_reason = a5;
    objc_storeStrong((id *)&v17->_origin, a6);
    objc_storeStrong((id *)&v17->_changeMarker, a7);
  }

  return v17;
}

- (id)description
{
  v3 = NSString;
  v4 = [(DACLifecycleInfo *)self activity];
  unint64_t v5 = [(DACLifecycleInfo *)self state];
  unint64_t v6 = [(DACLifecycleInfo *)self reason];
  v7 = [(DACLifecycleInfo *)self origin];
  v8 = [v3 stringWithFormat:@"Activity(%@) State(%lu) Reason(%lu) Origin(%@)", v4, v5, v6, v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:1 forKey:@"version"];
  unint64_t v5 = [(DACLifecycleInfo *)self activity];
  [v4 encodeObject:v5 forKey:@"activity"];

  unint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DACLifecycleInfo state](self, "state"));
  [v4 encodeObject:v6 forKey:@"state"];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DACLifecycleInfo reason](self, "reason"));
  [v4 encodeObject:v7 forKey:@"reason"];

  v8 = [(DACLifecycleInfo *)self origin];
  [v4 encodeObject:v8 forKey:@"origin"];

  id v9 = [(DACLifecycleInfo *)self changeMarker];
  [v4 encodeObject:v9 forKey:@"changeMarker"];
}

- (DACLifecycleInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 decodeIntegerForKey:@"version"] < 1)
  {
    v12 = 0;
    unint64_t v5 = self;
  }
  else
  {
    unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activity"];
    unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"state"];
    uint64_t v7 = [v6 unsignedIntegerValue];
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reason"];
    uint64_t v9 = [v8 unsignedIntegerValue];
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"origin"];
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"changeMarker"];
    if (v5 && v6 && v8)
    {
      v12 = [(DACLifecycleInfo *)self _initWithActivity:v5 state:v7 reason:v9 origin:v10 changeMarker:v11];
    }
    else
    {

      v12 = 0;
    }
  }
  return v12;
}

- (DACActivityDescriptor)activity
{
  return self->_activity;
}

- (unint64_t)state
{
  return self->_state;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (DACActivityDescriptor)origin
{
  return self->_origin;
}

- (DACChangeMarker)changeMarker
{
  return self->_changeMarker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeMarker, 0);
  objc_storeStrong((id *)&self->_origin, 0);

  objc_storeStrong((id *)&self->_activity, 0);
}

@end