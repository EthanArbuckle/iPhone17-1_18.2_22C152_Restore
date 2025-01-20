@interface _MPCPlayerRepeatCommand
- (BOOL)supportsAdvanceRepeat;
- (BOOL)supportsChangeRepeat;
- (NSArray)supportedRepeatTypes;
- (id)advance;
- (id)setRepeatType:(int64_t)a3;
- (int64_t)currentRepeatType;
- (void)setCurrentRepeatType:(int64_t)a3;
- (void)setSupportedRepeatTypes:(id)a3;
- (void)setSupportsAdvanceRepeat:(BOOL)a3;
- (void)setSupportsChangeRepeat:(BOOL)a3;
@end

@implementation _MPCPlayerRepeatCommand

- (void).cxx_destruct
{
}

- (void)setSupportsAdvanceRepeat:(BOOL)a3
{
  self->_supportsAdvanceRepeat = a3;
}

- (BOOL)supportsAdvanceRepeat
{
  return self->_supportsAdvanceRepeat;
}

- (void)setSupportsChangeRepeat:(BOOL)a3
{
  self->_supportsChangeRepeat = a3;
}

- (BOOL)supportsChangeRepeat
{
  return self->_supportsChangeRepeat;
}

- (void)setSupportedRepeatTypes:(id)a3
{
}

- (NSArray)supportedRepeatTypes
{
  return self->_supportedRepeatTypes;
}

- (void)setCurrentRepeatType:(int64_t)a3
{
  self->_currentRepeatType = a3;
}

- (int64_t)currentRepeatType
{
  return self->_currentRepeatType;
}

- (id)advance
{
  v19[1] = *MEMORY[0x263EF8340];
  if ([(_MPCPlayerRepeatCommand *)self supportsAdvanceRepeat])
  {
    v3 = [(_MPCPlayerCommand *)self response];
    v4 = [MPCPlayerCommandRequest alloc];
    v5 = [v3 controller];
    v6 = [v3 request];
    v7 = [v6 label];
    v8 = [(MPCPlayerCommandRequest *)v4 initWithMediaRemoteCommand:7 options:0 controller:v5 label:v7];

    uint64_t v18 = *MEMORY[0x263F54A18];
    v19[0] = MEMORY[0x263EFFA88];
    v9 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    [(MPCPlayerCommandRequest *)v8 setUserInitiatedOptions:v9];
  }
  else if ([(_MPCPlayerRepeatCommand *)self supportsChangeRepeat])
  {
    v10 = [(_MPCPlayerRepeatCommand *)self supportedRepeatTypes];
    v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[_MPCPlayerRepeatCommand currentRepeatType](self, "currentRepeatType"));
    uint64_t v12 = [v10 indexOfObject:v11];

    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v13 = 0;
    }
    else
    {
      v14 = [(_MPCPlayerRepeatCommand *)self supportedRepeatTypes];
      unint64_t v13 = (v12 + 1) % (unint64_t)[v14 count];
    }
    v15 = [(_MPCPlayerRepeatCommand *)self supportedRepeatTypes];
    v16 = [v15 objectAtIndexedSubscript:v13];

    -[_MPCPlayerRepeatCommand setRepeatType:](self, "setRepeatType:", [v16 integerValue]);
    v8 = (MPCPlayerCommandRequest *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)setRepeatType:(int64_t)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  if ([(_MPCPlayerRepeatCommand *)self supportsChangeRepeat])
  {
    uint64_t v16 = *MEMORY[0x263F54D68];
    v4 = [NSNumber numberWithInt:MPRepeatTypeToMediaRemoteRepeatMode()];
    v17[0] = v4;
    v5 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];

    v6 = [(_MPCPlayerCommand *)self response];
    v7 = [MPCPlayerCommandRequest alloc];
    v8 = [v6 controller];
    v9 = [v6 request];
    v10 = [v9 label];
    v11 = [(MPCPlayerCommandRequest *)v7 initWithMediaRemoteCommand:25 options:v5 controller:v8 label:v10];

    uint64_t v14 = *MEMORY[0x263F54A18];
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