@interface BMSiriDictationEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMSiriDictationEvent)initWithAbsoluteTimestamp:(double)a3;
- (BMSiriDictationEvent)initWithAbsoluteTimestamp:(double)a3 recognizedText:(id)a4 correctedText:(id)a5;
- (BMSiriDictationEvent)initWithProto:(id)a3;
- (BMSiriDictationEvent)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)correctedText;
- (NSString)recognizedText;
- (double)absoluteTimestamp;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (unsigned)dataVersion;
@end

@implementation BMSiriDictationEvent

- (BMSiriDictationEvent)initWithAbsoluteTimestamp:(double)a3
{
  return [(BMSiriDictationEvent *)self initWithAbsoluteTimestamp:0 recognizedText:0 correctedText:a3];
}

- (BMSiriDictationEvent)initWithAbsoluteTimestamp:(double)a3 recognizedText:(id)a4 correctedText:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BMSiriDictationEvent;
  v10 = [(BMSiriDictationEvent *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_absoluteTimestamp = a3;
    uint64_t v12 = [v8 copy];
    recognizedText = v11->_recognizedText;
    v11->_recognizedText = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    correctedText = v11->_correctedText;
    v11->_correctedText = (NSString *)v14;
  }
  return v11;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    v7 = (void *)[objc_alloc((Class)a1) initWithProtoData:v6];
  }
  else
  {
    id v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[BMSiriDictationEvent eventWithData:dataVersion:](a4, v8);
    }

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v10[0] = @"absoluteTimeStamp";
  v3 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
  v11[0] = v3;
  v10[1] = @"recognizedText";
  recognizedText = self->_recognizedText;
  v5 = recognizedText;
  if (!recognizedText)
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = v5;
  v10[2] = @"correctedText";
  correctedText = self->_correctedText;
  v7 = correctedText;
  if (!correctedText)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[2] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  if (correctedText)
  {
    if (recognizedText) {
      goto LABEL_7;
    }
  }
  else
  {

    if (recognizedText) {
      goto LABEL_7;
    }
  }

LABEL_7:

  return v8;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(BMSiriDictationEvent *)self jsonDict];
  uint64_t v8 = 0;
  v4 = [v2 dataWithJSONObject:v3 options:1 error:&v8];
  uint64_t v5 = v8;

  if (v5)
  {
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[BMDeviceMetadataEvent json](v6);
    }
  }

  return v4;
}

- (id)encodeAsProto
{
  v2 = [(BMSiriDictationEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMSiriDictationEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BMSiriDictationEvent initWithProto:]((uint64_t)self, v11);
    }

    goto LABEL_7;
  }
  id v5 = v4;
  [v5 absoluteTimestamp];
  double v7 = v6;
  uint64_t v8 = [v5 recognizedText];
  id v9 = [v5 correctedText];

  self = [(BMSiriDictationEvent *)self initWithAbsoluteTimestamp:v8 recognizedText:v9 correctedText:v7];
  v10 = self;
LABEL_8:

  return v10;
}

- (BMSiriDictationEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBSiriDictationEvent alloc] initWithData:v4];

    self = [(BMSiriDictationEvent *)self initWithProto:v5];
    double v6 = self;
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)proto
{
  v3 = objc_opt_new();
  [v3 setAbsoluteTimestamp:self->_absoluteTimestamp];
  [v3 setRecognizedText:self->_recognizedText];
  [v3 setCorrectedText:self->_correctedText];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    double absoluteTimestamp = self->_absoluteTimestamp;
    [v6 absoluteTimestamp];
    if (absoluteTimestamp != v8)
    {
      char v13 = 0;
LABEL_20:

      goto LABEL_21;
    }
    recognizedText = self->_recognizedText;
    v10 = recognizedText;
    if (!recognizedText)
    {
      uint64_t v11 = [v6 recognizedText];
      if (!v11)
      {
        v18 = 0;
        int v12 = 0;
        goto LABEL_12;
      }
      v18 = (void *)v11;
      v10 = self->_recognizedText;
    }
    v3 = [v6 recognizedText];
    if (([v10 isEqualToString:v3] & 1) == 0)
    {

      char v13 = 0;
      goto LABEL_18;
    }
    int v12 = 1;
LABEL_12:
    correctedText = self->_correctedText;
    v15 = correctedText;
    if (!correctedText)
    {
      v10 = [v6 correctedText];
      if (!v10)
      {
        char v13 = 1;
        goto LABEL_23;
      }
      v15 = self->_correctedText;
    }
    v16 = [v6 correctedText];
    char v13 = [(NSString *)v15 isEqualToString:v16];

    if (correctedText)
    {
      if (!v12) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
LABEL_23:

    if ((v12 & 1) == 0)
    {
LABEL_18:
      if (!recognizedText) {

      }
      goto LABEL_20;
    }
LABEL_17:

    goto LABEL_18;
  }
  char v13 = 0;
LABEL_21:

  return v13;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)recognizedText
{
  return self->_recognizedText;
}

- (NSString)correctedText
{
  return self->_correctedText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correctedText, 0);

  objc_storeStrong((id *)&self->_recognizedText, 0);
}

+ (void)eventWithData:(int)a1 dataVersion:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMSiriDictationEvent: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  __int16 v3 = (objc_class *)objc_opt_class();
  int v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_fault_impl(&dword_18E67D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBSiriDictationEvent proto", (uint8_t *)&v5, 0xCu);
}

@end