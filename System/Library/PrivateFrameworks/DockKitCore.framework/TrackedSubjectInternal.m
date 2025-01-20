@interface TrackedSubjectInternal
- (CGRect)rect;
- (NSUUID)identifier;
- (void)setIdentifier:(id)a3;
- (void)setRect:(CGRect)a3;
@end

@implementation TrackedSubjectInternal

- (NSUUID)identifier
{
  return (NSUUID *)sub_24CF2F384((uint64_t)self, (uint64_t)a2, MEMORY[0x263F07508], &OBJC_IVAR____TtC11DockKitCore22TrackedSubjectInternal_identifier, MEMORY[0x263F074E8]);
}

- (void)setIdentifier:(id)a3
{
}

- (CGRect)rect
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore22TrackedSubjectInternal_rect);
  double v3 = *(double *)&self->type[OBJC_IVAR____TtC11DockKitCore22TrackedSubjectInternal_rect];
  double v4 = *(double *)&self->rect[OBJC_IVAR____TtC11DockKitCore22TrackedSubjectInternal_rect + 7];
  double v5 = *(double *)&self->rect[OBJC_IVAR____TtC11DockKitCore22TrackedSubjectInternal_rect + 15];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setRect:(CGRect)a3
{
  *(CGRect *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore22TrackedSubjectInternal_rect) = a3;
}

@end