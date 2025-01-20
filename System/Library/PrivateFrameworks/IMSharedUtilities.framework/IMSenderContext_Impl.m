@interface IMSenderContext_Impl
+ (BOOL)supportsSecureCoding;
+ (id)businessChatContext;
+ (id)businessChatContextWithServiceName:(id)a3;
+ (id)contextWithKnownSender:(BOOL)a3;
+ (id)contextWithKnownSender:(BOOL)a3 serviceName:(id)a4;
+ (id)fromMeContext;
+ (id)fromMeContextWithServiceName:(id)a3;
+ (id)untrustedContext;
+ (id)untrustedContextWithServiceName:(id)a3;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)isFromMe;
- (BOOL)isTrustedSender;
- (IMSenderContext_Impl)init;
- (IMSenderContext_Impl)initWithCoder:(id)a3;
- (NSString)serviceName;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IMSenderContext_Impl

- (BOOL)isFromMe
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___IMSenderContext_Impl_isFromMe);
}

- (BOOL)isTrustedSender
{
  if (*((unsigned char *)&self->super.isa + OBJC_IVAR___IMSenderContext_Impl_isKnownSender)) {
    return 1;
  }
  else {
    return *((unsigned char *)&self->super.isa + OBJC_IVAR___IMSenderContext_Impl_isFromMe);
  }
}

- (NSString)serviceName
{
  if (*(void *)&self->isKnownSender[OBJC_IVAR___IMSenderContext_Impl_serviceName])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1A09F3DE8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

+ (id)contextWithKnownSender:(BOOL)a3
{
  v4 = (objc_class *)type metadata accessor for SenderContext();
  v5 = objc_allocWithZone(v4);
  v5[OBJC_IVAR___IMSenderContext_Impl_isKnownSender] = a3;
  v5[OBJC_IVAR___IMSenderContext_Impl_isFromMe] = 0;
  v6 = &v5[OBJC_IVAR___IMSenderContext_Impl_serviceName];
  void *v6 = 0;
  v6[1] = 0;
  v9.receiver = v5;
  v9.super_class = v4;
  id v7 = objc_msgSendSuper2(&v9, sel_init);

  return v7;
}

+ (id)fromMeContext
{
  v2 = (objc_class *)type metadata accessor for SenderContext();
  v3 = objc_allocWithZone(v2);
  v3[OBJC_IVAR___IMSenderContext_Impl_isKnownSender] = 1;
  v3[OBJC_IVAR___IMSenderContext_Impl_isFromMe] = 1;
  v4 = &v3[OBJC_IVAR___IMSenderContext_Impl_serviceName];
  void *v4 = 0;
  v4[1] = 0;
  v7.receiver = v3;
  v7.super_class = v2;
  id v5 = objc_msgSendSuper2(&v7, sel_init);

  return v5;
}

+ (id)untrustedContext
{
  v2 = (objc_class *)type metadata accessor for SenderContext();
  v3 = objc_allocWithZone(v2);
  v3[OBJC_IVAR___IMSenderContext_Impl_isKnownSender] = 0;
  v3[OBJC_IVAR___IMSenderContext_Impl_isFromMe] = 0;
  v4 = &v3[OBJC_IVAR___IMSenderContext_Impl_serviceName];
  void *v4 = 0;
  v4[1] = 0;
  v7.receiver = v3;
  v7.super_class = v2;
  id v5 = objc_msgSendSuper2(&v7, sel_init);

  return v5;
}

+ (id)businessChatContext
{
  v2 = (objc_class *)type metadata accessor for SenderContext();
  v3 = objc_allocWithZone(v2);
  v3[OBJC_IVAR___IMSenderContext_Impl_isKnownSender] = 1;
  v3[OBJC_IVAR___IMSenderContext_Impl_isFromMe] = 0;
  v4 = &v3[OBJC_IVAR___IMSenderContext_Impl_serviceName];
  void *v4 = 0;
  v4[1] = 0;
  v7.receiver = v3;
  v7.super_class = v2;
  id v5 = objc_msgSendSuper2(&v7, sel_init);

  return v5;
}

+ (id)contextWithKnownSender:(BOOL)a3 serviceName:(id)a4
{
  if (a4)
  {
    uint64_t v5 = sub_1A09F3E18();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  v8 = (objc_class *)type metadata accessor for SenderContext();
  objc_super v9 = objc_allocWithZone(v8);
  v9[OBJC_IVAR___IMSenderContext_Impl_isKnownSender] = a3;
  v9[OBJC_IVAR___IMSenderContext_Impl_isFromMe] = 0;
  v10 = (uint64_t *)&v9[OBJC_IVAR___IMSenderContext_Impl_serviceName];
  uint64_t *v10 = v5;
  v10[1] = v7;
  v13.receiver = v9;
  v13.super_class = v8;
  id v11 = objc_msgSendSuper2(&v13, sel_init);

  return v11;
}

+ (id)fromMeContextWithServiceName:(id)a3
{
  if (a3)
  {
    uint64_t v3 = sub_1A09F3E18();
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v6 = (objc_class *)type metadata accessor for SenderContext();
  uint64_t v7 = objc_allocWithZone(v6);
  v7[OBJC_IVAR___IMSenderContext_Impl_isKnownSender] = 1;
  v7[OBJC_IVAR___IMSenderContext_Impl_isFromMe] = 1;
  v8 = (uint64_t *)&v7[OBJC_IVAR___IMSenderContext_Impl_serviceName];
  uint64_t *v8 = v3;
  v8[1] = v5;
  v11.receiver = v7;
  v11.super_class = v6;
  id v9 = objc_msgSendSuper2(&v11, sel_init);

  return v9;
}

+ (id)untrustedContextWithServiceName:(id)a3
{
  if (a3)
  {
    uint64_t v3 = sub_1A09F3E18();
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v6 = (objc_class *)type metadata accessor for SenderContext();
  uint64_t v7 = objc_allocWithZone(v6);
  v7[OBJC_IVAR___IMSenderContext_Impl_isKnownSender] = 0;
  v7[OBJC_IVAR___IMSenderContext_Impl_isFromMe] = 0;
  v8 = (uint64_t *)&v7[OBJC_IVAR___IMSenderContext_Impl_serviceName];
  uint64_t *v8 = v3;
  v8[1] = v5;
  v11.receiver = v7;
  v11.super_class = v6;
  id v9 = objc_msgSendSuper2(&v11, sel_init);

  return v9;
}

+ (id)businessChatContextWithServiceName:(id)a3
{
  if (a3)
  {
    uint64_t v3 = sub_1A09F3E18();
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v6 = (objc_class *)type metadata accessor for SenderContext();
  uint64_t v7 = objc_allocWithZone(v6);
  v7[OBJC_IVAR___IMSenderContext_Impl_isKnownSender] = 1;
  v7[OBJC_IVAR___IMSenderContext_Impl_isFromMe] = 0;
  v8 = (uint64_t *)&v7[OBJC_IVAR___IMSenderContext_Impl_serviceName];
  uint64_t *v8 = v3;
  v8[1] = v5;
  v11.receiver = v7;
  v11.super_class = v6;
  id v9 = objc_msgSendSuper2(&v11, sel_init);

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return byte_1E94FB1E0;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1E94FB1E0 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1A08D2FCC(v4);
}

- (IMSenderContext_Impl)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (IMSenderContext_Impl *)sub_1A08D3300(v3);

  return v4;
}

- (IMSenderContext_Impl)init
{
  result = (IMSenderContext_Impl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end