@interface BWFlashlightAnalyticsPayload
- (id)eventDictionary;
- (id)eventName;
- (void)reset;
- (void)setBeamWidthUsage:(int64_t)a3[11];
- (void)setLevelUsage:(int64_t)a3[11];
@end

@implementation BWFlashlightAnalyticsPayload

- (void)reset
{
  self->_levelUsage[10] = 0;
  *(_OWORD *)&self->_levelUsage[8] = 0u;
  *(_OWORD *)&self->_levelUsage[6] = 0u;
  *(_OWORD *)&self->_levelUsage[4] = 0u;
  *(_OWORD *)&self->_levelUsage[2] = 0u;
  *(_OWORD *)self->_levelUsage = 0u;
  *(_OWORD *)self->_beamWidthUsage = 0u;
  *(_OWORD *)&self->_beamWidthUsage[2] = 0u;
  *(_OWORD *)&self->_beamWidthUsage[4] = 0u;
  *(_OWORD *)&self->_beamWidthUsage[6] = 0u;
  *(_OWORD *)&self->_beamWidthUsage[8] = 0u;
  self->_beamWidthUsage[10] = 0;
}

- (void)setLevelUsage:(int64_t)a3[11]
{
  long long v3 = *(_OWORD *)a3;
  *(_OWORD *)&self->_levelUsage[2] = *((_OWORD *)a3 + 1);
  *(_OWORD *)self->_levelUsage = v3;
  long long v4 = *((_OWORD *)a3 + 2);
  long long v5 = *((_OWORD *)a3 + 3);
  long long v6 = *((_OWORD *)a3 + 4);
  self->_levelUsage[10] = a3[10];
  *(_OWORD *)&self->_levelUsage[8] = v6;
  *(_OWORD *)&self->_levelUsage[6] = v5;
  *(_OWORD *)&self->_levelUsage[4] = v4;
}

- (void)setBeamWidthUsage:(int64_t)a3[11]
{
  long long v3 = *((_OWORD *)a3 + 1);
  *(_OWORD *)self->_beamWidthUsage = *(_OWORD *)a3;
  *(_OWORD *)&self->_beamWidthUsage[2] = v3;
  long long v4 = *((_OWORD *)a3 + 2);
  long long v5 = *((_OWORD *)a3 + 3);
  long long v6 = *((_OWORD *)a3 + 4);
  self->_beamWidthUsage[10] = a3[10];
  *(_OWORD *)&self->_beamWidthUsage[6] = v5;
  *(_OWORD *)&self->_beamWidthUsage[8] = v6;
  *(_OWORD *)&self->_beamWidthUsage[4] = v4;
}

- (id)eventName
{
  return @"com.apple.coremedia.camera.FlashlightUsage";
}

- (id)eventDictionary
{
  v2 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  for (uint64_t i = 2; i != 12; ++i)
    [v2 setObject:objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", FigHostTimeToNanoseconds() / 0xF4240uLL), objc_msgSend(NSString, "stringWithFormat:", @"level_%d", i - 1) forKeyedSubscript];
  for (uint64_t j = 0; j != 11; ++j)
    [v2 setObject:objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", FigHostTimeToNanoseconds() / 0xF4240uLL), objc_msgSend(NSString, "stringWithFormat:", @"beamWidth_%d", j) forKeyedSubscript];
  return v2;
}

@end