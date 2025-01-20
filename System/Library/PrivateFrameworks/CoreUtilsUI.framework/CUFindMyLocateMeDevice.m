@interface CUFindMyLocateMeDevice
- (BOOL)isThisDevice;
- (CUFindMyLocateMeDevice)init;
- (CUFindMyLocateMeDevice)initWithFindMyIdentifier:(id)a3 idsID:(id)a4 isThisDevice:(BOOL)a5 name:(id)a6;
- (NSString)findMyIdentifier;
- (NSString)idsID;
- (NSString)name;
@end

@implementation CUFindMyLocateMeDevice

- (NSString)findMyIdentifier
{
  return (NSString *)sub_22A312618();
}

- (NSString)idsID
{
  return (NSString *)sub_22A312618();
}

- (BOOL)isThisDevice
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___CUFindMyLocateMeDevice_isThisDevice);
}

- (NSString)name
{
  return (NSString *)sub_22A312618();
}

- (CUFindMyLocateMeDevice)initWithFindMyIdentifier:(id)a3 idsID:(id)a4 isThisDevice:(BOOL)a5 name:(id)a6
{
  uint64_t v8 = sub_22A313B50();
  uint64_t v10 = v9;
  uint64_t v11 = sub_22A313B50();
  uint64_t v13 = v12;
  uint64_t v14 = sub_22A313B50();
  v15 = (uint64_t *)((char *)self + OBJC_IVAR___CUFindMyLocateMeDevice_findMyIdentifier);
  uint64_t *v15 = v8;
  v15[1] = v10;
  v16 = (uint64_t *)((char *)self + OBJC_IVAR___CUFindMyLocateMeDevice_idsID);
  uint64_t *v16 = v11;
  v16[1] = v13;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___CUFindMyLocateMeDevice_isThisDevice) = a5;
  v17 = (uint64_t *)((char *)self + OBJC_IVAR___CUFindMyLocateMeDevice_name);
  uint64_t *v17 = v14;
  v17[1] = v18;
  v20.receiver = self;
  v20.super_class = (Class)CUFindMyLocateMeDevice;
  return [(CUFindMyLocateMeDevice *)&v20 init];
}

- (CUFindMyLocateMeDevice)init
{
  result = (CUFindMyLocateMeDevice *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end