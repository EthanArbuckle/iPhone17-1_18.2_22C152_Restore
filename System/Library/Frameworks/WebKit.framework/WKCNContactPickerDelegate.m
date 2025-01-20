@interface WKCNContactPickerDelegate
- (WKCNContactPickerDelegate)initWithContactPickerDelegate:(id)a3;
- (id).cxx_construct;
- (void)contactPickerDidCancel:(id)a3;
@end

@implementation WKCNContactPickerDelegate

- (WKCNContactPickerDelegate)initWithContactPickerDelegate:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WKCNContactPickerDelegate;
  v4 = [(WKCNContactPickerDelegate *)&v7 init];
  v5 = v4;
  if (v4) {
    objc_storeWeak(&v4->_contactPickerDelegate.m_weakReference, a3);
  }
  return v5;
}

- (void)contactPickerDidCancel:(id)a3
{
  id Weak = objc_loadWeak(&self->_contactPickerDelegate.m_weakReference);

  [Weak contactPickerDidCancel:a3];
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end