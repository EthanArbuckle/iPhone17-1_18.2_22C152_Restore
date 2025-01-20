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
  if (UTTypeConformsTo((CFStringRef)a3, (CFStringRef)*MEMORY[0x1E4F22610])) {
    return 1;
  }
  if (UTTypeConformsTo((CFStringRef)a3, @"public.heif-standard")) {
    return 2;
  }
  if (UTTypeConformsTo((CFStringRef)a3, (CFStringRef)*MEMORY[0x1E4F22678])) {
    return 3;
  }
  return 4 * (UTTypeConformsTo((CFStringRef)a3, (CFStringRef)*MEMORY[0x1E4F225D8]) != 0);
}

- (void)emitTranscodeBeginFromUTI:(id)a3
{
  [(IMTranscoderTelemetry *)self _telemetryImageTypeForUTI:a3];

  MEMORY[0x1F4181798](self, sel__emitSignpostTranscodeRange_begin_);
}

- (void)emitTranscodeEndFromUTI:(id)a3
{
  [(IMTranscoderTelemetry *)self _telemetryImageTypeForUTI:a3];

  MEMORY[0x1F4181798](self, sel__emitSignpostTranscodeRange_begin_);
}

- (void)emitPreviewGenerationBeginFromUTI:(id)a3
{
  [(IMTranscoderTelemetry *)self _telemetryImageTypeForUTI:a3];

  MEMORY[0x1F4181798](self, sel__emitSignpostPreviewGenerationRange_begin_);
}

- (void)emitPreviewGenerationEndFromUTI:(id)a3
{
  [(IMTranscoderTelemetry *)self _telemetryImageTypeForUTI:a3];

  MEMORY[0x1F4181798](self, sel__emitSignpostPreviewGenerationRange_begin_);
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
  v9 = v7;
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
        _os_signpost_emit_with_name_impl(&dword_1A0772000, v9, v11, signpostId, v12, " enableTelemetry=YES ", v13, 2u);
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
  v9 = v7;
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
        _os_signpost_emit_with_name_impl(&dword_1A0772000, v9, v11, signpostId, v12, " enableTelemetry=YES ", v13, 2u);
      }
      break;
    default:
      return;
  }
}

- (void)emitSignpostNoTranscodeFromUTI:(id)a3
{
  objc_super v5 = _iMessageTelemetryLogHandle();
  switch([(IMTranscoderTelemetry *)self _telemetryImageTypeForUTI:a3])
  {
    case 0:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v13 = 0;
        v7 = "IMTranscoderImage.transcode.none.other";
        char v8 = (uint8_t *)&v13;
        goto LABEL_17;
      }
      break;
    case 1:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v12 = 0;
        v7 = "IMTranscoderImage.transcode.none.jpeg";
        char v8 = (uint8_t *)&v12;
        goto LABEL_17;
      }
      break;
    case 2:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v11 = 0;
        v7 = "IMTranscoderImage.transcode.none.heif";
        char v8 = (uint8_t *)&v11;
        goto LABEL_17;
      }
      break;
    case 3:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v10 = 0;
        v7 = "IMTranscoderImage.transcode.none.png";
        char v8 = (uint8_t *)&v10;
        goto LABEL_17;
      }
      break;
    case 4:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v9 = 0;
        v7 = "IMTranscoderImage.transcode.none.gif";
        char v8 = (uint8_t *)&v9;
LABEL_17:
        _os_signpost_emit_with_name_impl(&dword_1A0772000, v5, OS_SIGNPOST_EVENT, signpostId, v7, " enableTelemetry=YES ", v8, 2u);
      }
      break;
    default:
      return;
  }
}

- (void)emitSignpostTranscodeStepForDestinationUTI:(id)a3
{
  objc_super v5 = _iMessageTelemetryLogHandle();
  switch([(IMTranscoderTelemetry *)self _telemetryImageTypeForUTI:a3])
  {
    case 0:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v13 = 0;
        v7 = "IMTranscoderImage.transcode.step.other";
        char v8 = (uint8_t *)&v13;
        goto LABEL_17;
      }
      break;
    case 1:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v12 = 0;
        v7 = "IMTranscoderImage.transcode.step.jpeg";
        char v8 = (uint8_t *)&v12;
        goto LABEL_17;
      }
      break;
    case 2:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v11 = 0;
        v7 = "IMTranscoderImage.transcode.step.heif";
        char v8 = (uint8_t *)&v11;
        goto LABEL_17;
      }
      break;
    case 3:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v10 = 0;
        v7 = "IMTranscoderImage.transcode.step.png";
        char v8 = (uint8_t *)&v10;
        goto LABEL_17;
      }
      break;
    case 4:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v9 = 0;
        v7 = "IMTranscoderImage.transcode.step.gif";
        char v8 = (uint8_t *)&v9;
LABEL_17:
        _os_signpost_emit_with_name_impl(&dword_1A0772000, v5, OS_SIGNPOST_EVENT, signpostId, v7, " enableTelemetry=YES ", v8, 2u);
      }
      break;
    default:
      return;
  }
}

- (void)emitSignpostTranscodeFinalForDestinationUTI:(id)a3
{
  objc_super v5 = _iMessageTelemetryLogHandle();
  switch([(IMTranscoderTelemetry *)self _telemetryImageTypeForUTI:a3])
  {
    case 0:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v13 = 0;
        v7 = "IMTranscoderImage.transcode.final.other";
        char v8 = (uint8_t *)&v13;
        goto LABEL_17;
      }
      break;
    case 1:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v12 = 0;
        v7 = "IMTranscoderImage.transcode.final.jpeg";
        char v8 = (uint8_t *)&v12;
        goto LABEL_17;
      }
      break;
    case 2:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v11 = 0;
        v7 = "IMTranscoderImage.transcode.final.heif";
        char v8 = (uint8_t *)&v11;
        goto LABEL_17;
      }
      break;
    case 3:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v10 = 0;
        v7 = "IMTranscoderImage.transcode.final.png";
        char v8 = (uint8_t *)&v10;
        goto LABEL_17;
      }
      break;
    case 4:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v9 = 0;
        v7 = "IMTranscoderImage.transcode.final.gif";
        char v8 = (uint8_t *)&v9;
LABEL_17:
        _os_signpost_emit_with_name_impl(&dword_1A0772000, v5, OS_SIGNPOST_EVENT, signpostId, v7, " enableTelemetry=YES ", v8, 2u);
      }
      break;
    default:
      return;
  }
}

- (void)emitSignpostTranscodeSkipSourceUTI:(id)a3
{
  objc_super v5 = _iMessageTelemetryLogHandle();
  switch([(IMTranscoderTelemetry *)self _telemetryImageTypeForUTI:a3])
  {
    case 0:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v13 = 0;
        v7 = "IMTranscoderImage.transcode.skip.other";
        char v8 = (uint8_t *)&v13;
        goto LABEL_17;
      }
      break;
    case 1:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v12 = 0;
        v7 = "IMTranscoderImage.transcode.skip.jpeg";
        char v8 = (uint8_t *)&v12;
        goto LABEL_17;
      }
      break;
    case 2:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v11 = 0;
        v7 = "IMTranscoderImage.transcode.skip.heif";
        char v8 = (uint8_t *)&v11;
        goto LABEL_17;
      }
      break;
    case 3:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v10 = 0;
        v7 = "IMTranscoderImage.transcode.skip.png";
        char v8 = (uint8_t *)&v10;
        goto LABEL_17;
      }
      break;
    case 4:
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        __int16 v9 = 0;
        v7 = "IMTranscoderImage.transcode.skip.gif";
        char v8 = (uint8_t *)&v9;
LABEL_17:
        _os_signpost_emit_with_name_impl(&dword_1A0772000, v5, OS_SIGNPOST_EVENT, signpostId, v7, " enableTelemetry=YES ", v8, 2u);
      }
      break;
    default:
      return;
  }
}

@end