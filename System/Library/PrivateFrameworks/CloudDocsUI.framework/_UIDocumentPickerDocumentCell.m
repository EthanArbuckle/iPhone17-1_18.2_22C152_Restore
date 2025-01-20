@interface _UIDocumentPickerDocumentCell
- (BOOL)enabled;
- (void)_showPickableDiagnostic;
- (void)prepareForReuse;
- (void)reloadItem:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateContents;
- (void)updateThumbnail;
@end

@implementation _UIDocumentPickerDocumentCell

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)_UIDocumentPickerDocumentCell;
  [(_UIDocumentPickerCell *)&v3 prepareForReuse];
  [(_UIDocumentPickerCell *)self setItem:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIDocumentPickerDocumentCell;
  [(_UIDocumentPickerCell *)&v5 traitCollectionDidChange:a3];
  v4 = [(_UIDocumentPickerDocumentCell *)self window];

  if (v4) {
    [(_UIDocumentPickerDocumentCell *)self updateContents];
  }
}

- (void)reloadItem:(BOOL)a3
{
  if (a3) {
    [(_UIDocumentPickerDocumentCell *)self updateThumbnail];
  }
  else {
    [(_UIDocumentPickerDocumentCell *)self updateContents];
  }
}

- (void)updateContents
{
  objc_super v3 = [(_UIDocumentPickerCell *)self item];
  v4 = [v3 title];
  objc_super v5 = [(_UIDocumentPickerCell *)self titleLabel];
  [v5 setText:v4];

  v6 = [(_UIDocumentPickerCell *)self item];
  v7 = [v6 subtitle];
  v8 = [(_UIDocumentPickerCell *)self subtitleLabel];
  [v8 setText:v7];

  v9 = [(_UIDocumentPickerCell *)self item];
  v10 = [v9 subtitle2];
  v11 = [(_UIDocumentPickerCell *)self subtitle2Label];
  [v11 setText:v10];

  v12 = [(_UIDocumentPickerCell *)self item];
  v13 = [(_UIDocumentPickerDocumentCell *)self traitCollection];
  [v13 displayScale];
  id v17 = [v12 tagBlipsWithHeight:12.0 scale:v14];

  if (v17)
  {
    v15 = objc_msgSend(v17, "imageWithAlignmentRectInsets:", 0.0, 0.0, 1.5, -4.0);
    v16 = [(_UIDocumentPickerCell *)self tagView];
    [v16 setImage:v15];
  }
  [(_UIDocumentPickerDocumentCell *)self updateThumbnail];
}

- (void)updateThumbnail
{
  objc_super v3 = [(_UIDocumentPickerDocumentCell *)self traitCollection];
  [v3 displayScale];
  double v5 = v4;

  if (v5 != 0.0)
  {
    v6 = objc_opt_class();
    v7 = [(_UIDocumentPickerDocumentCell *)self traitCollection];
    objc_msgSend(v6, "thumbnailSizeForTraits:cellStyle:", v7, -[_UIDocumentPickerCell cellStyle](self, "cellStyle"));
    double v9 = v8;
    double v11 = v10;

    v12 = [(_UIDocumentPickerCell *)self item];
    v13 = [(_UIDocumentPickerDocumentCell *)self traitCollection];
    [v13 displayScale];
    objc_msgSend(v12, "thumbnailWithSize:scale:", v9, v11, v14);
    id v19 = (id)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v15 = [(_UIDocumentPickerCell *)self thumbnailView];
      [v15 setImage:v19];
    }
    v16 = [(_UIDocumentPickerCell *)self item];
    if ([v16 pickable]) {
      double v17 = 1.0;
    }
    else {
      double v17 = 0.5;
    }
    v18 = [(_UIDocumentPickerCell *)self thumbnailView];
    [v18 setAlpha:v17];
  }
}

- (void)_showPickableDiagnostic
{
  id v17 = [(_UIDocumentPickerCell *)self item];
  uint64_t v3 = [v17 pickabilityReason];
  if (v3)
  {
    double v4 = (void *)v3;
    int v5 = CPIsInternalDevice();

    if (!v5) {
      return;
    }
    v6 = (void *)MEMORY[0x263F1C3F8];
    v7 = [(_UIDocumentPickerCell *)self item];
    if ([v7 pickable]) {
      double v8 = @"Internal diagnostic: Item is pickable";
    }
    else {
      double v8 = @"Internal diagnostic: Item is not pickable";
    }
    double v9 = [(_UIDocumentPickerCell *)self item];
    double v10 = [v9 pickabilityReason];
    id v17 = [v6 alertControllerWithTitle:v8 message:v10 preferredStyle:1];

    double v11 = (void *)MEMORY[0x263F1C3F0];
    v12 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v13 = [v12 localizedStringForKey:@"Bummer" value:@"Bummer" table:@"Localizable"];
    double v14 = [v11 actionWithTitle:v13 style:0 handler:0];
    [v17 addAction:v14];

    v15 = [(_UIDocumentPickerDocumentCell *)self window];
    v16 = [v15 rootViewController];
    [v16 presentViewController:v17 animated:1 completion:0];
  }
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

@end