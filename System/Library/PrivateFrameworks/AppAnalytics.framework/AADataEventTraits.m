@interface AADataEventTraits
- (AADataEventTraits)init;
- (BOOL)discardWhenPresent;
- (BOOL)onlyOnce;
- (BOOL)unique;
- (void)setDiscardWhenPresent:(BOOL)a3;
- (void)setOnlyOnce:(BOOL)a3;
- (void)setUnique:(BOOL)a3;
@end

@implementation AADataEventTraits

- (BOOL)onlyOnce
{
  v2 = (BOOL *)self + OBJC_IVAR___AADataEventTraits_onlyOnce;
  swift_beginAccess();
  return *v2;
}

- (void)setOnlyOnce:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___AADataEventTraits_onlyOnce;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)unique
{
  v2 = (BOOL *)self + OBJC_IVAR___AADataEventTraits_unique;
  swift_beginAccess();
  return *v2;
}

- (void)setUnique:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___AADataEventTraits_unique;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)discardWhenPresent
{
  v2 = (BOOL *)self + OBJC_IVAR___AADataEventTraits_discardWhenPresent;
  swift_beginAccess();
  return *v2;
}

- (void)setDiscardWhenPresent:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___AADataEventTraits_discardWhenPresent;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (AADataEventTraits)init
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___AADataEventTraits_onlyOnce) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___AADataEventTraits_unique) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___AADataEventTraits_discardWhenPresent) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BridgedDataEventTraits();
  return [(AADataEventTraits *)&v3 init];
}

@end