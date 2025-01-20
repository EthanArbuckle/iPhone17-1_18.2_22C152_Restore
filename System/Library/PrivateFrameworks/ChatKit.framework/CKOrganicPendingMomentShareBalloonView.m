@interface CKOrganicPendingMomentShareBalloonView
- (CKOrganicImageLayoutRecipe)layoutRecipe;
- (void)prepareForDisplay;
- (void)prepareForReuse;
- (void)setLayoutRecipe:(id)a3;
@end

@implementation CKOrganicPendingMomentShareBalloonView

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)CKOrganicPendingMomentShareBalloonView;
  [(CKAttachmentBalloonView *)&v5 prepareForReuse];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v3;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(CKOrganicPendingMomentShareBalloonView *)self setTransform:v4];
}

- (void)prepareForDisplay
{
  v10.receiver = self;
  v10.super_class = (Class)CKOrganicPendingMomentShareBalloonView;
  [(CKPendingMomentShareBalloonView *)&v10 prepareForDisplay];
  long long v3 = [(CKOrganicPendingMomentShareBalloonView *)self layoutRecipe];
  [v3 rotation];
  double v5 = v4;

  memset(&v9, 0, sizeof(v9));
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v8.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v8.c = v6;
  *(_OWORD *)&v8.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CGAffineTransformRotate(&v9, &v8, v5 * 3.14159265 / 180.0);
  CGAffineTransform v7 = v9;
  [(CKOrganicPendingMomentShareBalloonView *)self setTransform:&v7];
}

- (CKOrganicImageLayoutRecipe)layoutRecipe
{
  return self->_layoutRecipe;
}

- (void)setLayoutRecipe:(id)a3
{
}

- (void).cxx_destruct
{
}

@end