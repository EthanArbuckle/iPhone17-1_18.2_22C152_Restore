@interface EKUIMailUtilities
+ (id)_stringForIsolatedAtomPresentationOption:(unint64_t)a3;
+ (id)atomPresentationOptionsAsString:(unint64_t)a3;
@end

@implementation EKUIMailUtilities

+ (id)atomPresentationOptionsAsString:(unint64_t)a3
{
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"{"];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __53__EKUIMailUtilities_atomPresentationOptionsAsString___block_invoke;
  v13 = &unk_1E6089A58;
  id v15 = a1;
  id v6 = v5;
  id v14 = v6;
  v7 = (void (**)(void *, unint64_t, void))_Block_copy(&v10);
  v7[2](v7, a3, 0);
  v7[2](v7, a3, 1);
  v7[2](v7, a3, 2);
  v7[2](v7, a3, 4);
  v7[2](v7, a3, 8);
  v7[2](v7, a3, 16);
  v7[2](v7, a3, 32);
  v7[2](v7, a3, 64);
  v7[2](v7, a3, 128);
  v7[2](v7, a3, 256);
  v7[2](v7, a3, 512);
  v7[2](v7, a3, 1024);
  v7[2](v7, a3, 2048);
  v7[2](v7, a3, 4096);
  v7[2](v7, a3, 0x2000);
  v7[2](v7, a3, 0x4000);
  v7[2](v7, a3, 0x8000);
  v7[2](v7, a3, 0x10000);
  v7[2](v7, a3, 0x20000);
  v7[2](v7, a3, 0x100000);
  objc_msgSend(v6, "appendString:", @"}", v10, v11, v12, v13);
  id v8 = v6;

  return v8;
}

void __53__EKUIMailUtilities_atomPresentationOptionsAsString___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v4 = a2 == 0;
  if (a3) {
    BOOL v4 = (a3 & ~a2) == 0;
  }
  if (v4)
  {
    id v6 = [(id)objc_opt_class() _stringForIsolatedAtomPresentationOption:a3];
    [*(id *)(a1 + 32) appendFormat:@"(%@)", v6];
  }
}

+ (id)_stringForIsolatedAtomPresentationOption:(unint64_t)a3
{
  id result = 0;
  if ((uint64_t)a3 > 511)
  {
    BOOL v4 = @"FaceTimeUnresolved";
    v5 = @"Invalid Address";
    id v6 = @"Static Identity Verified";
    if (a3 != 0x100000) {
      id v6 = 0;
    }
    if (a3 != 0x20000) {
      v5 = v6;
    }
    if (a3 != 0x10000) {
      BOOL v4 = v5;
    }
    v7 = @"DisplayBackgroundOnHover";
    id v8 = @"IsFaceTimeReachable";
    if (a3 != 0x8000) {
      id v8 = 0;
    }
    if (a3 != 0x4000) {
      v7 = v8;
    }
    if ((uint64_t)a3 < 0x10000) {
      BOOL v4 = v7;
    }
    v9 = @"UnavailableIcon";
    uint64_t v10 = @"UnknownCircleIcon";
    uint64_t v11 = @"UnknownCircleIcon";
    if (a3 != 0x2000) {
      uint64_t v11 = 0;
    }
    if (a3 != 4096) {
      uint64_t v10 = v11;
    }
    if (a3 != 2048) {
      v9 = v10;
    }
    v12 = @"PendingLeading";
    v13 = @"AvailableIcon";
    if (a3 != 1024) {
      v13 = 0;
    }
    if (a3 != 512) {
      v12 = v13;
    }
    if ((uint64_t)a3 <= 2047) {
      v9 = v12;
    }
    if ((uint64_t)a3 < 0x4000) {
      return v9;
    }
    else {
      return v4;
    }
  }
  else if ((uint64_t)a3 > 15)
  {
    id v14 = @"InsecureIcon";
    id v15 = @"SecureIcon";
    v16 = @"UnverifiedIcon";
    if (a3 != 256) {
      v16 = 0;
    }
    if (a3 != 128) {
      id v15 = v16;
    }
    if (a3 != 64) {
      id v14 = v15;
    }
    v17 = @"VIPIcon";
    v18 = @"SignedIcon";
    if (a3 != 32) {
      v18 = 0;
    }
    if (a3 != 16) {
      v17 = v18;
    }
    if ((uint64_t)a3 <= 63) {
      return v17;
    }
    else {
      return v14;
    }
  }
  else
  {
    switch(a3)
    {
      case 0uLL:
        id result = @"None";
        break;
      case 1uLL:
        id result = @"FailureColor";
        break;
      case 2uLL:
        id result = @"IsSMS";
        break;
      case 4uLL:
        id result = @"Pending|PendingTrailing";
        break;
      case 8uLL:
        id result = @"Disabled";
        break;
      default:
        return result;
    }
  }
  return result;
}

@end