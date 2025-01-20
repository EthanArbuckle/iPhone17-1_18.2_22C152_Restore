@interface EABluetoothAccessoryPicker
+ (void)wakeSelectedBluetoothAccessories:(id)a3;
- (EABluetoothAccessoryPicker)initWithPredicate:(id)a3;
- (EABluetoothAccessoryPickerDelegate)delegate;
- (void)dealloc;
- (void)devicePicker:(id)a3 didDismissWithResult:(int64_t)a4 deviceAddress:(id)a5;
- (void)dismissPicker;
- (void)setDelegate:(id)a3;
- (void)show;
@end

@implementation EABluetoothAccessoryPicker

+ (void)wakeSelectedBluetoothAccessories:(id)a3
{
}

- (EABluetoothAccessoryPicker)initWithPredicate:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)EABluetoothAccessoryPicker;
  v4 = [(EABluetoothAccessoryPicker *)&v8 init];
  if (v4)
  {
    v5 = +[EAPostAlert CopyLocalizedString:@"BLUETOOTH_ACCESSORY_PICKER_TITLE"];
    if (!v5) {
      v5 = &stru_1F1595068;
    }
    if (getBTDevicePickerClass())
    {
      v6 = (BTDevicePicker *)[objc_alloc((Class)getBTDevicePickerClass()) initWithTitle:v5 service:128 discoveryNameFilter:a3];
      v4->_picker = v6;
      [(BTDevicePicker *)v6 setDelegate:v4];
    }
    else
    {
      NSLog(&cfstr_BtpickerNoBtde.isa);
    }
  }
  return v4;
}

- (void)dealloc
{
  picker = self->_picker;
  if (picker)
  {
    [(BTDevicePicker *)picker setDelegate:0];

    self->_picker = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)EABluetoothAccessoryPicker;
  [(EABluetoothAccessoryPicker *)&v4 dealloc];
}

- (void)show
{
  [(BTDevicePicker *)self->_picker setDelegate:self];
  picker = self->_picker;

  [(BTDevicePicker *)picker show];
}

- (void)dismissPicker
{
  self->_picker = 0;
}

- (void)devicePicker:(id)a3 didDismissWithResult:(int64_t)a4 deviceAddress:(id)a5
{
  if (self->_picker == a3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegate = self->_delegate;
    if ((unint64_t)(a4 - 1) >= 3) {
      int64_t v9 = 0;
    }
    else {
      int64_t v9 = a4;
    }
    [(EABluetoothAccessoryPickerDelegate *)delegate devicePicker:self didSelectAddress:a5 errorCode:v9];
  }
}

- (EABluetoothAccessoryPickerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (EABluetoothAccessoryPickerDelegate *)a3;
}

@end