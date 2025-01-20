@interface DOCUIPBrowserState
+ (BOOL)supportsSecureCoding;
- (DOCUIPBrowserState)init;
- (DOCUIPBrowserState)initWithCoder:(id)a3;
- (NSString)debugDescription;
- (int64_t)contentMode;
- (int64_t)documentLandingMode;
- (void)encodeWithCoder:(id)a3;
- (void)setContentMode:(int64_t)a3;
- (void)setDocumentLandingMode:(int64_t)a3;
@end

@implementation DOCUIPBrowserState

- (DOCUIPBrowserState)init
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___DOCUIPBrowserState__impl);
  void *v2 = -1;
  v2[1] = -1;
  v4.receiver = self;
  v4.super_class = (Class)DOCUIPBrowserState;
  return [(DOCUIPBrowserState *)&v4 init];
}

- (int64_t)contentMode
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___DOCUIPBrowserState__impl);
}

- (void)setContentMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___DOCUIPBrowserState__impl) = (Class)a3;
}

- (int64_t)documentLandingMode
{
  return *(void *)&self->_impl[OBJC_IVAR___DOCUIPBrowserState__impl];
}

- (void)setDocumentLandingMode:(int64_t)a3
{
  *(void *)&self->_impl[OBJC_IVAR___DOCUIPBrowserState__impl] = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DOCUIPBrowserState)initWithCoder:(id)a3
{
  return (DOCUIPBrowserState *)DOCUIPBrowserState.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_21369AC4C();
}

- (NSString)debugDescription
{
  v2 = self;
  DOCUIPBrowserState.debugDescription.getter();

  v3 = (void *)sub_21369F5E8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end