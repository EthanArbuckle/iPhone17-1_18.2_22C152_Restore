@interface CoreCECTypesInternal
+ (id)defaultTypes;
- (CoreCECTypesInternal)init;
- (NSSet)rcProfileClasses;
- (id)stringForActivationStatus:(unint64_t)a3;
- (id)stringForDeckControlMode:(unint64_t)a3;
- (id)stringForDeckInfo:(unint64_t)a3;
- (id)stringForDeviceType:(unint64_t)a3;
- (id)stringForPlayMode:(unint64_t)a3;
- (id)stringForRequestType:(unint64_t)a3;
- (id)stringForSystemAudioStatus:(unint64_t)a3;
- (unint64_t)deckControlModeForString:(id)a3;
- (unint64_t)deckInfoForString:(id)a3;
- (unint64_t)deviceTypeForString:(id)a3;
- (unint64_t)playModeForString:(id)a3;
- (unint64_t)requestTypeForString:(id)a3;
- (unint64_t)systemAudioStatusForString:(id)a3;
- (void)dealloc;
@end

@implementation CoreCECTypesInternal

- (CoreCECTypesInternal)init
{
  v60[3] = *MEMORY[0x263EF8340];
  v58.receiver = self;
  v58.super_class = (Class)CoreCECTypesInternal;
  v2 = [(CoreCECTypesInternal *)&v58 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    v2->_rcProfileClasses = (NSSet *)objc_msgSend(v3, "initWithObjects:", v4, v5, v6, objc_opt_class(), 0);
    id v7 = objc_alloc(MEMORY[0x263EFF8C0]);
    uint64_t v8 = [NSNumber numberWithUnsignedInteger:1];
    uint64_t v9 = [NSNumber numberWithUnsignedInteger:2];
    uint64_t v10 = [NSNumber numberWithUnsignedInteger:3];
    v2->deckControlConstants = (NSArray *)objc_msgSend(v7, "initWithObjects:", v8, v9, v10, objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 4), 0);
    v2->deckControlStrings = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", @"Eject", @"SkipForward", @"SkipReverse", @"Stop", 0);
    id v56 = objc_alloc(MEMORY[0x263EFF8C0]);
    uint64_t v54 = [NSNumber numberWithUnsignedInteger:0];
    uint64_t v52 = [NSNumber numberWithUnsignedInteger:1];
    uint64_t v50 = [NSNumber numberWithUnsignedInteger:2];
    uint64_t v48 = [NSNumber numberWithUnsignedInteger:3];
    uint64_t v46 = [NSNumber numberWithUnsignedInteger:4];
    uint64_t v44 = [NSNumber numberWithUnsignedInteger:5];
    uint64_t v11 = [NSNumber numberWithUnsignedInteger:6];
    uint64_t v12 = [NSNumber numberWithUnsignedInteger:7];
    uint64_t v13 = [NSNumber numberWithUnsignedInteger:8];
    uint64_t v14 = [NSNumber numberWithUnsignedInteger:9];
    uint64_t v15 = [NSNumber numberWithUnsignedInteger:10];
    uint64_t v16 = [NSNumber numberWithUnsignedInteger:11];
    v57 = v2;
    uint64_t v17 = [NSNumber numberWithUnsignedInteger:12];
    uint64_t v18 = [NSNumber numberWithUnsignedInteger:13];
    uint64_t v19 = [NSNumber numberWithUnsignedInteger:14];
    v57->deckInfoConstants = (NSArray *)objc_msgSend(v56, "initWithObjects:", v54, v52, v50, v48, v46, v44, v11, v12, v13, v14, v15, v16, v17, v18, v19, objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 15), 0);
    v57->deckInfoStrings = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", @"FastForward", @"FastReverse", @"IndexSearchForward", @"IndexSearchReverse", @"NoMedia", @"OtherStatus", @"Play", @"PlayReverse", @"Record", @"SkipForward", @"SkipReverse", @"Slow", @"SlowReverse", @"Still", @"Stop", 0);
    id v20 = objc_alloc(MEMORY[0x263EFF8C0]);
    uint64_t v21 = [NSNumber numberWithUnsignedInteger:0];
    uint64_t v22 = [NSNumber numberWithUnsignedInteger:1];
    uint64_t v23 = [NSNumber numberWithUnsignedInteger:2];
    uint64_t v24 = [NSNumber numberWithUnsignedInteger:3];
    uint64_t v25 = [NSNumber numberWithUnsignedInteger:4];
    uint64_t v26 = [NSNumber numberWithUnsignedInteger:5];
    uint64_t v27 = [NSNumber numberWithUnsignedInteger:6];
    uint64_t v28 = [NSNumber numberWithUnsignedInteger:7];
    v57->deviceTypesConstants = (NSArray *)objc_msgSend(v20, "initWithObjects:", v21, v22, v23, v24, v25, v26, v27, v28, objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 8), 0);
    v57->deviceTypesStrings = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", @"Unknown", @"AudioSystem", @"PlaybackDevice", @"PureCECSwitch", @"RecordingDevice", @"Reserved", @"Tuner", @"TV", @"Processor", 0);
    id v55 = objc_alloc(MEMORY[0x263EFF8C0]);
    uint64_t v53 = [NSNumber numberWithUnsignedInteger:1];
    uint64_t v51 = [NSNumber numberWithUnsignedInteger:2];
    uint64_t v49 = [NSNumber numberWithUnsignedInteger:3];
    uint64_t v47 = [NSNumber numberWithUnsignedInteger:4];
    uint64_t v45 = [NSNumber numberWithUnsignedInteger:5];
    uint64_t v29 = [NSNumber numberWithUnsignedInteger:6];
    uint64_t v30 = [NSNumber numberWithUnsignedInteger:7];
    uint64_t v31 = [NSNumber numberWithUnsignedInteger:8];
    uint64_t v32 = [NSNumber numberWithUnsignedInteger:9];
    uint64_t v33 = [NSNumber numberWithUnsignedInteger:10];
    uint64_t v34 = [NSNumber numberWithUnsignedInteger:11];
    uint64_t v35 = [NSNumber numberWithUnsignedInteger:12];
    uint64_t v36 = [NSNumber numberWithUnsignedInteger:13];
    uint64_t v37 = [NSNumber numberWithUnsignedInteger:14];
    uint64_t v43 = v35;
    v2 = v57;
    v57->playModeConstants = (NSArray *)objc_msgSend(v55, "initWithObjects:", v53, v51, v49, v47, v45, v29, v30, v31, v32, v33, v34, v43, v36, v37, objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 15), 0);
    v57->playModeStrings = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", @"FastForwardMaxSpeed", @"FastForwardMediumSpeed", @"FastForwardMinSpeed", @"FastReverseMaxSpeed", @"FastReverseMediumSpeed", @"FastReverseMinSpeed", @"PlayForward", @"PlayReverse", @"PlayStill", @"SlowForwardMaxSpeed", @"SlowForwardMediumSpeed", @"SlowForwardMinSpeed", @"SlowReverseMaxSpeed", @"SlowReverseMediumSpeed", @"SlowReverseMinSpeed", 0);
    id v38 = objc_alloc(MEMORY[0x263EFF8C0]);
    uint64_t v39 = [NSNumber numberWithUnsignedInteger:0];
    uint64_t v40 = [NSNumber numberWithUnsignedInteger:1];
    uint64_t v41 = [NSNumber numberWithUnsignedInteger:2];
    v57->requestTypeConstants = (NSArray *)objc_msgSend(v38, "initWithObjects:", v39, v40, v41, objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), 0);
    v57->requestTypeStrings = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", @"Unknown", @"Off", @"On", @"Once", 0);
    v57->systemAudioModeStatusConstants = (NSArray *)[&unk_26FEDA8E8 copy];
    v60[0] = @"Unknown";
    v60[1] = @"Off";
    v60[2] = @"On";
    v57->systemAudioModeStatusStrings = (NSArray *)objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v60, 3), "copy");
    v57->activationStatusConstants = (NSArray *)[&unk_26FEDA900 copy];
    v59[0] = @"Inactive";
    v59[1] = @"Active";
    v57->activationStatusStrings = (NSArray *)objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v59, 2), "copy");
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CoreCECTypesInternal;
  [(CoreCECTypesInternal *)&v3 dealloc];
}

+ (id)defaultTypes
{
  if (!defaultTypes_gTypes) {
    defaultTypes_gTypes = objc_alloc_init(CoreCECTypesInternal);
  }
  objc_sync_exit(a1);
  return (id)defaultTypes_gTypes;
}

- (id)stringForDeckControlMode:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  deckControlConstants = self->deckControlConstants;
  id result = (id)[(NSArray *)deckControlConstants countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (result)
  {
    id v7 = (char *)result;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = &v7[(void)v8];
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(deckControlConstants);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * (void)v10) unsignedIntegerValue] == a3) {
          return [(NSArray *)self->deckControlStrings objectAtIndex:&v10[(void)v8]];
        }
        ++v10;
      }
      while (v7 != v10);
      id result = (id)[(NSArray *)deckControlConstants countByEnumeratingWithState:&v12 objects:v16 count:16];
      id v7 = (char *)result;
      uint64_t v8 = v11;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (unint64_t)deckControlModeForString:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  deckControlStrings = self->deckControlStrings;
  unint64_t result = [(NSArray *)deckControlStrings countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (result)
  {
    unint64_t v7 = result;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = v8 + v7;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(deckControlStrings);
        }
        if (![*(id *)(*((void *)&v12 + 1) + 8 * v10) compare:a3 options:1]) {
          return objc_msgSend(-[NSArray objectAtIndex:](self->deckControlConstants, "objectAtIndex:", v8 + v10), "unsignedIntegerValue");
        }
        ++v10;
      }
      while (v7 != v10);
      unint64_t result = [(NSArray *)deckControlStrings countByEnumeratingWithState:&v12 objects:v16 count:16];
      unint64_t v7 = result;
      uint64_t v8 = v11;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (id)stringForDeckInfo:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  deckInfoConstants = self->deckInfoConstants;
  id result = (id)[(NSArray *)deckInfoConstants countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (result)
  {
    unint64_t v7 = (char *)result;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = &v7[(void)v8];
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(deckInfoConstants);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * (void)v10) unsignedIntegerValue] == a3) {
          return [(NSArray *)self->deckInfoStrings objectAtIndex:&v10[(void)v8]];
        }
        ++v10;
      }
      while (v7 != v10);
      id result = (id)[(NSArray *)deckInfoConstants countByEnumeratingWithState:&v12 objects:v16 count:16];
      unint64_t v7 = (char *)result;
      uint64_t v8 = v11;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (unint64_t)deckInfoForString:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  deckInfoStrings = self->deckInfoStrings;
  unint64_t result = [(NSArray *)deckInfoStrings countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (result)
  {
    unint64_t v7 = result;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = v8 + v7;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(deckInfoStrings);
        }
        if (![*(id *)(*((void *)&v12 + 1) + 8 * v10) compare:a3 options:1]) {
          return objc_msgSend(-[NSArray objectAtIndex:](self->deckInfoConstants, "objectAtIndex:", v8 + v10), "unsignedIntegerValue");
        }
        ++v10;
      }
      while (v7 != v10);
      unint64_t result = [(NSArray *)deckInfoStrings countByEnumeratingWithState:&v12 objects:v16 count:16];
      unint64_t v7 = result;
      uint64_t v8 = v11;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (id)stringForPlayMode:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  playModeConstants = self->playModeConstants;
  id result = (id)[(NSArray *)playModeConstants countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (result)
  {
    unint64_t v7 = (char *)result;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = &v7[(void)v8];
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(playModeConstants);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * (void)v10) unsignedIntegerValue] == a3) {
          return [(NSArray *)self->playModeStrings objectAtIndex:&v10[(void)v8]];
        }
        ++v10;
      }
      while (v7 != v10);
      id result = (id)[(NSArray *)playModeConstants countByEnumeratingWithState:&v12 objects:v16 count:16];
      unint64_t v7 = (char *)result;
      uint64_t v8 = v11;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (unint64_t)playModeForString:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  playModeStrings = self->playModeStrings;
  unint64_t result = [(NSArray *)playModeStrings countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (result)
  {
    unint64_t v7 = result;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = v8 + v7;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(playModeStrings);
        }
        if (![*(id *)(*((void *)&v12 + 1) + 8 * v10) compare:a3 options:1]) {
          return objc_msgSend(-[NSArray objectAtIndex:](self->playModeConstants, "objectAtIndex:", v8 + v10), "unsignedIntegerValue");
        }
        ++v10;
      }
      while (v7 != v10);
      unint64_t result = [(NSArray *)playModeStrings countByEnumeratingWithState:&v12 objects:v16 count:16];
      unint64_t v7 = result;
      uint64_t v8 = v11;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (id)stringForDeviceType:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  deviceTypesConstants = self->deviceTypesConstants;
  id result = (id)[(NSArray *)deviceTypesConstants countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (result)
  {
    unint64_t v7 = (char *)result;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = &v7[(void)v8];
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(deviceTypesConstants);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * (void)v10) unsignedIntegerValue] == a3) {
          return [(NSArray *)self->deviceTypesStrings objectAtIndex:&v10[(void)v8]];
        }
        ++v10;
      }
      while (v7 != v10);
      id result = (id)[(NSArray *)deviceTypesConstants countByEnumeratingWithState:&v12 objects:v16 count:16];
      unint64_t v7 = (char *)result;
      uint64_t v8 = v11;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (unint64_t)deviceTypeForString:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  deviceTypesStrings = self->deviceTypesStrings;
  unint64_t result = [(NSArray *)deviceTypesStrings countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (result)
  {
    unint64_t v7 = result;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = v8 + v7;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(deviceTypesStrings);
        }
        if (![*(id *)(*((void *)&v12 + 1) + 8 * v10) compare:a3 options:1]) {
          return objc_msgSend(-[NSArray objectAtIndex:](self->deviceTypesConstants, "objectAtIndex:", v8 + v10), "unsignedIntegerValue");
        }
        ++v10;
      }
      while (v7 != v10);
      unint64_t result = [(NSArray *)deviceTypesStrings countByEnumeratingWithState:&v12 objects:v16 count:16];
      unint64_t v7 = result;
      uint64_t v8 = v11;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (id)stringForRequestType:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  requestTypeConstants = self->requestTypeConstants;
  id result = (id)[(NSArray *)requestTypeConstants countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (result)
  {
    unint64_t v7 = (char *)result;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = &v7[(void)v8];
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(requestTypeConstants);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * (void)v10) unsignedIntegerValue] == a3) {
          return [(NSArray *)self->requestTypeStrings objectAtIndex:&v10[(void)v8]];
        }
        ++v10;
      }
      while (v7 != v10);
      id result = (id)[(NSArray *)requestTypeConstants countByEnumeratingWithState:&v12 objects:v16 count:16];
      unint64_t v7 = (char *)result;
      uint64_t v8 = v11;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (unint64_t)requestTypeForString:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  requestTypeStrings = self->requestTypeStrings;
  unint64_t result = [(NSArray *)requestTypeStrings countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (result)
  {
    unint64_t v7 = result;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = v8 + v7;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(requestTypeStrings);
        }
        if (![*(id *)(*((void *)&v12 + 1) + 8 * v10) compare:a3 options:1]) {
          return objc_msgSend(-[NSArray objectAtIndex:](self->requestTypeConstants, "objectAtIndex:", v8 + v10), "unsignedIntegerValue");
        }
        ++v10;
      }
      while (v7 != v10);
      unint64_t result = [(NSArray *)requestTypeStrings countByEnumeratingWithState:&v12 objects:v16 count:16];
      unint64_t v7 = result;
      uint64_t v8 = v11;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (id)stringForSystemAudioStatus:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  systemAudioModeStatusConstants = self->systemAudioModeStatusConstants;
  id result = (id)[(NSArray *)systemAudioModeStatusConstants countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (result)
  {
    unint64_t v7 = (char *)result;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = &v7[(void)v8];
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(systemAudioModeStatusConstants);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * (void)v10) unsignedIntegerValue] == a3) {
          return [(NSArray *)self->systemAudioModeStatusStrings objectAtIndex:&v10[(void)v8]];
        }
        ++v10;
      }
      while (v7 != v10);
      id result = (id)[(NSArray *)systemAudioModeStatusConstants countByEnumeratingWithState:&v12 objects:v16 count:16];
      unint64_t v7 = (char *)result;
      uint64_t v8 = v11;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (unint64_t)systemAudioStatusForString:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  systemAudioModeStatusStrings = self->systemAudioModeStatusStrings;
  unint64_t result = [(NSArray *)systemAudioModeStatusStrings countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (result)
  {
    unint64_t v7 = result;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = v8 + v7;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(systemAudioModeStatusStrings);
        }
        if (![*(id *)(*((void *)&v12 + 1) + 8 * v10) compare:a3 options:1]) {
          return objc_msgSend(-[NSArray objectAtIndex:](self->systemAudioModeStatusConstants, "objectAtIndex:", v8 + v10), "unsignedIntegerValue");
        }
        ++v10;
      }
      while (v7 != v10);
      unint64_t result = [(NSArray *)systemAudioModeStatusStrings countByEnumeratingWithState:&v12 objects:v16 count:16];
      unint64_t v7 = result;
      uint64_t v8 = v11;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (id)stringForActivationStatus:(unint64_t)a3
{
  objc_super v3 = (id *)kCoreCECActivationStatusStringInactive;
  uint64_t v4 = &kCoreCECActivationStatusStringActive;
  if (a3 != 1) {
    uint64_t v4 = kCoreCECGenericStringUnknown;
  }
  if (a3) {
    objc_super v3 = (id *)v4;
  }
  return *v3;
}

- (NSSet)rcProfileClasses
{
  return self->_rcProfileClasses;
}

@end