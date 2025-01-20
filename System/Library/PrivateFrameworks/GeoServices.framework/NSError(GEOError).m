@interface NSError(GEOError)
+ (id)GEOErrorWithCode:()GEOError;
+ (id)GEOErrorWithCode:()GEOError reason:;
+ (id)GEOErrorWithCode:()GEOError reason:underlyingError:;
+ (id)GEOErrorWithCode:()GEOError reason:userInfo:;
+ (id)geo_insufficientFilesystemCapacityWithBytesNeeded:()GEOError bytesAvailable:;
+ (uint64_t)GEOErrorWithCode:()GEOError userInfo:;
- (uint64_t)_geo_isNetworkError;
@end

@implementation NSError(GEOError)

+ (id)GEOErrorWithCode:()GEOError
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = *MEMORY[0x1E4F1D138];
  v5 = GEOStringForError(a3);
  v10[0] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = [a1 errorWithDomain:@"GEOErrorDomain" code:a3 userInfo:v6];

  return v7;
}

+ (id)GEOErrorWithCode:()GEOError reason:
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    uint64_t v11 = *MEMORY[0x1E4F1D138];
    v12[0] = v6;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    uint64_t v9 = [a1 errorWithDomain:@"GEOErrorDomain" code:a3 userInfo:v8];
  }
  else
  {
    uint64_t v9 = [a1 errorWithDomain:@"GEOErrorDomain" code:a3 userInfo:0];
  }

  return v9;
}

+ (uint64_t)GEOErrorWithCode:()GEOError userInfo:
{
  return [a1 errorWithDomain:@"GEOErrorDomain" code:a3 userInfo:a4];
}

+ (id)GEOErrorWithCode:()GEOError reason:underlyingError:
{
  v8 = (void *)MEMORY[0x1E4F1CA60];
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [v8 dictionaryWithCapacity:2];
  [v11 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F1D138]];

  [v11 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  v12 = [a1 errorWithDomain:@"GEOErrorDomain" code:a3 userInfo:v11];

  return v12;
}

+ (id)GEOErrorWithCode:()GEOError reason:userInfo:
{
  id v8 = a5;
  if (a4)
  {
    id v9 = a4;
    id v10 = (void *)[v8 mutableCopy];
    uint64_t v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    v13 = v12;

    [v13 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F1D138]];
    uint64_t v14 = [v13 copy];

    id v8 = (id)v14;
  }
  v15 = [a1 errorWithDomain:@"GEOErrorDomain" code:a3 userInfo:v8];

  return v15;
}

+ (id)geo_insufficientFilesystemCapacityWithBytesNeeded:()GEOError bytesAvailable:
{
  void v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"CapacityAvailable";
  id v6 = [NSNumber numberWithUnsignedLong:a4];
  v11[1] = @"CapacityNeeded";
  v12[0] = v6;
  v7 = [NSNumber numberWithUnsignedLong:a3];
  v12[1] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  id v9 = [a1 GEOErrorWithCode:-25 userInfo:v8];

  return v9;
}

- (uint64_t)_geo_isNetworkError
{
  v2 = [a1 domain];
  int v3 = [v2 isEqual:*MEMORY[0x1E4F18F50]];

  if (v3)
  {
    uint64_t v4 = [a1 code];
    uint64_t result = 1;
    if (v4 > 0)
    {
      if (v4 != 1 && v4 != 302 && v4 != 310) {
        goto LABEL_18;
      }
    }
    else
    {
      unint64_t v6 = v4 + 1020;
      if (v6 > 0x13 || ((1 << v6) & 0xBC807) == 0)
      {
LABEL_18:
        id v10 = &GeoServicesConfig_ExtraNetworkErrorCodesDomainCFNetwork;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v7 = [a1 domain];
    int v8 = [v7 isEqual:*MEMORY[0x1E4F289A0]];

    if (v8)
    {
      uint64_t v9 = [a1 code];
      if ((unint64_t)(v9 + 1020) >= 0x14 || ((0xBC807u >> (v9 - 4)) & 1) == 0)
      {
        id v10 = &GeoServicesConfig_ExtraNetworkErrorCodesDomainNSURL;
LABEL_10:
        uint64_t v11 = _getValue(*v10, v10[1], 1, 0, 0, 0);
        id v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "code"));
        uint64_t v13 = [v11 containsObject:v12];

        return v13;
      }
      return 1;
    }
    else
    {
      uint64_t v14 = [a1 domain];
      int v15 = [v14 isEqual:@"GEOErrorDomain"];

      if (v15)
      {
        unint64_t v16 = [a1 code];
        if (v16 <= 0xFFFFFFFFFFFFFFECLL) {
          return 0;
        }
        else {
          return (0x40401u >> (v16 + 19)) & 1;
        }
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

@end