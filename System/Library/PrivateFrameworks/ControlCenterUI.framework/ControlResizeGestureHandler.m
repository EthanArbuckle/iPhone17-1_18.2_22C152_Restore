@interface ControlResizeGestureHandler
- (void)iconView:(id)a3 resizeGestureRecognizerDidUpdate:(id)a4;
@end

@implementation ControlResizeGestureHandler

- (void)iconView:(id)a3 resizeGestureRecognizerDidUpdate:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  swift_retain();
  switch((unint64_t)objc_msgSend(v6, sel_state))
  {
    case 1uLL:
      sub_1D7B74FE8();
      v7 = *(void (**)(_TtC15ControlCenterUI27ControlResizeGestureHandler *))self->onBegin;
      if (v7)
      {
        swift_retain();
        v7(self);
        sub_1D7B65FA0((uint64_t)v7);
      }
      break;
    case 2uLL:
      sub_1D7B733F4(v6);
      break;
    case 3uLL:
    case 4uLL:
    case 5uLL:
      sub_1D7B75614();
      break;
    default:
      break;
  }

  swift_release();
}

@end