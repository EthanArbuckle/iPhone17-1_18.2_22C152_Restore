@interface IMTranscoderTelemetry
- (IMTranscoderTelemetry)init;
- (int64_t)_telemetryImageTypeForUTI:(id)a3;
- (void)_emitSignpostPreviewGenerationRange:(int64_t)a3 begin:(BOOL)a4;
- (void)_emitSignpostTranscodeRange:(int64_t)a3 begin:(BOOL)a4;
- (void)emitPreviewGenerationBeginFromUTI:(id)a3;
- (void)emitPreviewGenerationEndFromUTI:(id)a3;
- (void)emitSignpostNoTranscodeFromUTI:(id)a3;
- (void)emitSignpostTranscodeFinalForDestinationUTI:(id)a3;
- (void)emitSignpostTranscodeSkipSourceUTI:(id)a3;
- (void)emitSignpostTranscodeStepForDestinationUTI:(id)a3;
- (void)emitTranscodeBeginFromUTI:(id)a3;
- (void)emitTranscodeEndFromUTI:(id)a3;
@end

@implementation IMTranscoderTelemetry

- (IMTranscoderTelemetry)init
{
  v5.receiver = self;
  v5.super_class = (Class)IMTranscoderTelemetry;
  v2 = [(IMTranscoderTelemetry *)&v5 init];
  v3 = _iMessageTelemetryLogHandle();
  v2->_signpostId = os_signpost_id_generate(v3);
  return v2;
}

- (int64_t)_telemetryImageTypeForUTI:(id)a3
{
  if (UTTypeConformsTo((CFStringRef)a3, (CFStringRef)*MEMORY[0x263F01A80])) {
    return 1;
  }
  if (UTTypeConformsTo((CFStringRef)a3, @"public.heif-standard")) {
    return 2;
  }
  if (UTTypeConformsTo((CFStringRef)a3, (CFStringRef)*MEMORY[0x263F01AE0])) {
    return 3;
  }
  return 4 * (UTTypeConformsTo((CFStringRef)a3, (CFStringRef)*MEMORY[0x263F01A40]) != 0);
}

- (void)emitTranscodeBeginFromUTI:(id)a3
{
  uint64_t v8 = objc_msgSend__telemetryImageTypeForUTI_(self, a2, (uint64_t)a3, v3, v4, v5, v6);
  MEMORY[0x270F9A6D0](self, sel__emitSignpostTranscodeRange_begin_, v8, 1, v9, v10, v11);
}

- (void)emitTranscodeEndFromUTI:(id)a3
{
  uint64_t v8 = objc_msgSend__telemetryImageTypeForUTI_(self, a2, (uint64_t)a3, v3, v4, v5, v6);
  MEMORY[0x270F9A6D0](self, sel__emitSignpostTranscodeRange_begin_, v8, 0, v9, v10, v11);
}

- (void)emitPreviewGenerationBeginFromUTI:(id)a3
{
  uint64_t v8 = objc_msgSend__telemetryImageTypeForUTI_(self, a2, (uint64_t)a3, v3, v4, v5, v6);
  MEMORY[0x270F9A6D0](self, sel__emitSignpostPreviewGenerationRange_begin_, v8, 1, v9, v10, v11);
}

- (void)emitPreviewGenerationEndFromUTI:(id)a3
{
  uint64_t v8 = objc_msgSend__telemetryImageTypeForUTI_(self, a2, (uint64_t)a3, v3, v4, v5, v6);
  MEMORY[0x270F9A6D0](self, sel__emitSignpostPreviewGenerationRange_begin_, v8, 0, v9, v10, v11);
}

- (void)_emitSignpostPreviewGenerationRange:(int64_t)a3 begin:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = _iMessageTelemetryLogHandle();
  if (v4) {
    char v8 = 1;
  }
  else {
    char v8 = 2;
  }
  uint64_t v9 = v7;
  switch(a3)
  {
    case 0:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v7))
      {
        __int16 v18 = 0;
        os_signpost_type_t v11 = v8;
        v12 = "IMTranscoderImage.previewGeneration.type.other";
        v13 = (uint8_t *)&v18;
        goto LABEL_20;
      }
      break;
    case 1:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v7))
      {
        __int16 v17 = 0;
        os_signpost_type_t v11 = v8;
        v12 = "IMTranscoderImage.previewGeneration.type.jpeg";
        v13 = (uint8_t *)&v17;
        goto LABEL_20;
      }
      break;
    case 2:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v7))
      {
        __int16 v16 = 0;
        os_signpost_type_t v11 = v8;
        v12 = "IMTranscoderImage.previewGeneration.type.heif";
        v13 = (uint8_t *)&v16;
        goto LABEL_20;
      }
      break;
    case 3:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v7))
      {
        __int16 v15 = 0;
        os_signpost_type_t v11 = v8;
        v12 = "IMTranscoderImage.previewGeneration.type.png";
        v13 = (uint8_t *)&v15;
        goto LABEL_20;
      }
      break;
    case 4:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v7))
      {
        __int16 v14 = 0;
        os_signpost_type_t v11 = v8;
        v12 = "IMTranscoderImage.previewGeneration.type.gif";
        v13 = (uint8_t *)&v14;
LABEL_20:
        _os_signpost_emit_with_name_impl(&dword_22B280000, v9, v11, signpostId, v12, " enableTelemetry=YES ", v13, 2u);
      }
      break;
    default:
      return;
  }
}

- (void)_emitSignpostTranscodeRange:(int64_t)a3 begin:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = _iMessageTelemetryLogHandle();
  if (v4) {
    char v8 = 1;
  }
  else {
    char v8 = 2;
  }
  uint64_t v9 = v7;
  switch(a3)
  {
    case 0:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v7))
      {
        __int16 v18 = 0;
        os_signpost_type_t v11 = v8;
        v12 = "IMTranscoderImage.transcode.type.other";
        v13 = (uint8_t *)&v18;
        goto LABEL_20;
      }
      break;
    case 1:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v7))
      {
        __int16 v17 = 0;
        os_signpost_type_t v11 = v8;
        v12 = "IMTranscoderImage.transcode.type.jpeg";
        v13 = (uint8_t *)&v17;
        goto LABEL_20;
      }
      break;
    case 2:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v7))
      {
        __int16 v16 = 0;
        os_signpost_type_t v11 = v8;
        v12 = "IMTranscoderImage.transcode.type.heif";
        v13 = (uint8_t *)&v16;
        goto LABEL_20;
      }
      break;
    case 3:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v7))
      {
        __int16 v15 = 0;
        os_signpost_type_t v11 = v8;
        v12 = "IMTranscoderImage.transcode.type.png";
        v13 = (uint8_t *)&v15;
        goto LABEL_20;
      }
      break;
    case 4:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v7))
      {
        __int16 v14 = 0;
        os_signpost_type_t v11 = v8;
        v12 = "IMTranscoderImage.transcode.type.gif";
        v13 = (uint8_t *)&v14;
LABEL_20:
        _os_signpost_emit_with_name_impl(&dword_22B280000, v9, v11, signpostId, v12, " enableTelemetry=YES ", v13, 2u);
      }
      break;
    default:
      return;
  }
}

- (void)emitSignpostNoTranscodeFromUTI:(id)a3
{
  uint64_t v5 = _iMessageTelemetryLogHandle();
  switch(objc_msgSend__telemetryImageTypeForUTI_(self, v6, (uint64_t)a3, v7, v8, v9, v10))
  {
    case 0:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v18 = 0;
        v12 = "IMTranscoderImage.transcode.none.other";
        v13 = (uint8_t *)&v18;
        goto LABEL_17;
      }
      break;
    case 1:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v17 = 0;
        v12 = "IMTranscoderImage.transcode.none.jpeg";
        v13 = (uint8_t *)&v17;
        goto LABEL_17;
      }
      break;
    case 2:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v16 = 0;
        v12 = "IMTranscoderImage.transcode.none.heif";
        v13 = (uint8_t *)&v16;
        goto LABEL_17;
      }
      break;
    case 3:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v15 = 0;
        v12 = "IMTranscoderImage.transcode.none.png";
        v13 = (uint8_t *)&v15;
        goto LABEL_17;
      }
      break;
    case 4:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v14 = 0;
        v12 = "IMTranscoderImage.transcode.none.gif";
        v13 = (uint8_t *)&v14;
LABEL_17:
        _os_signpost_emit_with_name_impl(&dword_22B280000, v5, OS_SIGNPOST_EVENT, signpostId, v12, " enableTelemetry=YES ", v13, 2u);
      }
      break;
    default:
      return;
  }
}

- (void)emitSignpostTranscodeStepForDestinationUTI:(id)a3
{
  uint64_t v5 = _iMessageTelemetryLogHandle();
  switch(objc_msgSend__telemetryImageTypeForUTI_(self, v6, (uint64_t)a3, v7, v8, v9, v10))
  {
    case 0:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v18 = 0;
        v12 = "IMTranscoderImage.transcode.step.other";
        v13 = (uint8_t *)&v18;
        goto LABEL_17;
      }
      break;
    case 1:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v17 = 0;
        v12 = "IMTranscoderImage.transcode.step.jpeg";
        v13 = (uint8_t *)&v17;
        goto LABEL_17;
      }
      break;
    case 2:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v16 = 0;
        v12 = "IMTranscoderImage.transcode.step.heif";
        v13 = (uint8_t *)&v16;
        goto LABEL_17;
      }
      break;
    case 3:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v15 = 0;
        v12 = "IMTranscoderImage.transcode.step.png";
        v13 = (uint8_t *)&v15;
        goto LABEL_17;
      }
      break;
    case 4:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v14 = 0;
        v12 = "IMTranscoderImage.transcode.step.gif";
        v13 = (uint8_t *)&v14;
LABEL_17:
        _os_signpost_emit_with_name_impl(&dword_22B280000, v5, OS_SIGNPOST_EVENT, signpostId, v12, " enableTelemetry=YES ", v13, 2u);
      }
      break;
    default:
      return;
  }
}

- (void)emitSignpostTranscodeFinalForDestinationUTI:(id)a3
{
  uint64_t v5 = _iMessageTelemetryLogHandle();
  switch(objc_msgSend__telemetryImageTypeForUTI_(self, v6, (uint64_t)a3, v7, v8, v9, v10))
  {
    case 0:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v18 = 0;
        v12 = "IMTranscoderImage.transcode.final.other";
        v13 = (uint8_t *)&v18;
        goto LABEL_17;
      }
      break;
    case 1:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v17 = 0;
        v12 = "IMTranscoderImage.transcode.final.jpeg";
        v13 = (uint8_t *)&v17;
        goto LABEL_17;
      }
      break;
    case 2:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v16 = 0;
        v12 = "IMTranscoderImage.transcode.final.heif";
        v13 = (uint8_t *)&v16;
        goto LABEL_17;
      }
      break;
    case 3:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v15 = 0;
        v12 = "IMTranscoderImage.transcode.final.png";
        v13 = (uint8_t *)&v15;
        goto LABEL_17;
      }
      break;
    case 4:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v14 = 0;
        v12 = "IMTranscoderImage.transcode.final.gif";
        v13 = (uint8_t *)&v14;
LABEL_17:
        _os_signpost_emit_with_name_impl(&dword_22B280000, v5, OS_SIGNPOST_EVENT, signpostId, v12, " enableTelemetry=YES ", v13, 2u);
      }
      break;
    default:
      return;
  }
}

- (void)emitSignpostTranscodeSkipSourceUTI:(id)a3
{
  uint64_t v5 = _iMessageTelemetryLogHandle();
  switch(objc_msgSend__telemetryImageTypeForUTI_(self, v6, (uint64_t)a3, v7, v8, v9, v10))
  {
    case 0:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v18 = 0;
        v12 = "IMTranscoderImage.transcode.skip.other";
        v13 = (uint8_t *)&v18;
        goto LABEL_17;
      }
      break;
    case 1:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v17 = 0;
        v12 = "IMTranscoderImage.transcode.skip.jpeg";
        v13 = (uint8_t *)&v17;
        goto LABEL_17;
      }
      break;
    case 2:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v16 = 0;
        v12 = "IMTranscoderImage.transcode.skip.heif";
        v13 = (uint8_t *)&v16;
        goto LABEL_17;
      }
      break;
    case 3:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v15 = 0;
        v12 = "IMTranscoderImage.transcode.skip.png";
        v13 = (uint8_t *)&v15;
        goto LABEL_17;
      }
      break;
    case 4:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v14 = 0;
        v12 = "IMTranscoderImage.transcode.skip.gif";
        v13 = (uint8_t *)&v14;
LABEL_17:
        _os_signpost_emit_with_name_impl(&dword_22B280000, v5, OS_SIGNPOST_EVENT, signpostId, v12, " enableTelemetry=YES ", v13, 2u);
      }
      break;
    default:
      return;
  }
}

@end