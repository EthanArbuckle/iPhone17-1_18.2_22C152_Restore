@interface FigCaptureVideoDataSinkConfiguration
- (BOOL)cinematicFramingEnabled;
- (BOOL)discardsLateVideoFrames;
- (BOOL)isEqual:(id)a3;
- (BOOL)optimizedForPreview;
- (BOOL)sceneStabilityMetadataEnabled;
- (FigCaptureTrie)requestedBufferAttachmentsTrie;
- (FigCaptureVideoDataSinkConfiguration)initWithXPCEncoding:(id)a3;
- (NSArray)requestedBufferAttachments;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (id)description;
- (int)sinkType;
- (void)dealloc;
- (void)setCinematicFramingEnabled:(BOOL)a3;
- (void)setDiscardsLateVideoFrames:(BOOL)a3;
- (void)setOptimizedForPreview:(BOOL)a3;
- (void)setRequestedBufferAttachments:(id)a3;
- (void)setSceneStabilityMetadataEnabled:(BOOL)a3;
@end

@implementation FigCaptureVideoDataSinkConfiguration

- (int)sinkType
{
  return 6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureVideoDataSinkConfiguration;
  [(FigCaptureSinkConfiguration *)&v3 dealloc];
}

- (id)copyXPCEncoding
{
  v7.receiver = self;
  v7.super_class = (Class)FigCaptureVideoDataSinkConfiguration;
  id v3 = [(FigCaptureSinkConfiguration *)&v7 copyXPCEncoding];
  xpc_dictionary_set_BOOL(v3, "videoDataDiscardsLateVideoFrames", [(FigCaptureVideoDataSinkConfiguration *)self discardsLateVideoFrames]);
  xpc_dictionary_set_BOOL(v3, "videoDataOptimizedForPreview", [(FigCaptureVideoDataSinkConfiguration *)self optimizedForPreview]);
  xpc_dictionary_set_BOOL(v3, "sceneStabilityMetadataEnabled", [(FigCaptureVideoDataSinkConfiguration *)self sceneStabilityMetadataEnabled]);
  [(FigCaptureVideoDataSinkConfiguration *)self requestedBufferAttachments];
  v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (v4)
  {
    v5 = v4;
    xpc_dictionary_set_value(v3, "requestedBufferAttachments", v4);
    xpc_release(v5);
  }
  xpc_dictionary_set_BOOL(v3, "cinematicFramingEnabled", [(FigCaptureVideoDataSinkConfiguration *)self cinematicFramingEnabled]);
  return v3;
}

- (FigCaptureTrie)requestedBufferAttachmentsTrie
{
  result = self->_requestedBufferAttachmentsTrie;
  if (!result)
  {
    if (self->_requestedBufferAttachments)
    {
      result = [[FigCaptureTrie alloc] initWithPathArray:self->_requestedBufferAttachments];
      self->_requestedBufferAttachmentsTrie = result;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)FigCaptureVideoDataSinkConfiguration;
  unsigned int v5 = -[FigCaptureSinkConfiguration isEqual:](&v12, sel_isEqual_);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (int v6 = [(FigCaptureVideoDataSinkConfiguration *)self discardsLateVideoFrames],
          v6 == [a3 discardsLateVideoFrames])
      && (int v7 = [(FigCaptureVideoDataSinkConfiguration *)self optimizedForPreview],
          v7 == [a3 optimizedForPreview])
      && (int v8 = -[FigCaptureVideoDataSinkConfiguration sceneStabilityMetadataEnabled](self, "sceneStabilityMetadataEnabled"), v8 == [a3 sceneStabilityMetadataEnabled]))
    {
      v9 = [(FigCaptureVideoDataSinkConfiguration *)self requestedBufferAttachments];
      if (v9 == (NSArray *)[a3 requestedBufferAttachments]
        || (unsigned int v5 = -[NSArray isEqual:](-[FigCaptureVideoDataSinkConfiguration requestedBufferAttachments](self, "requestedBufferAttachments"), "isEqual:", [a3 requestedBufferAttachments])) != 0)
      {
        BOOL v10 = [(FigCaptureVideoDataSinkConfiguration *)self cinematicFramingEnabled];
        LOBYTE(v5) = v10 ^ [a3 cinematicFramingEnabled] ^ 1;
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FigCaptureVideoDataSinkConfiguration;
  id v4 = [(FigCaptureSinkConfiguration *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setDiscardsLateVideoFrames:", -[FigCaptureVideoDataSinkConfiguration discardsLateVideoFrames](self, "discardsLateVideoFrames"));
  objc_msgSend(v4, "setOptimizedForPreview:", -[FigCaptureVideoDataSinkConfiguration optimizedForPreview](self, "optimizedForPreview"));
  objc_msgSend(v4, "setSceneStabilityMetadataEnabled:", -[FigCaptureVideoDataSinkConfiguration sceneStabilityMetadataEnabled](self, "sceneStabilityMetadataEnabled"));
  objc_msgSend(v4, "setRequestedBufferAttachments:", -[FigCaptureVideoDataSinkConfiguration requestedBufferAttachments](self, "requestedBufferAttachments"));
  objc_msgSend(v4, "setCinematicFramingEnabled:", -[FigCaptureVideoDataSinkConfiguration cinematicFramingEnabled](self, "cinematicFramingEnabled"));
  return v4;
}

- (BOOL)cinematicFramingEnabled
{
  return self->_cinematicFramingEnabled;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureVideoDataSinkConfiguration;
  return (id)[NSString stringWithFormat:@"%@ discards:%d, preview:%d, stability:%d, requestedBufferAttachments.count:%d", -[FigCaptureSinkConfiguration description](&v3, sel_description), -[FigCaptureVideoDataSinkConfiguration discardsLateVideoFrames](self, "discardsLateVideoFrames"), -[FigCaptureVideoDataSinkConfiguration optimizedForPreview](self, "optimizedForPreview"), -[FigCaptureVideoDataSinkConfiguration sceneStabilityMetadataEnabled](self, "sceneStabilityMetadataEnabled"), -[NSArray count](-[FigCaptureVideoDataSinkConfiguration requestedBufferAttachments](self, "requestedBufferAttachments"), "count")];
}

- (BOOL)sceneStabilityMetadataEnabled
{
  return self->_sceneStabilityMetadataEnabled;
}

- (BOOL)optimizedForPreview
{
  return self->_optimizedForPreview;
}

- (BOOL)discardsLateVideoFrames
{
  return self->_discardsLateVideoFrames;
}

- (NSArray)requestedBufferAttachments
{
  return self->_requestedBufferAttachments;
}

- (void)setSceneStabilityMetadataEnabled:(BOOL)a3
{
  self->_sceneStabilityMetadataEnabled = a3;
}

- (void)setRequestedBufferAttachments:(id)a3
{
  requestedBufferAttachments = self->_requestedBufferAttachments;
  self->_requestedBufferAttachments = (NSArray *)a3;
  if (a3) {
    CFRetain(a3);
  }
  if (requestedBufferAttachments) {
    CFRelease(requestedBufferAttachments);
  }

  self->_requestedBufferAttachmentsTrie = 0;
}

- (void)setOptimizedForPreview:(BOOL)a3
{
  self->_optimizedForPreview = a3;
}

- (void)setDiscardsLateVideoFrames:(BOOL)a3
{
  self->_discardsLateVideoFrames = a3;
}

- (void)setCinematicFramingEnabled:(BOOL)a3
{
  self->_cinematicFramingEnabled = a3;
}

- (FigCaptureVideoDataSinkConfiguration)initWithXPCEncoding:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FigCaptureVideoDataSinkConfiguration;
  id v4 = -[FigCaptureSinkConfiguration initWithXPCEncoding:](&v6, sel_initWithXPCEncoding_);
  if (v4)
  {
    v4->_discardsLateVideoFrames = xpc_dictionary_get_BOOL(a3, "videoDataDiscardsLateVideoFrames");
    v4->_optimizedForPreview = xpc_dictionary_get_BOOL(a3, "videoDataOptimizedForPreview");
    v4->_sceneStabilityMetadataEnabled = xpc_dictionary_get_BOOL(a3, "sceneStabilityMetadataEnabled");
    xpc_dictionary_get_array(a3, "requestedBufferAttachments");
    v4->_requestedBufferAttachments = (NSArray *)_CFXPCCreateCFObjectFromXPCObject();
    v4->_cinematicFramingEnabled = xpc_dictionary_get_BOOL(a3, "cinematicFramingEnabled");
  }
  return v4;
}

@end