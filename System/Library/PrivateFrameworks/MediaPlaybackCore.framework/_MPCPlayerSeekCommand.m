@interface _MPCPlayerSeekCommand
- (BOOL)prefersNegativeBackwardSkipIntervals;
- (NSArray)preferredBackwardJumpIntervals;
- (NSArray)preferredForwardJumpIntervals;
- (_MPCPlayerSeekCommand)initWithResponse:(id)a3 seekSupport:(unint64_t)a4;
- (id)_seekCommandWithMediaRemoteCommand:(unsigned int)a3 options:(id)a4;
- (id)beginSeekWithDirection:(int64_t)a3;
- (id)changePositionToElapsedInterval:(double)a3;
- (id)changePositionToElapsedInterval:(double)a3 referenceInterval:(double)a4;
- (id)endSeek;
- (id)jumpByInterval:(double)a3;
- (unint64_t)seekSupport;
- (void)setPreferredBackwardJumpIntervals:(id)a3;
- (void)setPreferredForwardJumpIntervals:(id)a3;
- (void)setPrefersNegativeBackwardSkipIntervals:(BOOL)a3;
@end

@implementation _MPCPlayerSeekCommand

- (id)changePositionToElapsedInterval:(double)a3
{
  if ((self->_seekSupport & 0x80) != 0)
  {
    v6 = [MEMORY[0x263EFF9A0] dictionary];
    v7 = [NSNumber numberWithDouble:a3];
    [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x263F54D10]];

    v3 = [(_MPCPlayerSeekCommand *)self _seekCommandWithMediaRemoteCommand:24 options:v6];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)endSeek
{
  unint64_t seekSupport = self->_seekSupport;
  if ((seekSupport & 4) != 0)
  {
    uint64_t v4 = 9;
  }
  else
  {
    if ((seekSupport & 0x10) == 0)
    {
      v3 = 0;
      goto LABEL_7;
    }
    uint64_t v4 = 11;
  }
  v3 = [(_MPCPlayerSeekCommand *)self _seekCommandWithMediaRemoteCommand:v4 options:0];
LABEL_7:

  return v3;
}

- (id)beginSeekWithDirection:(int64_t)a3
{
  if (a3 == -1)
  {
    if ((self->_seekSupport & 8) != 0)
    {
      uint64_t v3 = 10;
      goto LABEL_8;
    }
LABEL_6:
    uint64_t v4 = 0;
    goto LABEL_9;
  }
  if (a3 != 1 || (self->_seekSupport & 2) == 0) {
    goto LABEL_6;
  }
  uint64_t v3 = 8;
LABEL_8:
  uint64_t v4 = [(_MPCPlayerSeekCommand *)self _seekCommandWithMediaRemoteCommand:v3 options:0];
LABEL_9:

  return v4;
}

- (id)_seekCommandWithMediaRemoteCommand:(unsigned int)a3 options:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v7 = [(_MPCPlayerItemCommand *)self contentItemID];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    if (!v6)
    {
      id v6 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:1];
    }
    v9 = [(_MPCPlayerItemCommand *)self contentItemID];
    [v6 setObject:v9 forKeyedSubscript:*MEMORY[0x263F54CF8]];
  }
  v10 = [(_MPCPlayerCommand *)self response];
  v11 = [MPCPlayerCommandRequest alloc];
  v12 = [v10 controller];
  v13 = [v10 request];
  v14 = [v13 label];
  v15 = [(MPCPlayerCommandRequest *)v11 initWithMediaRemoteCommand:v4 options:v6 controller:v12 label:v14];

  return v15;
}

- (unint64_t)seekSupport
{
  return self->_seekSupport;
}

- (_MPCPlayerSeekCommand)initWithResponse:(id)a3 seekSupport:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)_MPCPlayerSeekCommand;
  result = [(_MPCPlayerCommand *)&v6 initWithResponse:a3];
  if (result) {
    result->_unint64_t seekSupport = a4;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredForwardJumpIntervals, 0);

  objc_storeStrong((id *)&self->_preferredBackwardJumpIntervals, 0);
}

- (NSArray)preferredForwardJumpIntervals
{
  return self->_preferredForwardJumpIntervals;
}

- (NSArray)preferredBackwardJumpIntervals
{
  return self->_preferredBackwardJumpIntervals;
}

- (id)jumpByInterval:(double)a3
{
  double v3 = a3;
  if (a3 <= 0.0)
  {
    if (a3 < 0.0 && (self->_seekSupport & 0x40) != 0)
    {
      if (![(_MPCPlayerSeekCommand *)self prefersNegativeBackwardSkipIntervals]) {
        double v3 = -v3;
      }
      v5 = [MEMORY[0x263EFF9A0] dictionary];
      v10 = [NSNumber numberWithDouble:v3];
      [v5 setObject:v10 forKeyedSubscript:*MEMORY[0x263F54D90]];

      v7 = self;
      uint64_t v8 = 18;
      goto LABEL_10;
    }
LABEL_6:
    v9 = 0;
    goto LABEL_11;
  }
  if ((self->_seekSupport & 0x20) == 0) {
    goto LABEL_6;
  }
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  objc_super v6 = [NSNumber numberWithDouble:v3];
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x263F54D90]];

  v7 = self;
  uint64_t v8 = 17;
LABEL_10:
  v9 = [(_MPCPlayerSeekCommand *)v7 _seekCommandWithMediaRemoteCommand:v8 options:v5];

LABEL_11:

  return v9;
}

- (void)setPreferredForwardJumpIntervals:(id)a3
{
}

- (void)setPreferredBackwardJumpIntervals:(id)a3
{
}

- (void)setPrefersNegativeBackwardSkipIntervals:(BOOL)a3
{
  self->_prefersNegativeBackwardSkipIntervals = a3;
}

- (BOOL)prefersNegativeBackwardSkipIntervals
{
  return self->_prefersNegativeBackwardSkipIntervals;
}

- (id)changePositionToElapsedInterval:(double)a3 referenceInterval:(double)a4
{
  if ((self->_seekSupport & 0x100) != 0)
  {
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    v9 = [NSNumber numberWithDouble:a3];
    [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x263F54D10]];

    v10 = [NSNumber numberWithDouble:a4];
    [v8 setObject:v10 forKeyedSubscript:*MEMORY[0x263F54D58]];

    uint64_t v4 = [(_MPCPlayerSeekCommand *)self _seekCommandWithMediaRemoteCommand:24 options:v8];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

@end