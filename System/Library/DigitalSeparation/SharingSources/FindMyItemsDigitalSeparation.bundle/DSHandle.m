@interface DSHandle
- (NSPersonNameComponents)nameComponents;
- (NSString)emailAddress;
- (NSString)phoneNumber;
- (NSString)unifiedContactIdentifier;
- (_TtC28FindMyItemsDigitalSeparation8DSHandle)init;
- (_TtC28FindMyItemsDigitalSeparation8DSHandle)initWithCoder:(id)a3;
- (_TtC28FindMyItemsDigitalSeparation8DSHandle)initWithType:(int64_t)a3 destination:(id)a4;
- (int64_t)permission;
- (int64_t)role;
@end

@implementation DSHandle

- (int64_t)role
{
  return *(void *)&self->SPHandle_opaque[OBJC_IVAR____TtC28FindMyItemsDigitalSeparation8DSHandle_role];
}

- (_TtC28FindMyItemsDigitalSeparation8DSHandle)initWithCoder:(id)a3
{
  result = (_TtC28FindMyItemsDigitalSeparation8DSHandle *)sub_13480();
  __break(1u);
  return result;
}

- (int64_t)permission
{
  return 1;
}

- (NSPersonNameComponents)nameComponents
{
  return (NSPersonNameComponents *)0;
}

- (NSString)unifiedContactIdentifier
{
  return (NSString *)0;
}

- (NSString)emailAddress
{
  return (NSString *)sub_2A2C(self, (uint64_t)a2, (void (*)(void))sub_2954);
}

- (NSString)phoneNumber
{
  return (NSString *)sub_2A2C(self, (uint64_t)a2, (void (*)(void))sub_2AAC);
}

- (_TtC28FindMyItemsDigitalSeparation8DSHandle)initWithType:(int64_t)a3 destination:(id)a4
{
  result = (_TtC28FindMyItemsDigitalSeparation8DSHandle *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28FindMyItemsDigitalSeparation8DSHandle)init
{
  result = (_TtC28FindMyItemsDigitalSeparation8DSHandle *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end