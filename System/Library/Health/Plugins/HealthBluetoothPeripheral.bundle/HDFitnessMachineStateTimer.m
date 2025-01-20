@interface HDFitnessMachineStateTimer
- (void)dealloc;
@end

@implementation HDFitnessMachineStateTimer

- (void)dealloc
{
  sub_2D2AC((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)HDFitnessMachineStateTimer;
  [(HDFitnessMachineStateTimer *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_timer, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end