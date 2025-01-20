@interface FTConstraintsToggle
- (BOOL)_usingSecondaryConstraints;
- (BOOL)usingSecondaryConstraints;
- (FTConstraintsToggle)init;
- (NSArray)constraintsStatePrimary;
- (NSArray)constraintsStateSecondary;
- (UIView)view;
- (void)setConstraintsStatePrimary:(id)a3;
- (void)setConstraintsStateSecondary:(id)a3;
- (void)setUsingSecondaryConstraints:(BOOL)a3;
- (void)setView:(id)a3;
- (void)set_usingSecondaryConstraints:(BOOL)a3;
- (void)toggle;
- (void)updateConstraints;
@end

@implementation FTConstraintsToggle

- (UIView)view
{
  v2 = (void *)sub_10019C33C();

  return (UIView *)v2;
}

- (void)setView:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10019C3A8(a3);
}

- (NSArray)constraintsStatePrimary
{
  return (NSArray *)sub_10019C628((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_10019C408);
}

- (void)setConstraintsStatePrimary:(id)a3
{
}

- (NSArray)constraintsStateSecondary
{
  return (NSArray *)sub_10019C628((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_10019C688);
}

- (void)setConstraintsStateSecondary:(id)a3
{
}

- (BOOL)usingSecondaryConstraints
{
  return sub_10019C7F0() & 1;
}

- (void)setUsingSecondaryConstraints:(BOOL)a3
{
  v4 = self;
  sub_10019C854(a3);
}

- (BOOL)_usingSecondaryConstraints
{
  return sub_10019C7F0() & 1;
}

- (void)set_usingSecondaryConstraints:(BOOL)a3
{
}

- (void)updateConstraints
{
  v2 = self;
  sub_10019C8C4();
}

- (void)toggle
{
  v2 = self;
  sub_10019CAC8();
}

- (FTConstraintsToggle)init
{
  return (FTConstraintsToggle *)sub_10019CB30();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end