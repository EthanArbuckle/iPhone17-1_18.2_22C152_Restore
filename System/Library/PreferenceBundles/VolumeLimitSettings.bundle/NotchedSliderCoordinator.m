@interface NotchedSliderCoordinator
- (void)editingEnded:(id)a3;
- (void)valueChanged:(id)a3;
@end

@implementation NotchedSliderCoordinator

- (void)valueChanged:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_67B8(v3);

  swift_release();
}

- (void)editingEnded:(id)a3
{
  self->isUpdating[0] = 0;
  id v3 = *(void (**)(void))&self->configuration[88];
  id v4 = a3;
  swift_retain();
  swift_retain();
  v3(0);

  swift_release();

  swift_release();
}

@end