@interface DYRendererInfo
+ (BOOL)_dimensionsAreSupported:(id)a3 supportedDimensions:(id)a4;
+ (BOOL)_rangeIsSupported:(id)a3 supportedRange:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (id)rendererInfoWithGLIContext:(__GLIContextRec *)a3 dispatch:(__GLIFunctionDispatchRec *)a4 api:(int)a5;
- (BOOL)_supportsGLSLVersion:(id)a3;
- (BOOL)_supportsGLVersion:(id)a3;
- (BOOL)_supportsLimits:(id)a3;
- (BOOL)supportsCapabilitiesOfRenderer:(id)a3;
- (DYRendererInfo)initWithCoder:(id)a3;
- (NSDictionary)bitCounts;
- (NSDictionary)limits;
- (NSDictionary)shaderPrecisionsFormats;
- (NSSet)extensions;
- (NSString)glslVersion;
- (NSString)renderer;
- (NSString)vendor;
- (NSString)version;
- (id)description;
- (id)descriptionForBugReport;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setBitCounts:(id)a3;
- (void)setExtensions:(id)a3;
- (void)setGlslVersion:(id)a3;
- (void)setLimits:(id)a3;
- (void)setRenderer:(id)a3;
- (void)setShaderPrecisionsFormats:(id)a3;
- (void)setVendor:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation DYRendererInfo

+ (id)rendererInfoWithGLIContext:(__GLIContextRec *)a3 dispatch:(__GLIFunctionDispatchRec *)a4 api:(int)a5
{
  id result = (id)objc_opt_new();
  if (!result) {
    return result;
  }
  id v9 = result;
  v56[0] = MEMORY[0x263EF8330];
  v56[1] = 3221225472;
  v57 = __58__DYRendererInfo_rendererInfoWithGLIContext_dispatch_api___block_invoke;
  v58 = &__block_descriptor_48_e18___NSString_12__0I8l;
  v59 = a4;
  v60 = a3;
  [result setVersion:__58__DYRendererInfo_rendererInfoWithGLIContext_dispatch_api___block_invoke((uint64_t)v56)];
  objc_msgSend(v9, "setGlslVersion:", ((uint64_t (*)(void *, uint64_t))v57)(v56, 35724));
  objc_msgSend(v9, "setVendor:", ((uint64_t (*)(void *, uint64_t))v57)(v56, 7936));
  objc_msgSend(v9, "setRenderer:", ((uint64_t (*)(void *, uint64_t))v57)(v56, 7937));
  if (a5 >= 3)
  {
    if ((a5 - 3) < 2)
    {
      unsigned int v55 = 0;
      ((void (*)(__GLIContextRec *, uint64_t, unsigned int *))a4->get_integerv)(a3, 33309, &v55);
      v15 = (void *)[MEMORY[0x263EFF9C0] setWithCapacity:v55];
      if (v55)
      {
        uint64_t v16 = 0;
        do
        {
          uint64_t v17 = ((uint64_t (*)(__GLIContextRec *, uint64_t, uint64_t))a4->get_stringi)(a3, 7939, v16);
          if (v17)
          {
            v18 = (void *)[[NSString alloc] initWithCString:v17 encoding:1];
            [v15 addObject:v18];
          }
          uint64_t v16 = (v16 + 1);
        }
        while (v16 < v55);
      }
      v14 = v9;
      uint64_t v13 = (uint64_t)v15;
      goto LABEL_12;
    }
  }
  else
  {
    id v10 = (id)((uint64_t (*)(void *, uint64_t))v57)(v56, 7939);
    if (v10)
    {
      v11 = (__CFString *)[v10 mutableCopy];
      CFStringTrimWhitespace(v11);
      id v12 = (id)[(__CFString *)v11 componentsSeparatedByString:@" "];

      uint64_t v13 = [MEMORY[0x263EFFA08] setWithArray:v12];
      v14 = v9;
LABEL_12:
      [v14 setExtensions:v13];
    }
  }
  v19 = objc_opt_new();
  v20 = objc_opt_new();
  uint64_t v21 = objc_opt_new();
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v51 = __58__DYRendererInfo_rendererInfoWithGLIContext_dispatch_api___block_invoke_2;
  v52 = &__block_descriptor_48_e45_v28__0I8__NSMutableDictionary_12__NSString_20l;
  v53 = a4;
  v54 = a3;
  v44 = a3;
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v46 = __58__DYRendererInfo_rendererInfoWithGLIContext_dispatch_api___block_invoke_3;
  v47 = &__block_descriptor_48_e45_v28__0I8__NSMutableDictionary_12__NSString_20l;
  v48 = a4;
  v49 = a3;
  v39 = a3;
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v41 = __58__DYRendererInfo_rendererInfoWithGLIContext_dispatch_api___block_invoke_4;
  v42 = &__block_descriptor_48_e45_v28__0I8__NSMutableDictionary_12__NSString_20l;
  v43 = a4;
  v34 = a3;
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v36 = __58__DYRendererInfo_rendererInfoWithGLIContext_dispatch_api___block_invoke_5;
  v37 = &__block_descriptor_48_e48_v36__0I8__NSMutableDictionary_12__NSString_20Q28l;
  v38 = a4;
  v29 = a3;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v31 = __58__DYRendererInfo_rendererInfoWithGLIContext_dispatch_api___block_invoke_6;
  v32 = &__block_descriptor_48_e48_v36__0I8__NSMutableDictionary_12__NSString_20Q28l;
  v33 = a4;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v25 = __58__DYRendererInfo_rendererInfoWithGLIContext_dispatch_api___block_invoke_7;
  v26 = &unk_26532CD38;
  uint64_t v27 = v21;
  v28 = a4;
  v23 = (void *)v21;
  switch(a5)
  {
    case 1:
      v51((uint64_t)v50, 3377, v19, @"GL_MAX_LIGHTS");
      v51((uint64_t)v50, 3378, v19, @"GL_MAX_CLIP_PLANES");
      v51((uint64_t)v50, 3382, v19, @"GL_MAX_MODELVIEW_STACK_DEPTH");
      v51((uint64_t)v50, 3384, v19, @"GL_MAX_PROJECTION_STACK_DEPTH");
      v51((uint64_t)v50, 3385, v19, @"GL_MAX_TEXTURE_STACK_DEPTH");
      v51((uint64_t)v50, 34018, v19, @"GL_MAX_TEXTURE_UNITS");
      v51((uint64_t)v50, 34468, v19, @"GL_MAX_VERTEX_UNITS_OES");
      v51((uint64_t)v50, 34882, v19, @"GL_MAX_PALETTE_MATRICES_OES");
      v31((uint64_t)v30, 2834, v19, @"GL_SMOOTH_POINT_SIZE_RANGE", 2);
      v31((uint64_t)v30, 2850, v19, @"GL_SMOOTH_LINE_WIDTH_RANGE", 2);
      break;
    case 2:
      goto LABEL_17;
    case 3:
      v51((uint64_t)v50, 34921, v19, @"GL_MAX_VERTEX_ATTRIBS");
      v51((uint64_t)v50, 35658, v19, @"GL_MAX_VERTEX_UNIFORM_COMPONENTS");
      v51((uint64_t)v50, 35371, v19, @"GL_MAX_VERTEX_UNIFORM_BLOCKS");
      v51((uint64_t)v50, 37154, v19, @"GL_MAX_VERTEX_OUTPUT_COMPONENTS");
      v51((uint64_t)v50, 35660, v19, @"GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS");
      v51((uint64_t)v50, 35377, v19, @"GL_MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS");
      v51((uint64_t)v50, 35372, v19, @"GL_MAX_GEOMETRY_UNIFORM_BLOCKS");
      v51((uint64_t)v50, 36319, v19, @"GL_MAX_GEOMETRY_UNIFORM_COMPONENTS");
      v51((uint64_t)v50, 37155, v19, @"GL_MAX_GEOMETRY_INPUT_COMPONENTS");
      v51((uint64_t)v50, 36320, v19, @"GL_MAX_GEOMETRY_OUTPUT_VERTICES");
      v51((uint64_t)v50, 36321, v19, @"GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS");
      v51((uint64_t)v50, 37156, v19, @"GL_MAX_GEOMETRY_OUTPUT_COMPONENTS");
      v51((uint64_t)v50, 35881, v19, @"GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS");
      v51((uint64_t)v50, 35378, v19, @"GL_MAX_COMBINED_GEOMETRY_UNIFORM_COMPONENTS");
      v51((uint64_t)v50, 35373, v19, @"GL_MAX_FRAGMENT_UNIFORM_BLOCKS");
      v51((uint64_t)v50, 35657, v19, @"GL_MAX_FRAGMENT_UNIFORM_COMPONENTS");
      v51((uint64_t)v50, 37157, v19, @"GL_MAX_FRAGMENT_INPUT_COMPONENTS");
      v51((uint64_t)v50, 35379, v19, @"GL_MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS");
      v51((uint64_t)v50, 34852, v19, @"GL_MAX_DRAW_BUFFERS");
      v51((uint64_t)v50, 36063, v19, @"GL_MAX_COLOR_ATTACHMENTS");
      v51((uint64_t)v50, 35375, v19, @"GL_MAX_UNIFORM_BUFFER_BINDINGS");
      v51((uint64_t)v50, 35376, v19, @"GL_MAX_UNIFORM_BLOCK_SIZE");
      v51((uint64_t)v50, 35374, v19, @"GL_MAX_COMBINED_UNIFORM_BLOCKS");
      v51((uint64_t)v50, 33000, v19, @"GL_MAX_ELEMENTS_VERTICES");
      v51((uint64_t)v50, 33001, v19, @"GL_MAX_ELEMENTS_INDICES");
      v51((uint64_t)v50, 35979, v19, @"GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS");
      v51((uint64_t)v50, 35968, v19, @"GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS");
      v51((uint64_t)v50, 35978, v19, @"GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS");
      v51((uint64_t)v50, 34930, v19, @"GL_MAX_TEXTURE_IMAGE_UNITS");
      v51((uint64_t)v50, 35883, v19, @"GL_MAX_TEXTURE_BUFFER_SIZE");
      v51((uint64_t)v50, 35661, v19, @"GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS");
      v51((uint64_t)v50, 34076, v19, @"GL_MAX_CUBE_MAP_TEXTURE_SIZE");
      v51((uint64_t)v50, 34040, v19, @"GL_MAX_RECTANGLE_TEXTURE_SIZE");
      v51((uint64_t)v50, 32883, v19, @"GL_MAX_3D_TEXTURE_SIZE");
      v51((uint64_t)v50, 35071, v19, @"GL_MAX_ARRAY_TEXTURE_LAYERS");
      v51((uint64_t)v50, 37135, v19, @"GL_MAX_DEPTH_TEXTURE_SAMPLES");
      v51((uint64_t)v50, 37134, v19, @"GL_MAX_COLOR_TEXTURE_SAMPLES");
      v51((uint64_t)v50, 37136, v19, @"GL_MAX_INTEGER_SAMPLES");
      v51((uint64_t)v50, 36183, v19, @"GL_MAX_SAMPLES");
      v51((uint64_t)v50, 36441, v19, @"GL_MAX_SAMPLE_MASK_WORDS");
      v51((uint64_t)v50, 3378, v19, @"GL_MAX_CLIP_DISTANCES");
      v31((uint64_t)v30, 2834, v19, @"GL_POINT_SIZE_RANGE", 2);
      objc_msgSend(v19, "setObject:forKey:", objc_msgSend(v19, "objectForKey:", @"GL_MAX_CLIP_DISTANCES"), @"GL_MAX_CLIP_PLANES");
      break;
    case 4:
      v51((uint64_t)v50, 35375, v19, @"GL_MAX_UNIFORM_BUFFER_BINDINGS");
      v51((uint64_t)v50, 35376, v19, @"GL_MAX_UNIFORM_BLOCK_SIZE");
      v51((uint64_t)v50, 35371, v19, @"GL_MAX_VERTEX_UNIFORM_BLOCKS");
      v51((uint64_t)v50, 35373, v19, @"GL_MAX_FRAGMENT_UNIFORM_BLOCKS");
      v51((uint64_t)v50, 37154, v19, @"GL_MAX_VERTEX_OUTPUT_COMPONENTS");
      v51((uint64_t)v50, 35657, v19, @"GL_MAX_FRAGMENT_UNIFORM_COMPONENTS");
      v51((uint64_t)v50, 35379, v19, @"GL_MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS");
      v51((uint64_t)v50, 35979, v19, @"GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS");
      v51((uint64_t)v50, 35978, v19, @"GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS");
      v51((uint64_t)v50, 32883, v19, @"GL_MAX_3D_TEXTURE_SIZE");
      v51((uint64_t)v50, 35071, v19, @"GL_MAX_ARRAY_TEXTURE_LAYERS");
      v51((uint64_t)v50, 36063, v19, @"GL_MAX_COLOR_ATTACHMENTS");
      v51((uint64_t)v50, 35374, v19, @"GL_MAX_COMBINED_UNIFORM_BLOCKS");
      v51((uint64_t)v50, 34852, v19, @"GL_MAX_DRAW_BUFFERS");
      v51((uint64_t)v50, 35968, v19, @"GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS");
      v51((uint64_t)v50, 35658, v19, @"GL_MAX_VERTEX_UNIFORM_COMPONENTS");
      v51((uint64_t)v50, 37157, v19, @"GL_MAX_FRAGMENT_INPUT_COMPONENTS");
      v51((uint64_t)v50, 33000, v19, @"GL_MAX_ELEMENTS_VERTICES");
      v51((uint64_t)v50, 33001, v19, @"GL_MAX_ELEMENTS_INDICES");
      v51((uint64_t)v50, 35659, v19, @"GL_MAX_VARYING_COMPONENTS");
      v51((uint64_t)v50, 35076, v19, @"GL_MIN_PROGRAM_TEXEL_OFFSET");
      v51((uint64_t)v50, 35077, v19, @"GL_MAX_PROGRAM_TEXEL_OFFSET");
LABEL_17:
      v51((uint64_t)v50, 34921, v19, @"GL_MAX_VERTEX_ATTRIBS");
      v51((uint64_t)v50, 36347, v19, @"GL_MAX_VERTEX_UNIFORM_VECTORS");
      v51((uint64_t)v50, 36348, v19, @"GL_MAX_VARYING_VECTORS");
      v51((uint64_t)v50, 35661, v19, @"GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS");
      v51((uint64_t)v50, 35660, v19, @"GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS");
      v51((uint64_t)v50, 34930, v19, @"GL_MAX_TEXTURE_IMAGE_UNITS");
      v51((uint64_t)v50, 36349, v19, @"GL_MAX_FRAGMENT_UNIFORM_VECTORS");
      v51((uint64_t)v50, 34076, v19, @"GL_MAX_CUBE_MAP_TEXTURE_SIZE");
      v51((uint64_t)v50, 3408, v19, @"GL_SUBPIXEL_BITS");
      v51((uint64_t)v50, 32936, v19, @"GL_SAMPLE_BUFFERS");
      v51((uint64_t)v50, 32937, v19, @"GL_SAMPLES");
      v31((uint64_t)v30, 33901, v19, @"GL_ALIASED_POINT_SIZE_RANGE", 2);
      v51((uint64_t)v50, 3410, v20, @"GL_RED_BITS");
      v51((uint64_t)v50, 3411, v20, @"GL_GREEN_BITS");
      v51((uint64_t)v50, 3412, v20, @"GL_BLUE_BITS");
      v51((uint64_t)v50, 3413, v20, @"GL_ALPHA_BITS");
      v51((uint64_t)v50, 3414, v20, @"GL_DEPTH_BITS");
      v51((uint64_t)v50, 3415, v20, @"GL_STENCIL_BITS");
      v25((uint64_t)v24, 35633, 36336, @"GL_VERTEX_SHADERGL_LOW_FLOAT");
      v25((uint64_t)v24, 35633, 36337, @"GL_VERTEX_SHADERGL_MEDIUM_FLOAT");
      v25((uint64_t)v24, 35633, 36338, @"GL_VERTEX_SHADERGL_HIGH_FLOAT");
      v25((uint64_t)v24, 35633, 36339, @"GL_VERTEX_SHADERGL_LOW_INT");
      v25((uint64_t)v24, 35633, 36340, @"GL_VERTEX_SHADERGL_MEDIUM_INT");
      v25((uint64_t)v24, 35633, 36341, @"GL_VERTEX_SHADERGL_HIGH_INT");
      v25((uint64_t)v24, 35632, 36336, @"GL_FRAGMENT_SHADERGL_LOW_FLOAT");
      v25((uint64_t)v24, 35632, 36337, @"GL_FRAGMENT_SHADERGL_MEDIUM_FLOAT");
      v25((uint64_t)v24, 35632, 36338, @"GL_FRAGMENT_SHADERGL_HIGH_FLOAT");
      v25((uint64_t)v24, 35632, 36339, @"GL_FRAGMENT_SHADERGL_LOW_INT");
      v25((uint64_t)v24, 35632, 36340, @"GL_FRAGMENT_SHADERGL_MEDIUM_INT");
      v25((uint64_t)v24, 35632, 36341, @"GL_FRAGMENT_SHADERGL_HIGH_INT");
      break;
    default:
      break;
  }
  v51((uint64_t)v50, 3379, v19, @"GL_MAX_TEXTURE_SIZE");
  v51((uint64_t)v50, 34024, v19, @"GL_MAX_RENDERBUFFER_SIZE");
  v36((uint64_t)v35, 3386, v19, @"GL_MAX_VIEWPORT_DIMS", 2);
  v31((uint64_t)v30, 33902, v19, @"GL_ALIASED_LINE_WIDTH_RANGE", 2);
  int v22 = objc_msgSend((id)objc_msgSend(v9, "extensions"), "containsObject:", @"GL_EXT_texture_lod_bias");
  if ((a5 - 3) < 2 || v22) {
    v46((uint64_t)v45, 34045, v19, @"GL_MAX_TEXTURE_LOD_BIAS");
  }
  if (objc_msgSend((id)objc_msgSend(v9, "extensions"), "containsObject:", @"GL_EXT_texture_filter_anisotropic"))v46((uint64_t)v45, 34047, v19, @"GL_MAX_TEXTURE_MAX_ANISOTROPY_EXT"); {
  if (objc_msgSend((id)objc_msgSend(v9, "extensions"), "containsObject:", @"GL_EXT_shader_framebuffer_fetch"))v51((uint64_t)v50, 35410, v19, @"GL_FRAGMENT_SHADER_DISCARDS_SAMPLES_EXT");
  }
  if (objc_msgSend((id)objc_msgSend(v9, "extensions"), "containsObject:", @"GL_APPLE_clip_distance"))
  {
    v51((uint64_t)v50, 3378, v19, @"GL_MAX_CLIP_DISTANCES");
    objc_msgSend(v19, "setObject:forKey:", objc_msgSend(v19, "objectForKey:", @"GL_MAX_CLIP_DISTANCES"), @"GL_MAX_CLIP_PLANES");
  }
  if ((a5 - 3) < 2
    || (objc_msgSend((id)objc_msgSend(v9, "extensions"), "containsObject:", @"GL_ARB_sync") & 1) != 0
    || objc_msgSend((id)objc_msgSend(v9, "extensions"), "containsObject:", @"GL_APPLE_sync"))
  {
    v41((uint64_t)v40, 37137, v19, @"GL_MAX_SERVER_WAIT_TIMEOUT");
  }
  unsigned int v55 = 0;
  ((void (*)(__GLIContextRec *, uint64_t, unsigned int *))a4->get_integerv)(a3, 34466, &v55);
  v36((uint64_t)v35, 34467, v19, @"GL_COMPRESSED_TEXTURE_FORMATS", v55);
  objc_msgSend(v9, "setLimits:", (id)objc_msgSend(v19, "copy"));

  objc_msgSend(v9, "setBitCounts:", (id)objc_msgSend(v20, "copy"));
  objc_msgSend(v9, "setShaderPrecisionsFormats:", (id)objc_msgSend(v23, "copy"));

  while (((unsigned int (*)(__GLIContextRec *))a4->get_error)(a3))
    ;
  return v9;
}

id __58__DYRendererInfo_rendererInfoWithGLIContext_dispatch_api___block_invoke(uint64_t a1)
{
  id result = (id)(*(uint64_t (**)(void))(*(void *)(a1 + 32) + 936))(*(void *)(a1 + 40));
  if (result)
  {
    v2 = (void *)[[NSString alloc] initWithCString:result encoding:1];
    return v2;
  }
  return result;
}

uint64_t __58__DYRendererInfo_rendererInfoWithGLIContext_dispatch_api___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  unsigned int v7 = 0;
  (*(void (**)(void, uint64_t, unsigned int *))(*(void *)(a1 + 32) + 832))(*(void *)(a1 + 40), a2, &v7);
  return objc_msgSend(a3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", v7), a4);
}

uint64_t __58__DYRendererInfo_rendererInfoWithGLIContext_dispatch_api___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  int v8 = 0;
  (*(void (**)(void, uint64_t, int *))(*(void *)(a1 + 32) + 824))(*(void *)(a1 + 40), a2, &v8);
  LODWORD(v6) = v8;
  return objc_msgSend(a3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v6), a4);
}

uint64_t __58__DYRendererInfo_rendererInfoWithGLIContext_dispatch_api___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v7 = 0;
  (*(void (**)(void, uint64_t, uint64_t *))(*(void *)(a1 + 32) + 6272))(*(void *)(a1 + 40), a2, &v7);
  return objc_msgSend(a3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", v7), a4);
}

uint64_t __58__DYRendererInfo_rendererInfoWithGLIContext_dispatch_api___block_invoke_5(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  v13[1] = *MEMORY[0x263EF8340];
  int v8 = (unsigned int *)((char *)v13 - ((4 * a5 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(void, uint64_t, unsigned int *))(*(void *)(a1 + 32) + 832))(*(void *)(a1 + 40), a2, v8);
  if (a5)
  {
    id v9 = (void *)((char *)v13 - ((8 * a5 + 15) & 0xFFFFFFFFFFFFFFF0));
    uint64_t v10 = a5;
    do
    {
      unsigned int v11 = *v8++;
      *v9++ = [NSNumber numberWithInt:v11];
      --v10;
    }
    while (v10);
  }
  return objc_msgSend(a3, "setObject:forKey:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", (char *)v13 - ((8 * a5 + 15) & 0xFFFFFFFFFFFFFFF0), a5), a4);
}

uint64_t __58__DYRendererInfo_rendererInfoWithGLIContext_dispatch_api___block_invoke_6(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  v14[1] = *MEMORY[0x263EF8340];
  int v8 = (int *)((char *)v14 - ((4 * a5 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(void, uint64_t, int *))(*(void *)(a1 + 32) + 824))(*(void *)(a1 + 40), a2, v8);
  if (a5)
  {
    uint64_t v10 = (void *)((char *)v14 - ((8 * a5 + 15) & 0xFFFFFFFFFFFFFFF0));
    uint64_t v11 = a5;
    do
    {
      int v12 = *v8++;
      LODWORD(v9) = v12;
      *v10++ = [NSNumber numberWithFloat:v9];
      --v11;
    }
    while (v11);
  }
  return objc_msgSend(a3, "setObject:forKey:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", (char *)v14 - ((8 * a5 + 15) & 0xFFFFFFFFFFFFFFF0), a5), a4);
}

uint64_t __58__DYRendererInfo_rendererInfoWithGLIContext_dispatch_api___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  (*(void (**)(void, uint64_t, uint64_t, unsigned int *, _DWORD *))(*(void *)(a1 + 40) + 7008))(*(void *)(a1 + 48), a2, a3, &v9, v10);
  double v6 = NSDictionary;
  uint64_t v7 = [NSNumber numberWithInt:v9];
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v7, @"range", objc_msgSend(NSNumber, "numberWithInt:", v10[0]), @"precision", 0), a4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DYRendererInfo)initWithCoder:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)DYRendererInfo;
  v4 = [(DYRendererInfo *)&v18 init];
  if (v4)
  {
    v4->vendor = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"vendor"];
    v4->renderer = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"renderer"];
    v4->version = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
    v4->glslVersion = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"glslVersion"];
    v5 = (void *)MEMORY[0x263EFFA08];
    uint64_t v6 = objc_opt_class();
    v4->extensions = (NSSet *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"extensions");
    uint64_t v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v4->limits = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0), @"limits");
    uint64_t v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v4->bitCounts = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0), @"bitCounts");
    v14 = (void *)MEMORY[0x263EFFA08];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v4->shaderPrecisionsFormats = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0), @"shaderPrecisionsFormats");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->vendor forKey:@"vendor"];
  [a3 encodeObject:self->renderer forKey:@"renderer"];
  [a3 encodeObject:self->version forKey:@"version"];
  [a3 encodeObject:self->glslVersion forKey:@"glslVersion"];
  [a3 encodeObject:self->extensions forKey:@"extensions"];
  [a3 encodeObject:self->limits forKey:@"limits"];
  [a3 encodeObject:self->bitCounts forKey:@"bitCounts"];
  shaderPrecisionsFormats = self->shaderPrecisionsFormats;
  [a3 encodeObject:shaderPrecisionsFormats forKey:@"shaderPrecisionsFormats"];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)DYRendererInfo;
  return (id)[NSString stringWithFormat:@"%@ vendor=%@ renderer=%@ version=%@ glsl version=%@\nextensions=%@\nlimits=%@\nbitCounts=%@\nshaderPrecisionsFormats=%@", -[DYRendererInfo description](&v3, sel_description), self->vendor, self->renderer, self->version, self->glslVersion, self->extensions, self->limits, self->bitCounts, self->shaderPrecisionsFormats];
}

- (id)descriptionForBugReport
{
  return (id)[NSString stringWithFormat:@"%@ | %@ | %@ | %@", self->version, self->glslVersion, self->renderer, self->vendor];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DYRendererInfo;
  [(DYRendererInfo *)&v3 dealloc];
}

+ (BOOL)_rangeIsSupported:(id)a3 supportedRange:(id)a4
{
  uint64_t v6 = [a3 count];
  if (v6 == [a4 count])
  {
    if (![a3 count]) {
      return 1;
    }
    unint64_t v7 = 0;
    while (1)
    {
      uint64_t v8 = [a3 objectAtIndex:0];
      uint64_t v9 = [a3 objectAtIndex:1];
      uint64_t v10 = (void *)[a4 objectAtIndex:0];
      uint64_t v11 = (void *)[a4 objectAtIndex:1];
      if ([v10 compare:v8] == 1 || objc_msgSend(v11, "compare:", v9) == -1) {
        break;
      }
      v7 += 2;
      if (v7 >= [a3 count]) {
        return 1;
      }
    }
  }
  return 0;
}

+ (BOOL)_dimensionsAreSupported:(id)a3 supportedDimensions:(id)a4
{
  uint64_t v6 = [a3 count];
  if (v6 != [a4 count]) {
    return 0;
  }
  if (![a3 count]) {
    return 1;
  }
  unint64_t v7 = 0;
  do
  {
    uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", v7), "compare:", objc_msgSend(a4, "objectAtIndex:", v7));
    BOOL v9 = v8 != 1;
    if (v8 == 1) {
      break;
    }
    ++v7;
  }
  while (v7 < [a3 count]);
  return v9;
}

- (BOOL)_supportsLimits:(id)a3
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__DYRendererInfo__supportsLimits___block_invoke;
  v5[3] = &unk_26532CD60;
  v5[4] = self;
  v5[5] = &v6;
  [a3 enumerateKeysAndObjectsUsingBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__DYRendererInfo__supportsLimits___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a2 isEqualToString:@"GL_MAX_TEXTURE_MAX_ANISOTROPY_EXT"];
  if ((result & 1) == 0)
  {
    char v9 = (void *)[*(id *)(*(void *)(a1 + 32) + 48) objectForKey:a2];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t result = [v9 compare:a3];
      if (result != -1) {
        return result;
      }
      goto LABEL_4;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v10 = (void *)[(id)objc_opt_class() description];
      [a2 cStringUsingEncoding:1];
      [v10 cStringUsingEncoding:1];
      uint64_t v11 = (DYRendererInfo *)dy_abort();
      return [(DYRendererInfo *)v11 _supportsGLVersion:v13];
    }
    if ([a2 hasSuffix:@"RANGE"])
    {
      uint64_t result = [(id)objc_opt_class() _rangeIsSupported:a3 supportedRange:v9];
      if (result) {
        return result;
      }
LABEL_4:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      *a4 = 1;
      return result;
    }
    if ([a2 hasSuffix:@"DIMS"])
    {
      uint64_t result = [(id)objc_opt_class() _dimensionsAreSupported:a3 supportedDimensions:v9];
      if ((result & 1) == 0) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t result = [a3 isEqualToArray:v9];
      if ((result & 1) == 0) {
        goto LABEL_4;
      }
    }
  }
  return result;
}

- (BOOL)_supportsGLVersion:(id)a3
{
  objc_msgSend(-[NSArray objectAtIndex:](-[NSString componentsSeparatedByString:](self->version, "componentsSeparatedByString:", @" "), "objectAtIndex:", 2), "floatValue");
  float v5 = v4;
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "componentsSeparatedByString:", @" "), "objectAtIndex:", 2), "floatValue");
  return v6 <= v5 && SLODWORD(v6) == SLODWORD(v5);
}

- (BOOL)_supportsGLSLVersion:(id)a3
{
  objc_msgSend(-[NSArray objectAtIndex:](-[NSString componentsSeparatedByString:](self->glslVersion, "componentsSeparatedByString:", @" "), "objectAtIndex:", 4), "floatValue");
  float v5 = v4;
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "componentsSeparatedByString:", @" "), "objectAtIndex:", 4), "floatValue");
  return v6 <= v5;
}

- (BOOL)supportsCapabilitiesOfRenderer:(id)a3
{
  if (!a3) {
    __assert_rtn("-[DYRendererInfo supportsCapabilitiesOfRenderer:]", (const char *)&unk_24F5F0846, 0, "rendererInfo");
  }
  if (!-[DYRendererInfo _supportsGLVersion:](self, "_supportsGLVersion:", [a3 version])
    || self->glslVersion
    && !-[DYRendererInfo _supportsGLSLVersion:](self, "_supportsGLSLVersion:", [a3 glslVersion])
    || !objc_msgSend((id)objc_msgSend(a3, "extensions"), "isSubsetOfSet:", self->extensions))
  {
    return 0;
  }
  uint64_t v5 = [a3 limits];
  return [(DYRendererInfo *)self _supportsLimits:v5];
}

- (NSString)vendor
{
  return self->vendor;
}

- (void)setVendor:(id)a3
{
}

- (NSString)renderer
{
  return self->renderer;
}

- (void)setRenderer:(id)a3
{
}

- (NSString)version
{
  return self->version;
}

- (void)setVersion:(id)a3
{
}

- (NSString)glslVersion
{
  return self->glslVersion;
}

- (void)setGlslVersion:(id)a3
{
}

- (NSSet)extensions
{
  return self->extensions;
}

- (void)setExtensions:(id)a3
{
}

- (NSDictionary)limits
{
  return self->limits;
}

- (void)setLimits:(id)a3
{
}

- (NSDictionary)bitCounts
{
  return self->bitCounts;
}

- (void)setBitCounts:(id)a3
{
}

- (NSDictionary)shaderPrecisionsFormats
{
  return self->shaderPrecisionsFormats;
}

- (void)setShaderPrecisionsFormats:(id)a3
{
}

@end