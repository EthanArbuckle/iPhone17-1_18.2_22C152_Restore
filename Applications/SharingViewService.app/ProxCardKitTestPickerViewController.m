@interface ProxCardKitTestPickerViewController
- (NSArray)data;
- (ProxCardKitTestPickerViewController)init;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)setData:(id)a3;
@end

@implementation ProxCardKitTestPickerViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_nextAction, 0);
}

- (void)setData:(id)a3
{
}

- (NSArray)data
{
  return self->_data;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  v6 = [(ProxCardKitTestPickerViewController *)self data];
  v7 = [v6 objectAtIndexedSubscript:a4];

  return v7;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  v4 = [(ProxCardKitTestPickerViewController *)self data];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (ProxCardKitTestPickerViewController)init
{
  id v3 = objc_alloc_init((Class)PRXPickerContentView);
  v4 = [(ProxCardKitTestPickerViewController *)self initWithContentView:v3];

  if (v4)
  {
    [(ProxCardKitTestPickerViewController *)v4 setTitle:@"ProxCardKit Test"];
    [(ProxCardKitTestPickerViewController *)v4 setSubtitle:@"Which One?"];
    [(ProxCardKitTestPickerViewController *)v4 setDismissalType:3];
    [(ProxCardKitTestPickerViewController *)v4 setData:&off_1001A7280];
    id location = 0;
    objc_initWeak(&location, v4);
    v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    v16 = sub_10012A088;
    v17 = &unk_1001A19A0;
    objc_copyWeak(&v18, &location);
    id v5 = +[PRXAction actionWithTitle:@"Next" style:0 handler:&v14];
    uint64_t v6 = -[ProxCardKitTestPickerViewController addAction:](v4, "addAction:", v5, v14, v15, v16, v17);
    nextAction = v4->_nextAction;
    v4->_nextAction = (PRXAction *)v6;

    [(PRXAction *)v4->_nextAction setEnabled:0];
    id v8 = objc_alloc_init((Class)PRXTextField);
    v9 = [(ProxCardKitTestPickerViewController *)v4 contentView];
    [v9 setTextField:v8];

    v10 = [(ProxCardKitTestPickerViewController *)v4 contentView];
    v11 = [v10 textField];
    [v11 setPlaceholder:@"Other"];

    v12 = v4;
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v4;
}

@end