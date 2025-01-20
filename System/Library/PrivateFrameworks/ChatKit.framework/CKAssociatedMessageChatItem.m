@interface CKAssociatedMessageChatItem
+ (CATransform3D)transformForImageViewWithGeometryDescriptor:(SEL)a3 shouldScale:(IMAssociatedMessageGeometryDescriptor *)a4 parentSize:(BOOL)a5;
+ (CGPoint)locationForStickerReactionWithParentFrame:(CGRect)a3 reactionIndex:(int64_t)a4 parentIsFromMe:(BOOL)a5 insets:(UIEdgeInsets)a6;
+ (CGRect)adjustContentAlignmentRect:(CGRect)a3 forChatItemSize:(CGSize)a4 transcriptOrientation:(char)a5;
+ (CGRect)frameForAssociatedMessageItemSize:(CGSize)a3 parentFrame:(CGRect)a4 geometryDescriptor:(IMAssociatedMessageGeometryDescriptor *)a5;
+ (double)horizontalOriginForAssociatedMessageItemSize:(CGSize)a3 parentFrame:(CGRect)a4 geometryDescriptor:(IMAssociatedMessageGeometryDescriptor *)a5;
+ (double)rotationForGUIDHash:(int64_t)a3;
+ (double)verticalOriginForAssociatedMessageItemSize:(CGSize)a3 parentFrame:(CGRect)a4 geometryDescriptor:(IMAssociatedMessageGeometryDescriptor *)a5;
+ (void)applyTransformToView:(id)a3 viewFrame:(CGRect)a4 parentSize:(CGSize)a5 forGeometryDescriptor:(IMAssociatedMessageGeometryDescriptor *)a6;
- (BOOL)failed;
- (BOOL)parentMessageIsFromMe;
- (BOOL)wantsDrawerLayout;
- (CATransform3D)transformForImageViewWithParentSize:(SEL)a3 shouldScale:(CGSize)a4;
- (CGRect)adjustContentAlignmentRect:(CGRect)a3 forChatItemSize:(CGSize)a4;
- (CGRect)adjustedParentFrameForPositioning:(CGRect)a3;
- (CGRect)frameRelativeToParentFrame:(CGRect)a3;
- (IMAssociatedMessageGeometryDescriptor)geometryDescriptor;
- (NSDate)time;
- (NSString)associatedChatItemGUID;
- (NSString)associatedMessageGUID;
- (NSString)guid;
- (NSString)timestampString;
- (UIColor)attributionImageTintColor;
- (UIImage)attributionImage;
- (_NSRange)associatedMessageRange;
- (char)transcriptOrientation;
- (double)horizonalOriginRelativeToParentFrame:(CGRect)a3;
- (double)verticalOriginRelativeToParentFrame:(CGRect)a3;
- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7;
- (id)loadTimestampString;
- (id)loadTranscriptDrawerText;
- (id)sender;
- (int64_t)associatedMessageType;
- (unint64_t)stickerPositionVersion;
- (void)setTimestampString:(id)a3;
@end

@implementation CKAssociatedMessageChatItem

+ (CATransform3D)transformForImageViewWithGeometryDescriptor:(SEL)a3 shouldScale:(IMAssociatedMessageGeometryDescriptor *)a4 parentSize:(BOOL)a5
{
  double width = a6.width;
  double scale = 1.0;
  if (a5)
  {
    if (a4->layoutIntent == 12)
    {
      double scale = a4->scale;
    }
    else
    {
      double parentPreviewWidth = a4->parentPreviewWidth;
      if (parentPreviewWidth > 0.0) {
        double scale = width / parentPreviewWidth;
      }
    }
    if (scale < 0.100000001) {
      double scale = 0.100000001;
    }
  }
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  *(_OWORD *)&v18.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  *(_OWORD *)&v18.m33 = v11;
  long long v12 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  *(_OWORD *)&v18.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  *(_OWORD *)&v18.m43 = v12;
  long long v13 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  *(_OWORD *)&v18.m11 = *MEMORY[0x1E4F39B10];
  *(_OWORD *)&v18.m13 = v13;
  long long v14 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  *(_OWORD *)&v18.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  *(_OWORD *)&v18.m23 = v14;
  *(_OWORD *)&v17.m31 = *(_OWORD *)&v18.m31;
  *(_OWORD *)&v17.m33 = v11;
  *(_OWORD *)&v17.m41 = *(_OWORD *)&v18.m41;
  *(_OWORD *)&v17.m43 = v12;
  *(_OWORD *)&v17.m11 = *(_OWORD *)&v18.m11;
  *(_OWORD *)&v17.m13 = v13;
  *(_OWORD *)&v17.m21 = *(_OWORD *)&v18.m21;
  *(_OWORD *)&v17.m23 = v14;
  CATransform3DScale(&v18, &v17, scale, scale, 1.0);
  double rotation = a4->rotation;
  CATransform3D v17 = v18;
  return CATransform3DRotate(retstr, &v17, rotation, 0.0, 0.0, 1.0);
}

+ (double)verticalOriginForAssociatedMessageItemSize:(CGSize)a3 parentFrame:(CGRect)a4 geometryDescriptor:(IMAssociatedMessageGeometryDescriptor *)a5
{
  double height = a4.size.height;
  double y = a4.origin.y;
  double v7 = a3.height;
  double yScalar = a5->yScalar;
  if (CKMainScreenScale_once_29 != -1) {
    dispatch_once(&CKMainScreenScale_once_29, &__block_literal_global_101);
  }
  double v9 = *(double *)&CKMainScreenScale_sMainScreenScale_29;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_29 == 0.0) {
    double v9 = 1.0;
  }
  return round((y + height * yScalar + v7 * -0.5) * v9) / v9;
}

+ (double)horizontalOriginForAssociatedMessageItemSize:(CGSize)a3 parentFrame:(CGRect)a4 geometryDescriptor:(IMAssociatedMessageGeometryDescriptor *)a5
{
  double width = a4.size.width;
  double x = a4.origin.x;
  double v7 = a3.width;
  double xScalar = a5->xScalar;
  if (CKMainScreenScale_once_29 != -1) {
    dispatch_once(&CKMainScreenScale_once_29, &__block_literal_global_101);
  }
  double v9 = *(double *)&CKMainScreenScale_sMainScreenScale_29;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_29 == 0.0) {
    double v9 = 1.0;
  }
  return round((x + width * xScalar + v7 * -0.5) * v9) / v9;
}

+ (CGRect)frameForAssociatedMessageItemSize:(CGSize)a3 parentFrame:(CGRect)a4 geometryDescriptor:(IMAssociatedMessageGeometryDescriptor *)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v10 = a3.height;
  double v11 = a3.width;
  long long v13 = *(_OWORD *)&a5->parentPreviewWidth;
  long long v21 = *(_OWORD *)&a5->layoutIntent;
  long long v22 = v13;
  long long v23 = *(_OWORD *)&a5->yScalar;
  double rotation = a5->rotation;
  [a1 verticalOriginForAssociatedMessageItemSize:&v21 parentFrame:a3.width geometryDescriptor:v10];
  double v15 = v14;
  long long v16 = *(_OWORD *)&a5->parentPreviewWidth;
  long long v21 = *(_OWORD *)&a5->layoutIntent;
  long long v22 = v16;
  long long v23 = *(_OWORD *)&a5->yScalar;
  double rotation = a5->rotation;
  objc_msgSend(a1, "horizontalOriginForAssociatedMessageItemSize:parentFrame:geometryDescriptor:", &v21, v11, v10, x, y, width, height);
  double v18 = v15;
  double v19 = v11;
  double v20 = v10;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (CGRect)frameRelativeToParentFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = objc_opt_class();
  [(CKChatItem *)self size];
  double v10 = v9;
  double v12 = v11;
  -[CKAssociatedMessageChatItem adjustedParentFrameForPositioning:](self, "adjustedParentFrameForPositioning:", x, y, width, height);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  [(CKAssociatedMessageChatItem *)self geometryDescriptor];
  objc_msgSend(v8, "frameForAssociatedMessageItemSize:parentFrame:geometryDescriptor:", v25, v10, v12, v14, v16, v18, v20);
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (double)verticalOriginRelativeToParentFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = objc_opt_class();
  [(CKChatItem *)self size];
  double v10 = v9;
  double v12 = v11;
  -[CKAssociatedMessageChatItem adjustedParentFrameForPositioning:](self, "adjustedParentFrameForPositioning:", x, y, width, height);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  [(CKAssociatedMessageChatItem *)self geometryDescriptor];
  objc_msgSend(v8, "verticalOriginForAssociatedMessageItemSize:parentFrame:geometryDescriptor:", v22, v10, v12, v14, v16, v18, v20);
  return result;
}

- (double)horizonalOriginRelativeToParentFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = objc_opt_class();
  [(CKChatItem *)self size];
  double v10 = v9;
  double v12 = v11;
  -[CKAssociatedMessageChatItem adjustedParentFrameForPositioning:](self, "adjustedParentFrameForPositioning:", x, y, width, height);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  [(CKAssociatedMessageChatItem *)self geometryDescriptor];
  objc_msgSend(v8, "horizontalOriginForAssociatedMessageItemSize:parentFrame:geometryDescriptor:", v22, v10, v12, v14, v16, v18, v20);
  return result;
}

- (CATransform3D)transformForImageViewWithParentSize:(SEL)a3 shouldScale:(CGSize)a4
{
  BOOL v5 = a5;
  double height = a4.height;
  double width = a4.width;
  double v10 = objc_opt_class();
  double result = [(CKAssociatedMessageChatItem *)self geometryDescriptor];
  if (v10) {
    return (CATransform3D *)objc_msgSend(v10, "transformForImageViewWithGeometryDescriptor:shouldScale:parentSize:", v12, v5, width, height);
  }
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  return result;
}

- (CGRect)adjustedParentFrameForPositioning:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = objc_opt_class();
  [(CKChatItem *)self size];

  objc_msgSend(v8, "adjustedParentFrameForPositioning:forItemSize:", x, y, width, height, v9, v10);
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (CGRect)adjustContentAlignmentRect:(CGRect)a3 forChatItemSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v6 = a3.size.height;
  double v7 = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v11 = objc_opt_class();
  uint64_t v12 = [(CKAssociatedMessageChatItem *)self transcriptOrientation];

  objc_msgSend(v11, "adjustContentAlignmentRect:forChatItemSize:transcriptOrientation:", v12, x, y, v7, v6, width, height);
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

+ (CGRect)adjustContentAlignmentRect:(CGRect)a3 forChatItemSize:(CGSize)a4 transcriptOrientation:(char)a5
{
  int v5 = a5;
  double width = a4.width;
  CGFloat height = a3.size.height;
  CGFloat v8 = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  if (adjustContentAlignmentRect_forChatItemSize_transcriptOrientation__onceToken != -1) {
    dispatch_once(&adjustContentAlignmentRect_forChatItemSize_transcriptOrientation__onceToken, &__block_literal_global_67);
  }
  if (v5 == 2)
  {
    v15.origin.double x = x;
    v15.origin.CGFloat y = y;
    v15.size.double width = v8;
    v15.size.CGFloat height = height;
    double x = CGRectGetMaxX(v15)
      - width
      + *(double *)&adjustContentAlignmentRect_forChatItemSize_transcriptOrientation__sTailWidth;
  }
  else if (!v5)
  {
    double x = x - *(double *)&adjustContentAlignmentRect_forChatItemSize_transcriptOrientation__sTailWidth;
  }
  double v11 = x;
  double v12 = y;
  double v13 = width;
  double v14 = height;
  result.size.CGFloat height = v14;
  result.size.double width = v13;
  result.origin.CGFloat y = v12;
  result.origin.double x = v11;
  return result;
}

void __114__CKAssociatedMessageChatItem_TranscriptLayout__adjustContentAlignmentRect_forChatItemSize_transcriptOrientation___block_invoke()
{
  id v1 = +[CKUIBehavior sharedBehaviors];
  [v1 balloonMaskTailSizeForTailShape:1];
  adjustContentAlignmentRect_forChatItemSize_transcriptOrientation__sTailWidth = v0;
}

+ (void)applyTransformToView:(id)a3 viewFrame:(CGRect)a4 parentSize:(CGSize)a5 forGeometryDescriptor:(IMAssociatedMessageGeometryDescriptor *)a6
{
  double height = a5.height;
  double width = a5.width;
  double v28 = a4.size.width;
  double v29 = a4.size.height;
  CGPoint origin = a4.origin;
  CGFloat y = a4.origin.y;
  double v9 = (double *)MEMORY[0x1E4F1DB28];
  float64x2_t v25 = *(float64x2_t *)(MEMORY[0x1E4F1DB28] + 16);
  uint64_t v10 = CKMainScreenScale_once_29;
  id v11 = a3;
  if (v10 != -1) {
    dispatch_once(&CKMainScreenScale_once_29, &__block_literal_global_101);
  }
  double v12 = *(double *)&CKMainScreenScale_sMainScreenScale_29;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_29 == 0.0) {
    double v12 = 1.0;
  }
  v13.f64[0] = origin.x;
  v13.f64[1] = y;
  float64x2_t v14 = vmulq_n_f64(v13, v12);
  v13.f64[0] = v28;
  v13.f64[1] = v29;
  __asm { FMOV            V2.2D, #0.5 }
  double v20 = *v9;
  double v21 = v9[1];
  objc_msgSend(v11, "setCenter:", vmulq_n_f64(vaddq_f64(v14, vrndmq_f64(vmulq_f64(vsubq_f64(vmulq_n_f64(v13, v12), vmulq_n_f64(v25, v12)), _Q2))), 1.0 / v12), *(_OWORD *)&v25, origin);
  objc_msgSend(v11, "setBounds:", v20, v21, v28, v29);
  BOOL v22 = a6->layoutIntent - 12 < 0xFFFFFFFFFFFFFFF5;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v23 = *(_OWORD *)&a6->parentPreviewWidth;
  long long v30 = *(_OWORD *)&a6->layoutIntent;
  long long v31 = v23;
  long long v32 = *(_OWORD *)&a6->yScalar;
  *(double *)&long long v33 = a6->rotation;
  +[CKAssociatedMessageChatItem transformForImageViewWithGeometryDescriptor:shouldScale:parentSize:](CKAssociatedMessageChatItem, "transformForImageViewWithGeometryDescriptor:shouldScale:parentSize:", &v30, v22, width, height);
  double v24 = [v11 layer];

  long long v34 = v42;
  long long v35 = v43;
  long long v36 = v44;
  long long v37 = v45;
  long long v30 = v38;
  long long v31 = v39;
  long long v32 = v40;
  long long v33 = v41;
  [v24 setTransform:&v30];
}

+ (CGPoint)locationForStickerReactionWithParentFrame:(CGRect)a3 reactionIndex:(int64_t)a4 parentIsFromMe:(BOOL)a5 insets:(UIEdgeInsets)a6
{
  double right = a6.right;
  double bottom = a6.bottom;
  double left = a6.left;
  double top = a6.top;
  BOOL v10 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (CKMainScreenScale_once_29 != -1) {
    dispatch_once(&CKMainScreenScale_once_29, &__block_literal_global_101);
  }
  double v16 = *(double *)&CKMainScreenScale_sMainScreenScale_29;
  double v17 = 1.0;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_29 == 0.0) {
    double v16 = 1.0;
  }
  double v18 = floor(x * v16) / v16;
  double v19 = floor(y * v16) / v16;
  double v20 = *(double *)&CKMainScreenScale_sMainScreenScale_29;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_29 == 0.0) {
    double v20 = 1.0;
  }
  double v21 = floor(width * v20) / v20;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_29 != 0.0) {
    double v17 = *(double *)&CKMainScreenScale_sMainScreenScale_29;
  }
  double v22 = floor(height * v17) / v17;
  double v23 = left + v18;
  double v24 = top + v19;
  double v25 = v21 - (left + right);
  double v26 = v22 - (top + bottom);
  v27 = +[CKUIBehavior sharedBehaviors];
  [v27 stickerReactionSize];
  +[CKStickerReactionLayoutHelper stickerCenterForIndex:inFrame:alignLeft:stickerSize:](CKStickerReactionLayoutHelper, "stickerCenterForIndex:inFrame:alignLeft:stickerSize:", a4, !v10, v23, v24, v25, v26, v28, v29);
  double v31 = v30;
  double v33 = v32;

  double v34 = v31;
  double v35 = v33;
  result.double y = v35;
  result.double x = v34;
  return result;
}

+ (double)rotationForGUIDHash:(int64_t)a3
{
  if (a3 >= 0) {
    int64_t v3 = a3;
  }
  else {
    int64_t v3 = -a3;
  }
  v4 = +[CKUIBehavior sharedBehaviors];
  [v4 maxStickerReactionRotation];
  double v6 = v5;

  double v7 = +[CKUIBehavior sharedBehaviors];
  [v7 minStickerReactionRotation];
  double v9 = v8;

  double v10 = v9 + (double)(v3 % (uint64_t)(v6 - v9));
  if ((v3 & 1) == 0) {
    double v10 = -v10;
  }
  return v10 * 3.14159265 / 180.0;
}

- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7
{
  return 0;
}

- (NSString)guid
{
  v2 = [(CKAssociatedMessageChatItem *)self IMAssociatedMessageChatItem];
  int64_t v3 = [v2 guid];

  return (NSString *)v3;
}

- (NSString)associatedChatItemGUID
{
  v2 = [(CKAssociatedMessageChatItem *)self IMAssociatedMessageChatItem];
  int64_t v3 = [v2 associatedMessageGUID];
  v4 = IMAssociatedMessageDecodeGUID();

  return (NSString *)v4;
}

- (NSString)associatedMessageGUID
{
  v2 = [(CKAssociatedMessageChatItem *)self IMAssociatedMessageChatItem];
  int64_t v3 = [v2 associatedMessageGUID];

  return (NSString *)v3;
}

- (BOOL)parentMessageIsFromMe
{
  v2 = [(CKAssociatedMessageChatItem *)self IMAssociatedMessageChatItem];
  char v3 = [v2 parentMessageIsFromMe];

  return v3;
}

- (unint64_t)stickerPositionVersion
{
  v2 = [(CKAssociatedMessageChatItem *)self IMAssociatedMessageChatItem];
  unint64_t v3 = [v2 stickerPositionVersion];

  return v3;
}

- (char)transcriptOrientation
{
  if ([(CKChatItem *)self isFromMe]) {
    return 0;
  }
  else {
    return 2;
  }
}

- (BOOL)failed
{
  BOOL v3 = [(CKChatItem *)self isFromMe];
  if (v3)
  {
    v4 = [(CKAssociatedMessageChatItem *)self IMAssociatedMessageChatItem];
    char v5 = [v4 failed];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (IMAssociatedMessageGeometryDescriptor)geometryDescriptor
{
  v4 = [(CKAssociatedMessageChatItem *)self IMAssociatedMessageChatItem];
  if (v4)
  {
    double v6 = v4;
    [v4 geometryDescriptor];
    v4 = v6;
  }
  else
  {
    retstr->double rotation = 0.0;
    *(_OWORD *)&retstr->double parentPreviewWidth = 0u;
    *(_OWORD *)&retstr->double yScalar = 0u;
    *(_OWORD *)&retstr->layoutIntent = 0u;
  }

  return result;
}

- (id)loadTranscriptDrawerText
{
  v2 = +[CKUIBehavior sharedBehaviors];
  BOOL v3 = [v2 timestampDateFormatter];

  v4 = [MEMORY[0x1E4F1C9C8] date];
  char v5 = [v3 stringFromDate:v4];

  double v6 = +[CKUIBehavior sharedBehaviors];
  double v7 = [v6 drawerTranscriptTextAttributes];

  if (v5) {
    double v8 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5 attributes:v7];
  }
  else {
    double v8 = 0;
  }

  return v8;
}

- (NSString)timestampString
{
  timestampString = self->_timestampString;
  if (!timestampString)
  {
    v4 = [(CKAssociatedMessageChatItem *)self loadTimestampString];
    char v5 = (NSString *)[v4 copy];
    double v6 = self->_timestampString;
    self->_timestampString = v5;

    timestampString = self->_timestampString;
  }

  return timestampString;
}

- (NSDate)time
{
  v2 = [(CKAssociatedMessageChatItem *)self IMAssociatedMessageChatItem];
  BOOL v3 = [v2 time];

  return (NSDate *)v3;
}

- (id)sender
{
  v2 = [(CKAssociatedMessageChatItem *)self IMAssociatedMessageChatItem];
  BOOL v3 = [v2 sender];

  return v3;
}

- (_NSRange)associatedMessageRange
{
  v2 = [(CKAssociatedMessageChatItem *)self IMAssociatedMessageChatItem];
  uint64_t v3 = [v2 associatedMessageRange];
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (int64_t)associatedMessageType
{
  v2 = [(CKAssociatedMessageChatItem *)self IMAssociatedMessageChatItem];
  int64_t v3 = [v2 associatedMessageType];

  return v3;
}

- (id)loadTimestampString
{
  v2 = [(CKAssociatedMessageChatItem *)self time];
  int64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  NSUInteger v4 = +[CKDateUtilities relativeDateFormatterFromDate:v2 toDate:v3];
  NSUInteger v5 = [v4 stringFromDate:v2];

  return v5;
}

- (BOOL)wantsDrawerLayout
{
  return 1;
}

- (UIImage)attributionImage
{
  return 0;
}

- (UIColor)attributionImageTintColor
{
  return 0;
}

- (void)setTimestampString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end