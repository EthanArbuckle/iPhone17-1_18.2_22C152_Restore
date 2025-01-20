@interface GEORawPathGeometry
+ (BOOL)supportsSecureCoding;
- (GEOPathMapMatcherInstructions)pathMatcherInstructions;
- (GEORawPathGeometry)initWithCoder:(id)a3;
- (GEORawPathGeometry)initWithRawData:(id)a3 pathMatcherInstructions:(id)a4;
- (NSData)rawData;
- (RoutingPathLeg)decompressedPathData;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEORawPathGeometry

- (GEORawPathGeometry)initWithRawData:(id)a3 pathMatcherInstructions:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEORawPathGeometry;
  v9 = [(GEORawPathGeometry *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rawData, a3);
    objc_storeStrong((id *)&v10->_pathMatcherInstructions, a4);
  }

  return v10;
}

- (GEOPathMapMatcherInstructions)pathMatcherInstructions
{
  return self->_pathMatcherInstructions;
}

- (RoutingPathLeg)decompressedPathData
{
  +[PathCodec routingPathLegForData:(maps::path_codec::geo3::RoutingPathLeg *)retstr];
  +[PathCodec decompressInPlace:]((uint64_t)PathCodec, (uint64_t)retstr);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_rawData forKey:@"_rawData"];
  [v4 encodeObject:self->_pathMatcherInstructions forKey:@"_pathMatcherInstructions"];
}

- (GEORawPathGeometry)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEORawPathGeometry;
  v5 = [(GEORawPathGeometry *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_rawData"];
    rawData = v5->_rawData;
    v5->_rawData = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_pathMatcherInstructions"];
    pathMatcherInstructions = v5->_pathMatcherInstructions;
    v5->_pathMatcherInstructions = (GEOPathMapMatcherInstructions *)v8;

    v10 = v5;
  }

  return v5;
}

- (NSData)rawData
{
  return self->_rawData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathMatcherInstructions, 0);

  objc_storeStrong((id *)&self->_rawData, 0);
}

@end