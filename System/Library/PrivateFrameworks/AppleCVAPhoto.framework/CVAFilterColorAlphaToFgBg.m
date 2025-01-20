@interface CVAFilterColorAlphaToFgBg
- (CVAFilterColorAlphaToFgBg)initWithDevice:(id)a3 library:(id)a4 pipelineLibrary:(id)a5 error:(id *)a6;
- (NSString)label;
- (void)encodeToCommandBuffer:(id)a3 srcColorTex:(id)a4 srcAlphaTex:(id)a5 dstForegroundTex:(id)a6 dstBackgroundTex:(id)a7;
- (void)encodeToCommandBuffer:(id)a3 srcColorTex:(id)a4 srcAlphaTex:(id)a5 dstForegroundTex:(id)a6 normalizedPrimaryCaptureRect:(CGRect)a7 isAfterPreviewStitcher:(BOOL)a8;
@end

@implementation CVAFilterColorAlphaToFgBg

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_splitFgKernel_rgba, 0);
  objc_storeStrong((id *)&self->_splitBgKernel_rgba, 0);

  objc_storeStrong((id *)&self->_splitFgBgKernel_rgba, 0);
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)encodeToCommandBuffer:(id)a3 srcColorTex:(id)a4 srcAlphaTex:(id)a5 dstForegroundTex:(id)a6 normalizedPrimaryCaptureRect:(CGRect)a7 isAfterPreviewStitcher:(BOOL)a8
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  BOOL v32 = a8;
  float v21 = x;
  float v22 = y;
  *(float *)v31 = v21;
  *(float *)&v31[1] = v22;
  float v23 = width;
  float v24 = height;
  *(float *)&v31[2] = v23;
  *(float *)&v31[3] = v24;
  uint64_t v25 = [v18 width];
  uint64_t v26 = [v18 height];
  v27 = [v17 computeCommandEncoder];
  [v27 setLabel:@"_splitFgKernel_rgba"];
  [v27 setComputePipelineState:self->_splitFgKernel_rgba];
  [v27 setTexture:v19 atIndex:0];
  [v27 setTexture:v18 atIndex:1];
  [v27 setTexture:v20 atIndex:2];
  [v27 setBytes:v31 length:16 atIndex:0];
  [v27 setBytes:&v32 length:1 atIndex:1];
  v30[0] = (unint64_t)(v25 + 15) >> 4;
  v30[1] = (unint64_t)(v26 + 15) >> 4;
  v30[2] = 1;
  uint64_t v29 = 1;
  long long v28 = xmmword_1BA86C930;
  [v27 dispatchThreadgroups:v30 threadsPerThreadgroup:&v28];
  [v27 endEncoding];
}

- (void)encodeToCommandBuffer:(id)a3 srcColorTex:(id)a4 srcAlphaTex:(id)a5 dstForegroundTex:(id)a6 dstBackgroundTex:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [v13 width];
  uint64_t v18 = [v13 height];
  id v19 = [v12 computeCommandEncoder];
  [v19 setLabel:@"dstForegroundTex ? _splitFgBgKernel_rgba : _splitBgKernel_rgba"];
  uint64_t v20 = 8;
  if (!v15) {
    uint64_t v20 = 16;
  }
  [v19 setComputePipelineState:*(Class *)((char *)&self->super.isa + v20)];
  [v19 setTexture:v14 atIndex:0];
  [v19 setTexture:v13 atIndex:1];
  [v19 setTexture:v15 atIndex:2];
  [v19 setTexture:v16 atIndex:3];
  v23[0] = (unint64_t)(v17 + 15) >> 4;
  v23[1] = (unint64_t)(v18 + 15) >> 4;
  v23[2] = 1;
  uint64_t v22 = 1;
  long long v21 = xmmword_1BA86C930;
  [v19 dispatchThreadgroups:v23 threadsPerThreadgroup:&v21];
  [v19 endEncoding];
}

- (CVAFilterColorAlphaToFgBg)initWithDevice:(id)a3 library:(id)a4 pipelineLibrary:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v24.receiver = self;
  v24.super_class = (Class)CVAFilterColorAlphaToFgBg;
  id v13 = [(CVAFilterColorAlphaToFgBg *)&v24 init];
  if (!v13) {
    goto LABEL_6;
  }
  id v14 = (objc_class *)objc_opt_class();
  uint64_t v15 = NSStringFromClass(v14);
  label = v13->_label;
  v13->_label = (NSString *)v15;

  uint64_t v17 = objc_opt_new();
  char v23 = 1;
  [v17 setConstantValue:&v23 type:53 withName:@"kWriteForeground"];
  sub_1BA8328CC((void **)&v13->_splitFgBgKernel_rgba, v11, v12, v10, @"splitFgBg_rgba", a6, v17);
  splitFgBgKernel_rgba = v13->_splitFgBgKernel_rgba;

  if (!splitFgBgKernel_rgba) {
    goto LABEL_6;
  }
  id v19 = objc_opt_new();
  char v23 = 0;
  [v19 setConstantValue:&v23 type:53 withName:@"kWriteForeground"];
  sub_1BA8328CC((void **)&v13->_splitBgKernel_rgba, v11, v12, v10, @"splitFgBg_rgba", a6, v19);
  splitBgKernel_rgba = v13->_splitBgKernel_rgba;

  if (splitBgKernel_rgba
    && (sub_1BA8328CC((void **)&v13->_splitFgKernel_rgba, v11, v12, v10, @"splitFg_rgba", a6, 0),
        v13->_splitFgKernel_rgba))
  {
    long long v21 = v13;
  }
  else
  {
LABEL_6:
    long long v21 = 0;
  }

  return v21;
}

@end