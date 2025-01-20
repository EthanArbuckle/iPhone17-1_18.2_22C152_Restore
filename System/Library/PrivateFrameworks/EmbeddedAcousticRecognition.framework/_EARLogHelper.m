@interface _EARLogHelper
+ (void)setCustomQuasarLogLevel:(int)a3;
@end

@implementation _EARLogHelper

+ (void)setCustomQuasarLogLevel:(int)a3
{
  quasar::gLogLevel = a3;
  if (a3 == 5) {
    int v3 = 1;
  }
  else {
    int v3 = 5;
  }
  if (a3 == 4) {
    int v3 = 0;
  }
  if ((a3 & 0xFC) == 0) {
    int v3 = -1;
  }
  kaldi::g_kaldi_verbose_level = v3;
}

@end