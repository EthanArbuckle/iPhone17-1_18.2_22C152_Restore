@interface CKFieldFeature
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CKFieldFeature)init;
- (CKFieldFeature)initWithCoder:(id)a3;
- (CKFieldFeature)initWithName:(id)a3 value:(id)a4;
- (NSString)description;
- (NSString)name;
- (NSString)value;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKFieldFeature

- (CKFieldFeature)init
{
  return (CKFieldFeature *)sub_18AF86068(&OBJC_IVAR___CKFieldFeature__wrapped, (Class *)off_1E545EC20);
}

- (CKFieldFeature)initWithName:(id)a3 value:(id)a4
{
  return (CKFieldFeature *)sub_18AF858A8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))CKFieldFeature.init(name:value:));
}

- (NSString)name
{
  return (NSString *)sub_18AF85648(self, (uint64_t)a2, (uint64_t (*)(void))CKFieldFeature.name.getter);
}

- (NSString)value
{
  return (NSString *)sub_18AF85648(self, (uint64_t)a2, (uint64_t (*)(void))CKFieldFeature.value.getter);
}

- (BOOL)isEqual:(id)a3
{
  return sub_18AF86FC0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))CKFieldFeature.isEqual(_:));
}

- (NSString)description
{
  return (NSString *)sub_18AF87060(self, (uint64_t)a2, CKFieldFeature.description.getter);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  CKFieldFeature.encode(with:)((NSCoder)v4);
}

- (CKFieldFeature)initWithCoder:(id)a3
{
  return (CKFieldFeature *)CKFieldFeature.init(coder:)(a3);
}

- (void).cxx_destruct
{
}

@end