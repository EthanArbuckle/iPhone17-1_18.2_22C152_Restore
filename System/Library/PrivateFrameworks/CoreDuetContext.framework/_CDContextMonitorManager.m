@interface _CDContextMonitorManager
+ (id)cleanKBEventNameKey:(id)a3;
+ (void)activateMonitorForKeyPath:(id)a3;
+ (void)initializeKeyPathEventStreamMapping;
@end

@implementation _CDContextMonitorManager

+ (void)activateMonitorForKeyPath:(id)a3
{
  id v3 = a3;
  +[_CDContextMonitorManager initializeKeyPathEventStreamMapping];
  v4 = (void *)MEMORY[0x1E4F5B380];
  v5 = [MEMORY[0x1E4F5B3C8] sharedInstance];
  id v7 = [v4 monitorManagerForEventStreams:v5 domain:1];

  v6 = [(id)keyPathToEventStream objectForKeyedSubscript:v3];

  [v7 populateCurrentValueForStreamName:v6];
}

+ (void)initializeKeyPathEventStreamMapping
{
  if (initializeKeyPathEventStreamMapping_onceToken != -1) {
    dispatch_once(&initializeKeyPathEventStreamMapping_onceToken, &__block_literal_global_33);
  }
}

+ (id)cleanKBEventNameKey:(id)a3
{
  id v3 = [a3 stringByReplacingOccurrencesOfString:@"/device" withString:@"/system"];
  v4 = [v3 stringByReplacingOccurrencesOfString:@"/user" withString:&stru_1EDDD9B38];

  return v4;
}

@end