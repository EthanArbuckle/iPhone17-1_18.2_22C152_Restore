@interface BWDepthRotatorNode
+ (void)initialize;
- (BWDepthRotatorNode)initWithRotationDegrees:(int)a3 separateDepthComponentsEnabled:(BOOL)a4 depthProvidedAsAttachedMedia:(BOOL)a5;
- (id)nodeSubType;
- (id)nodeType;
- (uint64_t)_setupDepthMediaConfigurationForOutput:(uint64_t)a3 attachedMediaKey:;
- (uint64_t)_updateDepthOutputFormatRequirementsForInputFormat:(uint64_t)a3 pixelFormat:(uint64_t)a4 attachedMediaKey:;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWDepthRotatorNode

+ (void)initialize
{
}

- (BWDepthRotatorNode)initWithRotationDegrees:(int)a3 separateDepthComponentsEnabled:(BOOL)a4 depthProvidedAsAttachedMedia:(BOOL)a5
{
  BOOL v5 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BWDepthRotatorNode;
  v8 = [(BWNode *)&v19 init];
  v9 = v8;
  if (v8)
  {
    v8->_separateDepthComponentsEnabled = a4;
    v8->_depthProvidedAsAttachedMedia = v5;
    v10 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v8];
    v11 = v10;
    if (v5)
    {
      [(BWNodeInput *)v10 setPassthroughMode:1];
      v12 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWNodeInput *)v11 setFormatRequirements:v12];
    }
    else
    {
      [(BWNodeInput *)v10 setPassthroughMode:0];
    }
    v13 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v13 setSupportedPixelFormats:&unk_1EFB032F0];
    if (v5)
    {
      v14 = objc_alloc_init(BWNodeInputMediaConfiguration);
      [(BWNodeInputMediaConfiguration *)v14 setFormatRequirements:v13];
      [(BWNodeInputMediaConfiguration *)v14 setPassthroughMode:0];
      [(BWNodeInput *)v11 setMediaConfiguration:v14 forAttachedMediaKey:@"Depth"];
    }
    else
    {
      [(BWNodeInput *)v11 setFormatRequirements:v13];
    }
    [(BWNode *)v9 addInput:v11];

    v15 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v9];
    v16 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWNodeOutput *)v15 setFormatRequirements:v16];

    [(BWNodeOutput *)v15 setPassthroughMode:v5];
    if (v5)
    {
      if (v9->_separateDepthComponentsEnabled) {
        v17 = BWAttachedMediaKey_DepthData_DX;
      }
      else {
        v17 = BWAttachedMediaKey_Depth;
      }
      -[BWDepthRotatorNode _setupDepthMediaConfigurationForOutput:attachedMediaKey:]((uint64_t)v9, v15, (uint64_t)*v17);
    }
    if (v9->_separateDepthComponentsEnabled) {
      -[BWDepthRotatorNode _setupDepthMediaConfigurationForOutput:attachedMediaKey:]((uint64_t)v9, v15, @"DepthData_DY");
    }
    [(BWNode *)v9 addOutput:v15];

    v9->_rotationDegrees = a3;
  }
  return v9;
}

- (uint64_t)_setupDepthMediaConfigurationForOutput:(uint64_t)a3 attachedMediaKey:
{
  if (result)
  {
    BOOL v5 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    [(BWNodeOutputMediaConfiguration *)v5 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeOutputMediaConfiguration *)v5 setPassthroughMode:0];
    [(BWNodeOutputMediaConfiguration *)v5 setProvidesPixelBufferPool:1];
    return [a2 setMediaConfiguration:v5 forAttachedMediaKey:a3];
  }
  return result;
}

- (void)dealloc
{
  outputDepthFormatDescription = self->_outputDepthFormatDescription;
  if (outputDepthFormatDescription) {
    CFRelease(outputDepthFormatDescription);
  }
  outputDYFormatDescription = self->_outputDYFormatDescription;
  if (outputDYFormatDescription) {
    CFRelease(outputDYFormatDescription);
  }
  v5.receiver = self;
  v5.super_class = (Class)BWDepthRotatorNode;
  [(BWNode *)&v5 dealloc];
}

- (id)nodeType
{
  return @"Effect";
}

- (id)nodeSubType
{
  return @"DepthRotator";
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  if (self->_depthProvidedAsAttachedMedia)
  {
    if ([a5 isEqualToString:@"PrimaryFormat"])
    {
      output = self->super._output;
      [(BWNodeOutput *)output setFormat:a3];
      return;
    }
    if (![a5 isEqualToString:@"Depth"])
    {
      v15.receiver = self;
      v15.super_class = (Class)BWDepthRotatorNode;
      [(BWNode *)&v15 didSelectFormat:a3 forInput:a4 forAttachedMediaKey:a5];
      return;
    }
    if (!self->_separateDepthComponentsEnabled)
    {
      uint64_t v14 = [a3 pixelFormat];
      v12 = self;
      id v13 = a3;
      v11 = @"Depth";
      goto LABEL_12;
    }
    v10 = BWAttachedMediaKey_DepthData_DX;
  }
  else
  {
    if (!self->_separateDepthComponentsEnabled) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"At this point CTM excepts separate depth components enabled when source nodes depth output are enabled." userInfo:0]);
    }
    v10 = BWAttachedMediaKey_PrimaryFormat;
  }
  -[BWDepthRotatorNode _updateDepthOutputFormatRequirementsForInputFormat:pixelFormat:attachedMediaKey:]((uint64_t)self, a3, 825306677, (uint64_t)*v10);
  v11 = @"DepthData_DY";
  v12 = self;
  id v13 = a3;
  uint64_t v14 = 1932996149;
LABEL_12:
  -[BWDepthRotatorNode _updateDepthOutputFormatRequirementsForInputFormat:pixelFormat:attachedMediaKey:]((uint64_t)v12, v13, v14, (uint64_t)v11);
}

- (uint64_t)_updateDepthOutputFormatRequirementsForInputFormat:(uint64_t)a3 pixelFormat:(uint64_t)a4 attachedMediaKey:
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v6 = result;
    v7 = objc_msgSend((id)objc_msgSend(*(id *)(result + 16), "mediaConfigurationForAttachedMediaKey:", a4), "formatRequirements");
    v10[0] = [NSNumber numberWithUnsignedInt:a3];
    objc_msgSend(v7, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v10, 1));
    int v8 = *(_DWORD *)(v6 + 124);
    if (v8 == 270 || v8 == 90)
    {
      objc_msgSend(v7, "setWidth:", objc_msgSend(a2, "height"));
      uint64_t v9 = [a2 width];
    }
    else
    {
      objc_msgSend(v7, "setWidth:", objc_msgSend(a2, "width"));
      uint64_t v9 = [a2 height];
    }
    return [v7 setHeight:v9];
  }
  return result;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  v4 = a3;
  CMAttachmentBearerRef cf = 0;
  CMAttachmentBearerRef target = 0;
  ++self->_bufferSerialNumber;
  AttachedMedia = a3;
  if (self->_depthProvidedAsAttachedMedia) {
    AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, @"Depth");
  }
  if (!AttachedMedia)
  {
    uint64_t v9 = 0;
    ImageBuffer = 0;
    goto LABEL_47;
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
  if (!ImageBuffer)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v9 = 0;
    goto LABEL_40;
  }
  if (self->_depthProvidedAsAttachedMedia)
  {
    if (self->_separateDepthComponentsEnabled) {
      int v8 = BWAttachedMediaKey_DepthData_DX;
    }
    else {
      int v8 = BWAttachedMediaKey_Depth;
    }
  }
  else
  {
    int v8 = BWAttachedMediaKey_PrimaryFormat;
  }
  uint64_t v9 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(-[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self->super._output, "mediaPropertiesForAttachedMediaKey:", *v8), "livePixelBufferPool"), "newPixelBuffer");
  if (!v9)
  {
LABEL_39:
    ImageBuffer = 0;
LABEL_40:
    if (target)
    {
      CFRelease(target);
      CMAttachmentBearerRef target = 0;
    }
    if (cf)
    {
      CFRelease(cf);
      CMAttachmentBearerRef cf = 0;
    }
    CMSampleBufferGetPresentationTimeStamp(&v35, v4);
    id v27 = +[BWDroppedSample newDroppedSampleWithReason:0x1EFA68000 pts:&v35];
    [(BWNodeOutput *)self->super._output emitDroppedSample:v27];

    goto LABEL_57;
  }
  int rotationDegrees = self->_rotationDegrees;
  if (rotationDegrees <= 179)
  {
    if (rotationDegrees)
    {
      if (rotationDegrees != 90) {
        goto LABEL_38;
      }
      goto LABEL_18;
    }
LABEL_17:
    v34 = v4;
    size_t Width = CVPixelBufferGetWidth(ImageBuffer);
    size_t Height = CVPixelBufferGetHeight(ImageBuffer);
    goto LABEL_19;
  }
  if (rotationDegrees != 270)
  {
    if (rotationDegrees != 180)
    {
LABEL_38:
      fig_log_get_emitter();
      FigDebugAssert3();
      goto LABEL_39;
    }
    goto LABEL_17;
  }
LABEL_18:
  v34 = v4;
  size_t Width = CVPixelBufferGetHeight(ImageBuffer);
  size_t Height = CVPixelBufferGetWidth(ImageBuffer);
LABEL_19:
  size_t v13 = Height;
  uint64_t v14 = v9;
  size_t v15 = CVPixelBufferGetWidth(v9);
  size_t v16 = CVPixelBufferGetHeight(v14);
  if (Width == v15 && v13 == v16)
  {
    int v18 = FigDepthConvertRotationAndMirroringToExifOrientation(self->_rotationDegrees, 0);
    FigDepthRotateBuffer(ImageBuffer, v14, v18);
    uint64_t v9 = v14;
    if (BWCMSampleBufferCreateCopyWithNewPixelBuffer(AttachedMedia, v14, (CFTypeRef *)&self->_outputDepthFormatDescription, (CMSampleBufferRef *)&target))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      ImageBuffer = 0;
      v4 = v34;
      goto LABEL_40;
    }
    v33 = v14;
    CFStringRef v19 = (const __CFString *)*MEMORY[0x1E4F52FE8];
    CMRemoveAttachment(target, (CFStringRef)*MEMORY[0x1E4F52FE8]);
    v20 = (void *)CMGetAttachment(AttachedMedia, v19, 0);
    v21 = (const void *)*MEMORY[0x1E4F537C0];
    uint64_t v22 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F537C0]];
    v23 = (__CVBuffer *)v22;
    if (self->_separateDepthComponentsEnabled && !v22)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      ImageBuffer = 0;
    }
    else
    {
      if (!v22)
      {
        ImageBuffer = 0;
        v4 = v34;
        goto LABEL_37;
      }
      ImageBuffer = (__CVBuffer *)objc_msgSend((id)objc_msgSend(-[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self->super._output, "mediaPropertiesForAttachedMediaKey:", @"DepthData_DY"), "livePixelBufferPool"), "newPixelBuffer");
      if (ImageBuffer)
      {
        if (!FigDepthRotateBuffer(v23, ImageBuffer, v18))
        {
          v24 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
          uint64_t v25 = *MEMORY[0x1E4F537B8];
          if ([v20 objectForKeyedSubscript:*MEMORY[0x1E4F537B8]]) {
            objc_msgSend(v24, "setObject:forKeyedSubscript:", objc_msgSend(v20, "objectForKeyedSubscript:", v25), v25);
          }
          if (!self->_separateDepthComponentsEnabled)
          {
            [v24 setObject:ImageBuffer forKeyedSubscript:v21];
            p_CMAttachmentBearerRef target = &target;
            v4 = v34;
            goto LABEL_46;
          }
          v4 = v34;
          if (!BWCMSampleBufferCreateCopyWithNewPixelBuffer(AttachedMedia, ImageBuffer, (CFTypeRef *)&self->_outputDYFormatDescription, (CMSampleBufferRef *)&cf))
          {
            CMRemoveAttachment(cf, v19);
            CMSetAttachment(cf, @"DepthPixelBufferType", v21, 1u);
            if ([v24 count])
            {
              p_CMAttachmentBearerRef target = &cf;
LABEL_46:
              uint64_t v9 = v33;
              CMSetAttachment(*p_target, v19, v24, 1u);
              goto LABEL_47;
            }
LABEL_37:
            uint64_t v9 = v33;
            goto LABEL_47;
          }
          fig_log_get_emitter();
          FigDebugAssert3();
LABEL_77:
          uint64_t v9 = v33;
          goto LABEL_40;
        }
        fig_log_get_emitter();
        FigDebugAssert3();
      }
    }
    v4 = v34;
    goto LABEL_77;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  int v32 = FigSignalErrorAt();
  ImageBuffer = 0;
  uint64_t v9 = v14;
  v4 = v34;
  if (v32) {
    goto LABEL_40;
  }
LABEL_47:
  if (!self->_depthProvidedAsAttachedMedia)
  {
    if (!target
      || (BWSampleBufferSetAttachedMedia(target, @"DepthData_DY", (uint64_t)cf), (CMAttachmentBearerRef v30 = target) == 0))
    {
      CFTypeRef v31 = 0;
      goto LABEL_60;
    }
    goto LABEL_56;
  }
  v28 = @"Depth";
  if (self->_separateDepthComponentsEnabled)
  {
    BWSampleBufferRemoveAttachedMedia(v4, @"Depth");
    BWSampleBufferSetAttachedMedia(v4, @"DepthData_DX", (uint64_t)target);
    v28 = @"DepthData_DY";
    CMAttachmentBearerRef v29 = cf;
  }
  else
  {
    CMAttachmentBearerRef v29 = target;
  }
  BWSampleBufferSetAttachedMedia(v4, (uint64_t)v28, (uint64_t)v29);
  if (v4)
  {
    CMAttachmentBearerRef v30 = v4;
LABEL_56:
    CFTypeRef v31 = CFRetain(v30);
    goto LABEL_58;
  }
LABEL_57:
  CFTypeRef v31 = 0;
LABEL_58:
  if (target) {
    CFRelease(target);
  }
LABEL_60:
  if (v9) {
    CFRelease(v9);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (ImageBuffer) {
    CFRelease(ImageBuffer);
  }
  if (v31)
  {
    [(BWNodeOutput *)self->super._output emitSampleBuffer:v4];
    CFRelease(v31);
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)BWDepthRotatorNode;
  [(BWNode *)&v3 didReachEndOfDataForInput:a3];
}

@end