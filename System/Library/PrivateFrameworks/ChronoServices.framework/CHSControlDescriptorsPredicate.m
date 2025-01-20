@interface CHSControlDescriptorsPredicate
+ (BOOL)supportsSecureCoding;
+ (CHSControlDescriptorsPredicate)all;
+ (CHSControlDescriptorsPredicate)hidden;
+ (CHSControlDescriptorsPredicate)visible;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)includeHidden;
- (BOOL)includeVisible;
- (BOOL)isEqual:(id)a3;
- (CHSControlDescriptorsPredicate)init;
- (CHSControlDescriptorsPredicate)initWithCoder:(id)a3;
- (NSString)description;
- (id)initIncludingVisible:(BOOL)a3 hidden:(BOOL)a4;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSControlDescriptorsPredicate

- (BOOL)includeHidden
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___CHSControlDescriptorsPredicate_includeHidden);
}

- (BOOL)includeVisible
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___CHSControlDescriptorsPredicate_includeVisible);
}

+ (CHSControlDescriptorsPredicate)visible
{
  id v2 = objc_msgSend(objc_allocWithZone((Class)CHSControlDescriptorsPredicate), sel_initIncludingVisible_hidden_, 1, 0);
  return (CHSControlDescriptorsPredicate *)v2;
}

+ (CHSControlDescriptorsPredicate)hidden
{
  id v2 = objc_msgSend(objc_allocWithZone((Class)CHSControlDescriptorsPredicate), sel_initIncludingVisible_hidden_, 0, 1);
  return (CHSControlDescriptorsPredicate *)v2;
}

+ (CHSControlDescriptorsPredicate)all
{
  id v2 = objc_msgSend(objc_allocWithZone((Class)CHSControlDescriptorsPredicate), sel_initIncludingVisible_hidden_, 1, 1);
  return (CHSControlDescriptorsPredicate *)v2;
}

- (id)initIncludingVisible:(BOOL)a3 hidden:(BOOL)a4
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___CHSControlDescriptorsPredicate_includeVisible) = a3;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___CHSControlDescriptorsPredicate_includeHidden) = a4;
  v5.receiver = self;
  v5.super_class = (Class)CHSControlDescriptorsPredicate;
  return [(CHSControlDescriptorsPredicate *)&v5 init];
}

- (int64_t)hash
{
  sub_190D423F8();
  v3 = self;
  [(CHSControlDescriptorsPredicate *)v3 includeHidden];
  sub_190D423B8();
  [(CHSControlDescriptorsPredicate *)v3 includeVisible];
  sub_190D423B8();
  int64_t v4 = sub_190D423D8();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    int64_t v4 = self;
    swift_unknownObjectRetain();
    sub_190D41E78();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    objc_super v5 = self;
  }
  char v6 = CHSControlDescriptorsPredicate.isEqual(_:)((uint64_t)v8);

  sub_190CCE544((uint64_t)v8);
  return v6 & 1;
}

- (CHSControlDescriptorsPredicate)init
{
  result = (CHSControlDescriptorsPredicate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return byte_1E92AC101;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1E92AC101 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  BOOL v6 = [(CHSControlDescriptorsPredicate *)v5 includeVisible];
  v7 = (void *)sub_190D41948();
  objc_msgSend(v4, sel_encodeBool_forKey_, v6, v7);

  BOOL v8 = [(CHSControlDescriptorsPredicate *)v5 includeHidden];
  id v9 = (id)sub_190D41948();
  objc_msgSend(v4, sel_encodeBool_forKey_, v8, v9);
}

- (CHSControlDescriptorsPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)sub_190D41948();
  id v6 = objc_msgSend(v4, sel_decodeBoolForKey_, v5);

  v7 = (void *)sub_190D41948();
  id v8 = objc_msgSend(v4, sel_decodeBoolForKey_, v7);

  id v9 = [(CHSControlDescriptorsPredicate *)self initIncludingVisible:v6 hidden:v8];
  return v9;
}

- (NSString)description
{
  id v2 = self;
  CHSControlDescriptorsPredicate.description.getter();

  v3 = (void *)sub_190D41948();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end