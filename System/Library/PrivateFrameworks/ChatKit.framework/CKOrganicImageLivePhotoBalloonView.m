@interface CKOrganicImageLivePhotoBalloonView
- (BOOL)canUseOpaqueMask;
- (CKBalloonDescriptor_t)balloonDescriptor;
- (void)prepareForReuse;
- (void)setFrame:(CGRect)a3;
@end

@implementation CKOrganicImageLivePhotoBalloonView

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(CKOrganicImageLivePhotoBalloonView *)self frame];
  v21.origin.double x = v8;
  v21.origin.double y = v9;
  v21.size.double width = v10;
  v21.size.double height = v11;
  v20.origin.double x = x;
  v20.origin.double y = y;
  v20.size.double width = width;
  v20.size.double height = height;
  if (!CGRectEqualToRect(v20, v21))
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v17 = 0u;
    [(CKOrganicImageLivePhotoBalloonView *)self transform];
    long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v16[0] = *MEMORY[0x1E4F1DAB8];
    v16[1] = v12;
    v16[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [(CKOrganicImageLivePhotoBalloonView *)self setTransform:v16];
    v15.receiver = self;
    v15.super_class = (Class)CKOrganicImageLivePhotoBalloonView;
    -[CKBalloonView setFrame:](&v15, sel_setFrame_, x, y, width, height);
    v13 = [(CKLivePhotoBalloonView *)self livePhotoView];
    [(CKOrganicImageLivePhotoBalloonView *)self bounds];
    objc_msgSend(v13, "setFrame:");

    v14[0] = v17;
    v14[1] = v18;
    v14[2] = v19;
    [(CKOrganicImageLivePhotoBalloonView *)self setTransform:v14];
  }
}

- (BOOL)canUseOpaqueMask
{
  return 0;
}

- (CKBalloonDescriptor_t)balloonDescriptor
{
  *(_OWORD *)&retstr->var6.alpha = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var6.green = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  v5.receiver = self;
  v5.super_class = (Class)CKOrganicImageLivePhotoBalloonView;
  result = (CKBalloonDescriptor_t *)[(CKBalloonDescriptor_t *)&v5 balloonDescriptor];
  retstr->var4 = -1;
  retstr->var1 = 0;
  return result;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)CKOrganicImageLivePhotoBalloonView;
  [(CKImageBalloonView *)&v5 prepareForReuse];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v3;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(CKOrganicImageLivePhotoBalloonView *)self setTransform:v4];
}

@end