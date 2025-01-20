@interface CSPhoneCallStateMonitorFactory
+ (id)phoneCallStateMonitor;
@end

@implementation CSPhoneCallStateMonitorFactory

+ (id)phoneCallStateMonitor
{
  BOOL v2 = +[CSUtils supportRelayCall];
  v3 = off_1E61FEAD0;
  if (!v2) {
    v3 = off_1E61FE810;
  }
  v4 = [(__objc2_class *)*v3 sharedInstance];
  return v4;
}

@end