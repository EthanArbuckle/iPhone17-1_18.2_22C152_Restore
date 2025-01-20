@interface CVAFilterBox
- (CVAFilterBox)initWithDevice:(id)a3 library:(id)a4 pipelineLibrary:(id)a5 textureSize:(id *)a6 error:(id *)a7;
- (NSString)label;
- (void)encodeBoxHorizontalToCommandBuffer:(id)a3 configBuffer:(const BoxFilterConfig *)a4 source:(id)a5 destination:(id)a6;
- (void)encodeBoxVerticalToCommandBuffer:(id)a3 configBuffer:(const BoxFilterConfig *)a4 source:(id)a5 destination:(id)a6 normalize:(int64_t)a7;
- (void)encodeToCommandBuffer:(id)a3 inTexture:(id)a4 outTexture:(id)a5 radius:(unint64_t)a6 normalize:(int64_t)a7;
@end

@implementation CVAFilterBox

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_box_float4_pass_vert_kernel, 0);
  objc_storeStrong((id *)&self->_box_norm_float4_pass_vert_kernel, 0);
  objc_storeStrong((id *)&self->_box_normValid_float4_pass_vert_kernel, 0);
  objc_storeStrong((id *)&self->_box_float_pass_vert_kernel, 0);
  objc_storeStrong((id *)&self->_box_norm_float_pass_vert_kernel, 0);
  objc_storeStrong((id *)&self->_box_normValid_float_pass_vert_kernel, 0);
  objc_storeStrong((id *)&self->_box_float4_pass_horiz_kernel, 0);
  objc_storeStrong((id *)&self->_box_float_pass_horiz_kernel, 0);
  objc_storeStrong((id *)&self->_boxIntermediateTexture_r, 0);
  objc_storeStrong((id *)&self->_boxIntermediateTexture_rgba, 0);
  objc_storeStrong((id *)&self->_pipelineLibrary, 0);
  objc_storeStrong((id *)&self->_library, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)encodeBoxVerticalToCommandBuffer:(id)a3 configBuffer:(const BoxFilterConfig *)a4 source:(id)a5 destination:(id)a6 normalize:(int64_t)a7
{
  id v12 = a5;
  id v13 = a6;
  v14 = [a3 computeCommandEncoder];
  if ([v12 pixelFormat] == 10
    || [v12 pixelFormat] == 25
    || [v12 pixelFormat] == 55)
  {
    if (a7 == 1)
    {
      [v14 setLabel:@"_box_norm_float_pass_vert_kernel"];
      uint64_t v15 = 96;
    }
    else if (a7 == 2)
    {
      [v14 setLabel:@"_box_normValid_float_pass_vert_kernel"];
      uint64_t v15 = 88;
    }
    else
    {
      [v14 setLabel:@"_box_float_pass_vert_kernel"];
      uint64_t v15 = 104;
    }
  }
  else if (a7 == 1)
  {
    [v14 setLabel:@"_box_norm_float4_pass_vert_kernel"];
    uint64_t v15 = 120;
  }
  else if (a7 == 2)
  {
    [v14 setLabel:@"_box_normValid_float4_pass_vert_kernel"];
    uint64_t v15 = 112;
  }
  else
  {
    [v14 setLabel:@"_box_float4_pass_vert_kernel"];
    uint64_t v15 = 128;
  }
  [v14 setComputePipelineState:*(Class *)((char *)&self->super.isa + v15)];
  [v14 setTexture:v12 atIndex:0];
  [v14 setTexture:v13 atIndex:1];
  [v14 setBytes:a4 length:4 atIndex:0];
  v18[0] = (unint64_t)([v12 width] + 15) >> 4;
  v18[1] = (unint64_t)([v12 height] + 15) >> 4;
  v18[2] = 1;
  uint64_t v17 = 1;
  long long v16 = xmmword_1BA86C930;
  [v14 dispatchThreadgroups:v18 threadsPerThreadgroup:&v16];
  [v14 endEncoding];
}

- (void)encodeBoxHorizontalToCommandBuffer:(id)a3 configBuffer:(const BoxFilterConfig *)a4 source:(id)a5 destination:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  id v13 = [a3 computeCommandEncoder];
  uint64_t v14 = [v11 pixelFormat];
  if (v14 > 69)
  {
    if (v14 == 70 || v14 == 115 || v14 == 125)
    {
      [v13 setLabel:@"_box_float4_pass_horiz_kernel"];
      uint64_t v15 = 80;
      goto LABEL_10;
    }
LABEL_12:
    long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CVAFilterBox.mm", 186, @"Bad output pixel format (%lu) for encodeBoxFilterToBuffer", objc_msgSend(v11, "pixelFormat"));

    goto LABEL_11;
  }
  if (v14 != 10 && v14 != 25 && v14 != 55) {
    goto LABEL_12;
  }
  [v13 setLabel:@"_box_float_pass_horiz_kernel"];
  uint64_t v15 = 72;
LABEL_10:
  [v13 setComputePipelineState:*(Class *)((char *)&self->super.isa + v15)];
LABEL_11:
  [v13 setTexture:v11 atIndex:0];
  [v13 setTexture:v12 atIndex:1];
  [v13 setBytes:a4 length:4 atIndex:0];
  v19[0] = (unint64_t)([v11 width] + 15) >> 4;
  v19[1] = (unint64_t)([v11 height] + 15) >> 4;
  v19[2] = 1;
  uint64_t v18 = 1;
  long long v17 = xmmword_1BA86C930;
  [v13 dispatchThreadgroups:v19 threadsPerThreadgroup:&v17];
  [v13 endEncoding];
}

- (void)encodeToCommandBuffer:(id)a3 inTexture:(id)a4 outTexture:(id)a5 radius:(unint64_t)a6 normalize:(int64_t)a7
{
  int v8 = a6;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (__PAIR128__([v14 height], objc_msgSend(v14, "width")) != *(_OWORD *)&self->_textureSize.width)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CVAFilterBox.mm", 108, @"Texture dimension is not expected (%zux%zu) != (%zux%zu)", objc_msgSend(v14, "width"), objc_msgSend(v14, "height"), self->_textureSize.width, self->_textureSize.height);
  }
  if ([v15 width] != self->_textureSize.width
    || [v15 height] != self->_textureSize.height)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CVAFilterBox.mm", 114, @"Texture dimension is not expected (%zux%zu) != (%zux%zu)", objc_msgSend(v15, "width"), objc_msgSend(v15, "height"), self->_textureSize.width, self->_textureSize.height);
  }
  if ([v14 pixelFormat] != 10
    && [v14 pixelFormat] != 25
    && [v14 pixelFormat] != 55
    && [v14 pixelFormat] != 70
    && [v14 pixelFormat] != 115
    && [v14 pixelFormat] != 125)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CVAFilterBox.mm", 121, @"Bad input pixel format (%lu) for encodeBoxFilterToBuffer", objc_msgSend(v14, "pixelFormat"));
  }
  if ([v15 pixelFormat] != 10
    && [v15 pixelFormat] != 25
    && [v15 pixelFormat] != 55
    && [v15 pixelFormat] != 70
    && [v15 pixelFormat] != 115
    && [v15 pixelFormat] != 125)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CVAFilterBox.mm", 127, @"Bad output pixel format (%lu) for encodeBoxFilterToBuffer", objc_msgSend(v15, "pixelFormat"));
  }
  if ([v14 pixelFormat] == 55)
  {
    if (a7)
    {
LABEL_31:
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CVAFilterBox.mm", 135, @"Unsupported input pixel format (%lu) and normalization type (%ld) for encodeBoxFilterToBuffer", objc_msgSend(v14, "pixelFormat"), a7);
    }
  }
  else
  {
    uint64_t v16 = [v14 pixelFormat];
    if (a7 && v16 == 125) {
      goto LABEL_31;
    }
  }
  int v25 = v8;
  if ([v14 pixelFormat] == 70 || objc_msgSend(v14, "pixelFormat") == 115)
  {
    uint64_t v17 = 56;
  }
  else
  {
    uint64_t v18 = [v14 pixelFormat];
    uint64_t v17 = 64;
    if (v18 == 125) {
      uint64_t v17 = 56;
    }
  }
  id v19 = *(id *)((char *)&self->super.isa + v17);
  [(CVAFilterBox *)self encodeBoxHorizontalToCommandBuffer:v13 configBuffer:&v25 source:v14 destination:v19];
  [(CVAFilterBox *)self encodeBoxVerticalToCommandBuffer:v13 configBuffer:&v25 source:v19 destination:v15 normalize:a7];
}

- (CVAFilterBox)initWithDevice:(id)a3 library:(id)a4 pipelineLibrary:(id)a5 textureSize:(id *)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v55.receiver = self;
  v55.super_class = (Class)CVAFilterBox;
  uint64_t v16 = [(CVAFilterBox *)&v55 init];
  uint64_t v17 = v16;
  if (v16)
  {
    p_box_float_pass_horiz_kernel = (void **)&v16->_box_float_pass_horiz_kernel;
    v32 = @"box_float_pass_horiz";
    v33 = 0;
    p_box_float4_pass_horiz_kernel = (void **)&v16->_box_float4_pass_horiz_kernel;
    v35 = @"box_float4_pass_horiz";
    v36 = 0;
    p_box_normValid_float_pass_vert_kernel = (void **)&v16->_box_normValid_float_pass_vert_kernel;
    v38 = @"box_normValid_float_pass_vert";
    v39 = 0;
    p_box_norm_float_pass_vert_kernel = (void **)&v16->_box_norm_float_pass_vert_kernel;
    v41 = @"box_norm_float_pass_vert";
    v42 = 0;
    p_box_float_pass_vert_kernel = (void **)&v16->_box_float_pass_vert_kernel;
    v44 = @"box_float_pass_vert";
    v45 = 0;
    p_box_normValid_float4_pass_vert_kernel = (void **)&v16->_box_normValid_float4_pass_vert_kernel;
    v47 = @"box_normValid_float4_pass_vert";
    v48 = 0;
    p_box_norm_float4_pass_vert_kernel = (void **)&v16->_box_norm_float4_pass_vert_kernel;
    v50 = @"box_norm_float4_pass_vert";
    v51 = 0;
    p_box_float4_pass_vert_kernel = (void **)&v16->_box_float4_pass_vert_kernel;
    v53 = @"box_float4_pass_vert";
    v54 = 0;
    uint64_t v18 = (objc_class *)objc_opt_class();
    uint64_t v19 = NSStringFromClass(v18);
    label = v17->_label;
    v17->_label = (NSString *)v19;

    p_device = (void **)&v17->_device;
    objc_storeStrong((id *)&v17->_device, a3);
    p_library = (void **)&v17->_library;
    objc_storeStrong((id *)&v17->_library, a4);
    long long v23 = *(_OWORD *)&a6->var0;
    v17->_textureSize.depth = a6->var2;
    *(_OWORD *)&v17->_textureSize.width = v23;
    p_pipelineLibrary = (void **)&v17->_pipelineLibrary;
    objc_storeStrong((id *)&v17->_pipelineLibrary, a5);
    uint64_t v25 = sub_1BA862650(v17->_device, 115, a6->var0, a6->var1, 0, a7);
    boxIntermediateTexture_rgba = v17->_boxIntermediateTexture_rgba;
    v17->_boxIntermediateTexture_rgba = (MTLTexture *)v25;

    uint64_t v27 = sub_1BA862650(v17->_device, 25, a6->var0, a6->var1, 0, a7);
    boxIntermediateTexture_r = v17->_boxIntermediateTexture_r;
    v17->_boxIntermediateTexture_r = (MTLTexture *)v27;

    if (!v17->_boxIntermediateTexture_rgba) {
      goto LABEL_13;
    }
    if (!v17->_boxIntermediateTexture_r) {
      goto LABEL_13;
    }
    sub_1BA8328CC(p_box_float_pass_horiz_kernel, *p_library, *p_pipelineLibrary, *p_device, v32, a7, v33);
    if (!p_box_float_pass_horiz_kernel) {
      goto LABEL_13;
    }
    sub_1BA8328CC(p_box_float4_pass_horiz_kernel, *p_library, *p_pipelineLibrary, *p_device, v35, a7, v36);
    if (p_box_float4_pass_horiz_kernel
      && (sub_1BA8328CC(p_box_normValid_float_pass_vert_kernel, *p_library, *p_pipelineLibrary, *p_device, v38, a7, v39),
          p_box_normValid_float_pass_vert_kernel)
      && (sub_1BA8328CC(p_box_norm_float_pass_vert_kernel, *p_library, *p_pipelineLibrary, *p_device, v41, a7, v42),
          p_box_norm_float_pass_vert_kernel)
      && (sub_1BA8328CC(p_box_float_pass_vert_kernel, *p_library, *p_pipelineLibrary, *p_device, v44, a7, v45),
          p_box_float_pass_vert_kernel)
      && (sub_1BA8328CC(p_box_normValid_float4_pass_vert_kernel, *p_library, *p_pipelineLibrary, *p_device, v47, a7, v48), p_box_normValid_float4_pass_vert_kernel)&& (sub_1BA8328CC(p_box_norm_float4_pass_vert_kernel, *p_library, *p_pipelineLibrary, *p_device, v50, a7, v51), p_box_norm_float4_pass_vert_kernel)&& (sub_1BA8328CC(p_box_float4_pass_vert_kernel, *p_library, *p_pipelineLibrary, *p_device, v53, a7, v54), p_box_float4_pass_vert_kernel))
    {
      v29 = v17;
    }
    else
    {
LABEL_13:
      v29 = 0;
    }
    sub_1BA832B78((id *)&p_box_float_pass_horiz_kernel);
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

@end