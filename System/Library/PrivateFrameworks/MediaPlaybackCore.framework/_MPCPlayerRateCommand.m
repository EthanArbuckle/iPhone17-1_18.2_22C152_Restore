@interface _MPCPlayerRateCommand
- (float)maximumValue;
- (float)minimumValue;
- (id)changeValue:(float)a3;
- (void)setMaximumValue:(float)a3;
- (void)setMinimumValue:(float)a3;
@end

@implementation _MPCPlayerRateCommand

- (void)setMaximumValue:(float)a3
{
  self->_maximumValue = a3;
}

- (float)maximumValue
{
  return self->_maximumValue;
}

- (void)setMinimumValue:(float)a3
{
  self->_minimumValue = a3;
}

- (float)minimumValue
{
  return self->_minimumValue;
}

- (id)changeValue:(float)a3
{
  [(_MPCPlayerRateCommand *)self minimumValue];
  if (v5 <= a3 && ([(_MPCPlayerRateCommand *)self maximumValue], v6 >= a3))
  {
    v8 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
    *(float *)&double v9 = a3;
    v10 = [NSNumber numberWithFloat:v9];
    [v8 setObject:v10 forKeyedSubscript:*MEMORY[0x263F54D50]];

    v11 = [(_MPCPlayerItemCommand *)self contentItemID];
    uint64_t v12 = [v11 length];

    if (v12)
    {
      v13 = [(_MPCPlayerItemCommand *)self contentItemID];
      [v8 setObject:v13 forKeyedSubscript:*MEMORY[0x263F54C98]];
    }
    v14 = [(_MPCPlayerCommand *)self response];
    v15 = [MPCPlayerCommandRequest alloc];
    v16 = [v14 controller];
    v17 = [v14 request];
    v18 = [v17 label];
    v7 = [(MPCPlayerCommandRequest *)v15 initWithMediaRemoteCommand:20 options:v8 controller:v16 label:v18];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end