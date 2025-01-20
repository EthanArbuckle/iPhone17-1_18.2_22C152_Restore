@interface iPodOutHelper
- (iPodOutHelper)init;
- (void)applicationStateChanged:(id)a3;
- (void)dealloc;
@end

@implementation iPodOutHelper

- (iPodOutHelper)init
{
  v4.receiver = self;
  v4.super_class = (Class)iPodOutHelper;
  v2 = [(iPodOutHelper *)&v4 init];
  if (v2)
  {
    dword_10013C808 = 0;
    [(id)qword_10013BAD8 setDelegate:v2];
    [(id)qword_10013BAD8 startObserving];
  }
  return v2;
}

- (void)dealloc
{
  [(id)qword_10013BAD8 stopObserving];
  v3.receiver = self;
  v3.super_class = (Class)iPodOutHelper;
  [(iPodOutHelper *)&v3 dealloc];
}

- (void)applicationStateChanged:(id)a3
{
  if (!objc_msgSend(objc_msgSend(a3, "objectForKey:", BKSApplicationStateDisplayIDKey), "caseInsensitiveCompare:", @"com.apple.iphoneos.iPodOut"))
  {
    unsigned int v4 = objc_msgSend(objc_msgSend(a3, "objectForKey:", BKSApplicationStateKey), "unsignedIntValue");
    if (v4 != dword_10013C808)
    {
      dword_10013C808 = v4;
      if (qword_10013BAE8 != -1) {
        dispatch_once(&qword_10013BAE8, &stru_100121B88);
      }
      uint64_t v5 = qword_10013BAE0;
      if (!qword_10013BAE0 || (qword_10013BAE0 & 7) != 0)
      {
        __break(0x5516u);
      }
      else
      {
        char v6 = dword_10013C808 > 1;
        sub_10000D964(v5, v6);
      }
    }
  }
}

@end