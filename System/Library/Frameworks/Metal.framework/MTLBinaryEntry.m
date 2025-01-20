@interface MTLBinaryEntry
- (MTLBinaryEntry)initWithData:(id)a3;
- (MTLBinaryEntry)initWithData:(id)a3 binaryPosition:(unint64_t)a4;
- (MTLBinaryEntry)initWithData:(id)a3 importedSymbols:(id)a4 importedLibraries:(id)a5;
- (MTLBinaryEntry)initWithData:(id)a3 reflectionBlock:(id)a4;
- (MTLBinaryEntry)initWithData:(id)a3 reflectionBlock:(id)a4 binaryPosition:(unint64_t)a5;
- (NSArray)importedLibraries;
- (NSArray)importedSymbols;
- (NSArray)linkedBitcodes;
- (OS_dispatch_data)airScript;
- (OS_dispatch_data)bitcode;
- (OS_dispatch_data)data;
- (OS_dispatch_data)reflectionBlock;
- (id)description;
- (int)reflectionFlags;
- (unint64_t)binaryPosition;
- (unint64_t)index;
- (void)addReflectionWithData:(id)a3 flag:(int)a4;
- (void)dealloc;
- (void)internalInitWithData:(id)a3 reflectionBlock:(id)a4 binaryPosition:(unint64_t)a5;
- (void)setAirScript:(id)a3;
- (void)setBitcode:(id)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setLinkedBitcodes:(id)a3;
@end

@implementation MTLBinaryEntry

- (OS_dispatch_data)reflectionBlock
{
  return self->_reflectionBlock;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (MTLBinaryEntry)initWithData:(id)a3 reflectionBlock:(id)a4 binaryPosition:(unint64_t)a5
{
  v11.receiver = self;
  v11.super_class = (Class)MTLBinaryEntry;
  v8 = [(MTLBinaryEntry *)&v11 init];
  v9 = v8;
  if (v8) {
    [(MTLBinaryEntry *)v8 internalInitWithData:a3 reflectionBlock:a4 binaryPosition:a5];
  }
  return v9;
}

- (void)internalInitWithData:(id)a3 reflectionBlock:(id)a4 binaryPosition:(unint64_t)a5
{
  self->_reflectionFlags = 0;
  dispatch_retain((dispatch_object_t)a3);
  self->_data = (OS_dispatch_data *)a3;
  if (a4)
  {
    self->_reflectionBlock = (OS_dispatch_data *)a4;
    dispatch_retain((dispatch_object_t)a4);
    self->_reflectionFlags = MTLGetReflectionFlags(a4);
  }
  self->_binaryPosition = a5;
  *(_OWORD *)&self->_importedLibraries = 0u;
  *(_OWORD *)&self->_linkedBitcodes = 0u;
  self->_airScript = 0;
}

- (int)reflectionFlags
{
  return self->_reflectionFlags;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_data);
  bitcode = self->_bitcode;
  if (bitcode) {
    dispatch_release(bitcode);
  }
  airScript = self->_airScript;
  if (airScript) {
    dispatch_release(airScript);
  }
  reflectionBlock = self->_reflectionBlock;
  if (reflectionBlock) {
    dispatch_release(reflectionBlock);
  }

  v6.receiver = self;
  v6.super_class = (Class)MTLBinaryEntry;
  [(MTLBinaryEntry *)&v6 dealloc];
}

- (OS_dispatch_data)data
{
  return self->_data;
}

- (MTLBinaryEntry)initWithData:(id)a3 importedSymbols:(id)a4 importedLibraries:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)MTLBinaryEntry;
  v8 = [(MTLBinaryEntry *)&v13 init];
  if (v8)
  {
    dispatch_retain((dispatch_object_t)a3);
    v8->_data = (OS_dispatch_data *)a3;
    v9 = (void *)MEMORY[0x1E4F1CBF0];
    if (a4) {
      id v10 = a4;
    }
    else {
      id v10 = (id)MEMORY[0x1E4F1CBF0];
    }
    v8->_importedSymbols = (NSArray *)v10;
    if (a5) {
      id v11 = a5;
    }
    else {
      id v11 = v9;
    }
    v8->_importedLibraries = (NSArray *)v11;
    v8->_bitcode = 0;
    v8->_airScript = 0;
    v8->_linkedBitcodes = 0;
    v8->_binaryPosition = 0xFFFFFFFFLL;
  }
  return v8;
}

- (MTLBinaryEntry)initWithData:(id)a3 binaryPosition:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MTLBinaryEntry;
  objc_super v6 = [(MTLBinaryEntry *)&v9 init];
  if (v6)
  {
    dispatch_retain((dispatch_object_t)a3);
    v6->_data = (OS_dispatch_data *)a3;
    v7 = (void *)MEMORY[0x1E4F1CBF0];
    v6->_importedSymbols = (NSArray *)MEMORY[0x1E4F1CBF0];
    v6->_importedLibraries = (NSArray *)v7;
    v6->_bitcode = 0;
    v6->_airScript = 0;
    v6->_binaryPosition = a4;
    v6->_linkedBitcodes = 0;
  }
  return v6;
}

- (MTLBinaryEntry)initWithData:(id)a3 reflectionBlock:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MTLBinaryEntry;
  objc_super v6 = [(MTLBinaryEntry *)&v9 init];
  v7 = v6;
  if (v6) {
    [(MTLBinaryEntry *)v6 internalInitWithData:a3 reflectionBlock:a4 binaryPosition:0xFFFFFFFFLL];
  }
  return v7;
}

- (void)addReflectionWithData:(id)a3 flag:(int)a4
{
  v5 = (OS_dispatch_data *)MTLNewReflectionBlock((dispatch_object_t)self->_reflectionBlock, (dispatch_object_t)a3, a4);
  reflectionBlock = self->_reflectionBlock;
  if (reflectionBlock) {
    dispatch_release(reflectionBlock);
  }
  self->_reflectionBlock = v5;
}

- (MTLBinaryEntry)initWithData:(id)a3
{
  return [(MTLBinaryEntry *)self initWithData:a3 binaryPosition:0xFFFFFFFFLL];
}

- (id)description
{
  v5.receiver = self;
  v5.super_class = (Class)MTLBinaryEntry;
  id v3 = [(MTLBinaryEntry *)&v5 description];
  return (id)objc_msgSend(v3, "stringByAppendingFormat:", @" (%lu bytes)", dispatch_data_get_size((dispatch_data_t)self->_data));
}

- (OS_dispatch_data)bitcode
{
  return self->_bitcode;
}

- (void)setBitcode:(id)a3
{
  bitcode = self->_bitcode;
  if (bitcode) {
    dispatch_release(bitcode);
  }
  self->_bitcode = (OS_dispatch_data *)a3;

  dispatch_retain((dispatch_object_t)a3);
}

- (OS_dispatch_data)airScript
{
  return self->_airScript;
}

- (void)setAirScript:(id)a3
{
  airScript = self->_airScript;
  if (airScript) {
    dispatch_release(airScript);
  }
  self->_airScript = (OS_dispatch_data *)a3;

  dispatch_retain((dispatch_object_t)a3);
}

- (NSArray)linkedBitcodes
{
  return self->_linkedBitcodes;
}

- (void)setLinkedBitcodes:(id)a3
{
  linkedBitcodes = self->_linkedBitcodes;
  if (linkedBitcodes)
  {
    id v6 = a3;

    a3 = v6;
  }
  self->_linkedBitcodes = (NSArray *)a3;

  id v5 = a3;
}

- (unint64_t)binaryPosition
{
  return self->_binaryPosition;
}

- (NSArray)importedSymbols
{
  return self->_importedSymbols;
}

- (NSArray)importedLibraries
{
  return self->_importedLibraries;
}

- (unint64_t)index
{
  return self->_index;
}

@end