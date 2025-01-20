@interface ASAccessoryInfoHeaderView
- (ASAccessoryInfoHeaderView)initWithDevice:(id)a3 insets:(UIEdgeInsets)a4;
- (UIImageView)imageView;
- (UILabel)displayNameLabel;
- (UILabel)otaNameLabel;
- (void)setDisplayNameLabel:(id)a3;
- (void)setImageView:(id)a3;
- (void)setOtaNameLabel:(id)a3;
@end

@implementation ASAccessoryInfoHeaderView

- (ASAccessoryInfoHeaderView)initWithDevice:(id)a3 insets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  uint64_t v103 = *MEMORY[0x263EF8340];
  id v9 = a3;
  v99.receiver = self;
  v99.super_class = (Class)ASAccessoryInfoHeaderView;
  v10 = -[ASAccessoryInfoHeaderView initWithFrame:](&v99, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  -[ASAccessoryInfoHeaderView setLayoutMargins:](v10, "setLayoutMargins:", top, left, bottom, right);
  v11 = [v9 displayImageFileURL];
  uint64_t v98 = 1;
  uint64_t v12 = container_system_group_path_for_identifier();
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [NSURL fileURLWithFileSystemRepresentation:v12 isDirectory:1 relativeToURL:0];
    free(v13);
  }
  else
  {
    v14 = 0;
  }
  v90 = [v14 URLByAppendingPathComponent:@"com.apple.DeviceAccess" isDirectory:1];
  v89 = [v90 URLByAppendingPathComponent:@"AccessorySetup" isDirectory:1];
  uint64_t v15 = [v89 URLByAppendingPathComponent:@"DADevices" isDirectory:1];
  v92 = v11;
  v87 = [v11 lastPathComponent];
  v88 = (void *)v15;
  v86 = [NSString stringWithFormat:@"%@%@", v15, v87];
  v85 = objc_msgSend(NSURL, "URLWithString:");
  uint64_t v16 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithContentsOfURL:");
  v91 = v14;
  v84 = (void *)v16;
  if (v16
    && ([MEMORY[0x263F827E8] imageWithData:v16], (uint64_t v17 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v18 = (void *)v17;
    uint64_t v19 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v17];
    imageView = v10->_imageView;
    v10->_imageView = (UIImageView *)v19;

    [(UIImageView *)v10->_imageView setContentMode:1];
    v21 = [(UIImageView *)v10->_imageView layer];
    [v21 setAllowsEdgeAntialiasing:1];
  }
  else
  {
    id v22 = objc_alloc(MEMORY[0x263F82828]);
    v23 = [MEMORY[0x263F827E8] systemImageNamed:@"dot.radiowaves.left.and.right"];
    uint64_t v24 = [v22 initWithImage:v23];
    v25 = v10->_imageView;
    v10->_imageView = (UIImageView *)v24;

    v26 = [MEMORY[0x263F82818] configurationWithPointSize:100.0];
    [(UIImageView *)v10->_imageView setPreferredSymbolConfiguration:v26];

    v18 = [MEMORY[0x263F825C8] systemBlueColor];
    [(UIImageView *)v10->_imageView setTintColor:v18];
  }

  v27 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  displayNameLabel = v10->_displayNameLabel;
  v10->_displayNameLabel = v27;

  v29 = (void *)MEMORY[0x263F82760];
  v30 = [MEMORY[0x263F82760] preferredFontForTextStyle:*MEMORY[0x263F83618]];
  [v30 pointSize];
  v31 = objc_msgSend(v29, "systemFontOfSize:weight:");
  [(UILabel *)v10->_displayNameLabel setFont:v31];

  v32 = [v9 name];
  [(UILabel *)v10->_displayNameLabel setText:v32];

  [(UILabel *)v10->_displayNameLabel setTextAlignment:1];
  [(UILabel *)v10->_displayNameLabel setNumberOfLines:1];
  v33 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  otaNameLabel = v10->_otaNameLabel;
  v10->_otaNameLabel = v33;

  v35 = [MEMORY[0x263F82760] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
  [(UILabel *)v10->_otaNameLabel setFont:v35];

  v36 = [MEMORY[0x263F825C8] secondaryLabelColor];
  [(UILabel *)v10->_otaNameLabel setTextColor:v36];

  v37 = [v9 bluetoothOTAName];

  if (v37)
  {
    uint64_t v38 = [v9 bluetoothOTAName];
  }
  else
  {
    v39 = [v9 SSID];

    if (!v39) {
      goto LABEL_13;
    }
    uint64_t v38 = [v9 SSID];
  }
  v40 = (void *)v38;
  [(UILabel *)v10->_otaNameLabel setText:v38];

LABEL_13:
  v93 = v9;
  [(UILabel *)v10->_otaNameLabel setTextAlignment:1];
  [(UILabel *)v10->_otaNameLabel setNumberOfLines:1];
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  v101[0] = v10->_imageView;
  v101[1] = v10->_displayNameLabel;
  v101[2] = v10->_otaNameLabel;
  v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v101 count:3];
  uint64_t v42 = [v41 countByEnumeratingWithState:&v94 objects:v102 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v95;
    do
    {
      for (uint64_t i = 0; i != v43; ++i)
      {
        if (*(void *)v95 != v44) {
          objc_enumerationMutation(v41);
        }
        v46 = *(void **)(*((void *)&v94 + 1) + 8 * i);
        [v46 setTranslatesAutoresizingMaskIntoConstraints:0];
        [(ASAccessoryInfoHeaderView *)v10 addSubview:v46];
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v94 objects:v102 count:16];
    }
    while (v43);
  }

  v72 = (void *)MEMORY[0x263F08938];
  v83 = [(UIImageView *)v10->_imageView topAnchor];
  v82 = [(ASAccessoryInfoHeaderView *)v10 topAnchor];
  [(ASAccessoryInfoHeaderView *)v10 layoutMargins];
  v81 = objc_msgSend(v83, "constraintEqualToAnchor:constant:", v82);
  v100[0] = v81;
  v80 = [(UIImageView *)v10->_imageView centerXAnchor];
  v79 = [(ASAccessoryInfoHeaderView *)v10 centerXAnchor];
  v78 = [v80 constraintEqualToAnchor:v79];
  v100[1] = v78;
  v77 = [(UIImageView *)v10->_imageView heightAnchor];
  v76 = [v77 constraintEqualToConstant:100.0];
  v100[2] = v76;
  v75 = [(UIImageView *)v10->_imageView widthAnchor];
  v74 = [v75 constraintEqualToConstant:180.0];
  v100[3] = v74;
  v73 = [(UILabel *)v10->_displayNameLabel topAnchor];
  v71 = [(UIImageView *)v10->_imageView bottomAnchor];
  v70 = [v73 constraintEqualToAnchor:v71 constant:8.0];
  v100[4] = v70;
  v69 = [(UILabel *)v10->_displayNameLabel centerXAnchor];
  v68 = [(ASAccessoryInfoHeaderView *)v10 centerXAnchor];
  v67 = [v69 constraintEqualToAnchor:v68];
  v100[5] = v67;
  v66 = [(UILabel *)v10->_displayNameLabel leadingAnchor];
  v65 = [(ASAccessoryInfoHeaderView *)v10 leadingAnchor];
  [(ASAccessoryInfoHeaderView *)v10 layoutMargins];
  v64 = [v66 constraintGreaterThanOrEqualToAnchor:v65 constant:v47];
  v100[6] = v64;
  v63 = [(UILabel *)v10->_otaNameLabel topAnchor];
  v62 = [(UILabel *)v10->_displayNameLabel bottomAnchor];
  v61 = [v63 constraintEqualToAnchor:v62 constant:0.0];
  v100[7] = v61;
  v60 = [(UILabel *)v10->_otaNameLabel centerXAnchor];
  v48 = [(ASAccessoryInfoHeaderView *)v10 centerXAnchor];
  v49 = [v60 constraintEqualToAnchor:v48];
  v100[8] = v49;
  v50 = [(UILabel *)v10->_otaNameLabel leadingAnchor];
  v51 = [(ASAccessoryInfoHeaderView *)v10 leadingAnchor];
  [(ASAccessoryInfoHeaderView *)v10 layoutMargins];
  v53 = [v50 constraintGreaterThanOrEqualToAnchor:v51 constant:v52];
  v100[9] = v53;
  v54 = [(UILabel *)v10->_otaNameLabel bottomAnchor];
  v55 = [(ASAccessoryInfoHeaderView *)v10 bottomAnchor];
  [(ASAccessoryInfoHeaderView *)v10 layoutMargins];
  v57 = [v54 constraintLessThanOrEqualToAnchor:v55 constant:-v56];
  v100[10] = v57;
  v58 = [MEMORY[0x263EFF8C0] arrayWithObjects:v100 count:11];
  [v72 activateConstraints:v58];

  return v10;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UILabel)displayNameLabel
{
  return self->_displayNameLabel;
}

- (void)setDisplayNameLabel:(id)a3
{
}

- (UILabel)otaNameLabel
{
  return self->_otaNameLabel;
}

- (void)setOtaNameLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otaNameLabel, 0);
  objc_storeStrong((id *)&self->_displayNameLabel, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end