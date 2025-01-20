@interface GEOEditionEntry
- ($3196F7F1D1CBC0EF828A393E672412EF)tileset;
- (BOOL)invalidateOnly;
- (unsigned)edition;
- (unsigned)provider;
- (void)setEdition:(unsigned int)a3;
- (void)setInvalidateOnly:(BOOL)a3;
- (void)setProvider:(unsigned int)a3;
- (void)setTileset:(id)a3;
@end

@implementation GEOEditionEntry

- ($3196F7F1D1CBC0EF828A393E672412EF)tileset
{
  return ($3196F7F1D1CBC0EF828A393E672412EF)self->_tileset.value;
}

- (void)setTileset:(id)a3
{
  self->_tileset.value = a3.var0;
}

- (unsigned)edition
{
  return self->_tileset.structured.var0.standard;
}

- (void)setEdition:(unsigned int)a3
{
  self->_tileset.structured.var0.standard = ($DCC98B375FC8DDD19A11F3C3530876B8)a3;
}

- (unsigned)provider
{
  return self->_edition;
}

- (void)setProvider:(unsigned int)a3
{
  self->_edition = a3;
}

- (BOOL)invalidateOnly
{
  return self->_provider;
}

- (void)setInvalidateOnly:(BOOL)a3
{
  LOBYTE(self->_provider) = a3;
}

@end