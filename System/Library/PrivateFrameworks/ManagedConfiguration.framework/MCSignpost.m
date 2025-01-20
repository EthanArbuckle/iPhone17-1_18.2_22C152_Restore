@interface MCSignpost
- (MCSignpost)initWithProcess:(id)a3 type:(unint64_t)a4 feature:(id)a5 timestamp:(id)a6;
- (NSDate)timestamp;
- (NSString)feature;
- (NSString)process;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)type;
@end

@implementation MCSignpost

- (MCSignpost)initWithProcess:(id)a3 type:(unint64_t)a4 feature:(id)a5 timestamp:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)MCSignpost;
  v13 = [(MCSignpost *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    process = v13->_process;
    v13->_process = (NSString *)v14;

    v13->_type = a4;
    uint64_t v16 = [v11 copy];
    feature = v13->_feature;
    v13->_feature = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    timestamp = v13->_timestamp;
    v13->_timestamp = (NSDate *)v18;
  }
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [MCSignpost alloc];
  v5 = [(MCSignpost *)self process];
  unint64_t v6 = [(MCSignpost *)self type];
  v7 = [(MCSignpost *)self feature];
  v8 = [(MCSignpost *)self timestamp];
  v9 = [(MCSignpost *)v4 initWithProcess:v5 type:v6 feature:v7 timestamp:v8];

  return v9;
}

- (NSString)process
{
  return self->_process;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)feature
{
  return self->_feature;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_feature, 0);
  objc_storeStrong((id *)&self->_process, 0);
}

@end