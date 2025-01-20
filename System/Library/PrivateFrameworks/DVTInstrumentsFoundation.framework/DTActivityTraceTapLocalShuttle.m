@interface DTActivityTraceTapLocalShuttle
- (BOOL)didPrepare;
- (BOOL)didStart;
- (BOOL)didStop;
- (BOOL)isFetchComplete;
- (BOOL)shouldFetch;
- (BOOL)shouldStart;
- (BOOL)shouldStop;
- (DTOSLogLoader)loaderStop;
- (DTOSLogLoaderConfiguration)configuration;
- (NSData)nextOutputBytes;
- (NSError)failureReason;
- (XRMobileAgentDock)ownersDock;
- (double)fetchWindow;
- (id)processDetectionCallback;
- (unint64_t)lastMachContinuousTime;
- (unsigned)lostEventsSinceLastVisit;
- (void)addPidToExecEntriesFromMapping:(id)a3;
- (void)executeStopOnItinerary:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDidPrepare:(BOOL)a3;
- (void)setDidStart:(BOOL)a3;
- (void)setDidStop:(BOOL)a3;
- (void)setFailureReason:(id)a3;
- (void)setFetchComplete:(BOOL)a3;
- (void)setFetchWindow:(double)a3;
- (void)setLastMachContinuousTime:(unint64_t)a3;
- (void)setLoaderStop:(id)a3;
- (void)setLostEventsSinceLastVisit:(unsigned int)a3;
- (void)setNextOutputBytes:(id)a3;
- (void)setOwnersDock:(id)a3;
- (void)setProcessDetectionCallback:(id)a3;
- (void)setShouldFetch:(BOOL)a3;
- (void)setShouldStart:(BOOL)a3;
- (void)setShouldStop:(BOOL)a3;
@end

@implementation DTActivityTraceTapLocalShuttle

- (void)executeStopOnItinerary:(id)a3
{
  id v4 = a3;
  v5 = [(XRMobileAgent *)self mode];
  v6 = v5;
  if (v5 == (__CFString *)*MEMORY[0x263F38CF8])
  {
    v17.receiver = self;
    v17.super_class = (Class)DTActivityTraceTapLocalShuttle;
    [(XRMobileAgent *)&v17 executeStopOnItinerary:v4];
    self->_didPrepare = 0;
    loaderStop = self->_loaderStop;
    v8 = [(DTActivityTraceTapLocalShuttle *)self configuration];
    v9 = [(DTOSLogLoader *)loaderStop ticketToPrepare:self configuration:v8];

    v10 = self->_loaderStop;
    v11 = @"Preparing Stream";
LABEL_9:
    [v4 setNextStop:v10 mode:v11 ticket:v9];

    goto LABEL_23;
  }
  if (v5 == @"Preparing Stream")
  {
    self->_didPrepare = 1;
    self->_didStart = 0;
    goto LABEL_22;
  }
  if (v5 == @"Starting Stream")
  {
    uint64_t v12 = 51;
    goto LABEL_21;
  }
  if (v5 != @"Waiting")
  {
    if (v5 != @"Stopping Stream")
    {
      if (v5 != @"Fetching")
      {
        v16.receiver = self;
        v16.super_class = (Class)DTActivityTraceTapLocalShuttle;
        [(XRMobileAgent *)&v16 executeStopOnItinerary:v4];
        goto LABEL_23;
      }
LABEL_22:
      [v4 setNextStop:self->_ownersDock mode:@"Waiting"];
      goto LABEL_23;
    }
    uint64_t v12 = 53;
LABEL_21:
    *((unsigned char *)&self->super.super.isa + v12) = 1;
    goto LABEL_22;
  }
  if (self->_shouldStart && !self->_didStart)
  {
    v9 = [(DTOSLogLoader *)self->_loaderStop ticketToStartStream:self];
    v10 = self->_loaderStop;
    v11 = @"Starting Stream";
    goto LABEL_9;
  }
  if (self->_shouldStop && !self->_didStop)
  {
    v9 = [(DTOSLogLoader *)self->_loaderStop ticketToStopStream:self];
    v10 = self->_loaderStop;
    v11 = @"Stopping Stream";
    goto LABEL_9;
  }
  if (self->_shouldFetch)
  {
    id commonFetchTicket = self->_commonFetchTicket;
    if (!commonFetchTicket)
    {
      v14 = [(DTOSLogLoader *)self->_loaderStop ticketToFetchData:self window:self->_fetchWindow];
      id v15 = self->_commonFetchTicket;
      self->_id commonFetchTicket = v14;

      id commonFetchTicket = self->_commonFetchTicket;
    }
    [v4 setNextStop:self->_loaderStop mode:@"Fetching" ticket:commonFetchTicket];
  }
  else
  {
    [v4 revisit];
  }
LABEL_23:
}

- (void)addPidToExecEntriesFromMapping:(id)a3
{
  if (self->_processDetectionCallback)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = sub_2308D0688;
    v3[3] = &unk_264B8F448;
    v3[4] = self;
    [a3 enumerateObjectsAndIntegerKeys:v3];
  }
}

- (NSData)nextOutputBytes
{
  return self->nextOutputBytes;
}

- (void)setNextOutputBytes:(id)a3
{
}

- (BOOL)isFetchComplete
{
  return self->fetchComplete;
}

- (void)setFetchComplete:(BOOL)a3
{
  self->fetchComplete = a3;
}

- (unint64_t)lastMachContinuousTime
{
  return self->lastMachContinuousTime;
}

- (void)setLastMachContinuousTime:(unint64_t)a3
{
  self->lastMachContinuousTime = a3;
}

- (unsigned)lostEventsSinceLastVisit
{
  return self->lostEventsSinceLastVisit;
}

- (void)setLostEventsSinceLastVisit:(unsigned int)a3
{
  self->lostEventsSinceLastVisit = a3;
}

- (NSError)failureReason
{
  return self->failureReason;
}

- (void)setFailureReason:(id)a3
{
}

- (BOOL)didPrepare
{
  return self->_didPrepare;
}

- (void)setDidPrepare:(BOOL)a3
{
  self->_didPrepare = a3;
}

- (BOOL)shouldStart
{
  return self->_shouldStart;
}

- (void)setShouldStart:(BOOL)a3
{
  self->_shouldStart = a3;
}

- (BOOL)didStart
{
  return self->_didStart;
}

- (void)setDidStart:(BOOL)a3
{
  self->_didStart = a3;
}

- (BOOL)shouldStop
{
  return self->_shouldStop;
}

- (void)setShouldStop:(BOOL)a3
{
  self->_shouldStop = a3;
}

- (BOOL)didStop
{
  return self->_didStop;
}

- (void)setDidStop:(BOOL)a3
{
  self->_didStop = a3;
}

- (BOOL)shouldFetch
{
  return self->_shouldFetch;
}

- (void)setShouldFetch:(BOOL)a3
{
  self->_shouldFetch = a3;
}

- (DTOSLogLoaderConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (id)processDetectionCallback
{
  return self->_processDetectionCallback;
}

- (void)setProcessDetectionCallback:(id)a3
{
}

- (double)fetchWindow
{
  return self->_fetchWindow;
}

- (void)setFetchWindow:(double)a3
{
  self->_fetchWindow = a3;
}

- (DTOSLogLoader)loaderStop
{
  return self->_loaderStop;
}

- (void)setLoaderStop:(id)a3
{
}

- (XRMobileAgentDock)ownersDock
{
  return self->_ownersDock;
}

- (void)setOwnersDock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownersDock, 0);
  objc_storeStrong((id *)&self->_loaderStop, 0);
  objc_storeStrong(&self->_processDetectionCallback, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->failureReason, 0);
  objc_storeStrong((id *)&self->nextOutputBytes, 0);
  objc_storeStrong(&self->_commonFetchTicket, 0);
}

@end