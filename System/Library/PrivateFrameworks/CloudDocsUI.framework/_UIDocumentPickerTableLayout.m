@interface _UIDocumentPickerTableLayout
- (int64_t)cellStyle;
- (void)setCellStyle:(int64_t)a3;
@end

@implementation _UIDocumentPickerTableLayout

- (int64_t)cellStyle
{
  return self->cellStyle;
}

- (void)setCellStyle:(int64_t)a3
{
  self->cellStyle = a3;
}

@end