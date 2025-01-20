@interface GTMTLReplayRasterMapQuery
+ (BOOL)supportsSecureCoding;
- (GTMTLReplayRasterMapQuery)initWithCoder:(id)a3;
- (GTSize)physicalGranularity;
- (NSArray)layers;
- (void)encodeWithCoder:(id)a3;
- (void)setLayers:(id)a3;
- (void)setPhysicalGranularity:(GTSize *)a3;
@end

@implementation GTMTLReplayRasterMapQuery

- (void).cxx_destruct
{
}

- (void)setLayers:(id)a3
{
}

- (NSArray)layers
{
  return self->_layers;
}

- (void)setPhysicalGranularity:(GTSize *)a3
{
  long long v3 = *(_OWORD *)&a3->width;
  self->_physicalGranularity.depth = a3->depth;
  *(_OWORD *)&self->_physicalGranularity.width = v3;
}

- (GTSize)physicalGranularity
{
  *retstr = *(GTSize *)&self->depth;
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t width = self->_physicalGranularity.width;
  id v5 = a3;
  [v5 encodeInt64:width forKey:@"physicalGranularity.width"];
  [v5 encodeInt64:self->_physicalGranularity.height forKey:@"physicalGranularity.height"];
  [v5 encodeInt64:self->_physicalGranularity.depth forKey:@"physicalGranularity.depth"];
  [v5 encodeObject:self->_layers forKey:@"layers"];
}

- (GTMTLReplayRasterMapQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GTMTLReplayRasterMapQuery;
  id v5 = [(GTMTLReplayRasterMapQuery *)&v14 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(), 0);
    v5->_physicalGranularity.unint64_t width = (unint64_t)[v4 decodeInt64ForKey:@"physicalGranularity.width"];
    v5->_physicalGranularity.height = (unint64_t)[v4 decodeInt64ForKey:@"physicalGranularity.height"];
    v5->_physicalGranularity.depth = (unint64_t)[v4 decodeInt64ForKey:@"physicalGranularity.depth"];
    uint64_t v8 = objc_opt_class();
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"layers"];
    layers = v5->_layers;
    v5->_layers = (NSArray *)v10;

    v12 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end