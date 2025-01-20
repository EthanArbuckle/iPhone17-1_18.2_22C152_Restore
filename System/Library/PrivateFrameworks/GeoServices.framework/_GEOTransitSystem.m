@interface _GEOTransitSystem
+ (BOOL)supportsSecureCoding;
- (GEOStyleAttributes)styleAttributes;
- (GEOTransitArtworkDataSource)artwork;
- (NSString)name;
- (_GEOTransitSystem)initWithCoder:(id)a3;
- (_GEOTransitSystem)initWithSystem:(id)a3;
- (unint64_t)muid;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _GEOTransitSystem

- (_GEOTransitSystem)initWithSystem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_GEOTransitSystem;
  v6 = [(_GEOTransitSystem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_system, a3);
  }

  return v7;
}

- (unint64_t)muid
{
  return [(GEOPBTransitSystem *)self->_system muid];
}

- (NSString)name
{
  return [(GEOPBTransitSystem *)self->_system nameDisplayString];
}

- (GEOTransitArtworkDataSource)artwork
{
  return (GEOTransitArtworkDataSource *)[(GEOPBTransitSystem *)self->_system artwork];
}

- (GEOStyleAttributes)styleAttributes
{
  return [(GEOPBTransitSystem *)self->_system styleAttributes];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GEOTransitSystem)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_GEOTransitSystem;
  id v5 = [(_GEOTransitSystem *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_system"];
    system = v5->_system;
    v5->_system = (GEOPBTransitSystem *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void).cxx_destruct
{
}

@end