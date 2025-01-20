@interface IMDFilePurgeabilityMonitor
+ (id)sharedInstance;
- (IMDFilePurgeabilityMonitor)init;
- (void)dealloc;
- (void)observeFileEvents:(id)a3;
- (void)userNotificationDidFinish:(id)a3;
@end

@implementation IMDFilePurgeabilityMonitor

+ (id)sharedInstance
{
  if (qword_1EBE2AEC0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EBE2AEB0;

  return v2;
}

- (IMDFilePurgeabilityMonitor)init
{
  return (IMDFilePurgeabilityMonitor *)sub_1D989A820();
}

- (void)observeFileEvents:(id)a3
{
  uint64_t v4 = sub_1D99062E0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D99062B0();
  v8 = self;
  sub_1D989AAEC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)userNotificationDidFinish:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  IMDFilePurgeabilityMonitor.userNotificationDidFinish(_:)(a3);
}

- (void)dealloc
{
  sub_1D968E084(0, &qword_1EA8C94F0);
  v3 = self;
  uint64_t v4 = (void *)sub_1D989D1A4();
  if (v4)
  {
    id v5 = v4;
    objc_msgSend(v4, sel_removeListener_, v3);
  }
  id v6 = objc_msgSend(self, sel_defaultCenter);
  objc_msgSend(v6, sel_removeObserver_, v3);

  v7.receiver = v3;
  v7.super_class = (Class)IMDFilePurgeabilityMonitor;
  [(IMDFilePurgeabilityMonitor *)&v7 dealloc];
}

- (void).cxx_destruct
{
}

@end