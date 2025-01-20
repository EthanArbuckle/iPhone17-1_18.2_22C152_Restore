@interface CVAFeatureBuffer
+ (BOOL)supportsSecureCoding;
+ (id)classes;
+ (id)streamName:(id)a3;
- (BOOL)compressed;
- (BOOL)reduce;
- (BOOL)shouldReduce:(void *)a3;
- (CVAFeatureBuffer)initWithCoder:(id)a3;
- (CVAFeatureBuffer)initWithPixelBufferRef:(__CVBuffer *)a3 timestamp:(double)a4 streamID:(id)a5;
- (CVAFeatureBuffer)initWithPixelBufferRef:(__CVBuffer *)a3 timestamp:(double)a4 streamID:(id)a5 reduce:(BOOL)a6 compress:(BOOL)a7;
- (NSData)data;
- (NSDictionary)attachments;
- (NSString)sourceStreamID;
- (__CVBuffer)getPixelBuffer;
- (__CVBuffer)getPixelBuffer:(BOOL)a3;
- (__CVBuffer)getPixelBufferCopy;
- (__CVBuffer)pixelBufferRef;
- (double)timestamp;
- (id)debugDescription;
- (id)dictionary;
- (id)reduceBuffer:(void *)a3;
- (unint64_t)bytesPerRow;
- (unint64_t)frameId;
- (unint64_t)height;
- (unint64_t)original_width;
- (unint64_t)syncTimestamp;
- (unint64_t)width;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setBytesPerRow:(unint64_t)a3;
- (void)setCompressed:(BOOL)a3;
- (void)setData:(id)a3;
- (void)setFrameId:(unint64_t)a3;
- (void)setHeight:(unint64_t)a3;
- (void)setOriginal_width:(unint64_t)a3;
- (void)setPixelBufferRef:(__CVBuffer *)a3;
- (void)setReduce:(BOOL)a3;
- (void)setSourceStreamID:(id)a3;
- (void)setSyncTimestamp:(unint64_t)a3;
- (void)setTimestamp:(double)a3;
- (void)setWidth:(unint64_t)a3;
@end

@implementation CVAFeatureBuffer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classes
{
  if (qword_267C58B48 == -1)
  {
    v2 = (void *)qword_267C58B40;
  }
  else
  {
    dispatch_once(&qword_267C58B48, &unk_26CB5E278);
    v2 = (void *)qword_267C58B40;
  }
  return v2;
}

- (BOOL)shouldReduce:(void *)a3
{
  v3 = (char *)a3 + *((unsigned int *)a3 + 12);
  return !*((_WORD *)v3 + 1) || v3[84] == 1;
}

- (id)reduceBuffer:(void *)a3
{
  size_t v3 = *((unsigned int *)a3 + 13);
  if (v3 <= 0xF4240)
  {
    uint64_t v6 = *((unsigned int *)a3 + 10);
    uint64_t v7 = *((unsigned int *)a3 + 12);
    id v4 = [MEMORY[0x263EFF990] dataWithLength:(v6 + v3)];
    uint64_t v8 = [v4 mutableBytes];
    long long v9 = *(_OWORD *)a3;
    uint64_t v10 = *((void *)a3 + 6);
    long long v11 = *((_OWORD *)a3 + 2);
    *(_OWORD *)(v8 + 16) = *((_OWORD *)a3 + 1);
    *(_OWORD *)(v8 + 32) = v11;
    *(void *)(v8 + 48) = v10;
    *(_OWORD *)uint64_t v8 = v9;
    *(void *)(v8 + 40) = v6;
    *(_DWORD *)(v8 + 48) = v6;
    *(_DWORD *)(v8 + 52) = v3;
    memcpy((void *)(v8 + v6), (char *)a3 + v7, v3);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (CVAFeatureBuffer)initWithPixelBufferRef:(__CVBuffer *)a3 timestamp:(double)a4 streamID:(id)a5
{
  return [(CVAFeatureBuffer *)self initWithPixelBufferRef:a3 timestamp:a5 streamID:1 reduce:1 compress:a4];
}

- (CVAFeatureBuffer)initWithPixelBufferRef:(__CVBuffer *)a3 timestamp:(double)a4 streamID:(id)a5 reduce:(BOOL)a6 compress:(BOOL)a7
{
  id v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CVAFeatureBuffer;
  v14 = [(CVAFeatureBuffer *)&v19 init];
  v15 = v14;
  if (v14)
  {
    v14->_pixelBufferRef = a3;
    v14->_timestamp = a4;
    objc_storeStrong((id *)&v14->_sourceStreamID, a5);
    v15->_reduce = a6;
    v15->_compressed = a7;
    CVPixelBufferRetain(v15->_pixelBufferRef);
    CFDictionaryRef v16 = CVBufferCopyAttachments(v15->_pixelBufferRef, kCVAttachmentMode_ShouldPropagate);
    attachments = v15->_attachments;
    v15->_attachments = (NSDictionary *)v16;
  }
  return v15;
}

- (__CVBuffer)getPixelBuffer:(BOOL)a3
{
  CVBufferRef buffer = 0;
  unint64_t width = self->_width;
  if (a3)
  {
    self->_original_unint64_t width = width;
    unint64_t width = self->_bytesPerRow;
    self->_unint64_t width = width;
  }
  CVReturn v5 = CVPixelBufferCreateWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB08], width, self->_height, 0x4C303038u, (void *)[(NSData *)self->_data bytes], self->_bytesPerRow, 0, 0, 0, &buffer);
  result = 0;
  if (!v5)
  {
    attachments = self->_attachments;
    if (attachments) {
      CVBufferSetAttachments(buffer, (CFDictionaryRef)attachments, kCVAttachmentMode_ShouldPropagate);
    }
    return buffer;
  }
  return result;
}

- (__CVBuffer)getPixelBuffer
{
  return (__CVBuffer *)MEMORY[0x270F9A6D0](self, sel_getPixelBuffer_);
}

- (__CVBuffer)getPixelBufferCopy
{
  if ((self->_bytesPerRow & 0x3F) != 0)
  {
    NSLog(&cfstr_MovkitCvafeatu.isa, a2, self->_bytesPerRow);
    return 0;
  }
  CVReturn v5 = (__CVBuffer *)objc_msgSend(MEMORY[0x263F535D0], "createRawPixelBufferWithWidth:height:pixelFormat:bytesPerRow:", LODWORD(self->_width), LODWORD(self->_height), 1278226488);
  v2 = v5;
  if (!v5) {
    return v2;
  }
  CVPixelBufferLockBaseAddress(v5, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(v2);
  memcpy(BaseAddress, [(NSData *)self->_data bytes], [(NSData *)self->_data length]);
  CVPixelBufferUnlockBaseAddress(v2, 0);
  return v2;
}

- (CVAFeatureBuffer)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CVAFeatureBuffer;
  CVReturn v5 = [(CVAFeatureBuffer *)&v23 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x21D490BF0]();
    v5->_unint64_t width = [v4 decodeIntegerForKey:@"w"];
    v5->_height = [v4 decodeIntegerForKey:@"h"];
    v5->_bytesPerRow = [v4 decodeIntegerForKey:@"bpr"];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"d"];
    data = v5->_data;
    v5->_data = (NSData *)v7;

    uint64_t v9 = [v4 decodeObjectForKey:@"a"];
    attachments = v5->_attachments;
    v5->_attachments = (NSDictionary *)v9;

    [v4 decodeDoubleForKey:@"t"];
    v5->_timestamp = v11;
    v5->_syncTimestamp = [v4 decodeInt64ForKey:@"sct"];
    v5->_frameId = [v4 decodeInt64ForKey:@"fi"];
    uint64_t v12 = [v4 decodeObjectForKey:@"st"];
    sourceStreamID = v5->_sourceStreamID;
    v5->_sourceStreamID = (NSString *)v12;

    int v14 = [v4 decodeBoolForKey:@"c"];
    v5->_compressed = v14;
    if (v14)
    {
      v15 = v5->_data;
      id v22 = 0;
      CFDictionaryRef v16 = [(NSData *)v15 decompressedDataUsingAlgorithm:1 error:&v22];
      id v17 = v22;
      v18 = v17;
      if (v17)
      {
        objc_super v19 = [v17 description];
        NSLog(&cfstr_Cvafeaturebuff.isa, v19);
      }
      else
      {
        v20 = v16;
        objc_super v19 = v5->_data;
        v5->_data = v20;
      }
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  CVReturn v5 = (void *)MEMORY[0x21D490BF0]();
  CVPixelBufferLockBaseAddress(self->_pixelBufferRef, 1uLL);
  BaseAddress = CVPixelBufferGetBaseAddress(self->_pixelBufferRef);
  if (!self->_reduce || ![(CVAFeatureBuffer *)self shouldReduce:BaseAddress])
  {
    uint64_t v7 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:BaseAddress length:CVPixelBufferGetDataSize(self->_pixelBufferRef) freeWhenDone:0];
    if (!v7) {
      goto LABEL_4;
    }
LABEL_6:
    self->_unint64_t width = CVPixelBufferGetWidth(self->_pixelBufferRef);
    self->_height = CVPixelBufferGetHeight(self->_pixelBufferRef);
    self->_bytesPerRow = CVPixelBufferGetBytesPerRow(self->_pixelBufferRef);
    if (self->_compressed)
    {
      id v12 = 0;
      uint64_t v8 = [v7 compressedDataUsingAlgorithm:1 error:&v12];
      id v9 = v12;
      data = self->_data;
      self->_data = v8;

      if (v9)
      {
        double v11 = [v9 description];
        NSLog(&cfstr_Cvafeaturebuff.isa, v11);

        goto LABEL_11;
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_data, v7);
    }
    [v4 encodeInteger:self->_width forKey:@"w"];
    [v4 encodeInteger:self->_height forKey:@"h"];
    [v4 encodeInteger:self->_bytesPerRow forKey:@"bpr"];
    [v4 encodeObject:self->_data forKey:@"d"];
    [v4 encodeDouble:@"t" forKey:self->_timestamp];
    [v4 encodeInt64:self->_syncTimestamp forKey:@"sct"];
    [v4 encodeObject:self->_sourceStreamID forKey:@"st"];
    [v4 encodeBool:self->_compressed forKey:@"c"];
    [v4 encodeInt64:self->_frameId forKey:@"fi"];
    [v4 encodeObject:self->_attachments forKey:@"a"];
    goto LABEL_11;
  }
  uint64_t v7 = [(CVAFeatureBuffer *)self reduceBuffer:BaseAddress];
  if (v7) {
    goto LABEL_6;
  }
LABEL_4:
  NSLog(&cfstr_Cvafeaturebuff_0.isa);
LABEL_11:
  CVPixelBufferUnlockBaseAddress(self->_pixelBufferRef, 1uLL);
  CVPixelBufferRelease(self->_pixelBufferRef);
  self->_pixelBufferRef = 0;
}

- (void)dealloc
{
  pixelBufferRef = self->_pixelBufferRef;
  if (pixelBufferRef)
  {
    CVPixelBufferRelease(pixelBufferRef);
    self->_pixelBufferRef = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CVAFeatureBuffer;
  [(CVAFeatureBuffer *)&v4 dealloc];
}

+ (id)streamName:(id)a3
{
  if (a3)
  {
    size_t v3 = [NSString stringWithFormat:@"com.apple.reality.kind.data.%@.desgen", a3];
  }
  else
  {
    size_t v3 = @"CVAFeatureBuffer";
  }
  return v3;
}

- (id)dictionary
{
  v15[10] = *MEMORY[0x263EF8340];
  v14[0] = @"w";
  size_t v3 = [NSNumber numberWithUnsignedLong:self->_width];
  v15[0] = v3;
  v14[1] = @"h";
  objc_super v4 = [NSNumber numberWithUnsignedLong:self->_height];
  v15[1] = v4;
  v14[2] = @"bpr";
  CVReturn v5 = [NSNumber numberWithUnsignedLong:self->_bytesPerRow];
  data = self->_data;
  v15[2] = v5;
  v15[3] = data;
  v14[3] = @"d";
  v14[4] = @"a";
  v15[4] = self->_attachments;
  v14[5] = @"t";
  uint64_t v7 = [NSNumber numberWithDouble:self->_timestamp];
  v15[5] = v7;
  v14[6] = @"sct";
  uint64_t v8 = [NSNumber numberWithUnsignedLongLong:self->_syncTimestamp];
  sourceStreamID = self->_sourceStreamID;
  v15[6] = v8;
  v15[7] = sourceStreamID;
  v14[7] = @"st";
  v14[8] = @"c";
  uint64_t v10 = [NSNumber numberWithBool:self->_compressed];
  v15[8] = v10;
  v14[9] = @"fi";
  double v11 = [NSNumber numberWithUnsignedLongLong:self->_frameId];
  v15[9] = v11;
  id v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:10];

  return v12;
}

- (id)debugDescription
{
  size_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  CVReturn v5 = [(CVAFeatureBuffer *)self dictionary];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %@>", v4, v5];

  return v6;
}

- (unint64_t)width
{
  return self->_width;
}

- (void)setWidth:(unint64_t)a3
{
  self->_unint64_t width = a3;
}

- (unint64_t)height
{
  return self->_height;
}

- (void)setHeight:(unint64_t)a3
{
  self->_height = a3;
}

- (unint64_t)bytesPerRow
{
  return self->_bytesPerRow;
}

- (void)setBytesPerRow:(unint64_t)a3
{
  self->_bytesPerRow = a3;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (unint64_t)syncTimestamp
{
  return self->_syncTimestamp;
}

- (void)setSyncTimestamp:(unint64_t)a3
{
  self->_syncTimestamp = a3;
}

- (NSString)sourceStreamID
{
  return self->_sourceStreamID;
}

- (void)setSourceStreamID:(id)a3
{
}

- (unint64_t)frameId
{
  return self->_frameId;
}

- (void)setFrameId:(unint64_t)a3
{
  self->_frameId = a3;
}

- (unint64_t)original_width
{
  return self->_original_width;
}

- (void)setOriginal_width:(unint64_t)a3
{
  self->_original_unint64_t width = a3;
}

- (BOOL)compressed
{
  return self->_compressed;
}

- (void)setCompressed:(BOOL)a3
{
  self->_compressed = a3;
}

- (BOOL)reduce
{
  return self->_reduce;
}

- (void)setReduce:(BOOL)a3
{
  self->_reduce = a3;
}

- (__CVBuffer)pixelBufferRef
{
  return self->_pixelBufferRef;
}

- (void)setPixelBufferRef:(__CVBuffer *)a3
{
  self->_pixelBufferRef = a3;
}

- (NSDictionary)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_sourceStreamID, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end