@interface CNSegment
- (BOOL)isValid;
- (CNSegment)initWithStart:(int64_t)a3 end:(int64_t)a4;
- (NSNumber)end;
- (NSNumber)start;
- (unint64_t)count;
- (unint64_t)indexOffsetFrom:(unint64_t)a3;
- (void)setEnd:(id)a3;
- (void)setStart:(id)a3;
@end

@implementation CNSegment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_end, 0);

  objc_storeStrong((id *)&self->_start, 0);
}

- (void)setEnd:(id)a3
{
}

- (NSNumber)end
{
  return self->_end;
}

- (void)setStart:(id)a3
{
}

- (NSNumber)start
{
  return self->_start;
}

- (unint64_t)indexOffsetFrom:(unint64_t)a3
{
  v5 = [(CNSegment *)self start];
  unint64_t v6 = [v5 unsignedIntegerValue] + a3;

  v7 = [(CNSegment *)self end];
  if (v6 > [v7 unsignedIntegerValue])
  {
    v8 = [(CNSegment *)self end];
    unint64_t v6 = [v8 unsignedIntegerValue];
  }
  return v6;
}

- (unint64_t)count
{
  v3 = [(CNSegment *)self end];
  uint64_t v4 = [v3 unsignedIntegerValue];
  v5 = [(CNSegment *)self start];
  unint64_t v6 = v4 - [v5 unsignedIntegerValue] + 1;

  return v6;
}

- (BOOL)isValid
{
  v3 = [(CNSegment *)self start];
  if ([v3 integerValue] < 0)
  {
    BOOL v5 = 0;
  }
  else
  {
    uint64_t v4 = [(CNSegment *)self end];
    BOOL v5 = [v4 integerValue] >= 0;
  }
  return v5;
}

- (CNSegment)initWithStart:(int64_t)a3 end:(int64_t)a4
{
  v13.receiver = self;
  v13.super_class = (Class)CNSegment;
  unint64_t v6 = [(CNSegment *)&v13 init];
  if (v6)
  {
    uint64_t v7 = [NSNumber numberWithInteger:a3];
    start = v6->_start;
    v6->_start = (NSNumber *)v7;

    uint64_t v9 = [NSNumber numberWithInteger:a4];
    end = v6->_end;
    v6->_end = (NSNumber *)v9;

    v11 = v6;
  }

  return v6;
}

@end