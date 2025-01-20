@interface TouchIDSensorSPIBusIntegrityTestController
- (NSMutableArray)allResults;
- (NSTimer)runTimer;
- (TouchIDSensorSPIBusIntegrityInputs)inputs;
- (int)runCount;
- (void)finish;
- (void)runDiagnostic;
- (void)setAllResults:(id)a3;
- (void)setInputs:(id)a3;
- (void)setRunCount:(int)a3;
- (void)setRunTimer:(id)a3;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
- (void)teardown;
@end

@implementation TouchIDSensorSPIBusIntegrityTestController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
}

- (void)start
{
  v3 = [(TouchIDSensorSPIBusIntegrityTestController *)self inputs];
  if ([v3 numberOfRuns])
  {
    v4 = [(TouchIDSensorSPIBusIntegrityTestController *)self inputs];
    [v4 runDelay];
    double v6 = v5;

    if (v6 != 0.0)
    {
      v7 = [(TouchIDSensorSPIBusIntegrityTestController *)self result];
      [v7 setStatusCode:&off_1000043B8];

      id v8 = objc_alloc((Class)NSMutableArray);
      v9 = [(TouchIDSensorSPIBusIntegrityTestController *)self inputs];
      id v10 = [v8 initWithCapacity:(int)[v9 numberOfRuns]];
      [(TouchIDSensorSPIBusIntegrityTestController *)self setAllResults:v10];

      [(TouchIDSensorSPIBusIntegrityTestController *)self setRunCount:0];
      if (([(TouchIDSensorSPIBusIntegrityTestController *)self isCancelled] & 1) == 0)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100001AD4;
        block[3] = &unk_100004128;
        block[4] = self;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
      return;
    }
  }
  else
  {
  }
  v11 = [(TouchIDSensorSPIBusIntegrityTestController *)self result];
  [v11 setStatusCode:&off_1000043A0];

  [(TouchIDSensorSPIBusIntegrityTestController *)self setFinished:1];
}

- (void)runDiagnostic
{
  if ([(TouchIDSensorSPIBusIntegrityTestController *)self isCancelled]) {
    goto LABEL_5;
  }
  uint64_t v3 = [(TouchIDSensorSPIBusIntegrityTestController *)self runTimer];
  if (!v3
    || (v4 = (void *)v3,
        signed int v5 = [(TouchIDSensorSPIBusIntegrityTestController *)self runCount],
        [(TouchIDSensorSPIBusIntegrityTestController *)self inputs],
        double v6 = objc_claimAutoreleasedReturnValue(),
        signed int v7 = [v6 numberOfRuns],
        v6,
        v4,
        v5 >= v7))
  {
LABEL_5:
    id v9 = [(TouchIDSensorSPIBusIntegrityTestController *)self runTimer];
    [v9 invalidate];
  }
  else
  {
    id v8 = dispatch_queue_create("com.apple.DiagnosticsService.Diagnostic-4182.SPIIntegrity", 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100001C90;
    block[3] = &unk_100004128;
    block[4] = self;
    dispatch_async(v8, block);
  }
}

- (void)finish
{
  CFStringRef v6 = @"results";
  uint64_t v3 = [(TouchIDSensorSPIBusIntegrityTestController *)self allResults];
  signed int v7 = v3;
  v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  signed int v5 = [(TouchIDSensorSPIBusIntegrityTestController *)self result];
  [v5 setData:v4];

  [(TouchIDSensorSPIBusIntegrityTestController *)self setFinished:1];
}

- (void)teardown
{
  uint64_t v3 = [(TouchIDSensorSPIBusIntegrityTestController *)self runTimer];

  if (v3)
  {
    v4 = [(TouchIDSensorSPIBusIntegrityTestController *)self runTimer];
    [v4 invalidate];

    [(TouchIDSensorSPIBusIntegrityTestController *)self setRunTimer:0];
  }
}

- (NSMutableArray)allResults
{
  return self->_allResults;
}

- (void)setAllResults:(id)a3
{
}

- (NSTimer)runTimer
{
  return self->_runTimer;
}

- (void)setRunTimer:(id)a3
{
}

- (int)runCount
{
  return self->_runCount;
}

- (void)setRunCount:(int)a3
{
  self->_runCount = a3;
}

- (TouchIDSensorSPIBusIntegrityInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_runTimer, 0);

  objc_storeStrong((id *)&self->_allResults, 0);
}

@end