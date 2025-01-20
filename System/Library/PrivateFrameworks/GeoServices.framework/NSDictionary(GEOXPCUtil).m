@interface NSDictionary(GEOXPCUtil)
+ (id)_geo_dictionaryFromXPCObject:()GEOXPCUtil;
+ (id)_geo_replyDictionaryForError:()GEOXPCUtil key:;
- (id)_geo_errorForKey:()GEOXPCUtil;
- (uint64_t)_geo_newXPCObject;
@end

@implementation NSDictionary(GEOXPCUtil)

+ (id)_geo_dictionaryFromXPCObject:()GEOXPCUtil
{
  uint64_t v0 = _CFXPCCreateCFObjectFromXPCObject();
  if (v0)
  {
    v1 = (void *)v0;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v2 = _NSDictionarySafeDecodingCopy(v1);
    }
    else {
      id v2 = 0;
    }
    CFRelease(v1);
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (id)_geo_errorForKey:()GEOXPCUtil
{
  v1 = objc_msgSend(a1, "objectForKey:");
  id v2 = v1;
  if (v1)
  {
    v3 = _geo_NSErrorFromDictionaryRepresentationCopy(v1);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (uint64_t)_geo_newXPCObject
{
  id v1 = _NSDictionarySafeEncodingCopy(a1, 0);
  if (v1) {
    uint64_t v2 = _CFXPCCreateXPCObjectFromCFObject();
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

+ (id)_geo_replyDictionaryForError:()GEOXPCUtil key:
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5
    && [v6 length]
    && (_geo_NSErrorDictionaryRepresentationCopy(v5), (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = (void *)v8;
    v10 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v8, v7, 0);
  }
  else
  {
    v10 = [MEMORY[0x1E4F1C9E8] dictionary];
  }

  return v10;
}

@end