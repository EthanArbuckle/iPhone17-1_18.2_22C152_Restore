@interface CHSWidgetDescriptorsPredicate
+ (BOOL)supportsSecureCoding;
+ (CHSWidgetDescriptorsPredicate)visible;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (CHSWidgetDescriptorsPredicate)init;
- (CHSWidgetDescriptorsPredicate)initWithCoder:(id)a3;
- (int64_t)hash;
@end

@implementation CHSWidgetDescriptorsPredicate

+ (CHSWidgetDescriptorsPredicate)visible
{
  id v2 = objc_msgSend(objc_allocWithZone((Class)CHSWidgetDescriptorsPredicate), sel_init);
  return (CHSWidgetDescriptorsPredicate *)v2;
}

- (int64_t)hash
{
  return sub_190D423D8();
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_190D41E78();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = CHSWidgetDescriptorsPredicate.isEqual(_:)((uint64_t)v8);

  sub_190CCE544((uint64_t)v8);
  return v6 & 1;
}

- (CHSWidgetDescriptorsPredicate)init
{
  v3.receiver = self;
  v3.super_class = (Class)CHSWidgetDescriptorsPredicate;
  return [(CHSWidgetDescriptorsPredicate *)&v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return byte_1E92AC100;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1E92AC100 = a3;
}

- (CHSWidgetDescriptorsPredicate)initWithCoder:(id)a3
{
  return [(CHSWidgetDescriptorsPredicate *)self init];
}

@end