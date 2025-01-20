@interface FigMetadataObjectCaptureConnectionConfiguration
- (BOOL)attachMetadataToVideoBuffers;
- (BOOL)attentionDetectionEnabled;
- (BOOL)emitsEmptyObjectDetectionMetadata;
- (BOOL)faceTrackingPlusEnabled;
- (BOOL)faceTrackingUsesFaceRecognition;
- (BOOL)isEqual:(id)a3;
- (CGRect)metadataRectOfInterest;
- (FigMetadataObjectCaptureConnectionConfiguration)initWithXPCEncoding:(id)a3;
- (NSArray)metadataIdentifiers;
- (float)faceTrackingFailureFieldOfViewModifier;
- (float)faceTrackingNetworkFailureThresholdMultiplier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (id)description;
- (int)faceTrackingMaxFaces;
- (void)dealloc;
- (void)setAttachMetadataToVideoBuffers:(BOOL)a3;
- (void)setAttentionDetectionEnabled:(BOOL)a3;
- (void)setEmitsEmptyObjectDetectionMetadata:(BOOL)a3;
- (void)setFaceTrackingFailureFieldOfViewModifier:(float)a3;
- (void)setFaceTrackingMaxFaces:(int)a3;
- (void)setFaceTrackingNetworkFailureThresholdMultiplier:(float)a3;
- (void)setFaceTrackingPlusEnabled:(BOOL)a3;
- (void)setFaceTrackingUsesFaceRecognition:(BOOL)a3;
- (void)setMetadataIdentifiers:(id)a3;
- (void)setMetadataRectOfInterest:(CGRect)a3;
@end

@implementation FigMetadataObjectCaptureConnectionConfiguration

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigMetadataObjectCaptureConnectionConfiguration;
  [(FigCaptureConnectionConfiguration *)&v3 dealloc];
}

- (id)copyXPCEncoding
{
  v6.receiver = self;
  v6.super_class = (Class)FigMetadataObjectCaptureConnectionConfiguration;
  id v3 = [(FigCaptureConnectionConfiguration *)&v6 copyXPCEncoding];
  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(self->_metadataRectOfInterest);
  FigXPCMessageSetCFArray();
  FigXPCMessageSetCFDictionary();
  xpc_dictionary_set_int64(v3, "faceTrackingMaxFaces", self->_faceTrackingMaxFaces);
  xpc_dictionary_set_BOOL(v3, "faceTrackingUsesFaceRecognition", self->_faceTrackingUsesFaceRecognition);
  xpc_dictionary_set_BOOL(v3, "faceTrackingPlusEnabled", self->_faceTrackingPlusEnabled);
  xpc_dictionary_set_double(v3, "faceTrackingNetworkFailureThresholdMultiplier", self->_faceTrackingNetworkFailureThresholdMultiplier);
  xpc_dictionary_set_double(v3, "faceTrackingFailureFieldOfViewModifier", self->_faceTrackingFailureFieldOfViewModifier);
  xpc_dictionary_set_BOOL(v3, "attentionDetectionEnabled", self->_attentionDetectionEnabled);
  xpc_dictionary_set_BOOL(v3, "attachMetadataToVideoBuffers", [(FigMetadataObjectCaptureConnectionConfiguration *)self attachMetadataToVideoBuffers]);
  xpc_dictionary_set_BOOL(v3, "emitsEmptyObjectDetectionMetadata", [(FigMetadataObjectCaptureConnectionConfiguration *)self emitsEmptyObjectDetectionMetadata]);
  if (DictionaryRepresentation) {
    CFRelease(DictionaryRepresentation);
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v32.receiver = self;
  v32.super_class = (Class)FigMetadataObjectCaptureConnectionConfiguration;
  unsigned int v5 = -[FigCaptureConnectionConfiguration isEqual:](&v32, sel_isEqual_);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_13:
      LOBYTE(v5) = 0;
      return v5;
    }
    objc_super v6 = [(FigMetadataObjectCaptureConnectionConfiguration *)self metadataIdentifiers];
    if (v6 == (NSArray *)[a3 metadataIdentifiers]
      || (unsigned int v5 = -[NSArray isEqual:](-[FigMetadataObjectCaptureConnectionConfiguration metadataIdentifiers](self, "metadataIdentifiers"), "isEqual:", [a3 metadataIdentifiers])) != 0)
    {
      [(FigMetadataObjectCaptureConnectionConfiguration *)self metadataRectOfInterest];
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      [a3 metadataRectOfInterest];
      v34.origin.x = v15;
      v34.origin.y = v16;
      v34.size.width = v17;
      v34.size.height = v18;
      v33.origin.x = v8;
      v33.origin.y = v10;
      v33.size.width = v12;
      v33.size.height = v14;
      unsigned int v5 = CGRectEqualToRect(v33, v34);
      if (v5)
      {
        int v19 = [(FigMetadataObjectCaptureConnectionConfiguration *)self faceTrackingMaxFaces];
        if (v19 != [a3 faceTrackingMaxFaces]) {
          goto LABEL_13;
        }
        int v20 = [(FigMetadataObjectCaptureConnectionConfiguration *)self faceTrackingUsesFaceRecognition];
        if (v20 != [a3 faceTrackingUsesFaceRecognition]) {
          goto LABEL_13;
        }
        int v21 = [(FigMetadataObjectCaptureConnectionConfiguration *)self faceTrackingPlusEnabled];
        if (v21 != [a3 faceTrackingPlusEnabled]) {
          goto LABEL_13;
        }
        [(FigMetadataObjectCaptureConnectionConfiguration *)self faceTrackingNetworkFailureThresholdMultiplier];
        float v23 = v22;
        [a3 faceTrackingNetworkFailureThresholdMultiplier];
        if (v23 != v24) {
          goto LABEL_13;
        }
        [(FigMetadataObjectCaptureConnectionConfiguration *)self faceTrackingFailureFieldOfViewModifier];
        float v26 = v25;
        [a3 faceTrackingFailureFieldOfViewModifier];
        if (v26 != v27) {
          goto LABEL_13;
        }
        int v28 = [(FigMetadataObjectCaptureConnectionConfiguration *)self attentionDetectionEnabled];
        if (v28 != [a3 attentionDetectionEnabled]) {
          goto LABEL_13;
        }
        int v29 = [(FigMetadataObjectCaptureConnectionConfiguration *)self attachMetadataToVideoBuffers];
        if (v29 != [a3 attachMetadataToVideoBuffers]) {
          goto LABEL_13;
        }
        BOOL v30 = [(FigMetadataObjectCaptureConnectionConfiguration *)self emitsEmptyObjectDetectionMetadata];
        LOBYTE(v5) = v30 ^ [a3 emitsEmptyObjectDetectionMetadata] ^ 1;
      }
    }
  }
  return v5;
}

- (id)description
{
  v35[12] = *MEMORY[0x1E4F143B8];
  int v3 = [(FigCaptureConnectionConfiguration *)self underlyingDeviceType];
  if (v3 == [(FigCaptureSourceConfiguration *)[(FigCaptureConnectionConfiguration *)self sourceConfiguration] sourceDeviceType])int v28 = &stru_1EFA403E0; {
  else
  }
    int v28 = (__CFString *)[NSString stringWithFormat:@" (SUB-DEVICE:%@)", +[FigCaptureSourceConfiguration stringForSourceDeviceType:](FigCaptureSourceConfiguration, "stringForSourceDeviceType:", -[FigCaptureConnectionConfiguration underlyingDeviceType](self, "underlyingDeviceType"))];
  v4 = [(FigMetadataObjectCaptureConnectionConfiguration *)self metadataIdentifiers];
  uint64_t v5 = *MEMORY[0x1E4F1F138];
  if ([(NSArray *)v4 containsObject:*MEMORY[0x1E4F1F138]]) {
    float v27 = (__CFString *)[NSString stringWithFormat:@", attention:%d", self->_attentionDetectionEnabled];
  }
  else {
    float v27 = &stru_1EFA403E0;
  }
  uint64_t v6 = *MEMORY[0x1E4F55988];
  v34[0] = v5;
  v34[1] = v6;
  v35[0] = @"face";
  v35[1] = @"head";
  uint64_t v7 = *MEMORY[0x1E4F1F140];
  v34[2] = *MEMORY[0x1E4F55980];
  v34[3] = v7;
  v35[2] = @"hand";
  v35[3] = @"body";
  uint64_t v8 = *MEMORY[0x1E4F1F128];
  v34[4] = *MEMORY[0x1E4F55978];
  v34[5] = v8;
  v35[4] = @"fullBody";
  v35[5] = @"cat";
  uint64_t v9 = *MEMORY[0x1E4F1F130];
  v34[6] = *MEMORY[0x1E4F55968];
  v34[7] = v9;
  v35[6] = @"catHead";
  v35[7] = @"dog";
  uint64_t v10 = *MEMORY[0x1E4F1F148];
  v34[8] = *MEMORY[0x1E4F55970];
  v34[9] = v10;
  v35[8] = @"dogHead";
  v35[9] = @"salientObject";
  uint64_t v11 = *MEMORY[0x1E4F218A8];
  uint64_t v12 = *MEMORY[0x1E4F559D0];
  v34[10] = *MEMORY[0x1E4F218A8];
  v34[11] = v12;
  v35[10] = @"trackedFaces";
  v35[11] = @"eyeRelief";
  double v13 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:12];
  id v14 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  CGFloat v15 = [(FigMetadataObjectCaptureConnectionConfiguration *)self metadataIdentifiers];
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        int v20 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if ([v13 objectForKeyedSubscript:v20]) {
          uint64_t v21 = [v13 objectForKeyedSubscript:v20];
        }
        else {
          uint64_t v21 = (uint64_t)v20;
        }
        [v14 appendString:v21];
        if (v20 != -[NSArray lastObject](-[FigMetadataObjectCaptureConnectionConfiguration metadataIdentifiers](self, "metadataIdentifiers"), "lastObject"))[v14 appendString:@","]; {
      }
        }
      uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v17);
  }
  if ([(NSArray *)[(FigMetadataObjectCaptureConnectionConfiguration *)self metadataIdentifiers] count])
  {
    float v22 = (__CFString *)[NSString stringWithFormat:@", roi:{{%.2f,%.2f}{%.2fx%.2f}}", *(void *)&self->_metadataRectOfInterest.origin.x, *(void *)&self->_metadataRectOfInterest.origin.y, *(void *)&self->_metadataRectOfInterest.size.width, *(void *)&self->_metadataRectOfInterest.size.height];
  }
  else
  {
    float v22 = &stru_1EFA403E0;
  }
  if ([(NSArray *)[(FigMetadataObjectCaptureConnectionConfiguration *)self metadataIdentifiers] count])
  {
    float v23 = (__CFString *)[NSString stringWithFormat:@", attachMetadataToVideoBuffers:%d", self->_attachMetadataToVideoBuffers];
  }
  else
  {
    float v23 = &stru_1EFA403E0;
  }
  if ([(NSArray *)[(FigMetadataObjectCaptureConnectionConfiguration *)self metadataIdentifiers] containsObject:v11])
  {
    float v24 = (__CFString *)[NSString stringWithFormat:@", faceTracking:{MaxFaces:%d, UsesFaceRecognition:%d, Plus:%d, FailureThresholdMultiplier:%.2f, FailureFOVModifier:%.2f}", self->_faceTrackingMaxFaces, self->_faceTrackingUsesFaceRecognition, self->_faceTrackingPlusEnabled, self->_faceTrackingNetworkFailureThresholdMultiplier, self->_faceTrackingFailureFieldOfViewModifier];
  }
  else
  {
    float v24 = &stru_1EFA403E0;
  }
  if ([(NSArray *)[(FigMetadataObjectCaptureConnectionConfiguration *)self metadataIdentifiers] count])
  {
    float v25 = (__CFString *)[NSString stringWithFormat:@", emitsEmptyMetadata:%d", self->_emitsEmptyObjectDetectionMetadata];
  }
  else
  {
    float v25 = &stru_1EFA403E0;
  }
  return (id)[NSString stringWithFormat:@"MOC %p: <%@>%@ -> <%@> E:%d MetadataIdentifiers:{%@}%@%@%@%@%@%@%@%@%@", self, -[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), v28, -[FigCaptureConnectionConfiguration sinkConfiguration](self, "sinkConfiguration"), -[FigCaptureConnectionConfiguration enabled](self, "enabled"), v14, v22, v23, v24, v27, &stru_1EFA403E0, &stru_1EFA403E0, &stru_1EFA403E0, &stru_1EFA403E0, v25];
}

- (NSArray)metadataIdentifiers
{
  return self->_metadataIdentifiers;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FigMetadataObjectCaptureConnectionConfiguration;
  id v4 = [(FigCaptureConnectionConfiguration *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setMetadataIdentifiers:", -[FigMetadataObjectCaptureConnectionConfiguration metadataIdentifiers](self, "metadataIdentifiers"));
  [(FigMetadataObjectCaptureConnectionConfiguration *)self metadataRectOfInterest];
  objc_msgSend(v4, "setMetadataRectOfInterest:");
  objc_msgSend(v4, "setFaceTrackingMaxFaces:", -[FigMetadataObjectCaptureConnectionConfiguration faceTrackingMaxFaces](self, "faceTrackingMaxFaces"));
  objc_msgSend(v4, "setFaceTrackingUsesFaceRecognition:", -[FigMetadataObjectCaptureConnectionConfiguration faceTrackingUsesFaceRecognition](self, "faceTrackingUsesFaceRecognition"));
  objc_msgSend(v4, "setFaceTrackingPlusEnabled:", -[FigMetadataObjectCaptureConnectionConfiguration faceTrackingPlusEnabled](self, "faceTrackingPlusEnabled"));
  [(FigMetadataObjectCaptureConnectionConfiguration *)self faceTrackingNetworkFailureThresholdMultiplier];
  objc_msgSend(v4, "setFaceTrackingNetworkFailureThresholdMultiplier:");
  [(FigMetadataObjectCaptureConnectionConfiguration *)self faceTrackingFailureFieldOfViewModifier];
  objc_msgSend(v4, "setFaceTrackingFailureFieldOfViewModifier:");
  objc_msgSend(v4, "setAttentionDetectionEnabled:", -[FigMetadataObjectCaptureConnectionConfiguration attentionDetectionEnabled](self, "attentionDetectionEnabled"));
  objc_msgSend(v4, "setAttachMetadataToVideoBuffers:", -[FigMetadataObjectCaptureConnectionConfiguration attachMetadataToVideoBuffers](self, "attachMetadataToVideoBuffers"));
  objc_msgSend(v4, "setEmitsEmptyObjectDetectionMetadata:", -[FigMetadataObjectCaptureConnectionConfiguration emitsEmptyObjectDetectionMetadata](self, "emitsEmptyObjectDetectionMetadata"));
  return v4;
}

- (BOOL)attentionDetectionEnabled
{
  return self->_attentionDetectionEnabled;
}

- (void)setMetadataRectOfInterest:(CGRect)a3
{
  self->_metadataRectOfInterest = a3;
}

- (BOOL)attachMetadataToVideoBuffers
{
  return self->_attachMetadataToVideoBuffers;
}

- (CGRect)metadataRectOfInterest
{
  double x = self->_metadataRectOfInterest.origin.x;
  double y = self->_metadataRectOfInterest.origin.y;
  double width = self->_metadataRectOfInterest.size.width;
  double height = self->_metadataRectOfInterest.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)faceTrackingUsesFaceRecognition
{
  return self->_faceTrackingUsesFaceRecognition;
}

- (BOOL)faceTrackingPlusEnabled
{
  return self->_faceTrackingPlusEnabled;
}

- (float)faceTrackingNetworkFailureThresholdMultiplier
{
  return self->_faceTrackingNetworkFailureThresholdMultiplier;
}

- (int)faceTrackingMaxFaces
{
  return self->_faceTrackingMaxFaces;
}

- (float)faceTrackingFailureFieldOfViewModifier
{
  return self->_faceTrackingFailureFieldOfViewModifier;
}

- (void)setMetadataIdentifiers:(id)a3
{
}

- (void)setFaceTrackingUsesFaceRecognition:(BOOL)a3
{
  self->_faceTrackingUsesFaceRecognition = a3;
}

- (void)setFaceTrackingPlusEnabled:(BOOL)a3
{
  self->_faceTrackingPlusEnabled = a3;
}

- (void)setFaceTrackingNetworkFailureThresholdMultiplier:(float)a3
{
  self->_faceTrackingNetworkFailureThresholdMultiplier = a3;
}

- (void)setFaceTrackingMaxFaces:(int)a3
{
  self->_faceTrackingMaxFaces = a3;
}

- (void)setFaceTrackingFailureFieldOfViewModifier:(float)a3
{
  self->_faceTrackingFailureFieldOfViewModifier = a3;
}

- (void)setAttentionDetectionEnabled:(BOOL)a3
{
  self->_attentionDetectionEnabled = a3;
}

- (void)setAttachMetadataToVideoBuffers:(BOOL)a3
{
  self->_attachMetadataToVideoBuffers = a3;
}

- (FigMetadataObjectCaptureConnectionConfiguration)initWithXPCEncoding:(id)a3
{
  if (a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)FigMetadataObjectCaptureConnectionConfiguration;
    id v4 = -[FigCaptureConnectionConfiguration initWithXPCEncoding:](&v8, sel_initWithXPCEncoding_);
    if (v4)
    {
      FigXPCMessageCopyCFArray();
      FigXPCMessageCopyCFDictionary();
      CGRectMakeWithDictionaryRepresentation(0, &v4->_metadataRectOfInterest);
      v4->_faceTrackingMaxFaces = xpc_dictionary_get_int64(a3, "faceTrackingMaxFaces");
      v4->_faceTrackingUsesFaceRecognition = xpc_dictionary_get_BOOL(a3, "faceTrackingUsesFaceRecognition");
      v4->_faceTrackingPlusEnabled = xpc_dictionary_get_BOOL(a3, "faceTrackingPlusEnabled");
      float v5 = xpc_dictionary_get_double(a3, "faceTrackingNetworkFailureThresholdMultiplier");
      v4->_faceTrackingNetworkFailureThresholdMultiplier = v5;
      float v6 = xpc_dictionary_get_double(a3, "faceTrackingFailureFieldOfViewModifier");
      v4->_faceTrackingFailureFieldOfViewModifier = v6;
      v4->_attentionDetectionEnabled = xpc_dictionary_get_BOOL(a3, "attentionDetectionEnabled");
      v4->_attachMetadataToVideoBuffers = xpc_dictionary_get_BOOL(a3, "attachMetadataToVideoBuffers");
      v4->_emitsEmptyObjectDetectionMetadata = xpc_dictionary_get_BOOL(a3, "emitsEmptyObjectDetectionMetadata");
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

- (BOOL)emitsEmptyObjectDetectionMetadata
{
  return self->_emitsEmptyObjectDetectionMetadata;
}

- (void)setEmitsEmptyObjectDetectionMetadata:(BOOL)a3
{
  self->_emitsEmptyObjectDetectionMetadata = a3;
}

@end