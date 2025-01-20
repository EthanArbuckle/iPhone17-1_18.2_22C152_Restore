@interface HSIORSample
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSample:(id)a3;
- (HSIORChannelDescription)channelDescription;
- (HSIORSample)initWithIOReportSampleRef:(__CFDictionary *)a3;
- (NSNumber)count;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setChannelDescription:(id)a3;
- (void)setCount:(id)a3;
@end

@implementation HSIORSample

- (HSIORSample)initWithIOReportSampleRef:(__CFDictionary *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)HSIORSample;
  v4 = [(HSIORSample *)&v11 init];
  if (v4)
  {
    v5 = [[HSIORChannelDescription alloc] initWithIOReportChannelRef:a3];
    channelDescription = v4->_channelDescription;
    v4->_channelDescription = v5;

    if (IOReportChannelGetFormat() == 1
      && (uint64_t IntegerValue = IOReportSimpleGetIntegerValue(), IntegerValue != 0x8000000000000000))
    {
      uint64_t v9 = [NSNumber numberWithLongLong:IntegerValue];
      count = v4->_count;
      v4->_count = (NSNumber *)v9;
    }
    else
    {
      count = v4->_count;
      v4->_count = 0;
    }
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(HSIORSample *)self channelDescription];
  v6 = (void *)[v5 copy];
  [v4 setChannelDescription:v6];

  v7 = [(HSIORSample *)self count];
  v8 = (void *)[v7 copy];
  [v4 setCount:v8];

  return v4;
}

- (unint64_t)hash
{
  v3 = [(HSIORSample *)self channelDescription];
  uint64_t v4 = [v3 hash];
  v5 = [(HSIORSample *)self count];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HSIORSample *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(HSIORSample *)self isEqualToSample:v4];
  }

  return v5;
}

- (BOOL)isEqualToSample:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 channelDescription];
  unint64_t v6 = [(HSIORSample *)self channelDescription];
  char v7 = [v5 isEqualToChannelDescription:v6];

  v8 = [v4 count];
  if (!v8)
  {
    unint64_t v6 = [(HSIORSample *)self count];
    if (!v6)
    {
      char v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  uint64_t v9 = [v4 count];
  v10 = [(HSIORSample *)self count];
  char v11 = [v9 isEqual:v10];

  if (!v8) {
    goto LABEL_6;
  }
LABEL_7:

  return v7 & v11;
}

- (HSIORChannelDescription)channelDescription
{
  return self->_channelDescription;
}

- (void)setChannelDescription:(id)a3
{
}

- (NSNumber)count
{
  return self->_count;
}

- (void)setCount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_count, 0);

  objc_storeStrong((id *)&self->_channelDescription, 0);
}

@end