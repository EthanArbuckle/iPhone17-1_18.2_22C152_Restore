@interface BTSDeviceConfigDigitalCrownController
- (id)getRotationImageFileName:(int64_t)a3;
- (void)listItemSelected:(id)a3;
- (void)setupTableViewHeader;
- (void)updateRotateImage:(int64_t)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BTSDeviceConfigDigitalCrownController

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BTSDeviceConfigDigitalCrownController;
  [(PSListItemsController *)&v4 viewWillAppear:a3];
  [(BTSDeviceConfigDigitalCrownController *)self setupTableViewHeader];
}

- (void)setupTableViewHeader
{
  id v14 = [(BTSDeviceConfigDigitalCrownController *)self getRotationImageFileName:*(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F18])];
  v3 = (void *)MEMORY[0x1E4FB1818];
  objc_super v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v5 = [v3 imageNamed:v14 inBundle:v4];
  rotationImage = self->_rotationImage;
  self->_rotationImage = v5;

  id v7 = objc_alloc(MEMORY[0x1E4FB1838]);
  [(UIImage *)self->_rotationImage size];
  double v9 = v8;
  [(UIImage *)self->_rotationImage size];
  v11 = (UIImageView *)objc_msgSend(v7, "initWithFrame:", 0.0, 0.0, v9, v10 + 40.0);
  rotationImageView = self->_rotationImageView;
  self->_rotationImageView = v11;

  [(UIImageView *)self->_rotationImageView setImage:self->_rotationImage];
  [(UIImageView *)self->_rotationImageView setContentMode:6];
  v13 = [(BTSDeviceConfigDigitalCrownController *)self table];
  [v13 setTableHeaderView:self->_rotationImageView];
}

- (void)listItemSelected:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BTSDeviceConfigDigitalCrownController;
  id v4 = a3;
  [(PSListItemsController *)&v6 listItemSelected:v4];
  uint64_t v5 = objc_msgSend(v4, "row", v6.receiver, v6.super_class);

  [(BTSDeviceConfigDigitalCrownController *)self updateRotateImage:v5 + 1];
}

- (void)updateRotateImage:(int64_t)a3
{
  id v8 = [(BTSDeviceConfigDigitalCrownController *)self getRotationImageFileName:a3];
  id v4 = (void *)MEMORY[0x1E4FB1818];
  uint64_t v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v6 = [v4 imageNamed:v8 inBundle:v5];
  rotationImage = self->_rotationImage;
  self->_rotationImage = v6;

  [(UIImageView *)self->_rotationImageView setImage:self->_rotationImage];
}

- (id)getRotationImageFileName:(int64_t)a3
{
  v3 = "RotateBackToFrontGraphic";
  if (a3 == 2) {
    v3 = "RotateFrontToBackGraphic";
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%s", v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rotationImageView, 0);

  objc_storeStrong((id *)&self->_rotationImage, 0);
}

@end