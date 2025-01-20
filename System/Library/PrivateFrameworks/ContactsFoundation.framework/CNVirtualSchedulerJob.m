@interface CNVirtualSchedulerJob
+ (id)jobWithTime:(unint64_t)a3 block:(id)a4;
- (CNVirtualSchedulerJob)initWithTime:(unint64_t)a3 block:(id)a4;
- (id)block;
- (id)description;
- (unint64_t)time;
- (void)setTime:(unint64_t)a3;
@end

@implementation CNVirtualSchedulerJob

+ (id)jobWithTime:(unint64_t)a3 block:(id)a4
{
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initWithTime:a3 block:v6];

  return v7;
}

- (CNVirtualSchedulerJob)initWithTime:(unint64_t)a3 block:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNVirtualSchedulerJob;
  v7 = [(CNVirtualSchedulerJob *)&v13 init];
  v8 = v7;
  if (v7)
  {
    v7->_time = a3;
    uint64_t v9 = [v6 copy];
    id block = v8->_block;
    v8->_id block = (id)v9;

    v11 = v8;
  }

  return v8;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(CNVirtualSchedulerJob *)self time];
  v7 = [(CNVirtualSchedulerJob *)self block];
  v8 = _Block_copy(v7);
  uint64_t v9 = [v3 stringWithFormat:@"<%@: %p time=%lu block=%p", v5, self, v6, v8];

  return v9;
}

- (unint64_t)time
{
  return self->_time;
}

- (void)setTime:(unint64_t)a3
{
  self->_time = a3;
}

- (id)block
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

@end