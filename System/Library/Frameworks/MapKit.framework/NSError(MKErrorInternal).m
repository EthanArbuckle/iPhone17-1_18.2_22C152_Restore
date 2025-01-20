@interface NSError(MKErrorInternal)
- (id)_mapkit_error;
@end

@implementation NSError(MKErrorInternal)

- (id)_mapkit_error
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 domain];
  v3 = GEOErrorDomain();
  char v4 = [v2 isEqualToString:v3];

  if (v4)
  {
    uint64_t v5 = [a1 code];
    uint64_t v6 = 2;
    switch(v5)
    {
      case -10:
        goto LABEL_6;
      case -9:
      case -6:
      case -5:
      case -4:
        goto LABEL_7;
      case -8:
        uint64_t v6 = 4;
        goto LABEL_9;
      case -7:
        goto LABEL_9;
      case -3:
        uint64_t v6 = 3;
        goto LABEL_9;
      default:
        if ((unint64_t)(v5 + 402) >= 2) {
LABEL_7:
        }
          uint64_t v6 = 1;
        else {
LABEL_6:
        }
          uint64_t v6 = 5;
LABEL_9:
        v8 = (void *)MEMORY[0x1E4F28C58];
        v9 = MKErrorDomain;
        v13 = @"MKErrorGEOError";
        v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "code"));
        v14[0] = v10;
        v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
        id v7 = [v8 errorWithDomain:v9 code:v6 userInfo:v11];

        break;
    }
  }
  else
  {
    id v7 = a1;
  }

  return v7;
}

@end