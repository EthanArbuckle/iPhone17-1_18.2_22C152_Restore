@interface AVCompositionTrackSegment
+ (AVCompositionTrackSegment)compositionTrackSegmentWithTimeRange:(CMTimeRange *)timeRange;
+ (AVCompositionTrackSegment)compositionTrackSegmentWithURL:(NSURL *)URL trackID:(CMPersistentTrackID)trackID sourceTimeRange:(CMTimeRange *)sourceTimeRange targetTimeRange:(CMTimeRange *)targetTimeRange;
+ (BOOL)supportsSecureCoding;
- (AVCompositionTrackSegment)init;
- (AVCompositionTrackSegment)initWithCoder:(id)a3;
- (AVCompositionTrackSegment)initWithTimeRange:(CMTimeRange *)timeRange;
- (AVCompositionTrackSegment)initWithURL:(NSURL *)URL trackID:(CMPersistentTrackID)trackID sourceTimeRange:(CMTimeRange *)sourceTimeRange targetTimeRange:(CMTimeRange *)targetTimeRange;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (CMPersistentTrackID)sourceTrackID;
- (NSURL)sourceURL;
- (id)_initWithTimeMapping:(id *)a3;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVCompositionTrackSegment

+ (AVCompositionTrackSegment)compositionTrackSegmentWithURL:(NSURL *)URL trackID:(CMPersistentTrackID)trackID sourceTimeRange:(CMTimeRange *)sourceTimeRange targetTimeRange:(CMTimeRange *)targetTimeRange
{
  uint64_t v8 = *(void *)&trackID;
  v10 = [AVCompositionTrackSegment alloc];
  long long v11 = *(_OWORD *)&sourceTimeRange->start.epoch;
  v15[0] = *(_OWORD *)&sourceTimeRange->start.value;
  v15[1] = v11;
  v15[2] = *(_OWORD *)&sourceTimeRange->duration.timescale;
  long long v12 = *(_OWORD *)&targetTimeRange->start.epoch;
  v14[0] = *(_OWORD *)&targetTimeRange->start.value;
  v14[1] = v12;
  v14[2] = *(_OWORD *)&targetTimeRange->duration.timescale;
  return [(AVCompositionTrackSegment *)v10 initWithURL:URL trackID:v8 sourceTimeRange:v15 targetTimeRange:v14];
}

+ (AVCompositionTrackSegment)compositionTrackSegmentWithTimeRange:(CMTimeRange *)timeRange
{
  v4 = [AVCompositionTrackSegment alloc];
  long long v5 = *(_OWORD *)&timeRange->start.epoch;
  v7[0] = *(_OWORD *)&timeRange->start.value;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&timeRange->duration.timescale;
  return [(AVCompositionTrackSegment *)v4 initWithTimeRange:v7];
}

- (AVCompositionTrackSegment)init
{
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  v4[0] = *MEMORY[0x1E4F1FA20];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  return [(AVCompositionTrackSegment *)self initWithTimeRange:v4];
}

- (id)_initWithTimeMapping:(id *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVCompositionTrackSegment;
  long long v3 = *(_OWORD *)&a3->var1.var0.var0;
  v7[2] = *(_OWORD *)&a3->var0.var1.var1;
  _OWORD v7[3] = v3;
  long long v4 = *(_OWORD *)&a3->var1.var1.var1;
  v7[4] = *(_OWORD *)&a3->var1.var0.var3;
  v7[5] = v4;
  long long v5 = *(_OWORD *)&a3->var0.var0.var3;
  v7[0] = *(_OWORD *)&a3->var0.var0.var0;
  v7[1] = v5;
  return [(AVAssetTrackSegment *)&v8 _initWithTimeMapping:v7];
}

- (AVCompositionTrackSegment)initWithURL:(NSURL *)URL trackID:(CMPersistentTrackID)trackID sourceTimeRange:(CMTimeRange *)sourceTimeRange targetTimeRange:(CMTimeRange *)targetTimeRange
{
  long long v8 = *(_OWORD *)&sourceTimeRange->start.epoch;
  long long v17 = *(_OWORD *)&sourceTimeRange->start.value;
  long long v18 = v8;
  long long v9 = *(_OWORD *)&targetTimeRange->start.value;
  long long v10 = *(_OWORD *)&targetTimeRange->start.epoch;
  long long v19 = *(_OWORD *)&sourceTimeRange->duration.timescale;
  long long v20 = v9;
  long long v11 = *(_OWORD *)&targetTimeRange->duration.timescale;
  long long v21 = v10;
  long long v22 = v11;
  v16.receiver = self;
  v16.super_class = (Class)AVCompositionTrackSegment;
  v15[2] = v19;
  _OWORD v15[3] = v9;
  v15[4] = v10;
  v15[5] = v11;
  v15[0] = v17;
  v15[1] = v8;
  long long v12 = [(AVAssetTrackSegment *)&v16 _initWithTimeMapping:v15];
  if (v12)
  {
    Ivars = AVCompositionTrackSegmentCreateIvars(URL, trackID);
    v12->_priv = Ivars;
    if (!Ivars)
    {

      return 0;
    }
  }
  return v12;
}

- (AVCompositionTrackSegment)initWithTimeRange:(CMTimeRange *)timeRange
{
  memset(&v12, 0, sizeof(v12));
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  *(_OWORD *)&v9[0].start.value = *MEMORY[0x1E4F1FA20];
  *(_OWORD *)&v9[0].start.epoch = v4;
  *(_OWORD *)&v9[0].duration.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  long long v5 = *(_OWORD *)&timeRange->start.epoch;
  *(_OWORD *)&target.start.value = *(_OWORD *)&timeRange->start.value;
  *(_OWORD *)&target.start.epoch = v5;
  *(_OWORD *)&target.duration.timescale = *(_OWORD *)&timeRange->duration.timescale;
  CMTimeMappingMake(&v12, v9, &target);
  v10.receiver = self;
  v10.super_class = (Class)AVCompositionTrackSegment;
  v9[0] = v12.source;
  v9[1] = v12.target;
  v6 = [(AVAssetTrackSegment *)&v10 _initWithTimeMapping:v9];
  if (v6)
  {
    Ivars = AVCompositionTrackSegmentCreateIvars(0, 0);
    v6->_priv = Ivars;
    if (!Ivars)
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  priv = self->_priv;
  if (priv)
  {

    self->_priv->editAssetURL = 0;
    long long v4 = self->_priv;
    if (v4)
    {
      CFRelease(v4);
      self->_priv = 0;
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)AVCompositionTrackSegment;
  [(AVCompositionTrackSegment *)&v5 dealloc];
}

- (id)description
{
  long long v3 = (void *)MEMORY[0x1E4F28E78];
  long long v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  if (self)
  {
    [(AVAssetTrackSegment *)self timeMapping];
    *(_OWORD *)&time.value = v26;
    time.epoch = v27;
    Float64 Seconds = CMTimeGetSeconds(&time);
    [(AVAssetTrackSegment *)self timeMapping];
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    memset(&time, 0, sizeof(time));
    Float64 Seconds = CMTimeGetSeconds(&time);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    memset(v21, 0, sizeof(v21));
  }
  CMTime v22 = *(CMTime *)((char *)v21 + 8);
  v7 = (void *)[v3 stringWithFormat:@"<%@: %p timeRange [%.3f,+%.3f] ", v5, self, *(void *)&Seconds, CMTimeGetSeconds(&v22)];
  if ([(AVCompositionTrackSegment *)self isEmpty])
  {
    [v7 appendString:@"is empty"];
  }
  else
  {
    priv = self->_priv;
    editAssetURL = priv->editAssetURL;
    uint64_t editAssetTrackID = priv->editAssetTrackID;
    [(AVAssetTrackSegment *)self timeMapping];
    CMTime v16 = v15;
    Float64 v11 = CMTimeGetSeconds(&v16);
    [(AVAssetTrackSegment *)self timeMapping];
    CMTime v14 = v13;
    [v7 appendFormat:@"from trackID %d of asset %@ sourceTimeRange [%.3f,+%.3f]", editAssetTrackID, editAssetURL, *(void *)&v11, CMTimeGetSeconds(&v14)];
  }
  [v7 appendString:@">"];
  return v7;
}

- (BOOL)isEmpty
{
  v3.receiver = self;
  v3.super_class = (Class)AVCompositionTrackSegment;
  return [(AVAssetTrackSegment *)&v3 isEmpty];
}

- (NSURL)sourceURL
{
  return self->_priv->editAssetURL;
}

- (CMPersistentTrackID)sourceTrackID
{
  return self->_priv->editAssetTrackID;
}

- (BOOL)isEqual:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AVCompositionTrackSegment;
  unsigned int v5 = -[AVAssetTrackSegment isEqual:](&v9, sel_isEqual_);
  if (v5)
  {
    CMPersistentTrackID v6 = [(AVCompositionTrackSegment *)self sourceTrackID];
    if (v6 == [a3 sourceTrackID])
    {
      v7 = [(AVCompositionTrackSegment *)self sourceURL];
      if (v7 == (NSURL *)[a3 sourceURL]) {
        LOBYTE(v5) = 1;
      }
      else {
        LOBYTE(v5) = -[NSURL isEqual:](-[AVCompositionTrackSegment sourceURL](self, "sourceURL"), "isEqual:", [a3 sourceURL]);
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)AVCompositionTrackSegment;
  unint64_t v3 = [(AVAssetTrackSegment *)&v6 hash];
  uint64_t v4 = [(NSURL *)[(AVCompositionTrackSegment *)self sourceURL] hash];
  return v4 ^ [(AVCompositionTrackSegment *)self sourceTrackID] ^ v3;
}

- (AVCompositionTrackSegment)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVCompositionTrackSegment;
  uint64_t v4 = -[AVAssetTrackSegment initWithCoder:](&v8, sel_initWithCoder_);
  if (v4)
  {
    unsigned int v5 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"sourceURL"];
    Ivars = AVCompositionTrackSegmentCreateIvars(v5, [a3 decodeInt32ForKey:@"sourceTrackID"]);
    v4->_priv = Ivars;
    if (!Ivars)
    {

      return 0;
    }
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVCompositionTrackSegment;
  -[AVAssetTrackSegment encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", -[AVCompositionTrackSegment sourceURL](self, "sourceURL"), @"sourceURL");
  objc_msgSend(a3, "encodeInt32:forKey:", -[AVCompositionTrackSegment sourceTrackID](self, "sourceTrackID"), @"sourceTrackID");
}

@end