@interface MIOSEITrackReader
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxCurrentPts;
- (AVAssetReaderOutput)trackOutput;
- (BOOL)drainBeforeRead;
- (BOOL)parseSEIInData:(char *)a3 length:(unsigned int)a4 output:(char *)a5 outputSize:(unsigned int *)a6;
- (MIOSEITrackReader)initWithVideoTrack:(id)a3 assetReader:(id)a4;
- (NSMutableArray)seiItemsBuffer;
- (OpaqueCMBlockBuffer)readNextValidBlockBufferPts:(id *)a3;
- (id)copyNextSEIPts:(id *)a3 deserialize:(BOOL)a4 error:(id *)a5;
- (id)extractDebugSEIFromBuffer:(OpaqueCMBlockBuffer *)a3 codecType:(unsigned int)a4;
- (id)findNALUInData:(char *)a3 length:(unint64_t)a4 isHEVC:(BOOL)a5;
- (id)popFrontPts:(id *)a3;
- (id)readNextSEIPts:(id *)a3 deserialize:(BOOL)a4 error:(id *)a5;
- (unsigned)codec;
- (unsigned)removeEPBFrom:(char *)a3 length:(unsigned int)a4 outBuffer:(char *)a5;
- (void)setCodec:(unsigned int)a3;
- (void)setDrainBeforeRead:(BOOL)a3;
- (void)setMaxCurrentPts:(id *)a3;
- (void)setSeiItemsBuffer:(id)a3;
- (void)setTrackOutput:(id)a3;
@end

@implementation MIOSEITrackReader

- (MIOSEITrackReader)initWithVideoTrack:(id)a3 assetReader:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MIOSEITrackReader;
  v8 = [(MIOSEITrackReader *)&v15 init];
  if (v8)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x263EFA4D8]) initWithTrack:v6 outputSettings:0];
    [(MIOSEITrackReader *)v8 setTrackOutput:v9];

    v10 = [(MIOSEITrackReader *)v8 trackOutput];
    [v7 addOutput:v10];

    v11 = [MEMORY[0x263EFF980] arrayWithCapacity:5];
    [(MIOSEITrackReader *)v8 setSeiItemsBuffer:v11];

    long long v13 = *MEMORY[0x263F01098];
    uint64_t v14 = *(void *)(MEMORY[0x263F01098] + 16);
    [(MIOSEITrackReader *)v8 setMaxCurrentPts:&v13];
    [(MIOSEITrackReader *)v8 setDrainBeforeRead:0];
  }

  return v8;
}

- (BOOL)parseSEIInData:(char *)a3 length:(unsigned int)a4 output:(char *)a5 outputSize:(unsigned int *)a6
{
  v18[2] = *MEMORY[0x263EF8340];
  if (a6)
  {
    *a6 = 0;
    if (a4)
    {
      uint64_t v7 = 0;
      int v8 = 5;
      while (a3[v7] == 255)
      {
        ++v7;
        v8 -= 255;
        if (a4 == v7) {
          return 0;
        }
      }
      if ((int)v7 + 1 < a4)
      {
        uint64_t v9 = 0;
        unsigned int v10 = v7 + 2;
        for (int i = 16; ; i -= 255)
        {
          int v12 = a3[v9 + 1 + v7];
          if (v12 != 255) {
            break;
          }
          if (!(2 - a4 + v7 + v9++)) {
            return 0;
          }
        }
        if (a3[v7] != v8) {
          return 1;
        }
        uint64_t v15 = 0;
        while (v9 + (unint64_t)v10 + v15 < a4)
        {
          *((unsigned char *)v18 + v15) = a3[v10 + v15 + v9];
          if (++v15 == 16)
          {
            if (v18[0] == 0x5646C3E2DC8DF223 && v18[1] == 0xDE4FDE1CA55751BCLL)
            {
              unsigned int v17 = v12 - i;
              memcpy(a5, &a3[v9 + 16 + v10], (v12 - i));
              *a6 = v17;
              return 1;
            }
            return 0;
          }
        }
      }
    }
  }
  return 0;
}

- (unsigned)removeEPBFrom:(char *)a3 length:(unsigned int)a4 outBuffer:(char *)a5
{
  unsigned int result = 0;
  if (a4 >= 3 && a3 && a5)
  {
    int v6 = 0;
    uint64_t v7 = a5;
    do
    {
      int v8 = *a3;
      int v6 = v8 | (v6 << 8);
      if ((v6 & 0xFFFFFF) != 3) {
        *v7++ = v8;
      }
      ++a3;
      --a4;
    }
    while (a4);
    return v7 - a5;
  }
  return result;
}

- (id)findNALUInData:(char *)a3 length:(unint64_t)a4 isHEVC:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ((uint64_t)a4 >= 1)
  {
    unsigned int v10 = &a3[a4];
    do
    {
      size_t v11 = bswap32(*(_DWORD *)a3);
      char v14 = a3[4];
      long long v13 = a3 + 4;
      char v12 = v14;
      if (v5)
      {
        if ((v12 & 0x7E) == 0x4E)
        {
          uint64_t v15 = 2;
          goto LABEL_8;
        }
      }
      else if ((v12 & 0x1F) == 6)
      {
        uint64_t v15 = 1;
LABEL_8:
        v16 = malloc_type_malloc(v11, 0x6E71FE01uLL);
        uint64_t v17 = [(MIOSEITrackReader *)self removeEPBFrom:&v13[v15] length:v11 outBuffer:v16];
        unsigned int v21 = 0;
        v18 = malloc_type_malloc(v11, 0xEC529AD2uLL);
        [(MIOSEITrackReader *)self parseSEIInData:v16 length:v17 output:v18 outputSize:&v21];
        if (v21 >= 4 && *v18 == 109 && v18[1] == 101 && v18[2] == 116 && v18[3] == 97)
        {
          v19 = [MEMORY[0x263EFF8F8] dataWithBytes:v18 + 4 length:v21 - 4];
          [v9 addObject:v19];
        }
        free(v16);
        free(v18);
      }
      a3 = &v13[v11];
    }
    while (a3 < v10);
  }

  return v9;
}

- (id)extractDebugSEIFromBuffer:(OpaqueCMBlockBuffer *)a3 codecType:(unsigned int)a4
{
  if (a4 == 1752589105 || a4 == 1635148593)
  {
    dataPointerOut[3] = v4;
    uint64_t v14 = v5;
    size_t lengthAtOffsetOut = 0;
    dataPointerOut[0] = 0;
    BOOL v8 = a4 == 1752589105;
    size_t totalLengthOut = 0;
    CMBlockBufferGetDataPointer(a3, 0, &lengthAtOffsetOut, &totalLengthOut, dataPointerOut);
    id v9 = [(MIOSEITrackReader *)self findNALUInData:dataPointerOut[0] length:totalLengthOut isHEVC:v8];
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (OpaqueCMBlockBuffer)readNextValidBlockBufferPts:(id *)a3
{
  for (int i = self; ; self = i)
  {
    uint64_t v5 = [(MIOSEITrackReader *)self trackOutput];
    int v6 = (opaqueCMSampleBuffer *)[v5 copyNextSampleBuffer];

    if (!v6) {
      return 0;
    }
    CMBlockBufferRef DataBuffer = CMSampleBufferGetDataBuffer(v6);
    if (DataBuffer) {
      break;
    }
    CFRelease(v6);
  }
  CMBlockBufferRef v8 = DataBuffer;
  if (a3)
  {
    CMSampleBufferGetPresentationTimeStamp(&v11, v6);
    *(CMTime *)a3 = v11;
  }
  FormatDescription = CMSampleBufferGetFormatDescription(v6);
  [(MIOSEITrackReader *)i setCodec:CMFormatDescriptionGetMediaSubType(FormatDescription)];
  CFRetain(v8);
  CFRelease(v6);
  return v8;
}

- (id)popFrontPts:(id *)a3
{
  uint64_t v5 = [(MIOSEITrackReader *)self seiItemsBuffer];
  int v6 = [v5 firstObject];
  uint64_t v7 = [v6 objectForKey:@"SEI"];

  CMBlockBufferRef v8 = [(MIOSEITrackReader *)self seiItemsBuffer];
  id v9 = [v8 firstObject];
  CFDictionaryRef v10 = [v9 objectForKey:@"PTSDICT"];

  CMTime v11 = [(MIOSEITrackReader *)self seiItemsBuffer];
  [v11 removeObjectAtIndex:0];

  if (a3)
  {
    CMTimeMakeFromDictionary(&v13, v10);
    *(CMTime *)a3 = v13;
  }

  return v7;
}

- (id)copyNextSEIPts:(id *)a3 deserialize:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v38[3] = *MEMORY[0x263EF8340];
  if (![(MIOSEITrackReader *)self drainBeforeRead])
  {
LABEL_5:
    memset(&v36, 0, sizeof(v36));
    uint64_t v12 = [(MIOSEITrackReader *)self readNextSEIPts:&v36 deserialize:v6 error:a5];
    CMTime v13 = (void *)v12;
    CMTime v11 = 0;
    if (*a5)
    {
LABEL_17:

      return v11;
    }
    if (!v12)
    {
      v26 = [(MIOSEITrackReader *)self seiItemsBuffer];
      uint64_t v27 = [v26 count];

      if (v27)
      {
        CMTime v11 = [(MIOSEITrackReader *)self popFrontPts:a3];
      }
      else
      {
        CMTime v11 = 0;
      }
      goto LABEL_17;
    }
    v37[0] = @"PTS";
    CMTime time = v36;
    uint64_t v14 = [NSNumber numberWithDouble:CMTimeGetSeconds(&time)];
    v38[0] = v14;
    v37[1] = @"PTSDICT";
    CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CMTime time = v36;
    CFDictionaryRef v16 = CMTimeCopyAsDictionary(&time, v15);
    v37[2] = @"SEI";
    v38[1] = v16;
    v38[2] = v13;
    uint64_t v17 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:3];

    v18 = [(MIOSEITrackReader *)self seiItemsBuffer];
    [v18 addObject:v17];

    v19 = [(MIOSEITrackReader *)self seiItemsBuffer];
    v20 = (void *)MEMORY[0x263EFF8C0];
    unsigned int v21 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"PTS" ascending:1];
    v22 = objc_msgSend(v20, "arrayWithObjects:", v21, 0);
    [v19 sortUsingDescriptors:v22];

    v23 = self;
    v24 = v23;
    if (v23)
    {
      [v23 maxCurrentPts];

      if ((v33 & 0x100000000) != 0)
      {
        [(MIOSEITrackReader *)self maxCurrentPts];
        CMTime time = v36;
        if (CMTimeCompare(&time, &time2) == 1)
        {
          CMTime v29 = v36;
          [(MIOSEITrackReader *)self setMaxCurrentPts:&v29];
          [(MIOSEITrackReader *)self setDrainBeforeRead:1];
          id v25 = [(MIOSEITrackReader *)self popFrontPts:a3];
LABEL_16:
          CMTime v11 = v25;

          goto LABEL_17;
        }
LABEL_15:
        id v25 = [(MIOSEITrackReader *)self copyNextSEIPts:a3 deserialize:v6 error:a5];
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v32 = 0;
      uint64_t v33 = 0;
      uint64_t v34 = 0;
    }
    CMTime v31 = v36;
    [(MIOSEITrackReader *)self setMaxCurrentPts:&v31];
    goto LABEL_15;
  }
  id v9 = [(MIOSEITrackReader *)self seiItemsBuffer];
  unint64_t v10 = [v9 count];

  if (v10 < 2)
  {
    [(MIOSEITrackReader *)self setDrainBeforeRead:0];
    goto LABEL_5;
  }
  [(MIOSEITrackReader *)self popFrontPts:a3];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)readNextSEIPts:(id *)a3 deserialize:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v26 = *MEMORY[0x263EF8340];
  CMBlockBufferRef v8 = [(MIOSEITrackReader *)self readNextValidBlockBufferPts:a3];
  if (!v8)
  {
    id v13 = 0;
    goto LABEL_18;
  }
  id v9 = v8;
  unint64_t v10 = [(MIOSEITrackReader *)self extractDebugSEIFromBuffer:v8 codecType:[(MIOSEITrackReader *)self codec]];
  CFRelease(v9);
  if (v6)
  {
    if ([v10 count] == 1)
    {
      uint64_t v24 = 0;
      CMTime v11 = (void *)MEMORY[0x263F08AC0];
      id v12 = [v10 firstObject];
      id v13 = [v11 propertyListWithData:v12 options:0 format:&v24 error:a5];
    }
    else
    {
      if ((unint64_t)[v10 count] < 2)
      {
        id v13 = 0;
        goto LABEL_17;
      }
      objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v10, "count"));
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v24 = 0;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v12 = v10;
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v21 != v16) {
              objc_enumerationMutation(v12);
            }
            v18 = objc_msgSend(MEMORY[0x263F08AC0], "propertyListWithData:options:format:error:", *(void *)(*((void *)&v20 + 1) + 8 * i), 0, &v24, a5, (void)v20);
            [v13 addObject:v18];
          }
          uint64_t v15 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v15);
      }
    }
  }
  else
  {
    id v13 = v10;
  }
LABEL_17:

LABEL_18:

  return v13;
}

- (AVAssetReaderOutput)trackOutput
{
  return (AVAssetReaderOutput *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTrackOutput:(id)a3
{
}

- (unsigned)codec
{
  return self->_codec;
}

- (void)setCodec:(unsigned int)a3
{
  self->_codec = a3;
}

- (NSMutableArray)seiItemsBuffer
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSeiItemsBuffer:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxCurrentPts
{
  objc_copyStruct(retstr, &self->_maxCurrentPts, 24, 1, 0);
  return result;
}

- (void)setMaxCurrentPts:(id *)a3
{
}

- (BOOL)drainBeforeRead
{
  return self->_drainBeforeRead;
}

- (void)setDrainBeforeRead:(BOOL)a3
{
  self->_drainBeforeRead = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seiItemsBuffer, 0);

  objc_storeStrong((id *)&self->_trackOutput, 0);
}

@end