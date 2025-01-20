@interface LBPluginBitacoraHandler
+ (BOOL)emitPerformTrialTaskEvent:(id)a3 succeeded:(BOOL)a4 error:(id)a5;
+ (BOOL)emitStopEvent:(id)a3 succeeded:(BOOL)a4 error:(id)a5;
@end

@implementation LBPluginBitacoraHandler

+ (BOOL)emitPerformTrialTaskEvent:(id)a3 succeeded:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  v9 = +[LBFEventManager sharedInstance];
  id v10 = objc_alloc((Class)LBFTrialIdentifiers);
  v11 = [v8 experimentId];
  id v12 = [v8 deploymentId];
  v13 = [v8 treatmentId];

  id v14 = [v10 initWithExperimentID:v11 deploymentID:v12 treatmentID:v13];
  id v15 = [objc_alloc((Class)LBFLighthouseEvent) initWithPerformTrialTaskStatus:v5 error:v7 usePrivateUpload:0];

  uint64_t v17 = 0;
  LOBYTE(v7) = [v9 addLighthousePluginEvent:v15 identifiers:v14 error:&v17];

  return (char)v7;
}

+ (BOOL)emitStopEvent:(id)a3 succeeded:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  v9 = +[LBFEventManager sharedInstance];
  id v10 = objc_alloc((Class)LBFTrialIdentifiers);
  v11 = [v8 experimentId];
  id v12 = [v8 deploymentId];
  v13 = [v8 treatmentId];

  id v14 = [v10 initWithExperimentID:v11 deploymentID:v12 treatmentID:v13];
  id v15 = [objc_alloc((Class)LBFLighthouseEvent) initWithStop:v5 error:v7];

  uint64_t v17 = 0;
  LOBYTE(v7) = [v9 addLighthousePluginEvent:v15 identifiers:v14 error:&v17];

  return (char)v7;
}

@end