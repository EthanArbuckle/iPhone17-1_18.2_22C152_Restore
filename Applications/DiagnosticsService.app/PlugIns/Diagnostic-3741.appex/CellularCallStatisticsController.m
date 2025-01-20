@interface CellularCallStatisticsController
- (DSCallStatisticsAggregator)aggregator;
- (void)cancel;
- (void)setAggregator:(id)a3;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
- (void)teardown;
@end

@implementation CellularCallStatisticsController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v5 = (id)objc_opt_new();
  [(CellularCallStatisticsController *)self setAggregator:v5];
}

- (void)start
{
  v3 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003AE8;
  block[3] = &unk_100004068;
  block[4] = self;
  dispatch_async(v3, block);

  v4 = [(CellularCallStatisticsController *)self aggregator];
  id v5 = [v4 getSynchronousResult];

  if (([(CellularCallStatisticsController *)self isCancelled] & 1) == 0 && v5)
  {
    v6 = [(CellularCallStatisticsController *)self result];
    [v6 setStatusCode:&off_100004098];

    v7 = [(CellularCallStatisticsController *)self result];
    [v7 setData:v5];
  }
  [(CellularCallStatisticsController *)self setFinished:1];
}

- (void)cancel
{
  id v2 = [(CellularCallStatisticsController *)self aggregator];
  [v2 cancel];
}

- (void)teardown
{
  v3 = [(CellularCallStatisticsController *)self aggregator];
  [v3 cancel];

  [(CellularCallStatisticsController *)self setAggregator:0];
}

- (DSCallStatisticsAggregator)aggregator
{
  return self->_aggregator;
}

- (void)setAggregator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end