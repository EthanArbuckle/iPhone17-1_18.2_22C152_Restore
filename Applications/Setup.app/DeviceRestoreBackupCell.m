@interface DeviceRestoreBackupCell
- (DeviceRestoreBackupCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIImageView)restoreDeviceImageView;
- (UILabel)restoreDescriptionLabel;
- (UILabel)restoreNameLabel;
- (id)detailTextLabel;
- (id)imageView;
- (id)textLabel;
- (void)setRestoreDescriptionLabel:(id)a3;
- (void)setRestoreDeviceImageView:(id)a3;
- (void)setRestoreNameLabel:(id)a3;
@end

@implementation DeviceRestoreBackupCell

- (DeviceRestoreBackupCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v46 = self;
  location[2] = (id)a2;
  location[1] = (id)a3;
  location[0] = 0;
  objc_storeStrong(location, a4);
  id v4 = v46;
  id v46 = 0;
  v44.receiver = v4;
  v44.super_class = (Class)DeviceRestoreBackupCell;
  id v46 = [(DeviceRestoreBackupCell *)&v44 initWithStyle:3 reuseIdentifier:location[0]];
  objc_storeStrong(&v46, v46);
  if (v46)
  {
    id v5 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v6 = (void *)*((void *)v46 + 1);
    *((void *)v46 + 1) = v5;

    [*((id *)v46 + 1) setTranslatesAutoresizingMaskIntoConstraints:0];
    id v7 = [v46 contentView];
    [v7 addSubview:*((void *)v46 + 1)];

    id v37 = [*((id *)v46 + 1) leadingAnchor];
    id v39 = [v46 contentView];
    id v36 = [v39 leadingAnchor];
    id v34 = [v37 constraintEqualToAnchor:2.0];
    v48[0] = v34;
    id v8 = [v46 contentView];
    id v9 = [v8 centerYAnchor];
    id v10 = [*((id *)v46 + 1) centerYAnchor];
    id v11 = [v9 constraintLessThanOrEqualToAnchor:v10];
    v48[1] = v11;
    id v12 = [*((id *)v46 + 1) widthAnchor];
    id v13 = [v12 constraintEqualToConstant:39.0];
    v48[2] = v13;
    id v14 = [*((id *)v46 + 1) heightAnchor];
    id v15 = [v14 constraintEqualToConstant:39.0];
    v48[3] = v15;
    v16 = +[NSArray arrayWithObjects:v48 count:4];
    +[NSLayoutConstraint activateConstraints:v16];

    id v43 = [objc_alloc((Class)UIStackView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [v43 setAxis:1];
    [v43 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v17 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v18 = (void *)*((void *)v46 + 2);
    *((void *)v46 + 2) = v17;

    [*((id *)v46 + 2) setNumberOfLines:0];
    [*((id *)v46 + 2) setTranslatesAutoresizingMaskIntoConstraints:0];
    [v43 addArrangedSubview:*((void *)v46 + 2)];
    [v43 setCustomSpacing:*((void *)v46 + 2) afterView:2.0];
    id v19 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v20 = (void *)*((void *)v46 + 3);
    *((void *)v46 + 3) = v19;

    [*((id *)v46 + 3) setNumberOfLines:0];
    [*((id *)v46 + 3) setTranslatesAutoresizingMaskIntoConstraints:0];
    [v43 addArrangedSubview:*((void *)v46 + 3)];
    id v21 = [v46 contentView];
    [v21 addSubview:v43];

    id v42 = [v46 contentView];
    id v41 = [v42 heightAnchor];
    id v40 = [v43 heightAnchor];
    id v38 = [v41 constraintEqualToAnchor:2.0 * 9.0];
    v47[0] = v38;
    id v35 = [v46 contentView];
    id v22 = [v35 trailingAnchor];
    id v23 = [v43 trailingAnchor];
    id v24 = [v22 constraintEqualToAnchor:v23];
    v47[1] = v24;
    id v25 = [v43 leadingAnchor];
    id v26 = [*((id *)v46 + 1) trailingAnchor];
    id v27 = [v25 constraintEqualToAnchor:v26 constant:2.0];
    v47[2] = v27;
    id v28 = [v43 centerYAnchor];
    id v29 = [v46 centerYAnchor];
    id v30 = [v28 constraintEqualToAnchor:v29];
    v47[3] = v30;
    v31 = +[NSArray arrayWithObjects:v47 count:4];
    +[NSLayoutConstraint activateConstraints:v31];

    objc_storeStrong(&v43, 0);
  }
  v32 = (DeviceRestoreBackupCell *)v46;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v46, 0);
  return v32;
}

- (id)imageView
{
  return self->_restoreDeviceImageView;
}

- (id)textLabel
{
  return self->_restoreNameLabel;
}

- (id)detailTextLabel
{
  return self->_restoreDescriptionLabel;
}

- (UIImageView)restoreDeviceImageView
{
  return self->_restoreDeviceImageView;
}

- (void)setRestoreDeviceImageView:(id)a3
{
}

- (UILabel)restoreNameLabel
{
  return self->_restoreNameLabel;
}

- (void)setRestoreNameLabel:(id)a3
{
}

- (UILabel)restoreDescriptionLabel
{
  return self->_restoreDescriptionLabel;
}

- (void)setRestoreDescriptionLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end