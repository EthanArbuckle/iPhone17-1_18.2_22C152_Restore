@interface CKBrowserDragControllerTarget
+ (id)targetWithScreenCoordinate:(CGPoint)a3 initialSize:(CGSize)a4 scale:(double)a5 meshScaleFactor:(double)a6 rotation:(double)a7 associatedLayoutIntent:(unint64_t)a8;
+ (id)targetWithScreenCoordinate:(CGPoint)a3 initialSize:(CGSize)a4 scale:(double)a5 meshScaleFactor:(double)a6 rotation:(double)a7 associatedLayoutIntent:(unint64_t)a8 stickerIsRepositioning:(BOOL)a9 stickerChatItem:(id)a10;
- (BOOL)stickerIsRepositioning;
- (CGPoint)screenCoordinate;
- (CGSize)initialSize;
- (CKAssociatedStickerChatItem)stickerChatItem;
- (double)meshScaleFactor;
- (double)rotation;
- (double)scale;
- (id)description;
- (unint64_t)associatedLayoutIntent;
- (void)setAssociatedLayoutIntent:(unint64_t)a3;
- (void)setInitialSize:(CGSize)a3;
- (void)setMeshScaleFactor:(double)a3;
- (void)setRotation:(double)a3;
- (void)setScale:(double)a3;
- (void)setScreenCoordinate:(CGPoint)a3;
- (void)setStickerChatItem:(id)a3;
- (void)setStickerIsRepositioning:(BOOL)a3;
@end

@implementation CKBrowserDragControllerTarget

+ (id)targetWithScreenCoordinate:(CGPoint)a3 initialSize:(CGSize)a4 scale:(double)a5 meshScaleFactor:(double)a6 rotation:(double)a7 associatedLayoutIntent:(unint64_t)a8
{
  return (id)objc_msgSend(a1, "targetWithScreenCoordinate:initialSize:scale:meshScaleFactor:rotation:associatedLayoutIntent:stickerIsRepositioning:stickerChatItem:", a8, 0, 0, a3.x, a3.y, a4.width, a4.height, a5, a6, a7);
}

+ (id)targetWithScreenCoordinate:(CGPoint)a3 initialSize:(CGSize)a4 scale:(double)a5 meshScaleFactor:(double)a6 rotation:(double)a7 associatedLayoutIntent:(unint64_t)a8 stickerIsRepositioning:(BOOL)a9 stickerChatItem:(id)a10
{
  double height = a4.height;
  double width = a4.width;
  double y = a3.y;
  double x = a3.x;
  id v19 = a10;
  v20 = objc_alloc_init(CKBrowserDragControllerTarget);
  -[CKBrowserDragControllerTarget setScreenCoordinate:](v20, "setScreenCoordinate:", x, y);
  -[CKBrowserDragControllerTarget setInitialSize:](v20, "setInitialSize:", width, height);
  [(CKBrowserDragControllerTarget *)v20 setScale:a5];
  [(CKBrowserDragControllerTarget *)v20 setMeshScaleFactor:a6];
  [(CKBrowserDragControllerTarget *)v20 setRotation:a7];
  [(CKBrowserDragControllerTarget *)v20 setAssociatedLayoutIntent:a8];
  if (a9)
  {
    v21 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    -[CKBrowserDragControllerTarget setStickerIsRepositioning:](v20, "setStickerIsRepositioning:", [v21 isStickerRepositioningEnabled]);
  }
  else
  {
    [(CKBrowserDragControllerTarget *)v20 setStickerIsRepositioning:0];
  }
  [(CKBrowserDragControllerTarget *)v20 setStickerChatItem:v19];

  return v20;
}

- (id)description
{
  v3 = NSString;
  [(CKBrowserDragControllerTarget *)self screenCoordinate];
  v4 = NSStringFromCGPoint(v16);
  [(CKBrowserDragControllerTarget *)self initialSize];
  v5 = NSStringFromCGSize(v17);
  [(CKBrowserDragControllerTarget *)self scale];
  uint64_t v7 = v6;
  [(CKBrowserDragControllerTarget *)self rotation];
  uint64_t v9 = v8;
  unint64_t v10 = [(CKBrowserDragControllerTarget *)self associatedLayoutIntent];
  BOOL v11 = [(CKBrowserDragControllerTarget *)self stickerIsRepositioning];
  v12 = @"No";
  if (v11) {
    v12 = @"Yes";
  }
  v13 = [v3 stringWithFormat:@"CKBrowserDragControllerTarget coord: %@ size %@ scale %f rotation %f associatedIntent %tu isStickerRepositioning: %@", v4, v5, v7, v9, v10, v12];

  return v13;
}

- (CGPoint)screenCoordinate
{
  double x = self->_screenCoordinate.x;
  double y = self->_screenCoordinate.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setScreenCoordinate:(CGPoint)a3
{
  self->_screenCoordinate = a3;
}

- (CGSize)initialSize
{
  double width = self->_initialSize.width;
  double height = self->_initialSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setInitialSize:(CGSize)a3
{
  self->_initialSize = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (double)meshScaleFactor
{
  return self->_meshScaleFactor;
}

- (void)setMeshScaleFactor:(double)a3
{
  self->_meshScaleFactor = a3;
}

- (double)rotation
{
  return self->_rotation;
}

- (void)setRotation:(double)a3
{
  self->_rotation = a3;
}

- (unint64_t)associatedLayoutIntent
{
  return self->_associatedLayoutIntent;
}

- (void)setAssociatedLayoutIntent:(unint64_t)a3
{
  self->_associatedLayoutIntent = a3;
}

- (BOOL)stickerIsRepositioning
{
  return self->_stickerIsRepositioning;
}

- (void)setStickerIsRepositioning:(BOOL)a3
{
  self->_stickerIsRepositioning = a3;
}

- (CKAssociatedStickerChatItem)stickerChatItem
{
  return self->_stickerChatItem;
}

- (void)setStickerChatItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end