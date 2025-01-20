@interface PKAutorefineDebugTableDataEntry
@end

@implementation PKAutorefineDebugTableDataEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEntry, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_refinedDrawing, 0);

  objc_storeStrong((id *)&self->_originalDrawing, 0);
}

@end