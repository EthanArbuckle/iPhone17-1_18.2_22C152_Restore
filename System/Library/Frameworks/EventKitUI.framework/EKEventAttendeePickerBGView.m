@interface EKEventAttendeePickerBGView
- (id)boundsChangeCallback;
- (void)setBounds:(CGRect)a3;
- (void)setBoundsChangeCallback:(id)a3;
@end

@implementation EKEventAttendeePickerBGView

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(EKEventAttendeePickerBGView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v16.receiver = self;
  v16.super_class = (Class)EKEventAttendeePickerBGView;
  -[EKEventAttendeePickerBGView setBounds:](&v16, sel_setBounds_, x, y, width, height);
  [(EKEventAttendeePickerBGView *)self bounds];
  if (v9 != v13 || v11 != v12)
  {
    boundsChangeCallback = (void (**)(void))self->_boundsChangeCallback;
    if (boundsChangeCallback) {
      boundsChangeCallback[2]();
    }
  }
}

- (id)boundsChangeCallback
{
  return self->_boundsChangeCallback;
}

- (void)setBoundsChangeCallback:(id)a3
{
}

- (void).cxx_destruct
{
}

@end