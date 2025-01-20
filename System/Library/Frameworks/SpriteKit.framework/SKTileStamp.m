@interface SKTileStamp
+ (BOOL)supportsSecureCoding;
+ (id)tileStampWithWidth:(unint64_t)a3 height:(unint64_t)a4 tileData:(unsigned int *)a5;
- (BOOL)isEqualToNode:(id)a3;
- (SKTileStamp)init;
- (SKTileStamp)initWithCoder:(id)a3;
- (SKTileStamp)initWithWidth:(unint64_t)a3 height:(unint64_t)a4 tileData:(unsigned int *)a5;
- (id)tileDefinitionsForTileMap:(id)a3;
- (unint64_t)numberOfColumns;
- (unint64_t)numberOfRows;
- (unsigned)tileData;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setTileData:(unsigned int *)a3 size:(unint64_t)a4;
@end

@implementation SKTileStamp

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)numberOfColumns
{
  return self->_columns;
}

- (unint64_t)numberOfRows
{
  return self->_rows;
}

- (unsigned)tileData
{
  return self->_tileData;
}

- (void)dealloc
{
  free(self->_tileData);
  self->_tileData = 0;
  v3.receiver = self;
  v3.super_class = (Class)SKTileStamp;
  [(SKTileStamp *)&v3 dealloc];
}

- (SKTileStamp)init
{
  v3.receiver = self;
  v3.super_class = (Class)SKTileStamp;
  result = [(SKTileStamp *)&v3 init];
  if (result)
  {
    *(void *)&result->_columns = 0;
    result->_tileData = 0;
  }
  return result;
}

- (SKTileStamp)initWithWidth:(unint64_t)a3 height:(unint64_t)a4 tileData:(unsigned int *)a5
{
  unsigned int v6 = a4;
  unsigned int v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SKTileStamp;
  v8 = [(SKTileStamp *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_columns = v7;
    v8->_rows = v6;
    [(SKTileStamp *)v8 setTileData:a5 size:4 * v7 * v6];
  }
  return v9;
}

+ (id)tileStampWithWidth:(unint64_t)a3 height:(unint64_t)a4 tileData:(unsigned int *)a5
{
  v5 = [[SKTileStamp alloc] initWithWidth:a3 height:a4 tileData:a5];

  return v5;
}

- (SKTileStamp)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKTileStamp;
  v5 = [(SKTileStamp *)&v9 init];
  if (v5)
  {
    v5->_columns = [v4 decodeIntegerForKey:@"_columns"];
    v5->_rows = [v4 decodeIntegerForKey:@"_rows"];
    uint64_t v8 = 0;
    uint64_t v6 = [v4 decodeBytesForKey:@"_tileData" returnedLength:&v8];
    if (v8 == 4 * v5->_rows * v5->_columns) {
      -[SKTileStamp setTileData:size:](v5, "setTileData:size:", v6);
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeInteger:self->_columns forKey:@"_columns"];
  [v5 encodeInteger:self->_rows forKey:@"_rows"];
  tileData = self->_tileData;
  if (tileData) {
    [v5 encodeBytes:tileData length:4 * self->_columns * (unint64_t)self->_rows forKey:@"_tileData"];
  }
}

- (BOOL)isEqualToNode:(id)a3
{
  id v4 = (SKTileStamp *)a3;
  id v5 = v4;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    uint64_t v6 = v4;
    unsigned int v7 = v6;
    unsigned int columns = self->_columns;
    BOOL v10 = columns == v6->_columns
       && (unsigned int rows = self->_rows, rows == v6->_rows)
       && memcmp(self->_tileData, v6->_tileData, rows * columns) == 0;
  }
  return v10;
}

- (void)setTileData:(unsigned int *)a3 size:(unint64_t)a4
{
  free(self->_tileData);
  unsigned int v7 = (unsigned int *)malloc_type_malloc(a4, 0xE30070EFuLL);
  self->_tileData = v7;

  memcpy(v7, a3, a4);
}

- (id)tileDefinitionsForTileMap:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  uint64_t v6 = self->_rows * self->_columns;
  unsigned int v7 = objc_alloc_init(SKTileDefinition);
  if (v6)
  {
    unint64_t v8 = 0;
    uint64_t v9 = 4 * v6;
    do
    {
      BOOL v10 = [v4 tileDefinitionForTileID:self->_tileData[v8 / 4]];
      if (v10) {
        objc_super v11 = v10;
      }
      else {
        objc_super v11 = v7;
      }
      [v5 addObject:v11];

      v8 += 4;
    }
    while (v9 != v8);
  }

  return v5;
}

@end