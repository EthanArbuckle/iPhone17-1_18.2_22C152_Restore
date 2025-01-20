@interface SGStructuredEventCoreMLInputWrapper
- (MLMultiArray)D;
- (MLMultiArray)I;
- (MLMultiArray)L;
- (MLMultiArray)N;
- (MLMultiArray)W;
- (MLMultiArray)bi_lstm_0_c_in;
- (MLMultiArray)bi_lstm_0_c_in_rev;
- (MLMultiArray)bi_lstm_0_h_in;
- (MLMultiArray)bi_lstm_0_h_in_rev;
- (NSSet)featureNames;
- (SGStructuredEventCoreMLInputWrapper)initWithL:(id)a3 D:(id)a4 I:(id)a5 N:(id)a6 W:(id)a7;
- (SGStructuredEventCoreMLInputWrapper)initWithL:(id)a3 D:(id)a4 I:(id)a5 N:(id)a6 W:(id)a7 bi_lstm_0_h_in:(id)a8 bi_lstm_0_c_in:(id)a9 bi_lstm_0_h_in_rev:(id)a10 bi_lstm_0_c_in_rev:(id)a11;
- (id)featureValueForName:(id)a3;
- (void)setBi_lstm_0_c_in:(id)a3;
- (void)setBi_lstm_0_c_in_rev:(id)a3;
- (void)setBi_lstm_0_h_in:(id)a3;
- (void)setBi_lstm_0_h_in_rev:(id)a3;
- (void)setD:(id)a3;
- (void)setI:(id)a3;
- (void)setL:(id)a3;
- (void)setN:(id)a3;
- (void)setW:(id)a3;
@end

@implementation SGStructuredEventCoreMLInputWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bi_lstm_0_c_in_rev, 0);
  objc_storeStrong((id *)&self->_bi_lstm_0_h_in_rev, 0);
  objc_storeStrong((id *)&self->_bi_lstm_0_c_in, 0);
  objc_storeStrong((id *)&self->_bi_lstm_0_h_in, 0);
  objc_storeStrong((id *)&self->_W, 0);
  objc_storeStrong((id *)&self->_N, 0);
  objc_storeStrong((id *)&self->_I, 0);
  objc_storeStrong((id *)&self->_D, 0);
  objc_storeStrong((id *)&self->_L, 0);
}

- (void)setBi_lstm_0_c_in_rev:(id)a3
{
}

- (MLMultiArray)bi_lstm_0_c_in_rev
{
  return self->_bi_lstm_0_c_in_rev;
}

- (void)setBi_lstm_0_h_in_rev:(id)a3
{
}

- (MLMultiArray)bi_lstm_0_h_in_rev
{
  return self->_bi_lstm_0_h_in_rev;
}

- (void)setBi_lstm_0_c_in:(id)a3
{
}

- (MLMultiArray)bi_lstm_0_c_in
{
  return self->_bi_lstm_0_c_in;
}

- (void)setBi_lstm_0_h_in:(id)a3
{
}

- (MLMultiArray)bi_lstm_0_h_in
{
  return self->_bi_lstm_0_h_in;
}

- (void)setW:(id)a3
{
}

- (MLMultiArray)W
{
  return self->_W;
}

- (void)setN:(id)a3
{
}

- (MLMultiArray)N
{
  return self->_N;
}

- (void)setI:(id)a3
{
}

- (MLMultiArray)I
{
  return self->_I;
}

- (void)setD:(id)a3
{
}

- (MLMultiArray)D
{
  return self->_D;
}

- (void)setL:(id)a3
{
}

- (MLMultiArray)L
{
  return self->_L;
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"L"])
  {
    uint64_t v5 = 8;
LABEL_19:
    v6 = [MEMORY[0x1E4F1E950] featureValueWithMultiArray:*(Class *)((char *)&self->super.isa + v5)];
    goto LABEL_20;
  }
  if ([v4 isEqualToString:@"D"])
  {
    uint64_t v5 = 16;
    goto LABEL_19;
  }
  if ([v4 isEqualToString:@"I"])
  {
    uint64_t v5 = 24;
    goto LABEL_19;
  }
  if ([v4 isEqualToString:@"N"])
  {
    uint64_t v5 = 32;
    goto LABEL_19;
  }
  if ([v4 isEqualToString:@"W"])
  {
    uint64_t v5 = 40;
    goto LABEL_19;
  }
  if ([v4 isEqualToString:@"bi_lstm_0_h_in"])
  {
    uint64_t v5 = 48;
    goto LABEL_19;
  }
  if ([v4 isEqualToString:@"bi_lstm_0_c_in"])
  {
    uint64_t v5 = 56;
    goto LABEL_19;
  }
  if ([v4 isEqualToString:@"bi_lstm_0_h_in_rev"])
  {
    uint64_t v5 = 64;
    goto LABEL_19;
  }
  if ([v4 isEqualToString:@"bi_lstm_0_c_in_rev"])
  {
    uint64_t v5 = 72;
    goto LABEL_19;
  }
  v6 = 0;
LABEL_20:

  return v6;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F25368D8];
}

- (SGStructuredEventCoreMLInputWrapper)initWithL:(id)a3 D:(id)a4 I:(id)a5 N:(id)a6 W:(id)a7 bi_lstm_0_h_in:(id)a8 bi_lstm_0_c_in:(id)a9 bi_lstm_0_h_in_rev:(id)a10 bi_lstm_0_c_in_rev:(id)a11
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v22 = a8;
  id v21 = a9;
  id v20 = a10;
  id v18 = a11;
  if (self)
  {
    objc_storeStrong((id *)&self->_L, a3);
    objc_storeStrong((id *)&self->_D, a4);
    objc_storeStrong((id *)&self->_I, a5);
    objc_storeStrong((id *)&self->_N, a6);
    objc_storeStrong((id *)&self->_W, a7);
    objc_storeStrong((id *)&self->_bi_lstm_0_h_in, a8);
    objc_storeStrong((id *)&self->_bi_lstm_0_c_in, a9);
    objc_storeStrong((id *)&self->_bi_lstm_0_h_in_rev, a10);
    objc_storeStrong((id *)&self->_bi_lstm_0_c_in_rev, a11);
  }

  return self;
}

- (SGStructuredEventCoreMLInputWrapper)initWithL:(id)a3 D:(id)a4 I:(id)a5 N:(id)a6 W:(id)a7
{
  id v18 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (self)
  {
    objc_storeStrong((id *)&self->_L, a3);
    objc_storeStrong((id *)&self->_D, a4);
    objc_storeStrong((id *)&self->_I, a5);
    objc_storeStrong((id *)&self->_N, a6);
    objc_storeStrong((id *)&self->_W, a7);
  }

  return self;
}

@end