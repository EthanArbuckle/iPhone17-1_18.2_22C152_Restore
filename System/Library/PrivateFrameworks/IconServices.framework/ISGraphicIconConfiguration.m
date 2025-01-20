@interface ISGraphicIconConfiguration
- (NSArray)enclosureColors;
- (NSArray)symbolColors;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)renderingMode;
- (void)setEnclosureColors:(id)a3;
- (void)setRenderingMode:(int64_t)a3;
- (void)setSymbolColors:(id)a3;
@end

@implementation ISGraphicIconConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(NSArray *)self->_enclosureColors copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSArray *)self->_symbolColors copy];
  v8 = (void *)v4[1];
  v4[1] = v7;

  v4[3] = self->_renderingMode;
  return v4;
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)ISGraphicIconConfiguration;
  v4 = [(ISGraphicIconConfiguration *)&v9 description];
  uint64_t v5 = [(ISGraphicIconConfiguration *)self symbolColors];
  v6 = [(ISGraphicIconConfiguration *)self enclosureColors];
  uint64_t v7 = [v3 stringWithFormat:@"%@ Symbol color: %@ Enclosure color: %@ Rendering mode: %ld", v4, v5, v6, -[ISGraphicIconConfiguration renderingMode](self, "renderingMode")];

  return v7;
}

- (NSArray)symbolColors
{
  return self->_symbolColors;
}

- (void)setSymbolColors:(id)a3
{
}

- (NSArray)enclosureColors
{
  return self->_enclosureColors;
}

- (void)setEnclosureColors:(id)a3
{
}

- (int64_t)renderingMode
{
  return self->_renderingMode;
}

- (void)setRenderingMode:(int64_t)a3
{
  self->_renderingMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enclosureColors, 0);
  objc_storeStrong((id *)&self->_symbolColors, 0);
}

@end