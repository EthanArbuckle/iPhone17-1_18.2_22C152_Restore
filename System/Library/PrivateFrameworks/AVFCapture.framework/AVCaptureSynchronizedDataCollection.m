@interface AVCaptureSynchronizedDataCollection
+ (id)_shortStringForDataDroppedReason:(int64_t)a3;
+ (id)_shortStringForDataOutput:(id)a3 syncedData:(id)a4;
+ (id)_shortStringForMetadataObjects:(id)a3;
+ (void)initialize;
- (AVCaptureSynchronizedData)objectForKeyedSubscript:(AVCaptureOutput *)key;
- (NSUInteger)count;
- (id)_initWithPossibleDataOutputs:(id)a3;
- (id)debugDescription;
- (id)description;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)_setSynchronizedData:(id)a3 forCaptureOutput:(id)a4;
- (void)dealloc;
@end

@implementation AVCaptureSynchronizedDataCollection

+ (void)initialize
{
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal)
  {
    if (internal->count >= 1)
    {
      uint64_t v4 = 0;
      do
      {

        internal = self->_internal;
      }
      while (v4 < internal->count);
    }
    free(internal->dataOutputs);
    free(self->_internal->synchronizedData);
  }
  v5.receiver = self;
  v5.super_class = (Class)AVCaptureSynchronizedDataCollection;
  [(AVCaptureSynchronizedDataCollection *)&v5 dealloc];
}

- (AVCaptureSynchronizedData)objectForKeyedSubscript:(AVCaptureOutput *)key
{
  internal = self->_internal;
  if (internal->count < 1) {
    return 0;
  }
  uint64_t v4 = 0;
  while (internal->dataOutputs[v4] != key)
  {
    if (internal->count == ++v4) {
      return 0;
    }
  }
  return (AVCaptureSynchronizedData *)internal->synchronizedData[v4];
}

- (NSUInteger)count
{
  return self->_internal->count;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0 = a3->var0;
  a3->var2 = &self->_internal->changeSeed;
  if (var0) {
    return 0;
  }
  dataOutputs = self->_internal->dataOutputs;
  a3->unint64_t var0 = 1;
  a3->var1 = dataOutputs;
  return self->_internal->count;
}

- (id)debugDescription
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  CMTimeValue value = *MEMORY[0x1E4F1F9F8];
  CMTimeFlags flags = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 12);
  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
  CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  uint64_t v4 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"{ "];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obj = self->_internal->possibleDataOutputs;
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v10 = [(AVCaptureSynchronizedDataCollection *)self objectForKeyedSubscript:v9];
        [v4 appendFormat:@"%@", +[AVCaptureSynchronizedDataCollection _shortStringForDataOutput:syncedData:](AVCaptureSynchronizedDataCollection, "_shortStringForDataOutput:syncedData:", v9, v10)];
        if (v10)
        {
          [(AVCaptureSynchronizedData *)v10 timestamp];
          [v4 appendFormat:@" %*lld, ", 15, v17];
          if ((flags & 1) == 0)
          {
            [(AVCaptureSynchronizedData *)v10 timestamp];
            CMTimeValue value = lhs.value;
            CMTimeFlags flags = lhs.flags;
            CMTimeScale timescale = lhs.timescale;
            CMTimeEpoch epoch = lhs.epoch;
          }
        }
        else
        {
          [v4 appendString:@", "];
        }
      }
      uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
  CMTime lhs = (CMTime)self->_internal->creationTime;
  rhs.CMTimeValue value = value;
  rhs.CMTimeScale timescale = timescale;
  rhs.CMTimeFlags flags = flags;
  rhs.CMTimeEpoch epoch = epoch;
  CMTimeSubtract(&time, &lhs, &rhs);
  objc_msgSend(v4, "appendFormat:", @"} (Latency:%f)", CMTimeGetSeconds(&time));
  return v4;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p %@>", NSStringFromClass(v4), self, -[AVCaptureSynchronizedDataCollection debugDescription](self, "debugDescription")];
}

- (id)_initWithPossibleDataOutputs:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)AVCaptureSynchronizedDataCollection;
  uint64_t v4 = [(AVCaptureSynchronizedDataCollection *)&v11 init];
  if (v4)
  {
    uint64_t v5 = objc_alloc_init(AVCaptureSynchronizedDataCollectionInternal);
    v4->_internal = v5;
    if (v5)
    {
      uint64_t v6 = v5;
      HostTimeClock = CMClockGetHostTimeClock();
      CMClockGetTime(&v10, HostTimeClock);
      v6->creationTime = ($95D729B680665BEAEFA1D6FCA8238556)v10;
      v4->_internal->possibleDataOutputs = (NSArray *)a3;
      v4->_internal->maxCount = [a3 count];
      internal = v4->_internal;
      if (internal->maxCount)
      {
        v4->_internal->dataOutputs = (id *)malloc_type_calloc(internal->maxCount, 8uLL, 0x80040B8603338uLL);
        v4->_internal->synchronizedData = (id *)malloc_type_calloc(v4->_internal->maxCount, 8uLL, 0x80040B8603338uLL);
      }
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)_setSynchronizedData:(id)a3 forCaptureOutput:(id)a4
{
  ++self->_internal->changeSeed;
  internal = self->_internal;
  uint64_t count = internal->count;
  if (internal->count < 1)
  {
LABEL_5:
    if (internal->maxCount <= (char)count)
    {
      uint64_t v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
      if (AVCaptureShouldThrowForAPIViolations()) {
        objc_exception_throw(v9);
      }
      NSLog(&cfstr_SuppressingExc.isa, v9);
    }
    else
    {
      self->_internal->dataOutputs[self->_internal->count] = a4;
      self->_internal->synchronizedData[self->_internal->count++] = a3;
    }
  }
  else
  {
    uint64_t v8 = 0;
    while (internal->dataOutputs[v8] != a4)
    {
      if (count == ++v8) {
        goto LABEL_5;
      }
    }

    self->_internal->synchronizedData[v8] = a3;
  }
}

+ (id)_shortStringForDataOutput:(id)a3 syncedData:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a4)
    {
      uint64_t v6 = NSString;
      if ([a4 sampleBufferWasDropped]) {
        uint64_t v7 = "!";
      }
      else {
        uint64_t v7 = " ";
      }
      return (id)[v6 stringWithFormat:@"VDO[%s%@]:", v7, objc_msgSend(a1, "_shortStringForDataDroppedReason:", objc_msgSend(a4, "droppedReason"))];
    }
    else
    {
      return @"VDO[--]:";
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (a4) {
        return @"ADO[  ]:";
      }
      else {
        return @"ADO[--]:";
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (a4) {
          return (id)[NSString stringWithFormat:@"MDO[%@]:", objc_msgSend(a1, "_shortStringForMetadataObjects:", objc_msgSend(a4, "metadataObjects")), v17];
        }
        else {
          return @"MDO[--]:";
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (a4)
          {
            uint64_t v9 = NSString;
            if ([a4 depthDataWasDropped]) {
              CMTime v10 = "!";
            }
            else {
              CMTime v10 = " ";
            }
            return (id)[v9 stringWithFormat:@"DDO[%s%@]:", v10, objc_msgSend(a1, "_shortStringForDataDroppedReason:", objc_msgSend(a4, "droppedReason"))];
          }
          else
          {
            return @"DDO[--]:";
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (a4)
            {
              objc_super v11 = NSString;
              if ([a4 visionDataWasDropped]) {
                v12 = "!";
              }
              else {
                v12 = " ";
              }
              return (id)[v11 stringWithFormat:@"VSNDO[%s%@]:", v12, objc_msgSend(a1, "_shortStringForDataDroppedReason:", objc_msgSend(a4, "droppedReason"))];
            }
            else
            {
              return @"VSNDO[--]:";
            }
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if (a4)
              {
                v13 = NSString;
                if ([a4 pointCloudDataWasDropped]) {
                  v14 = "!";
                }
                else {
                  v14 = " ";
                }
                return (id)[v13 stringWithFormat:@"PDO[%s%@]:", v14, objc_msgSend(a1, "_shortStringForDataDroppedReason:", objc_msgSend(a4, "droppedReason"))];
              }
              else
              {
                return @"PDO[--]:";
              }
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                if (a4)
                {
                  v15 = NSString;
                  if ([a4 cameraCalibrationDataWasDropped]) {
                    v16 = "!";
                  }
                  else {
                    v16 = " ";
                  }
                  return (id)[v15 stringWithFormat:@"CCDO[%s%@]:", v16, objc_msgSend(a1, "_shortStringForDataDroppedReason:", objc_msgSend(a4, "droppedReason"))];
                }
                else
                {
                  return @"CCDO[--]:";
                }
              }
              else
              {
                return @"???[--]:";
              }
            }
          }
        }
      }
    }
  }
}

+ (id)_shortStringForDataDroppedReason:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return @" ";
  }
  else {
    return off_1E5A73780[a3 - 1];
  }
}

+ (id)_shortStringForMetadataObjects:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[MEMORY[0x1E4F28E78] string];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = (__CFString *)[*(id *)(*((void *)&v12 + 1) + 8 * i) type];
        if (v9 == @"face")
        {
          CMTime v10 = @"FA_";
        }
        else if (v9 == @"humanBody")
        {
          CMTime v10 = @"HB_";
        }
        else if (v9 == @"humanFullBody")
        {
          CMTime v10 = @"HFB_";
        }
        else if (v9 == @"catBody")
        {
          CMTime v10 = @"CB_";
        }
        else if (v9 == @"dogBody")
        {
          CMTime v10 = @"DB_";
        }
        else if (v9 == @"salientObject")
        {
          CMTime v10 = @"SO_";
        }
        else if (v9 == @"org.gs1.UPC-E")
        {
          CMTime v10 = @"UE_";
        }
        else if (v9 == @"org.iso.Code39")
        {
          CMTime v10 = @"39_";
        }
        else if (v9 == @"org.iso.Code39Mod43")
        {
          CMTime v10 = @"43_";
        }
        else if (v9 == @"org.gs1.EAN-13")
        {
          CMTime v10 = @"13_";
        }
        else if (v9 == @"org.gs1.EAN-8")
        {
          CMTime v10 = @"E8_";
        }
        else if (v9 == @"com.intermec.Code93")
        {
          CMTime v10 = @"93_";
        }
        else if (v9 == @"org.iso.Code128")
        {
          CMTime v10 = @"80_";
        }
        else if (v9 == @"org.iso.PDF417")
        {
          CMTime v10 = @"PD_";
        }
        else if (v9 == @"org.iso.QRCode")
        {
          CMTime v10 = @"QR_";
        }
        else if (v9 == @"org.iso.Aztec")
        {
          CMTime v10 = @"AZ_";
        }
        else if (v9 == @"org.ansi.Interleaved2of5")
        {
          CMTime v10 = @"25_";
        }
        else if (v9 == @"org.gs1.ITF14")
        {
          CMTime v10 = @"IT_";
        }
        else if (v9 == @"org.iso.DataMatrix")
        {
          CMTime v10 = @"DM_";
        }
        else if (v9 == @"Codabar")
        {
          CMTime v10 = @"CD_";
        }
        else if (v9 == @"org.gs1.GS1DataBar")
        {
          CMTime v10 = @"DC_";
        }
        else if (v9 == @"org.gs1.GS1DataBarExpanded")
        {
          CMTime v10 = @"DE_";
        }
        else if (v9 == @"org.gs1.GS1DataBarLimited")
        {
          CMTime v10 = @"DL_";
        }
        else if (v9 == @"org.iso.MicroQR")
        {
          CMTime v10 = @"MQ_";
        }
        else if (v9 == @"org.iso.MicroPDF417")
        {
          CMTime v10 = @"MP_";
        }
        else if (v9 == @"trackedFaces")
        {
          CMTime v10 = @"TF_";
        }
        else if (v9 == @"offlineVideoStabilizationMotion")
        {
          CMTime v10 = @"VS_";
        }
        else if (v9 == @"saliencyHeatMap")
        {
          CMTime v10 = @"SH_";
        }
        else if (v9 == @"videoPreviewHistogram")
        {
          CMTime v10 = @"VP_";
        }
        else if (v9 == @"com.apple.AppClipCode")
        {
          CMTime v10 = @"AC_";
        }
        else if (v9 == @"textRegion")
        {
          CMTime v10 = @"TR_";
        }
        else if (v9 == @"sceneClassification")
        {
          CMTime v10 = @"SC_";
        }
        else if (v9 == @"humanHead")
        {
          CMTime v10 = @"HH_";
        }
        else if (v9 == @"catHead")
        {
          CMTime v10 = @"CH_";
        }
        else if (v9 == @"dogHead")
        {
          CMTime v10 = @"DH_";
        }
        else
        {
          CMTime v10 = @"??_";
        }
        [v4 appendString:v10];
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  if ([v4 hasSuffix:@"_"]) {
    objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
  }
  else {
    [v4 appendString:@"__"];
  }
  return v4;
}

@end