@interface MobileDocumentReaderDelegateProxy
- (void)mobileDocumentReaderStateDidChange:(id)a3;
@end

@implementation MobileDocumentReaderDelegateProxy

- (void)mobileDocumentReaderStateDidChange:(id)a3
{
  v3 = *(void (**)(char *))self->onStateChange;
  v4 = (char *)a3 + OBJC_IVAR____TtC7CoreIDV35XPCMobileDocumentReaderSessionState_value;
  id v5 = a3;
  swift_retain();
  v3(v4);

  swift_release();
}

@end