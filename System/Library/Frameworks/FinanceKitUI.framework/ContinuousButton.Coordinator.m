@interface ContinuousButton.Coordinator
- (void)onButtonSelected;
@end

@implementation ContinuousButton.Coordinator

- (void)onButtonSelected
{
  v2 = *(void (**)(uint64_t))&self->parent[24];
  swift_retain();
  uint64_t v3 = swift_retain();
  v2(v3);
  swift_release();

  swift_release();
}

@end