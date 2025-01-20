@interface PKStrokePreviewView
- (PKStrokePreviewView)initWithFrame:(CGRect)a3;
- (void)prepareWithFrame:(double)a3 strokeBounds:(double)a4 strokes:(double)a5;
@end

@implementation PKStrokePreviewView

- (PKStrokePreviewView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKStrokePreviewView;
  v3 = -[PKStrokePreviewView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(PKStrokePreviewView *)v3 setUserInteractionEnabled:0];
  }
  return v4;
}

- (void)prepareWithFrame:(double)a3 strokeBounds:(double)a4 strokes:(double)a5
{
  id v19 = a2;
  v20 = v19;
  if (a1)
  {
    if ([v19 count])
    {
      if (!a1[53])
      {
        id v21 = objc_alloc_init(MEMORY[0x1E4F1E018]);
        id v22 = a1[53];
        a1[53] = v21;
      }
      v23 = objc_msgSend(a1, "window", *(void *)&a4);
      v24 = [v23 screen];
      [v24 nativeScale];
      double v26 = v25;

      double v27 = fmax(v26, 1.0);
      dispatch_semaphore_t v28 = dispatch_semaphore_create(0);
      v29 = -[PKImageRenderer initWithSize:scale:renderQueue:sixChannelBlending:]([PKImageRenderer alloc], "initWithSize:scale:renderQueue:sixChannelBlending:", 0, 0, a5, a6, v27);
      v30 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
      -[PKImageRenderer setInvertColors:](v29, "setInvertColors:", [v30 userInterfaceStyle] == 2);

      uint64_t v63 = 0;
      v64 = &v63;
      uint64_t v65 = 0x3032000000;
      v66 = __Block_byref_object_copy__27;
      v67 = __Block_byref_object_dispose__27;
      id v68 = 0;
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __61__PKStrokePreviewView_prepareWithFrame_strokeBounds_strokes___block_invoke;
      v60[3] = &unk_1E64C72E0;
      v62 = &v63;
      v31 = v28;
      v61 = v31;
      -[PKImageRenderer renderStrokes:clippedToStrokeSpaceRect:scale:completion:](v29, "renderStrokes:clippedToStrokeSpaceRect:scale:completion:", v20, v60, a7, a8, a9, a10, v27);
      dispatch_semaphore_wait(v31, 0xFFFFFFFFFFFFFFFFLL);
      v32 = [a1 traitCollection];
      uint64_t v33 = [v32 userInterfaceStyle];

      BOOL v34 = v33 == 2;
      if (v33 == 2) {
        double v35 = 0.5;
      }
      else {
        double v35 = 0.0;
      }
      v36 = [MEMORY[0x1E4F1E040] colorMatrixFilter];
      v37 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:0.0 W:v35];
      [v36 setRVector:v37];

      v38 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:0.0 W:v35];
      [v36 setGVector:v38];

      v39 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:0.0 W:v35];
      [v36 setBVector:v39];
      double v40 = dbl_1C482B760[v34];

      v41 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:0.0 W:v40];
      [v36 setAVector:v41];

      v42 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithCGImage:", objc_msgSend( (id) v64[5], "CGImage"));
      [v36 setInputImage:v42];

      v43 = [v36 outputImage];
      v44 = [v43 imageByApplyingGaussianBlurWithSigma:2.0];

      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      objc_msgSend(a1, "setFrame:", a3, v59, a5, a6);
      if (!a1[52])
      {
        id v45 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
        id v46 = a1[52];
        a1[52] = v45;

        v47 = [a1 layer];
        [v47 addSublayer:a1[52]];
      }
      [a1 bounds];
      CGRect v70 = CGRectInset(v69, -2.0, -2.0);
      double x = v70.origin.x;
      double y = v70.origin.y;
      double width = v70.size.width;
      double height = v70.size.height;
      v52 = (CGImage *)objc_msgSend(a1[53], "createCGImage:fromRect:", v44, v27 * v70.origin.x, v27 * v70.origin.y, v27 * v70.size.width, v27 * v70.size.height);
      [a1[52] setContents:v52];
      CGImageRelease(v52);
      objc_msgSend(a1[52], "setFrame:", x + 2.0, y + 2.0, width, height);
      if (!a1[51])
      {
        id v53 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
        id v54 = a1[51];
        a1[51] = v53;

        v55 = [a1 layer];
        [v55 addSublayer:a1[51]];
      }
      [a1 bounds];
      objc_msgSend(a1[51], "setFrame:");
      objc_msgSend(a1[51], "setContents:", objc_msgSend( (id) v64[5], "CGImage"));
      [MEMORY[0x1E4F39CF8] commit];

      _Block_object_dispose(&v63, 8);
    }
    else
    {
      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      [a1[51] removeFromSuperlayer];
      id v56 = a1[51];
      a1[51] = 0;

      [a1[52] removeFromSuperlayer];
      id v57 = a1[52];
      a1[52] = 0;

      [MEMORY[0x1E4F39CF8] commit];
      id v58 = a1[53];
      a1[53] = 0;
    }
  }
}

void __61__PKStrokePreviewView_prepareWithFrame_strokeBounds_strokes___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_shadowLayer, 0);

  objc_storeStrong((id *)&self->_drawingLayer, 0);
}

@end