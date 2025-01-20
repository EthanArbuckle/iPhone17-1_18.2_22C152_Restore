@interface NTK_PUPhotoEditAdjustmentCell
- (BOOL)displayMappedValue;
- (BOOL)shouldDisplayValueLabel;
- (NTK_PUPhotoEditAdjustmentCell)initWithCoder:(id)a3;
- (NTK_PUPhotoEditAdjustmentCell)initWithFrame:(CGRect)a3;
- (NTK_PUPhotoEditBaseAdjustmentCellDelegate)delegate;
- (void)_setupEventHandler;
- (void)_updateImage;
- (void)_updateValueLabelVisibility;
- (void)handleButton:(id)a3;
- (void)ntk_setImage:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayMappedValue:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setImageName:(id)a3;
- (void)setIsUserModifying:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setShouldDisplayValueLabel:(BOOL)a3;
@end

@implementation NTK_PUPhotoEditAdjustmentCell

- (NTK_PUPhotoEditAdjustmentCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTK_PUPhotoEditAdjustmentCell;
  v3 = -[NTK_PUPhotoEditBaseAdjustmentCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(NTK_PUPhotoEditAdjustmentCell *)v3 _setupEventHandler];
  }
  return v4;
}

- (NTK_PUPhotoEditAdjustmentCell)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTK_PUPhotoEditAdjustmentCell;
  v3 = [(NTK_PUPhotoEditBaseAdjustmentCell *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(NTK_PUPhotoEditAdjustmentCell *)v3 _setupEventHandler];
  }
  return v4;
}

- (void)_setupEventHandler
{
  id v3 = [(NTK_PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v3 addTarget:self action:"handleButton:" forControlEvents:64];
}

- (void)setImageName:(id)a3
{
  v5 = (NSString *)a3;
  p_imageName = &self->super._imageName;
  if (self->super._imageName != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_imageName, a3);
    p_imageName = (NSString **)[(NTK_PUPhotoEditAdjustmentCell *)self _updateImage];
    v5 = v7;
  }

  _objc_release_x1(p_imageName, v5);
}

- (void)ntk_setImage:(id)a3
{
  id v4 = a3;
  id v5 = [(NTK_PUPhotoEditBaseAdjustmentCell *)self ntk_image];
  v6.receiver = self;
  v6.super_class = (Class)NTK_PUPhotoEditAdjustmentCell;
  [(NTK_PUPhotoEditBaseAdjustmentCell *)&v6 ntk_setImage:v4];

  if (v5 != v4) {
    [(NTK_PUPhotoEditAdjustmentCell *)self _updateImage];
  }
}

- (void)_updateImage
{
  id v6 = [(NTK_PUPhotoEditBaseAdjustmentCell *)self ntk_image];
  if (v6)
  {
    id v3 = [(NTK_PUPhotoEditBaseAdjustmentCell *)self containerButton];
    [v3 setImage:v6 forState:0];
  }
  else
  {
    id v3 = [(NTK_PUPhotoEditBaseAdjustmentCell *)self imageName];
    id v4 = +[UIImage pu_PhotosUIImageNamed:v3];
    id v5 = [(NTK_PUPhotoEditBaseAdjustmentCell *)self containerButton];
    [v5 setImage:v4 forState:0];
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTK_PUPhotoEditAdjustmentCell;
  -[NTK_PUPhotoEditBaseAdjustmentCell setSelected:](&v7, "setSelected:");
  id v5 = [(NTK_PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v5 setEnabled:v3];

  id v6 = [(NTK_PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v6 setUserInteractionEnabled:v3];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NTK_PUPhotoEditAdjustmentCell;
  -[NTK_PUPhotoEditBaseAdjustmentCell setEnabled:](&v8, "setEnabled:");
  id v5 = [(NTK_PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v5 setSelected:v3];

  if (v3) {
    double v6 = 1.0;
  }
  else {
    double v6 = 0.3;
  }
  objc_super v7 = [(NTK_PUPhotoEditAdjustmentCell *)self contentView];
  [v7 setAlpha:v6];
}

- (void)setIsUserModifying:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTK_PUPhotoEditAdjustmentCell;
  [(NTK_PUPhotoEditBaseAdjustmentCell *)&v4 setIsUserModifying:a3];
  [(NTK_PUPhotoEditAdjustmentCell *)self _updateValueLabelVisibility];
}

- (void)_updateValueLabelVisibility
{
  if ([(NTK_PUPhotoEditBaseAdjustmentCell *)self isUserModifying]) {
    BOOL v3 = [(NTK_PUPhotoEditAdjustmentCell *)self shouldDisplayValueLabel];
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = [(NTK_PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v4 setShouldShowValueLabel:v3];
}

- (void)setDisplayMappedValue:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NTK_PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v4 setDisplayMappedValue:v3];
}

- (BOOL)displayMappedValue
{
  v2 = [(NTK_PUPhotoEditBaseAdjustmentCell *)self containerButton];
  unsigned __int8 v3 = [v2 displayMappedValue];

  return v3;
}

- (void)handleButton:(id)a3
{
  id v7 = a3;
  id v4 = [(NTK_PUPhotoEditAdjustmentCell *)self delegate];
  unsigned int v5 = [v4 canToggleCell:self];

  if (v5)
  {
    objc_msgSend(v7, "setSelected:", objc_msgSend(v7, "isSelected") ^ 1);
    -[NTK_PUPhotoEditAdjustmentCell setEnabled:](self, "setEnabled:", [v7 isSelected]);
    double v6 = [(NTK_PUPhotoEditAdjustmentCell *)self delegate];
    [v6 didToggleCell:self];
  }
}

- (NTK_PUPhotoEditBaseAdjustmentCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NTK_PUPhotoEditBaseAdjustmentCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldDisplayValueLabel
{
  return self->_shouldDisplayValueLabel;
}

- (void)setShouldDisplayValueLabel:(BOOL)a3
{
  self->_shouldDisplayValueLabel = a3;
}

- (void).cxx_destruct
{
}

@end