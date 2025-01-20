@interface SGStructuredEventCoreMLOutputWrapper
- (MLMultiArray)bi_lstm_0_c_out;
- (MLMultiArray)bi_lstm_0_c_out_rev;
- (MLMultiArray)bi_lstm_0_h_out;
- (MLMultiArray)bi_lstm_0_h_out_rev;
- (MLMultiArray)core;
- (MLMultiArray)location;
- (MLMultiArray)time;
- (MLMultiArray)title;
- (NSSet)featureNames;
- (SGStructuredEventCoreMLOutputWrapper)initWithLocation:(id)a3 time:(id)a4 title:(id)a5 core:(id)a6 bi_lstm_0_h_out:(id)a7 bi_lstm_0_c_out:(id)a8 bi_lstm_0_h_out_rev:(id)a9 bi_lstm_0_c_out_rev:(id)a10;
- (id)featureValueForName:(id)a3;
- (void)setBi_lstm_0_c_out:(id)a3;
- (void)setBi_lstm_0_c_out_rev:(id)a3;
- (void)setBi_lstm_0_h_out:(id)a3;
- (void)setBi_lstm_0_h_out_rev:(id)a3;
- (void)setCore:(id)a3;
- (void)setLocation:(id)a3;
- (void)setTime:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SGStructuredEventCoreMLOutputWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bi_lstm_0_c_out_rev, 0);
  objc_storeStrong((id *)&self->_bi_lstm_0_h_out_rev, 0);
  objc_storeStrong((id *)&self->_bi_lstm_0_c_out, 0);
  objc_storeStrong((id *)&self->_bi_lstm_0_h_out, 0);
  objc_storeStrong((id *)&self->_core, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

- (void)setBi_lstm_0_c_out_rev:(id)a3
{
}

- (MLMultiArray)bi_lstm_0_c_out_rev
{
  return self->_bi_lstm_0_c_out_rev;
}

- (void)setBi_lstm_0_h_out_rev:(id)a3
{
}

- (MLMultiArray)bi_lstm_0_h_out_rev
{
  return self->_bi_lstm_0_h_out_rev;
}

- (void)setBi_lstm_0_c_out:(id)a3
{
}

- (MLMultiArray)bi_lstm_0_c_out
{
  return self->_bi_lstm_0_c_out;
}

- (void)setBi_lstm_0_h_out:(id)a3
{
}

- (MLMultiArray)bi_lstm_0_h_out
{
  return self->_bi_lstm_0_h_out;
}

- (void)setCore:(id)a3
{
}

- (MLMultiArray)core
{
  return self->_core;
}

- (void)setTitle:(id)a3
{
}

- (MLMultiArray)title
{
  return self->_title;
}

- (void)setTime:(id)a3
{
}

- (MLMultiArray)time
{
  return self->_time;
}

- (void)setLocation:(id)a3
{
}

- (MLMultiArray)location
{
  return self->_location;
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"location"])
  {
    uint64_t v5 = 8;
LABEL_17:
    v6 = [MEMORY[0x1E4F1E950] featureValueWithMultiArray:*(Class *)((char *)&self->super.isa + v5)];
    goto LABEL_18;
  }
  if ([v4 isEqualToString:@"time"])
  {
    uint64_t v5 = 16;
    goto LABEL_17;
  }
  if ([v4 isEqualToString:@"title"])
  {
    uint64_t v5 = 24;
    goto LABEL_17;
  }
  if ([v4 isEqualToString:@"core"])
  {
    uint64_t v5 = 32;
    goto LABEL_17;
  }
  if ([v4 isEqualToString:@"bi_lstm_0_h_out"])
  {
    uint64_t v5 = 40;
    goto LABEL_17;
  }
  if ([v4 isEqualToString:@"bi_lstm_0_c_out"])
  {
    uint64_t v5 = 48;
    goto LABEL_17;
  }
  if ([v4 isEqualToString:@"bi_lstm_0_h_out_rev"])
  {
    uint64_t v5 = 56;
    goto LABEL_17;
  }
  if ([v4 isEqualToString:@"bi_lstm_0_c_out_rev"])
  {
    uint64_t v5 = 64;
    goto LABEL_17;
  }
  v6 = 0;
LABEL_18:

  return v6;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F2536A58];
}

- (SGStructuredEventCoreMLOutputWrapper)initWithLocation:(id)a3 time:(id)a4 title:(id)a5 core:(id)a6 bi_lstm_0_h_out:(id)a7 bi_lstm_0_c_out:(id)a8 bi_lstm_0_h_out_rev:(id)a9 bi_lstm_0_c_out_rev:(id)a10
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v20 = a8;
  id v17 = a9;
  id v18 = a10;
  if (self)
  {
    objc_storeStrong((id *)&self->_location, a3);
    objc_storeStrong((id *)&self->_time, a4);
    objc_storeStrong((id *)&self->_title, a5);
    objc_storeStrong((id *)&self->_core, a6);
    objc_storeStrong((id *)&self->_bi_lstm_0_h_out, a7);
    objc_storeStrong((id *)&self->_bi_lstm_0_c_out, a8);
    objc_storeStrong((id *)&self->_bi_lstm_0_h_out_rev, a9);
    objc_storeStrong((id *)&self->_bi_lstm_0_c_out_rev, a10);
  }

  return self;
}

@end