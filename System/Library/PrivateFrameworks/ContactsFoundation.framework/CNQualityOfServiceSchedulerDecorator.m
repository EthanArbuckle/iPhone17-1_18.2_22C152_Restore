@interface CNQualityOfServiceSchedulerDecorator
- (CNQualityOfServiceSchedulerDecorator)initWithScheduler:(id)a3 qualityOfService:(unint64_t)a4;
- (CNScheduler)scheduler;
- (double)timestamp;
- (id)afterDelay:(double)a3 performBlock:(id)a4;
- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5;
- (id)performCancelableBlock:(id)a3;
- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4;
- (unint64_t)qualityOfService;
- (void)performBlock:(id)a3;
- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4;
@end

@implementation CNQualityOfServiceSchedulerDecorator

- (CNQualityOfServiceSchedulerDecorator)initWithScheduler:(id)a3 qualityOfService:(unint64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNQualityOfServiceSchedulerDecorator;
  v8 = [(CNQualityOfServiceSchedulerDecorator *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_scheduler, a3);
    v9->_qualityOfService = a4;
    v10 = v9;
  }

  return v9;
}

- (void)performBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(CNQualityOfServiceSchedulerDecorator *)self scheduler];
  objc_msgSend(v5, "performBlock:qualityOfService:", v4, -[CNQualityOfServiceSchedulerDecorator qualityOfService](self, "qualityOfService"));
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  id v6 = a4;
  id v7 = [(CNQualityOfServiceSchedulerDecorator *)self scheduler];
  v8 = objc_msgSend(v7, "afterDelay:performBlock:qualityOfService:", v6, -[CNQualityOfServiceSchedulerDecorator qualityOfService](self, "qualityOfService"), a3);

  return v8;
}

- (CNScheduler)scheduler
{
  return self->_scheduler;
}

- (unint64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void).cxx_destruct
{
}

- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(CNQualityOfServiceSchedulerDecorator *)self scheduler];
  [v7 performBlock:v6 qualityOfService:a4];
}

- (id)performCancelableBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(CNQualityOfServiceSchedulerDecorator *)self scheduler];
  id v6 = objc_msgSend(v5, "performCancelableBlock:qualityOfService:", v4, -[CNQualityOfServiceSchedulerDecorator qualityOfService](self, "qualityOfService"));

  return v6;
}

- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(CNQualityOfServiceSchedulerDecorator *)self scheduler];
  v8 = [v7 performCancelableBlock:v6 qualityOfService:a4];

  return v8;
}

- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5
{
  id v8 = a4;
  v9 = [(CNQualityOfServiceSchedulerDecorator *)self scheduler];
  v10 = [v9 afterDelay:v8 performBlock:a5 qualityOfService:a3];

  return v10;
}

- (double)timestamp
{
  v2 = [(CNQualityOfServiceSchedulerDecorator *)self scheduler];
  [v2 timestamp];
  double v4 = v3;

  return v4;
}

@end