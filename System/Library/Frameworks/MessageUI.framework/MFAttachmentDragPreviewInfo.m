@interface MFAttachmentDragPreviewInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isInlineImage;
- (CGPoint)center;
- (CGSize)displaySize;
- (MFAttachmentDragPreviewInfo)initWithCoder:(id)a3;
- (UIImage)image;
- (id)targetedDragPreviewInContainer:(id)a3 centerOffset:(CGPoint)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setDisplaySize:(CGSize)a3;
- (void)setImage:(id)a3;
- (void)setIsInlineImage:(BOOL)a3;
@end

@implementation MFAttachmentDragPreviewInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = [(MFAttachmentDragPreviewInfo *)self image];
  [v5 encodeObject:v4 forKey:@"imageData"];

  objc_msgSend(v5, "encodeBool:forKey:", -[MFAttachmentDragPreviewInfo isInlineImage](self, "isInlineImage"), @"inlineImage");
  [(MFAttachmentDragPreviewInfo *)self center];
  objc_msgSend(v5, "encodeCGPoint:forKey:", @"center");
  [(MFAttachmentDragPreviewInfo *)self displaySize];
  objc_msgSend(v5, "encodeCGSize:forKey:", @"displaySize");
}

- (MFAttachmentDragPreviewInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MFAttachmentDragPreviewInfo;
  id v5 = [(MFAttachmentDragPreviewInfo *)&v8 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageData"];
    [(MFAttachmentDragPreviewInfo *)v5 setImage:v6];

    -[MFAttachmentDragPreviewInfo setIsInlineImage:](v5, "setIsInlineImage:", [v4 decodeBoolForKey:@"inlineImage"]);
    [v4 decodeCGPointForKey:@"center"];
    -[MFAttachmentDragPreviewInfo setCenter:](v5, "setCenter:");
    [v4 decodeCGSizeForKey:@"displaySize"];
    -[MFAttachmentDragPreviewInfo setDisplaySize:](v5, "setDisplaySize:");
  }

  return v5;
}

- (id)targetedDragPreviewInContainer:(id)a3 centerOffset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  v29[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  [(MFAttachmentDragPreviewInfo *)self center];
  double v9 = v8;
  [(MFAttachmentDragPreviewInfo *)self center];
  double v11 = v10;
  id v12 = objc_alloc(MEMORY[0x1E4FB1838]);
  v13 = [(MFAttachmentDragPreviewInfo *)self image];
  v14 = (void *)[v12 initWithImage:v13];

  [(MFAttachmentDragPreviewInfo *)self displaySize];
  if (v16 != *MEMORY[0x1E4F1DB30] || v15 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    [(MFAttachmentDragPreviewInfo *)self displaySize];
    double v19 = v18;
    [(MFAttachmentDragPreviewInfo *)self displaySize];
    objc_msgSend(v14, "setFrame:", 0.0, 0.0, v19, v20);
  }
  if ([(MFAttachmentDragPreviewInfo *)self isInlineImage])
  {
    [v14 frame];
    CGRect v32 = CGRectInset(v31, 0.0, 1.0);
    objc_msgSend(v14, "setFrame:", v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
    [v14 setContentMode:2];
    id v21 = objc_alloc_init(MEMORY[0x1E4FB1720]);
  }
  else
  {
    v22 = (void *)MEMORY[0x1E4F29238];
    [v14 frame];
    v23 = objc_msgSend(v22, "valueWithCGRect:");
    id v24 = objc_alloc(MEMORY[0x1E4FB1720]);
    v29[0] = v23;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
    id v21 = (id)[v24 initWithTextLineRects:v25];
  }
  v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1728]), "initWithContainer:center:", v7, x + v9, y + v11);
  v27 = (void *)[objc_alloc(MEMORY[0x1E4FB1D40]) initWithView:v14 parameters:v21 target:v26];

  return v27;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (BOOL)isInlineImage
{
  return self->_isInlineImage;
}

- (void)setIsInlineImage:(BOOL)a3
{
  self->_isInlineImage = a3;
}

- (CGPoint)center
{
  double x = self->_center.x;
  double y = self->_center.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  self->_center = a3;
}

- (CGSize)displaySize
{
  double width = self->_displaySize.width;
  double height = self->_displaySize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDisplaySize:(CGSize)a3
{
  self->_displaySize = a3;
}

- (void).cxx_destruct
{
}

@end