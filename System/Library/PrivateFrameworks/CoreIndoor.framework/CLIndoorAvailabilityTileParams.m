@interface CLIndoorAvailabilityTileParams
- (BOOL)hasCyclingToNonFitnessSeconds;
- (BOOL)hasMotionActivityDebounceParameters;
- (BOOL)hasNonFitnessToCyclingSeconds;
- (BOOL)hasNonFitnessToRunningSeconds;
- (BOOL)hasRegionalPrefetchMaxFloorCount;
- (BOOL)hasRunningToNonFitnessSeconds;
- (CLIndoorAvailabilityTileParams)init;
- (CLIndoorAvailabilityTileParams)initWithAvailabilityTile:(void *)a3;
- (double)availabilityZScoreConfidenceInterval;
- (float)indoorNumberOfDaysBeforeTileRedownload;
- (float)regionalNumberOfDaysBeforeTileRedownload;
- (id).cxx_construct;
- (optional<proto::params::LocalizerParameters>)localizerParams;
- (unsigned)cyclingToNonFitnessSeconds;
- (unsigned)indoorLocationOfInterestMergeRadiusKM;
- (unsigned)indoorPrefetchMaxFloorCount;
- (unsigned)indoorPrefetchMaxTotalBytes;
- (unsigned)indoorPrefetchRadiusKM;
- (unsigned)nonFitnessToCyclingSeconds;
- (unsigned)nonFitnessToRunningSeconds;
- (unsigned)preferPredictionWithinNActivityCycles;
- (unsigned)regionalLocationOfInterestMergeRadiusKM;
- (unsigned)regionalPrefetchMaxFloorCount;
- (unsigned)regionalPrefetchMaxTotalBytes;
- (unsigned)regionalPrefetchRadiusKM;
- (unsigned)runningToNonFitnessSeconds;
@end

@implementation CLIndoorAvailabilityTileParams

- (CLIndoorAvailabilityTileParams)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLIndoorAvailabilityTileParams;
  return [(CLIndoorAvailabilityTileParams *)&v3 init];
}

- (CLIndoorAvailabilityTileParams)initWithAvailabilityTile:(void *)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)CLIndoorAvailabilityTileParams;
  v4 = [(CLIndoorAvailabilityTileParams *)&v8 init];
  if (!v4) {
    return (CLIndoorAvailabilityTileParams *)v4;
  }
  *((double *)v4 + 50) = sub_221E335C0((uint64_t)a3);
  *((float *)v4 + 84) = sub_221E33AD0((uint64_t)a3);
  *((_DWORD *)v4 + 85) = sub_221E339BC((uint64_t)a3);
  *((_DWORD *)v4 + 86) = sub_221E336E0((uint64_t)a3);
  *((_DWORD *)v4 + 87) = sub_221E337F4((uint64_t)a3);
  *((_DWORD *)v4 + 88) = sub_221E335CC((uint64_t)a3);
  int v5 = sub_221E33AE8((uint64_t)a3);
  v4[328] = v5;
  if (v5)
  {
    sub_221E33AF8((uint64_t)a3, (uint64_t)&v9);
    char v6 = v15;
    v4[329] = v15 & 1;
    if (v6)
    {
      *((_DWORD *)v4 + 89) = v11;
      v4[330] = (v6 & 2) != 0;
      if ((v6 & 2) == 0)
      {
LABEL_5:
        v4[331] = (v6 & 4) != 0;
        if ((v6 & 4) == 0) {
          goto LABEL_6;
        }
        goto LABEL_19;
      }
    }
    else
    {
      v4[330] = (v6 & 2) != 0;
      if ((v6 & 2) == 0) {
        goto LABEL_5;
      }
    }
    *((_DWORD *)v4 + 90) = v12;
    v4[331] = (v6 & 4) != 0;
    if ((v6 & 4) == 0)
    {
LABEL_6:
      v4[332] = (v6 & 8) != 0;
      if ((v6 & 8) == 0)
      {
LABEL_8:
        sub_221DF1038(&v9);
        goto LABEL_10;
      }
LABEL_7:
      *((_DWORD *)v4 + 92) = v14;
      goto LABEL_8;
    }
LABEL_19:
    *((_DWORD *)v4 + 91) = v13;
    v4[332] = (v6 & 8) != 0;
    if ((v6 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  *(_DWORD *)(v4 + 329) = 0;
LABEL_10:
  *((_DWORD *)v4 + 93) = sub_221E33B24((uint64_t)a3);
  v4[333] = sub_221E33B30((uint64_t)a3);
  *((float *)v4 + 94) = sub_221E33ADC((uint64_t)a3);
  *((_DWORD *)v4 + 95) = sub_221E339C8((uint64_t)a3);
  *((_DWORD *)v4 + 96) = sub_221E336EC((uint64_t)a3);
  *((_DWORD *)v4 + 97) = sub_221E338D8((uint64_t)a3);
  *((_DWORD *)v4 + 98) = sub_221E335D8((uint64_t)a3);
  sub_221E33554((uint64_t)a3, &v9);
  if (v4[8])
  {
    if ((_BYTE)v9)
    {
      sub_221E07C38((uint64_t)(v4 + 16), (uint64_t)&v10);
      if (!(_BYTE)v9) {
        return (CLIndoorAvailabilityTileParams *)v4;
      }
      goto LABEL_22;
    }
    sub_221E00AC8((void *)v4 + 2);
    v4[8] = 0;
    if ((_BYTE)v9) {
LABEL_22:
    }
      sub_221E00AC8(&v10);
  }
  else if ((_BYTE)v9)
  {
    sub_221E00614((uint64_t)(v4 + 16), (uint64_t)&v10);
    v4[8] = 1;
    if ((_BYTE)v9) {
      goto LABEL_22;
    }
  }
  return (CLIndoorAvailabilityTileParams *)v4;
}

- (optional<proto::params::LocalizerParameters>)localizerParams
{
  objc_super v3 = v2;
  unsigned char *v2 = 0;
  if (self->_optionalParams.m_initialized)
  {
    self = (CLIndoorAvailabilityTileParams *)sub_221E00614((uint64_t)(v2 + 8), (uint64_t)&self->_optionalParams.m_storage.dummy_.aligner_ + 7);
    *objc_super v3 = 1;
  }
  result.m_storage.dummy_.data[7] = (char)a2;
  result.m_initialized = (char)self;
  *(_DWORD *)result.m_storage.dummy_.data = *(_DWORD *)((char *)&self + 1);
  *((_WORD *)&result.m_storage.dummy_.aligner_ + 2) = *(_WORD *)((char *)&self + 5);
  result.m_storage.dummy_.data[6] = HIBYTE(self);
  return result;
}

- (double)availabilityZScoreConfidenceInterval
{
  return self->_availabilityZScoreConfidenceInterval;
}

- (float)indoorNumberOfDaysBeforeTileRedownload
{
  return self->_indoorNumberOfDaysBeforeTileRedownload;
}

- (unsigned)indoorLocationOfInterestMergeRadiusKM
{
  return self->_indoorLocationOfInterestMergeRadiusKM;
}

- (unsigned)indoorPrefetchMaxFloorCount
{
  return self->_indoorPrefetchMaxFloorCount;
}

- (unsigned)indoorPrefetchMaxTotalBytes
{
  return self->_indoorPrefetchMaxTotalBytes;
}

- (unsigned)indoorPrefetchRadiusKM
{
  return self->_indoorPrefetchRadiusKM;
}

- (BOOL)hasMotionActivityDebounceParameters
{
  return self->_hasMotionActivityDebounceParameters;
}

- (BOOL)hasNonFitnessToCyclingSeconds
{
  return self->_hasNonFitnessToCyclingSeconds;
}

- (unsigned)nonFitnessToCyclingSeconds
{
  return self->_nonFitnessToCyclingSeconds;
}

- (BOOL)hasNonFitnessToRunningSeconds
{
  return self->_hasNonFitnessToRunningSeconds;
}

- (unsigned)nonFitnessToRunningSeconds
{
  return self->_nonFitnessToRunningSeconds;
}

- (BOOL)hasRunningToNonFitnessSeconds
{
  return self->_hasRunningToNonFitnessSeconds;
}

- (unsigned)runningToNonFitnessSeconds
{
  return self->_runningToNonFitnessSeconds;
}

- (BOOL)hasCyclingToNonFitnessSeconds
{
  return self->_hasCyclingToNonFitnessSeconds;
}

- (unsigned)cyclingToNonFitnessSeconds
{
  return self->_cyclingToNonFitnessSeconds;
}

- (unsigned)preferPredictionWithinNActivityCycles
{
  return self->_preferPredictionWithinNActivityCycles;
}

- (BOOL)hasRegionalPrefetchMaxFloorCount
{
  return self->_hasRegionalPrefetchMaxFloorCount;
}

- (float)regionalNumberOfDaysBeforeTileRedownload
{
  return self->_regionalNumberOfDaysBeforeTileRedownload;
}

- (unsigned)regionalLocationOfInterestMergeRadiusKM
{
  return self->_regionalLocationOfInterestMergeRadiusKM;
}

- (unsigned)regionalPrefetchMaxFloorCount
{
  return self->_regionalPrefetchMaxFloorCount;
}

- (unsigned)regionalPrefetchMaxTotalBytes
{
  return self->_regionalPrefetchMaxTotalBytes;
}

- (unsigned)regionalPrefetchRadiusKM
{
  return self->_regionalPrefetchRadiusKM;
}

- (void).cxx_destruct
{
  if (self->_optionalParams.m_initialized)
  {
    sub_221E00AC8((a8 *)((char *)&self->_optionalParams.m_storage.dummy_.aligner_ + 7));
    self->_optionalParams.m_initialized = 0;
  }
}

- (id).cxx_construct
{
  *((unsigned char *)self + 8) = 0;
  return self;
}

@end