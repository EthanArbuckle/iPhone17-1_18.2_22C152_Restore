@interface _MPCPlayerShuffleCommand
- (BOOL)supportsAdvanceShuffle;
- (BOOL)supportsChangeShuffle;
- (NSArray)supportedShuffleTypes;
- (id)advance;
- (id)setShuffleType:(int64_t)a3;
- (int64_t)currentShuffleType;
- (void)setCurrentShuffleType:(int64_t)a3;
- (void)setSupportedShuffleTypes:(id)a3;
- (void)setSupportsAdvanceShuffle:(BOOL)a3;
- (void)setSupportsChangeShuffle:(BOOL)a3;
@end

@implementation _MPCPlayerShuffleCommand

- (void).cxx_destruct
{
}

- (void)setSupportsAdvanceShuffle:(BOOL)a3
{
  self->_supportsAdvanceShuffle = a3;
}

- (BOOL)supportsAdvanceShuffle
{
  return self->_supportsAdvanceShuffle;
}

- (void)setSupportsChangeShuffle:(BOOL)a3
{
  self->_supportsChangeShuffle = a3;
}

- (BOOL)supportsChangeShuffle
{
  return self->_supportsChangeShuffle;
}

- (void)setSupportedShuffleTypes:(id)a3
{
}

- (NSArray)supportedShuffleTypes
{
  return self->_supportedShuffleTypes;
}

- (void)setCurrentShuffleType:(int64_t)a3
{
  self->_currentShuffleType = a3;
}

- (int64_t)currentShuffleType
{
  return self->_currentShuffleType;
}

- (id)advance
{
  v19[1] = *MEMORY[0x263EF8340];
  if ([(_MPCPlayerShuffleCommand *)self supportsAdvanceShuffle])
  {
    v3 = [(_MPCPlayerCommand *)self response];
    v4 = [MPCPlayerCommandRequest alloc];
    v5 = [v3 controller];
    v6 = [v3 request];
    v7 = [v6 label];
    v8 = [(MPCPlayerCommandRequest *)v4 initWithMediaRemoteCommand:6 options:0 controller:v5 label:v7];

    uint64_t v18 = *MEMORY[0x263F54A20];
    v19[0] = MEMORY[0x263EFFA88];
    v9 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    [(MPCPlayerCommandRequest *)v8 setUserInitiatedOptions:v9];
  }
  else if ([(_MPCPlayerShuffleCommand *)self supportsChangeShuffle])
  {
    v10 = [(_MPCPlayerShuffleCommand *)self supportedShuffleTypes];
    v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[_MPCPlayerShuffleCommand currentShuffleType](self, "currentShuffleType"));
    uint64_t v12 = [v10 indexOfObject:v11];

    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v13 = 0;
    }
    else
    {
      v14 = [(_MPCPlayerShuffleCommand *)self supportedShuffleTypes];
      unint64_t v13 = (v12 + 1) % (unint64_t)[v14 count];
    }
    v15 = [(_MPCPlayerShuffleCommand *)self supportedShuffleTypes];
    v16 = [v15 objectAtIndexedSubscript:v13];

    -[_MPCPlayerShuffleCommand setShuffleType:](self, "setShuffleType:", [v16 integerValue]);
    v8 = (MPCPlayerCommandRequest *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)setShuffleType:(int64_t)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  if ([(_MPCPlayerShuffleCommand *)self supportsChangeShuffle])
  {
    uint64_t v16 = *MEMORY[0x263F54D80];
    v4 = [NSNumber numberWithInt:MPShuffleTypeToMediaRemoteShuffleMode()];
    v17[0] = v4;
    v5 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];

    v6 = [(_MPCPlayerCommand *)self response];
    v7 = [MPCPlayerCommandRequest alloc];
    v8 = [v6 controller];
    v9 = [v6 request];
    v10 = [v9 label];
    v11 = [(MPCPlayerCommandRequest *)v7 initWithMediaRemoteCommand:26 options:v5 controller:v8 label:v10];

    uint64_t v14 = *MEMORY[0x263F54A20];
    uint64_t v15 = MEMORY[0x263EFFA88];
    uint64_t v12 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    [(MPCPlayerCommandRequest *)v11 setUserInitiatedOptions:v12];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end