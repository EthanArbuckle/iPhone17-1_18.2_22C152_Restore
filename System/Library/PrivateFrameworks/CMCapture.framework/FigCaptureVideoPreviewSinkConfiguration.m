@interface FigCaptureVideoPreviewSinkConfiguration
- (BOOL)depthDataDeliveryEnabled;
- (BOOL)filterRenderingEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)portraitAutoSuggestEnabled;
- (BOOL)primaryCaptureRectModificationEnabled;
- (BOOL)semanticStyleRenderingEnabled;
- (BOOL)zoomPIPOverlayEnabled;
- (CGPoint)primaryCaptureRectCenter;
- (FigCaptureSemanticStyle)semanticStyle;
- (FigCaptureVideoPreviewSinkConfiguration)init;
- (FigCaptureVideoPreviewSinkConfiguration)initWithXPCEncoding:(id)a3;
- (NSArray)filters;
- (double)primaryCaptureRectAspectRatio;
- (float)portraitLightingEffectStrength;
- (float)simulatedAperture;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (id)description;
- (int)sinkType;
- (int64_t)primaryCaptureRectUniqueID;
- (void)dealloc;
- (void)setDepthDataDeliveryEnabled:(BOOL)a3;
- (void)setFilterRenderingEnabled:(BOOL)a3;
- (void)setFilters:(id)a3;
- (void)setPortraitAutoSuggestEnabled:(BOOL)a3;
- (void)setPortraitLightingEffectStrength:(float)a3;
- (void)setPrimaryCaptureRectAspectRatio:(double)a3;
- (void)setPrimaryCaptureRectCenter:(CGPoint)a3;
- (void)setPrimaryCaptureRectModificationEnabled:(BOOL)a3;
- (void)setPrimaryCaptureRectUniqueID:(int64_t)a3;
- (void)setSemanticStyle:(id)a3;
- (void)setSemanticStyleRenderingEnabled:(BOOL)a3;
- (void)setSimulatedAperture:(float)a3;
- (void)setZoomPIPOverlayEnabled:(BOOL)a3;
@end

@implementation FigCaptureVideoPreviewSinkConfiguration

- (int)sinkType
{
  return 1;
}

- (BOOL)portraitAutoSuggestEnabled
{
  return self->_portraitAutoSuggestEnabled;
}

- (id)description
{
  v14 = BWCIFilterArrayDescription(self->_filters);
  float simulatedAperture = self->_simulatedAperture;
  if (simulatedAperture <= 0.0) {
    v4 = &stru_1EFA403E0;
  }
  else {
    v4 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @" simulated aperture: %.1f", simulatedAperture);
  }
  uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @" Portrait Lighting effect strength: %.1f", self->_portraitLightingEffectStrength);
  if (self->_semanticStyleRenderingEnabled)
  {
    v6 = NSString;
    semanticStyle = self->_semanticStyle;
    if (semanticStyle) {
      v8 = [(FigCaptureSemanticStyle *)semanticStyle debugDescription];
    }
    else {
      v8 = @"None";
    }
    v9 = (__CFString *)[v6 stringWithFormat:@", Semantic Style:{%@}", v8];
  }
  else
  {
    v9 = &stru_1EFA403E0;
  }
  uint64_t v10 = [NSString stringWithFormat:@" PrimaryCaptureRectModification:%d, Aspect:%.3f:1, Center:%.3f %.3f, UniqueID:%lld", self->_primaryCaptureRectModificationEnabled, *(void *)&self->_primaryCaptureRectAspectRatio, *(void *)&self->_primaryCaptureRectCenter.x, *(void *)&self->_primaryCaptureRectCenter.y, self->_primaryCaptureRectUniqueID];
  uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @" ZoomPIP:%d", self->_zoomPIPOverlayEnabled);
  uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @" PortraitAutoSuggest:%d", self->_portraitAutoSuggestEnabled);
  v15.receiver = self;
  v15.super_class = (Class)FigCaptureVideoPreviewSinkConfiguration;
  return (id)[NSString stringWithFormat:@"%@ depth:%d filters:%d [%@]%@%@%@%@%@%@", -[FigCaptureSinkConfiguration description](&v15, sel_description), -[FigCaptureVideoPreviewSinkConfiguration depthDataDeliveryEnabled](self, "depthDataDeliveryEnabled"), -[FigCaptureVideoPreviewSinkConfiguration filterRenderingEnabled](self, "filterRenderingEnabled"), v14, v4, v5, v9, v10, v11, v12];
}

- (FigCaptureVideoPreviewSinkConfiguration)init
{
  v8.receiver = self;
  v8.super_class = (Class)FigCaptureVideoPreviewSinkConfiguration;
  result = [(FigCaptureVideoPreviewSinkConfiguration *)&v8 init];
  if (result)
  {
    result->_portraitLightingEffectStrength = NAN;
    __asm { FMOV            V0.2D, #0.5 }
    result->_primaryCaptureRectCenter = _Q0;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureVideoPreviewSinkConfiguration;
  [(FigCaptureSinkConfiguration *)&v3 dealloc];
}

- (id)copyXPCEncoding
{
  v15.receiver = self;
  v15.super_class = (Class)FigCaptureVideoPreviewSinkConfiguration;
  id v3 = [(FigCaptureSinkConfiguration *)&v15 copyXPCEncoding];
  xpc_dictionary_set_BOOL(v3, "depthDataDeliveryEnabled", [(FigCaptureVideoPreviewSinkConfiguration *)self depthDataDeliveryEnabled]);
  xpc_dictionary_set_BOOL(v3, "filterRenderingEnabled", [(FigCaptureVideoPreviewSinkConfiguration *)self filterRenderingEnabled]);
  xpc_dictionary_set_BOOL(v3, "portraitAutoSuggestEnabled", [(FigCaptureVideoPreviewSinkConfiguration *)self portraitAutoSuggestEnabled]);
  filters = self->_filters;
  if (filters)
  {
    uint64_t v5 = (void *)csr_serializeObjectUsingNSSecureCoding((uint64_t)filters);
    xpc_object_t v6 = xpc_data_create((const void *)[v5 bytes], objc_msgSend(v5, "length"));
    xpc_dictionary_set_value(v3, "filters", v6);
    xpc_release(v6);
    [(FigCaptureVideoPreviewSinkConfiguration *)self simulatedAperture];
    xpc_dictionary_set_double(v3, "simulatedAperture", v7);
    [(FigCaptureVideoPreviewSinkConfiguration *)self portraitLightingEffectStrength];
    xpc_dictionary_set_double(v3, "portraitLightingEffectStrength", v8);
  }
  xpc_dictionary_set_BOOL(v3, "semanticStyleRenderingEnabled", [(FigCaptureVideoPreviewSinkConfiguration *)self semanticStyleRenderingEnabled]);
  semanticStyle = self->_semanticStyle;
  if (semanticStyle)
  {
    id v10 = [(FigCaptureSemanticStyle *)semanticStyle copyXPCEncoding];
    xpc_dictionary_set_value(v3, "semanticStyle", v10);
    xpc_release(v10);
  }
  xpc_dictionary_set_BOOL(v3, "primaryCaptureRectModificationEnabled", [(FigCaptureVideoPreviewSinkConfiguration *)self primaryCaptureRectModificationEnabled]);
  [(FigCaptureVideoPreviewSinkConfiguration *)self primaryCaptureRectAspectRatio];
  xpc_dictionary_set_double(v3, "primaryCaptureRectAspectRatio", v11);
  [(FigCaptureVideoPreviewSinkConfiguration *)self primaryCaptureRectCenter];
  xpc_dictionary_set_double(v3, "primaryCaptureRectCenterX", v12);
  [(FigCaptureVideoPreviewSinkConfiguration *)self primaryCaptureRectCenter];
  xpc_dictionary_set_double(v3, "primaryCaptureRectCenterY", v13);
  xpc_dictionary_set_int64(v3, "primaryCaptureRectUniqueID", [(FigCaptureVideoPreviewSinkConfiguration *)self primaryCaptureRectUniqueID]);
  xpc_dictionary_set_BOOL(v3, "zoomPIPOverlayEnabled", [(FigCaptureVideoPreviewSinkConfiguration *)self zoomPIPOverlayEnabled]);
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FigCaptureVideoPreviewSinkConfiguration;
  id v4 = [(FigCaptureSinkConfiguration *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setDepthDataDeliveryEnabled:", -[FigCaptureVideoPreviewSinkConfiguration depthDataDeliveryEnabled](self, "depthDataDeliveryEnabled"));
  objc_msgSend(v4, "setFilterRenderingEnabled:", -[FigCaptureVideoPreviewSinkConfiguration filterRenderingEnabled](self, "filterRenderingEnabled"));
  objc_msgSend(v4, "setFilters:", -[FigCaptureVideoPreviewSinkConfiguration filters](self, "filters"));
  [(FigCaptureVideoPreviewSinkConfiguration *)self simulatedAperture];
  objc_msgSend(v4, "setSimulatedAperture:");
  [(FigCaptureVideoPreviewSinkConfiguration *)self portraitLightingEffectStrength];
  objc_msgSend(v4, "setPortraitLightingEffectStrength:");
  objc_msgSend(v4, "setSemanticStyleRenderingEnabled:", -[FigCaptureVideoPreviewSinkConfiguration semanticStyleRenderingEnabled](self, "semanticStyleRenderingEnabled"));
  objc_msgSend(v4, "setSemanticStyle:", -[FigCaptureVideoPreviewSinkConfiguration semanticStyle](self, "semanticStyle"));
  objc_msgSend(v4, "setPrimaryCaptureRectModificationEnabled:", -[FigCaptureVideoPreviewSinkConfiguration primaryCaptureRectModificationEnabled](self, "primaryCaptureRectModificationEnabled"));
  [(FigCaptureVideoPreviewSinkConfiguration *)self primaryCaptureRectAspectRatio];
  objc_msgSend(v4, "setPrimaryCaptureRectAspectRatio:");
  [(FigCaptureVideoPreviewSinkConfiguration *)self primaryCaptureRectCenter];
  objc_msgSend(v4, "setPrimaryCaptureRectCenter:");
  objc_msgSend(v4, "setPrimaryCaptureRectUniqueID:", -[FigCaptureVideoPreviewSinkConfiguration primaryCaptureRectUniqueID](self, "primaryCaptureRectUniqueID"));
  objc_msgSend(v4, "setZoomPIPOverlayEnabled:", -[FigCaptureVideoPreviewSinkConfiguration zoomPIPOverlayEnabled](self, "zoomPIPOverlayEnabled"));
  objc_msgSend(v4, "setPortraitAutoSuggestEnabled:", -[FigCaptureVideoPreviewSinkConfiguration portraitAutoSuggestEnabled](self, "portraitAutoSuggestEnabled"));
  return v4;
}

- (void)setSimulatedAperture:(float)a3
{
  self->_float simulatedAperture = a3;
}

- (void)setSemanticStyle:(id)a3
{
}

- (void)setPrimaryCaptureRectUniqueID:(int64_t)a3
{
  self->_primaryCaptureRectUniqueID = a3;
}

- (void)setPrimaryCaptureRectCenter:(CGPoint)a3
{
  self->_primaryCaptureRectCenter = a3;
}

- (void)setPrimaryCaptureRectAspectRatio:(double)a3
{
  self->_primaryCaptureRectAspectRatio = a3;
}

- (void)setPortraitLightingEffectStrength:(float)a3
{
  self->_portraitLightingEffectStrength = a3;
}

- (void)setFilters:(id)a3
{
}

- (void)setZoomPIPOverlayEnabled:(BOOL)a3
{
  self->_zoomPIPOverlayEnabled = a3;
}

- (void)setSemanticStyleRenderingEnabled:(BOOL)a3
{
  self->_semanticStyleRenderingEnabled = a3;
}

- (void)setPrimaryCaptureRectModificationEnabled:(BOOL)a3
{
  self->_primaryCaptureRectModificationEnabled = a3;
}

- (void)setPortraitAutoSuggestEnabled:(BOOL)a3
{
  self->_portraitAutoSuggestEnabled = a3;
}

- (void)setFilterRenderingEnabled:(BOOL)a3
{
  self->_filterRenderingEnabled = a3;
}

- (void)setDepthDataDeliveryEnabled:(BOOL)a3
{
  self->_depthDataDeliveryEnabled = a3;
}

- (BOOL)isEqual:(id)a3
{
  v31.receiver = self;
  v31.super_class = (Class)FigCaptureVideoPreviewSinkConfiguration;
  unsigned int v5 = -[FigCaptureSinkConfiguration isEqual:](&v31, sel_isEqual_);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_15;
    }
    int v6 = [(FigCaptureVideoPreviewSinkConfiguration *)self depthDataDeliveryEnabled];
    if (v6 != [a3 depthDataDeliveryEnabled]) {
      goto LABEL_15;
    }
    int v7 = [(FigCaptureVideoPreviewSinkConfiguration *)self filterRenderingEnabled];
    if (v7 != [a3 filterRenderingEnabled]) {
      goto LABEL_15;
    }
    float v8 = [(FigCaptureVideoPreviewSinkConfiguration *)self filters];
    if (v8 == (NSArray *)[a3 filters]
      || (unsigned int v5 = -[NSArray isEqual:](-[FigCaptureVideoPreviewSinkConfiguration filters](self, "filters"), "isEqual:", [a3 filters])) != 0)
    {
      [(FigCaptureVideoPreviewSinkConfiguration *)self simulatedAperture];
      float v10 = v9;
      [a3 simulatedAperture];
      if (v10 != v11)
      {
LABEL_15:
        LOBYTE(v5) = 0;
        return v5;
      }
      [(FigCaptureVideoPreviewSinkConfiguration *)self portraitLightingEffectStrength];
      float v13 = v12;
      [a3 portraitLightingEffectStrength];
      if (v13 != v14)
      {
        [(FigCaptureVideoPreviewSinkConfiguration *)self portraitLightingEffectStrength];
        goto LABEL_15;
      }
      int v15 = [(FigCaptureVideoPreviewSinkConfiguration *)self semanticStyleRenderingEnabled];
      if (v15 != [a3 semanticStyleRenderingEnabled]) {
        goto LABEL_15;
      }
      v16 = [(FigCaptureVideoPreviewSinkConfiguration *)self semanticStyle];
      if (v16 == (FigCaptureSemanticStyle *)[a3 semanticStyle]
        || (unsigned int v5 = -[FigCaptureSemanticStyle isEqual:](-[FigCaptureVideoPreviewSinkConfiguration semanticStyle](self, "semanticStyle"), "isEqual:", [a3 semanticStyle])) != 0)
      {
        int v17 = [(FigCaptureVideoPreviewSinkConfiguration *)self primaryCaptureRectModificationEnabled];
        if (v17 != [a3 primaryCaptureRectModificationEnabled]) {
          goto LABEL_15;
        }
        [(FigCaptureVideoPreviewSinkConfiguration *)self primaryCaptureRectAspectRatio];
        double v19 = v18;
        [a3 primaryCaptureRectAspectRatio];
        if (v19 != v20) {
          goto LABEL_15;
        }
        [(FigCaptureVideoPreviewSinkConfiguration *)self primaryCaptureRectCenter];
        double v22 = v21;
        double v24 = v23;
        [a3 primaryCaptureRectCenter];
        LOBYTE(v5) = 0;
        if (v22 == v26 && v24 == v25)
        {
          int64_t v27 = [(FigCaptureVideoPreviewSinkConfiguration *)self primaryCaptureRectUniqueID];
          if (v27 != [a3 primaryCaptureRectUniqueID]) {
            goto LABEL_15;
          }
          int v28 = [(FigCaptureVideoPreviewSinkConfiguration *)self zoomPIPOverlayEnabled];
          if (v28 != [a3 zoomPIPOverlayEnabled]) {
            goto LABEL_15;
          }
          BOOL v29 = [(FigCaptureVideoPreviewSinkConfiguration *)self portraitAutoSuggestEnabled];
          LOBYTE(v5) = v29 ^ [a3 portraitAutoSuggestEnabled] ^ 1;
        }
      }
    }
  }
  return v5;
}

- (BOOL)zoomPIPOverlayEnabled
{
  return self->_zoomPIPOverlayEnabled;
}

- (FigCaptureSemanticStyle)semanticStyle
{
  return self->_semanticStyle;
}

- (BOOL)semanticStyleRenderingEnabled
{
  return self->_semanticStyleRenderingEnabled;
}

- (BOOL)primaryCaptureRectModificationEnabled
{
  return self->_primaryCaptureRectModificationEnabled;
}

- (CGPoint)primaryCaptureRectCenter
{
  double x = self->_primaryCaptureRectCenter.x;
  double y = self->_primaryCaptureRectCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (NSArray)filters
{
  return self->_filters;
}

- (int64_t)primaryCaptureRectUniqueID
{
  return self->_primaryCaptureRectUniqueID;
}

- (double)primaryCaptureRectAspectRatio
{
  return self->_primaryCaptureRectAspectRatio;
}

- (float)simulatedAperture
{
  return self->_simulatedAperture;
}

- (float)portraitLightingEffectStrength
{
  return self->_portraitLightingEffectStrength;
}

- (BOOL)filterRenderingEnabled
{
  return self->_filterRenderingEnabled;
}

- (BOOL)depthDataDeliveryEnabled
{
  return self->_depthDataDeliveryEnabled;
}

- (FigCaptureVideoPreviewSinkConfiguration)initWithXPCEncoding:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)FigCaptureVideoPreviewSinkConfiguration;
  id v4 = -[FigCaptureSinkConfiguration initWithXPCEncoding:](&v18, sel_initWithXPCEncoding_);
  if (v4)
  {
    v4->_depthDataDeliveryEnabled = xpc_dictionary_get_BOOL(a3, "depthDataDeliveryEnabled");
    v4->_filterRenderingEnabled = xpc_dictionary_get_BOOL(a3, "filterRenderingEnabled");
    v4->_portraitAutoSuggestEnabled = xpc_dictionary_get_BOOL(a3, "portraitAutoSuggestEnabled");
    size_t length = 0;
    data = xpc_dictionary_get_data(a3, "filters", &length);
    v4->_portraitLightingEffectStrength = NAN;
    if (data)
    {
      uint64_t v6 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:data length:length freeWhenDone:0];
      int v7 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
      float v10 = (NSArray *)(id)fcsc_deserializeDataUsingNSSecureCoding(v6, v9);
      v4->_filters = v10;
      if (!v10)
      {

        return 0;
      }
      float v11 = xpc_dictionary_get_double(a3, "simulatedAperture");
      v4->_float simulatedAperture = v11;
      float v12 = xpc_dictionary_get_double(a3, "portraitLightingEffectStrength");
      v4->_portraitLightingEffectStrength = v12;
    }
    v4->_semanticStyleRenderingEnabled = xpc_dictionary_get_BOOL(a3, "semanticStyleRenderingEnabled");
    dictionardouble y = xpc_dictionary_get_dictionary(a3, "semanticStyle");
    if (dictionary) {
      v4->_semanticStyle = [[FigCaptureSemanticStyle alloc] initWithXPCEncoding:dictionary];
    }
    v4->_primaryCaptureRectModificationEnabled = xpc_dictionary_get_BOOL(a3, "primaryCaptureRectModificationEnabled");
    v4->_primaryCaptureRectAspectRatio = xpc_dictionary_get_double(a3, "primaryCaptureRectAspectRatio");
    double v14 = xpc_dictionary_get_double(a3, "primaryCaptureRectCenterX");
    double v15 = xpc_dictionary_get_double(a3, "primaryCaptureRectCenterY");
    v4->_primaryCaptureRectCenter.double x = v14;
    v4->_primaryCaptureRectCenter.double y = v15;
    v4->_primaryCaptureRectUniqueID = xpc_dictionary_get_int64(a3, "primaryCaptureRectUniqueID");
    v4->_zoomPIPOverlayEnabled = xpc_dictionary_get_BOOL(a3, "zoomPIPOverlayEnabled");
  }
  return v4;
}

@end