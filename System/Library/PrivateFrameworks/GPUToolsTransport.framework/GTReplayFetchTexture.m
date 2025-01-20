@interface GTReplayFetchTexture
+ (BOOL)supportsSecureCoding;
- ($71565B17A5F3ED2E4525C95CCD99C39E)dispatchUID;
- (BOOL)resolveMultisampleTexture;
- (GTRegion)region;
- (GTReplayFetchTexture)initWithCoder:(id)a3;
- (GTSize)size;
- (unint64_t)streamRef;
- (unsigned)depth;
- (unsigned)level;
- (unsigned)plane;
- (unsigned)slice;
- (void)encodeWithCoder:(id)a3;
- (void)setDepth:(unsigned int)a3;
- (void)setDispatchUID:(id)a3;
- (void)setLevel:(unsigned int)a3;
- (void)setPlane:(unsigned int)a3;
- (void)setRegion:(GTRegion *)a3;
- (void)setResolveMultisampleTexture:(BOOL)a3;
- (void)setSize:(GTSize *)a3;
- (void)setSlice:(unsigned int)a3;
- (void)setStreamRef:(unint64_t)a3;
@end

@implementation GTReplayFetchTexture

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayFetchTexture)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GTReplayFetchTexture;
  v5 = [(GTReplayRequest *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->_streamRef = [v4 decodeInt64ForKey:@"streamRef"];
    v5->_plane = [v4 decodeInt32ForKey:@"plane"];
    v5->_slice = [v4 decodeInt32ForKey:@"slice"];
    v5->_level = [v4 decodeInt32ForKey:@"level"];
    v5->_depth = [v4 decodeInt32ForKey:@"depth"];
    v5->_size.width = [v4 decodeInt64ForKey:@"size.width"];
    v5->_size.height = [v4 decodeInt64ForKey:@"size.height"];
    v5->_size.depth = [v4 decodeInt64ForKey:@"size.depth"];
    v5->_dispatchUID.uid = GTDispatchUIDDecode(v4, @"dispatchUID");
    v5->_resolveMultisampleTexture = [v4 decodeBoolForKey:@"resolveMultisampleTexture"];
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GTReplayFetchTexture;
  id v4 = a3;
  [(GTReplayRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->_streamRef, @"streamRef", v5.receiver, v5.super_class);
  [v4 encodeInt32:self->_plane forKey:@"plane"];
  [v4 encodeInt32:self->_slice forKey:@"slice"];
  [v4 encodeInt32:self->_level forKey:@"level"];
  [v4 encodeInt32:self->_depth forKey:@"depth"];
  [v4 encodeInt64:self->_size.width forKey:@"size.width"];
  [v4 encodeInt64:self->_size.height forKey:@"size.height"];
  [v4 encodeInt64:self->_size.depth forKey:@"size.depth"];
  [v4 encodeBool:self->_resolveMultisampleTexture forKey:@"resolveMultisampleTexture"];
  GTDispatchUIDEncode(v4, self->_dispatchUID.uid, @"dispatchUID");
}

- ($71565B17A5F3ED2E4525C95CCD99C39E)dispatchUID
{
  return ($71565B17A5F3ED2E4525C95CCD99C39E)self->_dispatchUID.uid;
}

- (void)setDispatchUID:(id)a3
{
  self->_dispatchUID.uid = a3.var1;
}

- (unint64_t)streamRef
{
  return self->_streamRef;
}

- (void)setStreamRef:(unint64_t)a3
{
  self->_streamRef = a3;
}

- (unsigned)plane
{
  return self->_plane;
}

- (void)setPlane:(unsigned int)a3
{
  self->_plane = a3;
}

- (unsigned)slice
{
  return self->_slice;
}

- (void)setSlice:(unsigned int)a3
{
  self->_slice = a3;
}

- (unsigned)level
{
  return self->_level;
}

- (void)setLevel:(unsigned int)a3
{
  self->_level = a3;
}

- (unsigned)depth
{
  return self->_depth;
}

- (void)setDepth:(unsigned int)a3
{
  self->_depth = a3;
}

- (GTSize)size
{
  *retstr = *(GTSize *)((char *)self + 56);
  return self;
}

- (void)setSize:(GTSize *)a3
{
  unint64_t depth = a3->depth;
  *(_OWORD *)&self->_size.width = *(_OWORD *)&a3->width;
  self->_size.unint64_t depth = depth;
}

- (GTRegion)region
{
  long long v3 = *(_OWORD *)&self[2].origin.x;
  *(_OWORD *)&retstr->origin.x = *(_OWORD *)&self[1].size.height;
  *(_OWORD *)&retstr->origin.z = v3;
  *(_OWORD *)&retstr->size.height = *(_OWORD *)&self[2].origin.z;
  return self;
}

- (void)setRegion:(GTRegion *)a3
{
  long long v4 = *(_OWORD *)&a3->origin.z;
  long long v3 = *(_OWORD *)&a3->size.height;
  *(_OWORD *)&self->_region.origin.x = *(_OWORD *)&a3->origin.x;
  *(_OWORD *)&self->_region.origin.z = v4;
  *(_OWORD *)&self->_region.size.height = v3;
}

- (BOOL)resolveMultisampleTexture
{
  return self->_resolveMultisampleTexture;
}

- (void)setResolveMultisampleTexture:(BOOL)a3
{
  self->_resolveMultisampleTexture = a3;
}

@end