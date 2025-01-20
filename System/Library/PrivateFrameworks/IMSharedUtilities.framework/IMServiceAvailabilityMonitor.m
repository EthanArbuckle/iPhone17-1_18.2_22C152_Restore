@interface IMServiceAvailabilityMonitor
- (BOOL)isMMSEnabled;
- (BOOL)isRCSEnabled;
- (BOOL)isiMessageEnabled;
- (IMServiceAvailabilityMonitor)init;
@end

@implementation IMServiceAvailabilityMonitor

- (IMServiceAvailabilityMonitor)init
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___IMServiceAvailabilityMonitor_mmsEnabled) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___IMServiceAvailabilityMonitor_rcsEnabled) = 0;
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___IMServiceAvailabilityMonitor_mmsToken) = -1;
  v4.receiver = self;
  v4.super_class = (Class)IMServiceAvailabilityMonitor;
  v2 = [(IMServiceAvailabilityMonitor *)&v4 init];
  sub_1A0791A9C();
  sub_1A079193C();

  return v2;
}

- (BOOL)isiMessageEnabled
{
  v3 = self;
  objc_super v4 = self;
  id v5 = objc_msgSend(v3, sel_sharedInstance);
  if (v5)
  {
    v6 = v5;
    if (qword_1E94F7708 != -1) {
      swift_once();
    }
    v7 = (void *)sub_1A09F3DE8();
    id v8 = objc_msgSend(v6, sel_availabilityForListenerID_forService_, v7, 1);

    LOBYTE(v5) = v8 == (id)1;
  }
  else
  {
    __break(1u);
  }
  return (char)v5;
}

- (BOOL)isRCSEnabled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___IMServiceAvailabilityMonitor_rcsEnabled);
}

- (BOOL)isMMSEnabled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___IMServiceAvailabilityMonitor_mmsEnabled);
}

@end