@interface BRSetupControllerTracker
- (BRSetupControllerDetails)holdControllerDetails;
- (BRSetupControllerTracker)init;
- (NSMutableArray)setupControllers;
- (id)lastPushedSetupController;
- (void)addSetupController:(id)a3 action:(unint64_t)a4;
- (void)clearControllerHold;
- (void)setHoldControllerDetails:(id)a3;
- (void)setSetupControllers:(id)a3;
@end

@implementation BRSetupControllerTracker

- (BRSetupControllerTracker)init
{
  v6.receiver = self;
  v6.super_class = (Class)BRSetupControllerTracker;
  v2 = [(BRSetupControllerTracker *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    setupControllers = v2->_setupControllers;
    v2->_setupControllers = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)addSetupController:(id)a3 action:(unint64_t)a4
{
  id v6 = a3;
  id v9 = [NSNumber numberWithDouble:CACurrentMediaTime()];
  v7 = objc_alloc_init(BRSetupControllerDetails);
  [(BRSetupControllerDetails *)v7 setTimeStamp:v9];
  [(BRSetupControllerDetails *)v7 setControllerName:v6];

  if (a4)
  {
    [(BRSetupControllerTracker *)self setHoldControllerDetails:v7];
  }
  else
  {
    v8 = [(BRSetupControllerTracker *)self setupControllers];
    [v8 addObject:v7];

    [(BRSetupControllerTracker *)self clearControllerHold];
  }
}

- (id)lastPushedSetupController
{
  uint64_t v3 = [(BRSetupControllerTracker *)self setupControllers];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = NSNumber;
    id v6 = [(BRSetupControllerTracker *)self setupControllers];
    v7 = objc_msgSend(v5, "numberWithLong:", objc_msgSend(v6, "count") + 1);

    v8 = [(BRSetupControllerTracker *)self setupControllers];
    id v9 = [v8 lastObject];

    [v9 setControllerOrder:v7];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)clearControllerHold
{
}

- (NSMutableArray)setupControllers
{
  return self->_setupControllers;
}

- (void)setSetupControllers:(id)a3
{
}

- (BRSetupControllerDetails)holdControllerDetails
{
  return self->_holdControllerDetails;
}

- (void)setHoldControllerDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_holdControllerDetails, 0);

  objc_storeStrong((id *)&self->_setupControllers, 0);
}

@end