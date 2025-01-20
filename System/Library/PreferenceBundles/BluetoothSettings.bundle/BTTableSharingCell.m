@interface BTTableSharingCell
- (BTSDevice)currentDevice;
- (BTTableSharingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)setCurrentDevice:(id)a3;
@end

@implementation BTTableSharingCell

- (BTTableSharingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)BTTableSharingCell;
  v5 = -[BTTableSharingCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, a3, a4, a5);
  if (v5)
  {
    v6 = [MEMORY[0x263F827E8] systemImageNamed:@"xmark.circle.fill"];
    v7 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v6];
    v8 = [MEMORY[0x263F825C8] lightGrayColor];
    [v7 setTintColor:v8];

    [(BTTableSharingCell *)v5 setAccessoryView:v7];
  }
  return v5;
}

- (BTSDevice)currentDevice
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentDevice);

  return (BTSDevice *)WeakRetained;
}

- (void)setCurrentDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

@end