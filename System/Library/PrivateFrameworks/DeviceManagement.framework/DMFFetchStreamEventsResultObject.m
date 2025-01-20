@interface DMFFetchStreamEventsResultObject
+ (BOOL)supportsSecureCoding;
- (DMFFetchStreamEventsResultObject)initWithCoder:(id)a3;
- (NSArray)eventStatuses;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setEventStatuses:(id)a3;
@end

@implementation DMFFetchStreamEventsResultObject

- (id)description
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v6[0] = @"eventStatuses";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  v4 = DMFObjectDescriptionWithProperties(self, v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchStreamEventsResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DMFFetchStreamEventsResultObject;
  v5 = [(CATTaskResultObject *)&v17 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"eventStatuses"];
    eventStatuses = v5->_eventStatuses;
    v5->_eventStatuses = (NSArray *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMFFetchStreamEventsResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = [(DMFFetchStreamEventsResultObject *)self eventStatuses];
  [v4 encodeObject:v5 forKey:@"eventStatuses"];
}

- (NSArray)eventStatuses
{
  return self->_eventStatuses;
}

- (void)setEventStatuses:(id)a3
{
}

- (void).cxx_destruct
{
}

@end