@interface DASContextInfo
+ (DASContextInfo)contextInfoWithIdentifier:(unsigned int)a3 pid:(int)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)raw;
- (id)_initWithIdentifier:(unsigned int)a3 pid:(int)a4 raw:(id)a5;
- (id)description;
- (int)pid;
- (unint64_t)hash;
- (unsigned)identifier;
@end

@implementation DASContextInfo

- (void).cxx_destruct
{
}

- (NSString)raw
{
  return self->_raw;
}

- (int)pid
{
  return self->_pid;
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (id)description
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  v4 = +[NSString stringWithFormat:@"%x", self->_identifier];
  [v3 appendString:v4 withName:@"id"];

  id v5 = [v3 appendInt:self->_pid withName:@"pid"];
  v6 = [v3 build];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = +[BSEqualsBuilder builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  uint64_t identifier = self->_identifier;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100001964;
  v18[3] = &unk_1000103F0;
  id v7 = v4;
  id v19 = v7;
  id v8 = [v5 appendUnsignedInteger:identifier counterpart:v18];
  uint64_t pid = self->_pid;
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_100001970;
  v16 = &unk_100010418;
  id v17 = v7;
  id v10 = v7;
  id v11 = [v5 appendInteger:pid counterpart:&v13];
  LOBYTE(pid) = objc_msgSend(v5, "isEqual", v13, v14, v15, v16);

  return pid;
}

- (unint64_t)hash
{
  v3 = +[BSHashBuilder builder];
  id v4 = [v3 appendUnsignedInteger:self->_identifier];
  id v5 = [v3 appendInteger:self->_pid];
  id v6 = [v3 hash];

  return (unint64_t)v6;
}

- (id)_initWithIdentifier:(unsigned int)a3 pid:(int)a4 raw:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)DASContextInfo;
  v9 = [(DASContextInfo *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    v9->_uint64_t identifier = a3;
    v9->_uint64_t pid = a4;
    id v11 = (NSString *)[v8 copy];
    raw = v10->_raw;
    v10->_raw = v11;
  }
  return v10;
}

+ (DASContextInfo)contextInfoWithIdentifier:(unsigned int)a3 pid:(int)a4
{
  id v4 = [objc_alloc((Class)a1) _initWithIdentifier:*(void *)&a3 pid:*(void *)&a4 raw:0];
  return (DASContextInfo *)v4;
}

@end