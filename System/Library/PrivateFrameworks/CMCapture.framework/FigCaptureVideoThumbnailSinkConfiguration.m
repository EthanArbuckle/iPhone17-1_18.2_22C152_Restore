@interface FigCaptureVideoThumbnailSinkConfiguration
- (CGSize)thumbnailSize;
- (FigCaptureVideoThumbnailSinkConfiguration)initWithXPCEncoding:(id)a3;
- (NSArray)filters;
- (NSArray)smartStyles;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (int)sinkType;
- (void)dealloc;
- (void)setFilters:(id)a3;
- (void)setSmartStyles:(id)a3;
- (void)setThumbnailSize:(CGSize)a3;
@end

@implementation FigCaptureVideoThumbnailSinkConfiguration

- (int)sinkType
{
  return 12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureVideoThumbnailSinkConfiguration;
  [(FigCaptureSinkConfiguration *)&v3 dealloc];
}

- (id)copyXPCEncoding
{
  v12.receiver = self;
  v12.super_class = (Class)FigCaptureVideoThumbnailSinkConfiguration;
  id v3 = [(FigCaptureSinkConfiguration *)&v12 copyXPCEncoding];
  CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(self->_thumbnailSize);
  FigXPCMessageSetCFDictionary();
  if ([(NSArray *)self->_smartStyles count])
  {
    smartStyles = self->_smartStyles;
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
    [v6 encodeObject:smartStyles forKey:*MEMORY[0x1E4F284E8]];
    v7 = (void *)[v6 encodedData];

    xpc_object_t v8 = xpc_data_create((const void *)[v7 bytes], objc_msgSend(v7, "length"));
    v9 = "smartStyles";
  }
  else
  {
    if (![(NSArray *)self->_filters count]) {
      goto LABEL_6;
    }
    v10 = (void *)csr_serializeObjectUsingNSSecureCoding((uint64_t)self->_filters);
    xpc_object_t v8 = xpc_data_create((const void *)[v10 bytes], objc_msgSend(v10, "length"));
    v9 = "filters";
  }
  xpc_dictionary_set_value(v3, v9, v8);
  xpc_release(v8);
LABEL_6:
  if (DictionaryRepresentation) {
    CFRelease(DictionaryRepresentation);
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FigCaptureVideoThumbnailSinkConfiguration;
  id v4 = [(FigCaptureSinkConfiguration *)&v6 copyWithZone:a3];
  [(FigCaptureVideoThumbnailSinkConfiguration *)self thumbnailSize];
  objc_msgSend(v4, "setThumbnailSize:");
  objc_msgSend(v4, "setFilters:", -[FigCaptureVideoThumbnailSinkConfiguration filters](self, "filters"));
  objc_msgSend(v4, "setSmartStyles:", -[FigCaptureVideoThumbnailSinkConfiguration smartStyles](self, "smartStyles"));
  return v4;
}

- (void)setThumbnailSize:(CGSize)a3
{
  self->_thumbnailSize = a3;
}

- (void)setFilters:(id)a3
{
}

- (CGSize)thumbnailSize
{
  double width = self->_thumbnailSize.width;
  double height = self->_thumbnailSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSArray)filters
{
  return self->_filters;
}

- (NSArray)smartStyles
{
  return self->_smartStyles;
}

- (void)setSmartStyles:(id)a3
{
}

- (FigCaptureVideoThumbnailSinkConfiguration)initWithXPCEncoding:(id)a3
{
  v23.receiver = self;
  v23.super_class = (Class)FigCaptureVideoThumbnailSinkConfiguration;
  v5 = -[FigCaptureSinkConfiguration initWithXPCEncoding:](&v23, sel_initWithXPCEncoding_);
  if (v5)
  {
    length[1] = 0;
    FigXPCMessageCopyCFDictionary();
    CGSizeMakeWithDictionaryRepresentation(0, &v5->_thumbnailSize);
    length[0] = 0;
    data = xpc_dictionary_get_data(a3, "smartStyles", length);
    size_t v21 = 0;
    v7 = xpc_dictionary_get_data(a3, "filters", &v21);
    if (data)
    {
      uint64_t v8 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:data length:length[0] freeWhenDone:0];
      id v24 = 0;
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v8 error:&v24];
      if (v24)
      {
        fig_log_get_emitter();
        LODWORD(v20) = 0;
        FigDebugAssert3();
        objc_msgSend(v24, "code", v20, v3);
        FigSignalErrorAt();
        objc_super v12 = 0;
      }
      else
      {
        v10 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v11 = objc_opt_class();
        objc_super v12 = objc_msgSend(v9, "decodeObjectOfClasses:forKey:", objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0), *MEMORY[0x1E4F284E8]);
        [v9 finishDecoding];
      }

      v13 = v12;
      uint64_t v14 = 40;
    }
    else
    {
      if (!v7) {
        return v5;
      }
      uint64_t v15 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v7 length:v21 freeWhenDone:0];
      v16 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
      v13 = (objc_class *)(id)fcsc_deserializeDataUsingNSSecureCoding(v15, v18);
      uint64_t v14 = 32;
    }
    *(Class *)((char *)&v5->super.super.isa + v14) = v13;
    if (!v13)
    {

      return 0;
    }
  }
  return v5;
}

@end