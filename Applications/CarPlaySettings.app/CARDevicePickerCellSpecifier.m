@interface CARDevicePickerCellSpecifier
- (BOOL)_isDevicePickerLimitedUIOn;
- (CARDevicePickerCellSpecifier)initWithTitle:(id)a3 image:(id)a4 accessoryType:(int64_t)a5 carSession:(id)a6 actionBlock:(id)a7;
- (CARSession)carSession;
- (id)_limitedUIAttributedString;
- (void)refreshSpecifierIfNeeded;
- (void)setCarSession:(id)a3;
@end

@implementation CARDevicePickerCellSpecifier

- (CARDevicePickerCellSpecifier)initWithTitle:(id)a3 image:(id)a4 accessoryType:(int64_t)a5 carSession:(id)a6 actionBlock:(id)a7
{
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CARDevicePickerCellSpecifier;
  v14 = [(CARSettingsCellSpecifier *)&v17 initWithTitle:a3 image:a4 accessoryType:a5 actionBlock:a7];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_carSession, a6);
  }

  return v15;
}

- (void)refreshSpecifierIfNeeded
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002442C;
  block[3] = &unk_100091F38;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)_isDevicePickerLimitedUIOn
{
  v3 = [(CARDevicePickerCellSpecifier *)self carSession];
  v4 = [v3 limitUserInterfaces];
  unsigned int v5 = [v4 BOOLValue];

  if (v5)
  {
    v6 = [(CARDevicePickerCellSpecifier *)self carSession];
    v7 = [v6 configuration];
    unint64_t v8 = (unint64_t)[v7 limitableUserInterfaces];

    return (v8 >> 6) & 1;
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (id)_limitedUIAttributedString
{
  id v2 = objc_alloc_init((Class)NSTextAttachment);
  v3 = +[UIColor systemGrayColor];
  v4 = +[UIImageSymbolConfiguration configurationWithHierarchicalColor:v3];

  unsigned int v5 = +[UIImage systemImageNamed:@"steeringwheel" withConfiguration:v4];
  [v2 setImage:v5];
  v6 = +[NSAttributedString attributedStringWithAttachment:v2];
  id v7 = [objc_alloc((Class)NSAttributedString) initWithString:@"  "];
  id v8 = objc_alloc((Class)NSMutableAttributedString);
  BOOL v9 = sub_1000210C8(@"DEVICE_PICKER_CELL_TITLE");
  id v10 = [v8 initWithString:v9];

  [v10 appendAttributedString:v7];
  [v10 appendAttributedString:v6];

  return v10;
}

- (CARSession)carSession
{
  return self->_carSession;
}

- (void)setCarSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end