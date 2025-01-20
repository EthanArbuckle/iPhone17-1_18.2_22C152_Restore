@interface HDQuantitySampleSeriesDataEnumerator
- (BOOL)_fillValueBufferWithError:(uint64_t)a1;
- (BOOL)done;
- (BOOL)enumerateDataToTime:(double)a3 error:(id *)a4 handler:(id)a5;
- (BOOL)primeEnumeratorWithError:(id *)a3;
- (HDQuantitySampleSeriesDataEnumerator)initWithTransaction:(id)a3 persistentID:(int64_t)a4 dataTypeCode:(int64_t)a5 UUIDBytes:(unsigned __int8)a6[16] startTime:(double)a7 endTime:(double)a8 count:(int64_t)a9 sourceID:(int64_t)a10 HFDKey:(int64_t)a11 bufferSize:(unint64_t)a12;
- (double)endTime;
- (double)nextDatumTime;
- (double)startTime;
- (id).cxx_construct;
- (id)description;
- (int64_t)HFDKey;
- (int64_t)compare:(id)a3;
- (int64_t)count;
- (int64_t)dataTypeCode;
- (int64_t)persistentID;
- (int64_t)sourceID;
- (unsigned)UUIDBytesPtr;
- (void)_unitTesting_addToBufferTimestamp:(double)a3 value:(double)a4 duration:(float)a5 isLastDatum:(BOOL)a6;
@end

@implementation HDQuantitySampleSeriesDataEnumerator

- (HDQuantitySampleSeriesDataEnumerator)initWithTransaction:(id)a3 persistentID:(int64_t)a4 dataTypeCode:(int64_t)a5 UUIDBytes:(unsigned __int8)a6[16] startTime:(double)a7 endTime:(double)a8 count:(int64_t)a9 sourceID:(int64_t)a10 HFDKey:(int64_t)a11 bufferSize:(unint64_t)a12
{
  id v21 = a3;
  v44.receiver = self;
  v44.super_class = (Class)HDQuantitySampleSeriesDataEnumerator;
  v22 = [(HDQuantitySampleSeriesDataEnumerator *)&v44 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_transaction, a3);
    v23->_persistentID = a4;
    v23->_dataTypeCode = a5;
    uuid_copy(v23->_UUIDBytes, a6);
    v23->_startTime = a7;
    v23->_endTime = a8;
    v23->_count = a9;
    v23->_sourceID = a10;
    v23->_HFDKey = a11;
    v23->_bufferSize = a12;
    v23->_index = 0;
    v23->_previousEndTime = a7;
    *(_DWORD *)&v23->_hasFetchedData = 0;
    v23->_hasDuration = 0;
    unint64_t start = v23->_data.__start_;
    begin = v23->_data.__map_.__begin_;
    uint64_t end = (uint64_t)v23->_data.__map_.__end_;
    v27 = &begin[start / 0xAA];
    if ((void **)end == begin)
    {
      unint64_t v28 = 0;
      unint64_t v32 = 0;
      p_size = &v23->_data.__size_;
      unint64_t value = v23->_data.__size_.__value_;
      v31 = &begin[(value + start) / 0xAA];
    }
    else
    {
      unint64_t v28 = (unint64_t)*v27 + 24 * (start % 0xAA);
      p_size = &v23->_data.__size_;
      unint64_t value = v23->_data.__size_.__value_;
      v31 = &begin[(value + start) / 0xAA];
      unint64_t v32 = (unint64_t)*v31 + 24 * ((value + start) % 0xAA);
    }
    if (v28 != v32)
    {
      uint64_t v33 = 170 * (v31 - v27) - 0x5555555555555555 * ((uint64_t)(v32 - (void)*v31) >> 3);
      v34 = *v27;
      uint64_t v35 = (uint64_t)(v28 - (void)*v27) >> 3;
      uint64_t v36 = v33 + 0x5555555555555555 * v35;
      if (v36 >= 1)
      {
        uint64_t v37 = (uint64_t)v34 + 24 * (start % 0xAA);
        if ((void **)end == begin) {
          uint64_t v37 = 0;
        }
        if (v28 == v37) {
          uint64_t v38 = 0;
        }
        else {
          uint64_t v38 = 0xAAAAAAAAAAAAAAABLL * v35 + 0x5555555555555555 * ((v37 - (uint64_t)v34) >> 3);
        }
        v45[0] = &begin[start / 0xAA];
        v45[1] = v37;
        if ((void **)end == begin) {
          uint64_t v39 = 0;
        }
        else {
          uint64_t v39 = 170 * ((end - (uint64_t)begin) >> 3) - 1;
        }
        std::__deque_iterator<std::tuple<double,double,float>,std::tuple<double,double,float>*,std::tuple<double,double,float>&,std::tuple<double,double,float>**,long,170l>::operator+=[abi:ne180100](v45, v38);
        p_size->__value_ = value - v36;
        if (v39 - start - (value - v36) >= 0x154)
        {
          do
          {
            operator delete(*(void **)(end - 8));
            v40 = v23->_data.__map_.__begin_;
            uint64_t end = (uint64_t)(v23->_data.__map_.__end_ - 1);
            uint64_t v41 = 170 * ((end - (uint64_t)v40) >> 3) - 1;
            v23->_data.__map_.__end_ = (void **)end;
            if ((void **)end == v40) {
              uint64_t v41 = 0;
            }
          }
          while (v41 - (v23->_data.__size_.__value_ + v23->_data.__start_) > 0x153);
        }
      }
    }
    fatalError = v23->_fatalError;
    v23->_fatalError = 0;
  }
  return v23;
}

- (double)nextDatumTime
{
  if (!self->_hasFetchedData)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"HDQuantitySampleSeriesDataEnumerator.mm", 94, @"Invalid parameter not satisfying: %@", @"_hasFetchedData" object file lineNumber description];
  }
  if ([(HDQuantitySampleSeriesDataEnumerator *)self done] || self->_fatalError) {
    return INFINITY;
  }
  if (self->_hasDuration) {
    p_previousEndTime = (double *)((char *)self->_data.__map_.__begin_[self->_data.__start_ / 0xAA]
  }
                                 + 24 * (self->_data.__start_ % 0xAA));
  else {
    p_previousEndTime = &self->_previousEndTime;
  }
  return *p_previousEndTime;
}

- (BOOL)primeEnumeratorWithError:(id *)a3
{
  if (self->_hasFetchedData) {
    return 1;
  }
  if (self->_fatalError)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:underlyingError:", a3, 3, @"This enumerator has experienced a fatal error");
    return 0;
  }
  else
  {
    id v12 = 0;
    BOOL v3 = -[HDQuantitySampleSeriesDataEnumerator _fillValueBufferWithError:]((uint64_t)self, (uint64_t)&v12);
    id v6 = v12;
    v7 = v6;
    if (v3)
    {
      if (self->_data.__size_.__value_) {
        self->_hasDuration = *((float *)self->_data.__map_.__begin_[self->_data.__start_ / 0xAA]
      }
                             + 6 * (self->_data.__start_ % 0xAA)
                             + 4) != -1.0;
    }
    else
    {
      if (!v6)
      {
        v7 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Enumerator experienced fatal error while filling value buffer");
      }
      v8 = (NSError *)[v7 copy];
      fatalError = self->_fatalError;
      self->_fatalError = v8;

      id v10 = v7;
      v7 = v10;
      if (v10)
      {
        if (a3) {
          *a3 = v10;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
  }
  return v3;
}

- (BOOL)_fillValueBufferWithError:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  if (!*(unsigned char *)(a1 + 74))
  {
    v4 = [*(id *)(a1 + 8) protectedDatabase];
    int64_t v5 = +[HDQuantitySampleSeriesEntity _hasSeriesDataWithDatabase:v4 hfdKey:*(void *)(a1 + 168) error:a2];

    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 168);
      if (*(unsigned char *)(a1 + 75)) {
        uint64_t v7 = 2;
      }
      else {
        uint64_t v7 = 1;
      }
      *(void *)(a1 + 192) = v7;
      *(void *)(a1 + 200) = v6;
      *(unsigned char *)(a1 + 74) = 1;
      goto LABEL_8;
    }
    return 0;
  }
LABEL_8:
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__HDQuantitySampleSeriesDataEnumerator__fillValueBufferFromSQLiteWithError___block_invoke;
  v13[3] = &unk_1E63043C0;
  v13[4] = a1;
  v13[5] = &v14;
  v8 = _Block_copy(v13);
  uint64_t v9 = *(void *)(a1 + 168);
  if (*(unsigned char *)(a1 + 72)) {
    BOOL v10 = +[HDQuantitySeriesDataEntity enumerateSeries:v9 after:0 inclusive:*(void *)(a1 + 8) transaction:a2 error:v8 handler:*(double *)(a1 + 176)];
  }
  else {
    BOOL v10 = +[HDQuantitySeriesDataEntity enumerateSeries:v9 transaction:*(void *)(a1 + 8) error:a2 handler:v8];
  }
  BOOL v11 = v10;
  if (v10 && !*((unsigned char *)v15 + 24)) {
    *(unsigned char *)(a1 + 73) = 1;
  }

  _Block_object_dispose(&v14, 8);
  *(unsigned char *)(a1 + 72) = 1;
  return v11;
}

- (BOOL)enumerateDataToTime:(double)a3 error:(id *)a4 handler:(id)a5
{
  uint64_t v9 = (uint64_t (**)(id, int64_t, double, double, double))a5;
  if (!self->_hasFetchedData)
  {
    uint64_t v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"HDQuantitySampleSeriesDataEnumerator.mm", 134, @"Invalid parameter not satisfying: %@", @"_hasFetchedData" object file lineNumber description];
  }
  if (self->_fatalError)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:underlyingError:", a4, 3, @"This enumerator has experienced a fatal error");
    goto LABEL_7;
  }
  if ([(HDQuantitySampleSeriesDataEnumerator *)self done])
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"This enumerator is already done");
    goto LABEL_7;
  }
  [(HDQuantitySampleSeriesDataEnumerator *)self nextDatumTime];
  if (v12 > a3)
  {
LABEL_10:
    BOOL v10 = 1;
    goto LABEL_8;
  }
  BOOL hasFetchedAllData = self->_hasFetchedAllData;
  while (hasFetchedAllData)
  {
    int v14 = 1;
LABEL_18:
    begin = self->_data.__map_.__begin_;
    if (self->_data.__map_.__end_ != begin)
    {
      unint64_t start = self->_data.__start_;
      v20 = &begin[start / 0xAA];
      unint64_t v21 = (unint64_t)*v20 + 24 * (start % 0xAA);
      unint64_t v22 = (unint64_t)begin[(self->_data.__size_.__value_ + start) / 0xAA]
          + 24 * ((self->_data.__size_.__value_ + start) % 0xAA);
      while (v21 != v22)
      {
        double v23 = *(double *)v21;
        if (self->_hasDuration)
        {
          double v24 = v23 + *(float *)(v21 + 16);
          double previousEndTime = *(double *)v21;
        }
        else
        {
          double previousEndTime = self->_previousEndTime;
          double v24 = *(double *)v21;
        }
        double v26 = *(double *)(v21 + 8);
        int64x2_t v27 = vaddq_s64(*(int64x2_t *)&self->_data.__start_, (int64x2_t)xmmword_1BD325E90);
        *(int64x2_t *)&self->_data.__start_ = v27;
        if (v27.i64[0] >= 0x154uLL)
        {
          operator delete(*self->_data.__map_.__begin_);
          ++self->_data.__map_.__begin_;
          self->_data.__start_ -= 170;
        }
        char v28 = v9[2](v9, self->_index, previousEndTime, v24, v26);
        ++self->_index;
        self->_double previousEndTime = v23;
        if ((v28 & 1) == 0) {
          goto LABEL_10;
        }
        [(HDQuantitySampleSeriesDataEnumerator *)self nextDatumTime];
        if (v29 > a3) {
          goto LABEL_10;
        }
        BOOL hasFetchedAllData = self->_hasFetchedAllData;
        if (!self->_hasFetchedAllData && self->_data.__size_.__value_ < 2)
        {
          BOOL hasFetchedAllData = 0;
          break;
        }
        v21 += 24;
        if (v21 - (void)*v20 == 4080)
        {
          unint64_t v30 = (unint64_t)v20[1];
          ++v20;
          unint64_t v21 = v30;
        }
      }
    }
    BOOL v10 = 1;
    if (v14) {
      goto LABEL_8;
    }
  }
  if (self->_data.__size_.__value_ > 1)
  {
    BOOL hasFetchedAllData = 0;
    int v14 = 0;
    goto LABEL_18;
  }
  id v36 = 0;
  BOOL v15 = -[HDQuantitySampleSeriesDataEnumerator _fillValueBufferWithError:]((uint64_t)self, (uint64_t)&v36);
  id v16 = v36;
  char v17 = v16;
  if (v15)
  {

    BOOL hasFetchedAllData = self->_hasFetchedAllData;
    int v14 = hasFetchedAllData;
    goto LABEL_18;
  }
  if (!v16)
  {
    char v17 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Enumerator experienced fatal error while filling value buffer");
  }
  v31 = (NSError *)[v17 copy];
  fatalError = self->_fatalError;
  self->_fatalError = v31;

  id v33 = v17;
  v34 = v33;
  if (v33)
  {
    if (a4) {
      *a4 = v33;
    }
    else {
      _HKLogDroppedError();
    }
  }

LABEL_7:
  BOOL v10 = 0;
LABEL_8:

  return v10;
}

- (int64_t)compare:(id)a3
{
  id v5 = a3;
  if (!self->_hasFetchedData)
  {
    BOOL v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HDQuantitySampleSeriesDataEnumerator.mm", 200, @"Invalid parameter not satisfying: %@", @"_hasFetchedData" object file lineNumber description];
  }
  [(HDQuantitySampleSeriesDataEnumerator *)self nextDatumTime];
  double v7 = v6;
  [v5 nextDatumTime];
  if (v7 >= v8)
  {
    if (v7 <= v8) {
      int64_t v9 = HKCompareUUIDBytes();
    }
    else {
      int64_t v9 = 1;
    }
  }
  else
  {
    int64_t v9 = -1;
  }

  return v9;
}

- (BOOL)done
{
  if (!self->_hasFetchedData)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"HDQuantitySampleSeriesDataEnumerator.mm", 214, @"Invalid parameter not satisfying: %@", @"_hasFetchedData" object file lineNumber description];
  }
  return self->_hasFetchedAllData && self->_data.__size_.__value_ == 0;
}

- (unsigned)UUIDBytesPtr
}

- (id)description
{
  BOOL v3 = NSString;
  v19.receiver = self;
  v19.super_class = (Class)HDQuantitySampleSeriesDataEnumerator;
  v4 = [(HDQuantitySampleSeriesDataEnumerator *)&v19 description];
  transaction = self->_transaction;
  int64_t persistentID = self->_persistentID;
  int64_t dataTypeCode = self->_dataTypeCode;
  double v8 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:self->_UUIDBytes];
  int64_t sourceID = self->_sourceID;
  int64_t HFDKey = self->_HFDKey;
  double startTime = self->_startTime;
  double endTime = self->_endTime;
  [(HDQuantitySampleSeriesDataEnumerator *)self nextDatumTime];
  uint64_t v14 = v13;
  BOOL v15 = [(HDQuantitySampleSeriesDataEnumerator *)self done];
  id v16 = @"NO";
  if (v15) {
    id v16 = @"YES";
  }
  char v17 = [v3 stringWithFormat:@"<%@ transaction:%@ persistentID:%lld dataTypeCode:%ld UUID:%@ sourceID:%lld HFDKey:%lld startTime:%f endTime:%f nextDatumTime:%f done:%@>", v4, transaction, persistentID, dataTypeCode, v8, sourceID, HFDKey, *(void *)&startTime, *(void *)&endTime, v14, v16];

  return v17;
}

uint64_t __76__HDQuantitySampleSeriesDataEnumerator__fillValueBufferFromSQLiteWithError___block_invoke(uint64_t a1, double a2, double a3, double a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  double v10 = a3;
  double v11 = a2;
  float v7 = a4;
  float v9 = v7;
  if (v6)
  {
    std::deque<std::tuple<double,double,float>>::emplace_back<double &,double &,float &>((void *)(v6 + 24), &v11, &v10, &v9);
    if (*(void *)(v6 + 64) < *(void *)(v6 + 16)) {
      return 1;
    }
    *(double *)(v6 + 176) = a2;
  }
  uint64_t result = 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

- (void)_unitTesting_addToBufferTimestamp:(double)a3 value:(double)a4 duration:(float)a5 isLastDatum:(BOOL)a6
{
  double v8 = a3;
  double v7 = a4;
  float v6 = a5;
  self->_hasFetchedData = 1;
  if (a6) {
    self->_BOOL hasFetchedAllData = 1;
  }
  self->_lastFetchedDatumTime = a3;
  std::deque<std::tuple<double,double,float>>::emplace_back<double &,double &,float &>(&self->_data.__map_.__first_, &v8, &v7, &v6);
}

- (int64_t)persistentID
{
  return self->_persistentID;
}

- (int64_t)dataTypeCode
{
  return self->_dataTypeCode;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)endTime
{
  return self->_endTime;
}

- (int64_t)count
{
  return self->_count;
}

- (int64_t)sourceID
{
  return self->_sourceID;
}

- (int64_t)HFDKey
{
  return self->_HFDKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fatalError, 0);
  begin = self->_data.__map_.__begin_;
  uint64_t end = self->_data.__map_.__end_;
  self->_data.__size_.__value_ = 0;
  unint64_t v5 = (char *)end - (char *)begin;
  if ((unint64_t)((char *)end - (char *)begin) >= 0x11)
  {
    do
    {
      operator delete(*begin);
      uint64_t end = self->_data.__map_.__end_;
      begin = self->_data.__map_.__begin_ + 1;
      self->_data.__map_.__begin_ = begin;
      unint64_t v5 = (char *)end - (char *)begin;
    }
    while ((unint64_t)((char *)end - (char *)begin) > 0x10);
  }
  unint64_t v6 = v5 >> 3;
  if (v6 == 1)
  {
    unint64_t v7 = 85;
    goto LABEL_7;
  }
  if (v6 == 2)
  {
    unint64_t v7 = 170;
LABEL_7:
    self->_data.__start_ = v7;
  }
  if (begin != end)
  {
    do
    {
      double v8 = *begin++;
      operator delete(v8);
    }
    while (begin != end);
    double v10 = self->_data.__map_.__begin_;
    float v9 = self->_data.__map_.__end_;
    if (v9 != v10) {
      self->_data.__map_.__end_ = (void **)((char *)v9 + (((char *)v10 - (char *)v9 + 7) & 0xFFFFFFFFFFFFFFF8));
    }
  }
  first = self->_data.__map_.__first_;
  if (first) {
    operator delete(first);
  }

  objc_storeStrong((id *)&self->_transaction, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *((void *)self + 24) = 0;
  *((void *)self + 25) = 0;
  return self;
}

@end