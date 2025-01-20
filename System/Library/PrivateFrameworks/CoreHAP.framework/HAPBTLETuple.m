@interface HAPBTLETuple
+ (id)atvState2String:(unint64_t)a3;
+ (id)makeTupleWithATVState:(unint64_t)a3 MaxHAPConnections:(int)a4;
+ (id)makeTupleWithATVState:(unint64_t)a3 MaxHAPConnections:(int)a4 MinBandwidth:(float)a5 MaxBandwidth:(float)a6;
+ (id)makeTupleWithState:(BTStatus *)a3 MaxHAPConnections:(int)a4 MinBandwidth:(float)a5 MaxBandwidth:(float)a6;
+ (id)state2String:(BTStatus *)a3;
+ (void)bandwidthFromATVState:(unint64_t)a3 MinBandwidth:(float *)a4 MaxBandwidth:(float *)a5;
- (BTStatus)state;
- (float)maxBandwidth;
- (float)minBandwidth;
- (id)description;
- (int)maxHAPConnections;
- (unint64_t)atvState;
- (void)setAtvState:(unint64_t)a3;
- (void)setMaxBandwidth:(float)a3;
- (void)setMaxHAPConnections:(int)a3;
- (void)setMinBandwidth:(float)a3;
- (void)setState:(BTStatus *)a3;
@end

@implementation HAPBTLETuple

- (void)setMaxBandwidth:(float)a3
{
  self->_maxBandwidth = a3;
}

- (float)maxBandwidth
{
  return self->_maxBandwidth;
}

- (void)setMinBandwidth:(float)a3
{
  self->_minBandwidth = a3;
}

- (float)minBandwidth
{
  return self->_minBandwidth;
}

- (void)setMaxHAPConnections:(int)a3
{
  self->_maxHAPConnections = a3;
}

- (int)maxHAPConnections
{
  return self->_maxHAPConnections;
}

- (void)setState:(BTStatus *)a3
{
  *(_OWORD *)&self->_state.leRemote = *(_OWORD *)&a3->leRemote;
  long long v3 = *(_OWORD *)&a3->btKB;
  long long v4 = *(_OWORD *)&a3->btGC;
  long long v5 = *(_OWORD *)&a3->nonHIDConnections;
  *(_OWORD *)&self->_state.hk = *(_OWORD *)&a3->hk;
  *(_OWORD *)&self->_state.nonHIDConnections = v5;
  *(_OWORD *)&self->_state.btKB = v3;
  *(_OWORD *)&self->_state.btGC = v4;
  long long v6 = *(_OWORD *)&a3->oneSniffAttemptDevices;
  long long v7 = *(_OWORD *)&a3->sco;
  long long v8 = *(_OWORD *)&a3->remote;
  *(void *)&self->_state.isScanning = *(void *)&a3->isScanning;
  *(_OWORD *)&self->_state.sco = v7;
  *(_OWORD *)&self->_state.remote = v8;
  *(_OWORD *)&self->_state.oneSniffAttemptDevices = v6;
}

- (BTStatus)state
{
  long long v3 = *(_OWORD *)&self[1].leAcc;
  *(_OWORD *)&retstr->sco = *(_OWORD *)&self->isScanning;
  *(_OWORD *)&retstr->remote = v3;
  *(void *)&retstr->isScanning = self[1].a2dp;
  long long v4 = *(_OWORD *)&self->oneSniffAttemptDevices;
  *(_OWORD *)&retstr->btGC = *(_OWORD *)&self->nonHIDConnections;
  *(_OWORD *)&retstr->hk = v4;
  long long v5 = *(_OWORD *)&self->remote;
  *(_OWORD *)&retstr->nonHIDConnections = *(_OWORD *)&self->sco;
  *(_OWORD *)&retstr->oneSniffAttemptDevices = v5;
  long long v6 = *(_OWORD *)&self->hk;
  *(_OWORD *)&retstr->leRemote = *(_OWORD *)&self->btGC;
  *(_OWORD *)&retstr->btKB = v6;
  return self;
}

- (void)setAtvState:(unint64_t)a3
{
  self->_atvState = a3;
}

- (unint64_t)atvState
{
  return self->_atvState;
}

- (id)description
{
  if ([(HAPBTLETuple *)self atvState]) {
    +[HAPBTLETuple atvState2String:self->_atvState];
  }
  else {
  long long v3 = +[HAPBTLETuple state2String:&self->_state];
  }

  return v3;
}

+ (id)state2String:(BTStatus *)a3
{
  long long v4 = [NSString stringWithFormat:@"%@ LE devices            : %zu \n", &stru_1F2C4E778, a3->lowEnergyConnections];
  long long v5 = [NSString stringWithFormat:@"%@ classic devices       : %zu \n", v4, a3->connectedDevices];

  long long v6 = [NSString stringWithFormat:@"%@ leRemote              : %zu \n", v5, a3->leRemote];

  long long v7 = [NSString stringWithFormat:@"%@ leAcc                 : %zu \n", v6, a3->leAcc];

  long long v8 = [NSString stringWithFormat:@"%@ btKb                  : %zu \n", v7, a3->btKB];

  v9 = [NSString stringWithFormat:@"%@ a2dp                  : %zu \n", v8, a3->a2dp];

  v10 = [NSString stringWithFormat:@"%@ btGC                  : %zu \n", v9, a3->btGC];

  v11 = [NSString stringWithFormat:@"%@ eAcc                  : %zu \n", v10, a3->eAcc];

  v12 = [NSString stringWithFormat:@"%@ HK                    : %zu \n", v11, a3->hk];

  v13 = [NSString stringWithFormat:@"%@ non-HID               : %zu \n", v12, a3->nonHIDConnections];

  v14 = [NSString stringWithFormat:@"%@ HID                   : %zu \n", v13, a3->connectedHIDDevices];

  v15 = [NSString stringWithFormat:@"%@ oneSniffAttemptDevices: %zu \n", v14, a3->oneSniffAttemptDevices];

  v16 = [NSString stringWithFormat:@"%@ twoSniffAttemptDevices: %zu \n", v15, a3->twoSniffAttemptDevices];

  v17 = [NSString stringWithFormat:@"%@ sco                   : %zu \n", v16, a3->sco];

  v18 = [NSString stringWithFormat:@"%@ wiap                  : %zu \n", v17, a3->wiap];

  v19 = [NSString stringWithFormat:@"%@ remote                : %zu \n", v18, a3->remote];

  if (a3->isScanning) {
    v20 = @"YES";
  }
  else {
    v20 = @"NO";
  }
  v21 = [NSString stringWithFormat:@"%@ scanning              : %@ \n", v19, v20];

  if (a3->isDiscoverable) {
    v22 = @"YES";
  }
  else {
    v22 = @"NO";
  }
  v23 = [NSString stringWithFormat:@"%@ discoverable          : %@ \n", v21, v22];

  if (a3->isConnectable) {
    v24 = @"YES";
  }
  else {
    v24 = @"NO";
  }
  v25 = [NSString stringWithFormat:@"%@ connectable           : %@ \n", v23, v24];

  return v25;
}

+ (id)makeTupleWithState:(BTStatus *)a3 MaxHAPConnections:(int)a4 MinBandwidth:(float)a5 MaxBandwidth:(float)a6
{
  uint64_t v8 = *(void *)&a4;
  v10 = objc_alloc_init(HAPBTLETuple);
  *(_OWORD *)&v10->_state.leRemote = *(_OWORD *)&a3->leRemote;
  long long v11 = *(_OWORD *)&a3->nonHIDConnections;
  long long v13 = *(_OWORD *)&a3->btKB;
  long long v12 = *(_OWORD *)&a3->btGC;
  *(_OWORD *)&v10->_state.hk = *(_OWORD *)&a3->hk;
  *(_OWORD *)&v10->_state.nonHIDConnections = v11;
  *(_OWORD *)&v10->_state.btKB = v13;
  *(_OWORD *)&v10->_state.btGC = v12;
  long long v15 = *(_OWORD *)&a3->sco;
  long long v14 = *(_OWORD *)&a3->remote;
  long long v16 = *(_OWORD *)&a3->oneSniffAttemptDevices;
  *(void *)&v10->_state.isScanning = *(void *)&a3->isScanning;
  *(_OWORD *)&v10->_state.sco = v15;
  *(_OWORD *)&v10->_state.remote = v14;
  *(_OWORD *)&v10->_state.oneSniffAttemptDevices = v16;
  [(HAPBTLETuple *)v10 setAtvState:0];
  *(float *)&double v17 = a5;
  [(HAPBTLETuple *)v10 setMinBandwidth:v17];
  *(float *)&double v18 = a6;
  [(HAPBTLETuple *)v10 setMaxBandwidth:v18];
  [(HAPBTLETuple *)v10 setMaxHAPConnections:v8];

  return v10;
}

+ (id)atvState2String:(unint64_t)a3
{
  long long v4 = objc_msgSend(NSString, "stringWithFormat:", @"%d ("), a3;
  if ([&unk_1F2C80EB0 count])
  {
    unint64_t v5 = 0;
    do
    {
      if ((qword_1D4912E60[v5] & a3) != 0)
      {
        long long v6 = NSString;
        long long v7 = [&unk_1F2C80EB0 objectAtIndexedSubscript:v5];
        uint64_t v8 = [v6 stringWithFormat:@"%@|%@", v4, v7];

        long long v4 = (void *)v8;
      }
      ++v5;
    }
    while ([&unk_1F2C80EB0 count] > v5);
  }
  v9 = [NSString stringWithFormat:@"%@"], v4);

  return v9;
}

+ (void)bandwidthFromATVState:(unint64_t)a3 MinBandwidth:(float *)a4 MaxBandwidth:(float *)a5
{
  uint64_t v5 = 0;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unsigned int v6 = (a3 >> 1) & 2;
  if ((a3 & 2) != 0) {
    unsigned int v6 = 1;
  }
  while ((btgcConfig[v5] & a3) == 0)
  {
    if (++v5 == 4)
    {
      int v7 = 0;
      goto LABEL_7;
    }
  }
  int v7 = v5 + 1;
LABEL_7:
  uint64_t v8 = 0;
  int8x8_t v9 = vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(a3), (uint32x2_t)0xFFFFFFF9FFFFFFFALL), (int8x8_t)0x100000001);
  while ((leaConfig[v8] & a3) == 0)
  {
    if (++v8 == 3)
    {
      int v10 = 0;
      goto LABEL_12;
    }
  }
  int v10 = v8 + 1;
LABEL_12:
  uint64_t v11 = 0;
  while ((eaConfig[v11] & a3) == 0)
  {
    if (++v11 == 3)
    {
      int v12 = 0;
      goto LABEL_17;
    }
  }
  int v12 = v11 + 1;
LABEL_17:
  uint64_t v13 = 0;
  while ((hkConfig_21196[v13] & a3) == 0)
  {
    if (++v13 == 3)
    {
      int v14 = 0;
      goto LABEL_22;
    }
  }
  int v14 = v13 + 1;
LABEL_22:
  uint64_t v15 = 0;
  v19[0] = v6;
  v19[1] = v10;
  int8x8_t v20 = v9;
  float v16 = 0.0;
  int v21 = v7;
  int v22 = v12;
  float v17 = 0.0;
  int v23 = v14;
  do
  {
    float v18 = (float)(int)v19[v15];
    float v16 = fminf(v16 + (float)(*(float *)&maxFactors[v15] * v18), 100.0);
    float v17 = fminf(v17 + (float)(*(float *)&minFactors[v15++] * v18), 100.0);
  }
  while (v15 != 7);
  *a4 = v17;
  *a5 = v16;
}

+ (id)makeTupleWithATVState:(unint64_t)a3 MaxHAPConnections:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v10 = 0;
  +[HAPBTLETuple bandwidthFromATVState:a3 MinBandwidth:(char *)&v10 + 4 MaxBandwidth:&v10];
  LODWORD(v6) = HIDWORD(v10);
  LODWORD(v7) = v10;
  uint64_t v8 = +[HAPBTLETuple makeTupleWithATVState:a3 MaxHAPConnections:v4 MinBandwidth:v6 MaxBandwidth:v7];

  return v8;
}

+ (id)makeTupleWithATVState:(unint64_t)a3 MaxHAPConnections:(int)a4 MinBandwidth:(float)a5 MaxBandwidth:(float)a6
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v10 = objc_alloc_init(HAPBTLETuple);
  [(HAPBTLETuple *)v10 setAtvState:a3];
  *(float *)&double v11 = a5;
  [(HAPBTLETuple *)v10 setMinBandwidth:v11];
  *(float *)&double v12 = a6;
  [(HAPBTLETuple *)v10 setMaxBandwidth:v12];
  [(HAPBTLETuple *)v10 setMaxHAPConnections:v8];

  return v10;
}

@end