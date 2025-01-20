@interface CEKLightingCubeRenderer
- (CEKLightingCubeRenderer)initWithCube:(id)a3 appearance:(id)a4 components:(int64_t)a5;
- (void)renderInContext:(CGContext *)a3 size:(CGSize)a4 scale:(double)a5 cornerRadius:(double)a6 stroke:(double)a7;
@end

@implementation CEKLightingCubeRenderer

- (CEKLightingCubeRenderer)initWithCube:(id)a3 appearance:(id)a4 components:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CEKLightingCubeRenderer;
  v11 = [(CEKLightingCubeRenderer *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_cube, a3);
    objc_storeStrong((id *)&v12->_appearance, a4);
    v12->_components = a5;
  }

  return v12;
}

- (void)renderInContext:(CGContext *)a3 size:(CGSize)a4 scale:(double)a5 cornerRadius:(double)a6 stroke:(double)a7
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  double v10 = a4.width - a7 * 0.5;
  double v11 = a4.height - a7 * 0.5;
  v12 = -[CEKLightingCube pathForOutlineWithSize:cornerRadius:](self->_cube, "pathForOutlineWithSize:cornerRadius:", v10, v11, a6);
  v13 = (CGFloat *)MEMORY[0x1E4F1DAD8];
  int64_t v14 = self->_components;
  if (v14)
  {
    DeviceGray = CGColorSpaceCreateDeviceGray();
    *(_OWORD *)components = xmmword_1BEE74A80;
    v16 = CGColorCreate(DeviceGray, components);
    CGColorSpaceRelease(DeviceGray);
    CGContextSetFillColorWithColor(a3, v16);
    CGContextAddPath(a3, v12);
    CGContextFillPath(a3);
    CGContextBeginPath(a3);
    CGColorRelease(v16);
    int64_t v14 = self->_components;
  }
  CGFloat v41 = v13[1];
  CGFloat v42 = *v13;
  if ((v14 & 2) != 0)
  {
    CGContextAddPath(a3, v12);
    CGContextClip(a3);
    CGContextBeginPath(a3);
    v17 = [(CEKLightingCubeAppearance *)self->_appearance background];
    v51.y = v41;
    v51.x = v42;
    v53.x = v42;
    v53.y = v41;
    CGContextDrawRadialGradient(a3, v17, v51, 0.0, v53, v10 * 0.5, 3u);
    CGContextResetClip(a3);
    int64_t v14 = self->_components;
  }
  double v18 = v11 / 6.0;
  if ((v14 & 4) != 0 && [(CEKLightingCubeAppearance *)self->_appearance verticalFillColor])
  {
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __74__CEKLightingCubeRenderer_renderInContext_size_scale_cornerRadius_stroke___block_invoke;
    v46[3] = &unk_1E63CD880;
    v46[4] = self;
    *(double *)&v46[5] = v10;
    *(double *)&v46[6] = v11;
    *(double *)&v46[7] = v11 / 6.0;
    unint64_t v19 = 1;
    Mask = CreateMask(1, v46, v10, v11, a5);
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __74__CEKLightingCubeRenderer_renderInContext_size_scale_cornerRadius_stroke___block_invoke_2;
    v45[3] = &unk_1E63CD880;
    v45[4] = self;
    *(double *)&v45[5] = v10;
    *(double *)&v45[6] = v11;
    *(double *)&v45[7] = v11 / 6.0;
    v21 = CreateMask(1, v45, v10, v11, a5);
    do
    {
      v22 = -[CEKLightingCube pathForPlane:size:](self->_cube, "pathForPlane:size:", v19, v10, v11);
      [(CEKLightingCube *)self->_cube intensityForPlane:v19];
      double v24 = v23;
      if (v19 <= 2)
      {
        [(CEKLightingCubeAppearance *)self->_appearance verticalFillFrontIntensity];
        double v24 = v24 * v25;
      }
      [(CEKLightingCubeAppearance *)self->_appearance verticalFillBackIntensity];
      if (v19 >= 3 && v26 != 0.0)
      {
        [(CEKLightingCubeAppearance *)self->_appearance verticalFillBackIntensity];
        double v28 = v27;
        [(CEKLightingCubeAppearance *)self->_appearance verticalFillBackIntensity];
        double v24 = 1.0 - v29 + v24 * v28;
      }
      v30 = [(CEKLightingCubeAppearance *)self->_appearance verticalFillColor];
      CGFloat Alpha = CGColorGetAlpha([(CEKLightingCubeAppearance *)self->_appearance verticalFillColor]);
      CopyWithCGFloat Alpha = CGColorCreateCopyWithAlpha(v30, v24 * Alpha);
      CGContextSetFillColorWithColor(a3, CopyWithAlpha);
      v55.origin.x = v10 * -0.5;
      v55.origin.y = v11 * -0.5;
      v55.size.width = v10;
      v55.size.height = v11;
      CGContextClipToMask(a3, v55, Mask);
      v56.origin.x = v10 * -0.5;
      v56.origin.y = v11 * -0.5;
      v56.size.width = v10;
      v56.size.height = v11;
      CGContextClipToMask(a3, v56, v21);
      CGContextAddPath(a3, v22);
      CGContextFillPath(a3);
      CGContextBeginPath(a3);
      CGContextResetClip(a3);
      CGColorRelease(CopyWithAlpha);
      ++v19;
    }
    while (v19 != 5);
    CGImageRelease(Mask);
    CGImageRelease(v21);
  }
  if ((self->_components & 8) != 0)
  {
    if ([(CEKLightingCubeAppearance *)self->_appearance topMask]
      || [(CEKLightingCubeAppearance *)self->_appearance topFill]
      || [(CEKLightingCubeAppearance *)self->_appearance topGlow])
    {
      if ([(CEKLightingCubeAppearance *)self->_appearance topMask])
      {
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __74__CEKLightingCubeRenderer_renderInContext_size_scale_cornerRadius_stroke___block_invoke_3;
        v44[3] = &unk_1E63CD8A8;
        *(double *)&v44[5] = v10;
        *(double *)&v44[6] = v11;
        v44[4] = self;
        *(CGFloat *)&v44[7] = v42;
        *(CGFloat *)&v44[8] = v41;
        v33 = CreateMask(0, v44, v10, v11, a5);
      }
      else
      {
        v33 = 0;
      }
      -[CEKLightingCube points:forPlane:size:](self->_cube, "points:forPlane:size:", v48, 0, v10, v11);
      if ([(CEKLightingCubeAppearance *)self->_appearance topFill]) {
        DrawPlaneFill(a3, v48, [(CEKLightingCubeAppearance *)self->_appearance topFill], v33, v12, v10 * -0.5, v11 * -0.5, v10, v11);
      }
      DrawPlaneGlow((uint64_t)a3, (uint64_t)v48, (uint64_t)[(CEKLightingCubeAppearance *)self->_appearance topGlow], (uint64_t)v33, (uint64_t)v12, 0, v18, v10 * -0.5, v11 * -0.5, v10, v11);
      CGImageRelease(v33);
    }
    if ([(CEKLightingCubeAppearance *)self->_appearance bottomMask]
      || [(CEKLightingCubeAppearance *)self->_appearance bottomFill]
      || [(CEKLightingCubeAppearance *)self->_appearance bottomOuterGlow]
      || [(CEKLightingCubeAppearance *)self->_appearance bottomInnerGlow])
    {
      if ([(CEKLightingCubeAppearance *)self->_appearance bottomMask])
      {
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __74__CEKLightingCubeRenderer_renderInContext_size_scale_cornerRadius_stroke___block_invoke_4;
        v43[3] = &unk_1E63CD8A8;
        *(double *)&v43[5] = v10;
        *(double *)&v43[6] = v11;
        v43[4] = self;
        *(CGFloat *)&v43[7] = v42;
        *(CGFloat *)&v43[8] = v41;
        v34 = CreateMask(0, v43, v10, v11, a5);
      }
      else
      {
        v34 = 0;
      }
      -[CEKLightingCube points:forPlane:size:](self->_cube, "points:forPlane:size:", v48, 5, v10, v11);
      if ([(CEKLightingCubeAppearance *)self->_appearance bottomFill]) {
        DrawPlaneFill(a3, v48, [(CEKLightingCubeAppearance *)self->_appearance bottomFill], v34, v12, v10 * -0.5, v11 * -0.5, v10, v11);
      }
      DrawPlaneGlow((uint64_t)a3, (uint64_t)v48, (uint64_t)[(CEKLightingCubeAppearance *)self->_appearance bottomOuterGlow], (uint64_t)v34, (uint64_t)v12, 0, v18, v10 * -0.5, v11 * -0.5, v10, v11);
      DrawPlaneGlow((uint64_t)a3, (uint64_t)v48, (uint64_t)[(CEKLightingCubeAppearance *)self->_appearance bottomInnerGlow], (uint64_t)v34, (uint64_t)v12, 6, -v18, v10 * -0.5, v11 * -0.5, v10, v11);
      CGImageRelease(v34);
    }
  }
  if ((self->_components & 0x10) != 0 && [(CEKLightingCubeAppearance *)self->_appearance topOver])
  {
    CGContextAddPath(a3, -[CEKLightingCube pathForPlane:size:](self->_cube, "pathForPlane:size:", 0, v10, v11));
    CGContextClip(a3);
    CGContextBeginPath(a3);
    v35 = [(CEKLightingCubeAppearance *)self->_appearance topOver];
    v52.y = v41;
    v52.x = v42;
    v54.x = v42;
    v54.y = v41;
    CGContextDrawRadialGradient(a3, v35, v52, 0.0, v54, v10 * 0.5, 3u);
    CGContextResetClip(a3);
  }
  if ((self->_components & 0x20) != 0)
  {
    v36 = CGColorSpaceCreateDeviceGray();
    *(_OWORD *)v47 = xmmword_1BEE74A90;
    v37 = CGColorCreate(v36, v47);
    v38 = -[CEKLightingCube centerShadowPathWithSize:width:](self->_cube, "centerShadowPathWithSize:width:", v10, v11, a7);
    CGContextAddPath(a3, v12);
    CGContextClip(a3);
    CGContextBeginPath(a3);
    CGContextSetFillColorWithColor(a3, v37);
    CGContextAddPath(a3, v38);
    CGContextFillPath(a3);
    CGContextBeginPath(a3);
    CGContextResetClip(a3);
    CGColorRelease(v37);
    CGColorSpaceRelease(v36);
    v39 = -[CEKLightingCube centerPathWithSize:](self->_cube, "centerPathWithSize:", v10, v11);
    CGContextAddPath(a3, v12);
    CGContextClip(a3);
    CGContextBeginPath(a3);
    CGContextSetLineWidth(a3, a7);
    CGContextSetStrokeColorWithColor(a3, [(CEKLightingCubeAppearance *)self->_appearance stroke]);
    CGContextAddPath(a3, v39);
    CGContextStrokePath(a3);
    CGContextBeginPath(a3);
    CGContextResetClip(a3);
    CGContextSetLineWidth(a3, a7);
    CGContextSetStrokeColorWithColor(a3, [(CEKLightingCubeAppearance *)self->_appearance stroke]);
    CGContextAddPath(a3, v12);
    CGContextStrokePath(a3);
    CGContextBeginPath(a3);
  }
}

void __74__CEKLightingCubeRenderer_renderInContext_size_scale_cornerRadius_stroke___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "points:forPlane:size:", v6, 0, *(double *)(a1 + 40), *(double *)(a1 + 48));
  double v4 = *(double *)(a1 + 56);
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 16) topGlow];
  DrawPlaneGlow(a2, (uint64_t)v6, v5, 0, 0, 0, v4, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
}

void __74__CEKLightingCubeRenderer_renderInContext_size_scale_cornerRadius_stroke___block_invoke_2(uint64_t a1, CGContext *a2)
{
  v9[8] = *(CGFloat *)MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "points:forPlane:size:", v9, 5, *(double *)(a1 + 40), *(double *)(a1 + 48));
  double v4 = (CGColor *)[*(id *)(*(void *)(a1 + 32) + 16) bottomFill];
  double v5 = *MEMORY[0x1E4F1DB20];
  CGFloat v6 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat v7 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat v8 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  DrawPlaneFill(a2, v9, v4, 0, 0, *MEMORY[0x1E4F1DB20], v6, v7, v8);
  DrawPlaneGlow((uint64_t)a2, (uint64_t)v9, [*(id *)(*(void *)(a1 + 32) + 16) bottomOuterGlow], 0, 0, 0, *(double *)(a1 + 56), v5, v6, v7, v8);
}

void __74__CEKLightingCubeRenderer_renderInContext_size_scale_cornerRadius_stroke___block_invoke_3(uint64_t a1, CGContext *a2)
{
  double v4 = *(double *)(a1 + 40) * 0.5;
  double v5 = (CGGradient *)[*(id *)(*(void *)(a1 + 32) + 16) topMask];
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v8 = v6;
  uint64_t v9 = v7;
  CGContextDrawRadialGradient(a2, v5, *(CGPoint *)&v6, 0.0, *(CGPoint *)&v8, v4, 3u);
}

void __74__CEKLightingCubeRenderer_renderInContext_size_scale_cornerRadius_stroke___block_invoke_4(uint64_t a1, CGContext *a2)
{
  double v4 = *(double *)(a1 + 40) * 0.5;
  double v5 = (CGGradient *)[*(id *)(*(void *)(a1 + 32) + 16) bottomMask];
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v8 = v6;
  uint64_t v9 = v7;
  CGContextDrawRadialGradient(a2, v5, *(CGPoint *)&v6, 0.0, *(CGPoint *)&v8, v4, 3u);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appearance, 0);
  objc_storeStrong((id *)&self->_cube, 0);
}

@end