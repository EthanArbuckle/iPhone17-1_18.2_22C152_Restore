@interface CKRecordFeature
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CKRecordFeature)init;
- (CKRecordFeature)initWithCoder:(id)a3;
- (CKRecordFeature)initWithName:(id)a3 value:(id)a4;
- (NSString)description;
- (NSString)name;
- (NSString)value;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKRecordFeature

- (CKRecordFeature)init
{
  return (CKRecordFeature *)sub_18AF86068(&OBJC_IVAR___CKRecordFeature__wrapped, (Class *)off_1E545EEA0);
}

- (CKRecordFeature)initWithName:(id)a3 value:(id)a4
{
  return (CKRecordFeature *)sub_18AF858A8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))CKRecordFeature.init(name:value:));
}

- (NSString)name
{
  return (NSString *)sub_18AF85648(self, (uint64_t)a2, (uint64_t (*)(void))CKRecordFeature.name.getter);
}

- (NSString)value
{
  return (NSString *)sub_18AF85648(self, (uint64_t)a2, (uint64_t (*)(void))CKRecordFeature.value.getter);
}

- (BOOL)isEqual:(id)a3
{
  return sub_18AF86FC0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))CKRecordFeature.isEqual(_:));
}

- (NSString)description
{
  return (NSString *)sub_18AF87060(self, (uint64_t)a2, CKRecordFeature.description.getter);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  CKRecordFeature.encode(with:)((NSCoder)v4);
}

- (CKRecordFeature)initWithCoder:(id)a3
{
  return (CKRecordFeature *)CKRecordFeature.init(coder:)(a3);
}

- (void).cxx_destruct
{
}

@end