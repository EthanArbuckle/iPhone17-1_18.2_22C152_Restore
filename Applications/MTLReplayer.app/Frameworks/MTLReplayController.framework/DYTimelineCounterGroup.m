@interface DYTimelineCounterGroup
+ (BOOL)supportsSecureCoding;
- (DYTimelineCounterGroup)init;
- (DYTimelineCounterGroup)initWithCoder:(id)a3;
- (NSArray)counterNames;
- (NSArray)counters;
- (NSData)timestamps;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCounterNames:(id)a3;
- (void)setCounters:(id)a3;
- (void)setTimestamps:(id)a3;
@end

@implementation DYTimelineCounterGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_counterNames, 0);
  objc_storeStrong((id *)&self->_counters, 0);

  objc_storeStrong((id *)&self->_timestamps, 0);
}

- (void)setCounterNames:(id)a3
{
}

- (NSArray)counterNames
{
  return self->_counterNames;
}

- (void)setCounters:(id)a3
{
}

- (NSArray)counters
{
  return self->_counters;
}

- (void)setTimestamps:(id)a3
{
}

- (NSData)timestamps
{
  return self->_timestamps;
}

- (DYTimelineCounterGroup)init
{
  v6.receiver = self;
  v6.super_class = (Class)DYTimelineCounterGroup;
  v2 = [(DYTimelineCounterGroup *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_timestamps forKey:@"timestamps"];
  [v4 encodeObject:self->_counters forKey:@"counters"];
  [v4 encodeObject:self->_counterNames forKey:@"countersNames"];
}

- (DYTimelineCounterGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)DYTimelineCounterGroup;
  v5 = [(DYTimelineCounterGroup *)&v24 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(), 0);
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"timestamps"];
    timestamps = v5->_timestamps;
    v5->_timestamps = (NSData *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"counters"];
    counters = v5->_counters;
    v5->_counters = (NSArray *)v15;

    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    v19 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v17, v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"countersNames"];
    counterNames = v5->_counterNames;
    v5->_counterNames = (NSArray *)v20;

    v22 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(DYTimelineCounterGroup *)self timestamps];
  id v6 = [v5 copy];
  [v4 setTimestamps:v6];

  v7 = [(DYTimelineCounterGroup *)self counters];
  id v8 = [v7 copy];
  [v4 setCounters:v8];

  v9 = [(DYTimelineCounterGroup *)self counterNames];
  id v10 = [v9 copy];
  [v4 setCounterNames:v10];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end