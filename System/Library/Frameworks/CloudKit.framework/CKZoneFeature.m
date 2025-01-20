@interface CKZoneFeature
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CKZoneFeature)init;
- (CKZoneFeature)initWithCoder:(id)a3;
- (CKZoneFeature)initWithName:(id)a3 value:(id)a4;
- (NSString)description;
- (NSString)name;
- (NSString)value;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKZoneFeature

- (CKZoneFeature)init
{
  return (CKZoneFeature *)sub_18AF86068(&OBJC_IVAR___CKZoneFeature__wrapped, (Class *)&off_1E545F1C0);
}

- (CKZoneFeature)initWithName:(id)a3 value:(id)a4
{
  return (CKZoneFeature *)sub_18AF858A8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))CKZoneFeature.init(name:value:));
}

- (NSString)name
{
  return (NSString *)sub_18AF85648(self, (uint64_t)a2, (uint64_t (*)(void))CKZoneFeature.name.getter);
}

- (NSString)value
{
  return (NSString *)sub_18AF85648(self, (uint64_t)a2, (uint64_t (*)(void))CKZoneFeature.value.getter);
}

- (BOOL)isEqual:(id)a3
{
  return sub_18AF86FC0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))CKZoneFeature.isEqual(_:));
}

- (NSString)description
{
  return (NSString *)sub_18AF87060(self, (uint64_t)a2, CKZoneFeature.description.getter);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  CKZoneFeature.encode(with:)((NSCoder)v4);
}

- (CKZoneFeature)initWithCoder:(id)a3
{
  return (CKZoneFeature *)CKZoneFeature.init(coder:)(a3);
}

- (void).cxx_destruct
{
}

@end