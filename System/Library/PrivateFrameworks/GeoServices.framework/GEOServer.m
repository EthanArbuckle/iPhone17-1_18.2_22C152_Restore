@interface GEOServer
+ (BOOL)messageSupportsOffline:(id)a3;
+ (BOOL)performsPairedDeviceSynchronization;
+ (BOOL)wantsPerMessageSignposts;
+ (Class)peerClass;
+ (NSArray)possibleBackgroundTaskIdentifiers;
+ (NSArray)possibleXPCActivityIdentifiers;
+ (id)handledPairedDeviceMessageTypes;
+ (id)identifier;
+ (unint64_t)launchMode;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (BOOL)handleIncomingPairedDeviceMessage:(id)a3;
- (BOOL)handleIncomingPairedDeviceMessage:(id)a3 completionHandler:(id)a4;
- (GEODaemon)daemon;
- (GEOServer)init;
- (GEOServer)initWithDaemon:(id)a3;
- (id)description;
- (void)runBackgroundTask:(id)a3;
- (void)runXPCActivity:(id)a3;
@end

@implementation GEOServer

+ (BOOL)wantsPerMessageSignposts
{
  return 1;
}

- (GEODaemon)daemon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);

  return (GEODaemon *)WeakRetained;
}

- (GEOServer)init
{
  result = (GEOServer *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOServer)initWithDaemon:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOServer;
  v5 = [(GEOServer *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    v7 = v6;
  }

  return v6;
}

+ (id)identifier
{
  return @"__invalid__";
}

+ (Class)peerClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)launchMode
{
  return 0;
}

+ (NSArray)possibleXPCActivityIdentifiers
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

+ (NSArray)possibleBackgroundTaskIdentifiers
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

+ (BOOL)messageSupportsOffline:(id)a3
{
  return 0;
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  return 0;
}

+ (id)handledPairedDeviceMessageTypes
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)handleIncomingPairedDeviceMessage:(id)a3
{
  return 0;
}

- (BOOL)handleIncomingPairedDeviceMessage:(id)a3 completionHandler:(id)a4
{
  return 0;
}

- (void)runXPCActivity:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    int v4 = 138543362;
    id v5 = a3;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: Asked to run unhandled XPC Activity: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)runBackgroundTask:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    int v4 = [v3 identifier];
    int v5 = 138543362;
    uint64_t v6 = v4;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: Asked to run unhandled BackgroundTask: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  [v3 setTaskCompleted];
}

+ (BOOL)performsPairedDeviceSynchronization
{
  return 0;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), self];
}

- (void).cxx_destruct
{
}

@end