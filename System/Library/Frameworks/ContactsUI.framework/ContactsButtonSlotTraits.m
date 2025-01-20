@interface ContactsButtonSlotTraits
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (ContactsButtonSlotTraits)init;
- (ContactsButtonSlotTraits)initWithCoder:(id)a3;
- (NSString)debugDescription;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ContactsButtonSlotTraits

+ (BOOL)supportsSecureCoding
{
  return byte_1E913DB80;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1E913DB80 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18B6E74EC(v4);
}

- (ContactsButtonSlotTraits)initWithCoder:(id)a3
{
  ContactsButtonSlotTraits.init(coder:)(a3);
  return result;
}

- (ContactsButtonSlotTraits)init
{
  return (ContactsButtonSlotTraits *)sub_18B6E81AC();
}

- (NSString)debugDescription
{
  v2 = self;
  sub_18B6E8470();

  v3 = (void *)sub_18B985E38();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end