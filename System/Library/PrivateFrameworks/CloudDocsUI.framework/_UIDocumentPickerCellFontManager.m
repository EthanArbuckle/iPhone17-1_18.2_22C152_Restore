@interface _UIDocumentPickerCellFontManager
+ (id)sharedFontManager;
- (UIFont)subtitleFontForGridLayout;
- (UIFont)subtitleFontForTableLayout;
- (UIFont)titleFontForGridLayout;
- (UIFont)titleFontForTableLayout;
- (_UIDocumentPickerCellFontManager)init;
- (void)cacheFonts;
- (void)setSubtitleFontForGridLayout:(id)a3;
- (void)setSubtitleFontForTableLayout:(id)a3;
- (void)setTitleFontForGridLayout:(id)a3;
- (void)setTitleFontForTableLayout:(id)a3;
@end

@implementation _UIDocumentPickerCellFontManager

+ (id)sharedFontManager
{
  v2 = (void *)sharedFontManager_sharedInstance;
  if (!sharedFontManager_sharedInstance)
  {
    v3 = objc_alloc_init(_UIDocumentPickerCellFontManager);
    v4 = (void *)sharedFontManager_sharedInstance;
    sharedFontManager_sharedInstance = (uint64_t)v3;

    v2 = (void *)sharedFontManager_sharedInstance;
  }

  return v2;
}

- (_UIDocumentPickerCellFontManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UIDocumentPickerCellFontManager;
  v2 = [(_UIDocumentPickerCellFontManager *)&v5 init];
  v3 = v2;
  if (v2) {
    [(_UIDocumentPickerCellFontManager *)v2 cacheFonts];
  }
  return v3;
}

- (void)cacheFonts
{
  v3 = +[_UIDocumentPickerCell _titleFontForTable:1];
  [(_UIDocumentPickerCellFontManager *)self setTitleFontForTableLayout:v3];

  v4 = +[_UIDocumentPickerCell _subtitleFontForTable:1];
  [(_UIDocumentPickerCellFontManager *)self setSubtitleFontForTableLayout:v4];

  objc_super v5 = +[_UIDocumentPickerCell _titleFontForTable:0];
  [(_UIDocumentPickerCellFontManager *)self setTitleFontForGridLayout:v5];

  id v6 = +[_UIDocumentPickerCell _subtitleFontForTable:0];
  [(_UIDocumentPickerCellFontManager *)self setSubtitleFontForGridLayout:v6];
}

- (UIFont)titleFontForGridLayout
{
  return self->_titleFontForGridLayout;
}

- (void)setTitleFontForGridLayout:(id)a3
{
}

- (UIFont)subtitleFontForGridLayout
{
  return self->_subtitleFontForGridLayout;
}

- (void)setSubtitleFontForGridLayout:(id)a3
{
}

- (UIFont)titleFontForTableLayout
{
  return self->_titleFontForTableLayout;
}

- (void)setTitleFontForTableLayout:(id)a3
{
}

- (UIFont)subtitleFontForTableLayout
{
  return self->_subtitleFontForTableLayout;
}

- (void)setSubtitleFontForTableLayout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleFontForTableLayout, 0);
  objc_storeStrong((id *)&self->_titleFontForTableLayout, 0);
  objc_storeStrong((id *)&self->_subtitleFontForGridLayout, 0);

  objc_storeStrong((id *)&self->_titleFontForGridLayout, 0);
}

@end